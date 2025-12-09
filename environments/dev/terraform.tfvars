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

pips = {
  ip1 = {
    pip_name          = "frontend-ip-todoapp"
    location          = "uksouth"
    rg_name           = "todoapp-rg"
    allocation_method = "Static"
  }
}


vms = {
  vm1 = {
    subnet_name = "frontend-subnet"
    vnet_name   = "vnet-uksouth"
    rg_name     = "todoapp-rg"
    nic_name    = "frontend-vm-nic"
    location    = "uksouth"
    pip_name    = "frontend-ip-todoapp"
    vm_name     = "frontend-vm-01"
    vm_size     = "Standard_F2"
    vmadmin     = "devopsadmin"
    vmpassword  = "London@123"
    script_name = "nginx.sh"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      image_publisher = "Canonical"
      image_offer     = "0001-com-ubuntu-server-jammy"
      image_sku       = "22_04-lts"
      image_version   = "latest"
    }


  }
}

sql_servers = {
  server1 = {
    sql_server_name = "sql-server200928"
    rg_name         = "todoapp-rg"
    location        = "uksouth"
    sql_admin       = "serveradmin"
    sql_password    = "London@123"
  }
}

dbs = {
  db1 = {
    sql_db_name     = "sql-db-2007"
    sql_server_name = "sql-server200928"
    rg_name         = "todoapp-rg"

  }
}
