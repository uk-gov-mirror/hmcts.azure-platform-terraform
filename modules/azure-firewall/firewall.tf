resource "azurerm_firewall" "main" {
  count               = length(var.firewall)
  name                = "${var.env}-${lookup(element(var.firewall, count.index), "location")}-fw"
  location            = azurerm_resource_group.main[count.index].location
  resource_group_name = azurerm_resource_group.main[count.index].name

  ip_configuration {
    name                 = lookup(var.common_tags, "activityName")
    subnet_id            = azurerm_subnet.main[count.index].id
    public_ip_address_id = azurerm_public_ip.main[count.index].id
  }

  tags = var.common_tags
}