$adapters=(Get-NetAdapter | Where-Object Name -like 'vEthernet*')
Set-NetFirewallProfile -DisabledInterfaceAliases $adapters.Name
