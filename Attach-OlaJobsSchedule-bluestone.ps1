import-module dbatools
 $lists=Import-Csv -path .\Documents\myscripts\sqlagentschedule1.csv 
 #New-DbaAgentSchedule -SqlInstance DR1-vDevSQL01 -Job d

  #$jobs =Get-SqlAgent -ServerInstance DR1-vDevSQL01   | Get-SqlAgentJob  |?{$_.name -like '*database*' -and $_.category -like 'database*' -and $_.name -notlike 'dba_Maintenance Plans*'} 


  $lists.parent

 foreach($list in $lists)
 {
 $list


 New-DbaAgentSchedule -SqlInstance dr1-vdevsql01 -Job $list.parent -schedule $list.name -FrequencyInterval $list.FrequencyInterval	-FrequencyRecurrenceFactor $list.FrequencyRecurrenceFactor -StartTime $list.ActiveStartTimeOfDay -FrequencySubdayType $list.FrequencySubDayTypes -FrequencyType $list.FrequencyTypes -force -FrequencySubdayInterval $list.FrequencySubDayInterval
 


 
 }

Get-SqlAgent -ServerInstance DR1-vDevSQL01   | Get-SqlAgentJob  |?{$_.name -like '*database*'}| Get-SqlAgentJobSchedule  |export-csv -path .\Documents\sqlagentscheduletestwithpowershell.csv
