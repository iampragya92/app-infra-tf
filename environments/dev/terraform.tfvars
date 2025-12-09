rgs = {
  rg1 = {
    rg_name  = "todoapp-rg"
    location = "uksouth"
  }
  rg2 = {
    rg_name  = "todoapp1-rg"
    location = "uksouth"
  }
}

networks = {
  v1 = {
    vnet_name = "vnet-uksouth"
    location  = "uksouth"
    rg_name   = "todoapp-rg"
    vnet_cidr = ["10.0.0.0/16"]
    subnets = [
      {
        subnet_name = "frontend-subnet"
        subnet_cidr = ["10.0.1.0/24"]
      },
      {
        subnet_name = "backend-subnet"
        subnet_cidr = ["10.0.2.0/24"]
      }
    ]
  }
}


