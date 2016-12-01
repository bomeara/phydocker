FROM rocker/ropensci

MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

RUN apt-get update

RUN apt-get install -y apt-utils


RUN echo 'options(repos = c(CRAN="https://cran.rstudio.com"))' > ~/.Rprofile

RUN apt-get install -y software-properties-common python-software-properties

RUN apt-get -y install python-dev

RUN apt-get -y install libcgal-dev libglu1-mesa-dev libglu1-mesa-dev libx11-dev

RUN apt-get update

RUN apt-get -y install x11-common

RUN apt-get install -y libmpfr-dev libmpfr-doc

RUN apt-get install libgl1-mesa-dev

RUN apt-get install ed

RUN Rscript -e "install.packages('ctv')"

RUN Rscript -e "ctv::install.views('Phylogenetics')"

RUN Rscript -e "install.packages('diagram')"

RUN Rscript -e "devtools::install_github(c('bomeara/phrapl', 'phylotastic/datelife', 'heibl/ips'))"

RUN mkdir /usr/local/pathd8download && \
wget http://www2.math.su.se/PATHd8/PATHd8.zip -O /usr/local/pathd8download/PATHd8.zip && \
cd /usr/local/pathd8download && \
unzip /usr/local/pathd8download/PATHd8.zip && \
cc PATHd8.c -O3 -lm -o PATHd8 && \
cp PATHd8 /usr/local/bin/PATHd8
