--[[
    ================================================================================
    NV_FPSBOOSTER - PREMIUM PERFORMANCE OPTIMIZATION
    --------------------------------------------------------------------------------
    COPYRIGHT © 2026 NVCORE. ALL RIGHTS RESERVED.
    THIS SCRIPT IS PROVIDED AS A FREE RESOURCE BUT IS NOT OPEN SOURCE.
    UNAUTHORIZED REDISTRIBUTION OR MODIFICATION IS PROHIBITED.
    --------------------------------------------------------------------------------
    FOR MAXIMUM SECURITY, USE CFX.RE ESCROW SYSTEM.
    ================================================================================
]]

local _isMenuOpen = false
local _currentLevel = "Off"
local _isSmooth = false
local _isLightsOff = false

-- Core Optimizer Engine
local function _applyOptimization(level)
    _currentLevel = level
    
    if level == "Off" then
        RopeDrawShadowEnabled(true)
        CascadeShadowsClearShadowSampleCache()
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetFarClipMax(300.0)
        CascadeShadowsSetShadowSampleType(3)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
    elseif level == "Lite" then
        RopeDrawShadowEnabled(false)
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetEntityTrackerScale(0.0)
        DistantCopCarSirens(false)
    elseif level == "Medium" then
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleCache()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetFarClipMax(0.0)
        CascadeShadowsSetShadowSampleType(0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
    elseif level == "High" then
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleCache()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetFarClipMax(0.0)
        CascadeShadowsSetShadowSampleType(0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        SetStaticWidgetPosition(1, 0.0, 0.0, 0.0, 0.0)
    elseif level == "Ultra" then
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleCache()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetFarClipMax(0.0)
        CascadeShadowsSetShadowSampleType(0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        SetStaticWidgetPosition(1, 0.0, 0.0, 0.0, 0.0)
        OverrideLodscaleThisFrame(0.4)
    end
end

-- Ultimate Boost Logic
local function _handleSpecialBoost(enabled)
    _isSmooth = enabled
    if enabled then
        SetTimecycleModifier("cinema")
    else
        ClearTimecycleModifier()
    end
end

-- UI Interface Bridge
local function _toggleInterface(status)
    _isMenuOpen = status
    SetNuiFocus(status, status)
    SendNUIMessage({
        type = "toggleMenu",
        status = status,
        currentLevel = _currentLevel,
        isSmooth = _isSmooth,
        isLightsOff = _isLightsOff
    })
end

-- Command Registration
RegisterCommand("fps", function()
    _toggleInterface(not _isMenuOpen)
end)

-- NUI Communication
RegisterNUICallback("close", function(data, cb)
    _toggleInterface(false)
    cb("ok")
end)

RegisterNUICallback("setLevel", function(data, cb)
    _applyOptimization(data.level)
    exports['ox_lib']:notify({
        title = "FPS Level Updated",
        description = "Level set to: " .. data.level,
        duration = 3000,
        type = "info"
    })
    cb("ok")
end)

RegisterNUICallback("toggleSmooth", function(data, cb)
    _handleSpecialBoost(data.enabled)
    exports['ox_lib']:notify({
        title = "Special NV Boost",
        description = data.enabled and "Ultimate Boost Activated" or "Ultimate Boost Deactivated",
        duration = 3000,
        type = data.enabled and "success" or "info"
    })
    cb("ok")
end)

RegisterNUICallback("cleanMemory", function(data, cb)
    collectgarbage("collect")
    exports['ox_lib']:notify({
        title = "Memory Cleaned Successfully",
        description = "System cache has been optimized",
        duration = 3000,
        type = "success"
    })
    cb("ok")
end)

RegisterNUICallback("toggleLights", function(data, cb)
    _isLightsOff = data.enabled
    SetArtificialLightsState(_isLightsOff)
    exports['ox_lib']:notify({
        title = "Night Performance",
        description = data.enabled and "City Lights Disabled" or "City Lights Enabled",
        duration = 3000,
        type = "info"
    })
    cb("ok")
end)

-- Continuous Performance Thread
CreateThread(function()
    while true do
        if _currentLevel == "Ultra" then
            OverrideLodscaleThisFrame(0.4)
        elseif _currentLevel == "High" then
            OverrideLodscaleThisFrame(0.8)
        end
        
        if _currentLevel ~= "Off" then
            DisableOcclusionThisFrame()
        end
        
        Wait(0)
    end
end)
