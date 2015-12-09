.. contents:: Table of contents
   :depth: 2

Full description
================
The `korniichuk/scipy-notebook <https://hub.docker.com/r/korniichuk/scipy-notebook/>`_ Docker image with K3D.

Docker Hub
==========
The `korniichuk/scipy-k3d-notebook <https://hub.docker.com/r/korniichuk/scipy-k3d-notebook/>`_ repo.

Quickstart
==========
The following command starts a container with the Notebook server listening for HTTP connections on port 8888 without authentication configured::

    $ docker run -d -p 8888:8888 korniichuk/scipy-k3d-notebook

User guide
==========
Detached
--------
To start a container in detached mode, you use ``-d`` or ``--detach`` option. By design, containers started in detached mode exit when the root process used to run the container exits. A container in detached mode cannot be automatically removed when it stops, this means you cannot use the ``--rm`` option with ``-d`` option.
::

    $ docker run -d -p HOST_PORT:CONTAINER_PORT IMAGE
    $ docker run -d -p 8888:8888 korniichuk/scipy-k3d-notebook

or::

    $ docker run --detach -p HOST_PORT:CONTAINER_PORT IMAGE
    $ docker run --detach -p 8888:8888 korniichuk/scipy-k3d-notebook

Where:

* ``-d`` or ``--detach`` -- run container in background and print container ID.

Ports
-----
We can also bind Docker containers to specific ports using the ``-p`` or ``--publish`` option, for example::

    $ docker run -d -p HOST_PORT:CONTAINER_PORT IMAGE
    $ docker run -d -p 8888:8888 korniichuk/scipy-k3d-notebook

or::

    $ docker run -d --publish HOST_PORT:CONTAINER_PORT IMAGE
    $ docker run -d --publish 8888:8888 korniichuk/scipy-k3d-notebook

Where:

* ``-p`` or ``--publish`` -- publish a container's port(s) to the host.

Interactive processes
---------------------
For interactive processes (like a shell), you must use ``-i -t`` together in order to allocate a tty for the container process. ``-i -t`` is often written ``-it``::

    $ docker run -it IMAGE COMMAND
    $ docker run -it korniichuk/scipy-k3d-notebook bash

Where:

* ``-i`` or ``--interactive`` -- keep STDIN open even if not attached,
* ``-t`` or ``--tty`` -- allocate a pseudo-TTY.

Own try.jupyter.org
===================
**First**, the following commands launches a docker container for each user that requests one::

    $ export TOKEN=$( head -c 30 /dev/urandom | xxd -p )
    $ docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN --name=proxy jupyter/configurable-http-proxy --default-target http://127.0.0.1:9999
    $ docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN -v /var/run/docker.sock:/docker.sock jupyter/tmpnb python orchestrate.py --image='korniichuk/scipy-k3d-notebook' --command="ipython notebook --NotebookApp.base_url={base_path} --ip=0.0.0.0 --port {port}"

**Second**, visit your host on port 8000.
