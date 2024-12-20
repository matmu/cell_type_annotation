FROM r-base:4.4.1
MAINTAINER Matthias Munz <matthias.munz@roche.com>

# General system dependencies
RUN apt-get -qq update && \
        apt-get -y install \
        python3-dev \
        python3 \
        python3-pip \
        python3-setuptools \
        libcurl4-openssl-dev \
        libssl-dev \
        build-essential \
        nano && \
        apt-get -qq clean

# Ensure python3 is accessible as python
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Python packages
RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED
RUN pip3 install \
    gdown==5.2.0 \
    scanpy==1.9.6 \
    scarches==0.5.10 \
    anndata==0.10.3 \
    numpy==1.26.4 \
    pandas==2.2.1 \
    matplotlib==3.8.2 \
    scipy==1.11.4 \
    rpy2==3.5.14 \
    anndata2ri==1.3.1

# Set CA certificates path for Python requests
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# R packages
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install(version = '3.20')"
RUN R -e "BiocManager::install('scran', version = '1.34.0')"
