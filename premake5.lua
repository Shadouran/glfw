workspace "GLFW"
architecture "x64"
configurations {"Debug", "Release"}
startproject "GLFW"

project "GLFW"
location "GLFW"
kind "StaticLib"
language "C"

targetdir("bin/%{cfg.buildcfg}")
objdir("bin-int/%{cfg.buildcfg}")

files {
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/context.c",
    "src/init.c",
    "src/monitor.c",
    "src/input.c",
    "src/platform.c",
    "src/vulkan.c",
    "src/window.c"
}

filter "system:windows" --until next filter or project
staticruntime "On"
systemversion "latest"

files {
    "src/win32_init.c",
    "src/win32_joystick.c",
    "src/win32_module.c",
    "src/win32_monitor.c",
    "src/win32_thread.c",
    "src/win32_time.c",
    "src/win32_window.c"
}

defines {
    "_GLFW_WIN32"
}

filter "configurations:Release"
optimize "On"
buildoptions "/MT"
