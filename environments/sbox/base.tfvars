env                 = "sbox"
project             = "hmcts"
component           = "lz"
ddosplan            = "basic"

aks = [
  {
    vnet_name = "core-sbox-vnet",
    rg_name = "aks-infra-sbox-rg"
    rt_name = "aks-route-table"
  },
]

firewall = [
  {
    hub_vnet       = "10.102.0.0/24"
    priority       = "200"
    location       = "uksouth"
    aks_dnat_rules = [ "10.10.1.250", "10.10.3.250"]
  }
]