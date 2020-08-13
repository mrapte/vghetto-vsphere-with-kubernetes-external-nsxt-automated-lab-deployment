In the VCSA managing physical ESXi cluster, do the following settings

    1. Enable DRS on the physical cluster
    2. Create a VTEP port group on each physical ESXi standard vSwitch0
        Enable Promisuous mode and Forged Transmits at vSwitch0
        Change MTU to 1600 on vSwitch0 on each host
        Make sure that the physical switch support jumbo frames 
    3. If vSAN used, enable fake SCSI reservation
    4. Adjust Nested VMs (ESXi, VCSA, NSXTMgr and NSXEdge) CPU/Memory(No Reservation, shares) configuration 
             and move them to the right physical ESXi hosts
                ESXi  CPU:4, Mem:31GB - Assighed to 10.0.5.10
                VCSA  CPU:4, Mem:31GB - Assighed to 10.0.5.10
                NSXTM CPU:4, Mem:15GB - Assighed to 10.0.5.13
                NSXTE CPU:4, Mem:15GB - Assighed to 10.0.5.13
             Fix snapshot limits, if any.
    5. Add VM/Host Groups and Affinity rules to assign Nested VMs to physical hosts
    6. Keep ESXi and VCSA up-to-date
    7. Shutdown Nested VMs in Order : NSXTMgr, NSXEdge, VCSA, ESXi
    8. Create snapshots and backup Nested VMs if possible
    