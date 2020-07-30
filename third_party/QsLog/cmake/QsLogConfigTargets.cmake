# CMake build support courtesy of A.Gembe

if (WIN32)
	set(QSLOG_RELEASE_PATH "/Release")
	set(QSLOG_RELWDBG_PATH "/RelWithDebInfo")
	set(QSLOG_MINSIZE_PATH "/MinSizeRel")
	set(QSLOG_DEBUG_PATH "/Debug")
	set(QSLOG_LIB_RELEASE_PATH "/Release")
	set(QSLOG_LIB_RELWDBG_PATH "/RelWithDebInfo")
	set(QSLOG_LIB_MINSIZE_PATH "/MinSizeRel")
	set(QSLOG_LIB_DEBUG_PATH "/Debug")
elseif (UNIX)
	set(QSLOG_RELEASE_PATH "")
	set(QSLOG_RELWDBG_PATH "")
	set(QSLOG_MINSIZE_PATH "")
	set(QSLOG_DEBUG_PATH "/debug")
	set(QSLOG_LIB_RELEASE_PATH "")
	set(QSLOG_LIB_RELWDBG_PATH "")
	set(QSLOG_LIB_MINSIZE_PATH "")
	set(QSLOG_LIB_DEBUG_PATH "")
endif ()
if (APPLE)
	set(QSLOG_FRAMEWORK_PATH /Library/Frameworks)
endif ()

# install targets according to current build type
function(QsLog_install_target TARGETNAME SUFFIX)
	install(TARGETS ${TARGETNAME}
		RUNTIME DESTINATION "bin${QSLOG_RELEASE_PATH}" CONFIGURATIONS Release None ""
		LIBRARY DESTINATION "lib${QSLOG_LIB_RELEASE_PATH}${SUFFIX}" CONFIGURATIONS Release None ""
		ARCHIVE DESTINATION "lib${QSLOG_LIB_RELEASE_PATH}${SUFFIX}" CONFIGURATIONS Release None ""
		FRAMEWORK DESTINATION "${QSLOG_FRAMEWORK_PATH}" CONFIGURATIONS Release None ""
	)
	install(TARGETS ${TARGETNAME}
		RUNTIME DESTINATION "bin${QSLOG_RELWDBG_PATH}" CONFIGURATIONS RelWithDebInfo
		LIBRARY DESTINATION "lib${QSLOG_LIB_RELWDBG_PATH}${SUFFIX}" CONFIGURATIONS RelWithDebInfo
		ARCHIVE DESTINATION "lib${QSLOG_LIB_RELWDBG_PATH}${SUFFIX}" CONFIGURATIONS RelWithDebInfo
		FRAMEWORK DESTINATION "${QSLOG_FRAMEWORK_PATH}" CONFIGURATIONS RelWithDebInfo
	)
	install(TARGETS ${TARGETNAME}
		RUNTIME DESTINATION "bin${QSLOG_MINSIZE_PATH}" CONFIGURATIONS MinSizeRel
		LIBRARY DESTINATION "lib${QSLOG_LIB_MINSIZE_PATH}${SUFFIX}" CONFIGURATIONS MinSizeRel
		ARCHIVE DESTINATION "lib${QSLOG_LIB_MINSIZE_PATH}${SUFFIX}" CONFIGURATIONS MinSizeRel
		FRAMEWORK DESTINATION "${QSLOG_FRAMEWORK_PATH}" CONFIGURATIONS MinSizeRel
	)
	install(TARGETS ${TARGETNAME}
		RUNTIME DESTINATION "bin${QSLOG_DEBUG_PATH}" CONFIGURATIONS Debug
		LIBRARY DESTINATION "lib${QSLOG_LIB_DEBUG_PATH}${SUFFIX}" CONFIGURATIONS Debug
		ARCHIVE DESTINATION "lib${QSLOG_LIB_DEBUG_PATH}${SUFFIX}" CONFIGURATIONS Debug
		FRAMEWORK DESTINATION "${QSLOG_FRAMEWORK_PATH}" CONFIGURATIONS Debug
	)
endfunction(QsLog_install_target)