$VMKUSBFlingBundle = "F:\VMware\ESXi\ESXi700-VMKUSB-NIC-FLING-34491022-component-15873236.zip"
$esxiOfflineBundle = "F:\VMware\ESXi\VMware-ESXi-7.0.0-16324942-depot.zip"

$esxiImageProfileName = "ESXi-7.0.0-16324942-standard"
$newImageProfileName = "ESXi-7.0b-VMKUSBFling"

$viConnection = Connect-VIServer 10.0.5.8 -User administrator@vsphere.local -Password Viloha123! -WarningAction SilentlyContinue

Add-EsxSoftwareDepot $esxiOfflineBundle
Add-EsxSoftwareDepot $VMKUSBFlingBundle

$VMKUSBFlingVIB = Get-EsxSoftwarePackage | where {$_.name -eq "vmkusb-nic-fling"}
New-EsxImageProfile -CloneProfile $esxiImageProfileName -Name $newImageProfileName -Vendor vGhetto
Add-EsxSoftwarePackage -ImageProfile $newImageProfileName -SoftwarePackage $VMKUSBFlingVIB
Export-EsxImageProfile -ImageProfile $newImageProfileName -ExportToIso -FilePath "F:\VMware\ESXi\ESXi-7.0b-VMKUSBFling-1.5.34491022.ISO"
