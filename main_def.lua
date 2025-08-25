-- _  __    _    _____   _    __  __   __  __    _    _  __
--| |/ /   / \  |___ /  / \   \ \/ /   \ \/ /   / \  | |/ /
--| ' /   / _ \   |_ \ / _ \   \  /     \  /   / _ \ | ' / 
--| . \  / ___ \ ___) / ___ \  /  \     /  \  / ___ \| . \ 
--|_|\_\/_/   \_\____/_/   \_\/_/\_\   /_/\_\/_/   \_\_|\_\
                                                       
require("zxcmodule")

ded.Write = nil
ded.Read = nil

local ultimate                          = {}
local me          			= LocalPlayer()



local MetaPlayer                        = FindMetaTable("Player")

local TraceHull                         = util.TraceHull    
local TraceLine                         = util.TraceLine









surface.CreateFont( "veranda", { font = "Smallest Pixel-7", size = 11, antialias = false, outline = true } )
surface.CreateFont( "veranda_s", { font = "Smallest Pixel-7", size = 11, antialias = false, shadow = false } )
surface.CreateFont( "veranda_scr", { font = "Smallest Pixel-7", size = ScreenScale( 11 ), antialias = false, outline = true } )

surface.CreateFont( "saddamhussein", { font = "Open Sans", size = 64, weight = 1000 } )

ultimate.Colors = {}

for i = 0,255 do  
    ultimate.Colors[i] = Color( i, i, i )
end

ultimate.Colors["Red"] = Color( 255, 0, 0, 255 )

ultimate.accent = Color( 100, 150, 255 )













local settings = {

}

local theme = {
    ["Frame background"] = stupasta or Color(7, 7, 7),
    ["Frame foreground"] = foregra or Color(7, 7, 7),
    ["Frame title"] = frama or Color(255, 255, 255),
} 

local pLocalPlayer = LocalPlayer()

local screenWidth = ScrW()
local screenHeight = ScrH()

local traceResult = {}
local traceStruct = { output = traceResult }

local flTickInterval = engine.TickInterval()

surface.CreateFont( "DermaSmall", {	
    font = "Akbar", 
    antialias = false,
    size = 15,
    outline = true
} )










ultimate.cached = {}

ultimate.Materials = {}


ultimate.Materials["Gradient"] = Material("gui/gradient_up", "noclamp smooth")
ultimate.Materials["Gradient down"] = Material("gui/gradient_down", "noclamp smooth")
ultimate.Materials["Gradient right"] = Material("gui/gradient", "noclamp smooth")
ultimate.Materials["Alpha grid"] = Material("gui/alpha_grid.png", "noclamp smooth")
ultimate.Materials["Blur"] = Material("pp/blurscreen")
ultimate.blur = Material("pp/blurscreen")


ultimate.presets = {}
ultimate.cfg = { vars = {}, binds = {}, colors = {} }

ultimate.cfg.vars["Enable aimbot"]              = false
ultimate.cfg.binds["Aim on key"]                = 0

ultimate.cfg.vars["Silent aim"]                 = true
ultimate.cfg.vars["pSilent"]                    = false

ultimate.cfg.vars["Auto reload"]                = false
ultimate.cfg.vars["Auto fire"]                  = false
ultimate.cfg.vars["Rapid fire"]                 = false
ultimate.cfg.vars["Alt Rapid fire"]             = false
ultimate.cfg.vars["Bullet time"]                = false

ultimate.cfg.vars["Nospread"]                   = false
ultimate.cfg.vars["Force seed"]                 = false
ultimate.cfg.vars["Wait for seed"]              = false
ultimate.cfg.vars["Norecoil"]                   = false

ultimate.cfg.vars["Extrapolation"]              = false
ultimate.cfg.vars["last update"]                = false
ultimate.cfg.vars["T-poses"]                      = false
ultimate.cfg.vars["Bone fix"]                   = false
ultimate.cfg.vars["Update Client Anim fix"]     = false
ultimate.cfg.vars["leg_breaker"]                = false
ultimate.cfg.vars["Wait for simulation"]    = false
ultimate.cfg.vars["Disable interpolation"]      = true
ultimate.cfg.vars["Disable Sequence interpolation"] = true

ultimate.cfg.vars["Target selection"]           = 2 
ultimate.cfg.vars["Ignores-Friends"]            = false
ultimate.cfg.vars["Enable Priority List"]       = false
ultimate.cfg.vars["Ignores-Steam friends"]      = false
ultimate.cfg.vars["Ignores-Teammates"]          = false
ultimate.cfg.vars["Ignores-Admins"]             = false
ultimate.cfg.vars["Ignores-Bots"]               = false
ultimate.cfg.vars["Ignores-Frozen"]             = false
ultimate.cfg.vars["Ignores-Nodraw"]             = false
ultimate.cfg.vars["Ignores-Nocliping"]          = false
ultimate.cfg.vars["Ignores-God time"]           = false
ultimate.cfg.vars["Ignores-Head unhitable"]     = false
ultimate.cfg.vars["Ignores-Driver"]             = false
ultimate.cfg.vars["Wallz"]                      = false

ultimate.cfg.vars["Max targets"]                = 0
ultimate.cfg.vars["Max distance"]               = 50000

ultimate.cfg.vars["Hitbox selection"]           = 1
ultimate.cfg.vars["Hitscan"]                    = false
ultimate.cfg.vars["Hitscan groups-Head"]        = false
ultimate.cfg.vars["Hitscan groups-Chest"]       = false
ultimate.cfg.vars["Hitscan groups-Stomach"]     = false
ultimate.cfg.vars["Hitscan groups-Arms"]        = false
ultimate.cfg.vars["Hitscan groups-Legs"]        = false
ultimate.cfg.vars["Hitscan groups-Generic"]     = false
ultimate.cfg.vars["Hitscan mode"]               = 1
ultimate.cfg.vars["Multipoint"]                 = false
ultimate.cfg.vars["Multipoint scale"]           = 0.8
ultimate.cfg.vars["Multipoint groups-Head"]     = false
ultimate.cfg.vars["Multipoint groups-Chest"]    = false
ultimate.cfg.vars["Multipoint groups-Stomach"]  = false
ultimate.cfg.vars["Multipoint groups-Arms"]     = false
ultimate.cfg.vars["Multipoint groups-Legs"]     = false
ultimate.cfg.vars["Multipoint groups-Generic"]  = false

ultimate.cfg.vars["Adjust tickcount"]           = false
ultimate.cfg.vars["Gun switch"]                 = false
ultimate.cfg.vars["Auto detonator"]             = false
ultimate.cfg.vars["AutoD distance"]             = 96

ultimate.cfg.vars["Backtrack"]                  = false
ultimate.cfg.vars["Always backtrack"]           = false
ultimate.cfg.vars["Backtrack mode"]             = 1
ultimate.cfg.vars["Sampling interval"]          = 0
ultimate.cfg.vars["Backtrack time"]             = 200

ultimate.cfg.vars["Aimbot smoothing"]           = false
ultimate.cfg.vars["Smoothing"]                  = 0.05

ultimate.cfg.vars["Fov limit"]                  = false
ultimate.cfg.vars["Fov dynamic"]                = false
ultimate.cfg.vars["Aimbot FOV"]                 = 30
ultimate.cfg.vars["Show FOV"]                   = false
ultimate.cfg.colors["Show FOV"]                 = "255 255 0 255"

ultimate.cfg.vars["Aimbot snapline"]                   = false
ultimate.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
ultimate.cfg.vars["Aimbot marker"]                   = false
ultimate.cfg.colors["Aimbot marker"]                 = "255 255 255 255"

ultimate.cfg.vars["Box Wall"]   = false
ultimate.cfg.vars["Kill effect"]   = false
ultimate.cfg.vars.localkillfeed   = false



ultimate.cfg.vars["Trigger bot"]                = false
ultimate.cfg.binds["Trigger bot"]               = 0

ultimate.cfg.vars["Prop aimbot"]                = false
ultimate.cfg.vars["PA thrower"]                 = false
ultimate.cfg.vars["PA thrower dist"]            = 128
ultimate.cfg.vars["Prop max simtime"]           = 4

ultimate.cfg.vars["Crossbow prediction"]        = false

ultimate.cfg.vars["Simulation limit"]           = 4

ultimate.cfg.vars["Baim low health"]            = false
ultimate.cfg.vars["Baim health"]                = 65

ultimate.cfg.vars["Auto healthkit"]             = false
ultimate.cfg.vars["Healthkit-Self heal"]        = false
ultimate.cfg.vars["Healthkit-Heal closest"]     = false

ultimate.cfg.vars["Knifebot"]                   = false
ultimate.cfg.vars["Knifebot mode"]              = 1
ultimate.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

ultimate.cfg.vars["Facestab"]                   = false

ultimate.cfg.vars["Projectile aimbot"]          = false
ultimate.cfg.vars["TF2 Predict"]                = false









// Resolver 

ultimate.cfg.vars["Resolver"] = false
ultimate.cfg.vars["Yaw mode"] = 1
ultimate.cfg.vars["Pitch resolver"] = false
ultimate.cfg.vars["Taunt resolver"] = false



ultimate.cfg.vars["Invert first shot"] = false
ultimate.cfg.vars["Resolver max misses"] = 2


// Tickbase 
ultimate.cfg.vars["Tickbase shift"] = false
ultimate.cfg.vars["Wait for unlag"] = false

ultimate.cfg.vars["Fakelag comp"] = 2

ultimate.cfg.vars["Skip fire tick"] = false
ultimate.cfg.vars["Double tap"] = false
ultimate.cfg.vars["Dodge projectiles"] = false
ultimate.cfg.vars["Passive recharge"] = false

ultimate.cfg.vars["Auto recharge"] = false
ultimate.cfg.vars["Wait for charge"] = false
ultimate.cfg.vars["Warp on peek"] = false

ultimate.cfg.vars["Charge ticks"] = 48
ultimate.cfg.vars["Shift ticks"] = 48
ultimate.cfg.binds["Tickbase shift"] = 0
ultimate.cfg.binds["Auto recharge"] = 0



ultimate.cfg.vars["Anti aim"]                   = false
ultimate.cfg.vars["Yaw randomisation"]          = false

ultimate.cfg.vars["Custom real"]                = 75
ultimate.cfg.vars["Custom fake"]                = 180
ultimate.cfg.vars["Custom pitch"]               = 89
ultimate.cfg.vars["Spin speed"]                 = 30
ultimate.cfg.vars["LBY min delta"]              = 100
ultimate.cfg.vars["LBY break delta"]            = 120
ultimate.cfg.vars["Sin delta"]                  = 89
ultimate.cfg.vars["Sin add"]                    = 11
ultimate.cfg.vars["Jitter delta"]               = 45



ultimate.cfg.vars["Yaw base"]                   = 1
ultimate.presets["Yaw base"] = { "Viewangles", "At targets" }
ultimate.cfg.vars["Yaw"]                        = 1
ultimate.presets["Yaw"] = { 
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom", "Side jitter",
    "Spiral", "Desync", "AntiHit", "AntiHit 2",
    "Test"
}
ultimate.cfg.vars["Pitch"]                      = 1
ultimate.presets["Pitch"] = { 
    "Down", "Up", "Zero", 
    "Fake down", "Fake fake down", 
    "Fake jitter","Fake down break", "Kizaru", 
    "Fake zero", "Fake Up jitter",
    "Up jitter","Flicker +Up","Fucker Flicker +Up",
    "Custom pitch"
}
ultimate.cfg.vars["Edge"]                       = 1

ultimate.cfg.binds["Anti aim"]                   = 0







ultimate.cfg.vars["Antiaim material"] = 1
ultimate.cfg.vars["Antiaim fullbright"] = false
ultimate.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers 

ultimate.cfg.vars["Taunt spam"] = false
ultimate.cfg.vars["Taunt"] = 2

ultimate.cfg.vars["Handjob"] = false
ultimate.cfg.vars["Handjob mode"] = 1


ultimate.cfg.vars["Micromovement"] = false
ultimate.cfg.vars["On shot aa"] = false
ultimate.cfg.vars["Freestanding"] = false
ultimate.cfg.binds["freestand"] = 0
ultimate.cfg.vars["Inverter"] = false
ultimate.cfg.binds["Inverter"] = 0
ultimate.cfg.vars["Anti aim chams"] = false
ultimate.cfg.vars["Anti-BruteForce"] = false

ultimate.cfg.vars["Angle arrows"] = false

ultimate.cfg.vars["Modelchanger"]   = false
ultimate.cfg.vars["Modelchanger model"] = 1
ultimate.cfg.vars["Player_modelchanger"] = false
ultimate.cfg.vars["Player_modelchanger_agent"] = 1






ultimate.cfg.vars["Free standing"] = false
ultimate.cfg.vars["Dancer"] = false
    ultimate.cfg.vars["Dance"] = 1
    ultimate.cfg.vars["Arm breaker"] = false
    ultimate.cfg.vars["Arm breaker mode"] = 1
    ultimate.cfg.vars["Fake duck"] = false
    ultimate.cfg.vars["Fake duck mode"] = 1
    ultimate.cfg.vars["Fake walk"] = false
    ultimate.cfg.vars["Crimwalk"] = false

    ultimate.cfg.vars["Air crouch"] = false
    ultimate.cfg.vars["Air crouch mode"] = 1

// fake lag
ultimate.cfg.vars["Fake lag"] = false

ultimate.cfg.vars["Fake lag options-Disable on ladder"] = false
ultimate.cfg.vars["Fake lag options-Disable in attack"] = false
ultimate.cfg.vars["Fake lag options-On peek"] = false
ultimate.cfg.vars["Fake lag options-Randomise"] = false

ultimate.cfg.vars["Lag mode"] = 1

ultimate.cfg.vars["Lag limit"] = 1
ultimate.cfg.vars["Lag randomisation"] = 1

ultimate.cfg.vars["Fake duck"] = false
ultimate.cfg.binds["Fake duck"] = 0

ultimate.cfg.vars["Air lag duck"] = false
ultimate.cfg.vars["Jesus lag"] = false



ultimate.cfg.vars["Allah fly"] = false

    
// Sequence manip
ultimate.cfg.vars["Sequence manip"] = false
ultimate.cfg.vars["OutSequence"] = 500
ultimate.cfg.binds["Sequence manip"] = 0
ultimate.cfg.vars["Sequence min random"] = false
ultimate.cfg.vars["Sequence min"] = 128

ultimate.cfg.binds["Animation freezer"] = 0
ultimate.cfg.vars["Animation freezer"] = false

ultimate.cfg.vars["Freeze on peek"] = false

ultimate.cfg.vars["Allah walk"] = false
ultimate.cfg.binds["allahwalk"] = 0

// Animfix 

ultimate.cfg.vars["Interpolation-Disable interpolation"] = false
ultimate.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    ultimate.cfg.vars["Bounding box"] = false



// Movement
ultimate.cfg.vars["Bhop"] = false
ultimate.cfg.vars["Sprint"] = false
ultimate.cfg.vars["Safe hop"] = false
ultimate.cfg.vars["Edge jump"] = false
ultimate.cfg.vars["Air duck"] = false

ultimate.cfg.vars["Air strafer"] = false
ultimate.cfg.vars["Strafe mode"] = 1
ultimate.cfg.vars["Ground strafer"] = false
ultimate.cfg.vars["Fast stop"] = false
ultimate.cfg.vars["Z Hop"] = false
ultimate.cfg.binds["Z Hop"] = 0

ultimate.cfg.vars["Water jump"] = false

ultimate.cfg.vars["Auto peak"] = false
ultimate.cfg.binds["Auto peak"] = 0
ultimate.cfg.vars["Auto peak tp"] = false

ultimate.cfg.vars["Circle strafe"] = false
ultimate.cfg.binds["Circle strafe"] = 0
ultimate.cfg.vars["CStrafe ticks"] = 64
ultimate.cfg.vars["CStrafe angle step"] = 1
ultimate.cfg.vars["CStrafe angle max step"] = 10
ultimate.cfg.vars["CStrafe ground diff"] = 10

ultimate.cfg.vars["Cvar name"] = ""
ultimate.cfg.vars["Cvar int"] = "1"
ultimate.cfg.vars["Cvar str"] = ""
ultimate.cfg.vars["Cvar mode"] = 1
ultimate.cfg.vars["Cvar flag"] = 1

ultimate.cfg.vars["Net Convar"] = ""
ultimate.cfg.vars["Net Convar str"] = ""
ultimate.cfg.vars["Net Convar int"] = 1
ultimate.cfg.vars["Net Convar mode"] = 1

ultimate.cfg.vars["Name Convar"] = ""
ultimate.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
ultimate.cfg.vars["Name stealer"] = false
ultimate.cfg.vars["Auto reconnect"] = false

ultimate.cfg.vars["Chat spammer"]       = false
ultimate.cfg.vars["Hook Admin"]     = false
ultimate.cfg.vars["Spawn prop"]       = false
ultimate.cfg.vars["Spawn prop name"]       = "models/xqm/jetbody3_s5.mdl"
ultimate.cfg.vars["Chat mode"]          = 1
ultimate.cfg.vars["Chat group"]         = 1
ultimate.cfg.vars["Chat delay"]         = 1

ultimate.cfg.vars["Killsay"]            = false
ultimate.cfg.vars["Killsay mode"]          = 1
ultimate.cfg.vars["Killsay group"]         = 1

ultimate.cfg.vars["Retry on handcuff"] = false

// FTPToPos abuse xd )))
ultimate.cfg.vars["FSpec Teleport"] = false
ultimate.cfg.binds["FSpec Teleport"] = 0

ultimate.cfg.vars["FSpec Masskill"] = false
ultimate.cfg.binds["FSpec Masskill"] = 0

ultimate.cfg.vars["FSpec ClickTP"] = false
ultimate.cfg.binds["FSpec ClickTP"] = 0

ultimate.cfg.vars["FSpec Velocity"] = false
ultimate.cfg.binds["FSpec Velocity"] = 0

// Player visuals 
ultimate.cfg.vars["Player Line"]    = false
ultimate.cfg.vars["Player Hat"]    = false
ultimate.cfg.vars["LGBTHitbox"] = false

ultimate.cfg.vars["Box esp"]                    = false
ultimate.cfg.vars["Box style"]                  = 1
ultimate.cfg.vars["Show Priority"]  = false

ultimate.cfg.vars["Sight lines"]        = false

ultimate.cfg.vars["ESP Font"]                  = 1

ultimate.cfg.vars["Box gradient"]   = false

ultimate.cfg.colors["Box esp"]      = "255 255 255 255"
ultimate.cfg.colors["Box gradient"] = "0 255 255 255"

ultimate.cfg.vars["Box team color"] = false

ultimate.cfg.vars["Name"] = false
ultimate.cfg.vars["Name pos"] = 1

ultimate.cfg.vars["Mark"] = false
ultimate.cfg.vars["Mark pos"] = 1

ultimate.cfg.vars["Usergroup"] = false
ultimate.cfg.vars["Usergroup pos"] = 1

ultimate.cfg.vars["Team"] = false
ultimate.cfg.vars["Team pos"] = 1


ultimate.cfg.vars["Health"] = false
ultimate.cfg.vars["Health bar"] = false
ultimate.cfg.vars["Health bar gradient"] = false
ultimate.cfg.vars["Health pos"] = 4
ultimate.cfg.colors["Health"] = "0 255 0 255"
ultimate.cfg.colors["Health bar gradient"] = "255 45 0 255"


ultimate.cfg.vars["Armor"] = false
ultimate.cfg.vars["Armor bar"] = false
ultimate.cfg.vars["Armor bar gradient"] = false
ultimate.cfg.vars["Armor pos"] = 4
ultimate.cfg.colors["Armor"] = "    0 150 255 255"
ultimate.cfg.colors["Armor bar gradient"] = "72 255 72 255"

ultimate.cfg.vars["DarkRP Money"] = false
ultimate.cfg.vars["Money pos"] = 1

ultimate.cfg.vars["Weapon"] = false
ultimate.cfg.vars["Weapon pos"] = 1

ultimate.cfg.vars["Show ammo"] = false
ultimate.cfg.vars["Weapon printname"] = false
ultimate.cfg.vars["Show reload"] = false 

ultimate.cfg.vars["Break LC"] = false
ultimate.cfg.vars["Break LC pos"] = 1

ultimate.cfg.vars["Simtime updated"] = false
ultimate.cfg.vars["Simtime pos"] = 1

ultimate.cfg.colors["Skeleton"] = "255 255 255 255"
ultimate.cfg.vars["Skeleton"] = false

ultimate.cfg.vars["Player flags"] = false

ultimate.cfg.vars["Indicators"] = false
ultimate.cfg.vars["Player Tracker"] = false



// Chams
ultimate.cfg.vars["Visible chams"] = false
ultimate.cfg.vars["Visible chams w"] = false
ultimate.cfg.vars["Visible mat"] = 1
ultimate.cfg.colors["Visible chams"] = "0 255 255 255"

ultimate.cfg.vars["inVisible chams"] = false
ultimate.cfg.vars["inVisible chams w"] = false
ultimate.cfg.vars["inVisible mat"] = 1
ultimate.cfg.colors["inVisible chams"] = "255 255 0 255"

ultimate.cfg.vars["Supress lighting"] = false

ultimate.cfg.vars["Self chams"] = false
ultimate.cfg.vars["Self chams w"] = false
ultimate.cfg.vars["Self mat"] = 1
ultimate.cfg.colors["Self chams"] = "255 0 255 255"

ultimate.cfg.vars["Supress self lighting"] = false

ultimate.cfg.vars["Show records"] = false

ultimate.cfg.vars["Backtrack chams"] = false
ultimate.cfg.vars["Backtrack material"] = 1
ultimate.cfg.vars["Backtrack fullbright"] = false
ultimate.cfg.colors["Backtrack chams"] = "255 128 255 255"
ultimate.cfg.vars["Backtrack skeleton"] = false
ultimate.cfg.vars["OOF Arrows"] = false
ultimate.cfg.vars["OOF Style"] = 1

ultimate.cfg.vars["qmenu unlock"] = false



ultimate.cfg.vars["On screen logs"] = false

ultimate.cfg.colors["On screen logs"] = "69 255 69 255"
ultimate.cfg.colors["Miss lagcomp"] = "69 69 255 255"
ultimate.cfg.colors["Miss spread"] = "255 255 69 255"
ultimate.cfg.colors["Miss fail"] = "255 69 69 255"

ultimate.cfg.vars["Entity chams"] = false
ultimate.cfg.vars["Entity material"] = 1
ultimate.cfg.vars["Entity fullbright"] = false
ultimate.cfg.colors["Entity chams"] = "255 89 89 255"

ultimate.cfg.vars["Player outline"] = false
ultimate.cfg.vars["Entity outline"] = false
ultimate.cfg.colors["Player outline"] = "45 255 86 255"
ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

ultimate.cfg.vars["Outline style"] = 1 

ultimate.cfg.vars["ESP Distance"] = 3500

// Entity Esp
ultimate.cfg.binds["Ent add"] = 0
ultimate.cfg.vars["Ent box"] = false
ultimate.cfg.vars["Ent box style"] = 1
ultimate.cfg.vars["Ent class"] = false
ultimate.cfg.vars["Ent ESP Distance"] = 3500

ultimate.cfg.vars["Fresnel minimum illum"] = 0
ultimate.cfg.vars["Fresnel maximum illum"] = 1
ultimate.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
ultimate.cfg.vars["Hitmarker"] = false
ultimate.cfg.vars["Hit particles"] = false
ultimate.cfg.vars["Hitnumbers"] = false

ultimate.cfg.vars["Hitsound"] = false
ultimate.cfg.vars["Killsound"] = false

ultimate.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
ultimate.cfg.vars["Killsound str"] = "ambient/levels/canals/windchime2.wav"

ultimate.cfg.colors["Hit particles"] = "255 128 235 255"
ultimate.cfg.colors["Hitmarker"] = "255 155 25 255"
ultimate.cfg.colors["Hitnumbers"] = "255 255 255 255"
ultimate.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

// Name hide / visual misc

ultimate.cfg.vars["Hide name"] = false
ultimate.cfg.vars["Custom name"] = "Your mom"
ultimate.cfg.vars["Disable sensivity adjustment"] = false
ultimate.cfg.vars["Screengrab image"] = false


// Visuals 
ultimate.cfg.vars["Tickbase indicator"] = false
ultimate.cfg.vars["Spectator list"] = false
ultimate.cfg.vars["WaterMark"] = false
ultimate.cfg.vars["Crosshair"] = false
ultimate.cfg.colors["Crosshair"] = "255 0 0 255"
ultimate.cfg.vars["crossstyle"] = 1
ultimate.cfg.vars["RusEliteDetector"]   = false


ultimate.cfg.vars["Killsound"] = false

// World 
ultimate.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
ultimate.cfg.vars["Sky color"] = false 
ultimate.cfg.colors["Sky color"] = "145 185 245 255"
ultimate.cfg.vars["Wall color"] = false 
ultimate.cfg.colors["Wall color"] = "50 45 65 255"
ultimate.cfg.vars["Fullbright"] = false 
ultimate.cfg.vars["Fullbright mode"] = 1
ultimate.cfg.binds["Fullbright"] = 0
ultimate.cfg.vars["Disable shadows"] = false
ultimate.cfg.vars["FogChanger"] = false
ultimate.cfg.colors["FogChanger"] = "255 255 255 255"
ultimate.cfg.vars["FogStart"] = 1500
ultimate.cfg.vars["FogEnd"] = 3000
ultimate.cfg.vars["Color Modify"] = false
ultimate.cfg.vars["Color Modify Brightness"] = 0
ultimate.cfg.vars["Color Modify Contrast"] = 1
ultimate.cfg.vars["Color Modify Saturation"] = 3
ultimate.cfg.vars["Color Modify Add Red"] = 0
ultimate.cfg.vars["Color Modify Add Green"] = 0
ultimate.cfg.vars["Color Modify Add Blue"] = 0
ultimate.cfg.vars["Color Modify Mul Red"] = 0
ultimate.cfg.vars["Color Modify Mul Green"] = 0
ultimate.cfg.vars["Color Modify Mul Blue"] = 0

// Effects
ultimate.cfg.vars["Bullet tracers"] = false 
ultimate.cfg.colors["Bullet tracers"] = "255 65 65 255"
ultimate.cfg.vars["Bullet tracers material"] = "effects/beam_generic01" 
ultimate.cfg.vars["Tracers die time"] = 5 
ultimate.cfg.vars["Bullet tracers muzzle"] = false 

// View 
ultimate.cfg.vars["Third person"] = false
ultimate.cfg.binds["Third person"] = 0
ultimate.cfg.vars["Third person collision"] = false
ultimate.cfg.vars["Third person smoothing"] = false
ultimate.cfg.vars["Third person distance"] = 150

ultimate.cfg.vars["Free camera"] = false
ultimate.cfg.binds["Free camera"] = 0
ultimate.cfg.vars["Free camera speed"] = 25


ultimate.cfg.vars["Override view"] = true

ultimate.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")

ultimate.cfg.vars["Aspect ratio"] = 0

ultimate.cfg.vars["Viewmodel changer"] = false

ultimate.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

ultimate.cfg.vars["Viewmodel chams"] = false
ultimate.cfg.colors["Viewmodel chams"] = "75 95 128 255"
ultimate.cfg.vars["Viewmodel chams type"] = 1
ultimate.cfg.vars["Fullbright viewmodel"] = false

ultimate.cfg.vars["chams_hand"] = false
ultimate.cfg.colors["chams_hand"] = "75 95 128 255"
ultimate.cfg.vars["chams_hand_mat"] = 1
ultimate.cfg.vars["fullbright hands"] = false

ultimate.cfg.vars["Viewmodel manip"] = false
ultimate.cfg.vars["Viewmodel x"] = 0
ultimate.cfg.vars["Viewmodel y"] = 0
ultimate.cfg.vars["Viewmodel z"] = 0
ultimate.cfg.vars["Viewmodel r"] = 0
ultimate.cfg.vars["Viewmodel p"] = 0
ultimate.cfg.vars["Viewmodel ya"] = 0

ultimate.cfg.vars["Ghost follower"] = false
ultimate.cfg.vars["GFID"] = "SteamID"

// Misc

ultimate.cfg.vars["Use spam"] = false
ultimate.cfg.vars["Flashlight spam"] = false
ultimate.cfg.vars["Auto GTA"] = false
ultimate.cfg.vars["Camera spam"] = false
ultimate.cfg.vars["Keypad Cracker"] = false
ultimate.cfg.vars["sboxcrasher"] = false



ultimate.cfg.vars["Config name"] = "new"
ultimate.cfg.vars["Selected config"] = 1

ultimate.cfg.friends = {}
ultimate.cfg.ents = {}

do 
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math.Round(1 / flTickInterval))

	RunConsoleCommand("cl_cmdrate", tickrate)
	RunConsoleCommand("cl_updaterate", tickrate)

	RunConsoleCommand("cl_interp", "0")
	RunConsoleCommand("cl_interp_ratio", "0")

    ultimate.cfg.vars["Shift ticks"] = maxshift
    ultimate.cfg.vars["Charge ticks"] = maxshift
    
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
*/

ultimate.onScreenLogs = {}
ultimate.firedShots = 0
ultimate.HitLogsWhite = Color( 225, 225, 225 )
ultimate.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}

 





// Config save / load

if not file.Exists( "data/ultimate", "GAME" ) then 
    file.CreateDir("ultimate") 
end

if not file.Exists( "ultimate/default.txt", "DATA" ) then 
    file.Write( "ultimate/default.txt", util.TableToJSON( ultimate.cfg, false ) ) 
end


ultimate.cfgTable = {}

function ultimate.fillConfigTable()
    local ftbl = file.Find("ultimate/*.txt", "DATA")
    ultimate.cfgTable = {}

    if not ftbl or #ftbl == 0 then return end

    for i = 1, #ftbl do
        local str = ftbl[i] 
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        ultimate.cfgTable[#ultimate.cfgTable + 1] = f
    end
end

ultimate.fillConfigTable()


-- дабл кап

ultimate.bruteforce = ultimate.bruteforce or {
    angles = {-180, -135, -90, -45, 0, 45, 90, 135, 180},
    currentIndex = 1,
    hitAngles = {},
    missCount = {},
    lastHitTime = 0
}

function ultimate.DoBruteforce(cmd)
    if not ultimate.cfg.vars["angle_bruteforce"] then return end
    
    local pLocal = LocalPlayer()
    if not IsValid(pLocal) or not pLocal:Alive() then return end

    local target = ultimate.SelectTarget(cmd)
    if not IsValid(target) then return end
    
    local angleToUse = ultimate.bruteforce.angles[ultimate.bruteforce.currentIndex]
    
    if pLocal:GetEyeTrace().Entity == target and CurTime() - ultimate.bruteforce.lastHitTime > 0.1 then
        ultimate.bruteforce.lastHitTime = CurTime()
        ultimate.bruteforce.hitAngles[target:SteamID()] = angleToUse
    else
        if ultimate.bruteforce.hitAngles[target:SteamID()] then
            angleToUse = ultimate.bruteforce.hitAngles[target:SteamID()]
        else
            ultimate.bruteforce.currentIndex = ultimate.bruteforce.currentIndex + 1
            if ultimate.bruteforce.currentIndex > #ultimate.bruteforce.angles then
                ultimate.bruteforce.currentIndex = 1
            end
        end
    end
    
    -- Применяем угол
    local viewAngles = cmd:GetViewAngles()
    viewAngles.y = viewAngles.y + angleToUse
    cmd:SetViewAngles(viewAngles)
end

function ultimate.SaveConfig()
    local tojs = util.TableToJSON(ultimate.cfg, false)
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]

    if str then
        file.Write("ultimate/" .. str .. ".txt", tojs)
    else
        print("Error: Selected config not found.")
    end
end

