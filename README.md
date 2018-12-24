# phydocker

For most users you first want to install docker. Then you want to do the following commands:

`docker pull bomeara/phydocker`

Then in a command window or within docker:

`docker run -v ~/Desktop:/data -p 8787:8787 bomeara/phydocker`

Then you can go to http://localhost:8787 to run it; log in as `rstudio` with password `rstudio`. Replace `~/Desktop` with the full path to the folder where you have files (i.e., `/Users/jsmith/Documents/Chapter1`). You can keep it `~/Desktop`, it'll then have your desktop present as the `/data` directory in Docker (i.e., in R, you can do `save(ape::rcoal(10), file="/data/random.tre")` and it'll save a random tree to your desktop. When you're done, you can kill the process with control+C.

If you want to run on the command line instead (i.e., from inside Terminal on a Mac) you can do

`docker run -it -v ~/Desktop:/data bomeara/phydocker /bin/bash`

You can then use programs like treePL and phlawd without having to go through installation.  `exit` command when done.

For building this from scratch (not most users)

`docker build -t bomeara/phydocker .`

Or if you want to not use the cached images:

`docker build --no-cache -t bomeara/phydocker .`

To push to docker hub

`docker push bomeara/phydocker`

However, it is currently set to automatically build with pushes to github.
