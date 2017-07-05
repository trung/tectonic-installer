variable "tectonic_azure_config_version" {
  description = <<EOF
(internal) This declares the version of the Azure configuration variables.
It has no impact on generated assets but declares the version contract of the configuration.
EOF

  default = "1.1"
}

variable "tectonic_azure_ssh_network_internal" {
  type = "string"

  description = <<EOF
(optional) Network (internal) to allow SSH access from. Maps to `source_address_prefix` in Azure.
Defaults to `VirtualNetwork`. Should be internal to Azure environment.
Allowed values: [network CIDR (i.e., 10.0.0.0/16) | `VirtualNetwork` | `Internet` | `*` ]
EOF

  default = "VirtualNetwork"
}

variable "tectonic_azure_ssh_network_external" {
  type = "string"

  description = <<EOF
(optional) Network (external) to allow SSH access from. Maps to `source_address_prefix` in Azure.
Defaults to `*`. Can be external to Azure environment.
Allowed values: [network CIDR (i.e., 10.0.0.0/16) | `VirtualNetwork` | `Internet` | `*` ]
EOF

  default = "*"
}

variable "tectonic_azure_location" {
  type        = "string"
  description = "An Azure location where the cluster will be built."
}

variable "tectonic_azure_ssh_key" {
  type        = "string"
  description = "(required) Path to an SSH public key file to be provisioned as the SSH key for the 'core' user."
}

variable "tectonic_azure_master_vm_size" {
  type        = "string"
  description = "(optional) Instance size for the master node(s). Example: Standard_DS2_v2."
  default     = "Standard_DS2_v2"
}

variable "tectonic_azure_worker_vm_size" {
  type        = "string"
  description = "(optional) Instance size for the worker node(s). Example: Standard_DS2_v2."
  default     = "Standard_DS2_v2"
}

variable "tectonic_azure_etcd_vm_size" {
  type        = "string"
  description = "(optional) Instance size for the etcd node(s). Example: Standard_DS2_v2."
  default     = "Standard_DS2_v2"
}

variable "tectonic_azure_master_storage_account_type" {
  type = "string"

  description = <<EOF
(optional) Storage account type for the master node(s). Example: Premium_LRS.
Using Premium storage is constrained by the of instance specified in 'tectonic_azure_master_vm_size'.
See https://docs.microsoft.com/en-us/azure/storage/storage-premium-storage#supported-vms
EOF

  default = "Premium_LRS"
}

variable "tectonic_azure_worker_storage_account_type" {
  type = "string"

  description = <<EOF
(optional) Storage account type for the worker node(s). Example: Premium_LRS.
Using Premium storage is constrained by the of instance specified in 'tectonic_azure_worker_vm_size'.
See https://docs.microsoft.com/en-us/azure/storage/storage-premium-storage#supported-vms
EOF

  default = "Premium_LRS"
}

variable "tectonic_azure_etcd_storage_account_type" {
  type = "string"

  description = <<EOF
(optional) Storage account type for the etcd node(s). Example: Premium_LRS.
Using Premium storage is constrained by the of instance specified in 'tectonic_azure_etcd_vm_size'.
See https://docs.microsoft.com/en-us/azure/storage/storage-premium-storage#supported-vms
EOF

  default = "Premium_LRS"
}

variable "tectonic_azure_vnet_cidr_block" {
  type    = "string"
  default = "10.0.0.0/16"

  description = <<EOF
(optional) Range of IP addresses assigned to the Virtual Network in which the cluster nodes run.
This should not overlap with any other networks, such as the Kubernetes cluster (pod) range, 
service range or a private datacenter connected via ExpressRoute."
EOF
}

variable "tectonic_azure_external_vnet_id" {
  type    = "string"
  default = ""

  description = <<EOF
(optional) Resource ID of an existing Virtual Network to launch nodes into.
Leave blank to create a new Virtual Network.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: /subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/virtualNetworks/my-k8s-vnet
EOF
}

variable "tectonic_azure_external_master_subnet_id" {
  type = "string"

  description = <<EOF
(optional) Subnet ID within an existing VNet to deploy master nodes into.
Required to use an existing VNet.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/virtualNetworks/test-pre-vnet/subnets/my-k8s-subnet
EOF

  default = ""
}

variable "tectonic_azure_external_worker_subnet_id" {
  type = "string"

  description = <<EOF
(optional) Subnet ID within an existing VNet to deploy worker nodes into.
Required to use an existing VNet.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/virtualNetworks/test-pre-vnet/subnets/my-k8s-subnet
EOF

  default = ""
}

variable "tectonic_azure_external_resource_group" {
  type = "string"

  description = <<EOF
(optional) Name of an external resource group to place created resources in.
Leave blank to create a new one.
EOF

  default = ""
}

variable "tectonic_azure_external_nsg_etcd_id" {
  type = "string"

  description = <<EOF
(optional) The ID of the external Network Security Group used for etcd.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/networkSecurityGroups/my-etcd-nsg
EOF

  default = ""
}

variable "tectonic_azure_external_nsg_api_id" {
  type = "string"

  description = <<EOF
(optional) The ID of the external Network Security Group used for the Tectonic Console and Kubernetes API Server.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/networkSecurityGroups/my-lb-nsg
EOF

  default = ""
}

variable "tectonic_azure_external_nsg_master_id" {
  type = "string"

  description = <<EOF
(optional) The ID of the external Network Security Group used for masters.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/networkSecurityGroups/my-master-nsg
EOF

  default = ""
}

variable "tectonic_azure_external_nsg_worker_id" {
  type = "string"

  description = <<EOF
(optional) The ID of the external Network Security Group used for workers.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/networkSecurityGroups/my-worker-nsg
EOF

  default = ""
}

variable "tectonic_azure_external_dns_zone_id" {
  description = <<EOF
(optional) The ID of the external Azure DNS zone used for nodes & endpoints FQDNs.

Note this is the complete ID as returned in the "id" field by the Azure client, not just the name of the resource.

Example: "/subscriptions/b520eabf-d6c0-4757-8a5e-0fa7d2fe12b5/resourceGroups/my-k8s-cluster/providers/Microsoft.Network/dnszones/my-k8s-dns
EOF

  default = ""
}
