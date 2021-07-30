TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Build the IOC application
PROD_IOC = secage-SE-TDK-RS232

# secage-SE-TDK-RS232.dbd will be created and installed
DBD += secage-SE-TDK-RS232.dbd

# secage-SE-TDK-RS232.dbd will include these files:
secage-SE-TDK-RS232_DBD += base.dbd
secage-SE-TDK-RS232_DBD += asyn.dbd
secage-SE-TDK-RS232_DBD += drvAsynIPPort.dbd
secage-SE-TDK-RS232_DBD += stream.dbd
secage-SE-TDK-RS232_DBD += asSupport.dbd


# secage-SE-TDK-RS232_registerRecordDeviceDriver.cpp derives from secage-SE-TDK-RS232.dbd
secage-SE-TDK-RS232_SRCS += secage-SE-TDK-RS232_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
secage-SE-TDK-RS232_SRCS_DEFAULT += secage-SE-TDK-RS232Main.cpp
secage-SE-TDK-RS232_SRCS_vxWorks += -nil-

# Link in the code from our support library
secage-SE-TDK-RS232_LIBS += asyn
secage-SE-TDK-RS232_LIBS += stream
secage-SE-TDK-RS232_LIBS += autosave


# Finally link IOC to the EPICS Base libraries
secage-SE-TDK-RS232_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

