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

## Steps
1- Convert the application to docker file (it will be pushed later in GCP container registery:

![image](https://user-images.githubusercontent.com/30655799/181230534-7281f82c-6d1f-46f9-8e56-f4a172f2bfe8.png)

2- Build the architecture in terraform 
* set modules for simplification (Network-GKE-serviceaccount)

![image](https://user-images.githubusercontent.com/30655799/181231026-eb751958-a26a-4d22-bbad-39b4f4cdcad6.png)

* Apply the architecture on GCP using terraform
```bash
# install plugin - install modules
terraform init
# create a new terraform workspace in order for testing purposes
terraform workspace new dev
# check syntax
terraform validate
# make a virutal plan before apply
terraform plan
# apply the infrastrucutre
terraform apply --auto-approve
```
3- After creating the GCP architecture we have to ssh to bastion-vm and connect it to GKE manually by the following code

```bash
gcloud container clusters get-credentials <GKE-Cluster-name> --zone <zone> --project <project-id>
```

4- Once you connect to you GKE, you can now create the kubernetes components required to install the application, you will need:
* Deployment with the application image, "notice container port must be 8000 because we exposed it on dockerfile image"

![image](https://user-images.githubusercontent.com/30655799/181233536-67750070-5aed-4878-a9e9-d5322b53d055.png)


* Service connected to the deployment and its type is loadbalancer to create external loadbalancer

![image](https://user-images.githubusercontent.com/30655799/181233588-dcffa730-9caa-49a7-8e9b-91d53b5044fe.png)


## Final Results
* Kubernetes View

![Screenshot from 2022-07-26 23-04-25](https://user-images.githubusercontent.com/30655799/181234134-1c55b460-deef-4712-994b-79aac52e25e2.png)

* Use (external-loadbalancer

![Screenshot from 2022-07-26 22-49-24](https://user-images.githubusercontent.com/30655799/181234341-b874ed90-60d7-4db9-a135-20a51285a2c6.png)
er-IP:PORT) 




