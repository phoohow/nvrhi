set_languages("c++20")
add_rules("mode.debug", "mode.release")

target("nvrhi", function()
    set_kind("shared")
    add_includedirs("include", "thirdparty/Vulkan-Headers/include", {public = true})
    add_files("src/common/*.cpp", "src/validation/*.cpp", "src/d3d12/*.cpp", "src/vulkan/*.cpp")
    add_defines("VULKAN_HPP_STORAGE_SHARED", "VULKAN_HPP_STORAGE_SHARED_EXPORT", "VK_USE_PLATFORM_WIN32_KHR", "NOMINMAX")
    add_defines("NVRHI_SHARED_LIBRARY_BUILD")
    
    if is_plat("windows") then
        add_links("dxgi", "d3d12")
    end
    
    add_headerfiles("include/nvrhi/*.h", "include/nvrhi/common/*.h")
end)
