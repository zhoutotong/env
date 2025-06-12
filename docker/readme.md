# Docker

Normal run

```bash
docker run -itd --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name $NAME coin:22.04
```

With GPU

```bash
docker run --gpus all -it --rm nvidia/cuda:12.1.1-base-ubuntu22.04 nvidia-smi
```
