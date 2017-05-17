# phydocker
Dockerfile for phylogenetics in R

`docker build -t bomeara/phydocker .`

`docker push bomeara/phydocker`

As a user, install docker. Then in a command window or within docker:

`docker run -it --name phydocker -v /Path/To/My/Folder:/data -p 8787:8787 bomeara/phydocker`

Then you can go to http://localhost:8787 to run it; log in as `rstudio` with password `rstudio`.

Replace `/Path/To/My/Folder` with the full path to the folder 
