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
  ip2 = {
    pip_name          = "frontend-ip-lb"
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
    nic_name    = "frontend-vm01-nic"
    location    = "uksouth"
    # pip_name    = "frontend-ip-todoapp"
    vm_name     = "frontend-vm01"
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
vm2 = {
    subnet_name = "frontend-subnet"
    vnet_name   = "vnet-uksouth"
    rg_name     = "todoapp-rg"
    nic_name    = "frontend-vm02-nic"
    location    = "uksouth"
    # pip_name    = "frontend-ip-todoapp"
    vm_name     = "frontend-vm02"
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



lbs = {
  lb1 = {
    lb_name  = "nitin-lb"
    location = "uksouth"
    rg_name  = "todoapp-rg"
    frontend_ip_configuration = {
      name = "frontend-lb"
    }
    pip_name          = "frontend-ip-lb"
    backend_pool_name = "todoapp-pool"
    probe_name        = "probe1"
    probe_port_number = "80"
    lb_rule_name      = "rule1"
    protocol          = "Tcp"
    frontend_port     = "80"
    backend_port      = "80"
  }
}

nictobaps = {
  link1 = {
    nic_name = "frontend-vm01-nic"
    rg_name  = "todoapp-rg"
    lb_name = "nitin-lb"
    backend_address_pool_name = "todoapp-pool"
    ip_configuration_name = "internal"
  }
   link2 = {
    nic_name = "frontend-vm02-nic"
    rg_name  = "todoapp-rg"
    lb_name = "nitin-lb"
    backend_address_pool_name = "todoapp-pool"
    ip_configuration_name = "internal"
  }
}
