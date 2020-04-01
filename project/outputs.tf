output "cluster" {
  value = rke_cluster.cluster
}

output "kubeconfig_file" {
  value = local_file.kubeconfig_yaml.filename
}