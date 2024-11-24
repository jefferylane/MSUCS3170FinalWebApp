require 'rails_helper'

RSpec.describe ThreeDFilesController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:file) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.stl'), 'model/stl') }

  before do
    sign_in user
  end
  
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      three_d_file = create(:three_d_file, user: user)
      get :show, params: { id: three_d_file.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new ThreeDFile' do
      expect {
        post :create, params: { 
          three_d_file: { 
            name: 'New File',
            file: file 
          } 
        }
      }.to change(ThreeDFile, :count).by(1)
    end
  end

  describe 'PATCH #update' do
    it 'updates the requested three_d_file' do
      # Create three_d_file with required associations
      three_d_file = create(:three_d_file, user: user, file: file)
      
      patch :update, params: { 
        id: three_d_file.id, 
        three_d_file: { name: 'Updated File' } 
      }
      
      three_d_file.reload
      expect(three_d_file.name).to eq('Updated File')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested three_d_file' do
      # Create three_d_file with required associations
      three_d_file = create(:three_d_file, user: user, file: file)
      
      expect {
        delete :destroy, params: { id: three_d_file.id }
      }.to change(ThreeDFile, :count).by(-1)
    end
  end
end