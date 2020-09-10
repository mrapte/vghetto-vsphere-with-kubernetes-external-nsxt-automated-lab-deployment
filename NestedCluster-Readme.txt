1. Setup 2 (instead of 3) Supervisor Control Plane VMs in Nested VCSA using /etc/vmware/wcp/wcpsvc.yaml
    service-control --restart wcp
2. Enable MacLearning using the following
    Set-MacLearn -DVPortgroupName @("DVPG-Management Network") -EnableMacLearn $true -EnablePromiscuous $false -EnableForgedTransmit $true -EnableMacChange $false
3. Set "v.l" as default domain
4. Keep VMs software up-to-date
5. Assign Linceses : VC Srv Std, ESXi Ent Plus with K8s, vSAN if used
6. Add 'admin' user to 'administrators' group