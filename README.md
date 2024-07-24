# Automated cell type annotation

The script requires GPUs on your host system.


## Run script using container environment

We provide a container environment with all required software dependencies. Pre-build Docker images are available [here](https://hub.docker.com/repository/docker/matmu/cell_type_annotation).

**Note:** If you encounter any GPU related issues with the commands below, make sure that GPU support for container applications is set up correctly on your host system.


### Singularity

```bash
singularity run --nv --pwd /mnt --bind /path/on/host:/mnt docker://matmu/cell_type_annotation:latest
```


### Docker

```bash
docker run --rm -it --gpus=all -v /path/on/host:/mnt -w /mnt matmu/cell_type_annotation:latest
```