function ultimate.LoadConfig()
    local str = ultimate.cfgTable[ultimate.cfg.vars["Selected config"]]
    //print(ultimate.cfg.vars["Selected config"])

    if not str or not file.Exists("ultimate/" .. str .. ".txt", "DATA") then
        print("Error: Config file not found.")
        return
    end

    local read = file.Read("ultimate/" .. str .. ".txt", "DATA")
    local totbl = util.JSONToTable(read)
    if not totbl then
        print("Error: Failed to parse config file.")
        return
    end

    local ConfigName = ultimate.cfg.vars["Config name"]
    local SelectedConfig = ultimate.cfg.vars["Selected config"]

    for k, v in pairs(totbl) do
        for key, value in pairs(v) do
            local tbl = ultimate.cfg
            
            if k == "vars" then
                tbl = ultimate.cfg.vars
            elseif k == "colors" then
                tbl = ultimate.cfg.colors
            elseif k == "binds" then
                tbl = ultimate.cfg.binds
            elseif k == "binds" then
                tbl = ultimate.cfg.binds
            elseif k == "friends" then
                tbl = ultimate.cfg.friends
            elseif k == "ents" then
                tbl = ultimate.cfg.ents
            end
            
            tbl[key] = value 
        end
    end

    ultimate.cfg.vars["Config name"] = ConfigName
    ultimate.cfg.vars["Selected config"] = SelectedConfig

    ded.SetInterpolation(ultimate.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(ultimate.cfg.vars["Disable Sequence interpolation"])
    ded.EnableAnimFix(ultimate.cfg.vars["Update Client Anim fix"])
    ded.EnableBoneFix(ultimate.cfg.vars["Bone fix"])

    ded.SetMaxShift(ultimate.cfg.vars["Charge ticks"])
    ded.SetMinShift(ultimate.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(ultimate.cfg.vars["Tickbase shift"])
end

function ultimate.CreateConfig()
    local str = ultimate.cfg.vars["Config name"]

    if str then
        file.Write("ultimate/" .. str .. ".txt", "")
        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Config name not specified.")
    end
end

function ultimate.DeleteConfig()
    local selectedConfigId = ultimate.cfg.vars["Selected config"]
    local str = ultimate.cfgTable[selectedConfigId]

    if str then
        file.Delete("ultimate/" .. str .. ".txt")

        table.remove(ultimate.cfgTable, selectedConfigId)

        if #ultimate.cfgTable > 0 then
            ultimate.cfg.vars["Selected config"] = 1
        else
            ultimate.cfg.vars["Selected config"] = nil
        end

        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Selected config not found.")
    end
end


function ultimate.TIME_TO_TICKS(time)
	return math.floor(0.5 + time / flTickInterval)
end

function ultimate.TICKS_TO_TIME(ticks)
    return flTickInterval * ticks
end

function ultimate.ROUND_TO_TICK(time)
    return ultimate.TICKS_TO_TIME(ultimate.TIME_TO_TICKS(time))
end


local Utility = {}

function Utility.TimeToTicks( flTime )
    return math.floor( 0.5 + flTime / flTickInterval )
end

/*
    Materials 
*/

ultimate.chamsMaterials = {
    "Flat", 
    "Wireframe",
    "Selfillum",
    "Selfillum additive",
    "Metallic",
    "Glass",
    "Glowing glass"
}


/*
    Detours 
*/

do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if ultimate.cfg.vars["Hide name"] and self == pLocalPlayer then
            return ultimate.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









ultimate.ui = {}

ultimate.validsnd = false 


ultimate.activetab = "Aimbot"
ultimate.multicombo = false


ultimate.hint = false
ultimate.hintText = ""
ultimate.hintX = 0
ultimate.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input.GetCursorPos()

        if ( x == 0 && y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( !StoredCursorPos.x || !StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end
do
    local PANEL = {}

    PANEL.FadeTime = 0

    function PANEL:Init()
        self:SetFocusTopLevel(true)
        self:SetSize(800, 650)

        self:SetPaintBackgroundEnabled(false)
        self:SetPaintBorderEnabled(false)
        self:DockPadding(5, 60, 5, 5)
        self:MakePopup()
        self:Center(true)

        PANEL.TopPanel = self:Add("DPanel")
        PANEL.TopPanel:SetPos(5, 30)
        PANEL.TopPanel:SetSize(850, 25)
        
        function PANEL.TopPanel:Paint(w, h)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawRect(0, 24, w, 1)
        end
    end

    function PANEL:Think()
        local x, y = input.GetCursorPos()
        local mousex = math.Clamp(x, 1, ScrW() - 1)
        local mousey = math.Clamp(y, 1, ScrH() - 1)

        if self.Dragging then
            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]
            self:SetPos(x, y)
        end

        self:SetCursor("arrow")

        ultimate.accent = HSVToColor((CurTime() * 25) % 360, 1, 1)
        ultimate.accent.r = math.Clamp(ultimate.accent.r, 128, 255)
        ultimate.accent.g = math.Clamp(ultimate.accent.g, 128, 255)
        ultimate.accent.b = math.Clamp(ultimate.accent.b, 128, 255)
    end

    function PANEL:IsActive()
        if self:HasFocus() then return true end
        if vgui.FocusedHasParent(self) then return true end
        return false
    end

    function PANEL:OnMousePressed()
        local x, y = input.GetCursorPos()
        local screenX, screenY = self:LocalToScreen(0, 0)

        if y < (screenY + 850) then
            self.Dragging = {x - self.x, y - self.y}
            self:MouseCapture(true)
            return
        end
    end

    function PANEL:OnMouseReleased()
        self.Dragging = nil
        self.Sizing = nil
        self:MouseCapture(false)  
    end

function PANEL:Paint(w, h)

    surface.SetDrawColor(theme["Frame background"])
    draw.RoundedBox(8, 0, 0, w, h, theme["Frame background"])
    
    -- верхняя панель
    -- крч шоб изменить ебаный градиент меняешь число 188(ЭТО КОРОЧ ТЕМНЫЙ ЦВЕТ 188 ДЛЯ ТУПЫХ)
    for y = 0, 24 do
        local t = y / 24 
        local r = 188 + (255 - 188) * t
        local g = 188 + (255 - 188) * t
        local b = 188 + (255 - 188) * t
        surface.SetDrawColor(math.floor(r), math.floor(g), math.floor(b))
        surface.DrawRect(0, y, w, 1)
    end
    
    surface.SetFont("BudgetLabel")
    surface.SetTextColor(206, 0, 0)
    surface.SetTextPos(310, 6) 
    surface.DrawText("KA3AXHACK local edition")
end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui.Register("UFrame", PANEL, "EditablePanel")
end



do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )

        local vbar = self.VBar
        vbar:SetWide(3)
    
        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil
    
        function vbar.btnGrip:Paint( w, h ) 
            surface.SetDrawColor( ultimate.Colors[54] )
            surface.DrawRect( 0, 0, w, h )
        end
    end

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    vgui.Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( Color(107, 107, 107) )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )

   
        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( Color(180, 180, 180) )
        surface.SetTextPos( 8, 2 ) 
        surface.DrawText( self.txt ) 

        surface.SetDrawColor(Color(107, 107, 107))
        surface.DrawRect( 0, 20, w, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end
    
    vgui.Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( Color(107, 107, 107) )
        surface.DrawRect( 0, 0, w, h )
    end
    
    vgui.Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )
        
    end
    
    vgui.Register( "UCBPanel", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("DermaSmall")
        self.Label:SetTextColor(ultimate.Colors[165])

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface.SetDrawColor(146,146,146)

            surface.DrawOutlinedRect(0,0,w,h,1)

            if !v and !self:IsHovered() then return end

            if v then
                surface.SetDrawColor(ultimate.Colors[54])
            else
                surface.SetDrawColor(ultimate.Colors[40])
            end
                
            surface.DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0
    
        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )
    
        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )
    
    end
    
    vgui.Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")
    
    function PANEL:Init()
        self:SetMouseInputEnabled(true)
    
        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0
    
        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(15)
    end
    
    function PANEL:OnCursorMoved(x, y)
        if !self.Dragging then return end
    
        local w, h = self:GetSize()
    
        x = math.Clamp(x, 0, w) / w
        y = math.Clamp(y, 0, h) / h
    
        local value = self.Min + (self.Max - self.Min) * x
        value = math.Round(value, self:GetDecimals())
    
        self:SetValue(value)
        self:SetSlideX(x)
    
        self:OnValueChanged(value)
    
        self:InvalidateLayout()
    end
    
    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)
    
        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end
    
    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
    end
    
    function PANEL:OnValueChanged(value)
    
    end

    function PANEL:Paint(w,h)
        local min, max = self:GetMin(), self:GetMax()

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end
    
    vgui.Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)    
    end

    vgui.Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(ultimate.Colors[245])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end
    end

    vgui.Register( "UESPPButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(ultimate.Colors[222])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end

    function PANEL:OpenMenu( pControlOpener )
    

        if ( pControlOpener && pControlOpener == self.TextEntry ) then
            return
        end
    
        -- Don't do anything if there aren't any options..
        if ( #self.Choices == 0 ) then return end
    
        -- If the menu still exists and hasn't been deleted
        -- then just close it and don't open a new one.
        if ( IsValid( self.Menu ) ) then
            self.Menu:Remove()
            self.Menu = nil
        end
    
        -- If we have a modal parent at some level, we gotta parent to that or our menu items are not gonna be selectable
        local parent = self
        while ( IsValid( parent ) && !parent:IsModal() ) do
            parent = parent:GetParent()
        end
        if ( !IsValid( parent ) ) then parent = self end
    
        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            surface.SetDrawColor(ultimate.Colors[24])
            surface.DrawRect(0,0,w,h)
            surface.SetDrawColor(ultimate.Colors[54])
            surface.DrawOutlinedRect(0,-1,w,h+1)
        end

        for k, v in pairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
            option.txt = option:GetText()
            option:SetText("")

            function option:Paint(w,h)
                if self:IsHovered() then 
                    surface.SetDrawColor( ultimate.Colors[ 32 ] )
                    surface.DrawRect( 1, 1, w - 2, h - 2 )
                end

                surface.SetTextColor(ultimate.Colors[165])

                surface.SetTextColor( ultimate.Colors[165] )
                surface.SetTextPos( 10, 4 ) 
                surface.DrawText( option.txt ) 
            end   

            if ( self.Spacers[ k ] ) then
                self.Menu:AddSpacer()
            end
        end

    
        local x, y = self:LocalToScreen( 0, self:GetTall() )
    
        self.Menu:SetMinimumWidth( self:GetWide() )
        self.Menu:Open( x, y, false, self )
    
        self:OnMenuOpened( self.Menu )
    
    end
    
    function PANEL:PerformLayout(s)
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    vgui.Register( "UComboBox", PANEL, "DComboBox" )
end




do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )
    end

    function PANEL:UpdateText()

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( !str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(ultimate.Colors[202])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() && self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui.Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)
        
        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface.SetDrawColor( ultimate.Colors[255] )
            surface.SetMaterial( ultimate.Materials["Alpha grid"] )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        surface.SetDrawColor(self.Color)
        surface.DrawRect(0,0,w,h)
    end

    vgui.Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui.Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end 

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[ 25 ] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui.Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end
        
            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( !ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder != 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( !self:GetHideHeaders() )

        end

    end

    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( !Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = !alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )
            
            surface.SetDrawColor( c, c, c )
            surface.DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( !IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( !bMultiSelect && !bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( !line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() && Line.m_fClickTime && ( !bMultiSelect || bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( !bMultiSelect || bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( !IsValid( a ) ) then return true end
            if ( !IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) != b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) != b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) != b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) != b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) || a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) || b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) && isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( !Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui.Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[24] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 18 )
        self:SetText( "..." )
    end

    vgui.Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui.Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end
    
        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
   
        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( ultimate.Colors[165] )
        surface.SetTextPos( 8, 2 ) 
        surface.DrawText( self.txt ) 

        surface.SetDrawColor( ultimate.Colors[ 54 ] )
        surface.DrawRect( 6, 20, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui.Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

ultimate.ui.ColorWindow = false
ultimate.ui.SettingsPan = false
ultimate.ui.MultiComboP = false

function ultimate.ui.RemovePanel( pan )
    if not pan then return end 

    pan:Remove()
    pan = false
end

function ultimate.ui.Binder( cfg, par )
    local b = vgui.Create( "UBinder", par )
    b:SetValue( ultimate.cfg.binds[ cfg ] )

    function b:OnChange()
        ultimate.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function ultimate.ui.ColorPicker( cfg, par, onChange )
    local b = vgui.Create( "UCPicker", par )

    function b:DoClick()
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.ColorWindow )

        ultimate.ui.ColorWindow = vgui.Create( "UColorPanel" )
        ultimate.ui.ColorWindow:SetPos( x+25, y-100 )

        local c = vgui.Create( "UColorMixer", ultimate.ui.ColorWindow )
        c:SetColor( string.ToColor( ultimate.cfg.colors[cfg] ) )

        c.HSV.Knob:SetSize( 5, 5 )

        function c.HSV.Knob:Paint( w, h )
            surface.SetDrawColor( b.Color )
            surface.DrawRect( 0, 0, w, h )

            surface.SetDrawColor( ultimate.Colors[165] )
            surface.DrawOutlinedRect( 0, 0, w, h, 1 )
        end

        function c:ValueChanged( col )
            b.Color = col 
            ultimate.cfg.colors[cfg] = tostring(col.r) .. " " .. tostring(col.g) .. " " .. tostring(col.b) .. " " .. tostring(col.a)
            if onChange then onChange( col ) end
        end

    end

    b.Color = string.ToColor( ultimate.cfg.colors[cfg] )
end

function ultimate.ui.SPanel( func, p )
    local b = vgui.Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input.GetCursorPos()

        ultimate.ui.RemovePanel( ultimate.ui.SettingsPan )

        ultimate.ui.SettingsPan = vgui.Create( "USettingsPanel" )
        ultimate.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function ultimate.ui.Label( pan, str, postCreate )
    local p = vgui.Create( "UCBPanel", pan )

    local lbl = vgui.Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "DermaSmall" )
    lbl:SetTextColor( ultimate.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end
    
function ultimate.ui.CheckBox(par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate)
    local p = vgui.Create("UCBPanel", par)

    local c = vgui.Create("UCheckboxLabel", p)
    c:SetText(lbl)
    c:SetPos(0, 0)
    c:SetValue(ultimate.cfg.vars[cfg])
    c:SetTextColor(Color(107, 107, 107))

    function c:OnChange(bval)
        ultimate.cfg.vars[cfg] = bval
        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate(p) end

    if bind then ultimate.ui.Binder(cfg, p) end
    if color then ultimate.ui.ColorPicker(cfg, p) end
    if spanel then ultimate.ui.SPanel(spanel, p) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input.GetCursorPos()
                ultimate.hint = true
                ultimate.hintText = hint
                ultimate.hintX = x + 45
                ultimate.hintY = y - 5
            end
        end
    end
end
function ultimate.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui.Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface.SetFont("DermaSmall")

        local s = ultimate.cfg.vars[cfg]
        local tw, th = surface.GetTextSize(s)
        
        surface.SetTextColor( ultimate.Colors[165] )

        surface.SetTextPos( 2, 4 ) 
        surface.DrawText( str ) 

        surface.SetTextPos( w - tw - 2, 4 ) 
        surface.DrawText( ultimate.cfg.vars[cfg] ) 
    end

    local c = vgui.Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( ultimate.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        ultimate.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function ultimate.ui.Button( str, func, p ) 
    local b = vgui.Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function ultimate.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local p = vgui.Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end
	
	local txt = vgui.Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4) 
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "DermaSmall" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(ultimate.Colors[165])

	if ultimate.cfg.vars[cfg] != nil and ultimate.cfg.vars[cfg] != "" then
		txt:SetValue(ultimate.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if ultimate.cfg.vars[cfg] == txt:GetValue() then return end

		ultimate.cfg.vars[cfg] = txt:GetValue()
	end 

	function txt.OnValueChange()
		ultimate.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function ultimate.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")
    
    function b:Paint(w,h)
        if self:IsHovered() then 
            surface.SetDrawColor( ultimate.Colors[ 32 ] )
            surface.DrawRect( 1, 1, w - 2, h - 2 )
        end

        surface.SetTextColor(ultimate.Colors[165])

        if ultimate.cfg.vars[str.."-"..v] then
            surface.SetTextColor(ultimate.Colors[235]) 
        end

        surface.SetTextPos(5,3)
        surface.SetFont("DermaSmall")
        surface.DrawText(v)
    end

    function b:DoClick()
        ultimate.cfg.vars[str.."-"..v] = not ultimate.cfg.vars[str.."-"..v] 
    end
end

function ultimate.ui.MultiCombo( pan, str, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local d = vgui.Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")
    
    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if ultimate.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table.insert(d.preview,v) 
            elseif ultimate.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table.RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then 
                table.RemoveByValue(d.preview,v)
            end
        end

        preview = table.concat(d.preview,", ")

        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(8,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText(preview)
    
        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)
    
        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.MultiComboP )

        local ctoh = #choices
    
        ultimate.ui.MultiComboP = vgui.Create( "ULifeTimeBase" )
        ultimate.ui.MultiComboP:SetPos( x, y - 1 )
        ultimate.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )
    
        for k, v in pairs(choices) do
            ultimate.ui.dropdownButton( str, v, ultimate.ui.MultiComboP, d.preview )
        end
    end
end

function ultimate.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local dropdown = vgui.Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)
    
    if ultimate.presets[ cfg ] then
        choices = ultimate.presets[ cfg ]
    end 
    
    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end
    
    dropdown:SetSortItems(false)

    if ultimate.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(ultimate.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        ultimate.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function ultimate.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui.Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function ultimate.ui.MTButton( p, str, postCreate )
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        p.ActiveTab = str
        ultimate.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface.SetTextColor(235,235,235,255)
        else
            surface.SetTextColor(165,165,165,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(str)
    end

    p.ActiveTab = str
    ultimate.ui.InitMT( p, postCreate )
end

ultimate.pty = { 5, 5, 5 }
do
    local xt = { 
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function ultimate.itemPanel( str, tbl, h )
        local p = vgui.Create( "UPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

    function ultimate.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui.Create( "UButtonBarPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop 
*/

ultimate.espposes = {"Up","Down","Right","Left"}
ultimate.espelements = {"Name pos", "Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
ultimate.lastdrag = ""
ultimate.esppans = {}

ultimate.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    ultimate.esppans[i] = {}
end

function ultimate.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos
        
        for i = 1, #panels do
            local v = panels[i]

            ultimate.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end
    
ultimate.spfuncs = {}

// PANEL CREATION

ultimate.frame = vgui.Create("UFrame")
ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

ultimate.tabs = {}

// Aimbot

ultimate.spfuncs[30] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Force seed", "Force seed" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for seed", "Wait for seed" )

    
end

ultimate.spfuncs[32] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

function ultimate.tabs.Aimbot()

    local p = ultimate.itemPanel("Main",1,160):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable aimbot", "Enable aimbot", false, false, false, false, false, function( p ) ultimate.ui.Binder( "Aim on key", p ) end )
    ultimate.ui.CheckBox( p, "Silent aim", "Silent aim" )
    ultimate.ui.CheckBox( p, "pSilent", "pSilent", "Make aim completely invisible." )
    ultimate.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, ultimate.spfuncs[2] )
    ultimate.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )

    local p = ultimate.itemPanel("Legit",1,120):GetItemPanel()

    ultimate.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, ultimate.spfuncs[4] )
    ultimate.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, ultimate.spfuncs[5] )
    ultimate.ui.CheckBox( p, "Triggerbot", "Trigger bot", false, true )

    local p = ultimate.itemPanel( "Visualisation", 1, 170 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "FOV Circle", "Show FOV", false, false, true )
    ultimate.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    ultimate.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true ) 
    ultimate.ui.CheckBox( p, "Box Wall", "Box Wall" )
    ultimate.ui.CheckBox( p, "Kill Effect", "Kill effect" )
    ultimate.ui.CheckBox( p, "Kill Feed", "localkillfeed" )


    local p = ultimate.itemPanel( "Accuracy", 2, 80 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Compensate recoil", "Norecoil" )
    ultimate.ui.CheckBox( p, "Compensate spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, ultimate.spfuncs[30] )

    local p = ultimate.itemPanel( "Prediction", 2, 80 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Projectile aimbot", "Projectile aimbot" )
    ultimate.ui.CheckBox( p, "TF2 weapons predict", "TF2 Predict" )

    local p = ultimate.itemPanel("Knife bot",2,120):GetItemPanel()

    ultimate.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false )
    ultimate.ui.ComboBox( p, "Knifebot mode", "Knifebot mode"  )
    ultimate.ui.CheckBox( p, "Facestab", "Facestab" )



    local p = ultimate.itemPanel("Auto health",2,100):GetItemPanel()

    ultimate.ui.CheckBox( p, "Auto healthkit", "Autohealthkit", false, false, false )
    ultimate.ui.CheckBox( p, "Healthkit-Self heal", "Healthkit-Self heal"  )
    ultimate.ui.CheckBox( p, "Healthkit-Heal closest", "Healthkit-Heal closest" )

    local p = ultimate.itemPanel( "Target selection", 3, 245 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" } )
    ultimate.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )
    ultimate.ui.CheckBox( p, "Wallz", "Wallz" ) 
    ultimate.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )
    ultimate.ui.Slider( p, "Max distance", "Max distance", 0, 50000, 0 )
    ultimate.ui.CheckBox( p, "Priority List", "Enable Priority List")
    local p = ultimate.itemPanel( "Crossbow pred", 1, 100 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction", "use without silent aim" )
    ultimate.ui.Slider( p, "Simulation limit", "Simulation limit", 1, 10, 2 )

    local p = ultimate.itemPanel( "Hitbox selection", 3, 280 ):GetItemPanel()

    ultimate.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    ultimate.ui.CheckBox( p, "Hitscan", "Hitscan" ) 
    //ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )
    ultimate.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.CheckBox( p, "Multipoint", "Multipoint" ) 
    ultimate.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ultimate.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )

    local p = ultimate.itemPanel( "Tickbase", 2, 100 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "LagCompensation", "LagCompensation", "Compensate ping loss" )
    ultimate.ui.CheckBox( p, "LerpTime abjust", "LerpTime", "abuse lerptime target" )
    ultimate.ui.CheckBox( p, "Lag fix" , "Lag fix", "idk work or not", false, false, false, ultimate.spfuncs[254] )
end





ultimate.spfuncs[22] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid"})
    ultimate.ui.MultiCombo( ultimate.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

ultimate.spfuncs[24] = function( p )
   
end

ultimate.spfuncs[36] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Antiaim material", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Antiaim fullbright" )
end

function ultimate.tabs.Rage()
    local p = ultimate.itemPanel( "Angles", 1, 245 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    ultimate.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    ultimate.ui.ComboBox( p, "Yaw base", "Yaw base" )
    ultimate.ui.ComboBox( p, "Yaw", "Yaw" )
    ultimate.ui.ComboBox( p, "Pitch", "Pitch" )
    ultimate.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = ultimate.itemPanel( "Tweaks", 1, 155 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "On shot aa", "On shot aa" )
    ultimate.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    ultimate.ui.CheckBox( p, "Freestanding", "Freestanding" )
    ultimate.ui.CheckBox( p, "Micromovement", "Micromovement" )
    ultimate.ui.CheckBox( p, "Anti Brute-Force", "Anti-BruteForce" )

    local p = ultimate.itemPanel( "Custom angles", 1, 400 ):GetItemPanel()

    ultimate.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    ultimate.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    ultimate.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )
    ultimate.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    ultimate.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    ultimate.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    ultimate.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    ultimate.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )

    local p = ultimate.itemPanel( "Fake lag",2,110 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, ultimate.spfuncs[22] )
    ultimate.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    ultimate.ui.CheckBox( p, "Mohammad exploit", "Air lag duck" )
    ultimate.ui.CheckBox( p, "Jesus exploit", "Jesus lag" )

    local p = ultimate.itemPanel( "Visualisation", 2,75 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, ultimate.spfuncs[36], false, function( p ) ultimate.ui.ColorPicker( "Real chams", p ) end ) 
    ultimate.ui.CheckBox( p, "Angle arrows", "Angle arrows" )

    local p = ultimate.itemPanel( "Animation breaker", 2, 160 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    ultimate.ui.ComboBox( p, "Taunt", "Taunt", ultimate.actCommands )
    ultimate.ui.CheckBox( p, "Handjob", "Handjob" )
    ultimate.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )

    local p = ultimate.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    ultimate.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    ultimate.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    ultimate.ui.CheckBox( p, "Double tap", "Double tap" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Passive recharge", "Passive recharge" )
    ultimate.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    //ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for charge", "Wait for charge", false, false, false, false, function(b) ded.WaitForCharge(b) end ) 
    ultimate.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true ) 
    
    ultimate.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    ultimate.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

    local p = ultimate.itemPanel( "SECRETS", 2, 55 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Secret function(supermiss)", "Sequence manip", false, true )

    local p = ultimate.itemPanel( "Player adjustments", 3, 160 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Interpolation", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    ultimate.ui.CheckBox( p, "T-pose", "TPOSE" )
    ultimate.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    ultimate.ui.CheckBox( p, "Extrapolation", "Extrapolation" )
    ultimate.ui.CheckBox( p, "Legs Break", "leg_breaker" )

    local p = ultimate.itemPanel( "Resolver", 3, 120 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Resolver", "Resolver" )
    ultimate.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    ultimate.ui.CheckBox( p, "Taunt resolver", "Taunt resolver" )
    ultimate.ui.CheckBox( p, "DOUBLE CUP BRUTEFORCE", "DoBruteforce" )


    local p = ultimate.itemPanel( "Position adjustment", 3, 215 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    ultimate.ui.CheckBox( p, "Backtrack", "Backtrack" )
    ultimate.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    ultimate.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    ultimate.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    ultimate.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = ultimate.itemPanel( "Misc", 3, 215 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    ultimate.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )
    

    ultimate.ui.CheckBox( p, "Gun switch", "Gun switch" )
   
end

ultimate.spfuncs[2] = function()
    ultimate.ui.SettingsPan:SetSize(250,100)
        
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Wait for simulation", "Wait for simulation" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
end

ultimate.spfuncs[4] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 85 )

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

ultimate.spfuncs[5] = function()
    ultimate.ui.SettingsPan:SetSize( 250, 68 )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

ultimate.spfuncs[11] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Team color", "Box team color" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Box gradient" )
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "3D" })


end

ultimate.spfuncs[12] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Health bar", "Health bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

ultimate.spfuncs[666] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Armor bar", "Armor bar" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Gradient", "Armor bar gradient" )
end

ultimate.spfuncs[14] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Visible material", "Visible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Invisible material", "inVisible mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

ultimate.spfuncs[229] = function()
    ultimate.ui.SettingsPan:SetSize(250,360)
    
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Brightness","Color Modify Brightness", 0, 3, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Contrast","Color Modify Contrast", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Saturation","Color Modify Saturation", 0, 5, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add red","Color Modify Add Red", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add green","Color Modify Add Green", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Add blue","Color Modify Add Blue", 0, 10, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul red","Color Modify Mul Red", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul green","Color Modify Mul Green", 0, 255, 4 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Mul blue","Color Modify Mul Blue", 0, 255, 4 )
end

ultimate.spfuncs[15] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Self mat", ultimate.chamsMaterials)
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Weapon chams", "Self chams w" )

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

ultimate.spfuncs[16] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Backtrack material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

ultimate.spfuncs[17] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Entity material", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

ultimate.spfuncs[18] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Die time","Tracers die time",1,10,0 )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )
    
end

ultimate.spfuncs[19] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "Viewmodel chams type", ultimate.chamsMaterials)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

ultimate.spfuncs[20] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Collision", "Third person collision" )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

ultimate.spfuncs[21] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
end

ultimate.spfuncs[31] = function()
    ultimate.ui.SettingsPan:SetSize(250,48)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Style", "Ent box style", { "Default", "Corner", "3D" })
end


ultimate.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" ) 

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end 
    
    for i = 1,4 do
        local poses = ultimate.esppansposes

        ultimate.esppans[i].panel = vgui.Create( "UPaintedPanel", p )
        ultimate.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        ultimate.esppans[i].panel:SetSize(85,125)
        ultimate.esppans[i].panel:Receiver( "SwagCock$", ultimate.DoDrop )
        ultimate.esppans[i].panel.pos = i
    end

    for i = 1, #ultimate.espelements do
        local cfgstr = ultimate.espelements[i]
        local panel = ultimate.esppans[ultimate.cfg.vars[cfgstr]].panel

        local b = vgui.Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" ) 

        b:SetParent( panel )
    end
end

ultimate.spfuncs[33] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show ammo", "Show ammo" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Print name", "Weapon printname" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Show reloading", "Show reloading" )
    
end

ultimate.spfuncs[34] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Material", "chams_hand_mat", ultimate.chamsMaterials)

    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Fullbright", "fullbright hands" )
    
end

ultimate.spfuncs[124] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)
    
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel X","Viewmodel x", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Y","Viewmodel y", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Z","Viewmodel z", -50, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Pitch","Viewmodel p", -90, 90, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Yaw","Viewmodel ya", -90, 90, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Viewmodel Roll","Viewmodel r", -90, 90, 0 )
    
end

ultimate.spfuncs[909412421] = function()
    ultimate.ui.SettingsPan:SetSize(250,200)
    
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Team color", "Team colorSUCK" )
    
end

function ultimate.tabs.Visuals()

    local p = ultimate.itemPanel("Player",1,450):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Box esp", false, false, true, ultimate.spfuncs[11] )
    ultimate.ui.CheckBox( p, "[DB] Priority", "Show Priority" )
    ultimate.ui.CheckBox( p, "Name", "Name", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Health", "Health", false, false, true, ultimate.spfuncs[12], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Health bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Armor", "Armor", false, false, true, ultimate.spfuncs[666], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ultimate.ui.ColorPicker( "Armor bar gradient", p ) end )
    ultimate.ui.CheckBox( p, "Weapon", "Weapon", false, false, false, ultimate.spfuncs[33], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    ultimate.ui.CheckBox( p, "Team", "Team", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Money", "DarkRP Money", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Fake lags", "Simtime updated", false, false, false, false, false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ultimate.ui.CheckBox( p, "Show records", "Show records" )   
    ultimate.ui.CheckBox( p, "Skeleton", "Skeleton" )
    ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, false, false, function(p)
        local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow"} ) 
        lbl:Remove() 
        drop:Dock(RIGHT) 
        drop:DockMargin(0,0,0,0) 
    end )
    // ultimate.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, ultimate.spfuncs[34], false, function(p) local lbl, drop = ultimate.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    ultimate.ui.Slider( p, "Max distance","ESP Distance", 0, 20000,0 )
    ultimate.ui.CheckBox( p, "Player Line", "Player Line", "Visual Line" )
    ultimate.ui.CheckBox( p, "China Hat", "Player Hat","Visual Hat" )
    ultimate.ui.CheckBox( p, "Player Hitbox", "Player Hitbox" )

    local p = ultimate.itemPanel("Entity",1,135):GetItemPanel()

    ultimate.ui.CheckBox( p, "Box", "Ent box", false, false, false, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "Class", "Ent class" )
    ultimate.ui.Slider( p, "Max distance","Ent ESP Distance",0, 20000,0 )
    ultimate.ui.Label( p, "Add entity key", function( p ) ultimate.ui.Binder( "Ent add", p ) end )

    local p = ultimate.itemPanel( "Misc", 1, 200 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hide name", "Hide name" )
    ultimate.ui.TextEntry( "Custom name", "Custom name", p, 999 )
    ultimate.ui.CheckBox( p, "Disable sensivity adjustment", "Disable sensivity adjustment" )
    ultimate.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    ultimate.ui.ComboBox( p, "ESP Font", "ESP Font", { "Outlined", "Shadow" } )
    
    local p = ultimate.itemPanel("Colored models",2,170):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, ultimate.spfuncs[14], false, function(p) ultimate.ui.ColorPicker( "inVisible chams", p ) end )
    ultimate.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, ultimate.spfuncs[15] )
    ultimate.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, ultimate.spfuncs[16] )
    ultimate.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, ultimate.spfuncs[17], false )
    ultimate.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, ultimate.spfuncs[19], false )
    ultimate.ui.CheckBox( p, "Hand chams", "chams_hand", false, false, true, ultimate.spfuncs[34], false )

    local p = ultimate.itemPanel("Material customisation",2,150):GetItemPanel()

    ultimate.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ultimate.cfg.vars["Fresnel maximum illum"], ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
    
    ultimate.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], v, ultimate.cfg.vars["Fresnel exponent"] ) )
    end )
 
    ultimate.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ultimate.chamMats.vis[3], ultimate.chamMats.vis[4], ultimate.chamMats.invis[3], ultimate.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ultimate.cfg.vars["Fresnel minimum illum"], ultimate.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = ultimate.itemPanel("Outlines",2,115):GetItemPanel()

    ultimate.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    ultimate.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    ultimate.ui.ComboBox( p, "Style", "Outline style", { "Default", "Additive" } )

    local p = ultimate.itemPanel( "Indicators", 2, 180 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitmarker", "Hitmarker", false, false, true )
    ultimate.ui.CheckBox( p, "Hitnumbers", "Hitnumbers", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Hitnumbers krit", p ) end )
    //ultimate.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, ultimate.spfuncs[31] )
    ultimate.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) ultimate.ui.ColorPicker( "Miss lagcomp", p ) ultimate.ui.ColorPicker( "Miss spread", p ) ultimate.ui.ColorPicker( "Miss fail", p ) end )
    ultimate.ui.CheckBox( p, "Spectator list", "Spectator list" )
    ultimate.ui.CheckBox( p, "Tickbase", "Tickbase indicator" )
    ultimate.ui.CheckBox( p, "Indicators", "Indicators" )
    ultimate.ui.CheckBox( p, "WaterMark", "WaterMark" )


    local p = ultimate.itemPanel("World" ,3,420):GetItemPanel()

    ultimate.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    ultimate.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    ultimate.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )

    ultimate.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    ultimate.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    ultimate.ui.CheckBox( p, "Disable shadows", "Disable shadows" )

    ultimate.ui.CheckBox( p, "Fog changer", "FogChanger", false, false, true )
    ultimate.ui.Slider( p, "Fog start","FogStart", 1, 4200, 0 )
    ultimate.ui.Slider( p, "Fog end","FogEnd", 1, 9000, 0 )

    ultimate.ui.CheckBox( p, "Color modify", "Color Modify", false, false, false, ultimate.spfuncs[229] )

    ultimate.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, ultimate.spfuncs[18] )
    ultimate.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )


    local p = ultimate.itemPanel("View",3,235):GetItemPanel()

    ultimate.ui.CheckBox( p, "Override view", "Override view" )

    ultimate.ui.CheckBox( p, "Third person", "Third person", false, true, false, ultimate.spfuncs[20] )
    ultimate.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, ultimate.spfuncs[21] )

    ultimate.ui.Slider( p, "Fov override","Fov override",75,160,0 )
    ultimate.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    ultimate.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) RunConsoleCommand("r_aspectratio",val) end )
    ultimate.ui.CheckBox( p, "Viewmodel manip","Viewmodel manip", false, false, false, ultimate.spfuncs[124] )


    
    

   



    





    

    





    
    /*





    ultimate.checkbox("Kill sound","Killsound",p:GetItemPanel())
    

    local p = ultimate.itemPanel("World",2,123)

    

    local p = ultimate.itemPanel("Effects",2,142)


    
    

    local p = ultimate.itemPanel("View",3,275)




    // ultimate.ESPPP:Show()
*/
end

