FROM rocker/ropensci

MAINTAINER Brian O'Meara <omeara.brian@gmail.com>

ADD VERSION .

RUN apt-get update

RUN apt-get install -y apt-utils


RUN echo 'options(repos = c(CRAN="https://cran.rstudio.com"))' > ~/.Rprofile

RUN apt-get install -y software-properties-common

RUN apt-get -y install python-dev

RUN apt-get -y install libcgal-dev libglu1-mesa-dev libglu1-mesa-dev libx11-dev

RUN apt-get update

RUN apt-get -y install x11-common

RUN apt-get install -y libmpfr-dev libmpfr-doc

RUN apt-get install -y curl

RUN apt-get install libgl1-mesa-dev

RUN apt-get install ed

RUN Rscript -e "install.packages('ctv')"

RUN Rscript -e "ctv::install.views('Phylogenetics')"

RUN Rscript -e "install.packages('diagram')"

RUN Rscript -e "devtools::install_github('bomeara/phrapl')"

RUN Rscript -e "devtools::install_github( 'heibl/ips')"

RUN Rscript -e 'source("https://bioconductor.org/biocLite.R")'

RUN Rscript -e "install.packages('yearn')"

RUN mkdir /usr/local/pathd8download && \
wget http://www2.math.su.se/PATHd8/PATHd8.zip -O /usr/local/pathd8download/PATHd8.zip && \
cd /usr/local/pathd8download && \
unzip /usr/local/pathd8download/PATHd8.zip && \
cc PATHd8.c -O3 -lm -o PATHd8 && \
cp PATHd8 /usr/local/bin/PATHd8


RUN useradd --system -s /sbin/nologin linuxbrewuser

RUN mkdir /home/linuxbrewuser

USER linuxbrewuser

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

RUN test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
RUN test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
RUN test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
RUN echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

RUN brew tap homebrew/science

RUN brew tap jonchang/biology

RUN brew install -v treepl

RUN brew install r8s

RUN brew install raxml

RUN brew install revbayes

RUN brew install phylip

RUN brew install phyutility

RUN brew install phlawd

USER root
