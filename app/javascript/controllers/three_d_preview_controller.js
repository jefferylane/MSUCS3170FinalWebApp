import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="three-d-preview"
export default class extends Controller {
  static values = {
    url: String,
    containerId: String
  }

  connect() {
    // Wait for Three.js to be available
    if (typeof THREE === 'undefined') {
      this.waitForThree();
    } else {
      this.initialize();
    }
  }

  waitForThree() {
    const checkThree = setInterval(() => {
      if (typeof THREE !== 'undefined') {
        clearInterval(checkThree);
        this.initialize();
      }
    }, 100);
  }

  initialize() {
    try {
      this.previews = {};
      this.createPreview(this.containerIdValue, this.urlValue);
      this.startAnimation();
    } catch (error) {
      console.error('Failed to initialize preview:', error);
    }
  }

  disconnect() {
    if (this.animationFrame) {
      cancelAnimationFrame(this.animationFrame);
    }
    if (this.previews[this.containerIdValue]) {
      this.previews[this.containerIdValue].renderer.dispose();
      delete this.previews[this.containerIdValue];
    }
  }

  createPreview(containerId, modelUrl) {
    const container = document.getElementById(containerId);
    if (!container) {
      console.error('Container not found:', containerId);
      return;
    }

    const width = container.clientWidth;
    const height = container.clientHeight;

    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0xf0f0f0);

    const camera = new THREE.PerspectiveCamera(75, width/height, 0.1, 1000);
    camera.position.z = 5;

    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(width, height);
    container.appendChild(renderer.domElement);

    const ambientLight = new THREE.AmbientLight(0x404040);
    const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
    directionalLight.position.set(0, 1, 0);
    scene.add(ambientLight, directionalLight);

    const loader = new THREE.GLTFLoader();
    loader.load(
      modelUrl, 
      (gltf) => {
        scene.add(gltf.scene);
        
        const box = new THREE.Box3().setFromObject(gltf.scene);
        const center = box.getCenter(new THREE.Vector3());
        gltf.scene.position.x += -center.x;
        gltf.scene.position.y += -center.y;
        gltf.scene.position.z += -center.z;
        
        this.previews[containerId] = {
          scene: scene,
          camera: camera,
          renderer: renderer,
          model: gltf.scene
        };
      },
      (progress) => {
        console.log('Loading progress:', (progress.loaded / progress.total * 100) + '%');
      },
      (error) => {
        console.error('Error loading model:', error);
      }
    );
  }

  startAnimation() {
    const animate = () => {
      this.animationFrame = requestAnimationFrame(animate);
      
      Object.values(this.previews).forEach(preview => {
        if (preview.model) {
          preview.model.rotation.y += 0.01;
          preview.renderer.render(preview.scene, preview.camera);
        }
      });
    };
    animate();
  }
}
