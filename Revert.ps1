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

$VMtoRevertESXi = Get-VM -name $ESXiDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertESXi -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

$VMtoRevertVCSA = Get-VM -name $VCSADisplayName -Server $viConnection
Set-VM -VM $VMtoRevertVCSA -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

$VMtoRevertNSXTMgr = Get-VM -name $NSXTMgrDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertNSXTMgr -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

$VMtoRevertNSXTEdge = Get-VM -name $NSXTEdgeDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertNSXTEdge -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

if ($args[0] -eq 1) {
    Start-VM -VM $VMtoRevertESXi
    Start-Sleep 120
    Start-VM -VM $VMtoRevertVCSA
    Start-Sleep 240
    Start-VM -VM $VMtoRevertNSXTMgr
    Start-Sleep 120
    Start-VM -VM $VMtoRevertNSXTEdge
}