ultimate.spfuncs[25] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.ComboBox( ultimate.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    ultimate.ui.CheckBox( ultimate.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

ultimate.spfuncs[26] = function()
    ultimate.ui.SettingsPan:SetSize(250,256)

    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    ultimate.ui.Slider( ultimate.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

ultimate.spfuncs[27] = function( p )
    ultimate.ui.TextEntry( "Name", "Name Convar", p, 250 )
    ultimate.ui.Button( "Change name", function() ded.NetSetConVar("name",ultimate.cfg.vars["Name Convar"]) end, p )
    ultimate.ui.CheckBox( p, "Name stealer", "Name stealer" )

    ultimate.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    ultimate.ui.Button( "Disconnect", function() ded.NetDisconnect(ultimate.cfg.vars["Disconnect reason"]) end, p )
end 

function ultimate.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = ultimate.cfg.vars[m] 
    local num = ultimate.cfg.vars[n]
    local set = mode == 2 and math.Round( num ) or num

    if mode == 1 then set = ultimate.cfg.vars[s] end

    return set
end

ultimate.spfuncs[28] = function( p )
    ultimate.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    ultimate.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    ultimate.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    ultimate.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    ultimate.ui.Button( "Send new val", function() ded.NetSetConVar( ultimate.cfg.vars["Net Convar"] ,ultimate.CustomCvarVal( 1 ) ) end, p )
end 

ultimate.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

ultimate.spfuncs[29] = function( p )
    ultimate.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    ultimate.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    ultimate.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    ultimate.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})
    
    ultimate.ui.Button( "Change cvar", function()
        local s = ultimate.CustomCvarVal( 0 )
        local n = ultimate.cfg.vars["Cvar name"]
        
        local flag = GetConVar(n):GetFlags()

        ded.ConVarSetFlags( n, 0 )

        RunConsoleCommand( n, s )

        ded.ConVarSetFlags( n, flag )
    end, p )

    ultimate.ui.ComboBox( p, "Cvar flag", "Cvar flag", ultimate.FCVAR.str)

    ultimate.ui.Button( "Change flag", function()
        ded.ConVarSetFlags( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
        print( ultimate.cfg.vars["Cvar name"], ultimate.FCVAR.int[ ultimate.cfg.vars["Cvar flag"] ] )
    end, p )

end 

function ultimate.tabs.Misc()

    local function func( p )
        ultimate.ui.MTButton( p, "Cvar", ultimate.spfuncs[29] )
        ultimate.ui.MTButton( p, "Net cvar", ultimate.spfuncs[28] )
        ultimate.ui.MTButton( p, "Net", ultimate.spfuncs[27] )
    end

    local p = ultimate.itemPanel("Movement",1,205):GetItemPanel()

    ultimate.ui.CheckBox( p, "Bunny hop", "Bhop" )
    ultimate.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, ultimate.spfuncs[25] )
    ultimate.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, ultimate.spfuncs[26] )
    ultimate.ui.CheckBox( p, "Keep sprint", "Sprint" )
    ultimate.ui.CheckBox( p, "Fast stop", "Fast stop" )
    ultimate.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    ultimate.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    ultimate.ui.CheckBox( p, "Water walk", "Water jump" )

    local p = ultimate.itemPanel("Key spam",1,175):GetItemPanel()

    ultimate.ui.CheckBox( p, "Use spam", "Use spam" )
    ultimate.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    ultimate.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    ultimate.ui.CheckBox( p, "Camera spam", "Camera spam" )
    ultimate.ui.CheckBox( p, "Vape spam", "Vape spam" )
    ultimate.ui.CheckBox( p, "Retry on handcuff", "Retry on handcuff" )

    local p = ultimate.itemPanel( "Sounds", 2, 173 ):GetItemPanel()

    ultimate.ui.CheckBox( p, "Hitsound", "Hitsound" )
    ultimate.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    ultimate.ui.CheckBox( p, "Killsound", "Killsound" )
    ultimate.ui.TextEntry( "Sound path", "Killsound str", p, 420 )

    local p = ultimate.itemPanel("Chat",2,282):GetItemPanel()

    ultimate.ui.CheckBox( p, "Spammer", "Chat spammer" )
    ultimate.ui.ComboBox( p, "Mode", "Chat mode", { "Sacred quotes", "Domestic terrorist", "stepa terror", "White nationalist", "ultimate v4", "exechack.cc", "nato killsay" })
    ultimate.ui.ComboBox( p, "Group", "Chat group", { "Default", "OOC", "Advert", "PM", "ULX" })
    ultimate.ui.Slider( p, "Delay", "Chat delay", 0,20,0 )
    
    ultimate.ui.CheckBox( p, "Killsay", "Killsay" )
    ultimate.ui.ComboBox( p, "Mode", "Killsay mode", { "Sacred quotes", "Domestic terrorist", "stepa terror", "White nationalist", "ultimate v4", "exechack.cc", "nato killsay" })
    ultimate.ui.ComboBox( p, "Group", "Killsay group", { "Default", "OOC", "Advert", "PM", "ULX" })

    ultimate.itemPanelB( "Net / Cvar", 3, 310, func )

    local p = ultimate.itemPanel("Sandbox",2,170):GetItemPanel()
    ultimate.ui.CheckBox( p, "Spawner prop", "Spawn prop" )
    ultimate.ui.TextEntry( "Prop name", "Spawn prop name", p, 250 )
    ultimate.ui.CheckBox( p, "Give Admin", "Hook Admin" )
    ultimate.ui.CheckBox( p, "Unlock Q Menu", "qmenu unlock")
    ultimate.ui.CheckBox( p, "SandBox Crasher", "sboxcrasher")

    local p = ultimate.itemPanel("model changer",3,100):GetItemPanel()

    ultimate.ui.CheckBox( p, "ModelChanger player", "Modelchanger" )
    ultimate.ui.ComboBox( p, "ModelChanger model", "Modelchanger model", {"astolfo","protogen","walter","rusk", "niko", "george droyd", "wooman", "mark", "furry", "boykisser", "adidas combine"} )
    


    local p = ultimate.itemPanel("Memes",3,290):GetItemPanel()

    ultimate.ui.CheckBox( p, "Follow Player", "Ghost follower" )
    ultimate.ui.TextEntry( "Steam ID", "GFID", p, 500 )
    ultimate.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )
    ultimate.ui.CheckBox( p, "Keypad Cracker", "Keypad Cracker" )
    ultimate.ui.CheckBox( p, "Crosshair", "Crosshair", false, false, true, false )
    ultimate.ui.ComboBox( p, "Crosshair style", "crossstyle", {"Cross", "Nacist ebanny", "Для тех у кого отношения с мальчиками", "Watniy ebanat","бЛЯТЬ","skeleton","верталет"})
    ultimate.ui.CheckBox( p, "Ruselite detector", "RusEliteDetector", "Use only on RUSELITERP!!!!" )


   /*
        ultimate.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        ultimate.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        ultimate.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end


function ultimate.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b 

    for i = 1,255 do 
        ultimate.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end



function ultimate.tabs.Config()
    local p = ultimate.itemPanel("Settings",1,230):GetItemPanel()

    ultimate.ui.ComboBox( p, "Choice", "Selected config", ultimate.cfgTable)

    ultimate.ui.Button( "Load", function() ultimate.LoadConfig() end, p )
    ultimate.ui.Button( "Save", function() ultimate.SaveConfig() end, p )
    ultimate.ui.Button( "Delete", function() ultimate.DeleteConfig() end, p )

    ultimate.ui.TextEntry( "Name", "Config name", p, 64 )
    ultimate.ui.Button( "Create", function() ultimate.CreateConfig() end, p )

    //ultimate.ui.Label( p, "Menu color", function( p ) ultimate.ui.ColorPicker( "Menu color", p, ultimate.updateMenuColor ) end )
end

function ultimate.tabs.Players()
    local playerlist = player.GetAll()
    for i = 1, #playerlist do
        local pEntity = playerlist[ i ]
        local pButton = vgui.Create( "Panel", ultimate.scrollpanel )
        pButton:SetTall( 25 )
        pButton:Dock( TOP )
        function pButton:Paint( w, h )
            if not IsValid(pEntity) then self:Remove() return end
            local steamId = pEntity:SteamID()
            
            -- Проверяем, есть ли игрок в базе данных
            local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[steamId]
            
            -- Если игрок в базе, рисуем красный фон
            if isInDatabase then
                surface.SetDrawColor(50, 0, 0, 100) -- темно-красный фон
                surface.DrawRect(0, 0, w, h)
            end
            
            surface.SetFont( "DermaSmall" )
            
            -- Определяем цвет ника
            local nameColor = Color(255, 255, 255) -- белый по умолчанию
            if isInDatabase then
                nameColor = Color(255, 50, 50) -- ярко-красный для игроков из базы
            elseif ultimate.cfg.friends and ultimate.cfg.friends[steamId] then
                nameColor = Color(0, 255, 0) -- зеленый для друзей
            end
            
            -- Проверяем, является ли игрок другом
            local isFriend = ultimate.cfg.friends and ultimate.cfg.friends[steamId]
            
            -- Определяем цвет ника
            local nameColor = Color(255, 255, 255) -- белый по умолчанию
            if isInDatabase then
                nameColor = Color(255, 50, 50) -- ярко-красный для игроков из базы
            elseif isFriend then
                nameColor = Color(0, 255, 0) -- зеленый для друзей (если не в базе)
            end
            
            -- Рисуем индикатор слева для игроков из базы
            local nameStartX = 10
            if isInDatabase then
                surface.SetTextColor(255, 200, 0)
                surface.SetTextPos(2, 5)
                surface.DrawText("⚠") -- предупреждающий знак
                nameStartX = 15
            end
            
            -- Рисуем ник
            surface.SetTextColor(nameColor.r, nameColor.g, nameColor.b)
            surface.SetTextPos(nameStartX, 5)
            surface.DrawText(pEntity:Name())
            
            -- Добавляем индикаторы справа от ника
            local nameWidth = surface.GetTextSize(pEntity:Name())
            local indicatorX = nameStartX + nameWidth + 5
            
            -- Индикатор базы данных
            if isInDatabase then
                surface.SetTextColor(255, 0, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[DB]")
                indicatorX = indicatorX + surface.GetTextSize("[DB]") + 3
            end
            
            -- Индикатор друга
            if isFriend then
                surface.SetTextColor(0, 255, 0)
                surface.SetTextPos(indicatorX, 5)
                surface.DrawText("[F]") -- Friend
                -- Альтернативы: "♥", "★", "[FRIEND]"
            end
            
            -- Команда/группа (по центру)
            local teamIndex, teamName, teamColor = ultimate.GetTeam(pEntity)
            local textWidth, textHeight = surface.GetTextSize(teamName)
            surface.SetTextColor(teamColor)
            surface.SetTextPos(w / 2 - textWidth / 2, 5)
            surface.DrawText(teamName)
            
            -- Пользовательская группа (справа)
            local userGroup = ultimate.GetUserGroup(pEntity)
            local textWidth, textHeight = surface.GetTextSize(userGroup)
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(w - textWidth - 5, 5)
            surface.DrawText(userGroup)
            
            -- Разделительная линия
            surface.SetDrawColor(45, 45, 45)
            surface.DrawRect(0, h - 1, w, 1)
        end    

        function pButton:OnMousePressed( mouseCode )
            if not IsValid(pEntity) then self:Remove() return end

            if ( mouseCode == MOUSE_LEFT ) then
                local steamId = pEntity:SteamID()

                ultimate.cfg.friends[ steamId ] = not ultimate.cfg.friends[ steamId ]
            end
        end
    end
end


function ultimate.tabs.Entities()
    local entitylist = ents.GetAll()
    local classes = {}

    for i = 1, #entitylist do
        local pEntity = entitylist[ i ]

        local class = pEntity:GetClass()
        
        if class == "player" then continue end

        if not classes[class] then
            classes[class] = true
        else
            continue
        end

        local pButton = vgui.Create( "Panel", ultimate.scrollpanel )
        pButton:SetTall( 25 )
        pButton:Dock( TOP )

        function pButton:Paint( w, h )
            if not IsValid(pEntity) then self:Remove() return end

            local class = pEntity:GetClass()

            surface.SetFont( "DermaSmall" )

            if ( ultimate.cfg.ents[ class ] ) then
                surface.SetTextColor( 0, 255, 0 )
            else
                surface.SetTextColor( 255, 255, 255 )
            end

            surface.SetTextPos( 10, 5 )
            surface.DrawText( class )

            surface.SetDrawColor( 45, 45, 45 )
            surface.DrawRect( 0, h - 1, w, 1 )
        end

        function pButton:OnMousePressed( mouseCode )
            if not IsValid(pEntity) then self:Remove() return end

            if ( mouseCode == MOUSE_LEFT ) then
                local class = pEntity:GetClass()

                if not ultimate.cfg.ents[ class ] then
                    ultimate.cfg.ents[ class ] = true
                else
                    ultimate.cfg.ents[ class ] = nil
                end
            end
        end
    end
end






ultimate.ttable = {}

ultimate.ttable["Aimbot"]   = ultimate.tabs.Aimbot
ultimate.ttable["Rage"]     = ultimate.tabs.Rage
ultimate.ttable["Visuals"]  = ultimate.tabs.Visuals
ultimate.ttable["Misc"]     = ultimate.tabs.Misc
ultimate.ttable["Config"] = ultimate.tabs.Config
ultimate.ttable["Players"]  = ultimate.tabs.Players
ultimate.ttable["Entities"]  = ultimate.tabs.Entities
function ultimate.initTab(tab)
    if ultimate.scrollpanel != nil then ultimate.scrollpanel:Remove() end

    ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

    ultimate.pty = { 5, 5, 5 }
    // ultimate.ESPPP:Hide()
    ultimate.ttable[tostring(tab)]()
end

function ultimate.tabButton(tab,par) 
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(tab)

    local fw = w + 35

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        ultimate.activetab = tab
        ultimate.initTab(tab)
    end

    function b:Paint(width,height)
        if ultimate.activetab == tab or self:OnDepressed() then
            surface.SetDrawColor(ultimate.Colors[54])
            surface.SetTextColor(180,0,0)
        elseif self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[40])
            surface.SetTextColor(225,225,225,255)
        else
            surface.SetDrawColor(ultimate.Colors[30])
            surface.SetTextColor(200,200,200,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(tab)
    end
end

ultimate.tabButton( "Aimbot",        ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Rage",          ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Visuals",       ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Misc",          ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Config",        ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Players",       ultimate.frame:GetTopPanel() ) 
ultimate.tabButton( "Entities",      ultimate.frame:GetTopPanel() )

ultimate.ttable["Aimbot"]()

// Input 

function ultimate.IsKeyDown( key )
    if key >= 107 then
        return input.IsMouseDown( key )
    end

    return input.IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

ultimate.target             = false  
ultimate.aimingrn           = false 

ultimate.targetVector       = Vector()
ultimate.predictedVector    = Vector()
ultimate.backtrackVector    = Vector()
ultimate.nullVec            = Vector() * -1

ultimate.SilentAngle        = pLocalPlayer:EyeAngles()

ultimate.SkipCommand        = false
ultimate.SendPacket         = true

ultimate.traceStruct        = { mask = MASK_SHOT, filter = pLocalPlayer }
ultimate.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
ultimate.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
ultimate.cones              = {}
ultimate.parsedbones        = {}

ultimate.swbNormal          = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
ultimate.swbWall            = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
ultimate.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
ultimate.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

ultimate.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
ultimate.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
ultimate.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
ultimate.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

ultimate.activeWeapon       = false 
ultimate.activeWeaponClass  = false 
ultimate.moveType           = pLocalPlayer:GetMoveType() 

ultimate.backtracktick      = 0

function ultimate.AutoWall( dir, plyTarget )
	if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return false end 

	local eyePos = pLocalPlayer:EyePos()
	
	local function SWBAutowall()

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * ultimate.activeWeapon.PenetrativeRange
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = ultimate.swbNormal

		local tr = TraceLine( ultimate.traceStruct )
		
		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)
			
			if ultimate.activeWeapon.CanPenetrate and dot > 0.26 then

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * ultimate.activeWeapon.PenStr * ( ultimate.swbPen[tr.MatType] or 1 ) * ultimate.activeWeapon.PenMod
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = ultimate.swbWall

				tr = TraceLine( ultimate.traceStruct )

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * 0.1
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = ultimate.swbNormal

				tr = TraceLine( ultimate.traceStruct) 
				
				if tr.Hit then return false end

                ultimate.traceStruct.start = tr.HitPos
                ultimate.traceStruct.endpos = tr.HitPos + dir * 32768
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = MASK_SHOT

				tr = TraceLine( ultimate.traceStruct )
				
                if ultimate.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end
		
		return false
	end
	
	local function M9KAutowall()
        local penetrate_cvar = GetConVar( "M9KDisablePenetration" )
        if IsValid(penetrate_cvar) then
            if ( penetrate_cvar:GetBool() ) then
                return false 
            end
        end

		if !ultimate.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end
			
			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ] then
                maxPenetration = ultimate.m9kPenetration[ ultimate.activeWeapon.Primary.Ammo ]
            end
			
            if ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ] then
                maxRicochet = ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ]
            end

            if ultimate.m9kCanRicochet[ ultimate.activeWeapon.Primary.Ammo ] then
                isRicochet = ultimate.m9kMaxRicochet[ ultimate.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and ultimate.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if ultimate.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 ) 
			end

			if tr.Fraction <= 0 then
				return false
			end

			ultimate.traceStruct.endpos    = tr.HitPos
			ultimate.traceStruct.start     = tr.HitPos + penetrationDir
			ultimate.traceStruct.mask      = MASK_SHOT
			ultimate.traceStruct.filter    = pLocalPlayer

			local trace = TraceLine( ultimate.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			ultimate.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			ultimate.traceStruct.start  = trace.HitPos
			ultimate.traceStruct.mask   = MASK_SHOT
			ultimate.traceStruct.filter = pLocalPlayer

			local penTrace = TraceLine( ultimate.traceStruct )

            if ultimate.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if ultimate.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
				damageMulti = 1
			elseif tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL then
				damageMulti = 0.3
			elseif tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS then
				damageMulti = 0.8
			elseif tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				damageMulti = 0.9
			end
			
			if penTrace.MatType == MAT_GLASS then
				bounceNum = bounceNum - 1
			end

			return BulletPenetrate( penTrace, bounceNum + 1, damage * damageMulti )
		end

        ultimate.traceStruct.start = eyePos
        ultimate.traceStruct.endpos = eyePos + dir * 32768
        ultimate.traceStruct.filter = pLocalPlayer
        ultimate.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( ultimate.traceStruct )

		return BulletPenetrate( trace, 0, ultimate.activeWeapon.Primary.Damage )
	end
	
    if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) or string.StartsWith( ultimate.activeWeaponClass, "bender_" ) then
		return M9KAutowall()
	elseif string.StartsWith( ultimate.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	end
	
	return false
end

function ultimate.VisibleCheck( who, where, predticks, awalldir )
    local start = pLocalPlayer:EyePos()

    if predticks then start = start + ( pLocalPlayer:GetVelocity() * flTickInterval ) * predticks end

    ultimate.traceStruct.start = start
	ultimate.traceStruct.endpos = where
	ultimate.traceStruct.mask = MASK_SHOT
    ultimate.traceStruct.filter = pLocalPlayer

    local tr = TraceLine( ultimate.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and ultimate.cfg.vars["Wallz"] then 
        return ultimate.AutoWall( awalldir, who )
    end

    if ultimate.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

ultimate.flServerTime = 0
function ultimate.CanShoot( cmd )
	if not ultimate.activeWeapon then return false end
	local seq = ultimate.activeWeapon:GetSequence()

    if ultimate.cfg.binds["Aim on key"] != 0 and not ultimate.IsKeyDown( ultimate.cfg.binds["Aim on key"] ) then
        return false
    end

	if ultimate.badSweps[ ultimate.activeWeaponClass ] then
		return false
	end

    if ultimate.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if ultimate.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if ultimate.cfg.vars["Bullet time"] and ultimate.activeWeapon:GetNextPrimaryFire() >= ultimate.flServerTime then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if ultimate.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) != 134 then
        return false 
    end

	return ultimate.activeWeapon:Clip1() != 0 and !ultimate.badSeqs[ seq ] 
end 

function ultimate.Spread( cmd, ang, spread )
	if not ultimate.activeWeapon or not ultimate.cones[ ultimate.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread 
*/

if ultimate.cfg.vars["Lag fix"] then
    if ultimate.cfg.vars["Backshoot"] then
        local targetTime = ded.GetSimulationTime( ply:EntIndex() )
        local timeOffset = ded.GetServerTime(cmd) - targetTime

        -- Check if we can backtrack without cl_interp
        local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        local diff = serverArriveTick - ply.aimshots.sw_backshoot_data.simTime
        if diff < 0.2 then 
            local tick = ultimate.TIME_TO_TICKS(targetTime + ultimate.GetLerpTime())
            ded.SetCommandTick(cmd, tick)
        else
            ded.SetTargetInterp(ded.GetServerTime(cmd) - targetTime)

            local tick = ultimate.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    else
        local simTime = ded.GetSimulationTime(ply:EntIndex())
        local tick = ultimate.TIME_TO_TICKS(simTime + ultimate.GetLerpTime())
        ded.SetCommandTick(cmd, tick)
    end
end


ultimate.CustomSpread = {}

local cached_cone = 0
local cached_weapon = nil
local last_update_time = 0
local CACHE_UPDATE_INTERVAL = 0.1 -- Обновляем кэш каждые 100мс

function ultimate.CustomSpread.swb(cmd, ang)
    -- Быстрая проверка валидности входных данных
    if not cmd or not ang then
        return ang or Angle(0, 0, 0)
    end
    
    local wep = ultimate.activeWeapon
    if not IsValid(wep) then
        return ang
    end
    
    -- Кэширование cone для оптимизации
    local current_time = CurTime()
    if wep ~= cached_weapon or (current_time - last_update_time) > CACHE_UPDATE_INTERVAL then
        cached_weapon = wep
        last_update_time = current_time
        
        -- Обновляем кэшированный cone
        if wep.GetCone then
            cached_cone = wep:GetCone() or 0
        else
            cached_cone = 0
        end
    end
    
    -- Если нет разброса, возвращаем исходный угол
    if cached_cone <= 0 then
        return ang
    end
    
    -- Получаем seed с улучшенным fallback
    local seed = cmd:CommandNumber()
    if not seed or seed <= 0 then
        -- Более стабильный fallback seed
        seed = math.floor(current_time * 100) + (cmd:GetViewAngles().y * 100) % 1000
    end
    
    -- Генерируем предсказуемые случайные значения
    local randX = util.SharedRandom("swb_spread_x", -cached_cone, cached_cone, seed)
    local randY = util.SharedRandom("swb_spread_y", -cached_cone, cached_cone, seed + 1)
    
    -- Проверка на NaN и бесконечность
    if not randX or not randY or randX ~= randX or randY ~= randY or 
       math.abs(randX) == math.huge or math.abs(randY) == math.huge then
        return ang
    end
    
    -- Оптимизированное получение векторов направления
    local aimvec = ang:Forward()
    local right = ang:Right()
    local up = ang:Up()
    
    -- Компенсация разброса с более точным расчетом
    local compensatedVec = Vector(
        aimvec.x - (right.x * randX) - (up.x * randY),
        aimvec.y - (right.y * randX) - (up.y * randY),
        aimvec.z - (right.z * randX) - (up.z * randY)
    )
    
    -- Проверка на валидность результирующего вектора
    local lengthSqr = compensatedVec:LengthSqr()
    if lengthSqr <= 0 or lengthSqr ~= lengthSqr then -- Проверка на NaN
        return ang
    end
    
    -- Нормализация только если необходимо
    if lengthSqr ~= 1 then
        compensatedVec:Normalize()
    end
    
    -- Возвращаем скомпенсированный угол
    local result = compensatedVec:Angle()
    
    -- Финальная проверка на валидность угла
    if result.p ~= result.p or result.y ~= result.y or result.r ~= result.r then
        return ang
    end
    
    return result
end

function ultimate.CustomSpread.ResetSWBCache()
    cached_weapon = nil
    cached_cone = 0
    last_update_time = 0
end

-- Автоматический сброс кэша при смене оружия
hook.Add("Think", "ultimate_swb_cache_reset", function()
    local current_weapon = ultimate.activeWeapon
    if current_weapon ~= cached_weapon and cached_weapon ~= nil then
        ultimate.CustomSpread.ResetSWBCache()
    end
end)

function ultimate.CustomSpread.cw( cmd, ang )
    local cone = ultimate.activeWeapon.CurCone
    if !cone then return ang end

    math.randomseed( cmd:CommandNumber() )
    return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
end

