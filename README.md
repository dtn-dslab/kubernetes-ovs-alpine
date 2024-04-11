# Kubernetes-OVS

## Overview

This repository is used to test Open vSwitch (OVS) in Kubernetes. It contains Dockerfiles to build OVS images and Kubernetes manifests to deploy OVS in Kubernetes.

The most important point is that OVS is running in the container network namespace, not in the host network namespace.

If you need to run OVS in the host network namespace, you can just expose the ovs-db file to the container, and contoller it using ovs-vsctl.

## Build OVS image

```bash
make ovs-docker
make ovs-push
```

or All-in-one

```bash
make ovs-all
```

## Deploy OVS in Kubernetes

```bash
make deploy
```

## Undeploy OVS in Kubernetes

```bash
make undeplpy
```