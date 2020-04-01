## tf-k8s

tf-k8s is a terraform project to deploy a kubernetes cluster using a N nodes. 

When you deploy a cluster, the terraform script will generate 3 files:

for k8testserver cluster, tf-k8s will generate a folder into root_project/k8s_config:
-  kube_config_cluster.yml
-  rke_data/cluster.rkestate
-  rke_data/k8testserver_cluster.yml

## Requeriments

We need to install rke terraform plugin 

RKE plugin url: https://github.com/rancher/terraform-provider-rke

The nodes to create the K8s cluster must have docker installed.

``` sh
curl https://releases.rancher.com/install-docker/18.09.sh | sh
```

To init a project, from the root dir,type:

```sh
make init ENV="dev" PROJECT="k8testserver"
```

## How to use

### Check plan from terraform

```sh
make plan ENV="dev" PROJECT="k8testserver""
```


### Apply plan

Setting the enviroment and region:
```sh
make apply ENV="dev" PROJECT="k8testserver"
```

### Destroy plan
```sh
make  destroy
```
Setting the enviroment and region:
```sh
make  destroy ENV="dev" PROJECT="k8testserver"
```

