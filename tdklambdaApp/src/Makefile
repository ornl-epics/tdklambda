TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE


#=============================
# Build the IOC support library
PROD_IOC = TDK-RS232

# TDK-RS232.dbd will be created and installed
DBD += TDK-RS232.dbd

# TDK-RS232.dbd will be made up from these files:
TDK-RS232_DBD += base.dbd

# TDK-RS232_registerRecordDeviceDriver.cpp derives from TDK-RS232.dbd
TDK-RS232_SRCS += TDK-RS232_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TDK-RS232_SRCS_DEFAULT += TDK-RS232Main.cpp
TDK-RS232_SRCS_vxWorks += -nil-

# Finally link to the EPICS Base libraries
TDK-RS232_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

