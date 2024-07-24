FROM r-base:4.4.1

MAINTAINER Matthias Munz <matthias.munz@roche.com>


# General
RUN apt-get -qq update && \
        apt-get -y -qq install python3-dev python3 python3-pip libcurl4-openssl-dev libssl-dev build-essential && \
        apt-get -qq clean


# Python packages
RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED
RUN pip3 install scanpy scarches anndata numpy pandas matplotlib scipy rpy2 anndata2ri


# R packages
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('scran')"
