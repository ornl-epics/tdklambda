#!../../bin/linux-x86_64/secage-SE-TDK-RS232

< envPaths

cd "${TOP}"

epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TDK_RS232)/protocol/")

## Register all support components
dbLoadDatabase "dbd/secage-SE-TDK-RS232.dbd"
secage_SE_TDK_RS232_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure ("tdk232","10.112.63.120:4001",0,0,0)

## Load record instances
dbLoadRecords "db/secage-SE-TDK-RS232.db"

## Set this to see messages from mySub
#var mySubDebug 1
#var streamDebug 1

######################################################
# Autosave

epicsEnvSet IOCNAME secage-SE-TDK-RS232

epicsEnvSet SAVE_DIR /home/controls/var/$(IOCNAME)
save_restoreSet_Debug(1)

### status-PV prefix, so save_restore can find its status PV's.
save_restoreSet_status_prefix("SECAGE:SE:PS:")

set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")

save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(600)
## No 'pass0' records are defined
set_pass0_restoreFile("$(IOCNAME).sav")
set_pass0_restoreFile("$(IOCNAME)_pass0.sav")
set_pass1_restoreFile("$(IOCNAME).sav")

######################################################

cd "${TOP}/iocBoot/${IOC}"
iocInit

asynSetTraceMask("tdk232",0,0x0)
asynSetTraceIOMask("tdk232",0,0x0)

# Create request file and start periodic 'save'
epicsThreadSleep(5)
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req", "autosaveFields")
create_monitor_set("$(IOCNAME).req", 5)