function ultimate.CustomSpread.fas2( cmd, ang )
    math.randomseed( CurTime() )

    local dir = Angle( math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), math.Rand( -ultimate.activeWeapon.CurCone, ultimate.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir 
            
    if ultimate.activeWeapon.ClumpSpread and ultimate.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * ultimate.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

function ultimate.CustomSpread.tfa( cmd, ang )

    
    return ang
end

function ultimate.CustomSpread.mg( cmd, ang )
    /*
    local pWeapon = ultimate.activeWeapon

    local flCone = pWeapon:GetCone()

    math.randomseed( pWeapon.Cone.Seed + pWeapon:Clip1() + pWeapon:Ammo1() )

    local flSpread = math.Rand( -flCone, flCone ) * 1000

    if ( flSpread < -flCone ) then
        flSpread = -flCone
    elseif ( flSpread > flCone ) then
        flSpread = flCone
    end

    flSpread = flSpread * 0.1

    local vSpread = Vector( 1, -flSpread, flSpread )
    local newAngle = ang + vSpread:Angle()
    newAngle:Normalize()

    return newAngle
    */
end

/*
local function Zc(self, bd)
    local cd = self:GetCone()
    Xc(self.Cone.Seed + self:Clip1() + self:Ammo1())
    local dd = Wc(-cd, cd) * 1000
    if (dd < -cd) then
        dd = -cd
    elseif (dd > cd) then
        dd = cd
    end
    dd = dd * 0.1
    Yc.x = dd
    Yc.y = -dd
    local ed = self.Bullet
    self:FireBullets(
        {
            Attacker = bd,
            Src = bd:EyePos(),
            Dir = (bd:EyeAngles() + bd:GetViewPunchAngles()):Forward(),
            Spread = Yc,
            Num = ed.NumBullets,
            Distance = (ed.Range * 100) / 2.54,
            Tracer = ed.Tracer and 1 or 0,
            Callback = function(fd, gd, hd)
            end
        }
    )
end
*/

ultimate.SpreadComps = {}

ultimate.SpreadComps["swb"]     = ultimate.CustomSpread.swb
ultimate.SpreadComps["cw"]      = ultimate.CustomSpread.cw
ultimate.SpreadComps["fas2"]    = ultimate.CustomSpread.fas2
ultimate.SpreadComps["tfa"]     = ultimate.CustomSpread.tfa
--ultimate.SpreadComps["mg"]     = ultimate.CustomSpread.mg




function ultimate.LagCompensation(cmd)
    local ply = ultimate.SelectTarget(cmd)
    local ping = ply:Ping()

    local compensationAmount = ping * 0.001 


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end



function ultimate.NoSpread(cmd, ang)
    if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return ang end
    local base = string.Split( ultimate.activeWeaponClass, "_" )[ 1 ]

    if ultimate.SpreadComps[ base ] then
        ang = ultimate.SpreadComps[ base ]( cmd, ang )
    elseif ultimate.cones[ ultimate.activeWeaponClass ] then
        local spread = ultimate.cones[ ultimate.activeWeaponClass ]
        return ultimate.Spread( cmd, ang, spread ) 
    end

    return ang
end

function ultimate.NoRecoil( ang )  
	if ultimate.activeWeaponClass == "weapon_pistol" or string.StartsWith( ultimate.activeWeaponClass,"m9k_" ) or string.StartsWith( ultimate.activeWeaponClass,"bb_" ) or string.StartsWith( ultimate.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - pLocalPlayer:GetViewPunchAngles()
    end

	return ang
end

/*
ultimate.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function ultimate.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if ultimate.parsedbones[ mdl ] and ultimate.parsedbones[ mdl ][ bone ] then 
        return ultimate.parsedbones[ mdl ][ bone ]
    end

    if not ultimate.parsedbones[ mdl ] then
        ultimate.parsedbones[ mdl ] = {}
    end
        
    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do 
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do 
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function ultimate.MultipointGroupCheck( group )
    if group == 1 and not ultimate.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not ultimate.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not ultimate.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not ultimate.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not ultimate.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not ultimate.cfg.vars["Multipoint groups-Generic"] then return false end

    return true 
end

function ultimate.GetBones( ply )
    local scale = ultimate.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if ultimate.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do 
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not ultimate.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not ultimate.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not ultimate.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not ultimate.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not ultimate.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not ultimate.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then 
                continue 
            end 

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then 
                continue
            end 

            local bonepos, ang = ply:GetBonePosition( hitboxbone )
            
            if ultimate.cfg.vars["Multipoint"] and ultimate.MultipointGroupCheck( pos[ i ].hitgroup ) then
                local points = {
                    ( ( mins + maxs ) * 0.5 ),
                    Vector( mins.x, mins.y, mins.z ),
                    Vector( mins.x, maxs.y, mins.z ),
                    Vector( maxs.x, maxs.y, mins.z ),
                    Vector( maxs.x, mins.y, mins.z ),
                    Vector( maxs.x, maxs.y, maxs.z ),
                    Vector( mins.x, maxs.y, maxs.z ),
                    Vector( mins.x, mins.y, maxs.z ),
                    Vector( maxs.x, mins.y, maxs.z )
                }

                for i = 1, #points do
                    points[ i ]:Rotate( ang )
                    points[ i ] = points[ i ] + bonepos

                    if i == 1 then continue end 

                    points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
                    valid[ #valid + 1 ] = points[ i ]
                end
            end 

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = ultimate.ParseBones( ply, ultimate.cfg.vars["Hitbox selection"] ) 

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then 
            return { pos }  
        end 

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then 
            return { pos } 
        end 

        local bonepos, ang = ply:GetBonePosition( hitboxbone )  

        if ultimate.cfg.vars["Multipoint"] then
            local points = {
                ( ( mins + maxs ) * 0.5 ),
                Vector( mins.x, mins.y, mins.z ),
                Vector( mins.x, maxs.y, mins.z ),
                Vector( maxs.x, maxs.y, mins.z ),
                Vector( maxs.x, mins.y, mins.z ),
                Vector( maxs.x, maxs.y, maxs.z ),
                Vector( mins.x, maxs.y, maxs.z ),
                Vector( mins.x, mins.y, maxs.z ),
                Vector( maxs.x, mins.y, maxs.z )
            }

            for i = 1, #points do
                points[ i ]:Rotate( ang )
                points[ i ] = points[ i ] + bonepos

                if i == 1 then continue end 

                points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
            end

            return points
        else 
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function ultimate.GetSortedPlayers(mode, selfpred, plypred, vischeck)
    local players   = player.GetAll()
    local eyepos    = pLocalPlayer:EyePos()
    local valid     = {}
    local priority  = {}

    if selfpred then
        eyepos = eyepos + (pLocalPlayer:GetVelocity() * flTickInterval) * selfpred
    end

    local iTeamLocal = ultimate.GetTeam(pLocalPlayer)

    -- ✦ Проверка FOV (GUI-шный)
    local function IsTargetInFov(target)
        if not IsValid(target) then return false end

        local bone = ultimate.GetBones(target)[1]
        if not bone then return false end

        local angToTarget = (bone - pLocalPlayer:GetShootPos()):Angle()
        local view = pLocalPlayer:EyeAngles()

        local yawDiff = math.AngleDifference(view.yaw, angToTarget.yaw)
        local pitchDiff = math.AngleDifference(view.pitch, angToTarget.pitch)
        local fov = math.abs(yawDiff) + math.abs(pitchDiff)
        local maxFov = ultimate.cfg.vars["Aimbot FOV"] or 180
    end

    for i = 1, #players do
        local v = players[i]
        if v == pLocalPlayer then continue end
        if not v:Alive() or v:IsDormant() then continue end

        if ultimate.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end
        if ultimate.cfg.vars["Ignores-Friends"] and ultimate.cfg.friends[v:SteamID()] then continue end
        if ultimate.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end
        if ultimate.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end
        if ultimate.cfg.vars["Ignores-Frozen"] and v:IsFlagSet(FL_FROZEN) then continue end
        if ultimate.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive(EF_NODRAW) then continue end
        if ultimate.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end
        if ultimate.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end

        local iTeamEnemy = ultimate.GetTeam(v)
        if st == TEAM_SPECTATOR or (ultimate.cfg.vars["Ignores-Teammates"] and iTeamLocal == iTeamEnemy) then continue end
        if ultimate.cfg.vars["Ignores-Nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then continue end

        if vischeck then
            local bone = ultimate.GetBones(v)[1]
            if bone then
                local dir = pLocalPlayer:GetShootPos() - bone
                dir:Normalize()

                -- временно отключи, если мешает
                if not ultimate.VisibleCheck(v, bone, selfpred, dir) then
                    continue
                end
            end
        end

        local pos = v:GetPos()
        if plypred then
            pos = pos + (v:GetVelocity() * flTickInterval) * plypred
        end

        local entry = { v, pos }

        -- Если включён приоритет — сначала tracked
            if ultimate.cfg.vars["Enable Priority List"] and ultimate.trackedPlayers and ultimate.trackedPlayers[v:SteamID()] then
                table.insert(priority, entry)
            else
                table.insert(valid, entry)
            end
    end

    -- ✦ Сортировка
    local function sortTargets(tbl)
        if mode == 1 then
            table.sort(tbl, function(a, b)
                return (a[2] - eyepos):LengthSqr() < (b[2] - eyepos):LengthSqr()
            end)
        elseif mode == 2 then
            table.sort(tbl, function(a, b)
                local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()
                local aDist = ((screenWidth * 0.5) - aScr.x)^2 + ((screenHeight * 0.5) - aScr.y)^2
                local bDist = ((screenWidth * 0.5) - bScr.x)^2 + ((screenHeight * 0.5) - bScr.y)^2
                return aDist < bDist
            end)
        end
    end

    sortTargets(priority)
    sortTargets(valid)

    for i = 1, #valid do
        priority[#priority + 1] = valid[i]
    end

    if #priority == 0 then return end

    ultimate.target = priority[1][1] -- обновляем цель

    return priority
end

function ultimate.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - ultimate.btrecords[ ply ][ tick ].simulationtime

    if diff > ultimate.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function ultimate.FindBacktrack( cmd, ply )
    local ticks = #ultimate.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function ultimate.FindFirstHittableTicks( ply, cmd )
    local tickcount = #ultimate.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function ultimate.FindClosestHittableTicks( ply, cmd )
        local mypos = pLocalPlayer:EyePos()
        local records = ultimate.btrecords[ ply ]
        local firstticks = ultimate.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math.huge
    
        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end

function ultimate.SelectTarget( cmd )
    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target     = false


    if !plys then return end 

    local maxplys       = ultimate.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local vEyePos = pLocalPlayer:EyePos()

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        -- distance check 
        local iMaxDistance = ultimate.cfg.vars[ "Max distance" ]
        local iDistance = vEyePos:DistToSqr( ply:EyePos() )

        if ( iMaxDistance ~= 0 and iDistance > ( iMaxDistance * iMaxDistance ) ) then
            continue 
        end
        






        if not ultimate.cfg.vars["Always backtrack"] then
            local bones = ultimate.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - pLocalPlayer:EyePos() ):Angle()

                if ultimate.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then 
                    ultimate.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end
           /*elseif ultimate.cfg.vars["Extrapolation"] and ultimate.predicted[ ply ] then
            if not ultimate.predicted[ ply ].pos then return end

            aimAngle = ( ultimate.predicted[ ply ].pos - me:EyePos() ):Angle()

            ultimate.traceStruct.start = me:EyePos()
            ultimate.traceStruct.endpos = ultimate.predicted[ ply ].pos
            ultimate.traceStruct.filter = ultimate.Piercable
            ultimate.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( ultimate.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                ultimate.target = ply
                return ply, ultimate.predicted[ ply ].pos, aimAngle, false, 0
            end*/
        end

        function ultimate.SafeExtrapolate(ply, ticks)
            if not IsValid(ply) or not ply:IsPlayer() then return ply:GetPos() end

            local velocity = ply:GetVelocity() or Vector(0, 0, 0)
            local tickInterval = engine.TickInterval() or 0.015
            local gravity = 600 -- стандарт для Source

            local predicted = ply:GetPos() + velocity * tickInterval * ticks

            if not ply:OnGround() then
                predicted.z = predicted.z - 0.5 * gravity * (tickInterval * ticks) ^ 2
            end

            return predicted
        end

        if ultimate.cfg.vars["Backtrack"] then
            local ticks = ultimate.FindBacktrack( cmd, ply )

            if ultimate.btrecords[ ply ] and not ply.break_lc then 
                local ts = 0 
                
                if ultimate.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not ultimate.btrecords[ ply ][ p ] then continue end

                        aimAng = ( ultimate.btrecords[ ply ][ p ].aimpos - pLocalPlayer:EyePos() ):Angle()

                        ultimate.traceStruct.start = pLocalPlayer:EyePos()
                        ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ p ].aimpos
                        ultimate.traceStruct.filter = pLocalPlayer
                        ultimate.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( ultimate.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            ultimate.target = ply
                            ultimate.backtracktick = p

                            return ply, ultimate.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                        end
                    end
                end

                if ultimate.cfg.vars["Backtrack mode"] == 3 then return end

                if ultimate.cfg.vars["Backtrack mode"] == 1 then
                    ts = ultimate.FindFirstHittableTicks( ply, cmd )
                elseif ultimate.cfg.vars["Backtrack mode"] == 2 then
                    ts = ultimate.FindClosestHittableTicks( ply, cmd )
                end

                if not ultimate.btrecords[ ply ][ ts ] then return end

                aimAng = ( ultimate.btrecords[ ply ][ ts ].aimpos - pLocalPlayer:EyePos() ):Angle()

                ultimate.traceStruct.start = pLocalPlayer:EyePos()
                ultimate.traceStruct.endpos = ultimate.btrecords[ ply ][ ts ].aimpos
                ultimate.traceStruct.filter = pLocalPlayer
                ultimate.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( ultimate.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    ultimate.target = ply
                    ultimate.backtracktick = ts

                    return ply, ultimate.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
                end
            end
        end
	end
end

function ultimate.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true 
    end 
    
    if cmd:KeyDown( IN_MOVELEFT ) then
        return true 
    end 

    if cmd:KeyDown( IN_FORWARD ) then
        return true 
    end 

    if cmd:KeyDown( IN_BACK ) then
        return true 
    end 

    return false
end

function ultimate.MovementFix( cmd, wish_yaw )

	local pitch = math.NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1
	
	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math.rad( math.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math.cos( ang_diff ) * inverted + sidemove * math.sin( ang_diff )
	local new_sidemove = forwardmove * math.sin( ang_diff ) * inverted + sidemove * math.cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function ultimate.DoSilentAngleUpdate( UserCmd )
    local pWeapon = pLocalPlayer:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then 
            return 
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or pLocalPlayer:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) and bIsInUse ) then 
            return 
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = ultimate.SilentAngle

    silentAngle.x = math.Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0
    
    silentAngle:Normalize()

    return silentAngle
end





















// Knife bot ( Etot zaichik knifer )

ultimate.knifes = {}

ultimate.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

ultimate.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

ultimate.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

function ultimate:EntityFaceBack( ent )
    local angle = pLocalPlayer:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function ultimate.CanStab( ent, pos, health )
    local mypos = pLocalPlayer:GetShootPos()
    local tbl = ultimate.knifes[1]
    local wc = pLocalPlayer:GetActiveWeapon():GetClass()
    local canuse = false 

    for i = 1, #ultimate.knifes do
        if string.StartsWith(wc,ultimate.knifes[i].str) then
            canuse = true 
            tbl = ultimate.knifes[i]
            break
        end
    end 

    if not canuse then return false, false end

    if ultimate.canBacktrack( ent ) and ultimate.btrecords[ent][ultimate.backtracktick] then
        pos = ultimate.btrecords[ ent ][ ultimate.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and ultimate:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = ultimate.cfg.vars["Knifebot mode"]
    
    if mode == 1 then // Damage mode - tries to inflict biggest possible damage
        if backstab and dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist or  ( dist < tbl.rightdist and health - tbl.leftdmg > 0 )  then 
            return true, true
        end
    elseif mode == 2 then // Fast - tries to hit fast as possible
        if dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist then
            return true, false
        end
    elseif mode == 3 then // Fatal - deals only fatal damage
        if dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist and ( ( backstab and health - tbl.rightdmgb <= 0 ) or ( health - tbl.rightdmg <= 0 ) ) then
            return true, true
        end
    end

    return false, false
end

// Crossbow prediction 

function ultimate.CrossbowPred( cmd )
    if not ultimate.CanShoot( cmd ) then return end

    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )

    if !plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos()

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()

        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - eyePos ):Angle()
        local aimVector     = aimAngle:Forward()

        local velStart      = aimVector * 3500

        local distance      = eyePos:Distance( aimPos )
        local travelTime    = distance / 3500

        // Movement simulation 
        local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if predTime > ultimate.cfg.vars["Simulation limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, ultimate.TIME_TO_TICKS( predTime ) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 3500

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * 0.05
        gravity             = ( gravity * flTickInterval ) * ultimate.TIME_TO_TICKS( travelTime )

        aimPos.z            = aimPos.z + gravity

        // Aimbot 

        local finalVec = Vector( aimPos.x, aimPos.y, aimPos.z )
        local finalAng = ( finalVec - eyePos ):Angle()
        finalAng:Normalize()

        debugoverlay.Line( plyPos + plyCenter, finalVec, 0.1, color_white, true )

        cmd:SetViewAngles( finalAng )
    end
end

// Propkill aimbot

ultimate.grabbingEnt = false 

function ultimate.DrawPhysgunBeam( ply, wep, e, tar, bone, hitpos )
    if ply != pLocalPlayer then return end 

    ultimate.grabbingEnt = IsValid( tar ) and tar or false
end

ultimate.predictedPoint = {}
function ultimate.PropAim( cmd )
    if not ultimate.grabbingEnt or not IsValid( ultimate.grabbingEnt ) or not cmd:KeyDown( IN_ATTACK ) then return end

    local plys = ultimate.GetSortedPlayers( ultimate.cfg.vars["Target selection"] )
    ultimate.target = false
    ultimate.targetVector = false

    if !plys then return end

    for i = 1, #plys do
        local ply           = plys[i][1]

        local eyePos        = pLocalPlayer:EyePos() 

        local plyPos        = ply:GetPos()
        local plyVel        = ply:GetVelocity()
        local plyCenter     = ply:OBBCenter()
        local plySpeed      = plyVel:Length()
        //local plyPred       = plyPos + plyVel * flTickInterval

        local propPos       = ultimate.grabbingEnt:GetPos()
        local propVel       = ultimate.grabbingEnt:GetVelocity()
        local propSpeed     = propVel:Length()

        local distance      = plyPos:Distance( propPos )
        local plydist       = plyPos:Distance( eyePos )

        if plydist >= 4096 then continue end

        local travelTime    = distance / propSpeed
        //local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if travelTime > ultimate.cfg.vars["Simulation limit"] then continue end // predTime

        // Prediction

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, ultimate.TIME_TO_TICKS( travelTime ) do // predTime
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()
        local aimPos        = data.m_vecAbsOrigin + plyCenter

        distance            = aimPos:Distance( propPos )
        travelTime          = distance / propSpeed

        ded.FinishSimulation()

        // Mouse wheel shit

        local deltaDistance = plydist - distance
        local scrollDelta = -deltaDistance

        // Aim

        local aimAng        = ( aimPos - pLocalPlayer:EyePos() ):Angle()
        aimAng:Normalize()

        cmd:SetMouseWheel( scrollDelta ) 
        cmd:SetViewAngles( aimAng )

        /* Method 1
        local scrollDelta = 0

        if distance == 0 then
            scrollDelta = 0
        elseif propSpeed > plySpeed then
            scrollDelta = - ( distance / propSpeed )
        else
            scrollDelta = distance / plySpeed
        end
        */


        /*



        
        local predticks = ultimate.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) + 1

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, predticks do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()

        pos = data.m_vecAbsOrigin + ply:OBBCenter()

        ded.FinishSimulation()

        local dist = pos:DistToSqr( pLocalPlayer:EyePos() )

        local clr = dist < 16777216 and Color( 0, 255, 0 ) or Color( 255, 0, 0 )

        debugoverlay.Line( pos, ultimate.grabbingEnt:GetPos(), 0.1, clr, true )
        debugoverlay.Box( pos - ply:OBBCenter(), ply:OBBMins(), ply:OBBMaxs(), 0.1, Color( 255, 15, 15, 32 ) )

        if dist >= 16777216 then continue end

        local aimAng = ( pos - pLocalPlayer:EyePos() ):Angle()
        local ppd = ultimate.grabbingEnt:GetPos():DistToSqr( pos )

        local cd = ultimate.cfg.vars["PA thrower dist"]
        if ppd < ( cd * cd ) and ultimate.cfg.vars["PA thrower"] then
            cmd:RemoveKey( IN_ATTACK )
        end

        local bmd = math.sqrt( dist - ppd )

        if ( dist - ppd ) < 0 then bmd = 0 end 

        local scrollDelta = math.ceil( bmd > 0 and -ppd or ppd )

        if scrollDelta > 5000 then
            scrollDelta = 5000
        elseif scrollDelta < -5000 then
            scrollDelta = -5000
        end

        print( "SDelta", scrollDelta, "BMD", bmd, "PPD", ppd )

        cmd:SetMouseWheel( scrollDelta )
        cmd:SetViewAngles( aimAng )
        */
    end
end

function ultimate.Aim(cmd)
    ultimate.AntiAim(cmd)

    if ultimate.SendPacket then
        ultimate.fakeAngles.angle = cmd:GetViewAngles()
        ultimate.fakeAngles.movex = pLocalPlayer:GetPoseParameter("move_x")
        ultimate.fakeAngles.movey = pLocalPlayer:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if pLocalPlayer:IsValidLayer(i) then
                layers[i] = {
                    cycle = pLocalPlayer:GetLayerCycle(i),
                    sequence = pLocalPlayer:GetLayerSequence(i),
                    weight = pLocalPlayer:GetLayerWeight(i)
                }
            end
        end

        ultimate.fakeAngles.origin = pLocalPlayer:GetNetworkOrigin()
        ultimate.fakeAngles.seq = pLocalPlayer:GetSequence()
        ultimate.fakeAngles.cycle = pLocalPlayer:GetCycle()
    else
        ultimate.realAngle = cmd:GetViewAngles()
    end

    if ultimate.SendPacket then
        ultimate.lastRealYaw = yourYaw
        ultimate.chokedTicks = 0
    else
        ultimate.lastFakeYaw = yourYaw
        ultimate.chokedTicks = (ultimate.chokedTicks or 0) + 1
    end

    local ply, bone, aimang, backtracking, bttick = ultimate.SelectTarget(cmd)

    ultimate.targetVector = bone 

    if not aimang then return end

    aimang:Normalize()  

    if not ultimate.cfg.vars["Enable aimbot"] or not ply then return end

    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime

    if diff > 1 and ultimate.cfg.vars["Adjust tickcount"] then return end

    local oldangs = Angle(aimang)

    if ultimate.cfg.vars["Always backtrack"] and not backtracking then return end

    if ultimate.cfg.vars["Fov limit"] then
        local fov = ultimate.cfg.vars["Aimbot FOV"]

		local view = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math.sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            ultimate.targetVector = false
		    return 
        end
    end

    if not ultimate.CanShoot(cmd) then return end

    if ( ultimate.cfg.vars["Wait for simulation"] and ( ply:GetVelocity():Length() ~= 0 and not ply.simtime_updated ) ) then
        return 
    end

    if not ultimate.cfg.vars["Aimbot smoothing"] and ultimate.SkipCommand then return end

    ultimate.aimingrn = true

    // Knife bot 
    local altfire = false
    local canstab, rightstab = ultimate.CanStab( ply, bone, ply:Health() )

    if ultimate.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif ultimate.cfg.vars["Knifebot"] and not canstab then
        return 
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if ultimate.cfg.vars["Norecoil"] then
        finalAngle = ultimate.NoRecoil(finalAngle)
    end

    if ultimate.cfg.vars["Force seed"] then
        ded.ForceSeed( cmd )
    end

    if ultimate.cfg.vars["Nospread"] then
        finalAngle = ultimate.NoSpread(cmd,finalAngle)
    end  

    if ultimate.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end

    if ultimate.cfg.vars["LagCompensation"] and ultimate.target ~= nil then
        local lagCompensationTime = ded.GetRealTime() 
        ultimate.target:SetNWFloat("LagCompensation", lagCompensationTime)
    end

   if ultimate.cfg.vars["Projectile aimbot"] then
        if not IsValid(me) or not IsValid(ply) then return end

        local weapon = me:GetActiveWeapon()
        if not IsValid(weapon) then return end

        local wepClass = weapon:GetClass()
        if wepClass ~= "weapon_crossbow" then return end

        local speed, gravity = 3600, 0
        local targetPos = ply:WorldSpaceCenter() + Vector(0, 0, 36) -- ниже центра, не голова

        local eye = me:EyePos()
        local distance = eye:Distance(targetPos)
        local time = distance / speed

        local simTicks = math.Clamp(math.ceil(time * 66), 1, 150)

        ded.StartSimulation(ply:EntIndex())
        for i = 1, simTicks do
            ded.SimulateTick()
        end
        local sim = ded.GetSimulationData()
        ded.FinishSimulation()

        if sim and sim.m_vecAbsOrigin then
            local predicted = sim.m_vecAbsOrigin + Vector(0, 0, 36)
            local direction = (predicted - eye):Angle()
            direction:Normalize()
            finalAngle = direction
        end
    end

    if ultimate.cfg.vars["TF2 Predict"] then
        if not IsValid(me) or not IsValid(ply) then return end

        local weapon = me:GetActiveWeapon()
        if not IsValid(weapon) then return end

        local class = weapon:GetClass()

        -- ⚙ Расширенные настройки по классу
        local tf2Params = {
            ["weapon_directhit"] = {speed = 2800, gravity = 150, arc = 0.1},
            ["weapon_quadball"]  = {speed = 900, gravity = 300, arc = 0.2},
            ["weapon_lochnload"] = {speed = 2000, gravity = 300, arc = 0.15},
            ["weapon_q1_rl"]     = {speed = 1600, gravity = 200, arc = 0.12},
            ["weapon_pipebomblauncher"] = {speed = 1200, gravity = 400, arc = 0.25},
            ["weapon_stickybomblauncher"] = {speed = 800, gravity = 500, arc = 0.3}
        }

        local params = tf2Params[class]
        if not params then return end

        local speed = params.speed
        local gravity = params.gravity
        local arc = params.arc

        local eye = me:EyePos()
        local offsetZ = 32 -- 🎯 прицел на середину тела
        local targetPos = ply:GetPos() + Vector(0, 0, offsetZ)
        
        -- Учет движения цели
        local velocity = ply:GetAbsVelocity()
        local distance = eye:Distance(targetPos)
        local travelTime = distance / speed

        if not travelTime or travelTime ~= travelTime then return end

        local simTicks = math.Clamp(math.ceil(travelTime * 66), 1, 100)

        -- 🔮 Улучшенный предикт с учетом движения
        ded.StartSimulation(ply:EntIndex())
        local lastPos = targetPos
        for i = 1, simTicks do
            ded.SimulateTick()
            local sim = ded.GetSimulationData()
            if sim and sim.m_vecAbsOrigin then
                lastPos = sim.m_vecAbsOrigin
            end
        end
        ded.FinishSimulation()

        if lastPos then
            -- Улучшенный расчет траектории
            local predicted = lastPos + velocity * travelTime
            predicted.z = predicted.z + offsetZ + (0.5 * gravity * (travelTime ^ 2)) * arc

            -- Проверка видимости
            local tr = util.TraceLine({
                start = eye,
                endpos = predicted,
                filter = {me, ply},
                mask = MASK_SHOT
            })

            if tr.Hit then
                -- Попытка найти альтернативную точку
                predicted.z = predicted.z - offsetZ * 0.5
                tr = util.TraceLine({
                    start = eye,
                    endpos = predicted,
                    filter = {me, ply},
                    mask = MASK_SHOT
                })
            end

            if not tr.Hit then
                local aim = (predicted - eye):Angle()
                aim:Normalize()

                -- Более строгая проверка углов
                if math.abs(aim.pitch) <= 89 and math.abs(aim.yaw) <= 180 then
                    -- Плавное сглаживание углов
                    if finalAngle then
                        aim = LerpAngle(0.1, finalAngle, aim)
                    end
                    finalAngle = aim
                end
            end
        end
    end




    
    if ultimate.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if ultimate.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = ultimate.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )
        
        finalAngle = ret
    end

    if ultimate.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif ultimate.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = ultimate.btrecords[ply][bttick].simulationtime
        timeOffset = ultimate.flServerTime - targetTime

        serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - ultimate.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = ultimate.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ultimate.flServerTime - targetTime))
            local tick = ultimate.TIME_TO_TICKS(ultimate.flServerTime)
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ( ultimate.cfg.vars["Adjust tickcount"] and ply.simtime_updated ) then
        local flSimulationTime = ded.GetSimulationTime( ply:EntIndex() )
        local iTickCount = ultimate.TIME_TO_TICKS( flSimulationTime )

        ded.NetSetConVar( "cl_interpolate", "0" )
        ded.NetSetConVar( "cl_interp", "0" )

        ded.SetCommandTick( cmd, iTickCount )
    end

    if ultimate.cfg.vars["Auto fire"] then
        if string.StartsWith( ultimate.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
        --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )

        if ultimate.cfg.vars["Resolver"] then 
            ply.aimshots = (ply.aimshots or 0) + 1
        end

        local isAutomatic = true

        if ultimate.activeWeapon.Primary then
            isAutomatic = ultimate.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end

        if altfire or ( ultimate.cfg.vars["Alt Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or ( ultimate.cfg.vars["Rapid fire"] and cmd:CommandNumber() % 2 == 0 ) then
                cmd:AddKey(IN_ATTACK)
            end
        end

        ultimate.SkipCommand = true 
    end
end

function ultimate.autoReload(cmd)
    if !ultimate.cfg.vars["Auto reload"] then return end

	local wep = pLocalPlayer:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and pLocalPlayer:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end

// adaptive Cstrafe

ultimate.last_ground_pos = 0
ultimate.cstrafe_dir = 0

function ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()
	
	local fmove = 0
	local smove = ( dir == 1 ) && -10000 || 10000
	
	forward.z = 0
	right.z = 0
	
	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()
	
	wishdir:Normalize()
	
	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end
	
	local wishspd = wishspeed
	
	if ( wishspd > 30 ) then
		wishspd = 30
	end
	
	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed
	
	if ( addspeed <= 0 ) then
		return velocity
	end
	
	local accelspeed = accel * wishspeed * flTickInterval
	
	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end
	
	return velocity + ( wishdir * accelspeed )

end
    
function ultimate.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local jump_power = pLocalPlayer:GetJumpPower()

	local origin = pLocalPlayer:GetNetworkOrigin()
	local velocity = pLocalPlayer:GetAbsVelocity()
	
	local mins = pLocalPlayer:OBBMins()
	local maxs = pLocalPlayer:OBBMaxs()

    local pticks = math.Round(ultimate.cfg.vars["CStrafe ticks"])
	
	local on_ground = pLocalPlayer:IsFlagSet( FL_ONGROUND )
	
	for i = 1, pticks do

		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )

		if ( on_ground ) then
		
			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
			
		end

		velocity = ultimate.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )
		
		local endpos = origin + ( velocity * flTickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = pLocalPlayer,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end
		
		if ( pm.Fraction != 1 ) then
		
			local time_left = flTickInterval

			for j = 1, 2 do
			
				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )
				
				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = pLocalPlayer,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 || pm.AllSolid || pm.StartSolid ) then
					break
				end
			
			end
			
		end
		
		origin = pm.HitPos
		
		if ( ( ultimate.last_ground_pos - origin.z ) > math.Round(ultimate.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end
		
		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = pLocalPlayer,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )
		
		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )
		
		velocity.z = velocity.z - ( sv_gravity * flTickInterval * 0.5 )
		
		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function ultimate.CircleStrafe( cmd )


	local angle = 0
	
	while ( ultimate.cstrafe_dir < 2 ) do
	
		angle = 0
		local path_found = false
		local step = ( ultimate.cstrafe_dir == 1 ) && math.Round(ultimate.cfg.vars["CStrafe angle step"]) || -math.Round(ultimate.cfg.vars["CStrafe angle step"])
		
		while ( true ) do
		
			if ( ultimate.cstrafe_dir == 1 ) then
			
				if ( angle > math.Round(ultimate.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			else
			
				if ( angle < -math.Round(ultimate.cfg.vars["CStrafe angle max step"]) ) then
					break
				end
			
			end

			if ( ultimate.PredictMovement( cmd:GetViewAngles(), ultimate.cstrafe_dir, angle ) ) then
			
				path_found = true
				break
			
			end

			angle = angle + step
		
		end
		
		if ( path_found ) then
			break
		end
		
		ultimate.cstrafe_dir = ultimate.cstrafe_dir + 1
	
	end
	
	if ( ultimate.cstrafe_dir < 2 ) then
	
		local velocity = pLocalPlayer:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()
		
		viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )
		
		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( ultimate.cstrafe_dir == 1 ) && -10000 || 10000 )
	
	else
	
		ultimate.cstrafe_dir = 0
	
	end

end



do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function ultimate.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
        
            ultimate.CircleStrafe( cmd )
    
        elseif ( ultimate.IsKeyDown(ultimate.cfg.binds["Z Hop"]) and ultimate.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14
            
            cmd:SetSideMove( 5000 * math.sin(handler) )
        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 3 then
    
            local get_velocity_degree = function(velocity)
                local tmp = math.deg(math.atan(30.0 / velocity))
                    
                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end
    
            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = pLocalPlayer:GetVelocity()
            velocity.z = 0.0
    
            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()
    
            if (!forwardmove || !sidemove) then
                return
            end
    
            if(velocity:Length2D() <= 15.0 && !(forwardmove != 0 || sidemove != 0)) then
                return
            end
    
            local flip = cmd:TickCount() % 2 == 0
    
            local turn_direction_modifier = flip && 1.0 || -1.0
            local viewangles = Angle(ultimate.SilentAngle.x, ultimate.SilentAngle.y, ultimate.SilentAngle.z)
    
            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)
    
                local turn_angle = math.atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end
    
            local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))
    
            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end
    
            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math.NormalizeAngle(temp.y)
    
            local yaw_delta = temp.y
            old_yaw = viewangles.y
    
            local abs_yaw_delta = math.abs(yaw_delta)
    
            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()
    
                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math.NormalizeAngle(temp.y)
    
                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)
    
                if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end
    
            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()
    
            local angles_move = move:Angle()
    
            local normalized_x = math.modf(ultimate.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(ultimate.SilentAngle.y + 180, 360) - 180
    
            local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)
    
            if (normalized_x >= 90 || normalized_x <= -90 || ultimate.SilentAngle.x >= 90 && ultimate.SilentAngle.x <= 200 || ultimate.SilentAngle.x <= -90 && ultimate.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math.cos(yaw) * speed)
            else
                cmd:SetForwardMove(math.cos(yaw) * speed)
            end
    
            cmd:SetSideMove(math.sin(yaw) * speed)

        elseif ultimate.cfg.vars["Air strafer"] and ultimate.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / pLocalPlayer:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end

            /*

local ang_diff = math.NormalizeAngle( ultimate.SilentAngle.y - prev_yaw )
            
            if ( math.abs( ang_diff ) > 0 ) then
            
                if ( ang_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
            
            else
            
                local vel = pLocalPlayer:GetAbsVelocity()
                local vel_yaw = math.NormalizeAngle( math.deg( math.atan2( vel.y, vel.x ) ) )
                local vel_yaw_diff = math.NormalizeAngle( ultimate.SilentAngle.y - vel_yaw )
                
                if ( vel_yaw_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end
    
                local viewangles = cmd:GetViewAngles() //ultimate.SilentAngle //Angle( ultimate.SilentAngle.x, ultimate.SilentAngle.y, 0 )
                viewangles.y = vel_yaw
                cmd:SetViewAngles( viewangles )
                
            end
    
            prev_yaw = ultimate.SilentAngle.y
            */
            
            
        end
    end
end

/*
    Anti aim

*/

ultimate.aatarget = nil

function ultimate.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * flTickInterval
end

function ultimate.PredictedEyePos()
    return pLocalPlayer:EyePos() + pLocalPlayer:GetVelocity() * flTickInterval
end

function ultimate.GetBaseYaw()
    if not IsValid( ultimate.aatarget ) or ultimate.cfg.vars["Yaw base"] != 2 then
        return ultimate.SilentAngle.y
    end

    return math.NormalizeAngle( (ultimate.PredictedPos(ultimate.aatarget) - ultimate.PredictedEyePos()):Angle().y )
end

function ultimate.Freestand(cmd)
	if !IsValid(ultimate.aatarget) then return false end

	local headpos = pLocalPlayer:GetBonePosition(pLocalPlayer:LookupBone("ValveBiped.Bip01_Head1"))
	if !headpos then return end

	local selfpos = pLocalPlayer:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = ultimate.aatarget:WorldToLocal(selfpos)
	local bearing = math.deg(-math.atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math.rad(yaw)
		local x, y = math.sin(yaw), math.cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = ultimate.aatarget:EyePos() + ultimate.aatarget:GetVelocity() * flTickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = ultimate.aatarget
		})

		return tr.Fraction < 1 and tr.Entity != pLocalPlayer
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = pLocalPlayer:WorldToLocal(headpos)
		if headlocal.x > 0 then
			left, right = right, left
		end
	end

	if leftcheck and rightcheck then
		return false
	elseif leftcheck then
		return true, left , right
	elseif rightcheck then
		return true, right, left
	end

	return false
end

ultimate.realAngle = pLocalPlayer:EyeAngles()
ultimate.inverted = false
ultimate.oldYaw = 0
ultimate.SwaySide = 1

local baseyaw = 0

