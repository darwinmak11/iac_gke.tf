//Project Wide Variable
//Project Name
variable "project" {
  description = "The name of the project in which to create the Kubernetes cluster."
  type        = string
}

//Network and Cluster Location
variable "location" {
  description = "The location which to create the Kubernetes cluster."
  type        = string
}

//Network Region
variable "region" {
  description = "The region in which to create the network"
  type        = string
}

//Network related variable
//VPC Network Name
variable "vpc_network_name" {
  description = "Names the VPC in which to create the network"
  type        = string
}

//VPC Subnetwork Name
variable "vpc_subnetwork_name" {
  description = "Name of the VPC Subnet"
  type        = string
}

//CIDR for the cluster
variable "vpc_subnetwork_cidr_range" {
  description = "The CIDR from which to allocate cluster node IPs"
  type        = string
}

//Cloud Router Name
variable "router_name" {
  description = "The Cloud Router name for the network"
  type        = string
}

//Cloud NAT Name
variable "nat_name" {
  description = "The Cloud NAT name for the network"
  type        = string
}

//Cloud Router ASN Num
variable "asn_num" {
  description = "The Cloud Router ASN Number"
  type        = string
}

//GKE releated variable
//Cluster Name
variable "cluster_name" {
  description = "The name to give the new Kubernetes cluster."
  type        = string
}

//Cluster Master 
variable "master_ipv4_cidr_block" {
  description = "The CIDR from which to allocate master IPs"
  type        = string
}

//Pod Network Name
variable "cluster_secondary_range_name" {
  description = "The Pod network"
  type        = string
}

//Pod Network CIDR
variable "cluster_secondary_range_cidr" {
  description = "The Pod network CIDR"
  type        = string
}

//Service Network Name
variable "services_secondary_range_name" {
  description = "The Service network"
  type        = string
}

//Service Network CIDR
variable "services_secondary_range_cidr" {
  description = "The Service network CIDR"
  type        = string
}

//Primary Node Pool Name
variable "primary-node-pool" {
  description = "Primary Node Pool Name"
  type        = string
}

//Primary Node Count
variable "pri_node_count" {
  description = "Primary Node Count"
  type        = string
}


//Secondary Node Pool Name
variable "secondary-node-pool" {
  description = "Secondary Node Pool Name"
  type        = string
}

//Secondary Node Pool Auto-Scaling-Min Node Count
variable "autoscaling_min_node_count" {
  description = "Autoscaling Min Node Count"
  type        = string
}

//Secondary Node Pool Auto-Scaling-Max Node Count
variable "autoscaling_max_node_count" {
  description = "Autoscaling Max Node Count"
  type        = string
}

//Node Machine Type
variable "node_machine_type" {
  description = "The machine type for your node"
  type        = string
}

//Service Account ID
variable "k8s-svc-account" {
  description = "Service Account for K8S"
  type        = string
}

//Service Account Display Name
variable "k8s-svc-account-name" {
  description = "Service Account Namefor K8S"
  type        = string
}

//GKE Master authZ Network
variable "gke_master_authZ-Net" {
  description = "Master Authorized_networks"
  type        = string
}

