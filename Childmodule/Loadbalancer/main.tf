resource "azurerm_public_ip" "PublicIP" {
  for_each            = var.landing-lb
  name                = each.value.PublicIP_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "landing-lb" {
  for_each            = var.landing-lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PublicIP[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backendpool" {
  for_each = var.landing-lb
  loadbalancer_id = azurerm_lb.landing-lb[each.key].id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_probe" "hp" {
  for_each = var.landing-lb
  loadbalancer_id = azurerm_lb.landing-lb[each.key].id
  name            = "ssh-running-probe"
  protocol        = "Http"
  port            = 80
  request_path    = "/"

}
resource "azurerm_lb_rule" "lb-rule" {
  for_each = var.landing-lb
  loadbalancer_id                = azurerm_lb.landing-lb[each.key].id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [ azurerm_lb_backend_address_pool.backendpool[each.key].id ]
  probe_id                       = azurerm_lb_probe.hp[each.key].id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_bpool_assoc" {
  for_each = var.nic
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = data.azurerm_network_interface.nic[each.key].ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendpool["lb1"].id

}