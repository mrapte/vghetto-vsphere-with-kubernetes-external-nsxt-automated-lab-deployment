In the VCSA managing physical ESXi cluster, do the following settings

    1. Enable DRS on the physical cluster
    2. Create a VTEP port group on each physical ESXi standard vSwitch0
    3. If vSAN used, enable fake SCSI reservation
    4. Add VM/Host Groups and Affinity rules to assign ESXi, VCSA, NSXTMgr and NSXEdge VMs to physical hosts 