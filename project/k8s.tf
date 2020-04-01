resource "rke_cluster" "cluster" {
  cluster_name    =   var.environment_name

  dynamic nodes {
    for_each = var.nodes

    content {
      address = nodes.value.address
      hostname_override = nodes.value.name
      user    = nodes.value.ssh_user
      role    = nodes.value.role
      ssh_key = file(nodes.value.ssh_key_path)
      port    = nodes.value.port
    }
    
  
  }
  
  addons_include = var.yaml_to_install

}


resource "local_file" "kubeconfig_yaml" {
  filename = "${path.root}/../k8s_config/${var.environment_name}/kube_config_cluster.yml"
  sensitive_content  = rke_cluster.cluster.kube_config_yaml
}
resource "local_file" "rke_state" {
  filename = "${path.root}/../k8s_config/${var.environment_name}/rke_data/cluster.rkestate"
  content = rke_cluster.cluster.rke_state
}
resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/../k8s_config/${var.environment_name}/rke_data/${var.environment_name}_cluster.yml"
  content = rke_cluster.cluster.rke_cluster_yaml
}