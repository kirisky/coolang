#ifndef COOLANG_CODEGEN_PLATFORM_H
#define COOLANG_CODEGEN_PLATFORM_H

#include <filesystem>
#include <fstream>

#ifdef _WIN32
#include "coolang/codegen/windows_platform.h"
#endif

#ifdef __unix__
#include "coolang/codegen/linux_platform.h"
#endif

namespace coolang {

namespace platform {

#ifdef _WIN32
using PlatformClass = WindowsPlatform;
#endif

#ifdef __unix__
using PlatformClass = LinuxPlatform;
#endif

inline std::string GetLinkerCommand(
    const std::filesystem::path& input_file_path,
    const std::optional<std::string>& exe_filename) {
  std::filesystem::path object_file_path = input_file_path;
  object_file_path.replace_extension(PlatformClass::GetObjectFileExtension());

  std::filesystem::path exe_file_path = input_file_path;
  if (exe_filename.has_value()) {
    exe_file_path.replace_filename(exe_filename.value());
  }
  exe_file_path.replace_extension(PlatformClass::GetExeFileExtension());

  return PlatformClass::GetLinkerCommand(object_file_path, exe_file_path);
}

inline std::string GetObjectFileExtension() {
  return PlatformClass::GetObjectFileExtension();
}
inline std::string GetExeFileExtension() {
  return PlatformClass::GetExeFileExtension();
}

}  // namespace platform

}  // namespace coolang

#endif  // COOLANG_CODEGEN_PLATFORM_H
