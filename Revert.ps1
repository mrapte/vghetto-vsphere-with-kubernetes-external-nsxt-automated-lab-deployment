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

$VMtoRevert = Get-VM -name $ESXiDisplayName -Server $viConnection
Set-VM -VM $VMtoRevert -Snapshot "WithNSX" -Confirm:$false
Start-VM -VM $VMtoRevert

$VMtoRevert = Get-VM -name $VCSADisplayName -Server $viConnection
Set-VM -VM $VMtoRevert -Snapshot "WithNSX" -Confirm:$false
Start-VM -VM $VMtoRevert

$VMtoRevert = Get-VM -name $NSXTMgrDisplayName -Server $viConnection
Set-VM -VM $VMtoRevert -Snapshot "WithNSX" -Confirm:$false
Start-VM -VM $VMtoRevert

$VMtoRevert = Get-VM -name $NSXTEdgeDisplayName -Server $viConnection
Set-VM -VM $VMtoRevert -Snapshot "WithNSX" -Confirm:$false
Start-VM -VM $VMtoRevert
