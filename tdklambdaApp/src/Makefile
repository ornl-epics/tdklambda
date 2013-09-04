TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

LIBRARY_IOC += tdklambdaSupport

# tdklambda.dbd will be created and installed
DBD += tdklambda.dbd

# tdklambda.dbd will be made up from these files:
tdklambda_DBD += base.dbd
tdklambda_DBD += asyn.dbd
tdklambda_DBD += stream.dbd

# Build the main IOC entry point on workstation OSs.
tdklambda_SRCS += tdklambdaMain.cpp

# Finally link to the EPICS Base libraries
tdklambda_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

