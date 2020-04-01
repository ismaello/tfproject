nodes   =   [
    {
        name            =       "master1"  
        address         =       "xxx.xxx.xx.xx"
        ssh_user        =       "xxxx"
        ssh_key_path    =       "~/.ssh/id_rsa"
        port            =       22
        role            =       ["controlplane", "etcd"]
    },
    {
      name              =       "master2"  
      address           =       "xx.xx.179.55"
      ssh_user          =       "xxxx"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["controlplane", "etcd"]
    },
    {
      name              =       "master3"  
      address           =       "192.168.179.56"
      ssh_user          =       "xxxx"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["controlplane", "etcd"]
    },
    {
      name              =       "worker1"  
      address           =       "xxx.xxx.xxx.xxx"
      ssh_user          =       "xxxx"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["worker"]
    },
    {
      name              =       "worker2"  
      address           =       "xxx.xxx.xxx.xxx"
      ssh_user          =       "xxxx"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["worker"]
    },
    {
      name              =       "worker3"  
      address           =       "xx.xx.xx.xx"
      ssh_user          =       "xxxx"
      ssh_key_path      =       "~/.ssh/id_rsa"
      port              =       22
      role              =       ["worker"]
    }


]
