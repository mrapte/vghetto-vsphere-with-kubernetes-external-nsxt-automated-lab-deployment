# Author: 
# Website: 

# vCenter Server used to deploy vSphere with Kubernetes Lab
$VIServer = "10.0.5.8"
$VIUsername = "administrator@vsphere.local"
$VIPassword = "Viloha123!!!"

$VMsToWorkOn = "pacific-esxi-7", "pacific-vcsa-3", "pacific-nsx-3", "pacific-nsx-edge-3a"

echo "Connecting to $VIServer"
$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

$VMsToWorkOn.GetEnumerator() | Foreach-Object {
    echo "Starting $_"
    Start-VM -VM (Get-VM -name $_ -Server $viConnection)
    Start-Sleep -s 120
}
