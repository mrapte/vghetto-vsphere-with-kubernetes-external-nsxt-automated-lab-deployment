1. Setup 2 (instead of 3) Supervisor Control Plane VMs in Nested VCSA using /etc/vmware/wcp/wcpsvc.yaml
    service-control --restart wcp
2. Enable MacLearning using the following
    Set-MacLearn -DVPortgroupName @("DVPG-Management Network") -EnableMacLearn $true -EnablePromiscuous $false -EnableForgedTransmit $true -EnableMacChange $false