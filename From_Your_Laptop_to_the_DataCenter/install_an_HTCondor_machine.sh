HTCondor User's Manual Quick Start Guide: https://htcondor.readthedocs.io/en/latest/users-manual/quick-start-guide.html#users-quick-start-guide
HTCondor Administration Quick Start Guide: https://htcondor.readthedocs.io/en/latest/getting-htcondor/admin-quick-start.html

EXERCISE:

create 3 VMs on AWS:
1) central manager t3_small
2) submit node t3_small
3) execute node t3_medium

#INSTALL THE CENTRAL MANAGER
#LOGIN VIA SSH to the central manager

curl -fsSL https://get.htcondor.org | sudo GET_HTCONDOR_PASSWORD="BDP1_2024" /bin/bash -s -- --no-dry-run --central-manager <the_central_manager_private_IP>
#CHECK CONDOR STATUS
condor_status
ps auxwf

#INSTALL THE SUBMIT NODE
#LOGIN VIA SSH to the submit node
curl -fsSL https://get.htcondor.org | sudo GET_HTCONDOR_PASSWORD="BDP1_2024" /bin/bash -s -- --no-dry-run --submit <the_central_manager_private_IP>
condor_status

#INSTALL THE EXECUTE NODE
#LOGIN VIA SSH to the execute node
curl -fsSL https://get.htcondor.org | sudo GET_HTCONDOR_PASSWORD="BDP1_2024" /bin/bash -s -- --no-dry-run --execute <the_central_manager_private_IP>
condor_status


############################################
ADVACED: CHANGE THE SLOT TYPE : https://htcondor.readthedocs.io/en/latest/admin-manual/ep-policy-configuration.html
[root@execute ~]# cat /etc/condor/config.d/01-execute.config
CONDOR_HOST = <the_central_manager_private_IP>
# For details, run condor_config_val use role:get_htcondor_execute
use role:get_htcondor_execute
use FEATURE: StaticSlots

SLOT_TYPE_1 = cpus=2
SLOT_TYPE_2 = cpus=1
NUM_SLOTS_TYPE_1 = 1
NUM_SLOTS_TYPE_2 = 2

[root@execute ~]#condor_reconfig
[root@execute ~]#systemctl restart condor
[root@execute ~]#condor_status

############################################

###################################  HINT BELOW ####################

 Security Group must allow tcp for ports 0 - 65535 from the same security group, i.e.:
 All TCP    TCP      0 - 65535     sg-008742ba0467986fe (aws_condor)
Security group must allow ping from the same security group, i.e.:
 All    ICMP-IPv4   All    N/A     sg-008742ba0467986fe (aws_condor)
Security group must allow ssh on port 22 from everywhere as ususal

#you can also allow all traffic (all protocols, all ports) from the same security group
#######################################################################
