# This ansible script will help you to easly install kubernetes when you have to multiple nodes.

## Prerequisites
### The minimal server requirements for the servers used in the cluster are:
- 2 GB or more of RAM per machine – any less leaves little room for your apps.
- At least 2 CPUs on the machine that you use as a control-plane node.
- Full network connectivity among all machines in the cluster – Can be private or public
### Since this setup is meant for development purposes, I have setup the servers as mentioned below.
----------------------------------------------------------------------------------------------------
| Server Type	 | Server Hostname | Specs |
|--------------|-----------------|-------|
| Master       | k8s-master      |4GB RAM, 2 vCPUs |
| Worker       | k8s-worker01    |4GB RAM, 2 vCPUs |