ultimate.CalcYaw = {
    // Backward
    [1] = function( cmd ) 
        return baseyaw - 178 
    end, 
    // Fake forward
    [2] = function( cmd )
        return ultimate.SendPacket and baseyaw or baseyaw + 178 
    end, 
    // Legit Delta
    [3] = function( cmd )     
        return ultimate.SendPacket and baseyaw or baseyaw + ( ultimate.inverted and 43 or - 43 )
    end,
    // Sideways 
    [4] = function( cmd )     
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - ( ultimate.SendPacket and delta or -delta ) 
    end,
    // Half Sideways
    [5] = function( cmd )     
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - ( ultimate.SendPacket and delta or 178 ) 
    end,
    // Fake Spin
    [6] = function( cmd )     
        local add = math.NormalizeAngle( CurTime() * ultimate.cfg.vars["Spin speed"] * 10 )
        return ultimate.SendPacket and ( ultimate.inverted and ( baseyaw - 178 ) or add ) or ( ultimate.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )     
        return ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( ultimate.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )   
        local yaw = baseyaw - 178

        if pLocalPlayer:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) + ( ultimate.SendPacket and 180 or 0)
        elseif not ultimate.SendPacket then
            local side = ultimate.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw( pLocalPlayer:EntIndex() )

            if math.abs( math.NormalizeAngle( lbyTarget - ultimate.oldYaw ) ) < ultimate.cfg.vars["LBY min delta"] then
                yaw = math.NormalizeAngle( ultimate.oldYaw + ultimate.cfg.vars["LBY break delta"] * side)
            else
                yaw = math.NormalizeAngle( ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() ) - 44 * side )
            end
        end
        
        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )     
        local add = ultimate.cfg.vars["Sin add"]
        local sin = math.sin( CurTime() ) * ultimate.cfg.vars["Sin delta"]
        return ultimate.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = ultimate.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math.sin(ct1)
        local y1 = ct2 * -1 * math.cos(ct1)
    
        local x2 = x1 + ct1 * math.sin(ct2)
        local y2 = y1 - ct1 * math.cos(ct2)

        local sin = ultimate.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )     
        local swaySpeed = (ultimate.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math.sin(CurTime() * swaySpeed) * 45
    
        return ( baseyaw - 180 ) + 55 * ultimate.SwaySide + swayAmount * ultimate.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )     
        local delta = ultimate.cfg.vars["Jitter delta"]
        
        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw - 178 + math.random( -delta, delta )
        local b = ultimate.SendPacket and baseyaw - 178 + math.random( -delta, delta ) or baseyaw - 178

        return ultimate.inverted and a or b
    end,
    // Kappa Jitter 
    [13] = function( cmd )    
        local delta = ultimate.cfg.vars["Jitter delta"]

        local a = ultimate.SendPacket and baseyaw - 178 or baseyaw + ( delta * ultimate.SwaySide )
        local b = ultimate.SendPacket and baseyaw + ( delta * ultimate.SwaySide ) or baseyaw - 178

        return ultimate.inverted and a or b
    end,
    // Abu Jitter 
    [14] = function( cmd )   
        local ctjit = math.sin( CurTime() * 30 ) * 25

        return ctjit + ( ultimate.SendPacket and baseyaw - 160 * ultimate.SwaySide or baseyaw - 160 * -ultimate.SwaySide )
    end,
    // Satanic spinner 
    [15] = function( cmd ) 
        local side = ultimate.inverted and 1 or -1
        local satanicvalue = math.sin( CurTime() * 666 ) * 666

        return math.NormalizeAngle( ultimate.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )   
        return ultimate.SendPacket and baseyaw + ultimate.cfg.vars["Custom real"] or baseyaw + ultimate.cfg.vars["Custom fake"]
    end,
    // Side jitter
    [17] = function(cmd)
        local jitter = math.random(-25, 25)
        return baseyaw + (ultimate.SendPacket and -90 + jitter or 90 - jitter)
    end,

    // Spiral
    [18] = function(cmd)
        local time = CurTime() * 5
        return baseyaw + math.sin(time) * 180
    end,

    // Desync
    [19] = function(cmd)
        local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]

        -- динамический случайный оффсет для фейка
        local jitterRange = ultimate.cfg.vars["Jitter delta"] or 35
        local jitter = math.random(-jitterRange, jitterRange)

        -- real и fake
        local realYaw = baseyaw + (inverter and -ultimate.cfg.vars["Custom real"] or ultimate.cfg.vars["Custom real"])
        local fakeYaw = baseyaw + (inverter and ultimate.cfg.vars["Custom fake"] or -ultimate.cfg.vars["Custom fake"]) + jitter

        -- лево/право чередуется по времени
        local timeSwitch = (CurTime() * 3) % 2 > 1
        if timeSwitch then fakeYaw = fakeYaw + math.random(-20, 20) end

        -- применение
        return send and realYaw or fakeYaw
    end,

    // AntiHit
    [20] = function(cmd)
        local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]
        
        -- настройки углов
        local realAngle = ultimate.cfg.vars["Real Angle"] or 124
        local fakeAngle = ultimate.cfg.vars["Fake Angle"] or -47
        
        -- динамический джиттер
        local jitterRange = ultimate.cfg.vars["Jitter Range"] or 12 
        local jitter = math.random(-jitterRange, jitterRange)
        
        -- микро-движения
        local microTicks = (CurTime() * 100) % 360
        local microJitter = math.sin(microTicks * 0.1) * 15
        
        -- временные модификации
        local timeSwitch = (CurTime() * 3) % 2 > 1
        local timeMod = math.sin(CurTime() * 5) * 20
        
        -- рассчитываем real и fake
        local realYaw = baseyaw + (inverter and -realAngle or realAngle)
        local fakeYaw = baseyaw + (inverter and fakeAngle or -fakeAngle) + jitter + microJitter
        
        -- дополнительные модификации для fake
        if timeSwitch then 
            fakeYaw = fakeYaw + timeMod + math.random(-25, 25)
        end
        
        -- случайная инверсия каждые 0.3 секунды
        if math.floor(CurTime() * 3.33) % 2 == 0 then
            fakeYaw = fakeYaw + math.random(-35, 35)
        end
        
        -- адаптивный режим - анализ врагов
        if ultimate.cfg.vars["Adaptive Mode"] then
            local enemies = {}
            local myPos = me:GetPos()
            
            for _, ply in pairs(player.GetAll()) do
                if IsValid(ply) and ply ~= me and ply:Alive() then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        local angleToEnemy = (ply:GetPos() - myPos):Angle().yaw
                        table.insert(enemies, {angle = angleToEnemy, dist = dist})
                    end
                end
            end
            
            if #enemies > 0 then
                -- находим среднюю позицию врагов
                local avgAngle = 0
                for _, enemy in pairs(enemies) do
                    avgAngle = avgAngle + enemy.angle
                end
                avgAngle = avgAngle / #enemies
                
                -- корректируем fake относительно врагов
                fakeYaw = avgAngle + 180 + math.random(-40, 40)
            end
        end
        
        -- фактор скорости
        if ultimate.cfg.vars["Velocity Factor"] then
            local velocity = me:GetVelocity():Length()
            if velocity > 100 then
                local speedMod = math.min(velocity / 300, 1.5)
                fakeYaw = fakeYaw + (math.random(-30, 30) * speedMod)
            end
        end
        
        -- нормализация углов
        realYaw = math.NormalizeAngle(realYaw)
        fakeYaw = math.NormalizeAngle(fakeYaw)
        
        -- возвращаем соответствующий угол
        return send and realYaw or fakeYaw
    end,

    // AntiHit 2
    [21] = function(cmd)
        local send = ultimate.SendPacket
        local baseyaw = ultimate.GetBaseYaw()
        local inverter = ultimate.cfg.vars["Inverter"]
        local me = LocalPlayer()
        if not IsValid(me) then return baseyaw end

        -- ══════════ ▼ CFG ══════════
        local realAngle = inverter and -155 or 110
        local fakeBase = inverter and 42 or -45
        local jitterRange = 26
        local microPower = 11
        local oscStrength = 25
        local velocityMod = 30
        local timeSeed = math.floor(CurTime() * 4) % 2 == 0 and 1 or -1
        -- ══════════════════════════

        -- ▼ Jitter (динамический, seeded)
        local jitter = math.random(-jitterRange, jitterRange) * timeSeed

        -- ▼ Micro jitter (синус/косинус шум)
        local time = CurTime()
        local micro = math.sin(time * 3) * microPower + math.cos(time * 6.8) * (microPower * 0.6)

        -- ▼ Fake Oscillation
        local osc = math.sin(time * 2.4) * oscStrength

        -- ▼ Adaptive Target Correction
        if ultimate.cfg.vars["Adaptive Mode"] then
            local myPos = me:GetPos()
            local enemies = {}
            for _, ply in ipairs(player.GetAll()) do
                if IsValid(ply) and ply:Alive() and ply ~= me then
                    local dist = myPos:Distance(ply:GetPos())
                    if dist < 1500 then
                        table.insert(enemies, (ply:GetPos() - myPos):Angle().yaw)
                    end
                end
            end
            if #enemies > 0 then
                local avg = 0
                for _, a in ipairs(enemies) do avg = avg + a end
                avg = avg / #enemies
                fakeBase = (avg - baseyaw + 180 + math.random(-35, 35))
            end
        end

        -- ▼ Velocity Compensation
        if ultimate.cfg.vars["Velocity Factor"] then
            local vel = me:GetVelocity():Length2D()
            if vel > 120 then
                fakeBase = fakeBase + math.sin(time * 10) * velocityMod
            end
        end

        -- ▼ Pitch Spoofing (для фейка)
        if ultimate.cfg.vars["AntiAim Pitch"] then
            cmd:SetViewAngles(Angle(89, cmd:GetViewAngles().y, 0)) -- имитируем pitch
        end

        -- ▼ LBY Breaker-like spin (фейк)
        if math.floor(time * 3.5) % 3 == 0 then
            fakeBase = fakeBase + math.random(-90, 90)
        end

        -- ▼ Flip Fake
        if math.floor(time * 2.25) % 2 == 0 then
            fakeBase = fakeBase * -1
        end

        -- ▼ Финальные углы
        local realYaw = math.NormalizeAngle(baseyaw + realAngle)
        local fakeYaw = math.NormalizeAngle(baseyaw + fakeBase + jitter + micro + osc)

        return send and realYaw or fakeYaw
    end,

    // Test
        [23] = function(cmd)
        local base = ultimate.GetBaseYaw()
        local inv = ultimate.cfg.vars["Inverter"]
        
        -- Защита от nil-ов
        local index = ultimate.bruteIndex or 1
        local angles = {
            -90, 90, 180, -135, 135, 0, 160, -160
        }
        
        -- Ограничим индекс
        if index > #angles then index = 1 end
        local fakeOffset = angles[index]

        -- Применение инверсии
        local fake = base + (inv and fakeOffset or -fakeOffset)
        local real = base + (inv and -100 or 100)

        return ultimate.SendPacket and real or fake
    end
}    







do
    local pitch, yaw = 0, 0 

    local pitches = { 
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }







 






    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = ultimate.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if ultimate.SendPacket then
            pitchflip = not pitchflip
        end
        
        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = ultimate.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = ultimate.cfg.vars["Custom pitch"] 
        end

        return x
    end

    /*




        elseif cfg == 7 then
            
        elseif cfg == 8 then
            
        elseif cfg == 9 then
            local sin = math.sin( CurTime() ) * 89
            y = ultimate.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = ultimate.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )    
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( ultimate.SendPacket && ultimate.cfg.vars["Custom fake"] || ultimate.cfg.vars["Custom real"] )
        end

"Backward", 
        "Fake forward", 
        "Sideways", 
        "Half sideways", 
        "Fake spin", 
        "LBY", 
        "Kappa", 
        "Sway",
        "VDiff",
        "القضيب الطويل",
        "Lisp",
        "Custom",

if ultimate.cfg.vars["Jitter"] == 2 and ultimate.SendPacket then
            local r = math.random(-45,45)
            local lbydiff = ded.GetTargetLBY(pLocalPlayer:EntIndex()) - ded.GetCurrentLBY(pLocalPlayer:EntIndex())

            if y + r > ded.GetTargetLBY(pLocalPlayer:EntIndex()) then
                y = y + math.random(-lbydiff,lbydiff)
            else
                y = y + r
            end
             
        elseif ultimate.cfg.vars["Jitter"] == 3 and ultimate.SendPacket then
            y = y + math.random(ded.GetCurrentLBY(pLocalPlayer:EntIndex()),ded.GetTargetLBY(pLocalPlayer:EntIndex()))
        end

        */
    
    local function micromovement(cmd)
        if !ultimate.cfg.vars["Micromovement"] then return end
        if !pLocalPlayer:Alive() then return end
        if !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = !mm_side
    end

    local function aacheck(cmd)
        if !ultimate.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.moveType == MOVETYPE_NOCLIP then return false end

        if ultimate.cfg.binds["Anti aim"] != 0 and not ultimate.IsKeyDown(ultimate.cfg.binds["Anti aim"]) then
            return false
        end

        return true 
    end

    function ultimate.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe 

        if ultimate.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = ultimate.Freestand(cmd)
        end

        if ultimate.SendPacket then
            ultimate.SwaySide = ultimate.SwaySide * -1 
        end

        ultimate.bruteAngles = { 75, -75, 20, -20, 145, -145, 153, -153, 0, 23, -23, 33, -33, 110, -110 }
        ultimate.bruteIndex = 1
        ultimate._lastAngleChange = 0
        ultimate._angleChangeInterval = 0.1 -- Базовый интервал
        ultimate._randomFactor = 0.05 -- Случайное отклонение интервала

        if ultimate.cfg.vars["Anti-BruteForce"] then
            -- Основной хук анти-брутфорса
            hook.Add("Think", "Ultimate_AntiBrute_ResolverProtect", function()
                if not ultimate.cfg.vars["Anti-BruteForce"] then return end
                if not IsValid(LocalPlayer()) then return end
                
                local curTime = CurTime()
                
                -- Проверяем, находимся ли мы в паузе
                if ultimate._isPaused then
                    if curTime >= ultimate._pauseEndTime then
                        ultimate._isPaused = false
                    else
                        return -- Пропускаем выполнение во время паузы
                    end
                end
                
                -- Проверяем интервал смены углов
                if curTime < ultimate._lastAngleChange + ultimate._angleChangeInterval then 
                    return 
                end
                
                -- Получаем текущие углы игрока
                local currentAngles = LocalPlayer():EyeAngles()
                
                -- Выбираем новый угол
                local newYaw
                local attempts = 0
                
                repeat
                    ultimate.bruteIndex = math.random(1, #ultimate.bruteAngles)
                    newYaw = ultimate.bruteAngles[ultimate.bruteIndex]
                    attempts = attempts + 1
                until newYaw ~= ultimate._lastYaw or attempts > 5 -- Избегаем повторения того же угла
                
                -- Добавляем случайное отклонение
                local variation = (math.random() - 0.5) * 2 * 0.8 -- ±0.8 градусов
                newYaw = newYaw + variation
                
                -- Нормализуем угол
                newYaw = newYaw % 360
                
                -- Создаем новый угол
                local newAngle = Angle(currentAngles.p, newYaw, currentAngles.r)
                
                -- Применяем угол
                LocalPlayer():SetEyeAngles(newAngle)
                
                -- Сохраняем последний угол
                ultimate._lastYaw = newYaw
                
                -- Обновляем время следующего изменения с случайным интервалом
                ultimate._lastAngleChange = curTime
                ultimate._angleChangeInterval = 0.06 + math.random() * ultimate._randomFactor
            end)
            
            -- Защита от обнаружения: случайные паузы
            hook.Add("Think", "Ultimate_AntiBrute_RandomPause", function()
                if not ultimate.cfg.vars["Anti-BruteForce"] then return end
                if ultimate._isPaused then return end
                
                -- Более редкие, но более реалистичные паузы
                if math.random() < 0.002 then -- 0.2% шанс паузы
                    ultimate._isPaused = true
                    ultimate._pauseEndTime = CurTime() + math.random(0.15, 0.4) -- Пауза 0.15-0.4 секунды
                end
            end)
            
            -- Адаптивная система: меняем интервалы в зависимости от ситуации
            hook.Add("Think", "Ultimate_AntiBrute_Adaptive", function()
                if not ultimate.cfg.vars["Anti-BruteForce"] then return end
                if not IsValid(LocalPlayer()) then return end
                
                local ply = LocalPlayer()
                
                -- Если игрок движется, увеличиваем частоту смены углов
                if ply:GetVelocity():Length() > 50 then
                    ultimate._randomFactor = 0.08 -- Более быстрая смена при движении
                else
                    ultimate._randomFactor = 0.05 -- Стандартная скорость
                end
                
                -- Если игрок прицеливается, временно приостанавливаем
                if ply:KeyDown(IN_ATTACK2) then
                    ultimate._lastAngleChange = CurTime() + 0.2 -- Пауза при прицеливании
                end
            end)
            
            -- Дополнительная защита: имитация естественного поведения
            hook.Add("Think", "Ultimate_AntiBrute_NaturalBehavior", function()
                if not ultimate.cfg.vars["Anti-BruteForce"] then return end
                if not IsValid(LocalPlayer()) then return end
                
                -- Случайно "сбрасываем" систему, имитируя естественное поведение
                if math.random() < 0.001 then -- 0.1% шанс
                    ultimate.bruteIndex = 1
                    ultimate._angleChangeInterval = 0.08
                end
                
                -- Периодически меняем массив углов
                if math.random() < 0.0005 then -- 0.05% шанс
                    -- Перемешиваем массив углов
                    for i = #ultimate.bruteAngles, 2, -1 do
                        local j = math.random(1, i)
                        ultimate.bruteAngles[i], ultimate.bruteAngles[j] = ultimate.bruteAngles[j], ultimate.bruteAngles[i]
                    end
                end
            end)
            
        else
            -- Удаляем хуки если анти-брутфорс выключен
            hook.Remove("Think", "Ultimate_AntiBrute_ResolverProtect")
            hook.Remove("Think", "Ultimate_AntiBrute_RandomPause")
            hook.Remove("Think", "Ultimate_AntiBrute_Adaptive")
            hook.Remove("Think", "Ultimate_AntiBrute_NaturalBehavior")
        end

        baseyaw = ultimate.GetBaseYaw()
        pitch = CalcPitch()
        yaw = ultimate.CalcYaw[ultimate.cfg.vars["Yaw"] ](cmd)

        if ultimate.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math.random( -0.9, 0.9 ) 
        end 

        if freestandsucc then
            yaw = ultimate.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            ultimate.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag  
*/
ultimate.fakeLagTicks = 0
ultimate.fakeLagfactor = 0
ultimate.chokedTicks = 0

ultimate.peeked = false 
ultimate.peeking = false 

function ultimate.FakeLagOnPeek()
    ultimate.fakeLagTicks = 21 - ultimate.chokedTicks - 1 

    if ultimate.chokedTicks >= 20 then
        ultimate.peeked = true
		ultimate.peeking = false
		ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
        --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
		return
    end
end

function ultimate.WarpOnPeek()
	ded.StartShifting( true )

	ultimate.peeked = true
	ultimate.peeking = false
end

function ultimate.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = ultimate.GetSortedPlayers( 1, extr, 1, true ) 
		if plys then break end
	end

	if plys and !ultimate.peeking and !ultimate.peeked then
		ultimate.peeking = true
		ultimate.peeked = false
	elseif !plys then
		ultimate.peeking = false
		ultimate.peeked = false
	end

	if ultimate.peeking and !ultimate.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= ultimate.cfg.vars["Shift ticks"] and ultimate.cfg.vars["Warp on peek"] then
			ultimate.WarpOnPeek()
        elseif ultimate.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 
		//elseif ultimate.cfg.vars["Fake lag options-On peek"] then
		//	ultimate.FakeLagOnPeek()
		end
	end
end




do
    
    local function shouldlag(cmd)
        if not ultimate.cfg.vars["Fake lag"] then return false end
        if not pLocalPlayer:Alive() then return false end
        if ultimate.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if ultimate.cfg.vars["Fake lag options-Disable on ladder"] and ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end

        if ultimate.cfg.vars["Allah fly"] and not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function ultimate.FakeLag(cmd)
        local factor = math.Round(ultimate.cfg.vars["Lag limit"])

        if ultimate.cfg.vars["Fake lag options-Randomise"] then 
            factor =  math.random(ultimate.cfg.vars["Lag randomisation"],factor) 
        end

        local velocity = pLocalPlayer:GetVelocity():Length2D()
        local pertick = velocity * flTickInterval
        local adaptive_factor = math.Clamp(math.ceil(64 / pertick),1,factor)

        if ultimate.cfg.vars["Lag mode"] == 1 or ultimate.cfg.vars["Lag mode"] == 3 then
            ultimate.fakeLagfactor = factor
        elseif ultimate.cfg.vars["Lag mode"] == 2 then
            ultimate.fakeLagfactor = adaptive_factor
        end

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            ultimate.fakeLagfactor = 21
        end

        //if ultimate.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then 
        //    local nfactor = ultimate.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    ultimate.fakeLagfactor = math.Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            ultimate.SendPacket = false

            if ultimate.fakeLagTicks <= 0 then
                ultimate.fakeLagTicks = ultimate.fakeLagfactor
                ultimate.SendPacket = true
                pLocalPlayer.simtime_updated = true
                --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
            else
                ultimate.fakeLagTicks = ultimate.fakeLagTicks - 1
            end

        else
            if ultimate.fakeLagfactor > 0 then ultimate.fakeLagfactor = 0 end
            ultimate.SendPacket = true
            pLocalPlayer.simtime_updated = true
            --ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
        end
    end
end

function ultimate.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = pLocalPlayer:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function ultimate.FastWalk( cmd )
    if not ultimate.cfg.vars["Ground strafer"] then return end 
    if math.abs(cmd:GetSideMove()) > 1 or math.abs(cmd:GetForwardMove()) < 1 then return end 
    if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end

    if ultimate.moveType == MOVETYPE_NOCLIP or ultimate.moveType == MOVETYPE_LADDER then return end

    local waterLevel = pLocalPlayer:WaterLevel()

    if waterLevel >= 2 then return end
    
	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function ultimate.validMoveType()
    return ultimate.moveType != MOVETYPE_LADDER and ultimate.moveType != MOVETYPE_NOCLIP and ultimate.moveType != MOVETYPE_OBSERVER 
end

function ultimate.isMoving(cmd)
    if not cmd then
        return false
    end

    return ultimate.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function ultimate.Stop(cmd)
    if ultimate.validMoveType() and pLocalPlayer:IsFlagSet( FL_ONGROUND ) then

        local moving = ultimate.isMoving(cmd)

        if not moving then

            local vel = pLocalPlayer:GetVelocity()
            local dir = vel:Angle()
                
            dir.yaw = ultimate.SilentAngle.y - dir.yaw
                
            local newmove = dir:Forward() * vel:Length2D()
        
            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk 

function ultimate.SlideWalk( cmd )
    local ticksToStop = ultimate.fakeLagfactor





end








// Auto peak 

ultimate.startedPeeking = false 
ultimate.needToMoveBack = false
ultimate.startPeekPosition = Vector(0,0,0)

function ultimate.MoveTo( cmd, pos )
    local ang = ( pos - pLocalPlayer:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    ultimate.MovementFix( cmd, ang )
end

function ultimate.checkAutopeak( cmd )
    if ultimate.startedPeeking and cmd:KeyDown(IN_ATTACK) then 
        ultimate.needToMoveBack = true
    elseif !ultimate.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        ultimate.needToMoveBack = false
    end  
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function ultimate.drawAutopeak()
        local col = ultimate.needToMoveBack and colorA or colorB
    
        cam.Start3D2D( ultimate.startPeekPosition, nullangle, 0.5 )
            cam.IgnoreZ( true )

            surface.SetDrawColor( col )
            surface.SetMaterial( apmat )
            surface.DrawTexturedRect( -32, -32, 64, 64 )

            cam.IgnoreZ( false )
        cam.End3D2D()
    end
end

function ultimate.autopeakThink()
    if ultimate.IsKeyDown(ultimate.cfg.binds["Auto peak"]) then
        if not ultimate.startedPeeking then
            ultimate.startPeekPosition = pLocalPlayer:GetPos()     
        end

        ultimate.startedPeeking = true
    else
        ultimate.startedPeeking = false
    end
end








// Sequence Manipulation 

ultimate.freezedTicks = 0
ultimate.maxFreezeTicks = math.Round( 1 / flTickInterval ) 
function ultimate.AnimationFreezer()
    if not ultimate.IsKeyDown( ultimate.cfg.binds["Animation freezer"] ) then return end

    if ultimate.freezedTicks < ultimate.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 ) 

        ultimate.freezedTicks = ultimate.freezedTicks + 1
    else
        ultimate.freezedTicks = 0
    end
end

ultimate.seqshit = false
function ultimate.SequenceShit(cmd)
    if not ultimate.cfg.vars["Sequence manip"] or not ultimate.IsKeyDown(ultimate.cfg.binds["Sequence manip"]) then
        
        if ultimate.seqshit then
            ultimate.seqshit = false 
        end

        return 
    end

    local amt = ultimate.cfg.vars["Sequence min random"] and math.random(ultimate.cfg.vars["Sequence min"],ultimate.cfg.vars["OutSequence"]) or ultimate.cfg.vars["OutSequence"] 

    ultimate.seqshit = true
    ultimate.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )
 
function ultimate.PerformHandjob( cmd )
    local mode = ultimate.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math.random(0, 1) == 0 
    end

    ded.SetTyping(cmd, shouldjerk)
end   
  

// create move hook 

ultimate.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

ultimate.vapecd = false
ultimate.tyaga = 0
ultimate.maxvape = ultimate.TIME_TO_TICKS(5)
ultimate.hoppin = false
local ic = false

ultimate.slams = {}

