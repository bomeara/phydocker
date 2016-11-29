FROM rocker/ropensci


MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

RUN R install2.R --error ctv

RUN Rscript -e "ctv::install.views("Phylogenetics")
