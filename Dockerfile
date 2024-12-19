# Dockerfile
FROM r-base:4.4.1

MAINTAINER Matthias Munz <matthias.munz@roche.com>

# General system dependencies
RUN apt-get -qq update && \
        apt-get -y -qq install \
        python3-dev \
        python3 \
        python3-pip \
        libcurl4-openssl-dev \
        libssl-dev \
        build-essential \
        nano && \
        apt-get -qq clean

# Manually install distutils
RUN apt-get -qq update && \
        apt-get -y install wget && \
        wget http://ftp.debian.org/debian/pool/main/p/python3-defaults/python3-distutils_3.12.0-1_all.deb && \
        dpkg -i python3-distutils_3.12.0-1_all.deb && \
        rm python3-distutils_3.12.0-1_all.deb

# Python packages
RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED
RUN pip3 install \
    gdown==4.7.1 \
    scanpy==1.9.6 \
    scarches==0.5.10 \
    anndata==0.10.3 \
    numpy==1.23.4 \
    pandas==2.2.1 \
    matplotlib==3.8.2 \
    scipy==1.11.4 \
    rpy2==3.5.14 \
    anndata2ri==1.3.1

# R packages
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('scran', version = '1.30.0')"
