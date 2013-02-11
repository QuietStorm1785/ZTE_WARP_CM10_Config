ifeq ($(BOARD_USES_HTC_CAMERA),true) 
#|| ifeq ($(TARGET_BOARD_PLATFORM),msm7x30) # From htc http://review.cyanogenmod.com/#/c/12793/12/camerahal/Android.mk

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := cameraHAL.cpp OverlayHtc.cpp
LOCAL_C_INCLUDES := frameworks/av/include frameworks/base/include frameworks/native/include
LOCAL_C_INCLUDES += hardware/libhardware/include/ hardware

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libbinder libdl libcamera
LOCAL_SHARED_LIBRARIES += libcamera_client libui libhardware libseccameraadaptor
LOCAL_PRELINK_MODULE := false

# hack for prebuilt
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libseccameraadaptor_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libseccameraadaptor_intermediates/export_includes)

ifeq ($(BOARD_HAVE_HTC_FFC), true)
	LOCAL_CFLAGS += -DHTC_FFC
endif
ifeq ($(BOARD_USE_REVERSE_FFC), true)
	LOCAL_CFLAGS += -DREVERSE_FFC
endif

include $(BUILD_SHARED_LIBRARY)

endif
