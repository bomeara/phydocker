# phydocker
Dockerfile for phylogenetics in R

`docker build -t bomeara/phydocker .`

`docker push bomeara/phydocker`

As a user, install docker. Then in a command window or within docker:

`sudo docker run -d -p 8787:8787 bomeara/phydocker`

Follow docker instructions for linking to a local directory.
