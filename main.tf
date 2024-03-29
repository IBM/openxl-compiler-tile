locals {
  placement_group = [for x in data.ibm_pi_placement_groups.cloud_instance_groups.placement_groups : x if x.name == var.placement_group]
  placement_group_id = length(local.placement_group) > 0 ? local.placement_group[0].id : ""
}

data "ibm_pi_placement_groups" "cloud_instance_groups" {
  pi_cloud_instance_id = local.pid
} 

data "ibm_pi_key" "key" {
  pi_cloud_instance_id = local.pid
  pi_key_name          = var.ssh_key_name
}

data "ibm_pi_network" "power_network" {
  pi_cloud_instance_id = local.pid
  pi_network_name      = var.network_name
}
    
resource "ibm_pi_image" "rhcos_image_import" {
  pi_image_name             = var.rhcos_image_name
  pi_cloud_instance_id      = var.service_instance_id
  pi_image_bucket_name      = var.bucket_name
  pi_image_bucket_region    = var.rhcos_import_bucket_region
  pi_image_bucket_file_name = var.rhcos_import_image_filename
  pi_image_access_key       = var.rhcos_image_access_key
  pi_image_secret_key       = var.rhcos_image_secret_key
}

data "ibm_pi_image" "rhcos" { 
  pi_image_name        = ibm_pi_image.rhcos_image_import.pi_image_name
  pi_cloud_instance_id = var.service_instance_id
}

resource "ibm_pi_instance" "instance" {
  pi_cloud_instance_id = local.pid
  pi_memory            = var.memory
  pi_processors        = var.processors
  pi_instance_name     = var.instance_name
  pi_proc_type         = var.processor_type
  pi_image_id          = ibm_pi_image.rhcos_image_import.image_id
  pi_key_pair_name     = data.ibm_pi_key.key.id
  pi_sys_type          = var.sys_type
  pi_storage_type      = var.storage_type
  pi_placement_group_id = local.placement_group_id
  pi_network {
    network_id = data.ibm_pi_network.power_network.id
  }
}
