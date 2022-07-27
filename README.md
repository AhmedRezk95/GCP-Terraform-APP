# GCP-Terraform-APP
GCP hands-on using Terraform

## Introduction
Build an application refer to [LINK](https://github.com/atefhares/DevOps-Challenge-Demo-Code) on GCP architecture using the following:

* Build a Dockerfile for the application and upload it to GCP container registery service
* Build a google cloud architecture for appling this application on private GCP GKE Cluster
* Deploy the application using Kubernetes deployment and services

## Architecture
![Untitled-2022-07-26-2255](https://user-images.githubusercontent.com/30655799/181225755-0e36d4d3-3c1f-46b7-9097-4c13aac53f80.png)

In the architecture we have one vpc which has two subnets (management) and (restricted)

* For management subnet it will be connected to router and cloud NAT in order to make the bastion-vm accessible through ssh.
* For restricted subnet it will be purely private it only has an access to bastion-vm, it will contain the cluster which will host the application as deployment and it will be connected to external HTTP loadbalancer in order to access the application

## Introduction
