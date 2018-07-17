workspace "string-hash-test"
	configurations { "debug", "release" }
	platforms      { "x64", "x32" }
	startproject   "string-hash-test"

  	language "C++"
	flags { "NoPCH" }
	warnings "Extra"
	debugdir "."

  	filter { "platforms:*32" } architecture "x86"
  	filter { "platforms:*64" } architecture "x64"

	filter { "configurations:debug" }
		defines { "DEBUG" }
		symbols "On"
		targetdir "bin/debug"

	filter { "configurations:release" }
		defines { "NDEBUG" }
		optimize "Full"
		targetdir "bin/release"

	filter { "system:windows", "action:vs*"}
		buildoptions { "/std:c++latest" }

	filter {}

project "string-hash-test"
	kind "ConsoleApp"
	files { "**.hpp", "**.cpp" }
	includedirs { "*" }
	targetname "string-hash-test"
	
