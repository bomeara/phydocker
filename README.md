# phydocker

For most users you first want to install docker. Then you want to do the following commands:

`docker pull bomeara/phydocker`

Then in a command window or within docker:

`docker run -it --name phydocker -v /Path/To/My/Folder:/data -p 8787:8787 bomeara/phydocker`

Then you can go to http://localhost:8787 to run it; log in as `rstudio` with password `rstudio`. Replace `/Path/To/My/Folder` with the full path to the folder where you have files (i.e., `/Users/jsmith/Desktop/`)

If you want to run on the command line instead (i.e., from inside Terminal on a Mac) you can do

`docker run -it --name phydocker -v /Path/To/My/Folder:/data bomeara/phydocker /bin/bash`

You can then use programs like treePL and phlawd without having to go through installation.

For building this from scratch (not most users)

`docker build -t bomeara/phydocker .`

Or if you want to not use the cached images:

`docker build --no-cache -t bomeara/phydocker .`

`docker push bomeara/phydocker`
