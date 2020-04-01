nodes   =   [
    {
      name              =       "master1"  
      address           =       "192.168.1.219"
      ssh_user          =       "ismael"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["controlplane", "etcd","worker"]
    }
]


yaml_to_install= [
    "https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml",
    "https://gist.githubusercontent.com/superseb/499f2caa2637c404af41cfb7e5f4a938/raw/930841ac00653fdff8beca61dab9a20bb8983782/k8s-dashboard-user.yml",
  ]


