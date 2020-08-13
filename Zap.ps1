# Author: 
# Website: 

# vCenter Server used to deploy vSphere with Kubernetes Lab
$VIServer = "10.0.5.8"
$VIUsername = "administrator@vsphere.local"
$VIPassword = "Viloha123!!!"

$VCSADisplayName = "pacific-vcsa-3"
$ESXiDisplayName = "pacific-esxi-7"
$NSXTMgrDisplayName = "pacific-nsx-3"
$NSXTEdgeDisplayName = "pacific-nsx-edge-3a"

$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

$VMtoKill = Get-VM -name $VCSADisplayName -Server $viConnection
Stop-VM  -VM $VMtoKill -Server $viConnection -Confirm:$false
Remove-VM -VM $VMtoKill -Server $viConnection -DeletePermanently -Confirm:$false

$VMtoKill = Get-VM -name $ESXiDisplayName -Server $viConnection
Stop-VM -VM $VMtoKill -Server $viConnection -Confirm:$false
Remove-VM -VM $VMtoKill -Server $viConnection -DeletePermanently -Confirm:$false

$VMtoKill = Get-VM -name $NSXTMgrDisplayName -Server $viConnection
Stop-VM -VM $VMtoKill -Server $viConnection -Confirm:$false
Remove-VM  -VM $VMtoKill -Server $viConnection -DeletePermanently -Confirm:$false

$VMtoKill = Get-VM -name $NSXTEdgeDisplayName -Server $viConnection
Stop-VM -VM $VMtoKill -Server $viConnection -Confirm:$false
Remove-VM -VM $VMtoKill -Server $viConnection -DeletePermanently -Confirm:$false

echo "DONT FORGET to Delete vApp 'vGhetto-Nested-Project-Pacific-NSX-T-External-Lab*' in the Datacenter1"
echo "DONT FORGET to Delete VMFolder 'Project-Pacific' in the Datacenter1"
