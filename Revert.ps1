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

echo "Connecting to $VIServer"
$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

echo "Reverting ESXi"
$VMtoRevertESXi = Get-VM -name $ESXiDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertESXi -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

echo "Reverting VCSA"
$VMtoRevertVCSA = Get-VM -name $VCSADisplayName -Server $viConnection
Set-VM -VM $VMtoRevertVCSA -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

echo "Reverting NSXTMgr"
$VMtoRevertNSXTMgr = Get-VM -name $NSXTMgrDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertNSXTMgr -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

echo "Reverting NSXTEdge"
$VMtoRevertNSXTEdge = Get-VM -name $NSXTEdgeDisplayName -Server $viConnection
Set-VM -VM $VMtoRevertNSXTEdge -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false

if ($args[0] -eq 1) {
    echo "Starting ESXi"
    Start-VM -VM $VMtoRevertESXi
    echo "Sleeping 2 mins"
    Start-Sleep -Seconds 120

    echo "Starting VCSA"
    Start-VM -VM $VMtoRevertVCSA
    echo "Sleeping 4 mins"
    Start-Sleep -Seconds 240

    echo "Starting NSXTMgr"
    Start-VM -VM $VMtoRevertNSXTMgr
    echo "Sleeping 2 mins"
    Start-Sleep -Seconds 120

    echo "Starting NSXTEdge"
    Start-VM -VM $VMtoRevertNSXTEdge
}
