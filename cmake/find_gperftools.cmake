if (ENABLE_LIBTCMALLOC)
	if (USE_INTERNAL_GPERFTOOLS_LIBRARY)
		set(GPERFTOOLS_INCLUDE_DIR "${ClickHouse_SOURCE_DIR}/contrib/libtcmalloc/include/")
		set(GPERFTOOLS_TCMALLOC tcmalloc_minimal_internal)
		include_directories (BEFORE ${GPERFTOOLS_INCLUDE_DIR})
	else ()
		find_package (Gperftools REQUIRED)
		include_directories (${GPERFTOOLS_INCLUDE_DIR})
	endif ()

	if (GPERFTOOLS_INCLUDE_DIR AND GPERFTOOLS_TCMALLOC)
		set (USE_TCMALLOC 1)
	endif ()

	message(STATUS "Using tcmalloc=${USE_TCMALLOC}: ${GPERFTOOLS_INCLUDE_DIR} : ${GPERFTOOLS_TCMALLOC}")
endif ()