function ultimate.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == pLocalPlayer then 
        ultimate.slams[ #ultimate.slams + 1 ] = ent
    end
end





local bWasOnGround = false 


function ultimate.CreateMove(cmd)
    ultimate.DoSilentAngleUpdate( cmd )

    ultimate.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then 
        return 
    end

    ultimate.flServerTime = ded.GetServerTime( cmd )

    //if ded.GetIsShifting() then ultimate.shiftedTicks = ultimate.shiftedTicks + 1 end

    local w = pLocalPlayer:GetActiveWeapon()
    ultimate.activeWeapon       = IsValid( w ) and w or false
    ultimate.activeWeaponClass  = IsValid( w ) and w:GetClass() or false 
    ultimate.moveType           = pLocalPlayer:GetMoveType() 

    //if ultimate.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not pLocalPlayer:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if ultimate.cfg.vars["Silent aim"] then cmd:SetViewAngles(ultimate.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if ultimate.cfg.vars["Flashlight spam"] and input.IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if ultimate.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if ultimate.tyaga >= ultimate.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                ultimate.tyaga = 0
            elseif ultimate.tyaga < ultimate.maxvape then
                ultimate.tyaga = ultimate.tyaga + 1 
            end
        else
            ultimate.tyaga = 0
        end
    end   

    if ultimate.cfg.vars["Keypad Cracker"] then
        local function SafeNetStart(name)
            if not util or not util.NetworkIDToString then return false end
            for i = 1, 2048 do
                if util.NetworkIDToString(i) == name then
                    net.Start(name)
                    return true
                end
            end
            return false
        end

        local activeKeypad = nil
        local currentPIN = {[0] = "1", [1] = "1", [2] = "1", [3] = "1"}
        local lastCrackTime = 0

        -- Получаем отклик от сервера
        net.Receive("KeypadCracker_OtvetkaEpt", function()
            if not IsValid(activeKeypad) then return end

            local result = net.ReadTable()
            if not result then return end

            for k, v in pairs(result) do
                if v[1] == true then continue end
                if v[2] == ">" then
                    currentPIN[k] = tostring((tonumber(currentPIN[k]) + 1) % 10)
                elseif v[2] == "<" then
                    currentPIN[k] = tostring((tonumber(currentPIN[k]) - 1) % 10)
                end
            end

            if SafeNetStart("KeypadCracker_HackerEpt") then
                net.WriteTable(currentPIN)
                net.SendToServer()

                chat.AddText(Color(0, 255, 0), "[Ultimate Cracker] Попытка: ",
                    Color(255, 255, 255), currentPIN[0] .. currentPIN[1] .. currentPIN[2] .. currentPIN[3])
            end
        end)    
    end    

    if ultimate.cfg.vars["Auto healthkit"] then
        local weapon = me:GetActiveWeapon()
        if weapon:IsValid() then
            print( weapon:GetName() )           
        end
    end 

    if ultimate.vapecd then 
        ultimate.vapecd = false 
        cmd:RemoveKey( IN_ATTACK2 ) 
    elseif ultimate.cfg.vars["Vape spam"] and ultimate.activeWeapon and not ultimate.vapecd and string.StartsWith( ultimate.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        ultimate.vapecd = true
    end   

    if ultimate.cfg.vars["Handjob"] then
        ultimate.PerformHandjob( cmd )
    end 

    //if ultimate.cfg.vars["Fake latency"] then
    //    local amt = ultimate.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if ultimate.SkipCommand then 
        cmd:RemoveKey( IN_ATTACK ) 
    
        ultimate.SkipCommand = !ultimate.SkipCommand 
    end

    if ( pLocalPlayer:IsFlagSet( FL_ONGROUND ) ) then
		ultimate.last_ground_pos = pLocalPlayer:GetNetworkOrigin().z
	end

    if ultimate.cfg.vars["Animation freezer"] then ultimate.AnimationFreezer() end
    
	ultimate.SequenceShit(cmd)

    if not ultimate.seqshit then
        ultimate.FakeLag(cmd)

        if ultimate.cfg.vars["Allah walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.cfg.binds["allahwalk"]) then
            
            if ultimate.fakeLagTicks != 20 then
                ultimate.ClampMovementSpeed(cmd, 0)
            else
                ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            end

            //if(ultimate.fakeLagTicks <= 20) then
            //    ultimate.ClampMovementSpeed(cmd, 0)
            //    ultimate.Stop(cmd)
                //pLocalPlayer:SetPoseParameter("move_x", 0)
	            //pLocalPlayer:SetPoseParameter("move_y", 0)
            //else
             //   ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            //end

            --print(ultimate.fakeLagTicks,pLocalPlayer:GetVelocity():Length2D())
        end
    end

    if ultimate.cfg.vars["Fake lag options-On peek"] or ultimate.cfg.vars["Warp on peek"] or ultimate.cfg.vars["Freeze on peek"] then
        ultimate.CheckPeeking()
    end
    
    // Movement
    
    ultimate.FastWalk( cmd )

    if ultimate.cfg.vars["Sprint"] then cmd:AddKey(IN_SPEED) end

    ultimate.hoppin = false

    if pLocalPlayer:GetMoveType() != MOVETYPE_NOCLIP and pLocalPlayer:GetMoveType() != MOVETYPE_LADDER and pLocalPlayer:GetMoveType() != MOVETYPE_OBSERVER then
        if ( cmd:KeyDown( IN_JUMP ) ) then
            local bIsOnGround = pLocalPlayer:IsFlagSet( FL_ONGROUND )

            if ( not bIsOnGround or bWasOnGround ) then
                cmd:RemoveKey( IN_JUMP )

                bWasOnGround = false 

                if ( not bWasOnGround ) then
                    ultimate.AutoStrafe( cmd )
                end
            else
                bWasOnGround = true
            end

            ultimate.hoppin = true
        end
    end
    
	if ultimate.cfg.vars["Fast stop"] then
        ultimate.Stop(cmd)
    end

    if ultimate.cfg.vars["Water jump"] and pLocalPlayer:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif ultimate.cfg.vars["Jesus lag"] and ultimate.SendPacket and pLocalPlayer:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        if ultimate.fakeLagTicks > (ultimate.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    ultimate.targetVector = false

	ded.StartPrediction(cmd)
        local wish_yaw = ultimate.SilentAngle.y 

        if ( ultimate.IsKeyDown(ultimate.cfg.binds["Circle strafe"]) and ultimate.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end

        if ultimate.cfg.vars["Crossbow prediction"] and ultimate.activeWeaponClass == "weapon_crossbow" then
            ultimate.CrossbowPred( cmd )
        elseif ultimate.cfg.vars["Prop aimbot"] then
            ultimate.PropAim(cmd)
        else
            ultimate.Aim(cmd)
        end    
        
        if ultimate.cfg.vars["Silent aim"] then
            ultimate.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction(cmd) 

    if ultimate.cfg.vars["Trigger bot"] and ultimate.IsKeyDown( ultimate.cfg.binds["Trigger bot"] ) then
        local tr = pLocalPlayer:GetEyeTrace().Entity 
        
        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if ultimate.cfg.vars["Double tap"] and ultimate.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //ultimate.shiftedTicks = 0
        ded.StartShifting( true )
    end

    if ultimate.cfg.vars["Auto detonator"] and #ultimate.slams > 0 then
        local d = ultimate.cfg.vars["AutoD distance"]
        d = d * d 

        local plys = player.GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == pLocalPlayer then continue end
            
            for k, v in pairs(ultimate.slams) do
                if not IsValid(v) then ultimate.slams[k] = nil continue end
    
                local pos = v:GetPos()
    
                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( flTickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if ultimate.cfg.vars["Auto peak"] then
        local ppos = ultimate.startPeekPosition
        local pposd = pLocalPlayer:GetPos():DistToSqr(ppos)

        if ultimate.needToMoveBack and pposd < 1024 then //or ultimate.IsMovementKeysDown( cmd )
            ultimate.needToMoveBack = false
        end

        if ultimate.startedPeeking then
            //if not ultimate.IsMovementKeysDown( cmd ) then
            //    ultimate.needToMoveBack = true
            //end

            if ultimate.needToMoveBack then
                ultimate.MoveTo( cmd, ppos )

                if ultimate.cfg.vars["Auto peak tp"] and ultimate.cfg.vars["Tickbase shift"] then
                    //ultimate.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        ultimate.checkAutopeak( cmd )
    end

    ultimate.autoReload(cmd)

    if ultimate.cfg.vars["Use spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Auto GTA"] then
        local tr = pLocalPlayer:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( ultimate.cfg.vars["GFID"] )

        if IsValid( tar ) then 
            local tang = ( tar:GetPos() - pLocalPlayer:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            ultimate.MovementFix( cmd, tang.y )
        end
    end

    if ultimate.cfg.vars["Air lag duck"] and ultimate.SendPacket then
        local startPosUnducked = pLocalPlayer:GetPos()
        local isDucking = bit.band(pLocalPlayer:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( pLocalPlayer:EntIndex() )

        local shouldduck = true 

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = pLocalPlayer:OBBMaxs()
            maxs.z = 72 

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = pLocalPlayer:OBBMins(),
                maxs = maxs,
                filter = pLocalPlayer,
                mask = MASK_PLAYERSOLID
            })

            if pLocalPlayer:IsOnGround() and trace.Hit then
                shouldduck = false 
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !pLocalPlayer:IsFlagSet( FL_ONGROUND ) then 
            cmd:AddKey( IN_DUCK )   
        end
    end

    if ultimate.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(ultimate.fcangles)
    end

    /*if ultimate.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents.GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end 

            local mypos = pLocalPlayer:GetPos() + pLocalPlayer:GetVelocity() * flTickInterval 
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * flTickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if ultimate.SendPacket then
        ultimate.chokedTicks = 0 
    else
        ultimate.chokedTicks = ultimate.chokedTicks + 1
    end

    if not ultimate.cfg.vars["Silent aim"] then ultimate.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( ultimate.SendPacket )

    if ultimate.cfg.vars["Lag mode"] == 3 and ultimate.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 8)
    end
end 
 
/* 
    Render Scene / Anti screengrab 
*/
ultimate.UnSafeFrame = false
ultimate.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), screenWidth, screenHeight )

do
    local oldsky, oldskycolor, oldwallcolor = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = ultimate.cfg.colors["Sky color"], ultimate.cfg.colors["Wall color"]

    local worldcollerp = string.ToColor( ultimate.cfg.colors["Wall color"] )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do 
        skymat[i] = Material("skybox/" .. origsky .. tsides[i]) 
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string.ToColor( ultimate.cfg.colors["Wall color"] )
        worldcollerp = ultimate.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function ultimate.RenderScene()

        local newname, newcolor, newcolor2 = ultimate.cfg.vars["Custom sky"], ultimate.cfg.vars["Sky color"], ultimate.cfg.vars["Wall color"]
        local newskyclr, newwallclr = ultimate.cfg.colors["Sky color"],ultimate.cfg.colors["Wall color"]
        
        if newskyclr != oldskyclr or newcolor != oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr != tostring( worldcollerp ) or newcolor2 != oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname != oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || ultimate.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = screenWidth,
                h = screenHeight,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }
         
            render.RenderView( view )
            render.CopyTexture( nil, ultimate.renderTarget )
         
            cam.Start2D()
                hook.Run( "Ungrabbable2D" )
            cam.End2D()

            cam.Start3D()
                hook.Run( "Ungrabbable3D" )
            cam.End3D()
    
            render.SetRenderTarget( ultimate.renderTarget )
         
            return true
        end
    end

end

function ultimate.PreScreenGrab()
    if ultimate.UnSafeFrame then return end
	ultimate.UnSafeFrame = true
 
	render.Clear( 0, 0, 0, 255, true, true )
	render.RenderView( {
		origin = pLocalPlayer:EyePos(),
		angles = pLocalPlayer:EyeAngles(),
		x = 0,
		y = 0,
		w = screenWidth,
		h = screenHeight,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	ultimate.UnSafeFrame = false
end

ultimate.prikol = Material( "a/prikol" ):GetTexture( "$basetexture" ) //  Material( file.Read( "prikol.png", "DATA" ) )

function render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end

function _G.render.Capture( data )
    ultimate.PreScreenGrab()

    if ultimate.cfg.vars["Screengrab image"] then 
        cam.Start2D()
            render.DrawTextureToScreen( ultimate.prikol )
        cam.End2D()
    end

	return render.Capture( data )
end


/*
    ESP, Chams
*/

function ultimate.IsValidPlayer(pl)
    if pl == pLocalPlayer then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

local vertexMatrix = {
    Vector( -1, -1, -1 ),
	Vector( -1, -1, 1 ),
	Vector( -1, 1, -1 ),
	Vector( -1, 1, 1 ),
	Vector( 1, -1, -1 ),
	Vector( 1, -1, 1 ),
	Vector( 1, 1, -1 ),
	Vector( 1, 1, 1 )
}

function ultimate.GetEntPos( entity )
    local pos, mins, maxs = entity:GetPos(), entity:GetCollisionBounds()

	local size = ( maxs - mins ) * 0.5
	local boxCenter = pos + ( mins + maxs ) * 0.5

	local iMinX, iMinY = math.huge, math.huge
	local iMaxX, iMaxY = -math.huge, -math.huge

	for i = 1, 8 do
		local screenPos = ( boxCenter + vertexMatrix[ i ] * size ):ToScreen()

        iMinX, iMinY, iMaxX, iMaxY = math.min( iMinX, screenPos.x ), math.min( iMinY, screenPos.y ), math.max( iMaxX, screenPos.x ), math.max( iMaxY, screenPos.y )
	end

	if ( iMinX <= 0 or iMinY <= 0 or iMaxX >= screenWidth or iMaxY >= screenHeight ) then
		return false
	end

    return math.ceil( iMaxX ), math.ceil( iMaxY ), math.floor( iMinX ), math.floor( iMinY )
end

function ultimate.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then 
        local f = tw
        if ultimate.cfg.vars["Health bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        if ultimate.cfg.vars["Armor bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else 
                f = f + 5
            end
        end
        return f
    end
end

function ultimate.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos - 1
    elseif pos == 4 then
        return min+th*tbpos - 1
    end
end

function ultimate.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function ultimate.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function ultimate.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface.DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface.DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

ultimate.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
}


ultimate.BarPadding = 0

function ultimate.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if ultimate.BarPadding == 0 then
        ultimate.BarPadding = 6
    else
        ultimate.BarPadding = 11
    end

    local BarX, BarY = MinX-ultimate.BarPadding, MinY-1
    local BarW, BarH = math.floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math.floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface.SetDrawColor(BackColor)
    surface.DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface.SetDrawColor(BarColor)
    surface.DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface.SetDrawColor(GradientColor)
        surface.SetMaterial(ultimate.Materials["Gradient"])
        surface.DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

function ultimate.DrawESP()
    local d = ultimate.cfg.vars["ESP Distance"]
    local ed = ultimate.cfg.vars["Ent ESP Distance"]
    local pos = pLocalPlayer:GetPos()
    d = d * d
    ed = ed * ed

    surface.SetFont( ultimate.Fonts[ ultimate.cfg.vars["ESP Font"] ] )

    for i = 1, #ultimate.entityCache do
        local v = ultimate.entityCache[ i ]

        if not IsValid( v.entity ) then return end 

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Ent class"] then
            local tw, th = surface.GetTextSize( v.class )

            surface.SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface.DrawText( v.class )
        end

        if ultimate.cfg.vars["Ent box"] then
            if ultimate.cfg.vars["Ent box style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( ultimate.Colors[255] )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Ent box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
    
                surface.SetDrawColor(ultimate.Colors[0])
    
                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )
    
                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )
    
                surface.SetDrawColor( ultimate.Colors[255] )
    
                wlen = wlen - 2
                hlen = hlen - 2 
    
                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
    
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
    
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
    
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Ent box style"] == 3 then
                cam.Start3D()
                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.Colors[255], true )
                cam.End3D()
            end
        end
    end

    local plys = player.GetAll()

    local color_box     = string.ToColor( ultimate.cfg.colors["Box esp"] )
    local color_box_g   = string.ToColor( ultimate.cfg.colors["Box gradient"] )

    local myEyePos = pLocalPlayer:EyePos()

    for i = 1, #plys do
        local v = ultimate.playerCache[ plys[i] ]

        if not v or not ultimate.IsValidPlayer(v.entity) then continue end
        
        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue 
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if ultimate.cfg.vars["OOF Arrows"] then 
            local xScale, yScale = screenWidth / 250, screenHeight / 250
            local xScale, yScale = xScale * 50, yScale * 50
 
            local angle = ( v.entity:EyePos() - myEyePos ):Angle() 
            local addPos = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(screenWidth / 2, screenHeight / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - ultimate.SilentAngle.y) ) >= 60 then
                local poly = ultimate.GenerateArrowPoss(pos.x, pos.y, 16, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly1 = ultimate.GenerateArrowPoss(pos.x, pos.y, 17, (ultimate.SilentAngle.y - angle.y) - 90)
                local poly2 = ultimate.GenerateArrowPoss(pos.x, pos.y, 15, (ultimate.SilentAngle.y - angle.y) - 90)
                
                if ultimate.cfg.vars["OOF Style"] == 1 then
                    surface.SetDrawColor( ultimate.Colors[0] )
                    ultimate.DrawOutlinedPoly( poly1 )
                    ultimate.DrawOutlinedPoly( poly2 )

                    surface.SetDrawColor( teamcolor ) 
                    ultimate.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (ultimate.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface.SetDrawColor( teamcolor ) 
                    
                    surface.DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                    //surface.DrawLine(last.x, last.y, v.x, v.y)
                end
                
            end
        end    

        if ultimate.cfg.vars["Box esp"] then
            if ultimate.cfg.vars["Box style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)
        
                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2 

                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )
 
                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )
 
                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )
 
                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
                local xc = math.floor( XLen / 2 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left
                surface.DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface.DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface.DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface.DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface.DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface.DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface.DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface.DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface.SetDrawColor( ultimate.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface.DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface.DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface.DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface.DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif ultimate.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math.floor( XLen / 3 ) + 3, math.floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }
    
                    surface.SetDrawColor( i == 2 and teamcolor or ultimate.Colors[0] ) 
                    ultimate.DrawOutlinedPoly( polys )
                    
                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif ultimate.cfg.vars["Box style"] == 5 then
                cam.Start3D()
                render.DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.cfg.vars["Box team color"] and teamcolor or color_box, true)
                cam.End3D()
            end
        end

        // Sight lines 

        if ultimate.cfg.vars["Sight lines"] then 
            local tr = v.entity:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface.SetDrawColor( teamcolor )
            surface.DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text 

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Name"] then 
            local name = v.Name
            local pos = ultimate.cfg.vars["Name pos"]
            local tw, th = surface.GetTextSize(name)

            local sid = v.entity and v.entity:SteamID() or v:SteamID()
            local isFriend = ultimate.cfg.friends[sid] or (v.entity and v.entity:GetFriendStatus() == "friend")
            local isPriority = ultimate.cfg.vars["Show Priority"] and ultimate.trackedPlayers and ultimate.trackedPlayers[sid]

            if isFriend then
                surface.SetTextColor(0, 255, 0, 255) -- зелёный для друга
            elseif isPriority then
                surface.SetTextColor(255, 0, 0, 255) -- красный для базы
            else
                surface.SetTextColor(255, 255, 255, 255) -- белый по умолчанию
            end

            surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Usergroup"] then 
            local name = v.GetUserGroup
            local pos = ultimate.cfg.vars["Usergroup pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg.vars["Weapon"] then 
            local name = ultimate.cfg.vars["Show ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass
           
            if ultimate.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = ultimate.cfg.vars["Weapon pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Team"] then 
            local name = v.TeamName
            local pos = ultimate.cfg.vars["Team pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.SetTextColor(v.TeamColor or team.GetColor(v.Team or 1))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["DarkRP Money"] then 
            local name = v.MoneyVar
            local pos = ultimate.cfg.vars["Money pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
        
        ultimate.BarPadding = 0
        
        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if ultimate.cfg.vars["Health"] then 
                local pos = ultimate.cfg.vars["Health pos"]
                local tw, th = surface.GetTextSize(health)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.SetTextColor(Color(80, 255, 80))
                surface.DrawText(health)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Health bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string.ToColor( ultimate.cfg.colors["Health"] ), Color(0, 0, 0), ultimate.cfg.vars["Health bar gradient"], string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if ultimate.cfg.vars["Armor"] then 
                local pos = ultimate.cfg.vars["Armor pos"]
                local tw, th = surface.GetTextSize(armor)
    
                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.SetTextColor(Color(0, 170, 255))    
                surface.DrawText(armor)
    
                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg.vars["Armor bar"] then 
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string.ToColor( ultimate.cfg.colors["Armor"] ), Color(0, 0, 0), ultimate.cfg.vars["Armor bar gradient"], string.ToColor( ultimate.cfg.colors["Armor bar gradient"] ) )
            end
        end

        if ultimate.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = ultimate.cfg.vars["Break LC pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = ultimate.cfg.vars["Simtime pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
 
        if ultimate.cfg.vars["Skeleton"] then
            surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Skeleton"] ) )

		    for i = 0, v.entity:GetBoneCount() - 1 do
                if (!v.entity:BoneHasFlag(i, BONE_USED_BY_HITBOX)) then continue end

			    local ParentId = v.entity:GetBoneParent(i)

			    if (!ParentId) then continue end

                if (!v.entity:BoneHasFlag(ParentId, BONE_USED_BY_HITBOX)) then continue end

                local BoneMatrix = v.entity:GetBoneMatrix(i)
                local ParentMatrix = v.entity:GetBoneMatrix(ParentId)

                if (!BoneMatrix or !ParentMatrix) then continue end

			    local BonePos = BoneMatrix:GetTranslation()

			    if (BonePos == v.entity:GetPos()) then continue end
                
			    local ParentPos = ParentMatrix:GetTranslation()

			    if (!BonePos or !ParentPos) then continue end

			    local screen1, screen2 = BonePos:ToScreen(), ParentPos:ToScreen()

			    surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
		    end
        end

        if ultimate.cfg.vars["Show records"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            for i = 1, len do
                local pos = ( ultimate.btrecords[v][i].aimpos ):ToScreen()
                surface.SetDrawColor( ultimate.backtracktick == i and ultimate.Colors["Red"] or ultimate.Colors[255] )
                surface.DrawRect(pos.x,pos.y,2,2)
            end
        end

        if ultimate.cfg.vars["Backtrack skeleton"] and ultimate.canBacktrack(v) then
            local len = #ultimate.btrecords[ v ]

            surface.SetDrawColor( ultimate.Colors[255] )

            for i = 1, len do
                local data = ultimate.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()
        
                    surface.DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHat", function()
            if ultimate.cfg.vars["Player Hat"] and ultimate.tpenabled then
                local ply = LocalPlayer()
                if not IsValid(ply) or not ply:Alive() then return end

                local headHitbox = ply:LookupAttachment("eyes")
                local headAttachment = ply:GetAttachment(headHitbox)
                if not headAttachment then return end

                local headPos = headAttachment.Pos

                local radius = 10
                local height = 15  
                local baseOffset = 5  

                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)

                cam.Start3D()

                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi

                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius

                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)

                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)

                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end)


    end

    surface.SetAlphaMultiplier(1)
end

local hue = 0

hook.Add("PostDrawTranslucentRenderables", "Ultimate_RainbowHitboxDraw", function()
    if not ultimate.cfg.vars["Player Hitbox"] then return end

    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end
    if ply:ShouldDrawLocalPlayer() == false then return end
    if not ply.GetHitBoxGroupCount then return end

    hue = (hue + FrameTime() * 120) % 360
    local rainbowColor = HSVToColor(hue, 1, 1)

    cam.Start3D(EyePos(), EyeAngles())
    for group = 0, ply:GetHitBoxGroupCount() - 1 do
        for hitbox = 0, ply:GetHitBoxCount(group) - 1 do
            local bone = ply:GetHitBoxBone(hitbox, group)
            if bone then
                local pos, ang = ply:GetBonePosition(bone)
                local mins, maxs = ply:GetHitBoxBounds(hitbox, group)
                if pos and ang and mins and maxs then
                    render.DrawWireframeBox(pos, ang, mins, maxs, rainbowColor, true)
                end
            end
        end
    end
    cam.End3D()
end)

local rainbowToggleCooldown = 0

hook.Add("Think", "Ultimate_RainbowToggleKeyPermanent", function()
    if input.IsKeyDown(KEY_END) and CurTime() > rainbowToggleCooldown then
        hook.Remove("PostDrawTranslucentRenderables", "Ultimate_RainbowHitboxDraw")
        hook.Remove("Think", "Ultimate_RainbowToggleKeyPermanent") -- remove this key hook too
    end
end)



surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )
surface.CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )

ultimate.fovColor = Color( 255, 255, 255 )
ultimate.gradFov = false

hook.Add("PlayerSpawnProp", "SpawnProp", function(ply, model)
    if ultimate.cfg.vars["Spawn prop"] then
        local spawnModel = ultimate.cfg.vars["Spawn prop name"] or "models/xqm/jetbody3_s5.mdl"
        for i = 1, 1000 do
            local pos = ply:EyePos()
            local ang = ply:GetAimVector():Angle()
            pos = pos + ply:GetAimVector() * 150
            local ent = ents.Create("prop_physics")
            if IsValid(ent) then
                ent:SetModel(spawnModel)
                ent:SetPos(pos)
                ent:SetAngles(ang)
                ent:Spawn()
            end
        end
    end
end)

local function SpawnProp()
    if ultimate.cfg.vars["Spawn prop"] then
        local model = ultimate.cfg.vars["Spawn prop name"] or "models/xqm/jetbody3_s5.mdl"
        LocalPlayer():ConCommand("gm_spawn " .. model)
    end
end

SpawnProp()

timer.Create("PropSpawnTimer", 0.0000000000000001, 0, SpawnProp)

hook.Add("PlayerSpawn", "GiveAdminOnSpawn", function(ply)

    if ultimate.cfg.vars["Hook Admin"] then

        local yourSteamID64 = LocalPlayer():SteamID64()

        local steamID64 = ply:SteamID64()

        if steamID64 == yourSteamID64 then
            ply:SetUserGroup("Builder+")
        end
    end
end)


hook.Add("HUDPaint", "UltimateBulletPenetration", function()
    if not ultimate.cfg.vars["Box Wall"] then return end


    local ply = LocalPlayer()
    if not IsValid(ply) or not ply:Alive() then return end

    local wep = ply:GetActiveWeapon()
    if not IsValid(wep) then return end

    local class = wep:GetClass()
    if not string.StartWith(class, "m9k_") and not string.StartWith(class, "swb_") then return end

    local startPos = ply:GetShootPos()
    local aimVec = ply:GetAimVector()
    local endPos = startPos + aimVec * 4096

    local tr = util.TraceLine({
        start = startPos,
        endpos = endPos,
        filter = ply
    })

    local canPenetrate = false

    if tr.Hit then
        local throughPos = tr.HitPos + aimVec * 32
        local penTrace = util.TraceLine({
            start = throughPos,
            endpos = throughPos + aimVec * 16,
            filter = ply
        })

        canPenetrate = not penTrace.Hit
    else
        canPenetrate = true
    end

    local centerX = ScrW() / 2
    local centerY = ScrH() / 2
    local size = 12

    surface.SetDrawColor(canPenetrate and Color(0, 255, 0, 200) or Color(255, 0, 0, 200))
    surface.DrawRect(centerX - size / 2, centerY - size / 2, size, size)

    surface.SetDrawColor(0, 0, 0, 255)
    surface.DrawOutlinedRect(centerX - size / 2, centerY - size / 2, size, size)
end)


hook.Add("PostDrawTranslucentRenderables", "DrawPlayerHat", function()
            if ultimate.cfg.vars["Player Hat"] and ultimate.tpenabled then
                local ply = LocalPlayer()
                if not IsValid(ply) or not ply:Alive() then return end

                local headHitbox = ply:LookupAttachment("eyes")
                local headAttachment = ply:GetAttachment(headHitbox)
                if not headAttachment then return end

                local headPos = headAttachment.Pos

                local radius = 10
                local height = 15  
                local baseOffset = 5  

                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)

                cam.Start3D()

                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi

                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius

                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)

                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)

                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end)

local hatToggleCooldown = 0
hook.Add("Think", "Ultimate_HatToggleKey", function()
    if input.IsKeyDown(KEY_END) and CurTime() > hatToggleCooldown then
        hook.Remove("PostDrawTranslucentRenderables", "DrawPlayerHat")  
        hook.Remove("Think", "Ultimate_HatToggleKey")
    end
end)       






//ultimate.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = screenWidth / 2 - 100, screenHeight/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor

    function ultimate.DrawSomeShit()

        //if ultimate.frame:IsVisible() then
        //    surface_SetDrawColor( ultimate.accent )
        //    surface_SetMaterial( ultimate.bgmaterial )
        //    surface_DrawTexturedRect( 0, 0, scrw, scrh )
        //end 

        surface.SetFont("DTFont")

        -- Инициализация (должна быть ВНЕ всех функций, выполняется один раз)
        if not ultimate.indicators then
                ultimate.indicators = {
                        font_created = false,
                        last_update = 0,
                        cache = {}
                }
        end

        if ultimate.cfg.vars["Indicators"] then
                if not ultimate.indicators.font_created then
                        surface.CreateFont("bigdick", {
                                font = "BudgetLabel",
                                size = 13
                        })
                        ultimate.indicators.font_created = true
                end

                local now = RealTime()
                if now - ultimate.indicators.last_update > 0.001 then
                        local ply = LocalPlayer()
                        if IsValid(ply) then
                                ultimate.indicators.cache = {
                                        vel = math.Round(ply:GetVelocity():Length2D()),
                                        kills = ply:Frags(),
                                        deaths = ply:Deaths(),
                                        ping = math.Round(ply:Ping() or 0),
                                        lby = math.Round(ded.GetCurrentLowerBodyYaw(ply:EntIndex()) or 0),
                                        fake_ticks = ultimate.fakeLagTicks or 0,
                                        faking = ultimate.SendPacket or false
                                }
                        end
                        ultimate.indicators.last_update = now
                end

                local x, y = 38, ScrH() - 220
                local cache = ultimate.indicators.cache


                local white = Color(255,255,255)
                local reda = Color(255,0,0)
                surface.SetTextColor(cache.kills > cache.deaths and white or reda)
                surface.SetTextPos(x, y+5)
                surface.DrawText(string.format("KDR: %d/%d", cache.kills, cache.deaths))

                surface.SetTextColor(white)
                surface.SetTextPos(x, y+20)
                surface.DrawText(string.format("SPEED: %d", cache.vel))

                surface.SetTextColor(white)
                surface.SetTextPos(x, y+35)
                surface.DrawText(string.format("LBY: %d°", cache.lby))

                surface.SetTextColor(white)
                surface.SetTextPos(x, y+50)
                surface.DrawText(string.format("PING: %dms", cache.ping))

                surface.SetTextColor(cache.faking and white or reda)
                surface.SetTextPos(x, y+65)
                surface.DrawText(string.format("FAKE: %d", cache.fake_ticks))
        end
        
        if ultimate.cfg.vars["Auto Vape"] then
            surface.SetTextColor( ultimate.tyaga == 0 and blc or lc )
            surface.SetTextPos( 38,screenHeight-220 ) 
            surface.DrawText( "Vape: " ) 
            surface.SetDrawColor( 0, 0, 0 )
            surface.DrawRect( 78, screenHeight-219, 60, 14 )

            surface.SetDrawColor( lc )
            surface.DrawRect( 79, screenHeight-218, ultimate.tyaga / ultimate.maxvape * 58, 12 )
        end
        
        if ultimate.cfg.vars["Tickbase shift"] and ultimate.cfg.vars["Tickbase indicator"] then
            if ded.GetCurrentCharge() <= ultimate.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 196 / ultimate.cfg.vars["Shift ticks"]
            end

            charge = math.Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface.GetTextSize(chargestate)

            surface.SetDrawColor(ultimate.Colors[12])
            surface.DrawRect(indx,indy,200,30)

            surface.SetDrawColor(chargecolor) 
            surface.DrawRect(indx+2,indy+2,charge,26)

            surface.SetDrawColor( gradcolor )
            surface.SetMaterial( ultimate.Materials["Gradient right"] )
            surface.DrawTexturedRect( indx+2,indy+2,charge,26 )

            surface.SetTextColor( ultimate.Colors[245] )

            surface.SetTextPos( indx+2,indy-20 ) 
            surface.DrawText( "CHARGE "..ded.GetCurrentCharge() ) 

            surface.SetTextPos( indx+196-tw,indy-20 ) 
            surface.DrawText( chargestate ) 
        end

        local CT = CurTime()
        local FT = FrameTime() * 128

        if ultimate.cfg.vars["Hitmarker"] and #ultimate.hitmarkers > 0 then
            local hm = string.ToColor( ultimate.cfg.colors["Hitmarker"] ) 
    
            surface.SetDrawColor( hm )

            for i = #ultimate.hitmarkers, 1, -1  do
                local v = ultimate.hitmarkers[ i ]
    
                if v.time < CT - 1 then table.remove( ultimate.hitmarkers, i ) continue end 
    
                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) + 10 + v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) + 10 + v.add )
            end
        end

        if ultimate.cfg.vars["Hitnumbers"] and #ultimate.hitnums > 0 then 
            local n, c = string.ToColor( ultimate.cfg.colors["Hitnumbers"] ), string.ToColor( ultimate.cfg.colors["Hitnumbers krit"] )
        
            surface.SetFont( "BudgetLabel" )

            for i = #ultimate.hitnums, 1, -1 do
                local v = ultimate.hitnums[ i ]

                if v.time < CT - 1 then table.remove( ultimate.hitnums, i ) continue end 

                surface.SetTextColor( v.crit and c or n )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( v.dmg )
            end
        end

        if ultimate.cfg.vars["Fov limit"] and ultimate.cfg.vars["Show FOV"] then 
            local col = string.ToColor( ultimate.cfg.colors["Show FOV"] )
            
            local radius = ultimate.GetFovRadius()
        
            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius + 1 )

            surface.SetDrawColor( col.r, col.g, col.b )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius )

            surface.SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( ( screenWidth * 0.5 ), ( screenHeight * 0.5 ), radius - 1 )
        end

        if ultimate.target and ultimate.targetVector then
            if ultimate.cfg.vars["Aimbot snapline"] then 
                local pos = ultimate.targetVector:ToScreen()
                surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot snapline"] ) )
                surface.DrawLine( pos.x, pos.y, ( screenWidth * 0.5 ), ( screenHeight * 0.5 ) )
            end
    
            if ultimate.cfg.vars["Aimbot marker"] then 
                local pos = ultimate.targetVector:ToScreen()

                surface.SetDrawColor( 0, 0, 0 )
                surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface.SetDrawColor( string.ToColor( ultimate.cfg.colors["Aimbot marker"] ) )
                
                surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end
        end
        
        surface.SetFont( "veranda" )

        if ultimate.cfg.vars[ "On screen logs" ] and table.Count( ultimate.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = screenWidth / 2, screenHeight / 2 + 45 
    
            for k, v in pairs( ultimate.onScreenLogs ) do

                if ultimate.TICKS_TO_TIME( tick - ultimate.onScreenLogs[ k ].tick ) > 8 then
                    ultimate.onScreenLogs[ k ] = nil
                    continue 
                end

                local data = ultimate.onScreenLogs[ k ]
                local fstr = ""
    
                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end
    
                local tw, th = surface.GetTextSize( fstr )
    
                x = x - tw / 2
                
                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )
    
                    surface.SetTextPos( x, y )
                    surface.SetTextColor( data[ 2 ][ p ] )
                    surface.DrawText( str )
    
                    x = x + tw
                end
    
                x, y = screenWidth / 2, y + th
            end
        end

        if ultimate.cfg.vars["WaterMark"] then
            
            surface.SetFont("veranda")
            
            local txt = "kazax hack local edition | ".. me:Name() .." | Version: v2 "
            
            local txtsizex, txtsizey = surface.GetTextSize(txt)
            draw.RoundedBox(2, 5, 3, txtsizex+10, txtsizey+3, Color(36,36,36,234))
            draw.RoundedBox(2, 5,3,  txtsizex+10, 3, Color(255, 255, 255))
            draw.SimpleText(txt, "veranda", 10, 6, Color(255,255,255))


        if ultimate.cfg.vars["Crosshair"] then
            local scrw, scrh = ScrW(), ScrH()
            local crosshcolor = string.ToColor(ultimate.cfg.colors["Crosshair"] or "255 255 255 255")
            local crossstil = ""
            if ultimate.cfg.vars["crossstyle"] == 1 then
                crossstil = "+"
            elseif ultimate.cfg.vars["crossstyle"] == 2 then
                crossstil = "卐"
            elseif ultimate.cfg.vars["crossstyle"] == 3 then
                crossstil = "♥"
            elseif ultimate.cfg.vars["crossstyle"] == 4 then
                crossstil = "Z"
            elseif ultimate.cfg.vars["crossstyle"] == 5 then
                crossstil = "БЛЯТ   "
            elseif ultimate.cfg.vars["crossstyle"] == 6 then
                crossstil = "☠"
            elseif ultimate.cfg.vars["crossstyle"] == 7 then
                crossstil = "⚧"
            end



            draw.SimpleText(crossstil, "DTFont", scrw/2,scrh/2, crosshcolor,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

        if ultimate.cfg.vars["RusEliteDetector"] then
                hook.Add("Think", "Ultimate_AutoWeaponDistance", function()
                if not ultimate or not ultimate.cfg or not ultimate.cfg.vars then return end

                local ply = LocalPlayer()
                if not IsValid(ply) then return end

                local wep = ply:GetActiveWeapon()
                if not IsValid(wep) then return end

                local class = wep:GetClass()

                if string.StartWith(class, "knife_" ) then
                    ultimate.cfg.vars["Max distance"] = 70 
                elseif string.StartWith(class, "swb_") then
                    ultimate.cfg.vars["Max distance"] = 130 
                elseif string.StartWith(class, "umb_") then
                    ultimate.cfg.vars["Max distance"] = 300
                else
                    ultimate.cfg.vars["Max distance"] = 4096
                end
            end)
        end

        local plys = player.GetAll()

        if ultimate.cfg.vars["Spectator list"] then
            local y = ScrH() / 2
            for _, ply in ipairs(player.GetAll()) do
                local v = ultimate.playerCache[ply]
                if not v then continue end
                if v.ObserverMode == 0 then continue end

                surface.SetTextPos(15, y)
                surface.SetTextColor(255, 255, 255)
                surface.DrawText(v.entity:Nick() .. " spectating " .. v.ObserverTarget:Nick())
                y = y + 15
            end
        end
        

    


        
    end
    
   
    
end



/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if ultimate.targetVector then
        render.DrawWireframeSphere( ultimate.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


ultimate.kd = false
function ultimate.togglevisible()
    if ultimate.frame:IsVisible() then
        ultimate.frame:SetVisible(false)

        if ultimate.ui.MultiComboP then ultimate.ui.RemovePanel( ultimate.ui.MultiComboP ) end
        if ultimate.ui.ColorWindow then ultimate.ui.RemovePanel( ultimate.ui.ColorWindow ) end
        if ultimate.ui.SettingsPan then ultimate.ui.RemovePanel( ultimate.ui.SettingsPan ) end

        RememberCursorPosition()

        if ultimate.validsnd then ultimate.validsnd:Pause() end
    else
        ultimate.frame:SetVisible(true)

        RestoreCursorPosition()
        if ultimate.validsnd then ultimate.validsnd:Play() end
    end
end


function ultimate.PrePlayerDraw( pEntity, iFlags )
    if ( pEntity == pLocalPlayer ) then
        return 
    end

    pEntity:AnimResetGestureSlot( GESTURE_SLOT_VCD )
    pEntity:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )

    pEntity:SetPoseParameter( "head_pitch", 0 )
    pEntity:SetPoseParameter( "head_yaw", 0 )

    if ( ultimate.cfg.vars["Resolver"] ) then
        local angs = Angle()
        angs.y = ultimate.bruteYaw[ pEntity.aimshots % #ultimate.bruteYaw + 1 ] + pEntity:EyeAngles().y

        pEntity:SetRenderAngles( angs )

        ded.SetCurrentLowerBodyYaw( pEntity:EntIndex(), angs.y )  
    end

    if ( ultimate.cfg.vars["Pitch resolver"] and pEntity.fakepitch ) then
        pEntity:SetPoseParameter( "aim_pitch", -89 )
        pEntity:SetPoseParameter( "head_pitch", -89 )
    end
    
    pEntity:InvalidateBoneCache()
    pEntity:SetupBones()

    pEntity.ChatGestureWeight = 0
end


// Chams

CreateMaterial("flat", "VertexLitGeneric") 
CreateMaterial("flat_z", "VertexLitGeneric", {
    ["$ignorez"] = 1
} )

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})

CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

ultimate.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!wireframe"), -- wireframe
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!wireframe_z"), -- wireframe
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}
 
