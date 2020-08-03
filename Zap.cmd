echo "Zapping the Nested Environment"
"C:\Program Files\PowerShell\7\pwsh.exe" .\Zap.ps1 

echo "Zapping the VCSA-Phy"
"C:\Program Files (x86)\VMware\VMware Workstation\vmrun" -T ws listSnapshots C:\VMs\VCSA-Phy\VCSA-Phy.vmx
"C:\Program Files (x86)\VMware\VMware Workstation\vmrun" -T ws revertToSnapshot C:\VMs\VCSA-Phy\VCSA-Phy.vmx Base
"C:\Program Files (x86)\VMware\VMware Workstation\vmrun" -T ws start C:\VMs\VCSA-Phy\VCSA-Phy.vmx