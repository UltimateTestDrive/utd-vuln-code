resource azurerm_kubernetes_cluster "k8s_cluster" {
  dns_prefix          = "tg-${var.environment}"
  location            = var.location
  name                = "tg-aks-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2_v2"
    node_count = 2
  }
  addon_profile {
    oms_agent {
      enabled = false
    }
    kube_dashboard {
      enabled = true
    }
  }
  role_based_access_control {
    enabled = false
  }
  tags = {
    git_file             = "terraform/azure/aks.tf"
  }
}