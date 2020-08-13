In the VCSA managing physical ESXi cluster, do the following settings

    1. Enable DRS on the physical cluster
    2. Create a VTEP port group on each physical ESXi standard vSwitch0
        Enable Promisuous mode and Forged Transmits at vSwitch0
        Change MTU to 1600 on vSwitch0 on each host
        Make sure that the physical switch support jumbo frames 
    3. If vSAN used, enable fake SCSI reservation
    4. Adjust Nested VMs (ESXi, VCSA, NSXTMgr and NSXEdge) CPU/Memory/No Reservation configuration 
             and move them to the right physical ESXi hosts
    5. Add VM/Host Groups and Affinity rules to assign Nested VMs to physical hosts
    