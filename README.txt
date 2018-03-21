Monitoring Hyper-v replication with discover (LLD)

Requirement: Zabbix Server 3.0+

1. Download files;
2. Import template;
3. Copy scripts to where you wish;
4. Add to zabbix_agent.conf how bellow:
Timeout=5
UserParameter=hyperv_replica[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\Scripts\hyperv_replica.ps1" $1 $2
UserParameter=hyperv_replica_discover,powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Zabbix\Scripts\hyperv_replica_discover.ps1"


Values:
0 - OK
1 - Warning
2 - Critical
3 - Unknown
