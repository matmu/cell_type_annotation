# Automated cell type annotation

This repository includes a receipee for a Docker image containing the complete software environment required for automatically annotating plaque scRNA-seq datasets using our atlas. 

Pre-build Docker images are available [here](https://hub.docker.com/repository/docker/matmu/cell_type_annotation). Scripts required for automated cell type annotation can be found [here](https://github.com/kotr98/plaque-atlas-mapping).

For further details on our atlas, please refer to our preprint: https://www.biorxiv.org/content/10.1101/2024.09.11.612431v1⁠. 

**Important:** The script requires GPUs on your host system.


## Run script using container environment

We provide a container environment with all required software dependencies.

**Note:** If you encounter any GPU related issues with the commands below, make sure that GPU support for container applications is set up correctly on your host system.


### Singularity

```bash
singularity run --nv --pwd /mnt --bind /path/on/host:/mnt docker://matmu/cell_type_annotation:latest bash
```

### Docker

```bash
docker run --rm -it --gpus=all -v /path/on/host:/mnt -w /mnt matmu/cell_type_annotation:latest
```


