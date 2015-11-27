# Name: korniichuk/scipy-k3d-notebook
# Short Description: Jupyter Notebook Scientific Python with K3D
# Full Description: The korniichuk/scipy-notebook Docker image with K3D.
# Version: 0.1a1

FROM korniichuk/scipy-notebook:latest

MAINTAINER Ruslan Korniichuk <ruslan.korniichuk@gmail.com>

USER root

# Clone K3D repository
ENV REFRESHED_AT 2015–11–27
RUN git clone https://github.com/K3D-tools/K3D-jupyter.git
