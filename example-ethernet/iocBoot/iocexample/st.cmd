#!../../bin/linux-x86_64/example

## You may have to change example to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

#Define protocol path
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TDKLAMBDA)/protocol/")

## Register all support components
dbLoadDatabase "dbd/example.dbd"
example_registerRecordDeviceDriver pdbbase

###########################################################
# Connect to the TDKLambda

epicsEnvSet("tdklambda","192.168.200.154")
#< /home/controls/var/bl7-spellman1/user.settings
drvAsynIPPortConfigure ("ps1","$(tdklambda):8003",0,0,0)

# asynSetTraceMask("ps1",0,0xFF)
# asynSetTraceIOMask("ps1",0,0xFF)
 
###########################################################

## Load record instances
dbLoadRecords "db/example.db"

#################################################
# autosave

epicsEnvSet("IOCNAME","example")
epicsEnvSet("SAVE_DIR","/tmp/tdklambda")

save_restoreSet_Debug(0)

### status-PV prefix, so save_restore can find its status PV's.
save_restoreSet_status_prefix("$(IOCNAME):")

set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")

save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)
set_pass0_restoreFile("$(IOCNAME).sav")
set_pass0_restoreFile("$(IOCNAME)_pass0.sav")
set_pass1_restoreFile("$(IOCNAME).sav")

#################################################

cd ${TOP}/iocBoot/${IOC}
iocInit

# Create request file and start periodic 'save'
epicsThreadSleep(5)
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req", "autosaveFields")
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME)_pass0.req", "autosaveFields")
create_monitor_set("$(IOCNAME).req", 5)
create_monitor_set("$(IOCNAME)_pass0.req", 5)

