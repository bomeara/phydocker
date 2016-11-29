FROM rocker/ropensci

MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

RUN R install2.R --error ctv

RUN Rscript -e "ctv::install.views('Phylogenetics')"

RUN Rscript -e "devtools::install_github(c('thej022214/hisse', 'thej022214/OUwie', 'bomeara/phrapl', 'phylotastic/datelife', 'thej022214/corHMM', 'heibl/ips'))"


RUN mkdir /usr/local/pathd8download && \
wget http://www2.math.su.se/PATHd8/PATHd8.zip -O /usr/local/pathd8download/PATHd8.zip && \
cd /usr/local/pathd8download && \
unzip /usr/local/pathd8download/PATHd8.zip && \
cc PATHd8.c -O3 -lm -o PATHd8 && \
cp PATHd8 /usr/local/bin/PATHd8
