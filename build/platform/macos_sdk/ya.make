RESOURCES_LIBRARY()



IF(EXPERIMENTAL_MACOS_M1_SUPPORT)
    # macOS 11.1 Big Sur SDK / Xcode 12.4 (12D4e)
    DECLARE_EXTERNAL_RESOURCE(MACOS_SDK sbr:2088833948)
ELSE()
    # macOS 10.15 Catalina SDK / Xcode 11.0 (11A420a)
    DECLARE_EXTERNAL_RESOURCE(MACOS_SDK sbr:1137285108)
ENDIF()

IF (USE_STL_SYSTEM)
    SET(__XCODE_RESOURCE_NAME CPP_XCODE_TOOLCHAIN_ROOT)
    SET(__XCODE_TOOLCHAIN_VERSION ${CPP_XCODE_TOOLCHAIN_VERSION})
    INCLUDE(${ARCADIA_ROOT}/build/platform/xcode/ya.make.inc)
    CFLAGS(
        GLOBAL -F$MACOS_SDK_RESOURCE_GLOBAL/System/Library/Frameworks
    )
    LDFLAGS(
        -F$MACOS_SDK_RESOURCE_GLOBAL/System/Library/Frameworks
    )
ENDIF()

END()
