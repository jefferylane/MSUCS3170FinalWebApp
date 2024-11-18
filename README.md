# How to make this thing work

Ok, so this thing was so annoying to get working. Everytime i would attempt
to add a new rails app, i would get an error saying that git wasn't found.
I actually had to update the original Dockerfile's RUN app-get install thingy 
to include git (Just added it in between yarn and build-essential).

After that, I rebuilt the image and used that to make a new container. Finally!
"rails new ." would actually work and i was able to get this thing crackin'.

SPECIFICATIONS: Check Gemfile.lock