do
    local f = (1/255)

    function ultimate.RenderScreenspaceEffects()
        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Color Modify"] then 
            local rse = {
                [ "$pp_colour_addr" ] = ultimate.cfg.vars["Color Modify Add Red"],
                [ "$pp_colour_addg" ] = ultimate.cfg.vars["Color Modify Add Green"],
                [ "$pp_colour_addb" ] = ultimate.cfg.vars["Color Modify Add Blue"],
                [ "$pp_colour_brightness" ] = ultimate.cfg.vars["Color Modify Brightness"],
                [ "$pp_colour_contrast" ] = ultimate.cfg.vars["Color Modify Contrast"],
                [ "$pp_colour_colour" ] = ultimate.cfg.vars["Color Modify Saturation"],
                [ "$pp_colour_mulr" ] = ultimate.cfg.vars["Color Modify Mul Red"],
                [ "$pp_colour_mulg" ] = ultimate.cfg.vars["Color Modify Mul Green"],
                [ "$pp_colour_mulb" ] = ultimate.cfg.vars["Color Modify Mul Blue"]
            }
            DrawColorModify( rse )
        end

        local vm, invm = ultimate.cfg.vars["Visible mat"], ultimate.cfg.vars["inVisible mat"]
        local sin = math.floor( math.sin( CurTime() * 4 ) * 45 )

        local vc = string.ToColor(ultimate.cfg.colors["Visible chams"])
        local invc = string.ToColor(ultimate.cfg.colors["inVisible chams"])
        local sc = string.ToColor(ultimate.cfg.colors["Self chams"])
        
        cam.Start3D()
            for k, v in pairs(player.GetAll()) do
                if not IsValid(v) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end 

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(true)
                end

                if ultimate.cfg.vars["inVisible chams"] then
                    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.invis[invm])
                    render.SetColorModulation(invc.r/255,invc.g/255,invc.b/255) 

                    if invm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if ultimate.cfg.vars["inVisible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Visible chams"] then
                    ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.vis[vm])
                    render.SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if ultimate.cfg.vars["Visible chams w"] then 
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg.vars["Supress lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            if ultimate.cfg.vars["Self chams"] and IsValid(pLocalPlayer) and pLocalPlayer:Alive() then

                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(true)
                end

                ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render.MaterialOverride(ultimate.chamMats.vis[ultimate.cfg.vars["Self mat"]])
                render.SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if ultimate.cfg.vars["Self mat"] == 7 then
                    render.SetBlend( (sin + 100) / 255 )
                end

                pLocalPlayer:SetRenderMode(1)
                pLocalPlayer:DrawModel()

                if ultimate.cfg.vars["Self chams w"] then 
                    local w = pLocalPlayer:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end
              
                if ultimate.cfg.vars["Supress self lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            


        cam.End3D()

        render.SetColorModulation(1, 1, 1)
        render.SetBlend(1)
        render.MaterialOverride()
    end
end


// Client side models 

function ultimate.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function ultimate.CS_Model_update(ply,model,tbl)
    if !ply or !model or !tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers 

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)
		
	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function ultimate.PostDrawTranslucentRenderables()
    if ultimate.UnSafeFrame then return end

    ultimate.drawCSModels_backtrack()
    ultimate.drawCSModels_real()

    render.SetBlend(1)
    render.MaterialOverride()
end


// Backtracking 

ultimate.btrecords = {}
ultimate.predicted = {}

















function ultimate.canBacktrack(ply)
    if not ultimate.cfg.vars["Backtrack"] then return false end 
    if not IsValid(ply) then return false end
    if not ultimate.btrecords[ply] then return false end 
    if ply.break_lc then return false end 

    return true 
end

function ultimate.recordBacktrack(ply)
	local deadtime = CurTime() - ultimate.cfg.vars["Backtrack time"] / 1000
	
	local records = ultimate.btrecords[ply]

	if !records then
        records = {}
		ultimate.btrecords[ply] = records
	end
	
	local i = 1
	while i < #records do
		local record = records[i]
		
		if record.simulationtime < deadtime then
			table.remove(records, i)
			i = i - 1
		end
		
		i = i + 1
	end
	
	if !ply:Alive() then return end
    if ply.break_lc then return end
	
	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end
	
	if !simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )
    
    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )
  
        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end 

        local bonepos, ang = ply:GetBonePosition( bone )  
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

    /*
    for i = 0, ply:GetBoneCount() - 1 do

        local parent = ply:GetBoneParent(i)

        if(!parent) then continue end

        local bonepos = ply:GetBonePosition(i)

        if(bonepos == ply:GetPos() ) then continue end

        local parentpos = ply:GetBonePosition(parent)

        if(!bonepos or !parentpos) then continue end

        skeletondata[ 1 ] = bonepos:ToScreen()
        skeletondata[ 2 ] = parentpos:ToScreen()
    end
    */

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            ultimate.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

ultimate.btmodel = ultimate.CS_Model("models/player/kleiner.mdl")

