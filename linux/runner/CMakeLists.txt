cmake_minimum_required(VERSION 3.13)
project(runner LANGUAGES CXX)

# Define the application target.
add_executable(${BINARY_NAME}
  "main.cc"
  "my_application.cc"
  # Remova ou comente a linha abaixo se o arquivo não existir
  # "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
)

# Apply the standard set of build settings.
macro(apply_standard_settings)
  set(CMAKE_CXX_STANDARD 14)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endmacro()
apply_standard_settings()

# Add preprocessor definitions for the application ID.
add_definitions(-DAPPLICATION_ID="${APPLICATION_ID}")

# Add dependency libraries.
# target_link_libraries(${BINARY_NAME} PRIVATE ...)


