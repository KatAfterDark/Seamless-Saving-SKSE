-- xmake port of .buildenv/CMakeLists.txt, targeting the 1.7-capable CommonLibSSE-NG
set_xmakever("3.0.5")

includes(os.getenv("CommonLibSSE-NG"))

set_project("SeamlessSaving")
set_version("1.0.6")
set_license("GPL-3.0")

set_languages("c++23")
set_warnings("allextra")
set_defaultmode("releasedbg")

add_rules("mode.debug", "mode.releasedbg")

set_config("skyrim_vr", false)
set_config("skse_xbyak", true)

add_requires("minhook", "boost")

target("SeamlessSaving")
    add_deps("commonlibsse-ng")
    add_packages("minhook", "boost")

    add_rules("commonlibsse-ng.plugin", {
        name = "SeamlessSaving",
        author = "JerryYOJ",
        description = "Faster, asynchronous Skyrim saving"
    })

    add_defines("SKYRIM_AE")
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src", ".buildenv")
    set_pcxxheader(".buildenv/PCH.h")
