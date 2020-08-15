# Author: 
# Website: 

# Snapshot name = Nested-NSX-T-3.0-Workload, Nested-NSX-T-3.0-Base
if ($args.Count -ne 2) {
    echo "Invalid Parameters"
    exit
}

$SnapShotName = $args[0]

# vCenter Server used to deploy vSphere with Kubernetes Lab
$VIServer = "10.0.5.8"
$VIUsername = "administrator@vsphere.local"
$VIPassword = "Viloha123!!!"

$VMsToWorkOn = "pacific-vcsa-3", "pacific-esxi-7", "pacific-nsx-3", "pacific-nsx-edge-3a"

echo "Connecting to $VIServer"
$viConnection = Connect-VIServer $VIServer -User $VIUsername -Password $VIPassword -WarningAction SilentlyContinue

$VMsToWorkOn.GetEnumerator() | Foreach-Object {
    echo "Reverting VM $_ to snapshot name $SnapShotName"
    Set-VM -VM (Get-VM -name $_ -Server $viConnection) -Snapshot $SnapShotName -Confirm:$false
}

if ($args[1] -eq 1) {
    .\PowerOnNested.ps1
}