function ultimate.drawCSModels_backtrack()
    if not ultimate.cfg.vars["Backtrack chams"] then return end 
    if not ultimate.canBacktrack(ultimate.target) then return end

    local len = #ultimate.btrecords[ultimate.target]
    local tbl = ultimate.btrecords[ultimate.target][ultimate.backtracktick]
    local m = ultimate.btmodel

    ultimate.CS_Model_update(ultimate.target,m,tbl)

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Backtrack chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Backtrack material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if ultimate.cfg.vars["Backtrack fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

ultimate.hitmarkers = {}
ultimate.hitnums = {}

gameevent.Listen( "player_hurt" )

function ultimate.player_hurt(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == pLocalPlayer:UserID() then
        
        if ultimate.cfg.vars[ "On screen logs" ] then
            local hlcolor = string.ToColor( ultimate.cfg.colors[ "On screen logs" ] )
            local data = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    hurted:Name(),
                    " for ",
                    hurted:Health() - health,
                    " damage"
                },
                {
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                }
            }
            
            ultimate.onScreenLogs[ engine.TickCount() ] = data
            //print( "hurt", engine.TickCount() )
        end

        if ultimate.cfg.vars["Hitmarker"] then
            ultimate.hitmarkers[ #ultimate.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if ultimate.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            ultimate.hitnums[ #ultimate.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math.random(-1,1), ydir = math.random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if ultimate.cfg.vars["Hitsound"] then
            surface.PlaySound( ultimate.cfg.vars["Hitsound str"] )
        end

        if ultimate.cfg.vars["Resolver"] then 
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end

/*
    Player vars 
*/


function ultimate.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0 
    v.flticks = 0 
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false 
    v.simtime_updated = false 
    v.fakepitch = false

    ultimate.btrecords[ v ] = {}
    ultimate.predicted[ v ] = {}
end

for k, v in ipairs(player.GetAll()) do
	ultimate.initPlayerVars( v )
end


ultimate.chatmsg = 
{
        [1] = {
            "I am the way and the truth and the life. No one comes to the Father except through me. -Jesus",
            "Do to others as you would have them do to you. -Jesus",
            "With man this is impossible, but with God all things are possible. -Jesus",
            "Do not judge, or you too will be judged. -Jesus",
            "No one can serve two masters.You cannot serve both God and money. -Jesus",
            "And whoever wants to be first must be slave of all. -Jesus",
            "And whoever welcomes one such child in my name welcomes me. -Jesus",
            "For where your treasure is, there your heart will be also. -Jesus",
            "Greater love has no one than this: to lay down one’s life for one’s friends. -Jesus",
            "Whoever drinks the water I give them will never thirst. -Jesus",
            "That which does not kill us makes us stronger. -Friedrich Nietzsche",
            "In the middle of every difficulty lies opportunity. -Albert Einstein",
            "Don’t cry because it’s over, smile because it happened. -Dr Suess",
            "If you want something done right, do it yourself. -Charles-Guillaume Étienne",
            "The unexamined life is not worth living. -Socrates",
            "Better to have loved and lost, than to have never loved at all. -St Augustine",
            "An eye for an eye leaves the whole world blind. -Mahatma Gandhi",
            "In three words I can sum up everything I’ve learned about life: it goes on. -Robert Frost",
            "Necessity is the mother of invention. -Plato",
            "To err is human; to forgive, divine. -Alexander Pope",
            "Imagination is more important than knowledge. -Albert Einstein",
            "With great power comes great responsibility. -Voltaire",
            "Believe you can and you’re halfway there. -Theodore Roosevelt",
            "The pen is mightier than the sword. -Proverb",
            "Life is like a box of chocolates. You never know what you’re gonna get. -Forrest Gump’s Mom",
            "Familiarity breeds contempt. -Aesop",
            "It is always darkest just before the dawn. -Thomas Fuller",
            "The ballot is stronger than the bullet. -Lincoln",
            "If you are going through hell, keep going. -Winston Churchill",
            "I am not removing the debug library, calm down. -Rubat",
            "加里-纽曼（Garry Newman）请把我们从 rubat 拯救出来，他正在摆脱 debug.getregistry。-Lavrentiy Bandera",
            "Use ultimate™️, not exechack. -Jesus",
            "A rose by any other name would smell as sweet. -Juliet",
            "Don't cry because it's over, smile because it happened. -Dr. Seuss",
            "You miss 100% of the shots you don't take. -Wayne Gretzky",
            "Happiness is not something ready made. It comes from your own actions. -Dalai Lama",
            "My account details layo2021 - JNYLEQbgpiwv. -Donald Dicks $$$",
            "I WANT TO BE BANGED HARD. -Serejaga",
            "Um, I wonder if I am being hacked. -Ramzi",
            "Connections... no hackers. -Ramzi",
            "We love death. The U.S. loves life. That is the difference between us two. -Osama bin Laden",
            "I don't regret what happened there. -Osama bin Laden",
            "For God and country - Geronimo, Geronimo, Geronimo. -Osama bin Laden",
            "I support any Muslims, whether here or abroad. -Osama bin Laden",
            "An ounce of prevention is better than a pound of cure. -Osama bin Laden",
            "There is no dialogue except with weapons. -Osama bin Laden",
            "Russia does not have a great deal of experience building democratic institutions. -Putin",
            "Those who fight corruption should be clean themselves. -Putin",
            "The question isn't who is going to let me; it's who is going to stop me. -Putin",
            "There are no grounds to suggest that Russia will return to the Cold War. -Putin",
            "The 21st century will be defined by the fight against terrorism. -Putin",
            "Russia has never been surrounded by so many friends as it is today. -Putin",
            "Nobody should pin their hopes on a miracle. -Putin",
            "Russia is a country of free people who can ensure their prosperity and well-being. -Putin",
            "I believe in the people and the wisdom of our elites. -Putin",
            "In Russia, the state, in a proper sense, returned only recently. -Putin",
            "Why don't you make me a Double-expresso -- Macchiato -- with extra foam? -Bill Williamson",
            "Everyone's gotta live, everyone's gotta be happy - It's a joke. -Bill Williamson",
            "Buy a grandfather's penis and fuck everyone!",
            "All you need is Grandpa's penis! Trust me",
            "Buy a grandfather's penis and you can live not in a shoe box",
            "Grandfather's penis is the best solution",
            "Would you choose to be raped in prison or buy grandfather's penis?",
            "Do you have a small penis? It doesn't matter! Buy a grandfather's penis",
            "Tired of playing with a bad cheat? Buy grandfather's penis",
            "I want to sleep but can't get up from the table? There is a solution - GRANDFATHER'S PENIS!",
            "Tired of dying from grandfather's penis? Buy Grandfather's penis and kill everyone!",
        },
        [2] = {
            "1 нищий упал",
            "$$$ кешбек по зубам $$$",
            "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
            "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
            "але , а противники то где???",
            "ты по легиту играешь ?",
            "ебать ты красиво на бутылку присел , тебе дать альт ?",
            "пробил тикбазу головой твоей жирной матухи",
            "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
            "на мыло и веревку то деньги есть????",
            "продам оффсеты на гмод цена 100 рублей российских",
            "Я прямо как Ильназ Галяиев",
            "Я муслим мне похуй на кризис мой пенис вырос",
            "Вот тебе паяльник , запаяй себе ебальник",
            "оттарабанен армянская королева",
            "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
            "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
            "Loading… ██████████ Lifehack.cfg Activated",
            "упавший на медию никогда не встанет с колен.",
            "Черные глаза Вспоминаю — умираю Черные глаза Я только о тебе мечтаю",
            "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
            "Извини дорогая , не хотел на лицо",
            "прости что без смазки)",
            "лол ору ты прямо как 𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸",
            "обе чернокожие головы превратились в кубики льда… Бере.",
            "Ало скорая тут такой случай шкiла упала в месорубку",
            "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
            "99 имен Аллаhа для детей",
            "у тебя член не конский не по масти эпик фейл",
            "гелим гелим гелим на валике",
            "Приходи один работёнка есть!, координаты: 55.8653382,49.304329",
            "юид полиция подьехала открывай дверь уебыч",
            "Disgusting tranny holzed",
            "але ты там из хрущевки выеди а потом вырыгивай блять", 
            "как там с мамкой комнату разделять АХАХАХХАХА как ты на акк накопил блять",
            "найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ", 
            "на мыло и веревку то деньги есть нищ????", 
            "опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))",
            "але какая с юидом ситуация)))", 
            "че тут эта нищая собака заскулила", 
            "не хотелось даже руки об тебя марать нищ сука", 
            "ебать ты красиво на бутылку упал",
            "прости что без смазки)))", 
            "алло это скорая? тут такая ситуация нищ упал))) ОЙ А ВЫ НИЩАМ ТО НЕ ПОМОГАЕТЕ?? ПОНЯТНО Я ПОЙДУ ТОГДА))))))))", 
            "вырыгнись из окна нахуй боберхук юзер",
            "тяжело с мемсенсом наверно????", 
            "nice chromosome count you sell??", 
            "как ты на пк накопил даже не знаю )))))))))",
            "iq больше двух будет пмнешь ок????", 
            "НИХУЯ ТАМ НЬЮКАМЫЧА ОРОШИЛИ СТРУЕЙ МОЧИ АХАХХАХАХАХАХАХАХА",
            "дал юид за щеку проверяй",
        },
        [3] = {
		"хуевый ресолвер",
		"хуевые фейклаги",
		"хуевый антиаим",
		"хуевый спинбот",
		"хуевый бхоп",
		"хуевый аим",
		"найс паста аимвара",
		"найс паста мемевара",
		"неужели это идиотбокс???",
		"ого идиотбокс???",
		"неужели это аосхак???",
		"ого аосхак???",
		"неужели это ехек хак???",
		"ого ехек хак???",
		"что за ебанутый у тебя чит?",
		"ez",
		"ezz",
		"изи",
		"ииииииизи",
		"упал",
		"спи",
		"отдыхай",
		"отлетел дебил)",
		"упал пастер",
		"пастер лег",
		"изи даун",
		"ору отлетела дура",
		"найс ресолвер стен",
		"найс ресолвер деревьев",
		"бро имажин ресолвинг ин гмод",
		"улетел фанат артемкинга4",
		"упал фанат артемкинга4",
		"ты куда стреляешь)))",
		"упал ннчик без самоваре",
		"умер ннчик без самоваре",
		"отдыхай ннчик без самоваре",
		"упал подписчик урбанички",
		"умер подписчик урбанички",
		"отдыхай подписчик урбанички",
		"енжинпред где???",
		"антиаим где???",
		"фейклаги где???",
		"антиаим не спас",
		"фейклаги не спасли",
		"даун с пастой отлетел",
		"упал баимер ебаный",
		"отлетел ебаный баимер))",
		"охуеть даун с пастой аимвара",
		"упал дебил",
		"выйди не позорься",
		"найс брейн иссуе",
		"найс кфг иссуе",
		"сука не позорься и ливни лол",
		"*DEAD* пофикси нищ",
		"нищий улетел",
		"набутылирован лол",
		"ебать ты красиво на бутылку упал",
		"хуя тебя опустили))",
		"прости что без смазки)",
		"обоссан",
		"обоссал юзера пасты аимвара",
		"алло это скорая? тут такая ситуация нищ упал)))",
		"на завод иди",
		"ебать тебя унесло",
		"ой нищий упал щас скорую вызовем",
		"научи потом как так сосать на хвх",
		"нихуя ты там как самолет отлетел",
      
        },
        [4] = {
	"Навальный топчик",
	"Навальный топчик",
	"Навальный топчик",
	"Навальный топчик,за него Тверскую топчем",
	"Навальный топчик,за него Тверскую топчем",
	"Нью Бэланс кеды, прилипли к подошве гетры",
	"Но сегодня в центре в них устроим веселье",
	"Мы отсюда не свалим",
	"Все кто дома - не с нами",
	"Мы тут просто гуляем",
	"В нашем сердце весна В нашем сердце весна",
	"В нашем сердце весна",
	"Навальный топчик,за него Тверскую топчем",
	"Навальный топчик,скажем громче",
	"Навальный топчик,за него Тверскую топчем",
	"Навальный топчик,",
	"Навальный топчик,за него Тверскую топчем",
	"Тверскую топчем",
	"Вокруг так много космонавтов",
	"МКС полицейский пазик",
	"Лица скрывают каски,маски",
	"Становиться опасно,но",
	"Мы устроим пляски",
	"Дружно,под эти песни",
	"Вся Тверская в курсе",
	"Вся Тверская денсит",
	"Тверская денсит",
	"Тверская денсит",
	"Денсит",
	"Навальный топчик,за него Тверскую топчем",
	"Навальный топчик,скажем громче",
	"Навальный топчик,за него Тверскую топчем",
	"Навальный топчик,",
	"Навальный топчик,за него Тверскую топчем",
	"Тверскую топчем",
	"Навальный топчик",
	"15 суток, нам нет места от скуки",
	"Ждем когда вернешься, Навальный Леша",
	"Время летит быстро,скоро новая вписка",
	"Мы не пойдем на пары если,Навальный с нами",
	"Навальный с нами,давай с нами",
	"Навальный с нами, пойдем тусить с нами",
	"Навальный с нами, давай с нами",
	"Давай с нами, пойдем тусить с нами",
	"Этому городу нужен герой",
	"Леша Навальный, мы с тобой",
	"Этой стране нужен герой",
	"Леша Навальный, мы с тобой",
	"Этой планете нужен герой",
	"Леша Навальный, мы с тобой",
	"Этой Вселенной нужен герой",
	"Леша Навальный, мы с тобой",
	"Этой Вселенной нужен герой",
	"Леша Навальный, мы с тобой",
	"Леша Навальный, мы с тобой",
            "зуб даю у навального лехи самые мягкие сиськи",
        },
      [5] = {
         "я ЂÖг ₸ӹ ԉÖχ",
         "I am ♛ you noob",
         "{X}o4y kak PR0™ moGy kak DNO",
         "(‿!‿) Попа ищет ПрИкЛюченИй•",
         "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й]۩۞۩•●٠",
         "DOLBIT N0RMALNO",
         "♛Truckach♛.CFG injecting",
         "Держи ✈ и лети нахуй !",
         "(Ауф)ᶜʸᵇᵉʳˢᵖᵒʳᵗЯ VIP А ТЫ RIP",
         "çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ",
         "Следующая остановка – голова",
         "ᵗᵠ ᵉᵇᵃⁿᵘˡˢʸᵃ?",
         "!!!!ОР ВЫШЕ ГОР!!!!",
         "-===≡≡≡( ͝° ͜ʖ͡°) сперма летит тебе в FACE",
         "(っ´ཀ`)っ  ⋃  соси!!1",
         "★А мНе ВсЁ пОфИг★",
         "ОРЕЛ-КАВКАЗА ЛЕТИТ ВЕРШИТЬ СУДЬБУ",
         "•ЯАШОТТЕБЕ~ХЭДШОТ•",
         "Ð•Ē•M•Ø•Ŋ KILLED YOU",
         "•Я_tOT_komy_HaBce||OX•",
         "༼ つ ◕_◕ ༽つ {лежи ннчик}",
         "4iTeRoc_Ha_SeRvErE",
         "ЂΣƊOŁ∆G∆",
         "АхТы?НеГодЯй!",
         "-n๏ȼąȼέʍȼя?",
         "TRUCKACH.TECH RELEASE ACTIVATED ....",
         "%s EB@NYHKA S CHITOM",
         "给这个亚洲人吹箫",
         "R ẴℕGỄŁ ༗ EбЛӥ",
         "ω ешь мои яйца",
         "تSøsŸ xYЙ",
         "8===D    ●",
         "(ര ‿ ര ) ⋃ ",
         "CFG BY ILYATRAXER",
         "VIP пуля от меня",
         "Я _MaTЬ_ ПyTuHa А Тbl Л0}{",
         "отдамся за 5 рублей",
         "royal hack owned",
         "ннчик лег",
         "эй бро у меня есть truckach.lua тебе дать?",
         "*DEAD* зафикси нищи ублюдок",
         "бро имажин ресолвинг ин гмод",
         "ПоСтоРониСь БаТя С КаЛаШоМ ИдЁт",
         "Лицом к стене! Это приказ, 1...2...3...",
         "найс паста мемевара",
         "[~оСтОрОжНо Я кУсАюСь~]",
         "(   ͜.人   ͜.）",
         "авхаыхаыхыах ну ты и упал прикольно",
         "аим включи уебище))",
         "*DEAD* пофикси нищ",
         "кринжаниум не вывез exec",
         "ХeT_SHОТ_ОТ BABKI",
         "LOOOOOOOL KEK %s остался без бошки xDDDDDDDDDDDDDDDDDDD",
         "⋃ PÉNIS¹4⁸⁸",
         "что у тебя за говночит? %s",
         "给这个亚洲人吹箫",
         "%s обоссан",
        },

         [6] = {
         "ur paste for 30 $+ no updated? buy exechack.cc now",
         "want full nospread? buy exechack.cc",
         "cant play? with exechack.cc can do anything",
         "exechack.cc - only 5$ for LIFETIME",
         "where free 200+ cfg & lua? - exechack.cc",
         "what best cheat? exechack.cc",
         "u use 60$ shit pastes? buy exechack.cc for 5$",
         "afraid of detected? exechack.cc will warn",
        },

        [7] = {
        "Стрельнул в Chest зарегало в Legs - Urbanichka(очкарик)",
        "V5 femboyhach better than exic - smert.exe",
        "Имя: Александр Михаилский, номер: +792100389215 , снилс: 212304693200",
        "Медия паветра это как самолет Садама Хусейна",
        "Подскажите, как растянуть хитбокс?",
        "THE BEST CHEAT IN HVH Its IdIOTBOX, FREE ANTi aim + eXEHACK SUB",
        "Личная связь: +79506315725",
        "EB@notkA S CHITOM",
        "exechak.cc better them cadilac.xxx",
        "блять куда жмать, я тебя случайно убил ногою",
        "где купить ultimate v3",
        "где скачать кряк ультимейта, че нибудь допилю",
        "я у себя за шкафом нашел в4 - yxungsta",
        "BUY ULTIMATE V666",
        "ВНIМАНИЕ! ПРИКАZ ОТ SKRIPACH.MP4! VСЕ БЫСТРО ЗАХОДИМ НА HVH, И ИГРАЕМ ТАМ!",
        "RamzST(STEAM_0:0:124918272) забанил STEAM_0:0:602172781 на 3h по причине: holokost",
        "pavetr + exec = big dick love - ! nato",
        "pavetr down",
        "ЭТОТ ДУШНИЛА НА ХВХ ПРОСТО ВЗБЕСИЛСЯ! - skripach.mp4",
        "Hey Barbie? Не проси у меня ultimate v2..",
        "Legit",
        "ANTI AIM AA LEGIT как настроить - ! nato",
        "Code - это язык на котором пишут хакеры",
        "IgniteCheat - HvH BOMBA IN 2001",
        "Одень наушники, а то последние мозги простудишь. - Pavetr",
        "молись аллаху что-бы я не заинжектил trukach.lua",
        "админ а ты че петух? - zxc Stockholm",
        "АА - это типо дети орут на русэлите",
        "Resolver деревьев ин gmod.",
        "Satantic spin - скорость ровно успех",
        "Лан, спасибо пацыки, щя пойду доделывать femboyhack - disconnect by user (Segregation)",
        "EXPLOIT NO SPREAD CSS PACK..",
        "У меня не стреляет чит, это EXPLOIT ULTIMATE NO SHOOT.....",
        },
      
    }


// Init player vars 
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function ultimate.entity_killed(data)
	local aid = Entity(data.entindex_attacker)	
	local vid = Entity(data.entindex_killed)

    if aid == pLocalPlayer and aid != vid and !vid:IsNPC() and (vid:IsPlayer() or vid:IsBot() ) then
        if ultimate.cfg.vars["Killsay"] then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }
            
            local chatGroup = ultimate.cfg.vars["Killsay group"]
            
            local prefix = chatPrefixes[chatGroup] or ""
        
            local tbl = ultimate.chatmsg[ ultimate.cfg.vars["Killsay mode"] ]
            local str = prefix .. tbl[ math.random( 1, #tbl ) ]
            
            if str:find("%%s") then
                if chatGroup == 4 then -- /pm
                    str = str:format(vid:SteamID())
                else
                    str = str:format(vid:Nick())
                end
            end

            RunConsoleCommand( "say", str )
            
        end
        
        if ultimate.cfg.vars["Killsound"] then
            surface.PlaySound( ultimate.cfg.vars["Killsound str"] )
        end

     
    end
end


function ultimate.updatePlayerVars( data )
    local id = data.userid  

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()
    
    ply.ult_prev_simtime = 0
    ply.flticks = 0
        
    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    ultimate.btrecords[ ply ] = {}
    ultimate.predicted[ ply ] = {}
end



















// Menu hints 

function ultimate.DrawMenuHints()
    if not ultimate.frame:IsVisible() then return end

    if not ultimate.hint then
        ultimate.hintText = ""
        return
    end

    surface.SetTextColor(ultimate.Colors[165])
    surface.SetFont("DermaSmall")

    local tw, th = surface.GetTextSize(ultimate.hintText)

    surface.SetDrawColor(ultimate.Colors[35])
    surface.DrawRect(ultimate.hintX,ultimate.hintY,tw+20,th+10)
    surface.SetDrawColor(ultimate.Colors[54])
    surface.DrawOutlinedRect(ultimate.hintX,ultimate.hintY,tw+20,th+10,1)    

    surface.SetTextPos(ultimate.hintX+10,ultimate.hintY+5)
    surface.DrawText(ultimate.hintText)

    ultimate.hint = false
end

function ultimate.DrawOverlay()
    if ultimate.UnSafeFrame then return end

    ultimate.DrawMenuHints()
end


// Gamemode UpdateClientsideAnimation
--[[]
local function RunSandboxAnims(ply, velocity, maxseqgroundspeed)
    local len = velocity:Length()
	local movement = 1.0

	if ( len > 0.2 ) then
		movement = ( len / maxseqgroundspeed )
	end

	local rate = math.min( movement, 2 )

	-- if we're under water we want to constantly be swimming..
	if ( ply:WaterLevel() >= 2 ) then
		rate = math.max( rate, 0.5 )
	elseif ( !ply:IsOnGround() && len >= 1000 ) then
		rate = 0.1
	end

	ply:SetPlaybackRate( rate )

	-- We only need to do this clientside..
	if ( CLIENT ) then
		if ( ply:InVehicle() ) then
			--
			-- This is used for the 'rollercoaster' arms
			--
			local Vehicle = ply:GetVehicle()
			local Velocity = Vehicle:GetVelocity()
			local fwd = Vehicle:GetUp()
			local dp = fwd:Dot( Vector( 0, 0, 1 ) )

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 && dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

			-- Pass the vehicles steer param down to the player
			local steer = Vehicle:GetPoseParameter( "vehicle_steer" )
			steer = steer * 2 - 1 -- convert from 0..1 to -1..1
			if ( Vehicle:GetClass() == "prop_vehicle_prisoner_pod" ) then steer = 0 ply:SetPoseParameter( "aim_yaw", math.NormalizeAngle( ply:GetAimVector():Angle().y - Vehicle:GetAngles().y - 90 ) ) end
			ply:SetPoseParameter( "vehicle_steer", steer )

		end
	end
end

function GAMEMODE:UpdateAnimation(plr, velocity, maxSeqGroundSpeed)
    local hResult = self.BaseClass.UpdateAnimation(self, plr, velocity, maxSeqGroundSpeed)

    RunSandboxAnims(plr, velocity, maxSeqGroundSpeed)
    return hResult;
end
]]



/*
    Libs -> Color
*/



//function ultimate.


function ultimate.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math.Approach( first.r, second.r, FT )
    first.g = math.Approach( first.g, second.g, FT )
    first.b = math.Approach( first.b, second.b, FT )
    first.a = math.Approach( first.a, second.a, FT )

    math.Round( first.r, 0 )
    math.Round( first.g, 0 )
    math.Round( first.b, 0 )
    math.Round( first.a, 0 )

    return first
end

function ultimate.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true 
end





/* 
    hooks -> Think 
*/

ultimate.ekd = false
ultimate.fbkd = false

// Dancer ( act / taunt spam )

ultimate.nextact = 0
ultimate.actCommands = {"robot", "attack", "melee", "muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}

// Name changer 

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end 

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function ultimate.nameChanger() 
        if curtime > CurTime() then return end

        local pltbl = player.GetAll()

        local len = pLocalPlayer:Name():len()

        local mname = string.sub(pLocalPlayer:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false
        
    function ultimate.Think()
        if input.IsKeyDown(KEY_END) then 
            ultimate.Unload()
        end

        if input.IsKeyDown(KEY_DELETE) and not ultimate.kd then 
            ultimate.togglevisible()
    
            CloseDermaMenus()
        end

        ultimate.kd = input.IsKeyDown(KEY_DELETE)

        if ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] ) and not ultimate.ekd then
            local tr = pLocalPlayer:GetEyeTrace().Entity

            if IsValid( tr ) then 
                local class = tr:GetClass()

                //print(ultimate.cfg.ents[ class ] )

                if not ultimate.cfg.ents[ class ] then
                   ultimate.cfg.ents[ class ] = true
                else
                   ultimate.cfg.ents[ class ] = not ultimate.cfg.ents[ class ]
                end
            end
        end

        if ultimate.cfg.vars["Inverter"] and ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] ) and not inverterdown then
            ultimate.inverted = !ultimate.inverted 
        end

        inverterdown = ultimate.IsKeyDown( ultimate.cfg.binds["Inverter"] )

        ultimate.ekd = ultimate.IsKeyDown( ultimate.cfg.binds["Ent add"] )

        if ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] ) and not ultimate.fbkd then
            ultimate.fbe = not ultimate.fbe
        end

        ultimate.fbkd = ultimate.IsKeyDown( ultimate.cfg.binds["Fullbright"] )

        if ultimate.cfg.vars["FSpec ClickTP"] and ultimate.IsKeyDown( ultimate.cfg.binds["FSpec ClickTP"] ) then
            local pos = pLocalPlayer:GetEyeTrace().HitPos
            
            //print(pos)

            //RunConsoleCommand( "ba", "spec" )

            RunConsoleCommand( "FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z), string.format("%d, %d, %d", 0, 0, 0) )
        end

        
        
        // ultimate.cfg.vars["FSpec Teleport"] = false
        // ultimate.cfg.binds["FSpec Teleport"] = 0
        
        // ultimate.cfg.vars["FSpec Masskill"] = false
        // ultimate.cfg.binds["FSpec Masskill"] = 0
        
        // ultimate.cfg.vars["FSpec Velocity"] = false
        // ultimate.cfg.binds["FSpec Velocity"] = 0

        if ultimate.cfg.vars["Chat spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "! "
            }

            local chatGroup = ultimate.cfg.vars["Chat group"]
            local prefix = chatPrefixes[chatGroup] or ""

            local tbl = ultimate.chatmsg[ ultimate.cfg.vars["Chat mode"] ]
            local msg = tbl[ math.random( 1, #tbl ) ]
            local str = prefix .. msg

            local players = player.GetAll()
            local random_ply = players[ math.random( 1, #players ) ]
            if random_ply == pLocalPlayer then return end

            if str:find("%%s") then
                if chatGroup == 4 then
                    str = string.format(str, random_ply:SteamID())
                else
                    str = string.format(str, ultimate.playerCache[random_ply].Name or random_ply:Nick())
                end
            end

            RunConsoleCommand("say", str)
            chatdelay = CurTime() + ultimate.cfg.vars["Chat delay"]
        end
    
        if ultimate.cfg.vars["Name stealer"] then ultimate.nameChanger() end
    
        if ded.GetCurrentCharge() < ultimate.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if ultimate.cfg.vars["Tickbase shift"] then 
            if ultimate.IsKeyDown( ultimate.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end
            
            local shouldcharge =  ded.GetCurrentCharge() < ultimate.cfg.vars["Charge ticks"] and ultimate.IsKeyDown( ultimate.cfg.binds["Auto recharge"] )
            
            ded.StartRecharging( shouldcharge )
        
            if shouldcharge then
                ded.StartShifting( false )
            end
        end   
        
        if ultimate.cfg.vars["Taunt spam"] and ultimate.nextact < CurTime() and pLocalPlayer:Alive() and !pLocalPlayer:IsPlayingTaunt() then 
            local act = ultimate.actCommands[ultimate.cfg.vars["Taunt"]]
    
            RunConsoleCommand("act", act)
            ultimate.nextact = CurTime() + 1.5
        end
    
        if ultimate.cfg.vars["Yaw base"] == 2 then
            tply = ultimate.GetSortedPlayers( 1, 0, 1, false ) 
    
            if tply then
                ultimate.aatarget = tply[1][1]
            end
        end

        if ultimate.cfg.vars["Auto peak"] then
            ultimate.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

ultimate.vieworigin = pLocalPlayer:EyePos()
ultimate.viewfov    = 0
ultimate.znear      = 0

ultimate.tpenabled = false
ultimate.tptoggled = false

ultimate.fcvector = pLocalPlayer:EyePos()
ultimate.fcangles = pLocalPlayer:EyeAngles()
ultimate.fcenabled = false
ultimate.fctoggled = false


/* // TODO
ultimate.checkbox("Collision","Third person collision",p:GetItemPanel())
ultimate.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

ultimate.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
ultimate.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
ultimate.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
ultimate.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/


function ultimate.ShouldDrawLocalPlayer(ply)
    if ( ultimate.tpenabled ) then
        ply:SetNoDraw( false )
    end
    return ultimate.tpenabled 
end

ultimate.cameraHullMax = Vector( 3, 3, 3 )
ultimate.cameraHullMin = Vector( -3, -3, -3 )
function ultimate.CalcView( ply, origin, angles, fov, znear, zfar )
    if ultimate.UnSafeFrame then 
        return { origin = origin, angles = angles, fov = fov } 
    end

    local view = {}

    local tppressed = ultimate.IsKeyDown(ultimate.cfg.binds["Third person"])
    local fcpressed = ultimate.IsKeyDown(ultimate.cfg.binds["Free camera"])

    if ultimate.cfg.vars["Third person"] and tppressed and not ultimate.tptoggled then
        hook.Add("ShouldDrawLocalPlayer", "Ultimate_TPEnable", function(ply)
            return ply == LocalPlayer() and ultimate and ultimate.tpenabled
        end)
        ultimate.tpenabled = not ultimate.tpenabled
    end

    if ultimate.cfg.vars["Free camera"] and fcpressed and not ultimate.fctoggled then
        ultimate.fcenabled = not ultimate.fcenabled
        ultimate.fcangles = pLocalPlayer:EyeAngles()
    elseif ultimate.fcenabled and not ultimate.cfg.vars["Free camera"] then
        ultimate.fcenabled = false
    end

    ultimate.tptoggled = tppressed
    ultimate.fctoggled = fcpressed


    if ultimate.cfg.vars["Fake duck"] and ultimate.IsKeyDown(ultimate.cfg.binds["Fake duck"]) then
        origin.z = pLocalPlayer:GetPos().z + 64
    end

    local fangs = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or angles

    //angles = fangs
    //if not ultimate.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if ultimate.fcenabled then
        local speed = ultimate.cfg.vars["Free camera speed"]
        
        if input.IsKeyDown(KEY_W) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_S) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_A) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_D) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_SPACE) then
            ultimate.fcvector.z = ultimate.fcvector.z + speed
        end

        if input.IsKeyDown(KEY_LSHIFT) then
            ultimate.fcvector.z = ultimate.fcvector.z - speed
        end

        view.origin = ultimate.fcvector
        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]
    else
        ultimate.fcvector = origin
        view.origin = ultimate.tpenabled and origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] ) or origin

        if ultimate.tpenabled and ultimate.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * ultimate.cfg.vars["Third person distance"] )
            tr.mins = ultimate.cameraHullMin
            tr.maxs = ultimate.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = ultimate.cfg.vars["Fov override"]
        view.drawviewer = hook.Call( "ShouldDrawLocalPlayer", nil, ply )
    end

    ultimate.vieworigin = ( ultimate.cfg.vars["Ghetto free cam"] and ultimate.fcenabled ) and ultimate.fcvector or origin
    ultimate.viewfov    = view.fov
    ultimate.znear      = znear

    if ( not ultimate.cfg.vars["Override view"] ) then
        if ( math.floor( fov ) ~= GetConVar( "fov_desired" ):GetFloat() ) then
            view.fov = fov 
        end

        local pVehicle = pLocalPlayer:GetVehicle()

        if ( IsValid( pVehicle ) ) then
            view = hook.Run( "CalcVehicleView", pVehicle, ply, view )
        end

        local pWeapon = pLocalPlayer:GetActiveWeapon()
        
        if ( IsValid( pWeapon ) ) then
            local pWeaponCalcView = pWeapon.CalcView 

            if ( pWeaponCalcView ) then
                local origin, angles, fov = pWeaponCalcView( pWeapon, ply, Vector( view.origin ), Angle( view.angles ), view.fov ) 
			    view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
            end
        end
    end
	return view
end

function ultimate.GetFovRadius()
    local Radius = ultimate.cfg.vars["Aimbot FOV"]

    local Ratio = screenWidth / screenHeight
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = ultimate.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (ultimate.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * screenWidth
end

function ultimate.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)

    pos = ultimate.vieworigin 
	ang = ultimate.cfg.vars["Silent aim"] and ultimate.SilentAngle or ang

    if ultimate.cfg.vars["Viewmodel manip"] then
		local OverridePos = Vector(ultimate.cfg.vars["Viewmodel x"], ultimate.cfg.vars["Viewmodel y"], ultimate.cfg.vars["Viewmodel z"])
		local OverrideAngle = Angle(ultimate.cfg.vars["Viewmodel p"], ultimate.cfg.vars["Viewmodel ya"], ultimate.cfg.vars["Viewmodel r"])

		ang = ang * 1

		ang:RotateAroundAxis(ang:Right(), OverrideAngle.x * 1.0)
		ang:RotateAroundAxis(ang:Up(), OverrideAngle.y * 1.0)
		ang:RotateAroundAxis(ang:Forward(), OverrideAngle.z* 1.0)

		pos = pos + OverridePos.x * ang:Right() * 1.0
		pos = pos + OverridePos.y * ang:Forward() * 1.0
		pos = pos + OverridePos.z * ang:Up() * 1.0 
    end

	return pos, ang
end 

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function ultimate.PreDrawViewModel( vm, ply, w )
        if ultimate.UnSafeFrame then return end
        if ply != pLocalPlayer then return end

        if ultimate.cfg.vars["Viewmodel chams"] then
            local col = string.ToColor( ultimate.cfg.colors["Viewmodel chams"] )
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg.vars["Viewmodel chams type"]] 

            render.SetBlend(col.a/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg.vars["Fullbright viewmodel"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg.vars["hams_hand"] then
            local col = string.ToColor( ultimate.cfg.colors["hams_hand"] )
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg.vars["chams_hand_mat"]] 

            render.SetBlend(col.a/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg.vars["fullbright hands"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then 
            cam.Start3D(nil, nil, ultimate.cfg.vars["Viewmodel fov"])

                drawing = true

                render.DepthRange( 0, 0.01 )

                vm:DrawModel()

                render.DepthRange( 0, 1 )

                drawing = false

            cam.End3D()
        else
            return 
        end
        
        return true
    end

end

function ultimate.PostDrawViewModel( vm, ply, w )
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
ultimate.bulletImpacts = {}

function ultimate.OnImpact( data )
    local startpos = data.m_vStart 

    if ultimate.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == pLocalPlayer:EyePos() then
        local vm = pLocalPlayer:GetViewModel()
	    local wep = pLocalPlayer:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )
			
		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    ultimate.bulletImpacts[#ultimate.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end




/*
    hooks -> PostDrawOpaqueRenderables
*/

do
    local oldtrmat = ultimate.cfg.vars["Bullet tracers material"]
    local tracemat = Material("effects/beam_generic01")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )



    -- Saddam Hussein
    /*
    local bIsSaddamHusseinGenerated = false 
    local pSaddamHussein = { Model = ClientsideModel( "models/player/breen.mdl" ) }
    local flSysTime = SysTime()

    while ( not pSaddamHussein.Position ) do
        local vecRandom = VectorRand( -4096, 4096 )

        if ( not util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = pos, endpos = pos } ).HitWorld ) then
            pSaddamHussein.Position = util.TraceLine( { collisiongroup = COLLISION_GROUP_WORLD, start = vecRandom, endpos = vecRandom + Vector( 0, 0, -1 ) * 50000 } ).HitPos
            pSaddamHussein.Position.z = pSaddamHussein.Position.z + 16
        end
    end

    print( string.format( "Generated Saddam Hussein in %fs, approximate location: %s.", SysTime() - flSysTime, pSaddamHussein.Position ) )

    pSaddamHussein.Model:SetPos( pSaddamHussein.Position )
    pSaddamHussein.Model:SetAngles( Angle( -90, 0, 0 ) )
    pSaddamHussein.Model:SetNoDraw( true )
*/

    function ultimate.PostDrawOpaqueRenderables()

        if ultimate.UnSafeFrame then return end

        if ultimate.cfg.vars["Angle arrows"] then
            local pos = pLocalPlayer:GetPos()

            cam.IgnoreZ(true)

            cam.Start3D2D( pos, Angle(0, ultimate.realAngle.y + 45, 0), 1 )
                surface.SetDrawColor( realcolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.Start3D2D( pos, Angle(0, ultimate.fakeAngles.angle.y + 45, 0), 1 )
                surface.SetDrawColor( fakecolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            local lby = ded.GetCurrentLowerBodyYaw( pLocalPlayer:EntIndex() )
            cam.Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface.SetDrawColor( lbycolor )
                surface.DrawLine( 0, 0, 25, 25 )
            cam.End3D2D()
    
            cam.IgnoreZ( false )
        end

        if ultimate.cfg.vars["Bullet tracers"] then
            local trmat = ultimate.cfg.vars["Bullet tracers material"] 
    
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            render.SetMaterial( tracemat ) 
    
            local tracercolor = string.ToColor(ultimate.cfg.colors["Bullet tracers"])
            local oldAlpha = tracercolor.a

            local curTime = CurTime()
            local dieTime = ultimate.cfg.vars["Tracers die time"]
    
            for i = #ultimate.bulletImpacts, 1, -1 do
                local impact = ultimate.bulletImpacts[i]

                if (curTime - impact.shootTime) > dieTime then
                    table.remove(ultimate.bulletImpacts, i)
                    continue
                end

                tracercolor.a = 255 - ( ( curTime - impact.shootTime ) / dieTime * 255 )
    
                render.DrawBeam( impact.startPos, impact.endPos, 1, 1, 1, tracercolor )
            end

            tracercolor.a = oldAlpha
        end

        

        if ultimate.cfg.vars["Auto peak"] and ultimate.startedPeeking then
            ultimate.drawAutopeak()
        end






        -- Saddam Hussein
        /*
        if ( pSaddamHussein.Position:DistToSqr( pLocalPlayer:EyePos() ) <= ( 2048 ^ 2 ) ) then
            render.MaterialOverride( Material( "!flat" ) ) 
            render.SetColorModulation( 255, 0, 0 )
            render.SetBlend( 255 ) 

            cam.IgnoreZ( true )
                pSaddamHussein.Model:DrawModel()

                cam.Start3D2D( pSaddamHussein.Position, Angle( 0, 0, 90 ), 0.25 )
                    surface.SetDrawColor( 0, 0, 0 )
                    surface.DrawRect( -128, -200, 4, 200 )

                    surface.SetFont( "saddamhussein" )
                    surface.SetTextColor( 0, 0, 0 )

                    surface.SetTextPos( -128, -256 )
                    surface.DrawText( "Saddam Hussein" )
                cam.End3D2D()
            cam.IgnoreZ( false )
        end
        */
    end 
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

function ultimate.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        // fix for RusEliteRP
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function ultimate.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() ) 
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team.GetName(iTeam), team.GetColor(iTeam)
    end
end

// Player data tables

ultimate.playerCache = {}

function ultimate.playerTableUpdate( ply )
    if not ultimate.playerCache[ ply ] then
        ultimate.playerCache[ ply ] = {}
    end
    
    local v = ultimate.playerCache[ ply ]

    v.entity = ply
    
    v.Name = ply:Name()

    local index, name, color = ultimate.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = ultimate.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( ultimate.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"
 
    v.MoneyVar = MetaPlayer.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function ultimate.playerDataUpdate( )

    ultimate.playerCache = {}

    local plys = player.GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == pLocalPlayer then continue end
    
        ultimate.playerTableUpdate( v )
    end
end

// Entity data

ultimate.entityCache = {}
ultimate.cfg.ents = {}

function ultimate.entTableUpdate()
    
    ultimate.entityCache = {}

    local entitys = ents.GetAll()

    for i = 1, #entitys do
        local v = entitys[ i ]

        if not IsValid( v ) then continue end 
        if not ultimate.cfg.ents[ v:GetClass() ] then continue end

        ultimate.entityCache[ #ultimate.entityCache + 1 ] = {
            entity = v,
            class = v:GetClass(),
            position = v:GetPos(),
        }
    end
end



// Resolver 

ultimate.bruteYaw = { -180, -120, -90, -60, -30, 0, 30, 60, 90, 120, 180  }

















do
    local localData = {}

    localData.origin = Vector()

    function ultimate.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end
    
    function ultimate.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function ultimate.PreFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            ultimate.entTableUpdate()

            plys = player.GetAll()

            local orig = pLocalPlayer:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            ultimate.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if !v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                --v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false 
                    v.break_lc = false

                    ultimate.btrecords[ v ] = {}
                    ultimate.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local flticks = ultimate.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math.Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = ultimate.getHitbox(v)
                    --end 
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if ultimate.canBacktrack(v) and v != pLocalPlayer and v.simtime_updated then
                    ultimate.recordBacktrack(v)
                end

                if v.break_lc then
                    ultimate.btrecords[ v ] = {}
                end

                
                if ultimate.cfg.vars["Extrapolation"] and v.simtime_updated and v != pLocalPlayer then
                    -- Получаем текущую позицию игрока
                    local currentPos = v:GetNetworkOrigin()
                    local currentTime = ded.GetSimulationTime(v:EntIndex())
                    
                    -- Вычисляем время предсказания с ограничением
                    local predTime = math.min(ded.GetLatency(0) + ded.GetLatency(1), 0.2) -- Максимум 200ms
                    
                    -- Проверяем, есть ли предыдущая позиция для сравнения
                    if not v.ult_prev_pos then
                        v.ult_prev_pos = currentPos
                        v.ult_prev_time = currentTime
                        return
                    end
                    
                    -- Вычисляем скорость движения
                    local timeDelta = currentTime - (v.ult_prev_time or currentTime)
                    if timeDelta <= 0 then return end
                    
                    local velocity = (currentPos - v.ult_prev_pos) / timeDelta
                    local speed = velocity:Length()
                    
                    -- Ограничиваем максимальную скорость для предотвращения телепортации
                    local maxSpeed = 1000 -- Максимальная разумная скорость
                    if speed > maxSpeed then
                        velocity = velocity:GetNormalized() * maxSpeed
                    end
                    
                    -- Начинаем симуляцию
                    ded.StartSimulation(v:EntIndex())
                    
                    local predictedPos = currentPos
                    local ticks = ultimate.TIME_TO_TICKS(predTime)
                    
                    -- Ограничиваем количество тиков
                    ticks = math.min(ticks, 20) -- Максимум 20 тиков
                    
                    for tick = 1, ticks do
                        ded.SimulateTick()
                        local data = ded.GetSimulationData()
                        
                        -- Проверяем на разумность позиции
                        local posChange = (data.m_vecAbsOrigin - predictedPos):Length()
                        if posChange > 200 then -- Если изменение позиции слишком большое
                            break -- Прерываем симуляцию
                        end
                        
                        predictedPos = data.m_vecAbsOrigin
                        debugoverlay.Cross(predictedPos, 6, 0.1, ultimate.Colors["Red"], true)
                    end
                    
                    local finalData = ded.GetSimulationData()
                    
                    -- Дополнительная проверка на разумность финальной позиции
                    local totalChange = (finalData.m_vecAbsOrigin - currentPos):Length()
                    if totalChange > 500 then -- Если изменение слишком большое
                        -- Используем линейную экстраполяцию вместо симуляции
                        predictedPos = currentPos + velocity * predTime
                    else
                        predictedPos = finalData.m_vecAbsOrigin
                    end
                    
                    -- Плавное смешивание между текущей и предсказанной позицией
                    local blendFactor = math.min(predTime * 2, 1.0) -- Плавность смешивания
                    local smoothedPos = currentPos + (predictedPos - currentPos) * blendFactor
                    
                    -- Устанавливаем позицию рендеринга
                    v:SetRenderOrigin(smoothedPos)
                    
                    -- Обновляем debug информацию
                    debugoverlay.Box(smoothedPos, v:OBBMins(), v:OBBMaxs(), 0.1, color_white)
                    
                    -- Сохраняем данные для следующего кадра
                    v.ult_prev_pos = currentPos
                    v.ult_prev_time = currentTime
                    
                    -- Обновляем таблицу предсказанных позиций
                    local boneData = ultimate.GetBones(v)
                    if boneData and boneData[1] then
                        ultimate.predicted[v] = {
                            pos = boneData[1],
                            tick = ultimate.TIME_TO_TICKS(currentTime + predTime),
                            confidence = math.max(0, 1 - (predTime * 2)) -- Уверенность в предсказании
                        }
                    end
                    
                    ded.FinishSimulation()
                end
                

                if ultimate.cfg.vars["Extrapolation"] and v.break_lc then
                    local predTime = ded.GetLatency(0) + ded.GetLatency(1)
                    ded.StartSimulation(v:EntIndex())
        
                    for tick = 1, ultimate.TIME_TO_TICKS(predTime) do
                        ded.SimulateTick()
                    end
        
                    local data = ded.GetSimulationData()
                    v:SetRenderOrigin(data.m_vecAbsOrigin)
                    v:SetNetworkOrigin(data.m_vecAbsOrigin)
                    ded.FinishSimulation()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == pLocalPlayer then continue end
            end
         end
    end
end

    
function ultimate.PostFrameStageNotify( stage ) 
    if stage == 3 then
        ultimate.playerDataUpdate()

        /*local playerlist = player.GetAll()

        for i = 1, #playerlist do
            local pEntity = playerlist[ i ]

            local iEntIndex = pEntity:EntIndex()
            local pTable = pEntity:GetTable()

            -- Simulation time 
            local flSimulationTime = ded.GetSimulationTime( iEntIndex )

            pTable.iChokedCommands = Utility.TimeToTicks( flSimulationTime - pTable.flSimulationTime )
            pTable.bIsSimulated = flSimulationTime ~= pTable.flSimulationTime
            pTable.flSimulationTime = flSimulationTime    
        end*/
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

ultimate.fakeAngles = {
    angle = pLocalPlayer:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = pLocalPlayer:GetPos(),
}

function ultimate.UpdateAnimation( v )
    v:InvalidateBoneCache()
end

function ultimate.ShouldUpdateAnimation( entIndex ) 
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
ultimate.realModel = ultimate.CS_Model( pLocalPlayer:GetModel() )
ultimate.fakeModel = ultimate.CS_Model( pLocalPlayer:GetModel() )

ultimate.newModel = pLocalPlayer:GetModel()

function ultimate.drawCSModels_real()
    if not ultimate.cfg.vars["Anti aim chams"] or not ultimate.tpenabled then 
        return 
    end 
    if not pLocalPlayer:Alive() then 
        return 
    end

    local mymodel = pLocalPlayer:GetModel()

    if ultimate.newModel != mymodel then
        ultimate.CS_Model( mymodel )
        ultimate.newModel = mymodel
    end

    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }

    ultimate.CS_Model_update( pLocalPlayer, ultimate.realModel, tbl )

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.cfg.colors["Real chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg.vars["Antiaim material"]]) 
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.SetBlend(col.a/255) 
    ultimate.realModel:SetRenderMode(1)
    ultimate.realModel:DrawModel()

    if ultimate.cfg.vars["Antiaim fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

/*
    hooks -> PostDrawEffects
*/

do
    /*
            

    */

    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat		= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }
    
    ultimate.cfg.vars["Player outline"] = false
    ultimate.cfg.vars["Entity outline"] = false
    ultimate.cfg.colors["Player outline"] = "45 255 86 255"
    ultimate.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function ultimate.RenderOutline()
        local renderEnts = {}

        if ultimate.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do 
                local v = plys[ i ]

                if not IsValid( v ) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if ultimate.cfg.vars["Entity outline"] then
            for i = 1, #ultimate.entityCache do
                local v = ultimate.entityCache[ i ].entity 

                if not IsValid( v ) or v:IsDormant() then continue end
        
                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)
        
        if subclear[ ultimate.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam.IgnoreZ(true)
            render.SuppressEngineLighting(true)
        
            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)
            
            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)
            
            cam.Start3D()
                for i = 1, #renderEnts do 
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam.End3D()
            
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            cam.Start2D()
                for i = 1, #renderEnts do 
                    local c = renderEnts[i]:IsPlayer() and string.ToColor( ultimate.cfg.colors["Player outline"] ) or string.ToColor( ultimate.cfg.colors["Entity outline"] ) 

				    render.SetStencilReferenceValue( i )

                    surface.SetDrawColor( c )
                    surface.DrawRect( 0, 0, screenWidth, screenHeight )

                    // surface_SimpleTexturedRect( 0, 0, screenWidth, screenHeight, string.ToColor( ultimate.cfg.colors["Health bar gradient"] ) , ultimate.Materials["Gradient"] )
                end
            cam.End2D()
            
            render.SuppressEngineLighting(false)
            cam.IgnoreZ(false)
        render.SetStencilEnable(false)
        
        render.CopyRenderTargetToTexture(DrawTexture)

        if ultimate.cfg.vars["Outline style"] > 1 then 
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()
        
        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)
            
            local mat = outline_mats[ ultimate.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render.SetMaterial( mat )
            
            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end
                    
                    render.DrawScreenQuadEx(x,y,screenWidth,screenHeight)
                end
            end
        render.SetStencilEnable(false)
    end
end

function ultimate.PostDrawEffects()
    if ultimate.UnSafeFrame then return end
    if not ultimate.cfg.vars["Player outline"] and not ultimate.cfg.vars["Entity outline"] then return end

    ultimate.RenderOutline()
end
    
function ultimate.AdjustMouseSensitivity( defaultSensivity )
    return ultimate.cfg.vars["Disable sensivity adjustment"] and 0 or nil
end

ultimate.fbe = false

function ultimate.PreRender()
    if ultimate.cfg.vars["Fullbright"] and ultimate.fbe then
        render.SetLightingMode( ultimate.cfg.vars["Fullbright mode"] )
    end
end

function ultimate.GetMotionBlurValues()
    render.SetLightingMode( 0 )
end

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end

GAMEMODE["EntityFireBullets"] = function( self, p, data ) 
    if not ultimate.activeWeapon then return end

    local tick = engine.TickCount()
    if ultimate.cfg.vars[ "On screen logs" ] and data.Src == pLocalPlayer:EyePos() and ultimate.aimingrn and ultimate.target and not ultimate.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1
        
        local tr = {}
        tr.filter = pLocalPlayer 
        tr.start = data.Src 
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if ultimate.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity != ultimate.target then
            reason = 2
        end
        
        local hlcolor = string.ToColor( ultimate.cfg.colors[ ultimate.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", ultimate.target:Name(), " missed due to ", ultimate.MissReasons[ reason ].str, },
            { ultimate.HitLogsWhite, hlcolor, ultimate.HitLogsWhite, hlcolor, }
        }
            
        ultimate.onScreenLogs[ tick ] = data
    end
 
    local spread = data.Spread * -1
    
	if ultimate.cones[ ultimate.activeWeaponClass ] == spread or spread == ultimate.nullVec then return end

    ultimate.cones[ ultimate.activeWeaponClass ] = spread;
end

local playerTrail = {}

local function UpdatePlayerTrail()
    local ply = LocalPlayer()

    if ply:IsValid() then
        if ply:Alive() then
            table.insert(playerTrail, ply:GetPos())

            while #playerTrail > 100 do
                table.remove(playerTrail, 1)
            end
        else
            playerTrail = {}
        end
    end
end

hook.Add("Think", "UpdatePlayerTrail", UpdatePlayerTrail)

local function DrawPlayerTrail()
    if ultimate.cfg.vars["Player Line"] then
        for i = 1, #playerTrail - 1 do
            local startPos = playerTrail[i] + Vector(0, 0, 10)
            local endPos = playerTrail[i + 1] + Vector(0, 0, 10)

            local t = i / #playerTrail

            local hue = Lerp(t, 300, 0)
            local color = HSVToColor(hue, 1, 1)

            render.DrawLine(startPos, endPos, color, true)
        end
    end
end

hook.Add("PostDrawTranslucentRenderables", "DrawPlayerTrail", DrawPlayerTrail)

local trailToggleCooldown = 0

hook.Add("Think", "Ultimate_TrailRemoveKey", function()
    if input.IsKeyDown(KEY_END) and CurTime() > trailToggleCooldown then
        hook.Remove("Think", "UpdatePlayerTrail")
        hook.Remove("PostDrawTranslucentRenderables", "DrawPlayerTrail")
        hook.Remove("Think", "Ultimate_TrailRemoveKey")
        trailToggleCooldown = CurTime() + 0.5
    end
end)

--[[
    --rgb лента блять аххахаха
local function DrawPlayerTrail()

    if ultimate.cfg.vars["test"] then

        for i = 1, #playerTrail - 1 do
            local startPos = playerTrail[i] + Vector(0, 0, 10)
            local endPos = playerTrail[i + 1] + Vector(0, 0, 10)

            local color = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))

            render.DrawLine(startPos, endPos, color, true)
        end
    end
end
--]]


if ultimate.cfg.vars["qmenu unlock"] then

    hook.Remove("SpawnMenuOpen", "FlagCheckPET")

    hook.Add("SpawnMenuOpen", "AllowAllPlayers", function()
        return true
    end)
end

gameevent.Listen("entity_killed")
local skokubil = 0
hook.Add("entity_killed", "killeventss", function(data)

    if ultimate.cfg.vars["Kill effect"] then
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)

        if attacker == LocalPlayer() and attacker ~= victim and (victim:IsPlayer() or victim:IsBot()) then 

            do
                local vPoint = LocalPlayer():GetPos()
                local effectdata = EffectData()
                effectdata:SetOrigin(vPoint)
                effectdata:SetStart(vPoint)
                util.Effect("VortDispel", effectdata)
            end

            do
                local vpos = victim:GetPos()
                local effectdata = EffectData()
                if victim:LookupBone("ValveBiped.Bip01_Head1") == nil then
                    effectdata:SetOrigin(vpos)
                else
                    effectdata:SetOrigin(victim:GetBonePosition(victim:LookupBone("ValveBiped.Bip01_Head1")))
                end
                effectdata:SetMagnitude(5)
                effectdata:SetScale(3)
                util.Effect("ElectricSpark", effectdata)
            end
        end
    end

    if ultimate.cfg.vars.localkillfeed then
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)

        if not IsValid(victim) or not IsValid(attacker) then return end
        if not me or not me:IsValid() then return end

        if attacker == me and victim ~= me and (victim:IsPlayer() or victim:IsBot()) then
            skokubil = skokubil + 1
            chat.AddText(Color(0, 0, 0), "[Killfeed] ", Color(255, 0, 0), "You killed ",
                Color(255, 255, 255), victim:Name(), Color(255, 255, 255), "")
        end

        if victim == me and attacker ~= me and (attacker:IsPlayer() or attacker:IsBot()) then
            chat.AddText(Color(0, 0, 0), "[Killfeed] ", Color(255, 0, 0), attacker:Name(),
                Color(255, 255, 255), " killed you")
        end
    end      
end)

function ultimate.SetupWorldFog()
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])
    

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.SetupSkyboxFog( SkyboxSize )
    if not ultimate.cfg.vars[ "FogChanger" ] then return end 

    local color = string.ToColor(ultimate.cfg.colors["FogChanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg.vars[ "FogStart" ] * SkyboxSize )
    render.FogEnd( ultimate.cfg.vars[ "FogEnd" ] * SkyboxSize ) 
    render.FogMaxDensity( color.a / 255 )
    
    return true 
end

function ultimate.CalcMainActivity(ply, velocity)
    if ultimate.cfg.vars["TPOSE"] and ply ~= LocalPlayer() and not ultimate.cfg.friends[ply:SteamID()] then
        return -1, -1
    end
end

net.Receive("rp.police.SetLocalHandcuff", function()
    if not ultimate.cfg.vars["Retry on handcuff"] then return end
    
    RunConsoleCommand("retry")
end)

hook.Add("PrePlayerDraw","nicespastil",function(chel) 
    if ultimate.cfg.vars["leg_breaker"] then 
    if chel != LocalPlayer() then return end
    chel:SetAnimTime(CurTime()+1,00001)
end
end)


/*
    Hooks
*/

ultimate.hooks           = {}
ultimate.hooks.tbl      = {}
ultimate.hooks.removed  = {}

local tickrate = math.floor( 1 / engine.TickInterval() ) - 1
local swap = false
local writtenTicks = 0 
local coolingTicks = 0 
function ultimate.hTick()
    if ultimate.cfg.vars["sboxcrasher"] then
        
            
        if writtenTicks > tickrate then
            swap = true 
    
            writtenTicks = 0
        end
    
        coolingTicks = swap and coolingTicks + 1 or 0
    
        if coolingTicks > 8 then
            swap = false
        end
    
        if swap then
            return 
        end
    
        for i = 1, 128 do
            me:ConCommand("gm_spawn models/xqm/jetbody3_s5.mdl")
        end
    end
end 

function ultimate.AddHook( event, func )
    if func == nil and not ultimate[ event ] then print("Failed to find hook: " .. event) return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, ultimate[ event ] or func )
    ultimate.hooks[ #ultimate.hooks + 1 ] = { event, name }
end

function ultimate.RemoveAllHooks()
    for i = #ultimate.hooks, 1, -1 do
        local chk = ultimate.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(ultimate.hooks, i)
    end
end

function ultimate.Unload()
    ultimate.frame:Remove()

    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ultimate.RemoveAllHooks() 

    render.SetLightingMode( 0 )
end

ultimate.AddHook( "CreateMove" )
ultimate.AddHook( "Think" )
ultimate.AddHook( "Tick", ultimate.hTick )

ultimate.AddHook( "RenderScene" )
ultimate.AddHook( "DrawOverlay" )
ultimate.AddHook( "Ungrabbable2D", function() ultimate.DrawESP() ultimate.DrawSomeShit() end )   

ultimate.AddHook( "CalcView" )
ultimate.AddHook( "CalcViewModelView" )

ultimate.AddHook( "PreDrawViewModel" )
ultimate.AddHook( "PostDrawViewModel" )

ultimate.AddHook( "PostDrawOpaqueRenderables" )
ultimate.AddHook( "PostDrawEffects" )

ultimate.AddHook( "OnImpact" )

ultimate.AddHook( "PreFrameStageNotify" )
ultimate.AddHook( "PostFrameStageNotify" )

ultimate.AddHook( "UpdateAnimation" )
ultimate.AddHook( "ShouldUpdateAnimation" )

ultimate.AddHook( "AdjustMouseSensitivity" )

ultimate.AddHook( "RenderScreenspaceEffects" )
ultimate.AddHook( "PostDrawTranslucentRenderables" )

ultimate.AddHook( "PreRender" )
ultimate.AddHook( "GetMotionBlurValues" )

ultimate.AddHook( "DrawPhysgunBeam" )

ultimate.AddHook( "PrePlayerDraw" )

ultimate.AddHook( "OnEntityCreated" )  

ultimate.AddHook( "entity_killed" )  
ultimate.AddHook( "player_hurt" )  

ultimate.AddHook( "SetupWorldFog" )
ultimate.AddHook( "SetupSkyboxFog" )
ultimate.AddHook( "ShouldDrawLocalPlayer" )
ultimate.AddHook( "CalcMainActivity" )
-- хуки функции

hook.Add("PreDrawPlayerHands", "ChamsHand", function(hands, vm, ply, wep)
    local col = string.ToColor(ultimate.cfg.colors["chams_hand"])
    ultimate.chamMats.vis[6]:SetVector("$envmaptint", Vector(col.r / 255, col.g / 255, col.b / 255))
    local mat = ultimate.chamMats.vis[ultimate.cfg.vars["chams_hand_mat"]]
    if ultimate.cfg.vars["chams_hand"] then
        render.SetBlend(col.a / 255)
        render.SetColorModulation(col.r / 255, col.g / 255, col.b / 255)
        render.MaterialOverride(mat)
    end
end)

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player.GetAll()) do
        if ultimate.cfg.vars["Modelchanger"] then
            LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
            if ultimate.cfg.vars["Modelchanger model"] == 1 then
                LocalPlayer():SetModel("models/cyanblue/fate_extella_link/astolfo/astolfo.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 2 then
                LocalPlayer():SetModel("models/squids_pms/ocs/xani_protogen/xani_pm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 3 then
                LocalPlayer():SetModel("models/walter/playermodels/walter.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 4 then
                LocalPlayer():SetModel("models/survivors/survivor_mechanic.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 5 then
                LocalPlayer():SetModel("models/ray/nikoo/nikopm.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 6 then
                LocalPlayer():SetModel("models/player/floyd/georgedroyd.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/jazzmcfly/bgs/bgs.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 8 then
                LocalPlayer():SetModel("models/invincible/mark/mark.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 9 then
                LocalPlayer():SetModel("models/good/goob_outlined.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 10 then
                LocalPlayer():SetModel("models/boykisser/boykisser.mdl")
            elseif ultimate.cfg.vars["Modelchanger model"] == 11 then   
                LocalPlayer():SetModel("models/adidas_combine/playermodel/adidas_combine.mdl")            
            end
            LocalPlayer():SetupBones()
        end
        /*if ultimate.cfg.vars["Player_modelchanger"] then
            v:InvalidateBoneCache()	
            v:SetupBones()
            if ultimate.cfg.vars["Player_modelchanger_agent"] == 1 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/charple.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 2 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/Group01/male_03.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 3 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/gman_high.mdl")
            elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 4 then
                v:InvalidateBoneCache()	
                v:SetupBones()
                v:SetModel("models/player/zombie_classic.mdl")
                elseif ultimate.cfg.vars["Player_modelchanger_agent"] == 5 then
                v:InvalidateBoneCache()    
                v:SetupBones()
                v:SetModel("models/player/Astolfo.mdl")
            end			
        end*/
    
    end
		
	
end)


hook.Add("PostDrawPlayerHands", "ChamsHandBlend", function(hands, vm, ply, wep)
    if ultimate.cfg.vars["chams_hand"] then
        render.SetBlend(1)
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride()
    end
    ultimate.rukient = vm
end)

end
