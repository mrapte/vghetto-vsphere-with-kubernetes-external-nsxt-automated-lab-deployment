# Author: 
# Website: 

# vCenter Server used to deploy vSphere with Kubernetes Lab
$VIServer = "10.0.5.8"
$VIUsername = "administrator@vsphere.local"
$VIPassword = "Viloha123!"

$VCSADisplayName = "pacific-vcsa-3"
$ESXiDisplayName = "pacific-esxi-7"
$NSXTMgrDisplayName = "pacific-nsx-3"
$NSXTEdgeDisplayName = "pacific-nsx-edge-3a"

$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

$VMtoKill = Get-VM -name $VCSADisplayName -Server $VIServer
Stop-VM  -VM $VMtoKill -Server $VIServer
Remove-VM -VM $VMtoKill -Server $VIServer -DeletePermanently

$VMtoKill = Get-VM -name $ESXiDisplayName -Server $VIServer
Stop-VM -VM $VMtoKill -Server $VIServer
Remove-VM -VM $VMtoKill -Server $VIServer -DeletePermanently

$VMtoKill = Get-VM -name $NSXTMgrDisplayName -Server $VIServer
Stop-VM -VM $VMtoKill -Server $VIServer
Remove-VM  -VM $VMtoKill -Server $VIServer -DeletePermanently

$VMtoKill = Get-VM -name $NSXTEdgeDisplayName -Server $VIServer
Stop-VM -VM $VMtoKill -Server $VIServer
Remove-VM -VM $VMtoKill -Server $VIServer -DeletePermanently