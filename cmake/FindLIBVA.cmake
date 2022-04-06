find_path(LIBVA_INCLUDE_DIR NAMES va/va.h PATHS "${LIBVA_ROOT_DIR}/include")
find_library(LIBVA_LIBRARY NAMES va PATHS "${LIBVA_ROOT_DIR}/lib")
find_library(LIBVA_DRM_LIBRARY NAMES va-drm PATHS "${LIBVA_ROOT_DIR}/lib")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LIBVA DEFAULT_MSG LIBVA_LIBRARY LIBVA_DRM_LIBRARY LIBVA_INCLUDE_DIR)

mark_as_advanced(LIBVA_INCLUDE_DIR LIBVA_LIBRARY LIBVA_DRM_LIBRARY)

if(LIBVA_FOUND)
  if(NOT TARGET LIBVA::LIBVA)
    add_library(LIBVA::LIBVA UNKNOWN IMPORTED)

    set_target_properties(LIBVA::LIBVA PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LIBVA_INCLUDE_DIR}"
      IMPORTED_LOCATION "${LIBVA_LIBRARY}")
  endif()
  if(NOT TARGET LIBVA::LIBVA_DRM)
    add_library(LIBVA::LIBVA_DRM UNKNOWN IMPORTED)

    set_target_properties(LIBVA::LIBVA_DRM PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${LIBVA_INCLUDE_DIR}"
      IMPORTED_LOCATION "${LIBVA_DRM_LIBRARY}")
  endif()
endif()