# Author: 
# Website: 

# vCenter Server used to deploy vSphere with Kubernetes Lab
$VIServer = "10.0.5.8"
$VIUsername = "administrator@vsphere.local"
$VIPassword = "Viloha123!!!"

$VMsToWorkOn = "pacific-vcsa-3", "pacific-esxi-7", "pacific-nsx-3", "pacific-nsx-edge-3a"

echo "Connecting to $VIServer"
$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

$VMsToWorkOn.GetEnumerator() | Foreach-Object {
    echo "Reverting $_"
    Set-VM -VM (Get-VM -name $_ -Server $viConnection) -Snapshot "Nested-NSX-T-3.0-Base" -Confirm:$false
}

if ($args[0] -eq 1) {
    .\PowerOnNested.ps1
}
