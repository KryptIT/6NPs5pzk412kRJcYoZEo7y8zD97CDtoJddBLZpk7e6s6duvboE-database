--[[
This took me so long took me 3 months to understand whole syncapi 
BY X9D 
$$\      $$\  $$$$$$\  $$$$$$$\         $$$$$$\        $$$$$$$$\  $$$$$$\  $$\   $$\ 
$$$\    $$$ |$$  __$$\ $$  __$$\       $$  __$$\       $$  _____|$$ ___$$\ $$ |  $$ |
$$$$\  $$$$ |$$ /  $$ |$$ |  $$ |      \__/  $$ |      $$ |      \_/   $$ |\$$\ $$  |
$$\$$\$$ $$ |$$$$$$$$ |$$$$$$$  |       $$$$$$  |      $$$$$\      $$$$$ /  \$$$$  / 
$$ \$$$  $$ |$$  __$$ |$$  ____/       $$  ____/       $$  __|     \___$$\  $$  $$<  
$$ |\$  /$$ |$$ |  $$ |$$ |            $$ |            $$ |      $$\   $$ |$$  /\$$\ 
$$ | \_/ $$ |$$ |  $$ |$$ |            $$$$$$$$\       $$ |      \$$$$$$  |$$ /  $$ |
\__|     \__|\__|  \__|\__|            \________|      \__|       \______/ \__|  \__|
                                                                                     
]]       
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

RequestCommand:InvokeServer(";btools me")
task.wait(1.2)
RequestCommand:InvokeServer(";punish all")
task.wait(0.2) 


local player = game.Players.LocalPlayer
local backpack = player.Backpack
local character = player.Character

local function getF3X()
    for _, v in ipairs(backpack:GetChildren()) do
        if v:FindFirstChild("SyncAPI") then return v end
    end
    for _, v in ipairs(character:GetChildren()) do
        if v:FindFirstChild("SyncAPI") then return v end
    end
    return nil
end

local f3x = getF3X()
if not f3x then
    warn("F3X / SyncAPI not found – please equip btools and try again")
    return
end

local syncapi = f3x.SyncAPI
local endpoint = syncapi.ServerEndpoint


for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
        task.spawn(function()
            pcall(function()
                endpoint:InvokeServer("Remove", {v})
            end)
        end)
    end
end
task.wait(1)


local function syncAnchor(ep, part, anchored)
    ep:InvokeServer("SyncAnchor", {{Part = part, Anchored = anchored}})
end

local function batchResize(ep, tbl) if #tbl>0 then ep:InvokeServer("SyncResize", tbl) end end
local function batchMaterial(ep, tbl) if #tbl>0 then ep:InvokeServer("SyncMaterial", tbl) end end
local function batchColor(ep, tbl) if #tbl>0 then ep:InvokeServer("SyncColor", tbl) end end
local function batchCollision(ep, tbl) if #tbl>0 then ep:InvokeServer("SyncCollision", tbl) end end


local function createMesh(ep, part) ep:InvokeServer("CreateMeshes", {{Part = part}}) end
local function syncMeshType(ep, part, t) ep:InvokeServer("SyncMesh", {{Part = part, MeshType = t}}) end
local function syncMeshScale(ep, part, s) ep:InvokeServer("SyncMesh", {{Part = part, Scale = s}}) end
local function syncMeshOffset(ep, part, o) ep:InvokeServer("SyncMesh", {{Part = part, Offset = o}}) end
local function syncMeshId(ep, part, id) ep:InvokeServer("SyncMesh", {{Part = part, MeshId = id}}) end
local function syncMeshTexture(ep, part, tex) ep:InvokeServer("SyncMesh", {{Part = part, TextureId = tex}}) end
local function syncMeshVertexColor(ep, part, col) ep:InvokeServer("SyncMesh", {{Part = part, VertexColor = col}}) end


local function createDecal(ep, part, face) ep:InvokeServer("CreateTextures", {{Part = part, Face = face, TextureType = "Decal"}}) end
local function setDecalTexture(ep, part, tex, face) ep:InvokeServer("SyncTexture", {{Part = part, Face = face, TextureType = "Decal", Texture = tex}}) end
local function setDecalTransparency(ep, part, trans, face) ep:InvokeServer("SyncTexture", {{Part = part, Face = face, TextureType = "Decal", Transparency = trans}}) end


local function createTexture(ep, part, face) ep:InvokeServer("CreateTextures", {{Part = part, Face = face, TextureType = "Texture"}}) end
local function setTextureId(ep, part, tex, face) ep:InvokeServer("SyncTexture", {{Part = part, Face = face, TextureType = "Texture", Texture = tex}}) end
local function setTextureTransparency(ep, part, trans, face) ep:InvokeServer("SyncTexture", {{Part = part, Face = face, TextureType = "Texture", Transparency = trans}}) end


local function createLight(ep, part, lightType)
    ep:InvokeServer("CreateLights", {{Part = part, LightType = lightType}})
end
local function syncLight(ep, part, lightType, brightness, range, color, shadows, face, angle)
    local params = {Part = part, LightType = lightType}
    if brightness ~= nil then params.Brightness = brightness end
    if range ~= nil then params.Range = range end
    if color then params.Color = color end
    if shadows ~= nil then params.Shadows = shadows end
    if face and face ~= "nil" then params.Face = face end
    if angle ~= nil then params.Angle = angle end
    ep:InvokeServer("SyncLighting", {params})
end


local function createGroup(ep, groupType, parent, items) return ep:InvokeServer("CreateGroup", groupType, parent, items) end
local function setName(ep, obj, name) ep:InvokeServer("SetName", {obj}, name) end
local function setLocked(ep, part, lock) ep:InvokeServer("SetLocked", {part}, lock) end


local P = {}

local partData = {
    [6] = {anchored = true},
    [10] = {anchored = true},
    [14] = {anchored = true},
    [16] = {anchored = true},
    [21] = {anchored = true},
    [26] = {anchored = true},
    [31] = {anchored = true},
    [39] = {anchored = true},
    [46] = {anchored = true},
    [47] = {anchored = true},
    [48] = {anchored = true},
    [49] = {anchored = true},
    [50] = {anchored = true},
    [51] = {anchored = true},
    [52] = {anchored = true},
    [53] = {anchored = true},
    [54] = {anchored = true},
    [55] = {anchored = true},
    [57] = {anchored = true},
    [58] = {anchored = true},
    [59] = {anchored = true},
    [60] = {anchored = true},
    [61] = {anchored = true},
    [62] = {anchored = true},
    [63] = {anchored = true},
    [64] = {anchored = true},
    [65] = {anchored = true},
    [66] = {anchored = true},
    [67] = {anchored = true},
    [68] = {anchored = true},
    [69] = {anchored = true},
    [70] = {anchored = true},
    [71] = {anchored = true},
    [72] = {anchored = true},
    [73] = {anchored = true},
    [74] = {anchored = true},
    [75] = {anchored = true},
    [76] = {anchored = true},
    [77] = {anchored = true},
    [78] = {anchored = true},
    [79] = {anchored = true},
    [80] = {anchored = true},
    [81] = {anchored = true},
    [84] = {anchored = true},
    [88] = {anchored = true},
    [89] = {anchored = true},
    [92] = {anchored = true},
    [93] = {anchored = true},
    [97] = {anchored = true},
    [98] = {anchored = true},
    [99] = {anchored = true},
    [100] = {anchored = true},
    [101] = {anchored = true},
    [102] = {anchored = true},
    [103] = {anchored = true},
    [104] = {anchored = true},
    [105] = {anchored = true},
    [107] = {anchored = true},
    [108] = {anchored = true},
    [109] = {anchored = true},
    [110] = {anchored = true},
    [111] = {anchored = true},
    [112] = {anchored = true},
    [113] = {anchored = true},
    [114] = {anchored = true},
    [115] = {anchored = true},
    [116] = {anchored = true},
    [117] = {anchored = true},
    [118] = {anchored = true},
    [119] = {anchored = true},
    [123] = {anchored = true},
    [125] = {anchored = true},
    [126] = {anchored = true},
    [127] = {anchored = true},
    [128] = {anchored = true},
    [129] = {anchored = true},
    [130] = {anchored = true},
    [131] = {anchored = true},
    [132] = {anchored = true},
    [133] = {anchored = true},
    [134] = {anchored = true},
    [135] = {anchored = true},
    [136] = {anchored = true},
    [137] = {anchored = true},
    [138] = {anchored = true},
    [139] = {anchored = true},
    [140] = {anchored = true},
    [141] = {anchored = true},
    [142] = {anchored = true},
    [143] = {anchored = true},
    [144] = {anchored = true},
    [145] = {anchored = true},
    [146] = {anchored = true},
    [147] = {anchored = true},
    [148] = {anchored = true},
    [149] = {anchored = true},
    [150] = {anchored = true},
    [151] = {anchored = true},
    [152] = {anchored = true},
    [153] = {anchored = true},
    [154] = {anchored = true},
    [155] = {anchored = true},
    [156] = {anchored = true},
    [157] = {anchored = true},
    [158] = {anchored = true},
    [159] = {anchored = true},
    [161] = {anchored = true},
    [162] = {anchored = true},
    [163] = {anchored = true},
    [164] = {anchored = true},
    [165] = {anchored = true},
    [166] = {anchored = true},
    [167] = {anchored = true},
    [168] = {anchored = true},
    [169] = {anchored = true},
    [170] = {anchored = true},
    [171] = {anchored = true},
    [172] = {anchored = true},
    [173] = {anchored = true},
    [174] = {anchored = true},
    [175] = {anchored = true},
    [176] = {anchored = true},
    [177] = {anchored = true},
    [178] = {anchored = true},
    [179] = {anchored = true},
    [180] = {anchored = true},
    [181] = {anchored = true},
    [182] = {anchored = true},
    [183] = {anchored = true},
    [184] = {anchored = true},
    [185] = {anchored = true},
    [186] = {anchored = true},
    [187] = {anchored = true},
    [188] = {anchored = true},
    [189] = {anchored = true},
    [190] = {anchored = true},
    [191] = {anchored = true},
    [192] = {anchored = true},
    [193] = {anchored = true},
    [194] = {anchored = true},
    [195] = {anchored = true},
    [196] = {anchored = true},
    [197] = {anchored = true},
    [198] = {anchored = true},
    [199] = {anchored = true},
    [201] = {anchored = true},
    [202] = {anchored = true},
    [203] = {anchored = true},
    [204] = {anchored = true},
    [205] = {anchored = true},
    [206] = {anchored = true},
    [207] = {anchored = true},
    [208] = {anchored = true},
    [209] = {anchored = true},
    [210] = {anchored = true},
    [211] = {anchored = true},
    [212] = {anchored = true},
    [213] = {anchored = true},
    [214] = {anchored = true},
    [215] = {anchored = true},
    [216] = {anchored = true},
    [217] = {anchored = true},
    [218] = {anchored = true},
    [219] = {anchored = true},
    [220] = {anchored = true},
    [221] = {anchored = true},
    [222] = {anchored = true},
    [223] = {anchored = true},
    [224] = {anchored = true},
    [225] = {anchored = true},
    [226] = {anchored = true},
    [227] = {anchored = true},
    [230] = {anchored = true},
    [231] = {anchored = true},
    [232] = {anchored = true},
    [233] = {anchored = true},
    [234] = {anchored = true},
    [235] = {anchored = true},
    [236] = {anchored = true},
    [237] = {anchored = true},
    [238] = {anchored = true},
    [239] = {anchored = true},
    [240] = {anchored = true},
    [241] = {anchored = true},
    [242] = {anchored = true},
    [243] = {anchored = true},
    [244] = {anchored = true},
    [245] = {anchored = true},
    [246] = {anchored = true},
    [247] = {anchored = true},
    [248] = {anchored = true},
    [249] = {anchored = true},
    [250] = {anchored = true},
    [251] = {anchored = true},
    [252] = {anchored = true},
    [253] = {anchored = true},
    [254] = {anchored = true},
    [255] = {anchored = true},
    [256] = {anchored = true},
    [257] = {anchored = true},
    [258] = {anchored = true},
    [259] = {anchored = true},
    [260] = {anchored = true},
    [262] = {anchored = true},
    [263] = {anchored = true},
    [264] = {anchored = true},
    [265] = {anchored = true},
    [266] = {anchored = true},
    [267] = {anchored = true},
    [268] = {anchored = true},
    [269] = {anchored = true},
    [270] = {anchored = true},
    [271] = {anchored = true},
    [272] = {anchored = true},
    [273] = {anchored = true},
    [274] = {anchored = true},
    [275] = {anchored = true},
    [276] = {anchored = true},
    [277] = {anchored = true},
    [278] = {anchored = true},
    [279] = {anchored = true},
    [280] = {anchored = true},
    [281] = {anchored = true},
    [282] = {anchored = true},
    [283] = {anchored = true},
    [284] = {anchored = true},
    [285] = {anchored = true},
    [286] = {anchored = true},
    [288] = {anchored = true},
    [289] = {anchored = true},
    [290] = {anchored = true},
    [291] = {anchored = true},
    [292] = {anchored = true},
    [293] = {anchored = true},
    [294] = {anchored = true},
    [295] = {anchored = true},
    [296] = {anchored = true},
    [297] = {anchored = true},
    [298] = {anchored = true},
    [299] = {anchored = true},
    [300] = {anchored = true},
    [301] = {anchored = true},
    [302] = {anchored = true},
    [304] = {anchored = true},
    [305] = {anchored = true},
    [306] = {anchored = true},
    [307] = {anchored = true},
    [308] = {anchored = true},
    [309] = {anchored = true},
    [310] = {anchored = true},
    [311] = {anchored = true},
    [312] = {anchored = true},
    [313] = {anchored = true},
    [314] = {anchored = true},
    [315] = {anchored = true},
    [316] = {anchored = true},
    [317] = {anchored = true},
    [318] = {anchored = true},
    [319] = {anchored = true},
    [320] = {anchored = true},
    [321] = {anchored = true},
    [322] = {anchored = true},
    [323] = {anchored = true},
    [324] = {anchored = true},
    [325] = {anchored = true},
    [326] = {anchored = true},
    [327] = {anchored = true},
    [328] = {anchored = true},
    [329] = {anchored = true},
    [330] = {anchored = true},
    [331] = {anchored = true},
    [332] = {anchored = true},
    [333] = {anchored = true},
    [334] = {anchored = true},
    [335] = {anchored = true},
    [336] = {anchored = true},
    [337] = {anchored = true},
    [338] = {anchored = true},
    [339] = {anchored = true},
    [340] = {anchored = true},
    [341] = {anchored = true},
    [342] = {anchored = true},
    [343] = {anchored = true},
    [344] = {anchored = true},
    [345] = {anchored = true},
    [346] = {anchored = true},
    [347] = {anchored = true},
    [348] = {anchored = true},
    [349] = {anchored = true},
    [350] = {anchored = true},
    [351] = {anchored = true},
    [352] = {anchored = true},
    [353] = {anchored = true},
    [354] = {anchored = true},
    [355] = {anchored = true},
    [356] = {anchored = true},
    [357] = {anchored = true},
    [358] = {anchored = true},
    [359] = {anchored = true},
    [360] = {anchored = true},
    [361] = {anchored = true},
    [362] = {anchored = true},
    [363] = {anchored = true},
    [364] = {anchored = true},
    [365] = {anchored = true},
    [366] = {anchored = true},
    [367] = {anchored = true},
    [368] = {anchored = true},
    [369] = {anchored = true},
    [370] = {anchored = true},
    [371] = {anchored = true},
    [373] = {anchored = true},
    [374] = {anchored = true},
    [375] = {anchored = true},
    [376] = {anchored = true},
    [377] = {anchored = true},
    [378] = {anchored = true},
    [379] = {anchored = true},
    [380] = {anchored = true},
    [381] = {anchored = true},
    [382] = {anchored = true},
    [383] = {anchored = true},
    [384] = {anchored = true},
    [385] = {anchored = true},
    [388] = {anchored = true},
    [389] = {anchored = true},
    [390] = {anchored = true},
    [391] = {anchored = true},
    [392] = {anchored = true},
    [393] = {anchored = true},
    [394] = {anchored = true},
    [395] = {anchored = true},
    [396] = {anchored = true},
    [397] = {anchored = true},
    [398] = {anchored = true},
    [399] = {anchored = true},
    [400] = {anchored = true},
    [401] = {anchored = true},
    [402] = {anchored = true},
    [403] = {anchored = true},
    [404] = {anchored = true},
    [405] = {anchored = true},
    [406] = {anchored = true},
    [407] = {anchored = true},
    [408] = {anchored = true},
    [409] = {anchored = true},
    [410] = {anchored = true},
    [411] = {anchored = true},
    [412] = {anchored = true},
    [413] = {anchored = true},
    [414] = {anchored = true},
    [415] = {anchored = true},
    [416] = {anchored = true},
    [417] = {anchored = true},
    [418] = {anchored = true},
    [419] = {anchored = true},
    [420] = {anchored = true},
    [421] = {anchored = true},
    [422] = {anchored = true},
    [423] = {anchored = true},
    [424] = {anchored = true},
    [425] = {anchored = true},
    [426] = {anchored = true},
    [427] = {anchored = true},
    [428] = {anchored = true},
    [429] = {anchored = true},
    [430] = {anchored = true},
    [431] = {anchored = true},
    [432] = {anchored = true},
    [433] = {anchored = true},
    [434] = {anchored = true},
    [435] = {anchored = true},
    [436] = {anchored = true},
    [437] = {anchored = true},
    [438] = {anchored = true},
    [439] = {anchored = true},
    [440] = {anchored = true},
    [441] = {anchored = true},
    [442] = {anchored = true},
    [443] = {anchored = true},
    [444] = {anchored = true},
    [445] = {anchored = true},
    [446] = {anchored = true},
    [447] = {anchored = true},
    [448] = {anchored = true},
    [449] = {anchored = true},
    [450] = {anchored = true},
    [451] = {anchored = true},
    [452] = {anchored = true},
    [453] = {anchored = true},
    [454] = {anchored = true},
    [455] = {anchored = true},
    [456] = {anchored = true},
    [457] = {anchored = true},
    [458] = {anchored = true},
    [459] = {anchored = true},
    [460] = {anchored = true},
    [461] = {anchored = true},
    [462] = {anchored = true},
    [463] = {anchored = true},
    [464] = {anchored = true},
    [465] = {anchored = true},
    [466] = {anchored = true},
    [467] = {anchored = true},
    [468] = {anchored = true},
    [469] = {anchored = true},
    [470] = {anchored = true},
    [471] = {anchored = true},
    [472] = {anchored = true},
    [473] = {anchored = true},
    [474] = {anchored = true},
    [475] = {anchored = true},
    [476] = {anchored = true},
    [477] = {anchored = true},
    [478] = {anchored = true},
    [479] = {anchored = true},
    [480] = {anchored = true},
    [481] = {anchored = true},
    [482] = {anchored = true},
    [483] = {anchored = true},
    [484] = {anchored = true},
    [485] = {anchored = true},
    [486] = {anchored = true},
    [487] = {anchored = true},
    [488] = {anchored = true},
    [489] = {anchored = true},
    [490] = {anchored = true},
    [493] = {anchored = true},
    [494] = {anchored = true},
    [495] = {anchored = true},
    [496] = {anchored = true},
    [497] = {anchored = true},
    [498] = {anchored = true},
    [499] = {anchored = true},
    [500] = {anchored = true},
    [501] = {anchored = true},
    [502] = {anchored = true},
    [503] = {anchored = true},
    [504] = {anchored = true},
    [505] = {anchored = true},
    [506] = {anchored = true},
    [507] = {anchored = true},
    [508] = {anchored = true},
    [509] = {anchored = true},
    [510] = {anchored = true},
    [511] = {anchored = true},
    [512] = {anchored = true},
    [513] = {anchored = true},
    [514] = {anchored = true},
    [515] = {anchored = true},
    [516] = {anchored = true},
    [517] = {anchored = true},
    [518] = {anchored = true},
    [519] = {anchored = true},
    [520] = {anchored = true},
    [521] = {anchored = true},
    [522] = {anchored = true},
    [523] = {anchored = true},
    [524] = {anchored = true},
    [525] = {anchored = true},
    [526] = {anchored = true},
    [527] = {anchored = true},
    [528] = {anchored = true},
    [529] = {anchored = true},
    [530] = {anchored = true},
    [531] = {anchored = true},
    [532] = {anchored = true},
    [533] = {anchored = true},
    [534] = {anchored = true},
    [535] = {anchored = true},
    [536] = {anchored = true},
    [537] = {anchored = true},
    [538] = {anchored = true},
    [539] = {anchored = true},
    [540] = {anchored = true},
    [541] = {anchored = true},
    [543] = {anchored = true},
    [544] = {anchored = true},
    [545] = {anchored = true},
    [546] = {anchored = true},
    [547] = {anchored = true},
    [548] = {anchored = true},
    [549] = {anchored = true},
    [550] = {anchored = true},
    [551] = {anchored = true},
    [552] = {anchored = true},
    [553] = {anchored = true},
    [554] = {anchored = true},
    [555] = {anchored = true},
    [556] = {anchored = true},
    [557] = {anchored = true},
    [558] = {anchored = true},
    [559] = {anchored = true},
    [560] = {anchored = true},
    [561] = {anchored = true},
    [562] = {anchored = true},
    [563] = {anchored = true},
    [564] = {anchored = true},
    [565] = {anchored = true},
    [566] = {anchored = true},
    [567] = {anchored = true},
    [568] = {anchored = true},
    [569] = {anchored = true},
    [570] = {anchored = true},
    [571] = {anchored = true},
    [572] = {anchored = true},
    [573] = {anchored = true},
    [574] = {anchored = true},
    [575] = {anchored = true},
    [576] = {anchored = true},
    [577] = {anchored = true},
    [578] = {anchored = true},
    [579] = {anchored = true},
    [580] = {anchored = true},
    [581] = {anchored = true},
    [582] = {anchored = true},
    [583] = {anchored = true},
    [584] = {anchored = true},
    [585] = {anchored = true},
    [586] = {anchored = true},
    [587] = {anchored = true},
    [588] = {anchored = true},
    [589] = {anchored = true},
    [590] = {anchored = true},
    [591] = {anchored = true},
    [592] = {anchored = true},
    [593] = {anchored = true},
    [594] = {anchored = true},
    [595] = {anchored = true},
    [596] = {anchored = true},
    [597] = {anchored = true},
    [598] = {anchored = true},
    [599] = {anchored = true},
    [600] = {anchored = true},
    [601] = {anchored = true},
    [602] = {anchored = true},
    [603] = {anchored = true},
    [604] = {anchored = true},
    [605] = {anchored = true},
    [606] = {anchored = true},
    [607] = {anchored = true},
    [608] = {anchored = true},
    [609] = {anchored = true},
    [610] = {anchored = true},
    [611] = {anchored = true},
    [612] = {anchored = true},
    [613] = {anchored = true},
    [614] = {anchored = true},
    [615] = {anchored = true},
    [616] = {anchored = true},
    [617] = {anchored = true},
    [618] = {anchored = true},
    [619] = {anchored = true},
    [620] = {anchored = true},
    [621] = {anchored = true},
    [622] = {anchored = true},
    [623] = {anchored = true},
    [624] = {anchored = true},
    [625] = {anchored = true},
    [626] = {anchored = true},
    [627] = {anchored = true},
    [628] = {anchored = true},
    [629] = {anchored = true},
    [630] = {anchored = true},
    [633] = {anchored = true},
    [634] = {anchored = true},
    [635] = {anchored = true},
    [636] = {anchored = true},
    [637] = {anchored = true},
    [638] = {anchored = true},
    [639] = {anchored = true},
    [640] = {anchored = true},
    [641] = {anchored = true},
    [642] = {anchored = true},
    [643] = {anchored = true},
    [644] = {anchored = true},
    [645] = {anchored = true},
    [646] = {anchored = true},
    [648] = {anchored = true},
    [649] = {anchored = true},
    [650] = {anchored = true},
    [651] = {anchored = true},
    [652] = {anchored = true},
    [653] = {anchored = true},
    [654] = {anchored = true},
    [655] = {anchored = true},
    [656] = {anchored = true},
    [657] = {anchored = true},
    [658] = {anchored = true},
    [659] = {anchored = true},
    [660] = {anchored = true},
    [661] = {anchored = true},
    [662] = {anchored = true},
    [663] = {anchored = true},
    [664] = {anchored = true},
    [665] = {anchored = true},
    [666] = {anchored = true},
    [667] = {anchored = true},
    [668] = {anchored = true},
    [669] = {anchored = true},
    [670] = {anchored = true},
    [671] = {anchored = true},
    [672] = {anchored = true},
    [673] = {anchored = true},
    [674] = {anchored = true},
    [675] = {anchored = true},
    [676] = {anchored = true},
    [677] = {anchored = true},
    [678] = {anchored = true},
    [679] = {anchored = true},
    [680] = {anchored = true},
    [681] = {anchored = true},
    [682] = {anchored = true},
    [683] = {anchored = true},
    [684] = {anchored = true},
    [687] = {anchored = true},
    [694] = {anchored = true},
    [699] = {anchored = true},
    [702] = {anchored = true},
    [704] = {anchored = true},
    [712] = {anchored = true},
    [717] = {anchored = true},
    [720] = {anchored = true},
    [726] = {anchored = true},
    [733] = {anchored = true},
    [737] = {anchored = true},
    [739] = {anchored = true},
    [741] = {anchored = true},
    [744] = {anchored = true},
    [747] = {anchored = true},
    [749] = {anchored = true},
    [751] = {anchored = true},
    [755] = {anchored = true},
    [758] = {anchored = true},
    [761] = {anchored = true},
    [762] = {anchored = true},
    [766] = {anchored = true},
    [771] = {anchored = true},
    [775] = {anchored = true},
    [776] = {anchored = true},
    [777] = {anchored = true},
    [780] = {anchored = true},
    [783] = {anchored = true},
    [792] = {anchored = true},
    [795] = {anchored = true},
    [796] = {anchored = true},
    [801] = {anchored = true},
    [803] = {anchored = true},
    [808] = {anchored = true},
    [811] = {anchored = true},
    [813] = {anchored = true},
    [814] = {anchored = true},
    [815] = {anchored = true},
    [818] = {anchored = true},
    [821] = {anchored = true},
    [823] = {anchored = true},
    [824] = {anchored = true},
    [825] = {anchored = true},
    [826] = {anchored = true},
    [828] = {anchored = true},
    [833] = {anchored = true},
    [836] = {anchored = true},
    [837] = {anchored = true},
    [841] = {anchored = true},
    [843] = {anchored = true},
    [845] = {anchored = true},
    [847] = {anchored = true},
    [850] = {anchored = true},
    [852] = {anchored = true},
    [854] = {anchored = true},
    [857] = {anchored = true},
    [860] = {anchored = true},
    [863] = {anchored = true},
    [864] = {anchored = true},
    [868] = {anchored = true},
    [871] = {anchored = true},
    [874] = {anchored = true},
    [878] = {anchored = true},
    [879] = {anchored = true},
    [881] = {anchored = true},
    [884] = {anchored = true},
    [886] = {anchored = true},
    [888] = {anchored = true},
    [891] = {anchored = true},
    [894] = {anchored = true},
    [895] = {anchored = true},
    [897] = {anchored = true},
    [900] = {anchored = true},
    [904] = {anchored = true},
    [908] = {anchored = true},
    [910] = {anchored = true},
    [912] = {anchored = true},
    [915] = {anchored = true},
    [918] = {anchored = true},
    [922] = {anchored = true},
    [925] = {anchored = true},
    [929] = {anchored = true},
    [930] = {anchored = true},
    [934] = {anchored = true},
    [938] = {anchored = true},
    [940] = {anchored = true},
    [942] = {anchored = true},
    [943] = {anchored = true},
    [945] = {anchored = true},
    [946] = {anchored = true},
    [947] = {anchored = true},
    [949] = {anchored = true},
    [950] = {anchored = true},
    [951] = {anchored = true},
    [954] = {anchored = true},
    [959] = {anchored = true},
    [961] = {anchored = true},
    [963] = {anchored = true},
    [964] = {anchored = true},
    [965] = {anchored = true},
    [968] = {anchored = true},
    [971] = {anchored = true},
    [980] = {anchored = true},
    [983] = {anchored = true},
    [985] = {anchored = true},
    [989] = {anchored = true},
    [991] = {anchored = true},
    [994] = {anchored = true},
    [995] = {anchored = true},
    [996] = {anchored = true},
    [997] = {anchored = true},
    [999] = {anchored = true},
    [1004] = {anchored = true},
    [1005] = {anchored = true},
    [1015] = {anchored = true},
    [1018] = {anchored = true},
    [1021] = {anchored = true},
    [1023] = {anchored = true},
    [1406] = {anchored = true},
    [1118] = {anchored = true},
    [1615] = {anchored = true},
    [1442] = {anchored = true},
    [1388] = {anchored = true},
    [1334] = {anchored = true},
    [1052] = {anchored = true},
    [1420] = {anchored = true},
    [1196] = {anchored = true},
    [1202] = {anchored = true},
    [1061] = {anchored = true},
    [1407] = {anchored = true},
    [1541] = {anchored = true},
    [1188] = {anchored = true},
    [1381] = {anchored = true},
    [1271] = {anchored = true},
    [1378] = {anchored = true},
    [1053] = {anchored = true},
    [1097] = {anchored = true},
    [1351] = {anchored = true},
    [1166] = {anchored = true},
    [1194] = {anchored = true},
    [1571] = {anchored = true},
    [1045] = {anchored = true},
    [1448] = {anchored = true},
    [1224] = {anchored = true},
    [1290] = {anchored = true},
    [1426] = {anchored = true},
    [1613] = {anchored = true},
    [1369] = {anchored = true},
    [1408] = {anchored = true},
    [1127] = {anchored = true},
    [1389] = {anchored = true},
    [1033] = {anchored = true},
    [1169] = {anchored = true},
    [1624] = {anchored = true},
    [1145] = {anchored = true},
    [1413] = {anchored = true},
    [1275] = {anchored = true},
    [1239] = {anchored = true},
    [1339] = {anchored = true},
    [1044] = {anchored = true},
    [1627] = {anchored = true},
    [1581] = {anchored = true},
    [1633] = {anchored = true},
    [1404] = {anchored = true},
    [1479] = {anchored = true},
    [1113] = {anchored = true},
    [1232] = {anchored = true},
    [1089] = {anchored = true},
    [1103] = {anchored = true},
    [1595] = {anchored = true},
    [1392] = {anchored = true},
    [1223] = {anchored = true},
    [1250] = {anchored = true},
    [1618] = {anchored = true},
    [1477] = {anchored = true},
    [1209] = {anchored = true},
    [1056] = {anchored = true},
    [1549] = {anchored = true},
    [1514] = {anchored = true},
    [1480] = {anchored = true},
    [1036] = {anchored = true},
    [1295] = {anchored = true},
    [1428] = {anchored = true},
    [1076] = {anchored = true},
    [1410] = {anchored = true},
    [1280] = {anchored = true},
    [1107] = {anchored = true},
    [1059] = {anchored = true},
    [1139] = {anchored = true},
    [1591] = {anchored = true},
    [1178] = {anchored = true},
    [1327] = {anchored = true},
    [1190] = {anchored = true},
    [1636] = {anchored = true},
    [1472] = {anchored = true},
    [1368] = {anchored = true},
    [1289] = {anchored = true},
    [1158] = {anchored = true},
    [1536] = {anchored = true},
    [1566] = {anchored = true},
    [1206] = {anchored = true},
    [1593] = {anchored = true},
    [1600] = {anchored = true},
    [1487] = {anchored = true},
    [1538] = {anchored = true},
    [1283] = {anchored = true},
    [1469] = {anchored = true},
    [1359] = {anchored = true},
    [1445] = {anchored = true},
    [1182] = {anchored = true},
    [1425] = {anchored = true},
    [1163] = {anchored = true},
    [1612] = {anchored = true},
    [1248] = {anchored = true},
    [1575] = {anchored = true},
    [1205] = {anchored = true},
    [1181] = {anchored = true},
    [1511] = {anchored = true},
    [1092] = {anchored = true},
    [1185] = {anchored = true},
    [1320] = {anchored = true},
    [1233] = {anchored = true},
    [1104] = {anchored = true},
    [1602] = {anchored = true},
    [1414] = {anchored = true},
    [1520] = {anchored = true},
    [1569] = {anchored = true},
    [1137] = {anchored = true},
    [1314] = {anchored = true},
    [1286] = {anchored = true},
    [1152] = {anchored = true},
    [1245] = {anchored = true},
    [1128] = {anchored = true},
    [1146] = {anchored = true},
    [1465] = {anchored = true},
    [1489] = {anchored = true},
    [1399] = {anchored = true},
    [1512] = {anchored = true},
    [1379] = {anchored = true},
    [1496] = {anchored = true},
    [1463] = {anchored = true},
    [1495] = {anchored = true},
    [1304] = {anchored = true},
    [1083] = {anchored = true},
    [1651] = {anchored = true},
    [1649] = {anchored = true},
    [1648] = {anchored = true},
    [1063] = {anchored = true},
    [1635] = {anchored = true},
    [1645] = {anchored = true},
    [1643] = {anchored = true},
    [1364] = {anchored = true},
    [1641] = {anchored = true},
    [1640] = {anchored = true},
    [1558] = {anchored = true},
    [1638] = {anchored = true},
    [1446] = {anchored = true},
    [1494] = {anchored = true},
    [1647] = {anchored = true},
    [1631] = {anchored = true},
    [1236] = {anchored = true},
    [1048] = {anchored = true},
    [1515] = {anchored = true},
    [1242] = {anchored = true},
    [1504] = {anchored = true},
    [1346] = {anchored = true},
    [1632] = {anchored = true},
    [1218] = {anchored = true},
    [1626] = {anchored = true},
    [1630] = {anchored = true},
    [1197] = {anchored = true},
    [1230] = {anchored = true},
    [1151] = {anchored = true},
    [1136] = {anchored = true},
    [1405] = {anchored = true},
    [1220] = {anchored = true},
    [1491] = {anchored = true},
    [1625] = {anchored = true},
    [1623] = {anchored = true},
    [1622] = {anchored = true},
    [1121] = {anchored = true},
    [1621] = {anchored = true},
    [1411] = {anchored = true},
    [1583] = {anchored = true},
    [1553] = {anchored = true},
    [1617] = {anchored = true},
    [1619] = {anchored = true},
    [1278] = {anchored = true},
    [1614] = {anchored = true},
    [1254] = {anchored = true},
    [1259] = {anchored = true},
    [1449] = {anchored = true},
    [1458] = {anchored = true},
    [1453] = {anchored = true},
    [1106] = {anchored = true},
    [1323] = {anchored = true},
    [1082] = {anchored = true},
    [1429] = {anchored = true},
    [1452] = {anchored = true},
    [1505] = {anchored = true},
    [1611] = {anchored = true},
    [1172] = {anchored = true},
    [1608] = {anchored = true},
    [1606] = {anchored = true},
    [1244] = {anchored = true},
    [1409] = {anchored = true},
    [1478] = {anchored = true},
    [1545] = {anchored = true},
    [1599] = {anchored = true},
    [1597] = {anchored = true},
    [1365] = {anchored = true},
    [1043] = {anchored = true},
    [1241] = {anchored = true},
    [1227] = {anchored = true},
    [1589] = {anchored = true},
    [1360] = {anchored = true},
    [1308] = {anchored = true},
    [1217] = {anchored = true},
    [1372] = {anchored = true},
    [1193] = {anchored = true},
    [1578] = {anchored = true},
    [1444] = {anchored = true},
    [1585] = {anchored = true},
    [1403] = {anchored = true},
    [1451] = {anchored = true},
    [1094] = {anchored = true},
    [1573] = {anchored = true},
    [1098] = {anchored = true},
    [1564] = {anchored = true},
    [1208] = {anchored = true},
    [1355] = {anchored = true},
    [1562] = {anchored = true},
    [1560] = {anchored = true},
    [1509] = {anchored = true},
    [1557] = {anchored = true},
    [1432] = {anchored = true},
    [1555] = {anchored = true},
    [1616] = {anchored = true},
    [1551] = {anchored = true},
    [1256] = {anchored = true},
    [1447] = {anchored = true},
    [1402] = {anchored = true},
    [1604] = {anchored = true},
    [1229] = {anchored = true},
    [1125] = {anchored = true},
    [1303] = {anchored = true},
    [1534] = {anchored = true},
    [1533] = {anchored = true},
    [1497] = {anchored = true},
    [1475] = {anchored = true},
    [1031] = {anchored = true},
    [1529] = {anchored = true},
    [1527] = {anchored = true},
    [1349] = {anchored = true},
    [1115] = {anchored = true},
    [1524] = {anchored = true},
    [1085] = {anchored = true},
    [1523] = {anchored = true},
    [1086] = {anchored = true},
    [1522] = {anchored = true},
    [1517] = {anchored = true},
    [1507] = {anchored = true},
    [1634] = {anchored = true},
    [1513] = {anchored = true},
    [1164] = {anchored = true},
    [1490] = {anchored = true},
    [1170] = {anchored = true},
    [1510] = {anchored = true},
    [1503] = {anchored = true},
    [1109] = {anchored = true},
    [1415] = {anchored = true},
    [1377] = {anchored = true},
    [1221] = {anchored = true},
    [1516] = {anchored = true},
    [1506] = {anchored = true},
    [1502] = {anchored = true},
    [1386] = {anchored = true},
    [1390] = {anchored = true},
    [1501] = {anchored = true},
    [1154] = {anchored = true},
    [1500] = {anchored = true},
    [1130] = {anchored = true},
    [1354] = {anchored = true},
    [1361] = {anchored = true},
    [1460] = {anchored = true},
    [1462] = {anchored = true},
    [1266] = {anchored = true},
    [1531] = {anchored = true},
    [1637] = {anchored = true},
    [1380] = {anchored = true},
    [1387] = {anchored = true},
    [1493] = {anchored = true},
    [1382] = {anchored = true},
    [1300] = {anchored = true},
    [1459] = {anchored = true},
    [1488] = {anchored = true},
    [1257] = {anchored = true},
    [1486] = {anchored = true},
    [1485] = {anchored = true},
    [1149] = {anchored = true},
    [1483] = {anchored = true},
    [1260] = {anchored = true},
    [1455] = {anchored = true},
    [1481] = {anchored = true},
    [1143] = {anchored = true},
    [1476] = {anchored = true},
    [1344] = {anchored = true},
    [1110] = {anchored = true},
    [1091] = {anchored = true},
    [1471] = {anchored = true},
    [1470] = {anchored = true},
    [1468] = {anchored = true},
    [1467] = {anchored = true},
    [1313] = {anchored = true},
    [1466] = {anchored = true},
    [1265] = {anchored = true},
    [1148] = {anchored = true},
    [1397] = {anchored = true},
    [1095] = {anchored = true},
    [1464] = {anchored = true},
    [1498] = {anchored = true},
    [1211] = {anchored = true},
    [1461] = {anchored = true},
    [1457] = {anchored = true},
    [1456] = {anchored = true},
    [1311] = {anchored = true},
    [1484] = {anchored = true},
    [1482] = {anchored = true},
    [1277] = {anchored = true},
    [1454] = {anchored = true},
    [1450] = {anchored = true},
    [1142] = {anchored = true},
    [1443] = {anchored = true},
    [1543] = {anchored = true},
    [1235] = {anchored = true},
    [1547] = {anchored = true},
    [1287] = {anchored = true},
    [1079] = {anchored = true},
    [1580] = {anchored = true},
    [1124] = {anchored = true},
    [1441] = {anchored = true},
    [1435] = {anchored = true},
    [1262] = {anchored = true},
    [1134] = {anchored = true},
    [1199] = {anchored = true},
    [1187] = {anchored = true},
    [1176] = {anchored = true},
    [1133] = {anchored = true},
    [1027] = {anchored = true},
    [1100] = {anchored = true},
    [1391] = {anchored = true},
    [1251] = {anchored = true},
    [1412] = {anchored = true},
    [1508] = {anchored = true},
    [1200] = {anchored = true},
    [1366] = {anchored = true},
    [1424] = {anchored = true},
    [1263] = {anchored = true},
    [1253] = {anchored = true},
    [1474] = {anchored = true},
    [1272] = {anchored = true},
    [1175] = {anchored = true},
    [1116] = {anchored = true},
    [1576] = {anchored = true},
    [1101] = {anchored = true},
    [1398] = {anchored = true},
    [1214] = {anchored = true},
    [1157] = {anchored = true},
    [1587] = {anchored = true},
    [1356] = {anchored = true},
    [1161] = {anchored = true},
    [1203] = {anchored = true},
    [1088] = {anchored = true},
    [1384] = {anchored = true},
    [1281] = {anchored = true},
    [1069] = {anchored = true},
    [1383] = {anchored = true},
    [1492] = {anchored = true},
    [1629] = {anchored = true},
    [1131] = {anchored = true},
    [1155] = {anchored = true},
    [1274] = {anchored = true},
    [1226] = {anchored = true},
    [1212] = {anchored = true},
    [1357] = {anchored = true},
    [1385] = {anchored = true},
    [1363] = {anchored = true},
    [1362] = {anchored = true},
    [1049] = {anchored = true},
    [1054] = {anchored = true},
    [1358] = {anchored = true},
    [1119] = {anchored = true},
    [1173] = {anchored = true},
    [1499] = {anchored = true},
    [1284] = {anchored = true},
    [1418] = {anchored = true},
    [1268] = {anchored = true},
    [1122] = {anchored = true},
    [1215] = {anchored = true},
    [1291] = {anchored = true},
    [1191] = {anchored = true},
    [1427] = {anchored = true},
    [1375] = {anchored = true},
    [1317] = {anchored = true},
    [1140] = {anchored = true},
    [1539] = {anchored = true},
    [1299] = {anchored = true},
    [1167] = {anchored = true},
    [1179] = {anchored = true},
    [1184] = {anchored = true},
    [1238] = {anchored = true},
    [1160] = {anchored = true},
    [1269] = {anchored = true},
    [1247] = {anchored = true},
    [1112] = {anchored = true},
}

local partDefs = {

    [6] = {shape="Normal", cframe=CFrame.new(27.08421516418457,25.812053680419922,-59.58957290649414,-1,0,0,0,1,0,0,0,-1)},
    [10] = {shape="Normal", cframe=CFrame.new(28.19084358215332,6.7550506591796875,-91.26872253417969,0.03051445074379444,-0.00012506839993875474,-0.9995343685150146,0.000012321434041950852,1,-0.00012475051335059106,0.9995343685150146,-0.000008507923666911665,0.03051445260643959)},
    [14] = {shape="Normal", cframe=CFrame.new(27.99871826171875,6.230026721954346,-90.99943542480469,-0.0000014361636431203806,-0.00013639328244607896,-1,0.00000833544891065685,1,-0.00013639328244607896,1,-0.000008335645361512434,-0.0000014350267747431644)},
    [16] = {shape="Ball", cframe=CFrame.new(24.49871063232422,6.329533100128174,-93.99944305419922,-0.0000014053590575713315,-0.00009990869875764474,-1,0.000003845821993309073,1,-0.00009990870603360236,1,-0.000003845962510240497,-0.0000014049747960598324)},
    [21] = {shape="Ball", cframe=CFrame.new(31.49871063232422,6.330490589141846,-93.99942779541016,-0.000001323617652815301,-0.00009853148367255926,-1,0.0000047014409574330784,1,-0.00009853149094851688,1,-0.000004701571015175432,-0.0000013231544926384231)},
    [26] = {shape="Ball", cframe=CFrame.new(31.498701095581055,6.330541133880615,-87.99942779541016,0.0000014402500028154464,-0.000105979350337293,1,-0.000011905963219760451,1,0.00010597936488920823,-1,-0.00001190611601487035,0.0000014389881926035741)},
    [31] = {shape="Vehicle Seat", cframe=CFrame.new(26.498580932617188,7.229822158813477,-90.99944305419922,-0.0000014361636431203806,-0.00013639328244607896,-1,0.00000833544891065685,1,-0.00013639328244607896,1,-0.000008335645361512434,-0.0000014350267747431644)},
    [39] = {shape="Ball", cframe=CFrame.new(24.498701095581055,6.329583168029785,-87.99944305419922,0.000001344078327747411,-0.00010710050992202014,1,-0.000012751630492857657,1,0.00010710053174989298,-1,-0.000012751774193020537,0.0000013427126077658613)},
    [46] = {shape="Cylinder", cframe=CFrame.new(25.261735916137695,4.557989120483398,-20.662643432617188,0,-1,0,1,0,-0,0,0,1)},
    [47] = {shape="Cylinder", cframe=CFrame.new(25.161083221435547,7.84033203125,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [48] = {shape="Cylinder", cframe=CFrame.new(25.172691345214844,7.665532112121582,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [49] = {shape="Cylinder", cframe=CFrame.new(24.999393463134766,8.28896713256836,-20.569843292236328,0,-1,0,1,0,-0,0,0,1)},
    [50] = {shape="Cylinder", cframe=CFrame.new(24.999191284179688,8.300564765930176,-20.569843292236328,0,-1,0,1,0,-0,0,0,1)},
    [51] = {shape="Cylinder", cframe=CFrame.new(25,8.25417423248291,-20.569843292236328,0,-1,0,1,0,-0,0,0,1)},
    [52] = {shape="Cylinder", cframe=CFrame.new(25.143310546875,6.321067810058594,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [53] = {shape="Cylinder", cframe=CFrame.new(25.131725311279297,4.811938762664795,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [54] = {shape="Cylinder", cframe=CFrame.new(25.16621208190918,8.036654472351074,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [55] = {shape="Cylinder", cframe=CFrame.new(25.169450759887695,7.851093292236328,-20.639446258544922,0,-1,0,1,0,-0,0,0,1)},
    [57] = {shape="Normal", cframe=CFrame.new(25.032625198364258,6.198428153991699,-16.96401596069336,0.999847948551178,-0.01743638701736927,0,0.01743638701736927,0.999847948551178,0,0,0,1)},
    [58] = {shape="Cylinder", cframe=CFrame.new(23.986087799072266,5.267295837402344,-15.777435302734375,0.2777884006500244,0.6198206543922424,-0.733931839466095,0.9488317370414734,-0.2964627742767334,0.10875776410102844,-0.15017306804656982,-0.7265894412994385,-0.670459508895874)},
    [59] = {shape="Cylinder", cframe=CFrame.new(25.174575805664062,5.554605484008789,-15.863842010498047,-0.9500465393066406,0.1875259131193161,-0.24949128925800323,0.31096336245536804,0.5003052949905396,-0.8080819249153137,-0.02671445906162262,-0.8452979922294617,-0.5336271524429321)},
    [60] = {shape="Cylinder", cframe=CFrame.new(23.980737686157227,5.267202377319336,-23.141979217529297,0.2724289298057556,0.5940757989883423,-0.7568727731704712,0.9487277269363403,-0.2969132661819458,0.10843551158905029,-0.1603066623210907,-0.7476071715354919,-0.6445039510726929)},
    [61] = {shape="Cylinder", cframe=CFrame.new(23.938901901245117,5.312876224517822,-17.86962127685547,0.232918381690979,0.9091469645500183,0.3452546298503876,0.9480648636817932,-0.29135286808013916,0.12761840224266052,0.21661481261253357,0.2975991368293762,-0.9297916889190674)},
    [62] = {shape="Normal", cframe=CFrame.new(25.02361297607422,7.590508937835693,-25.549591064453125,-0.9998476505279541,4.0140002965927124e-07,-0.017456453293561935,-0.017456453293561935,-0.00004601478576660156,0.9998476505279541,-4.0140002965927124e-07,1,0.00004589557647705078)},
    [63] = {shape="Seat", cframe=CFrame.new(25.03838539123535,6.256534099578857,-16.48607635498047,0.999847948551178,-0.01743638701736927,0,0.01743638701736927,0.999847948551178,0,0,0,1)},
    [64] = {shape="Normal", cframe=CFrame.new(25.047908782958984,6.198694705963135,-24.03598403930664,-0.9998483657836914,-0.01743638701736927,0,-0.01743638701736927,0.999847948551178,0,-0,0,-1.0000004768371582)},
    [65] = {shape="Cylinder", cframe=CFrame.new(26.17813491821289,5.351962089538574,-15.816539764404297,-0.2658647298812866,-0.8984160423278809,-0.34952065348625183,0.9393452405929565,-0.3229261636734009,0.1155390739440918,-0.21667149662971497,-0.2976028025150299,0.9297773838043213)},
    [66] = {shape="Normal", cframe=CFrame.new(25.043251037597656,6.4655442237854,-25.50900650024414,-0.9998468160629272,-0.007393769919872284,-0.01586596667766571,-0.017504191026091576,0.42257678508758545,0.9061580896377563,0.000004664994776248932,0.906296968460083,-0.4226415157318115)},
    [67] = {shape="Normal", cframe=CFrame.new(25.027965545654297,6.465277194976807,-15.490991592407227,0.9998468160629272,-0.007393769919872284,-0.01586596667766571,0.017504191026091576,0.42257678508758545,0.9061580896377563,0.000004664994776248932,-0.906296968460083,0.42264145612716675)},
    [68] = {shape="Cylinder", cframe=CFrame.new(26.126304626464844,5.304653167724609,-25.222564697265625,-0.3107661008834839,-0.6090695261955261,0.7296978235244751,0.9385544657707214,-0.317901611328125,0.13436612486839294,0.15013375878334045,0.7266174554824829,0.6704378128051758)},
    [69] = {shape="Normal", cframe=CFrame.new(25.047527313232422,6.220487117767334,-25.178695678710938,-0.9998472929000854,-0.016957838088274002,-0.004255961626768112,-0.017483726143836975,0.97015780210495,0.2418433278799057,0.000027815112844109535,0.24188075959682465,-0.9703061580657959)},
    [70] = {shape="Normal", cframe=CFrame.new(25.008331298828125,7.590242385864258,-15.450407028198242,0.9998476505279541,4.0140002965927124e-07,-0.017456453293561935,0.017456453293561935,-0.00004601478576660156,0.9998476505279541,-4.0140002965927124e-07,-1,-0.00004601478576660156)},
    [71] = {shape="Normal", cframe=CFrame.new(25.045679092407227,6.32637357711792,-25.40460968017578,-0.9998481273651123,-0.013134629465639591,-0.011454085819423199,-0.017427388578653336,0.7545750737190247,0.655982255935669,0.000026883557438850403,0.656082272529602,-0.7546893358230591)},
    [72] = {shape="Seat", cframe=CFrame.new(25.03838539123535,6.256534099578857,-24.501216888427734,-0.9998483657836914,-0.01743638701736927,0,-0.01743638701736927,0.999847948551178,0,-0,0,-1.0000004768371582)},
    [73] = {shape="Cylinder", cframe=CFrame.new(23.932636260986328,5.312767028808594,-25.183456420898438,0.232918381690979,0.9091469645500183,0.3452546298503876,0.9480648636817932,-0.29135286808013916,0.12761840224266052,0.21661481261253357,0.2975991368293762,-0.9297916889190674)},
    [74] = {shape="Cylinder", cframe=CFrame.new(25.00646209716797,5.549460411071777,-15.867664337158203,0.950176477432251,0.11895453184843063,-0.2881222665309906,0.30595847964286804,-0.5326883792877197,0.7890710234642029,-0.05961572378873825,-0.8379102349281311,-0.5425431728363037)},
    [75] = {shape="Normal", cframe=CFrame.new(25.032245635986328,6.220220565795898,-15.821300506591797,0.9998471736907959,-0.016957838088274002,-0.004255961626768112,0.017483726143836975,0.97015780210495,0.2418433278799057,0.000027815112844109535,-0.24188075959682465,0.9703059792518616)},
    [76] = {shape="Cylinder", cframe=CFrame.new(25.09670639038086,5.551035404205322,-25.132335662841797,-0.9602663516998291,-0.10027606040239334,0.2604480981826782,0.27263742685317993,-0.5364944934844971,0.7986504435539246,0.059643469750881195,0.8379250168800354,0.5425166487693787)},
    [77] = {shape="Cylinder", cframe=CFrame.new(24.92851448059082,5.550310134887695,-25.136157989501953,0.9386390447616577,-0.20483452081680298,0.27748799324035645,0.3438660502433777,0.4934958815574646,-0.7988854646682739,0.026700153946876526,0.8452837467193604,0.5336501002311707)},
    [78] = {shape="Cylinder", cframe=CFrame.new(26.171871185302734,5.351852893829346,-23.13037872314453,-0.2658647298812866,-0.8984160423278809,-0.34952065348625183,0.9393452405929565,-0.3229261636734009,0.1155390739440918,-0.21667149662971497,-0.2976028025150299,0.9297773838043213)},
    [79] = {shape="Cylinder", cframe=CFrame.new(26.131654739379883,5.304746627807617,-17.858016967773438,-0.305295467376709,-0.5833840370178223,0.7526342868804932,0.9386630058288574,-0.3174399137496948,0.1347002387046814,0.16033399105072021,0.7475931644439697,0.6445134878158569)},
    [80] = {shape="Normal", cframe=CFrame.new(25.0303955078125,6.326106548309326,-15.595390319824219,0.9998481273651123,-0.013134629465639591,-0.011454085819423199,0.017427388578653336,0.7545750737190247,0.655982255935669,0.000026883557438850403,-0.656082272529602,0.7546893954277039)},
    [81] = {shape="Normal", cframe=CFrame.new(39.12848663330078,23.20249366760254,-44.81160354614258,-0.08715617656707764,-0.3406992554664612,0.936123788356781,-0.000010535120964050293,0.9397000074386597,0.3419998288154602,-0.9961946606636047,0.029797539114952087,-0.08190417289733887)},
    [84] = {shape="Normal", cframe=CFrame.new(109.468994140625,4.339809417724609,-69.52264404296875,1,0,0,0,1,0,0,0,1)},
    [88] = {shape="Normal", cframe=CFrame.new(-59.531005859375,10.83980941772461,-61.52264404296875,1,0,0,0,1,0,0,0,1)},
    [89] = {shape="Normal", cframe=CFrame.new(8.468994140625,3.8398094177246094,-66.52264404296875,1,0,0,0,1,0,0,0,1)},
    [92] = {shape="Normal", cframe=CFrame.new(109.468994140625,4.339809417724609,-62.52264404296875,1,0,0,0,1,0,0,0,1)},
    [93] = {shape="Normal", cframe=CFrame.new(28.968994140625,4.339809417724609,-57.52264404296875,1,0,0,0,1,0,0,0,1)},
    [97] = {shape="Normal", cframe=CFrame.new(4.468994140625,34.93981170654297,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [98] = {shape="Normal", cframe=CFrame.new(4.468994140625,27.739822387695312,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [99] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-16.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [100] = {shape="Normal", cframe=CFrame.new(-40.531005859375,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [101] = {shape="Normal", cframe=CFrame.new(-41.031005859375,16.33980941772461,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [102] = {shape="Normal", cframe=CFrame.new(-10.531005859375,32.53981399536133,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [103] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-45.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [104] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-25.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [105] = {shape="Normal", cframe=CFrame.new(1.968994140625,18.73979949951172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [107] = {shape="Normal", cframe=CFrame.new(-30.031005859375,17.53980255126953,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [108] = {shape="Normal", cframe=CFrame.new(-36.031005859375,17.53980255126953,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [109] = {shape="Normal", cframe=CFrame.new(-37.031005859375,17.53980255126953,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [110] = {shape="Normal", cframe=CFrame.new(-37.031005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [111] = {shape="Normal", cframe=CFrame.new(-31.031005859375,17.53980255126953,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [112] = {shape="Normal", cframe=CFrame.new(-33.531005859375,19.339813232421875,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [113] = {shape="Normal", cframe=CFrame.new(-30.531005859375,19.339813232421875,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [114] = {shape="Normal", cframe=CFrame.new(-33.531005859375,10.939815521240234,5.477325439453125,-1,0,0,0,1,0,0,0,-1)},
    [115] = {shape="Normal", cframe=CFrame.new(-36.531005859375,19.339813232421875,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [116] = {shape="Normal", cframe=CFrame.new(-30.031005859375,13.939800262451172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [117] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-15.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [118] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-21.022674560546875,0,0,1,0,1,-0,-1,0,0)},
    [119] = {shape="Normal", cframe=CFrame.new(-22.531005859375,4.939807891845703,-22.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [123] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [125] = {shape="Normal", cframe=CFrame.new(-5.531005859375,42.739830017089844,-3.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [126] = {shape="Normal", cframe=CFrame.new(-7.531005859375,37.93981170654297,-7.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [127] = {shape="Normal", cframe=CFrame.new(-5.531005859375,47.53981018066406,-3.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [128] = {shape="Normal", cframe=CFrame.new(-3.531005859375,40.339813232421875,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [129] = {shape="Normal", cframe=CFrame.new(-3.531005859375,45.139808654785156,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [130] = {shape="Normal", cframe=CFrame.new(-5.531005859375,40.339813232421875,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [131] = {shape="Normal", cframe=CFrame.new(-7.531005859375,42.739830017089844,-7.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [132] = {shape="Normal", cframe=CFrame.new(-4.531005859375,35.53981018066406,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [133] = {shape="Normal", cframe=CFrame.new(-3.531005859375,49.339805603027344,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [134] = {shape="Normal", cframe=CFrame.new(-5.531005859375,37.93981170654297,-3.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [135] = {shape="Normal", cframe=CFrame.new(-1.531005859375,33.73981475830078,-5.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [136] = {shape="Normal", cframe=CFrame.new(-3.531005859375,42.739830017089844,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [137] = {shape="Normal", cframe=CFrame.new(-1.531005859375,40.339813232421875,-7.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [138] = {shape="Normal", cframe=CFrame.new(-1.531005859375,35.53981018066406,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [139] = {shape="Normal", cframe=CFrame.new(-7.531005859375,49.339805603027344,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [140] = {shape="Normal", cframe=CFrame.new(-3.531005859375,33.139808654785156,-3.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [141] = {shape="Normal", cframe=CFrame.new(-7.531005859375,33.139808654785156,-3.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [142] = {shape="Normal", cframe=CFrame.new(-7.531005859375,35.53981018066406,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [143] = {shape="Normal", cframe=CFrame.new(-7.531005859375,45.139808654785156,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [144] = {shape="Normal", cframe=CFrame.new(-7.531005859375,33.73981475830078,-5.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [145] = {shape="Normal", cframe=CFrame.new(-1.531005859375,37.93981170654297,-5.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [146] = {shape="Normal", cframe=CFrame.new(-4.531005859375,36.139808654785156,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [147] = {shape="Normal", cframe=CFrame.new(-1.531005859375,47.53981018066406,-5.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [148] = {shape="Normal", cframe=CFrame.new(-7.531005859375,40.339813232421875,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [149] = {shape="Normal", cframe=CFrame.new(-3.531005859375,47.53981018066406,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [150] = {shape="Normal", cframe=CFrame.new(-5.531005859375,45.139808654785156,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [151] = {shape="Normal", cframe=CFrame.new(-3.531005859375,37.93981170654297,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [152] = {shape="Normal", cframe=CFrame.new(-1.531005859375,49.339805603027344,-7.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [153] = {shape="Normal", cframe=CFrame.new(-1.531005859375,45.139808654785156,-7.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [154] = {shape="Normal", cframe=CFrame.new(-5.531005859375,49.339805603027344,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [155] = {shape="Normal", cframe=CFrame.new(-7.531005859375,47.53981018066406,-7.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [156] = {shape="Normal", cframe=CFrame.new(-1.531005859375,42.739830017089844,-5.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [157] = {shape="Normal", cframe=CFrame.new(-34.531005859375,42.139808654785156,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [158] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,2.477325439453125,0,0,1,0,1,-0,-1,0,0)},
    [159] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [161] = {shape="Normal", cframe=CFrame.new(-15.031005859375,17.53980255126953,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [162] = {shape="Normal", cframe=CFrame.new(-9.031005859375,17.53980255126953,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [163] = {shape="Normal", cframe=CFrame.new(-8.031005859375,17.53980255126953,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [164] = {shape="Normal", cframe=CFrame.new(-8.031005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [165] = {shape="Normal", cframe=CFrame.new(-14.031005859375,17.53980255126953,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [166] = {shape="Normal", cframe=CFrame.new(-11.531005859375,19.339813232421875,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [167] = {shape="Normal", cframe=CFrame.new(-14.531005859375,19.339813232421875,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [168] = {shape="Normal", cframe=CFrame.new(-11.531005859375,10.939815521240234,-49.52265930175781,1,0,0,0,1,0,0,0,1)},
    [169] = {shape="Normal", cframe=CFrame.new(-8.531005859375,19.339813232421875,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [170] = {shape="Normal", cframe=CFrame.new(-15.031005859375,13.939800262451172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [171] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-47.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [172] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [173] = {shape="Normal", cframe=CFrame.new(4.468994140625,32.53981399536133,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [174] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-17.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [175] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [176] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.539810180664062,-35.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [177] = {shape="Normal", cframe=CFrame.new(-9.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [178] = {shape="Normal", cframe=CFrame.new(-34.531005859375,37.339813232421875,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [179] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-21.522674560546875,0,0,-1,0,1,0,1,0,0)},
    [180] = {shape="Normal", cframe=CFrame.new(-16.531005859375,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [181] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,2.977325439453125,0,0,-1,0,1,0,1,0,0)},
    [182] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-40.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [183] = {shape="Normal", cframe=CFrame.new(-34.531005859375,34.93981170654297,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [184] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-15.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [185] = {shape="Normal", cframe=CFrame.new(-21.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [186] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-47.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [187] = {shape="Normal", cframe=CFrame.new(1.968994140625,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [188] = {shape="Normal", cframe=CFrame.new(4.468994140625,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [189] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.33981704711914,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [190] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-21.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [191] = {shape="Normal", cframe=CFrame.new(-17.531005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [192] = {shape="Normal", cframe=CFrame.new(-49.531005859375,35.53981018066406,-19.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [193] = {shape="Normal", cframe=CFrame.new(-45.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [194] = {shape="Normal", cframe=CFrame.new(-46.531005859375,25.33981704711914,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [195] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-37.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [196] = {shape="Normal", cframe=CFrame.new(-40.531005859375,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [197] = {shape="Normal", cframe=CFrame.new(-39.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [198] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.739822387695312,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [199] = {shape="Normal", cframe=CFrame.new(12.468994140625,4.939807891845703,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [201] = {shape="Normal", cframe=CFrame.new(-29.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [202] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-3.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [203] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-3.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [204] = {shape="Normal", cframe=CFrame.new(4.468994140625,12.13980484008789,-29.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [205] = {shape="Normal", cframe=CFrame.new(-34.531005859375,30.139812469482422,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [206] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-7.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [207] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-3.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [208] = {shape="Normal", cframe=CFrame.new(-23.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [209] = {shape="Normal", cframe=CFrame.new(-22.531005859375,34.93981170654297,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [210] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-17.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [211] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-45.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [212] = {shape="Normal", cframe=CFrame.new(-22.531005859375,32.53981399536133,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [213] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.139812469482422,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [214] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.139812469482422,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [215] = {shape="Normal", cframe=CFrame.new(-46.531005859375,39.739830017089844,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [216] = {shape="Normal", cframe=CFrame.new(-34.531005859375,32.53981399536133,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [217] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-4.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [218] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-36.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [219] = {shape="Normal", cframe=CFrame.new(-46.531005859375,39.739830017089844,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [220] = {shape="Normal", cframe=CFrame.new(-28.531005859375,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [221] = {shape="Normal", cframe=CFrame.new(-10.531005859375,39.739830017089844,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [222] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-26.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [223] = {shape="Normal", cframe=CFrame.new(-49.531005859375,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [224] = {shape="Normal", cframe=CFrame.new(-27.031005859375,16.33980941772461,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [225] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.739822387695312,-27.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [226] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-7.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [227] = {shape="Normal", cframe=CFrame.new(-49.53106689453125,23.539813995361328,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [230] = {shape="Normal", cframe=CFrame.new(-40.531005859375,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [231] = {shape="Normal", cframe=CFrame.new(-28.531005859375,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [232] = {shape="Normal", cframe=CFrame.new(-9.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [233] = {shape="Normal", cframe=CFrame.new(-35.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [234] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-27.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [235] = {shape="Normal", cframe=CFrame.new(-17.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [236] = {shape="Normal", cframe=CFrame.new(1.468994140625,27.739822387695312,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [237] = {shape="Normal", cframe=CFrame.new(-49.531005859375,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [238] = {shape="Normal", cframe=CFrame.new(-27.531005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [239] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [240] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [241] = {shape="Normal", cframe=CFrame.new(-10.531005859375,37.339813232421875,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [242] = {shape="Normal", cframe=CFrame.new(-10.531005859375,37.339813232421875,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [243] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-3.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [244] = {shape="Normal", cframe=CFrame.new(-17.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [245] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.739822387695312,-21.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [246] = {shape="Normal", cframe=CFrame.new(-46.031005859375,16.33980941772461,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [247] = {shape="Normal", cframe=CFrame.new(-16.531005859375,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [248] = {shape="Normal", cframe=CFrame.new(0.468994140625,18.73979949951172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [249] = {shape="Normal", cframe=CFrame.new(-4.531005859375,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [250] = {shape="Normal", cframe=CFrame.new(1.468994140625,42.139808654785156,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [251] = {shape="Normal", cframe=CFrame.new(-4.531005859375,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [252] = {shape="Normal", cframe=CFrame.new(-16.531005859375,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [253] = {shape="Normal", cframe=CFrame.new(-40.531005859375,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [254] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.739822387695312,-10.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [255] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-40.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [256] = {shape="Normal", cframe=CFrame.new(-47.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [257] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-9.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [258] = {shape="Normal", cframe=CFrame.new(1.468994140625,30.139812469482422,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [259] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-45.52265930175781,0,0,1,0,1,-0,-1,0,0)},
    [260] = {shape="Normal", cframe=CFrame.new(10.468994140625,5.542430877685547,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [262] = {shape="Normal", cframe=CFrame.new(-49.531005859375,37.339813232421875,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [263] = {shape="Normal", cframe=CFrame.new(-49.531005859375,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [264] = {shape="Normal", cframe=CFrame.new(-46.531005859375,32.53981399536133,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [265] = {shape="Normal", cframe=CFrame.new(-22.531005859375,27.739822387695312,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [266] = {shape="Normal", cframe=CFrame.new(-34.531005859375,34.93981170654297,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [267] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-41.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [268] = {shape="Normal", cframe=CFrame.new(-27.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [269] = {shape="Normal", cframe=CFrame.new(-27.031005859375,11.539806365966797,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [270] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.739822387695312,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [271] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [272] = {shape="Normal", cframe=CFrame.new(-10.531005859375,34.93981170654297,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [273] = {shape="Normal", cframe=CFrame.new(-10.531005859375,39.739830017089844,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [274] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-9.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [275] = {shape="Normal", cframe=CFrame.new(1.468994140625,30.139812469482422,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [276] = {shape="Normal", cframe=CFrame.new(2.468994140625,11.539806365966797,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [277] = {shape="Normal", cframe=CFrame.new(4.468994140625,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [278] = {shape="Normal", cframe=CFrame.new(-33.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [279] = {shape="Normal", cframe=CFrame.new(-46.531005859375,37.339813232421875,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [280] = {shape="Normal", cframe=CFrame.new(-16.531005859375,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [281] = {shape="Normal", cframe=CFrame.new(-4.031005859375,11.539806365966797,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [282] = {shape="Normal", cframe=CFrame.new(-49.531005859375,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [283] = {shape="Normal", cframe=CFrame.new(-10.531005859375,34.93981170654297,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [284] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-40.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [285] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,2.977325439453125,0,0,-1,0,1,0,1,0,0)},
    [286] = {shape="Normal", cframe=CFrame.new(4.468994140625,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [288] = {shape="Normal", cframe=CFrame.new(-37.031005859375,17.53980255126953,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [289] = {shape="Normal", cframe=CFrame.new(-31.031005859375,17.53980255126953,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [290] = {shape="Normal", cframe=CFrame.new(-30.031005859375,17.53980255126953,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [291] = {shape="Normal", cframe=CFrame.new(-33.531005859375,19.339813232421875,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [292] = {shape="Normal", cframe=CFrame.new(-30.531005859375,19.339813232421875,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [293] = {shape="Normal", cframe=CFrame.new(-36.031005859375,17.53980255126953,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [294] = {shape="Normal", cframe=CFrame.new(-33.531005859375,10.939815521240234,-49.52265930175781,1,0,0,0,1,0,0,0,1)},
    [295] = {shape="Normal", cframe=CFrame.new(-36.531005859375,19.339813232421875,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [296] = {shape="Normal", cframe=CFrame.new(-30.031005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [297] = {shape="Normal", cframe=CFrame.new(-37.031005859375,13.939800262451172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [298] = {shape="Normal", cframe=CFrame.new(4.468994140625,32.53981399536133,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [299] = {shape="Normal", cframe=CFrame.new(-16.531005859375,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [300] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [301] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-39.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [302] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [304] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-7.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [305] = {shape="Normal", cframe=CFrame.new(-50.031005859375,10.939815521240234,-11.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [306] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-8.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [307] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-14.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [308] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-14.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [309] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-11.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [310] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-13.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [311] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-8.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [312] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-14.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [313] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-7.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [314] = {shape="Normal", cframe=CFrame.new(-46.531005859375,34.93981170654297,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [315] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-19.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [316] = {shape="Normal", cframe=CFrame.new(4.468994140625,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [317] = {shape="Normal", cframe=CFrame.new(4.468994140625,27.739822387695312,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [318] = {shape="Normal", cframe=CFrame.new(-21.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [319] = {shape="Normal", cframe=CFrame.new(-22.531005859375,34.93981170654297,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [320] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-37.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [321] = {shape="Normal", cframe=CFrame.new(1.468994140625,25.33981704711914,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [322] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-5.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [323] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,0.977325439453125,0,0,1,0,1,-0,-1,0,0)},
    [324] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-4.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [325] = {shape="Normal", cframe=CFrame.new(-34.531005859375,39.739830017089844,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [326] = {shape="Normal", cframe=CFrame.new(-22.531005859375,39.739830017089844,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [327] = {shape="Normal", cframe=CFrame.new(-22.531005859375,37.339813232421875,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [328] = {shape="Normal", cframe=CFrame.new(-22.031005859375,11.539806365966797,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [329] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-21.522674560546875,0,0,-1,0,1,0,1,0,0)},
    [330] = {shape="Normal", cframe=CFrame.new(-49.531005859375,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [331] = {shape="Normal", cframe=CFrame.new(-40.531005859375,11.539806365966797,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [332] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-22.522674560546875,0,0,1,0,1,-0,-1,0,0)},
    [333] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,0.977325439453125,0,0,1,0,1,-0,-1,0,0)},
    [334] = {shape="Normal", cframe=CFrame.new(-22.031005859375,18.73979949951172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [335] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-13.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [336] = {shape="Normal", cframe=CFrame.new(-34.531005859375,27.739822387695312,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [337] = {shape="Normal", cframe=CFrame.new(2.468994140625,9.13980484008789,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [338] = {shape="Normal", cframe=CFrame.new(4.468994140625,35.53981018066406,-25.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [339] = {shape="Normal", cframe=CFrame.new(-10.531005859375,25.33981704711914,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [340] = {shape="Normal", cframe=CFrame.new(1.468994140625,25.33981704711914,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [341] = {shape="Normal", cframe=CFrame.new(-39.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [342] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-9.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [343] = {shape="Normal", cframe=CFrame.new(-22.531005859375,30.139812469482422,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [344] = {shape="Normal", cframe=CFrame.new(-40.531005859375,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [345] = {shape="Normal", cframe=CFrame.new(-22.531005859375,6.739803314208984,-22.022674560546875,0,0,1,0,1,-0,-1,0,0)},
    [346] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-15.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [347] = {shape="Normal", cframe=CFrame.new(-23.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [348] = {shape="Normal", cframe=CFrame.new(-4.531005859375,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [349] = {shape="Normal", cframe=CFrame.new(-29.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [350] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-31.022659301757812,0,0,-1,0,1,0,1,0,0)},
    [351] = {shape="Normal", cframe=CFrame.new(-34.531005859375,25.33981704711914,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [352] = {shape="Normal", cframe=CFrame.new(2.468994140625,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [353] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-40.52265930175781,0,0,1,0,1,-0,-1,0,0)},
    [354] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-17.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [355] = {shape="Normal", cframe=CFrame.new(-11.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [356] = {shape="Normal", cframe=CFrame.new(-4.531005859375,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [357] = {shape="Normal", cframe=CFrame.new(-41.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [358] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-40.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [359] = {shape="Normal", cframe=CFrame.new(-34.531005859375,25.33981704711914,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [360] = {shape="Normal", cframe=CFrame.new(-28.531005859375,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [361] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-21.522674560546875,0,0,-1,0,1,0,1,0,0)},
    [362] = {shape="Normal", cframe=CFrame.new(-4.531005859375,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [363] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-13.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [364] = {shape="Normal", cframe=CFrame.new(-4.531005859375,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [365] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-39.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [366] = {shape="Normal", cframe=CFrame.new(-4.531005859375,11.539806365966797,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [367] = {shape="Normal", cframe=CFrame.new(-10.531005859375,30.139812469482422,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [368] = {shape="Normal", cframe=CFrame.new(-47.031005859375,18.73979949951172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [369] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-26.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [370] = {shape="Normal", cframe=CFrame.new(-49.531005859375,34.93981170654297,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [371] = {shape="Normal", cframe=CFrame.new(-4.531005859375,18.73979949951172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [373] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.53980255126953,-14.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [374] = {shape="Normal", cframe=CFrame.new(4.968994140625,10.939815521240234,-11.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [375] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.53980255126953,-13.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [376] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-7.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [377] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-8.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [378] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-11.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [379] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.53980255126953,-8.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [380] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.53980255126953,-7.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [381] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-14.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [382] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-14.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [383] = {shape="Normal", cframe=CFrame.new(-22.531005859375,30.139812469482422,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [384] = {shape="Normal", cframe=CFrame.new(-40.531005859375,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [385] = {shape="Normal", cframe=CFrame.new(-22.007568359375,38.54081726074219,-22.138168334960938,0,0,1,0,1,-0,-1,0,0)},
    [388] = {shape="Normal", cframe=CFrame.new(-34.531005859375,37.339813232421875,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [389] = {shape="Normal", cframe=CFrame.new(-40.531005859375,18.73979949951172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [390] = {shape="Normal", cframe=CFrame.new(-41.031005859375,11.539806365966797,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [391] = {shape="Normal", cframe=CFrame.new(-4.531005859375,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [392] = {shape="Normal", cframe=CFrame.new(-16.531005859375,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [393] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.33981704711914,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [394] = {shape="Normal", cframe=CFrame.new(4.468994140625,37.93981170654297,-22.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [395] = {shape="Normal", cframe=CFrame.new(-41.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [396] = {shape="Normal", cframe=CFrame.new(1.468994140625,32.53981399536133,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [397] = {shape="Normal", cframe=CFrame.new(-17.531005859375,11.539806365966797,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [398] = {shape="Normal", cframe=CFrame.new(-16.531005859375,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [399] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.739822387695312,-27.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [400] = {shape="Normal", cframe=CFrame.new(-34.531005859375,30.139812469482422,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [401] = {shape="Normal", cframe=CFrame.new(4.468994140625,33.139808654785156,-16.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [402] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-9.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [403] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.539810180664062,-29.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [404] = {shape="Normal", cframe=CFrame.new(-49.531005859375,33.139808654785156,-23.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [405] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [406] = {shape="Normal", cframe=CFrame.new(-22.531005859375,42.139808654785156,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [407] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-17.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [408] = {shape="Normal", cframe=CFrame.new(-27.031005859375,18.73979949951172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [409] = {shape="Normal", cframe=CFrame.new(-46.531005859375,27.739822387695312,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [410] = {shape="Normal", cframe=CFrame.new(-33.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [411] = {shape="Normal", cframe=CFrame.new(-47.531005859375,9.13980484008789,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [412] = {shape="Normal", cframe=CFrame.new(-28.531005859375,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [413] = {shape="Normal", cframe=CFrame.new(-49.531005859375,32.53981399536133,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [414] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-29.022659301757812,0,0,1,0,1,-0,-1,0,0)},
    [415] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-23.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [416] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.739822387695312,-21.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [417] = {shape="Normal", cframe=CFrame.new(-49.531005859375,37.93981170654297,-22.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [418] = {shape="Normal", cframe=CFrame.new(-28.531005859375,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [419] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-3.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [420] = {shape="Normal", cframe=CFrame.new(-4.531005859375,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [421] = {shape="Normal", cframe=CFrame.new(0.468994140625,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [422] = {shape="Normal", cframe=CFrame.new(-29.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [423] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-4.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [424] = {shape="Normal", cframe=CFrame.new(-4.531005859375,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [425] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-39.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [426] = {shape="Normal", cframe=CFrame.new(4.468994140625,35.53981018066406,-19.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [427] = {shape="Normal", cframe=CFrame.new(-39.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [428] = {shape="Normal", cframe=CFrame.new(-35.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [429] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-21.522674560546875,0,0,-1,0,1,0,1,0,0)},
    [430] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-47.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [431] = {shape="Normal", cframe=CFrame.new(-46.531005859375,25.33981704711914,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [432] = {shape="Normal", cframe=CFrame.new(-47.031005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [433] = {shape="Normal", cframe=CFrame.new(-4.531005859375,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [434] = {shape="Normal", cframe=CFrame.new(-4.531005859375,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [435] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-17.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [436] = {shape="Normal", cframe=CFrame.new(-49.531005859375,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [437] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-30.022659301757812,0,0,1,0,1,-0,-1,0,0)},
    [438] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.33981704711914,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [439] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-28.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [440] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-39.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [441] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-46.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [442] = {shape="Normal", cframe=CFrame.new(-34.531005859375,39.739830017089844,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [443] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [444] = {shape="Normal", cframe=CFrame.new(-16.531005859375,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [445] = {shape="Normal", cframe=CFrame.new(-16.531005859375,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [446] = {shape="Normal", cframe=CFrame.new(1.468994140625,39.739830017089844,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [447] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [448] = {shape="Normal", cframe=CFrame.new(-49.531005859375,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [449] = {shape="Normal", cframe=CFrame.new(-16.531005859375,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [450] = {shape="Normal", cframe=CFrame.new(-9.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [451] = {shape="Normal", cframe=CFrame.new(4.468994140625,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [452] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-25.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [453] = {shape="Normal", cframe=CFrame.new(-46.531005859375,34.93981170654297,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [454] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-21.022674560546875,0,0,1,0,1,-0,-1,0,0)},
    [455] = {shape="Normal", cframe=CFrame.new(0.468994140625,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [456] = {shape="Normal", cframe=CFrame.new(-28.531005859375,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [457] = {shape="Normal", cframe=CFrame.new(4.468994140625,12.13980484008789,-36.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [458] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-23.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [459] = {shape="Normal", cframe=CFrame.new(-28.531005859375,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [460] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-22.522674560546875,0,0,1,0,1,-0,-1,0,0)},
    [461] = {shape="Normal", cframe=CFrame.new(-49.531005859375,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [462] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-17.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [463] = {shape="Normal", cframe=CFrame.new(-10.531005859375,42.139808654785156,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [464] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-17.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [465] = {shape="Normal", cframe=CFrame.new(5.468994140625,8.539806365966797,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [466] = {shape="Normal", cframe=CFrame.new(-15.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [467] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-17.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [468] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-31.022659301757812,0,0,-1,0,1,0,1,0,0)},
    [469] = {shape="Normal", cframe=CFrame.new(4.468994140625,31.33981704711914,-5.02264404296875,1,0,0,0,1,0,0,0,1)},
    [470] = {shape="Normal", cframe=CFrame.new(1.468994140625,37.339813232421875,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [471] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-3.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [472] = {shape="Normal", cframe=CFrame.new(-40.031005859375,18.73979949951172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [473] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.739822387695312,-15.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [474] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,0.977325439453125,0,0,-1,0,1,0,1,0,0)},
    [475] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-3.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [476] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-45.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [477] = {shape="Normal", cframe=CFrame.new(1.468994140625,39.739830017089844,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [478] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.33981704711914,-37.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [479] = {shape="Normal", cframe=CFrame.new(4.468994140625,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [480] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,1.477325439453125,0,0,-1,0,1,0,1,0,0)},
    [481] = {shape="Normal", cframe=CFrame.new(4.468994140625,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [482] = {shape="Normal", cframe=CFrame.new(-22.531005859375,25.33981704711914,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [483] = {shape="Normal", cframe=CFrame.new(-47.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [484] = {shape="Normal", cframe=CFrame.new(1.468994140625,34.93981170654297,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [485] = {shape="Normal", cframe=CFrame.new(-46.531005859375,37.339813232421875,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [486] = {shape="Normal", cframe=CFrame.new(-49.531005859375,18.73979949951172,-4.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [487] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-11.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [488] = {shape="Normal", cframe=CFrame.new(-33.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [489] = {shape="Normal", cframe=CFrame.new(-22.031005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [490] = {shape="Normal", cframe=CFrame.new(4.4788818359375,23.539813995361328,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [493] = {shape="Normal", cframe=CFrame.new(-5.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [494] = {shape="Normal", cframe=CFrame.new(-10.531005859375,27.739822387695312,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [495] = {shape="Normal", cframe=CFrame.new(0.468994140625,13.939800262451172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [496] = {shape="Normal", cframe=CFrame.new(-46.031005859375,11.539806365966797,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [497] = {shape="Normal", cframe=CFrame.new(-49.531005859375,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [498] = {shape="Normal", cframe=CFrame.new(-40.531005859375,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [499] = {shape="Normal", cframe=CFrame.new(4.468994140625,33.73981475830078,-35.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [500] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,0.977325439453125,0,0,1,0,1,-0,-1,0,0)},
    [501] = {shape="Normal", cframe=CFrame.new(-4.531005859375,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [502] = {shape="Normal", cframe=CFrame.new(-46.531005859375,42.139808654785156,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [503] = {shape="Normal", cframe=CFrame.new(-49.531005859375,33.139808654785156,-29.022659301757812,0,0,-1,0,1,0,1,0,0)},
    [504] = {shape="Normal", cframe=CFrame.new(-17.531005859375,16.33980941772461,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [505] = {shape="Normal", cframe=CFrame.new(-28.531005859375,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [506] = {shape="Normal", cframe=CFrame.new(0.968994140625,11.539806365966797,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [507] = {shape="Normal", cframe=CFrame.new(4.468994140625,33.139808654785156,-29.022659301757812,0,0,-1,0,1,0,1,0,0)},
    [508] = {shape="Normal", cframe=CFrame.new(0.968994140625,16.33980941772461,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [509] = {shape="Normal", cframe=CFrame.new(-27.531005859375,16.33980941772461,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [510] = {shape="Normal", cframe=CFrame.new(0.468994140625,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [511] = {shape="Normal", cframe=CFrame.new(-22.531005859375,37.339813232421875,-15.02264404296875,1,0,0,0,1,0,0,0,1)},
    [512] = {shape="Normal", cframe=CFrame.new(-41.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [513] = {shape="Normal", cframe=CFrame.new(-40.031005859375,13.939800262451172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [514] = {shape="Normal", cframe=CFrame.new(-23.031005859375,18.73979949951172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [515] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,2.977325439453125,0,0,1,0,1,-0,-1,0,0)},
    [516] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-40.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [517] = {shape="Normal", cframe=CFrame.new(-40.531005859375,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [518] = {shape="Normal", cframe=CFrame.new(-49.531005859375,33.139808654785156,-16.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [519] = {shape="Normal", cframe=CFrame.new(-23.031005859375,11.539806365966797,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [520] = {shape="Normal", cframe=CFrame.new(-22.531005859375,39.739830017089844,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [521] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,1.477325439453125,0,0,-1,0,1,0,1,0,0)},
    [522] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-15.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [523] = {shape="Normal", cframe=CFrame.new(-40.531005859375,33.73981475830078,-9.02264404296875,1,0,0,0,1,0,0,0,1)},
    [524] = {shape="Normal", cframe=CFrame.new(-3.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [525] = {shape="Normal", cframe=CFrame.new(-45.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [526] = {shape="Normal", cframe=CFrame.new(-17.531005859375,18.73979949951172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [527] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-4.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [528] = {shape="Normal", cframe=CFrame.new(-45.531005859375,18.73979949951172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [529] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-15.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [530] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-9.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [531] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-39.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [532] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-9.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [533] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-45.52265930175781,0,0,1,0,1,-0,-1,0,0)},
    [534] = {shape="Normal", cframe=CFrame.new(-46.531005859375,32.53981399536133,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [535] = {shape="Normal", cframe=CFrame.new(-28.531005859375,36.139808654785156,-13.02264404296875,1,0,0,0,1,0,0,0,1)},
    [536] = {shape="Normal", cframe=CFrame.new(-40.531005859375,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [537] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-40.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [538] = {shape="Normal", cframe=CFrame.new(-22.531005859375,8.539806365966797,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [539] = {shape="Normal", cframe=CFrame.new(-49.531005859375,9.13980484008789,-45.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [540] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-35.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [541] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,-26.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [543] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-29.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [544] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-35.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [545] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-36.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [546] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-36.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [547] = {shape="Normal", cframe=CFrame.new(-49.531005859375,17.53980255126953,-30.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [548] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [549] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-30.022659301757812,0,0,1,0,1,-0,-1,0,0)},
    [550] = {shape="Normal", cframe=CFrame.new(-50.031005859375,10.939815521240234,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [551] = {shape="Normal", cframe=CFrame.new(-49.531005859375,19.339813232421875,-36.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [552] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-29.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [553] = {shape="Normal", cframe=CFrame.new(-49.531005859375,35.53981018066406,-25.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [554] = {shape="Normal", cframe=CFrame.new(-49.531005859375,21.139808654785156,-21.022674560546875,0,0,1,0,1,-0,-1,0,0)},
    [555] = {shape="Normal", cframe=CFrame.new(4.468994140625,11.539806365966797,-26.52264404296875,0,0,-1,0,1,0,1,0,0)},
    [556] = {shape="Normal", cframe=CFrame.new(-10.531005859375,30.139812469482422,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [557] = {shape="Normal", cframe=CFrame.new(-18.031005859375,11.539806365966797,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [558] = {shape="Normal", cframe=CFrame.new(-49.531005859375,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [559] = {shape="Normal", cframe=CFrame.new(-49.531005859375,27.739822387695312,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [560] = {shape="Normal", cframe=CFrame.new(4.468994140625,21.139808654785156,-41.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [561] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.539810180664062,-30.522659301757812,0,0,1,0,1,-0,-1,0,0)},
    [562] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.739822387695312,-10.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [563] = {shape="Normal", cframe=CFrame.new(-18.031005859375,16.33980941772461,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [564] = {shape="Normal", cframe=CFrame.new(-45.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [565] = {shape="Normal", cframe=CFrame.new(-35.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [566] = {shape="Normal", cframe=CFrame.new(-16.531005859375,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [567] = {shape="Normal", cframe=CFrame.new(1.468994140625,27.739822387695312,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [568] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-47.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [569] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-45.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [570] = {shape="Normal", cframe=CFrame.new(-11.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [571] = {shape="Normal", cframe=CFrame.new(-27.531005859375,18.73979949951172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [572] = {shape="Normal", cframe=CFrame.new(-28.531005859375,26.539813995361328,-47.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [573] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-22.522674560546875,0,0,1,0,1,-0,-1,0,0)},
    [574] = {shape="Normal", cframe=CFrame.new(-49.531005859375,27.739822387695312,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [575] = {shape="Normal", cframe=CFrame.new(-49.531005859375,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [576] = {shape="Normal", cframe=CFrame.new(-5.531005859375,23.539813995361328,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [577] = {shape="Normal", cframe=CFrame.new(-11.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [578] = {shape="Normal", cframe=CFrame.new(4.468994140625,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [579] = {shape="Normal", cframe=CFrame.new(-22.531005859375,32.53981399536133,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [580] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,2.977325439453125,0,0,1,0,1,-0,-1,0,0)},
    [581] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-17.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [582] = {shape="Normal", cframe=CFrame.new(-28.531005859375,38.53981018066406,-17.02264404296875,1,0,0,0,1,0,0,0,1)},
    [583] = {shape="Normal", cframe=CFrame.new(-49.531005859375,28.33981704711914,-19.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [584] = {shape="Normal", cframe=CFrame.new(-49.531005859375,32.53981399536133,-11.02264404296875,1,0,0,0,1,0,0,0,1)},
    [585] = {shape="Normal", cframe=CFrame.new(2.468994140625,16.33980941772461,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [586] = {shape="Normal", cframe=CFrame.new(-10.531005859375,32.53981399536133,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [587] = {shape="Normal", cframe=CFrame.new(-5.031005859375,18.73979949951172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [588] = {shape="Normal", cframe=CFrame.new(-40.531005859375,26.539813995361328,2.977325439453125,1,0,0,0,1,0,0,0,1)},
    [589] = {shape="Normal", cframe=CFrame.new(-46.531005859375,30.139812469482422,-41.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [590] = {shape="Normal", cframe=CFrame.new(-22.531005859375,27.739822387695312,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [591] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-17.52264404296875,0,0,1,0,1,-0,-1,0,0)},
    [592] = {shape="Normal", cframe=CFrame.new(-34.531005859375,27.739822387695312,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [593] = {shape="Normal", cframe=CFrame.new(4.468994140625,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [594] = {shape="Normal", cframe=CFrame.new(-18.031005859375,18.73979949951172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [595] = {shape="Normal", cframe=CFrame.new(-16.531005859375,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [596] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-40.52265930175781,0,0,1,0,1,-0,-1,0,0)},
    [597] = {shape="Normal", cframe=CFrame.new(4.468994140625,37.339813232421875,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [598] = {shape="Normal", cframe=CFrame.new(-4.531005859375,40.93981170654297,-22.022674560546875,1,0,0,0,1,0,0,0,1)},
    [599] = {shape="Normal", cframe=CFrame.new(1.468994140625,34.93981170654297,-33.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [600] = {shape="Normal", cframe=CFrame.new(7.468994140625,6.739803314208984,-33.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [601] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-39.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [602] = {shape="Normal", cframe=CFrame.new(-49.531005859375,37.339813232421875,-25.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [603] = {shape="Normal", cframe=CFrame.new(-49.531005859375,11.539806365966797,-4.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [604] = {shape="Normal", cframe=CFrame.new(-46.531005859375,30.139812469482422,-3.02264404296875,1,0,0,0,1,0,0,0,1)},
    [605] = {shape="Normal", cframe=CFrame.new(-10.531005859375,27.739822387695312,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [606] = {shape="Normal", cframe=CFrame.new(-49.531005859375,34.93981170654297,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [607] = {shape="Normal", cframe=CFrame.new(-4.031005859375,16.33980941772461,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [608] = {shape="Normal", cframe=CFrame.new(-49.531005859375,25.939815521240234,-27.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [609] = {shape="Normal", cframe=CFrame.new(-23.031005859375,16.33980941772461,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [610] = {shape="Normal", cframe=CFrame.new(-47.531005859375,11.539806365966797,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [611] = {shape="Normal", cframe=CFrame.new(-27.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [612] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-5.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [613] = {shape="Normal", cframe=CFrame.new(-3.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [614] = {shape="Normal", cframe=CFrame.new(4.468994140625,16.33980941772461,2.977325439453125,0,0,-1,0,1,0,1,0,0)},
    [615] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.139812469482422,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [616] = {shape="Normal", cframe=CFrame.new(4.468994140625,17.539810180664062,-36.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [617] = {shape="Normal", cframe=CFrame.new(-46.531005859375,27.739822387695312,0.977325439453125,1,0,0,0,1,0,0,0,1)},
    [618] = {shape="Normal", cframe=CFrame.new(4.468994140625,30.739822387695312,-15.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [619] = {shape="Normal", cframe=CFrame.new(-3.531005859375,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [620] = {shape="Normal", cframe=CFrame.new(-23.531005859375,21.139808654785156,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [621] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-23.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [622] = {shape="Normal", cframe=CFrame.new(-15.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [623] = {shape="Normal", cframe=CFrame.new(-4.531005859375,16.33980941772461,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [624] = {shape="Normal", cframe=CFrame.new(-16.531005859375,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [625] = {shape="Normal", cframe=CFrame.new(-18.031005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [626] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,0.977325439453125,0,0,-1,0,1,0,1,0,0)},
    [627] = {shape="Normal", cframe=CFrame.new(-47.531005859375,16.33980941772461,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [628] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-47.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [629] = {shape="Normal", cframe=CFrame.new(-34.531005859375,32.53981399536133,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [630] = {shape="Normal", cframe=CFrame.new(-49.5360107421875,23.539813995361328,-11.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [633] = {shape="Normal", cframe=CFrame.new(1.468994140625,32.53981399536133,-37.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [634] = {shape="Normal", cframe=CFrame.new(-49.531005859375,23.539813995361328,-29.022659301757812,0,0,-1,0,1,0,1,0,0)},
    [635] = {shape="Normal", cframe=CFrame.new(4.468994140625,34.93981170654297,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [636] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [637] = {shape="Normal", cframe=CFrame.new(-5.031005859375,13.939800262451172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [638] = {shape="Normal", cframe=CFrame.new(-28.531005859375,28.939815521240234,-1.02264404296875,1,0,0,0,1,0,0,0,1)},
    [639] = {shape="Normal", cframe=CFrame.new(4.468994140625,9.13980484008789,-11.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [640] = {shape="Normal", cframe=CFrame.new(4.468994140625,19.339813232421875,-33.02265930175781,0,0,-1,0,1,0,1,0,0)},
    [641] = {shape="Normal", cframe=CFrame.new(4.468994140625,36.139808654785156,-31.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [642] = {shape="Normal", cframe=CFrame.new(-27.031005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [643] = {shape="Normal", cframe=CFrame.new(-15.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [644] = {shape="Normal", cframe=CFrame.new(-17.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [645] = {shape="Normal", cframe=CFrame.new(-27.531005859375,11.539806365966797,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [646] = {shape="Normal", cframe=CFrame.new(-27.531005859375,9.13980484008789,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [648] = {shape="Normal", cframe=CFrame.new(-11.531005859375,10.939815521240234,5.477325439453125,-1,0,0,0,1,0,0,0,-1)},
    [649] = {shape="Normal", cframe=CFrame.new(-8.031005859375,17.53980255126953,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [650] = {shape="Normal", cframe=CFrame.new(-9.031005859375,17.53980255126953,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [651] = {shape="Normal", cframe=CFrame.new(-14.031005859375,17.53980255126953,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [652] = {shape="Normal", cframe=CFrame.new(-14.531005859375,19.339813232421875,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [653] = {shape="Normal", cframe=CFrame.new(-11.531005859375,19.339813232421875,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [654] = {shape="Normal", cframe=CFrame.new(-15.031005859375,17.53980255126953,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [655] = {shape="Normal", cframe=CFrame.new(-8.531005859375,19.339813232421875,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [656] = {shape="Normal", cframe=CFrame.new(-15.031005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [657] = {shape="Normal", cframe=CFrame.new(-8.031005859375,13.939800262451172,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [658] = {shape="Normal", cframe=CFrame.new(1.468994140625,37.339813232421875,-29.022659301757812,-1,0,0,0,1,0,0,0,-1)},
    [659] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-21.022674560546875,0,0,-1,0,1,0,1,0,0)},
    [660] = {shape="Normal", cframe=CFrame.new(-23.031005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [661] = {shape="Normal", cframe=CFrame.new(-40.531005859375,13.939800262451172,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [662] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.33981704711914,-45.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [663] = {shape="Normal", cframe=CFrame.new(-21.531005859375,23.539813995361328,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [664] = {shape="Normal", cframe=CFrame.new(4.468994140625,13.939800262451172,-27.02264404296875,0,0,1,0,1,-0,-1,0,0)},
    [665] = {shape="Normal", cframe=CFrame.new(-49.531005859375,30.139812469482422,-7.02264404296875,1,0,0,0,1,0,0,0,1)},
    [666] = {shape="Normal", cframe=CFrame.new(-40.531005859375,16.33980941772461,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [667] = {shape="Normal", cframe=CFrame.new(-49.531005859375,16.33980941772461,-22.522674560546875,0,0,1,0,1,-0,-1,0,0)},
    [668] = {shape="Normal", cframe=CFrame.new(2.468994140625,21.139808654785156,4.977325439453125,-1,0,0,0,1,0,0,0,-1)},
    [669] = {shape="Normal", cframe=CFrame.new(4.468994140625,33.139808654785156,-23.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [670] = {shape="Normal", cframe=CFrame.new(-45.531005859375,13.939800262451172,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [671] = {shape="Normal", cframe=CFrame.new(-10.531005859375,25.33981704711914,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [672] = {shape="Normal", cframe=CFrame.new(-49.531005859375,13.939800262451172,-46.52265930175781,0,0,-1,0,1,0,1,0,0)},
    [673] = {shape="Normal", cframe=CFrame.new(-28.531005859375,31.33981704711914,-39.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [674] = {shape="Normal", cframe=CFrame.new(4.468994140625,23.539813995361328,-35.02265930175781,0,0,1,0,1,-0,-1,0,0)},
    [675] = {shape="Normal", cframe=CFrame.new(-40.531005859375,38.53981018066406,-27.02264404296875,-1,0,0,0,1,0,0,0,-1)},
    [676] = {shape="Normal", cframe=CFrame.new(-4.531005859375,13.939800262451172,-49.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [677] = {shape="Normal", cframe=CFrame.new(-22.531005859375,25.33981704711914,4.977325439453125,1,0,0,0,1,0,0,0,1)},
    [678] = {shape="Normal", cframe=CFrame.new(4.468994140625,25.939815521240234,-27.02264404296875,0,0,-1,0,1,0,1,0,0)},
    [679] = {shape="Normal", cframe=CFrame.new(-5.531005859375,9.13980484008789,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [680] = {shape="Normal", cframe=CFrame.new(4.468994140625,37.339813232421875,-19.02264404296875,1,0,0,0,1,0,0,0,1)},
    [681] = {shape="Normal", cframe=CFrame.new(4.468994140625,18.73979949951172,2.477325439453125,0,0,1,0,1,-0,-1,0,0)},
    [682] = {shape="Normal", cframe=CFrame.new(-40.531005859375,28.939815521240234,-43.02265930175781,-1,0,0,0,1,0,0,0,-1)},
    [683] = {shape="Normal", cframe=CFrame.new(-22.031005859375,16.33980941772461,-49.02265930175781,1,0,0,0,1,0,0,0,1)},
    [684] = {shape="Normal", cframe=CFrame.new(65.468994140625,4.339809417724609,-44.52264404296875,1,0,0,0,1,0,0,0,1)},
    [687] = {shape="Normal", cframe=CFrame.new(35.468994140625,3.8398094177246094,-66.52264404296875,1,0,0,0,1,0,0,0,1)},
    [694] = {shape="Normal", cframe=CFrame.new(8.968994140625,4.839809417724609,-51.52264404296875,1,0,0,0,1,0,0,0,1)},
    [699] = {shape="Normal", cframe=CFrame.new(99.968994140625,4.339809417724609,-37.52264404296875,1,0,0,0,1,0,0,0,1)},
    [702] = {shape="Normal", cframe=CFrame.new(44.468994140625,4.339809417724609,-75.52264404296875,1,0,0,0,1,0,0,0,1)},
    [704] = {shape="Normal", cframe=CFrame.new(64.968994140625,4.839809417724609,-36.52264404296875,1,0,0,0,1,0,0,0,1)},
    [712] = {shape="Normal", cframe=CFrame.new(83.468994140625,4.839809417724609,-33.02264404296875,1,0,0,0,1,0,0,0,1)},
    [717] = {shape="Normal", cframe=CFrame.new(-30.031005859375,4.839809417724609,-113.52264404296875,1,0,0,0,1,0,0,0,1)},
    [720] = {shape="Normal", cframe=CFrame.new(100.468994140625,3.8398094177246094,-50.02264404296875,1,0,0,0,1,0,0,0,1)},
    [726] = {shape="Normal", cframe=CFrame.new(-23.031005859375,3.8398094177246094,-80.52264404296875,1,0,0,0,1,0,0,0,1)},
    [733] = {shape="Normal", cframe=CFrame.new(109.968994140625,3.8398094177246094,-81.52264404296875,1,0,0,0,1,0,0,0,1)},
    [737] = {shape="Normal", cframe=CFrame.new(-3.031005859375,3.8398094177246094,-50.52264404296875,1,0,0,0,1,0,0,0,1)},
    [739] = {shape="Normal", cframe=CFrame.new(-31.531005859375,3.8398094177246094,-65.52264404296875,1,0,0,0,1,0,0,0,1)},
    [741] = {shape="Normal", cframe=CFrame.new(80.968994140625,4.339809417724609,-67.52264404296875,1,0,0,0,1,0,0,0,1)},
    [744] = {shape="Normal", cframe=CFrame.new(38.9691162109375,44.139808654785156,-117.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [747] = {shape="Normal", cframe=CFrame.new(50.4691162109375,44.93981170654297,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [749] = {shape="Normal", cframe=CFrame.new(44.4691162109375,39.73981857299805,-126.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [751] = {shape="Normal", cframe=CFrame.new(44.4691162109375,36.139808654785156,-123.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [755] = {shape="Normal", cframe=CFrame.new(32.4691162109375,23.339811325073242,-129.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [758] = {shape="Normal", cframe=CFrame.new(26.4691162109375,19.139812469482422,-117.02249145507812,1,0,0,0,1,0,0,0,1)},
    [761] = {shape="Normal", cframe=CFrame.new(37.9691162109375,24.139812469482422,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [762] = {shape="Normal", cframe=CFrame.new(44.9691162109375,24.139812469482422,-135.52249145507812,0,0,1,0,1,-0,-1,0,0)},
    [766] = {shape="Normal", cframe=CFrame.new(38.4691162109375,19.139812469482422,-141.02249145507812,1,0,0,0,1,0,0,0,1)},
    [771] = {shape="Normal", cframe=CFrame.new(26.4691162109375,19.139812469482422,-129.02249145507812,1,0,0,0,1,0,0,0,1)},
    [775] = {shape="Normal", cframe=CFrame.new(26.4691162109375,24.139812469482422,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [776] = {shape="Normal", cframe=CFrame.new(32.4691162109375,19.739816665649414,-132.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [777] = {shape="Normal", cframe=CFrame.new(50.4691162109375,19.139812469482422,-117.02249145507812,1,0,0,0,1,0,0,0,1)},
    [780] = {shape="Normal", cframe=CFrame.new(31.9691162109375,24.139812469482422,-122.52249145507812,0,0,1,0,1,-0,-1,0,0)},
    [783] = {shape="Normal", cframe=CFrame.new(38.4691162109375,19.139812469482422,-129.02249145507812,1,0,0,0,1,0,0,0,1)},
    [792] = {shape="Normal", cframe=CFrame.new(26.4691162109375,24.139812469482422,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [795] = {shape="Normal", cframe=CFrame.new(32.4691162109375,22.139808654785156,-130.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [796] = {shape="Normal", cframe=CFrame.new(50.4691162109375,19.139812469482422,-129.02249145507812,1,0,0,0,1,0,0,0,1)},
    [801] = {shape="Normal", cframe=CFrame.new(32.4691162109375,17.339815139770508,-134.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [803] = {shape="Normal", cframe=CFrame.new(38.4691162109375,19.139812469482422,-117.02249145507812,1,0,0,0,1,0,0,0,1)},
    [808] = {shape="Normal", cframe=CFrame.new(32.4691162109375,14.939811706542969,-136.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [811] = {shape="Normal", cframe=CFrame.new(44.9691162109375,24.139812469482422,-122.52249145507812,0,0,1,0,1,-0,-1,0,0)},
    [813] = {shape="Normal", cframe=CFrame.new(26.4691162109375,19.139812469482422,-141.02249145507812,1,0,0,0,1,0,0,0,1)},
    [814] = {shape="Normal", cframe=CFrame.new(32.4691162109375,16.139812469482422,-135.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [815] = {shape="Normal", cframe=CFrame.new(32.4691162109375,20.93980598449707,-131.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [818] = {shape="Normal", cframe=CFrame.new(32.4691162109375,18.539813995361328,-133.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [821] = {shape="Normal", cframe=CFrame.new(37.9691162109375,24.139812469482422,-129.52249145507812,0,0,1,0,1,-0,-1,0,0)},
    [823] = {shape="Normal", cframe=CFrame.new(50.4691162109375,19.139812469482422,-141.02249145507812,1,0,0,0,1,0,0,0,1)},
    [824] = {shape="Normal", cframe=CFrame.new(50.4691162109375,44.13980484008789,-128.52249145507812,1,0,0,0,1,0,0,0,1)},
    [825] = {shape="Normal", cframe=CFrame.new(38.4691162109375,44.93981170654297,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [826] = {shape="Normal", cframe=CFrame.new(25.9691162109375,45.73982238769531,-122.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [828] = {shape="Normal", cframe=CFrame.new(26.4691162109375,39.139808654785156,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [833] = {shape="Normal", cframe=CFrame.new(37.4691162109375,12.139812469482422,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [836] = {shape="Normal", cframe=CFrame.new(37.9691162109375,14.139812469482422,-117.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [837] = {shape="Normal", cframe=CFrame.new(50.4691162109375,9.139812469482422,-129.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [841] = {shape="Normal", cframe=CFrame.new(33.4691162109375,7.339817047119141,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [843] = {shape="Normal", cframe=CFrame.new(37.9691162109375,14.139812469482422,-128.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [845] = {shape="Normal", cframe=CFrame.new(35.4691162109375,9.739814758300781,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [847] = {shape="Normal", cframe=CFrame.new(26.4691162109375,9.139812469482422,-129.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [850] = {shape="Normal", cframe=CFrame.new(26.4691162109375,9.139812469482422,-117.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [852] = {shape="Normal", cframe=CFrame.new(38.4691162109375,13.339813232421875,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [854] = {shape="Normal", cframe=CFrame.new(31.9691162109375,14.139812469482422,-135.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [857] = {shape="Normal", cframe=CFrame.new(26.4691162109375,9.139812469482422,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [860] = {shape="Normal", cframe=CFrame.new(31.4691162109375,4.9398193359375,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [863] = {shape="Normal", cframe=CFrame.new(36.4691162109375,10.939811706542969,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [864] = {shape="Normal", cframe=CFrame.new(44.9691162109375,14.139812469482422,-122.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [868] = {shape="Normal", cframe=CFrame.new(34.4691162109375,8.539817810058594,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [871] = {shape="Normal", cframe=CFrame.new(44.9691162109375,14.139812469482422,-135.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [874] = {shape="Normal", cframe=CFrame.new(38.4691162109375,9.139812469482422,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [878] = {shape="Normal", cframe=CFrame.new(32.4691162109375,6.1398162841796875,-123.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [879] = {shape="Normal", cframe=CFrame.new(38.4691162109375,9.139812469482422,-129.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [881] = {shape="Normal", cframe=CFrame.new(50.4691162109375,9.139812469482422,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [884] = {shape="Normal", cframe=CFrame.new(50.4691162109375,9.139812469482422,-117.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [886] = {shape="Normal", cframe=CFrame.new(26.4691162109375,14.139812469482422,-117.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [888] = {shape="Normal", cframe=CFrame.new(26.4691162109375,14.139812469482422,-128.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [891] = {shape="Normal", cframe=CFrame.new(38.4691162109375,9.139812469482422,-117.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [894] = {shape="Normal", cframe=CFrame.new(26.4691162109375,39.13980484008789,-117.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [895] = {shape="Normal", cframe=CFrame.new(38.4691162109375,44.93981170654297,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [897] = {shape="Normal", cframe=CFrame.new(44.4691162109375,40.9398078918457,-127.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [900] = {shape="Normal", cframe=CFrame.new(26.4691162109375,44.93981170654297,-117.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [904] = {shape="Normal", cframe=CFrame.new(38.4691162109375,39.139808654785156,-117.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [908] = {shape="Normal", cframe=CFrame.new(37.9691162109375,52.139827728271484,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [910] = {shape="Normal", cframe=CFrame.new(32.4691162109375,45.73981475830078,-141.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [912] = {shape="Normal", cframe=CFrame.new(37.9691162109375,46.13981246948242,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [915] = {shape="Normal", cframe=CFrame.new(37.9691162109375,49.73982238769531,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [918] = {shape="Normal", cframe=CFrame.new(38.4691162109375,44.93981170654297,-117.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [922] = {shape="Normal", cframe=CFrame.new(44.9691162109375,45.73982238769531,-141.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [925] = {shape="Normal", cframe=CFrame.new(38.4691162109375,39.139808654785156,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [929] = {shape="Normal", cframe=CFrame.new(44.4691162109375,43.33980941772461,-129.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [930] = {shape="Normal", cframe=CFrame.new(26.4691162109375,44.93981170654297,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [934] = {shape="Normal", cframe=CFrame.new(31.9691162109375,44.139808654785156,-135.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [938] = {shape="Normal", cframe=CFrame.new(50.4691162109375,39.139808654785156,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [940] = {shape="Normal", cframe=CFrame.new(26.4691162109375,39.139808654785156,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [942] = {shape="Normal", cframe=CFrame.new(38.4691162109375,39.13980484008789,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [943] = {shape="Normal", cframe=CFrame.new(38.9691162109375,45.73981475830078,-123.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [945] = {shape="Normal", cframe=CFrame.new(26.4691162109375,44.93981170654297,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [946] = {shape="Normal", cframe=CFrame.new(50.4691162109375,44.93981170654297,-141.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [947] = {shape="Normal", cframe=CFrame.new(44.4691162109375,42.139808654785156,-128.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [949] = {shape="Normal", cframe=CFrame.new(37.9691162109375,50.9398193359375,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [950] = {shape="Normal", cframe=CFrame.new(37.9691162109375,54.539833068847656,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [951] = {shape="Normal", cframe=CFrame.new(50.9691162109375,45.73982238769531,-134.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [954] = {shape="Normal", cframe=CFrame.new(31.9691162109375,44.139808654785156,-122.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [959] = {shape="Normal", cframe=CFrame.new(44.4691162109375,37.339813232421875,-124.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [961] = {shape="Normal", cframe=CFrame.new(25.9691162109375,45.73982238769531,-135.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [963] = {shape="Normal", cframe=CFrame.new(44.4691162109375,34.9398078918457,-122.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [964] = {shape="Normal", cframe=CFrame.new(37.9691162109375,47.339820861816406,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [965] = {shape="Normal", cframe=CFrame.new(37.9691162109375,53.3398323059082,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [968] = {shape="Normal", cframe=CFrame.new(38.9691162109375,44.139808654785156,-128.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [971] = {shape="Normal", cframe=CFrame.new(44.9691162109375,44.139808654785156,-135.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [980] = {shape="Normal", cframe=CFrame.new(43.4691162109375,27.339818954467773,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [983] = {shape="Normal", cframe=CFrame.new(26.4691162109375,29.139808654785156,-129.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [985] = {shape="Normal", cframe=CFrame.new(44.9691162109375,34.139808654785156,-122.52249145507812,1,0,0,0,1,0,0,0,1)},
    [989] = {shape="Normal", cframe=CFrame.new(26.4691162109375,29.13981056213379,-117.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [991] = {shape="Normal", cframe=CFrame.new(45.4691162109375,24.9398136138916,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [994] = {shape="Normal", cframe=CFrame.new(38.9691162109375,34.139808654785156,-141.02249145507812,0,0,1,0,1,-0,-1,0,0)},
    [995] = {shape="Normal", cframe=CFrame.new(38.4691162109375,33.339813232421875,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [996] = {shape="Normal", cframe=CFrame.new(26.4691162109375,29.139812469482422,-141.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [997] = {shape="Normal", cframe=CFrame.new(39.4691162109375,32.139808654785156,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [999] = {shape="Normal", cframe=CFrame.new(50.4691162109375,29.139812469482422,-129.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1004] = {shape="Normal", cframe=CFrame.new(44.4691162109375,26.139816284179688,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [1005] = {shape="Normal", cframe=CFrame.new(31.9691162109375,34.13981246948242,-135.52249145507812,1,0,0,0,1,0,0,0,1)},
    [1015] = {shape="Normal", cframe=CFrame.new(50.4691162109375,29.139812469482422,-117.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1018] = {shape="Normal", cframe=CFrame.new(40.4691162109375,30.939807891845703,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [1021] = {shape="Normal", cframe=CFrame.new(42.4691162109375,28.53982162475586,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [1023] = {shape="Normal", cframe=CFrame.new(38.4691162109375,29.139812469482422,-117.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1406] = {shape="Normal", cframe=CFrame.new(51.59428024291992,4.9918084144592285,-9.960317611694336,0.5150373578071594,0,0.8571677207946777,0,1,0,-0.8571677207946777,0,0.5150373578071594)},
    [1118] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,10.572254180908203,-140.31439208984375,0,0,-1,0,1,0,1,0,0)},
    [1615] = {shape="Normal", cframe=CFrame.new(52.061119079589844,6.1837263107299805,-11.444147109985352,0.17362433671951294,0,0.9848119020462036,0,1,0,-0.9848119020462036,0,0.17362433671951294)},
    [1442] = {shape="Normal", cframe=CFrame.new(59.74226760864258,5.79818058013916,-9.280567169189453,0.9336061477661133,-0.08663750439882278,0.34766873717308044,-0.00003405660390853882,0.9703044295310974,0.24188700318336487,-0.3583010137081146,-0.2258390188217163,0.9058791995048523)},
    [1388] = {shape="Normal", cframe=CFrame.new(-15.04216480255127,11.700779914855957,-2.511479139328003,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1334] = {shape="Normal", cframe=CFrame.new(-31.531005859375,4.839809417724609,-65.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1052] = {shape="Normal", cframe=CFrame.new(32.9691162109375,45.73981475830078,-116.52249145507812,0,0,-1,0,1,0,1,0,0)},
    [1420] = {shape="Normal", cframe=CFrame.new(65.42230987548828,17.748027801513672,0.9762961864471436,0.3717734217643738,-0.8572263121604919,0.35629695653915405,0.8786370158195496,0.4488077759742737,0.1629987359046936,-0.299635648727417,0.2524570822715759,0.9200456142425537)},
    [1196] = {shape="Normal", cframe=CFrame.new(-65.34130859375,7.40057373046875,-10.273162841796875,0,0,-1,0,1,0,1,0,0)},
    [1202] = {shape="Normal", cframe=CFrame.new(-23.41510009765625,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1061] = {shape="Normal", cframe=CFrame.new(81.468994140625,4.339809417724609,-77.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1407] = {shape="Normal", cframe=CFrame.new(63.1314697265625,5.803820610046387,3.4429569244384766,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1541] = {shape="Normal", cframe=CFrame.new(59.32776641845703,15.243486404418945,14.007856369018555,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1188] = {shape="Normal", cframe=CFrame.new(7.416259765625,15.012592315673828,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1381] = {shape="Normal", cframe=CFrame.new(-17.536422729492188,11.700779914855957,-0.587371826171875,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1271] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,10.572254180908203,-53.40794372558594,0,0,1,0,1,-0,-1,0,0)},
    [1378] = {shape="Cylinder", cframe=CFrame.new(-15.228170394897461,13.895898818969727,-0.38542571663856506,5.960464477539062e-07,-0.08718785643577576,-0.9961918592453003,-1,-5.960464477539062e-07,-5.662441253662109e-07,-5.662441253662109e-07,0.9961918592453003,-0.0871877670288086)},
    [1053] = {shape="Normal", cframe=CFrame.new(44.4691162109375,38.539817810058594,-125.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1097] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,10.572254180908203,-78.50450134277344,0,0,1,0,1,-0,-1,0,0)},
    [1351] = {shape="Normal", cframe=CFrame.new(40.068016052246094,11.83980941772461,-44.89380645751953,-0.08713150024414062,0,0.9961968660354614,0,1,0,-0.9961968660354614,0,-0.08713150024414062)},
    [1166] = {shape="Normal", cframe=CFrame.new(25.60174560546875,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1194] = {shape="Normal", cframe=CFrame.new(122.490966796875,15.012592315673828,-111.8359375,0,0,-1,0,1,0,1,0,0)},
    [1571] = {shape="Normal", cframe=CFrame.new(66.78174591064453,15.243486404418945,-9.549057006835938,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1045] = {shape="Normal", cframe=CFrame.new(50.4691162109375,34.13981246948242,-141.02249145507812,1,0,0,0,1,0,0,0,1)},
    [1448] = {shape="Normal", cframe=CFrame.new(55.334224700927734,5.79818058013916,-16.38031768798828,-0.29234182834625244,0.231394961476326,-0.927897036075592,0.000016286969184875488,0.9702860713005066,0.24196065962314606,0.9563140273094177,0.07072006165981293,-0.2836589813232422)},
    [1224] = {shape="Normal", cframe=CFrame.new(-29.29705810546875,15.012592315673828,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1290] = {shape="Normal", cframe=CFrame.new(13.69036865234375,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1426] = {shape="Normal", cframe=CFrame.new(45.89332962036133,4.855051517486572,-6.416878700256348,0.9062966704368591,-0,-0.4226420819759369,0,1,-0,0.4226420819759369,0,0.9062966704368591)},
    [1613] = {shape="Normal", cframe=CFrame.new(47.80297088623047,6.795980453491211,3.031261682510376,0.8191126585006714,0.5736327171325684,-0.00002110004425048828,0.00002110004425048828,-0.00006699562072753906,-0.9999999403953552,-0.5736327171325684,0.8191125988960266,-0.00006699562072753906)},
    [1369] = {shape="Normal", cframe=CFrame.new(-15.272202491760254,13.615415573120117,-0.02204728126525879,0.99619060754776,-0.08720242977142334,0.00000208243727684021,-0.00000208243727684021,-0.0000476837158203125,-1,0.08720242977142334,0.9961906671524048,-0.0000476837158203125)},
    [1408] = {shape="Normal", cframe=CFrame.new(49.39392852783203,5.2418084144592285,5.7819414138793945,-0.37460410594940186,0,0.9271848797798157,0,1,0,-0.9271848797798157,0,-0.37460410594940186)},
    [1127] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,10.572254180908203,-90.90550231933594,0,0,-1,0,1,0,1,0,0)},
    [1389] = {shape="Cylinder", cframe=CFrame.new(-15.222855567932129,11.152029991149902,-0.4461830258369446,5.960464477539062e-07,-0.08718785643577576,-0.9961918592453003,-1,-5.960464477539062e-07,-5.662441253662109e-07,-5.662441253662109e-07,0.9961918592453003,-0.0871877670288086)},
    [1033] = {shape="Normal", cframe=CFrame.new(38.9691162109375,34.139808654785156,-129.52249145507812,1,0,0,0,1,0,0,0,1)},
    [1169] = {shape="Normal", cframe=CFrame.new(122.279541015625,10.572254180908203,-99.92457580566406,0,0,-1,0,1,0,1,0,0)},
    [1624] = {shape="Normal", cframe=CFrame.new(52.0367546081543,5.622447490692139,-11.305967330932617,0.17362433671951294,0,0.9848119020462036,0,1,0,-0.9848119020462036,0,0.17362433671951294)},
    [1145] = {shape="Normal", cframe=CFrame.new(97.3623046875,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1413] = {shape="Normal", cframe=CFrame.new(57.525630950927734,5.353821754455566,-3.366036891937256,0.6819736957550049,0,0.7313766479492188,0,1,0,-0.7313766479492188,0,0.6819736957550049)},
    [1275] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,15.012592315673828,-127.52130889892578,0,0,-1,0,1,0,1,0,0)},
    [1239] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,15.012592315673828,-152.22576904296875,0,0,-1,0,1,0,1,0,0)},
    [1339] = {shape="Normal", cframe=CFrame.new(-9.031005859375,4.839809417724609,-95.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1044] = {shape="Normal", cframe=CFrame.new(41.4691162109375,29.739824295043945,-135.02249145507812,1,0,0,0,1,0,0,0,1)},
    [1627] = {shape="Normal", cframe=CFrame.new(47.510597229003906,7.098834037780762,3.3478429317474365,0.8197011947631836,0.0025237323716282845,0.5727857947349548,-0.00045071099884808064,0.999992847442627,-0.003761032596230507,-0.5727911591529846,0.0028247623704373837,0.8196964859962463)},
    [1581] = {shape="Normal", cframe=CFrame.new(64.67354583740234,11.293488502502441,-8.93222427368164,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1633] = {shape="Normal", cframe=CFrame.new(51.870548248291016,6.288965702056885,-11.050298690795898,0.17369365692138672,0.9847997426986694,0.00007420778274536133,0.000019282102584838867,0.00007200241088867188,-1,-0.9847997426986694,0.1736937165260315,-0.0000064373016357421875)},
    [1404] = {shape="Normal", cframe=CFrame.new(52.48519515991211,4.853820323944092,-15.85118293762207,-0.034969449043273926,0,0.9993885159492493,0,1,0,-0.9993885159492493,0,-0.034969449043273926)},
    [1479] = {shape="Normal", cframe=CFrame.new(54.64503860473633,6.718947410583496,2.5055296421051025,0.45442360639572144,-0.00014722516061738133,0.8907857537269592,0.00014722516061738133,1,0.00009017046977533028,-0.8907857537269592,0.00009017046977533028,0.45442360639572144)},
    [1113] = {shape="Normal", cframe=CFrame.new(39.57122802734375,21.355920791625977,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
    [1232] = {shape="Normal", cframe=CFrame.new(31.33642578125,10.572254180908203,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1089] = {shape="Normal", cframe=CFrame.new(-23.41510009765625,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1103] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,7.40057373046875,-102.81681823730469,0,0,-1,0,1,0,1,0,0)},
    [1595] = {shape="Normal", cframe=CFrame.new(70.13556671142578,15.243486404418945,-6.330077648162842,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1392] = {shape="Normal", cframe=CFrame.new(-15.291933059692383,11.822761535644531,0.34349170327186584,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1223] = {shape="Normal", cframe=CFrame.new(-29.29705810546875,7.40057373046875,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1250] = {shape="Normal", cframe=CFrame.new(-65.34130859375,7.40057373046875,14.039154052734375,0,0,-1,0,1,0,1,0,0)},
    [1618] = {shape="Normal", cframe=CFrame.new(47.526554107666016,6.683725357055664,3.3704307079315186,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1477] = {shape="Normal", cframe=CFrame.new(57.473777770996094,6.739635467529297,1.2878986597061157,-0.20880627632141113,-0.6515889167785645,0.7292680144309998,0.07584211230278015,0.7326705455780029,0.6763444542884827,-0.9750117659568787,0.1965341717004776,-0.10356831550598145)},
    [1209] = {shape="Normal", cframe=CFrame.new(-35.32635498046875,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1056] = {shape="Normal", cframe=CFrame.new(17.968994140625,4.339809417724609,-81.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1549] = {shape="Normal", cframe=CFrame.new(56.97137451171875,15.243486404418945,12.909051895141602,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1514] = {shape="Normal", cframe=CFrame.new(52.08634948730469,6.790937423706055,4.196107864379883,0.515428900718689,-0.20754854381084442,0.8314184546470642,0.0002324432134628296,0.9702603220939636,0.24206380546092987,-0.8569323420524597,-0.12457342445850372,0.5001484155654907)},
    [1480] = {shape="Normal", cframe=CFrame.new(53.78919219970703,6.739442825317383,-2.1259024143218994,-0.43090617656707764,0.023618459701538086,-0.902087926864624,-0.31063225865364075,0.9346814155578613,0.17285345494747162,0.8472473621368408,0.35470110177993774,-0.3954232931137085)},
    [1036] = {shape="Normal", cframe=CFrame.new(31.9691162109375,34.139808654785156,-122.52249145507812,1,0,0,0,1,0,0,0,1)},
    [1295] = {shape="Normal", cframe=CFrame.new(57.968994140625,4.339809417724609,-51.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1428] = {shape="Normal", cframe=CFrame.new(47.50149917602539,5.105051517486572,-2.412015914916992,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1076] = {shape="Normal", cframe=CFrame.new(90.968994140625,4.339809417724609,-65.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1410] = {shape="Normal", cframe=CFrame.new(46.2136344909668,4.591808319091797,-0.20801019668579102,0.7431478500366211,0,0.6691272258758545,0,1,0,-0.6691272258758545,0,0.7431478500366211)},
    [1280] = {shape="Normal", cframe=CFrame.new(-53.609375,7.40057373046875,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1107] = {shape="Normal", cframe=CFrame.new(-41.2083740234375,21.355920791625977,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1059] = {shape="Normal", cframe=CFrame.new(-31.531005859375,4.339809417724609,-74.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1139] = {shape="Normal", cframe=CFrame.new(105.4498291015625,7.40057373046875,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1591] = {shape="Normal", cframe=CFrame.new(66.84086608886719,11.403816223144531,-6.523126602172852,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1178] = {shape="Normal", cframe=CFrame.new(75.794921875,7.40057373046875,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1327] = {shape="Normal", cframe=CFrame.new(74.468994140625,3.8398094177246094,-56.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1190] = {shape="Normal", cframe=CFrame.new(80.745361328125,10.572254180908203,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1636] = {shape="Normal", cframe=CFrame.new(52.08549118041992,5.622447490692139,-11.582345962524414,0.17362433671951294,0,0.9848119020462036,0,1,0,-0.9848119020462036,0,0.17362433671951294)},
    [1472] = {shape="Normal", cframe=CFrame.new(62.290016174316406,5.79818058013916,-10.259689331054688,-0.15643882751464844,-0.23888884484767914,0.9583626985549927,0.000046506524085998535,0.9703077077865601,0.24187393486499786,-0.9876877069473267,0.037883028388023376,-0.15178263187408447)},
    [1368] = {shape="Cylinder", cframe=CFrame.new(-14.253219604492188,13.188587188720703,0.924042820930481,0.99619060754776,-0.08720242977142334,0.00000208243727684021,-0.00000208243727684021,-0.0000476837158203125,-1,0.08720242977142334,0.9961906671524048,-0.0000476837158203125)},
    [1289] = {shape="Normal", cframe=CFrame.new(13.69036865234375,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1158] = {shape="Normal", cframe=CFrame.new(43.247802734375,15.012592315673828,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1536] = {shape="Normal", cframe=CFrame.new(56.947200775146484,11.293488502502441,12.842615127563477,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1566] = {shape="Normal", cframe=CFrame.new(56.0465087890625,11.293488502502441,10.98822021484375,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1206] = {shape="Normal", cframe=CFrame.new(122.279541015625,15.012592315673828,-149.72561645507812,0,0,1,0,1,-0,-1,0,0)},
    [1593] = {shape="Normal", cframe=CFrame.new(68.9642105102539,11.293488502502441,-4.173009872436523,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1600] = {shape="Normal", cframe=CFrame.new(66.750244140625,7.353817462921143,-6.5653767585754395,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1487] = {shape="Normal", cframe=CFrame.new(54.83668518066406,6.7191572189331055,0.9194196462631226,0.45442360639572144,-0.00014722516061738133,0.8907857537269592,0.00014722516061738133,1,0.00009017046977533028,-0.8907857537269592,0.00009017046977533028,0.45442360639572144)},
    [1538] = {shape="Normal", cframe=CFrame.new(59.35490036010742,8.653820037841797,10.950288772583008,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1283] = {shape="Normal", cframe=CFrame.new(122.45892333984375,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1469] = {shape="Normal", cframe=CFrame.new(58.14697265625,5.870757579803467,-8.736242294311523,-0.24192428588867188,-0.23476102948188782,0.9414669871330261,0.00007797032594680786,0.9702845215797424,0.24196691811084747,-0.970295250415802,0.05861105024814606,-0.23471713066101074)},
    [1359] = {shape="Normal", cframe=CFrame.new(-13.241842269897461,11.822761535644531,-0.7013312578201294,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1445] = {shape="Normal", cframe=CFrame.new(58.75939178466797,5.79818058013916,-11.741193771362305,-0.3089594841003418,0,0.9510752558708191,0,1,0,-0.9510752558708191,0,-0.3089594841003418)},
    [1182] = {shape="Normal", cframe=CFrame.new(0.8973388671875,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1425] = {shape="Normal", cframe=CFrame.new(46.09877395629883,5.105051517486572,-6.265905857086182,-0.9062966108322144,0,0.4226420819759369,0,1,0,-0.4226420819759369,0,-0.9062966108322144)},
    [1163] = {shape="Normal", cframe=CFrame.new(-35.32635498046875,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1612] = {shape="Normal", cframe=CFrame.new(47.64151382446289,6.122447490692139,3.289949655532837,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1248] = {shape="Normal", cframe=CFrame.new(122.490966796875,21.355920791625977,-136.93252563476562,0,0,1,0,1,-0,-1,0,0)},
    [1575] = {shape="Normal", cframe=CFrame.new(66.88313293457031,10.853816986083984,-6.61375617980957,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1205] = {shape="Normal", cframe=CFrame.new(122.279541015625,7.40057373046875,-149.72561645507812,0,0,1,0,1,-0,-1,0,0)},
    [1181] = {shape="Normal", cframe=CFrame.new(0.8973388671875,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1511] = {shape="Normal", cframe=CFrame.new(53.61956787109375,6.0691375732421875,-0.6557650566101074,0.45442360639572144,-0.00014722516061738133,0.8907857537269592,0.00014722516061738133,1,0.00009017046977533028,-0.8907857537269592,0.00009017046977533028,0.45442360639572144)},
    [1092] = {shape="Normal", cframe=CFrame.new(122.279541015625,21.355920791625977,-75.22012329101562,0,0,-1,0,1,0,1,0,0)},
    [1185] = {shape="Normal", cframe=CFrame.new(122.279541015625,15.012592315673828,23.205596923828125,0,0,1,0,1,-0,-1,0,0)},
    [1320] = {shape="Normal", cframe=CFrame.new(69.968994140625,4.339809417724609,-71.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1233] = {shape="Normal", cframe=CFrame.new(31.33642578125,21.355920791625977,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1104] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,15.012592315673828,-102.81681823730469,0,0,-1,0,1,0,1,0,0)},
    [1602] = {shape="Normal", cframe=CFrame.new(68.98838806152344,15.243486404418945,-4.106572151184082,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1414] = {shape="Normal", cframe=CFrame.new(50.94440460205078,4.791808605194092,-11.374608993530273,0.08713138103485107,0,0.9961968660354614,0,1,0,-0.9961968660354614,0,0.08713138103485107)},
    [1520] = {shape="Normal", cframe=CFrame.new(56.50044631958008,11.105043411254883,-0.5328259468078613,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1569] = {shape="Normal", cframe=CFrame.new(64.49960327148438,15.243486404418945,-4.654993534088135,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1137] = {shape="Normal", cframe=CFrame.new(-65.34130859375,15.012592315673828,14.039154052734375,0,0,-1,0,1,0,1,0,0)},
    [1314] = {shape="Normal", cframe=CFrame.new(72.968994140625,4.339809417724609,-41.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1286] = {shape="Normal", cframe=CFrame.new(122.279541015625,10.572254180908203,-25.811203002929688,0,0,-1,0,1,0,1,0,0)},
    [1152] = {shape="Normal", cframe=CFrame.new(92.65667724609375,15.012592315673828,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1245] = {shape="Normal", cframe=CFrame.new(117.36114501953125,21.355920791625977,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1128] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,21.355920791625977,-90.90550231933594,0,0,-1,0,1,0,1,0,0)},
    [1146] = {shape="Normal", cframe=CFrame.new(97.3623046875,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1465] = {shape="Normal", cframe=CFrame.new(57.48291778564453,5.818290710449219,-9.370254516601562,-0.5152963399887085,-0.5517815947532654,0.6557490825653076,0.07584512233734131,0.7327934503555298,0.6762109398841858,-0.853649377822876,0.3981843590736389,-0.3357558250427246)},
    [1489] = {shape="Normal", cframe=CFrame.new(56.75053787231445,6.73915958404541,4.592645168304443,0.3554903268814087,-0.054774925112724304,0.9330735802650452,-0.3103204369544983,0.9347391128540039,0.17310120165348053,-0.8816619515419006,-0.35108762979507446,0.31529295444488525)},
    [1399] = {shape="Normal", cframe=CFrame.new(52.24964141845703,8.19625473022461,8.677656173706055,0.34614843130111694,0.24241337180137634,0.9063206315040588,-0.5735623836517334,0.8191618919372559,-0.000041991472244262695,-0.742433488368988,-0.5198168754577637,0.42259079217910767)},
    [1512] = {shape="Normal", cframe=CFrame.new(52.76634979248047,6.738832473754883,1.9031181335449219,0.06705105304718018,0.20282863080501556,-0.9769158959388733,-0.3104955852031708,0.9347437620162964,0.17276176810264587,0.9482070803642273,0.291744202375412,0.12565290927886963)},
    [1379] = {shape="Ball", cframe=CFrame.new(-15.228170394897461,14.017847061157227,-0.38542571663856506,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1496] = {shape="Normal", cframe=CFrame.new(57.20503616333008,6.739295482635498,3.9964981079101562,-0.015910744667053223,0.17662160098552704,-0.9841501712799072,-0.3104994297027588,0.9347401857376099,0.1727740317583084,0.9504404067993164,0.3083270788192749,0.03996849060058594)},
    [1463] = {shape="Normal", cframe=CFrame.new(58.024513244628906,5.79818058013916,-16.741046905517578,-0.9659162759780884,-0.06265085935592651,0.25115856528282166,-0.00003897771239280701,0.9703037142753601,0.2418898344039917,-0.2588547170162201,0.2336355447769165,-0.93723464012146)},
    [1495] = {shape="Normal", cframe=CFrame.new(53.05353927612305,6.71898078918457,0.010950088500976562,0.34241247177124023,-0.22741711139678955,0.9116114377975464,0.00015247613191604614,0.9702774286270142,0.24199515581130981,-0.9395498037338257,-0.0827232077717781,0.3322697877883911)},
    [1304] = {shape="Normal", cframe=CFrame.new(-39.031005859375,4.839809417724609,-47.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1083] = {shape="Normal", cframe=CFrame.new(-65.552734375,21.355920791625977,25.950531005859375,0,0,-1,0,1,0,1,0,0)},
    [1651] = {shape="Normal", cframe=CFrame.new(63.92702865600586,17.51133155822754,4.016425132751465,0.3283981680870056,-0.265988826751709,0.9063137173652649,0.6293154358863831,0.7771499752998352,0.00005206465721130371,-0.7043555378913879,0.5703401565551758,0.4226055145263672)},
    [1649] = {shape="Normal", cframe=CFrame.new(65.32167053222656,17.51133155822754,1.0256102085113525,0.3660274147987366,0.21135485172271729,0.9062853455543518,-0.5000355243682861,0.8660048842430115,-0.000008434057235717773,-0.7848493456840515,-0.4531717598438263,0.42266643047332764)},
    [1648] = {shape="Normal", cframe=CFrame.new(63.87700271606445,17.570154190063477,4.088281631469727,0.3283981680870056,-0.265988826751709,0.9063137173652649,0.6293154358863831,0.7771499752998352,0.00005206465721130371,-0.7043555378913879,0.5703401565551758,0.4226055145263672)},
    [1063] = {shape="Normal", cframe=CFrame.new(44.968994140625,4.339809417724609,-81.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1635] = {shape="Normal", cframe=CFrame.new(61.408103942871094,6.725346565246582,-10.329233169555664,0.7732948064804077,0.5230182409286499,0.358423113822937,0.017336398363113403,0.5476418733596802,-0.8365333676338196,-0.6338096261024475,0.6531007885932922,0.41442131996154785)},
    [1645] = {shape="Normal", cframe=CFrame.new(52.75275421142578,7.645737648010254,13.135189056396484,-0.5735992193222046,0,0.8191365599632263,0,1,0,-0.8191365599632263,0,-0.5735992193222046)},
    [1643] = {shape="Normal", cframe=CFrame.new(52.72938537597656,8.064516067504883,13.15168571472168,-0.5734379291534424,0.000805748684797436,0.819248616695404,-0.00003569014370441437,0.999999463558197,-0.0010085025569424033,-0.8192490339279175,-0.0006075527053326368,-0.5734376311302185)},
    [1364] = {shape="Ball", cframe=CFrame.new(-15.334458351135254,14.017847061157227,0.8294466137886047,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1641] = {shape="Normal", cframe=CFrame.new(52.03311538696289,6.603072166442871,-11.449244499206543,0.1736305207014084,-0.0007805961067788303,0.9848105311393738,0.00457487627863884,0.9999895095825195,-0.000013962289813207462,-0.9848002195358276,0.0045078108087182045,0.17363226413726807)},
    [1640] = {shape="Normal", cframe=CFrame.new(56.70093536376953,7.1509785652160645,-6.323957443237305,0.8191126585006714,0.5736327171325684,-0.00002110004425048828,0.00002110004425048828,-0.00006699562072753906,-0.9999999403953552,-0.5736327171325684,0.8191125988960266,-0.00006699562072753906)},
    [1558] = {shape="Normal", cframe=CFrame.new(61.585731506347656,11.293488502502441,9.047355651855469,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1638] = {shape="Normal", cframe=CFrame.new(60.39069366455078,6.035516262054443,-11.30312728881836,0.22007375955581665,0.9754825234413147,-0.0011583545710891485,0.00004722291123471223,-0.0011981211137026548,-0.9999992847442627,-0.975483238697052,0.22007355093955994,-0.00030974016408436)},
    [1446] = {shape="Normal", cframe=CFrame.new(54.87810516357422,5.818290710449219,-14.40919303894043,0.29478591680526733,0.2676638960838318,-0.9173098206520081,-0.31046146154403687,0.934715986251831,0.17297321557998657,0.9037228226661682,0.2337992787361145,0.3586404323577881)},
    [1494] = {shape="Normal", cframe=CFrame.new(52.78070831298828,6.738926410675049,1.1032451391220093,0.12294310331344604,0.6659681797027588,-0.7357794046401978,0.07577601075172424,0.7329400777816772,0.6760597825050354,0.9895164966583252,-0.13887131214141846,0.039645493030548096)},
    [1647] = {shape="Normal", cframe=CFrame.new(65.31824493408203,17.612945556640625,0.9975335597991943,0.3660274147987366,0.21135485172271729,0.9062853455543518,-0.5000355243682861,0.8660048842430115,-0.000008434057235717773,-0.7848493456840515,-0.4531717598438263,0.42266643047332764)},
    [1631] = {shape="Normal", cframe=CFrame.new(52.83324432373047,7.084458351135254,13.250129699707031,-0.5735992193222046,0,0.8191365599632263,0,1,0,-0.8191365599632263,0,-0.5735992193222046)},
    [1236] = {shape="Normal", cframe=CFrame.new(122.490966796875,21.355920791625977,-161.636962890625,0,0,1,0,1,-0,-1,0,0)},
    [1048] = {shape="Normal", cframe=CFrame.new(38.4691162109375,29.139808654785156,-129.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1515] = {shape="Normal", cframe=CFrame.new(51.369815826416016,6.71898078918457,-3.1068904399871826,-0.545024037361145,0.2030109167098999,-0.8134713768959045,0.0001621544361114502,0.9702680706977844,0.24203269183635712,0.838420569896698,0.1317816823720932,-0.5288523435592651)},
    [1242] = {shape="Normal", cframe=CFrame.new(-65.552734375,21.355920791625977,-21.105575561523438,0,0,-1,0,1,0,1,0,0)},
    [1504] = {shape="Normal", cframe=CFrame.new(52.123722076416016,6.71898078918457,-2.5291643142700195,-0.9395270347595215,-0.08272264897823334,0.3323341906070709,0.00020660832524299622,0.9702528715133667,0.24209362268447876,-0.3424748480319977,0.22752216458320618,-0.9115616083145142)},
    [1346] = {shape="Normal", cframe=CFrame.new(0,14.999571800231934,-30,-1,0,0,0,1,0,0,0,-1)},
    [1632] = {shape="Normal", cframe=CFrame.new(60.75954818725586,6.704880714416504,-9.792728424072266,0.7732948064804077,0.5230182409286499,0.358423113822937,0.017336398363113403,0.5476418733596802,-0.8365333676338196,-0.6338096261024475,0.6531007885932922,0.41442131996154785)},
    [1218] = {shape="Normal", cframe=CFrame.new(19.32757568359375,21.355920791625977,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1626] = {shape="Normal", cframe=CFrame.new(47.11330795288086,6.788966178894043,3.514169216156006,0.8191126585006714,0.5736327171325684,-0.00002110004425048828,0.00002110004425048828,-0.00006699562072753906,-0.9999999403953552,-0.5736327171325684,0.8191125988960266,-0.00006699562072753906)},
    [1630] = {shape="Normal", cframe=CFrame.new(47.41161346435547,6.122447490692139,3.4509084224700928,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1197] = {shape="Normal", cframe=CFrame.new(-65.34130859375,15.012592315673828,-10.273162841796875,0,0,-1,0,1,0,1,0,0)},
    [1230] = {shape="Normal", cframe=CFrame.new(122.279541015625,21.355920791625977,-1.106719970703125,0,0,-1,0,1,0,1,0,0)},
    [1151] = {shape="Normal", cframe=CFrame.new(92.65667724609375,7.40057373046875,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1136] = {shape="Normal", cframe=CFrame.new(-65.34130859375,7.40057373046875,14.039154052734375,0,0,-1,0,1,0,1,0,0)},
    [1405] = {shape="Normal", cframe=CFrame.new(47.321685791015625,4.941808700561523,-1.2252233028411865,0.43834662437438965,0,0.8988060355186462,0,1,0,-0.8988060355186462,0,0.43834662437438965)},
    [1220] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,7.40057373046875,-41.49656677246094,0,0,1,0,1,-0,-1,0,0)},
    [1491] = {shape="Normal", cframe=CFrame.new(56.598793029785156,6.739952564239502,-2.742276668548584,-0.6607323884963989,-0.3431711792945862,0.6675829291343689,-0.31046295166015625,0.9346747994422913,0.17319297790527344,-0.683407723903656,-0.09282555431127548,-0.724111795425415)},
    [1625] = {shape="Normal", cframe=CFrame.new(57.390594482421875,7.157993316650391,-6.806858062744141,0.8191126585006714,0.5736327171325684,-0.00002110004425048828,0.00002110004425048828,-0.00006699562072753906,-0.9999999403953552,-0.5736327171325684,0.8191125988960266,-0.00006699562072753906)},
    [1623] = {shape="Normal", cframe=CFrame.new(57.11419677734375,7.045738220214844,-6.467689037322998,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1622] = {shape="Normal", cframe=CFrame.new(52.413597106933594,7.757994651794434,12.858787536621094,-0.5736696720123291,0.8190867304801941,0.000018537044525146484,0.000018537044525146484,0.000035643577575683594,-1,-0.8190867304801941,-0.5736696720123291,-0.000035643577575683594)},
    [1121] = {shape="Normal", cframe=CFrame.new(122.490966796875,10.572254180908203,-62.42698669433594,0,0,1,0,1,-0,-1,0,0)},
    [1621] = {shape="Normal", cframe=CFrame.new(61.494869232177734,6.222386360168457,-9.794319152832031,0.773344874382019,-0.35844534635543823,0.5229289531707764,0.017342299222946167,0.8364794254302979,0.5477238893508911,-0.6337484121322632,-0.41451069712638855,0.6531033515930176)},
    [1411] = {shape="Normal", cframe=CFrame.new(55.7160758972168,5.553820610046387,3.596014976501465,-0.39071834087371826,0,0.9205106496810913,0,1,0,-0.9205106496810913,0,-0.39071834087371826)},
    [1583] = {shape="Normal", cframe=CFrame.new(66.750244140625,9.853815078735352,-6.5653767585754395,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1553] = {shape="Normal", cframe=CFrame.new(59.229339599609375,11.293488502502441,7.948550701141357,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1617] = {shape="Normal", cframe=CFrame.new(56.99925231933594,6.4844584465026855,-6.387205123901367,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1619] = {shape="Normal", cframe=CFrame.new(57.09855270385742,7.460953712463379,-6.490322589874268,0.818775475025177,-0.0015491180820390582,0.5741117596626282,0.0007063756347633898,0.9999983310699463,0.0016908770194277167,-0.5741134285926819,-0.000978910131379962,0.8187751770019531)},
    [1278] = {shape="Normal", cframe=CFrame.new(56.0408935546875,21.355920791625977,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1614] = {shape="Normal", cframe=CFrame.new(52.89649200439453,7.750977516174316,13.548442840576172,-0.5736696720123291,0.8190867304801941,0.000018537044525146484,0.000018537044525146484,0.000035643577575683594,-1,-0.8190867304801941,-0.5736696720123291,-0.000035643577575683594)},
    [1254] = {shape="Normal", cframe=CFrame.new(-48.1195068359375,15.012592315673828,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1259] = {shape="Normal", cframe=CFrame.new(122.490966796875,7.40057373046875,-37.722564697265625,0,0,-1,0,1,0,1,0,0)},
    [1449] = {shape="Normal", cframe=CFrame.new(58.24840545654297,5.79818058013916,-17.21677017211914,0.32556962966918945,0.22877708077430725,-0.9174232482910156,-0.000010050833225250244,0.9702872037887573,0.24195615947246552,0.9455180168151855,-0.07876436412334442,0.3158983588218689)},
    [1458] = {shape="Normal", cframe=CFrame.new(61.62351608276367,5.818290710449219,-12.498432159423828,0.661146879196167,0.3430902659893036,-0.667213499546051,-0.3104688227176666,0.9347096085548401,0.1729944795370102,0.6830036044120789,0.09277422726154327,0.7244992256164551)},
    [1453] = {shape="Normal", cframe=CFrame.new(57.17033386230469,5.818290710449219,-10.106653213500977,-0.44723010063171387,-0.304149866104126,0.8411172032356262,-0.3104574680328369,0.9347260594367981,0.17292585968971252,-0.8388095498085022,-0.18379345536231995,-0.5124632120132446)},
    [1106] = {shape="Normal", cframe=CFrame.new(-41.2083740234375,10.572254180908203,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1323] = {shape="Normal", cframe=CFrame.new(110.968994140625,4.839809417724609,-35.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1082] = {shape="Normal", cframe=CFrame.new(-65.552734375,10.572254180908203,25.950531005859375,0,0,-1,0,1,0,1,0,0)},
    [1429] = {shape="Normal", cframe=CFrame.new(48.727088928222656,4.855051517486572,-5.040302753448486,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1452] = {shape="Normal", cframe=CFrame.new(56.42780303955078,5.818290710449219,-16.832427978515625,-0.9504737854003906,-0.30816182494163513,-0.04045402631163597,-0.3104194104671478,0.9347280263900757,0.17298361659049988,-0.015493431128561497,0.17697405815124512,-0.9840939044952393)},
    [1505] = {shape="Normal", cframe=CFrame.new(52.06553268432617,6.738575458526611,3.2782106399536133,0.23970115184783936,-0.6718327403068542,0.7008453607559204,0.07599055767059326,0.7326594591140747,0.676339864730835,-0.9678682088851929,-0.10886183381080627,0.22667229175567627)},
    [1611] = {shape="Normal", cframe=CFrame.new(52.01675033569336,6.295982360839844,-11.879419326782227,0.17369365692138672,0.9847997426986694,0.00007420778274536133,0.000019282102584838867,0.00007200241088867188,-1,-0.9847997426986694,0.1736937165260315,-0.0000064373016357421875)},
    [1172] = {shape="Normal", cframe=CFrame.new(-60.0308837890625,10.572254180908203,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
    [1608] = {shape="Normal", cframe=CFrame.new(63.574737548828125,11.293488502502441,-6.575825214385986,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1606] = {shape="Normal", cframe=CFrame.new(66.757568359375,11.293488502502441,-9.615493774414062,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1244] = {shape="Normal", cframe=CFrame.new(117.36114501953125,10.572254180908203,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1409] = {shape="Normal", cframe=CFrame.new(47.80076599121094,5.041808605194092,0.4387085437774658,0.10454308986663818,0,0.9945204257965088,0,1,0,-0.9945204257965088,0,0.10454308986663818)},
    [1478] = {shape="Normal", cframe=CFrame.new(55.52691650390625,6.738872528076172,5.443572521209717,0.9362917542457581,0.33203601837158203,-0.11449800431728363,-0.31035029888153076,0.9347653985023499,0.17290544509887695,0.1644396036863327,-0.12635546922683716,0.9782606363296509)},
    [1545] = {shape="Normal", cframe=CFrame.new(57.14531326293945,11.293488502502441,8.631820678710938,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1599] = {shape="Normal", cframe=CFrame.new(66.88313293457031,8.653820037841797,-6.61375617980957,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1597] = {shape="Normal", cframe=CFrame.new(63.59891128540039,15.243486404418945,-6.509387493133545,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1365] = {shape="Ball", cframe=CFrame.new(-14.544790267944336,13.188587188720703,0.8985337018966675,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1043] = {shape="Normal", cframe=CFrame.new(50.4691162109375,29.139812469482422,-141.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1241] = {shape="Normal", cframe=CFrame.new(-65.552734375,10.572254180908203,-21.105575561523438,0,0,-1,0,1,0,1,0,0)},
    [1227] = {shape="Normal", cframe=CFrame.new(110.54754638671875,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1589] = {shape="Normal", cframe=CFrame.new(64.69772338867188,15.243486404418945,-8.865787506103516,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1360] = {shape="Normal", cframe=CFrame.new(-17.12944221496582,11.822761535644531,-1.0414525270462036,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1308] = {shape="Normal", cframe=CFrame.new(23.468994140625,10.83980941772461,-156.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1217] = {shape="Normal", cframe=CFrame.new(19.32757568359375,10.572254180908203,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1372] = {shape="Normal", cframe=CFrame.new(-15.228151321411133,13.652029037475586,-0.3854316473007202,0.9961918592453003,0,0.08718843013048172,0,-1,0,0.08718843013048172,0,-0.9961918592453003)},
    [1193] = {shape="Normal", cframe=CFrame.new(122.490966796875,7.40057373046875,-111.8359375,0,0,-1,0,1,0,1,0,0)},
    [1578] = {shape="Normal", cframe=CFrame.new(69.11396026611328,11.293488502502441,-8.516690254211426,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1444] = {shape="Normal", cframe=CFrame.new(61.46117401123047,5.818290710449219,-10.288509368896484,0.7780249118804932,0.14528894424438477,0.6112023591995239,-0.31044116616249084,0.9347212910652161,0.17298083007335663,-0.5461716651916504,-0.3243257999420166,0.7723401188850403)},
    [1585] = {shape="Normal", cframe=CFrame.new(70.11138916015625,11.293488502502441,-6.396515369415283,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1403] = {shape="Normal", cframe=CFrame.new(56.06841278076172,5.341809272766113,-2.1748299598693848,-0.9062966108322144,0,0.4226420819759369,0,1,0,-0.4226420819759369,0,-0.9062966108322144)},
    [1451] = {shape="Normal", cframe=CFrame.new(57.00544738769531,5.818290710449219,-10.837949752807617,0.718156099319458,0.34986501932144165,-0.6015366315841675,-0.3105066418647766,0.9347072839736938,0.17293904721736908,0.6227660179138184,0.06258389353752136,0.7799011468887329)},
    [1094] = {shape="Normal", cframe=CFrame.new(97.3623046875,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1573] = {shape="Normal", cframe=CFrame.new(66.85599517822266,15.243486404418945,-3.5561904907226562,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1098] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,21.355920791625977,-78.50450134277344,0,0,1,0,1,-0,-1,0,0)},
    [1564] = {shape="Normal", cframe=CFrame.new(59.31263732910156,11.403816223144531,11.040918350219727,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1208] = {shape="Normal", cframe=CFrame.new(-35.32635498046875,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1355] = {shape="Normal", cframe=CFrame.new(-15.07935619354248,11.822761535644531,-2.086275815963745,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1562] = {shape="Normal", cframe=CFrame.new(62.583160400390625,11.293488502502441,11.167530059814453,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1560] = {shape="Normal", cframe=CFrame.new(61.46015167236328,15.243486404418945,13.45747184753418,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1509] = {shape="Normal", cframe=CFrame.new(57.99665069580078,6.73997163772583,-0.9411139488220215,-0.15455079078674316,0.678442120552063,-0.7182133793830872,0.07575869560241699,0.7329453825950623,0.6760560274124146,0.9850760102272034,0.05007407069206238,-0.16467523574829102)},
    [1557] = {shape="Normal", cframe=CFrame.new(59.267333984375,13.278812408447266,11.019792556762695,0.9397086501121521,0.3419761061668396,0.00006379187107086182,0.000056430697441101074,0.00003141164779663086,-0.9999999403953552,-0.3419761061668396,0.9397086501121521,0.000010251998901367188)},
    [1432] = {shape="Normal", cframe=CFrame.new(48.727088928222656,5.105051517486572,-5.040302753448486,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1555] = {shape="Normal", cframe=CFrame.new(61.60990905761719,15.243486404418945,9.113792419433594,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1616] = {shape="Normal", cframe=CFrame.new(57.22914123535156,6.4844584465026855,-6.548173904418945,0.8191556930541992,0,0.5735712647438049,0,1,0,-0.5735712647438049,0,0.8191556930541992)},
    [1551] = {shape="Normal", cframe=CFrame.new(56.070682525634766,15.243486404418945,11.054656982421875,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1256] = {shape="Normal", cframe=CFrame.new(-65.552734375,10.572254180908203,25.950531005859375,0,0,-1,0,1,0,1,0,0)},
    [1447] = {shape="Normal", cframe=CFrame.new(55.23966598510742,5.803123474121094,-15.58812141418457,0.0020331740379333496,0.6780381202697754,-0.7350240349769592,0.07589176297187805,0.732801079750061,0.6761974096298218,0.9971140027046204,-0.05715712904930115,-0.04996752738952637)},
    [1402] = {shape="Normal", cframe=CFrame.new(57.917022705078125,5.041808605194092,-10.537612915039062,0.9135497212409973,0,0.40672704577445984,0,1,0,-0.40672704577445984,0,0.9135497212409973)},
    [1604] = {shape="Normal", cframe=CFrame.new(69.13813781738281,15.243486404418945,-8.4502534866333,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1229] = {shape="Normal", cframe=CFrame.new(122.279541015625,10.572254180908203,-1.106719970703125,0,0,-1,0,1,0,1,0,0)},
    [1125] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,21.355920791625977,-115.60993957519531,0,0,-1,0,1,0,1,0,0)},
    [1303] = {shape="Normal", cframe=CFrame.new(31.968994140625,3.8398094177246094,-0.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1534] = {shape="Normal", cframe=CFrame.new(59.25351333618164,15.243486404418945,8.01498794555664,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1533] = {shape="Normal", cframe=CFrame.new(59.35490036010742,10.853816986083984,10.950288772583008,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1497] = {shape="Normal", cframe=CFrame.new(51.827735900878906,6.718892574310303,-0.6423603296279907,-0.9986531734466553,0.012441502884030342,-0.05037660151720047,-0.00010783085599541664,0.970331072807312,0.24178017675876617,0.051890090107917786,0.2414598912000656,-0.9690228700637817)},
    [1475] = {shape="Normal", cframe=CFrame.new(50.26051330566406,6.718892574310303,-1.178870439529419,-0.374153733253479,-0.22426758706569672,0.8998408317565918,-0.00015626847743988037,0.9703332185745239,0.24177148938179016,-0.9273669719696045,0.09031903743743896,-0.36308884620666504)},
    [1031] = {shape="Normal", cframe=CFrame.new(50.4691162109375,34.139808654785156,-129.52249145507812,1,0,0,0,1,0,0,0,1)},
    [1529] = {shape="Normal", cframe=CFrame.new(61.435977935791016,11.293488502502441,13.391035079956055,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1527] = {shape="Normal", cframe=CFrame.new(59.303592681884766,11.293488502502441,13.94141960144043,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1349] = {shape="Spawn", cframe=CFrame.new(22,4.5,-37,1,0,0,0,1,0,0,0,1)},
    [1115] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,7.40057373046875,-66.59318542480469,0,0,1,0,1,-0,-1,0,0)},
    [1524] = {shape="Normal", cframe=CFrame.new(64.05001831054688,12.528816223144531,2.3486108779907227,0.42256319522857666,-0.9063334465026855,-9.834766387939453e-07,-9.834766387939453e-07,-0.0000015497207641601562,1,-0.9063334465026855,-0.42256319522857666,-0.0000015497207641601562)},
    [1085] = {shape="Normal", cframe=CFrame.new(122.490966796875,10.572254180908203,11.294219970703125,0,0,1,0,1,-0,-1,0,0)},
    [1523] = {shape="Normal", cframe=CFrame.new(64.13097381591797,11.303820610046387,2.364305019378662,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1086] = {shape="Normal", cframe=CFrame.new(122.490966796875,21.355920791625977,11.294219970703125,0,0,1,0,1,-0,-1,0,0)},
    [1522] = {shape="Normal", cframe=CFrame.new(64.1098403930664,11.753816604614258,2.409623146057129,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1517] = {shape="Normal", cframe=CFrame.new(57.762393951416016,6.739841461181641,-0.1761956810951233,-0.1969684362411499,0.1146257221698761,-0.9736859798431396,-0.310540109872818,0.9347113370895386,0.1728571057319641,0.9299291372299194,0.33641594648361206,-0.1485128402709961)},
    [1507] = {shape="Normal", cframe=CFrame.new(57.418357849121094,6.739717483520508,0.48985755443573,-0.1493234634399414,-0.22781133651733398,0.962187647819519,-0.310364305973053,0.9347171187400818,0.1731414943933487,-0.9388169050216675,-0.2727745771408081,-0.2102797031402588)},
    [1634] = {shape="Normal", cframe=CFrame.new(52.672271728515625,7.084458351135254,13.020242691040039,-0.5735992193222046,0,0.8191365599632263,0,1,0,-0.8191365599632263,0,-0.5735992193222046)},
    [1513] = {shape="Normal", cframe=CFrame.new(57.60492706298828,6.71945858001709,2.0782628059387207,0.08761215209960938,-0.24115365743637085,0.9665243029594421,0.00007440149784088135,0.9702567458152771,0.24207821488380432,-0.9961547255516052,-0.021137095987796783,0.08502417802810669)},
    [1164] = {shape="Normal", cframe=CFrame.new(-35.32635498046875,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1490] = {shape="Normal", cframe=CFrame.new(52.188995361328125,6.71898078918457,-0.3823734521865845,0.9924931526184082,0.02951269969344139,-0.11868611723184586,0.00009490083903074265,0.9702611565589905,0.24206046760082245,0.1223003938794136,-0.24025462567806244,0.9629747271537781)},
    [1170] = {shape="Normal", cframe=CFrame.new(122.279541015625,21.355920791625977,-99.92457580566406,0,0,-1,0,1,0,1,0,0)},
    [1510] = {shape="Normal", cframe=CFrame.new(56.092384338378906,6.718780517578125,6.050309181213379,0.5881736278533936,-0.1957356333732605,0.7846906185150146,0.00017855316400527954,0.9703009128570557,0.24190101027488708,-0.808734655380249,-0.14213967323303223,0.5707403421401978)},
    [1503] = {shape="Normal", cframe=CFrame.new(57.66270065307617,6.71987247467041,-1.54811429977417,-0.4996495246887207,-0.20976758003234863,0.8404450416564941,-0.00004245340824127197,0.9702417254447937,0.24213843047618866,-0.8662276268005371,0.1209486871957779,-0.48478972911834717)},
    [1109] = {shape="Normal", cframe=CFrame.new(-11.0140380859375,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1415] = {shape="Normal", cframe=CFrame.new(60.18994140625,5.153820514678955,-11.558452606201172,0.7880168557167053,-0,-0.6156536936759949,0,1,-0,0.6156536936759949,0,0.7880168557167053)},
    [1377] = {shape="Cylinder", cframe=CFrame.new(-16.41569709777832,13.188587188720703,0.7348466515541077,-0.9961906671524048,0.08720242977142334,0.00000208243727684021,0.00000208243727684021,0.0000476837158203125,-1,-0.08720242977142334,-0.9961906671524048,-0.0000476837158203125)},
    [1221] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,15.012592315673828,-41.49656677246094,0,0,1,0,1,-0,-1,0,0)},
    [1516] = {shape="Normal", cframe=CFrame.new(57.297176361083984,6.719376564025879,2.3998191356658936,-0.2592916488647461,0.23358163237571716,-0.9371272325515747,-0.0001179128885269165,0.9703052043914795,0.24188396334648132,0.96579909324646,0.06282899528741837,-0.25156450271606445)},
    [1506] = {shape="Normal", cframe=CFrame.new(54.17119216918945,6.71898078918457,-1.9776273965835571,0.017962992191314697,-0.24194294214248657,0.9701241850852966,0.00011529773473739624,0.9702812433242798,0.24197997152805328,-0.999838650226593,-0.004234820604324341,0.01745706796646118)},
    [1502] = {shape="Normal", cframe=CFrame.new(53.22570037841797,6.71898078918457,-2.068056106567383,0.978246808052063,-0.05040422081947327,0.20122767984867096,0.0002111140638589859,0.9702734351158142,0.2420111894607544,-0.20744426548480988,-0.23670420050621033,0.9491775631904602)},
    [1386] = {shape="Cylinder", cframe=CFrame.new(-15.281314849853516,14.017847061157227,0.22201046347618103,0.08713138103485107,0,-0.9961968660354614,0,-1,-0,-0.9961968660354614,0,-0.08713150024414062)},
    [1390] = {shape="Normal", cframe=CFrame.new(-15.228160858154297,9.993464469909668,-0.3854248821735382,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1501] = {shape="Normal", cframe=CFrame.new(52.54401397705078,6.718892574310303,-2.4664711952209473,0.9847334623336792,0.0422150082886219,-0.16887256503105164,-0.00011924281716346741,0.9703100919723511,0.2418641895055771,0.17406904697418213,-0.23815162479877472,0.9555018544197083)},
    [1154] = {shape="Normal", cframe=CFrame.new(-65.34130859375,7.40057373046875,-33.01695251464844,0,0,-1,0,1,0,1,0,0)},
    [1500] = {shape="Normal", cframe=CFrame.new(50.132301330566406,6.71898078918457,-0.7526371479034424,0.20748823881149292,0.23673754930496216,-0.9491596221923828,0.0001400783658027649,0.9702680110931396,0.2420329749584198,0.978237509727478,-0.05035194754600525,0.20128601789474487)},
    [1130] = {shape="Normal", cframe=CFrame.new(-5.3768310546875,10.572254180908203,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1354] = {shape="Normal", cframe=CFrame.new(-17.668548583984375,12.676389694213867,-0.4765171408653259,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1361] = {shape="Normal", cframe=CFrame.new(-15.35571575164795,12.676389694213867,1.0724226236343384,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1460] = {shape="Normal", cframe=CFrame.new(61.97124481201172,5.818290710449219,-10.994697570800781,-0.43891167640686035,-0.5844208002090454,0.6825017929077148,0.07581451535224915,0.7327798008918762,0.6762291789054871,-0.8953260183334351,0.3485484719276428,-0.27731800079345703)},
    [1462] = {shape="Normal", cframe=CFrame.new(55.86984634399414,5.79818058013916,-12.378459930419922,-0.4226139783859253,-0.21922945976257324,0.8793952465057373,-0.000009372830390930176,0.9703041315078735,0.241888165473938,-0.9063098430633545,0.10221705585718155,-0.4100661277770996)},
    [1266] = {shape="Normal", cframe=CFrame.new(85.450927734375,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1531] = {shape="Normal", cframe=CFrame.new(59.22201156616211,9.853815078735352,10.998666763305664,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1637] = {shape="Normal", cframe=CFrame.new(61.1851806640625,6.689472198486328,-9.938005447387695,0.773344874382019,-0.35844534635543823,0.5229289531707764,0.017342299222946167,0.8364794254302979,0.5477238893508911,-0.6337484121322632,-0.41451069712638855,0.6531033515930176)},
    [1380] = {shape="Normal", cframe=CFrame.new(-15.05810832977295,11.700779914855957,-2.329245090484619,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1387] = {shape="Cylinder", cframe=CFrame.new(-14.544790267944336,12.993461608886719,0.8985337018966675,5.960464477539062e-07,-0.08718785643577576,-0.9961918592453003,-1,-5.960464477539062e-07,-5.662441253662109e-07,-5.662441253662109e-07,0.9961918592453003,-0.0871877670288086)},
    [1493] = {shape="Normal", cframe=CFrame.new(53.95038986206055,6.718892574310303,-1.5911612510681152,0.15597981214523315,0.23879745602607727,-0.95846027135849,-0.0001320764422416687,0.9703419804573059,0.2417362630367279,0.9877602458000183,-0.03757939487695694,0.15138530731201172)},
    [1382] = {shape="Normal", cframe=CFrame.new(-12.809046745300293,12.676389694213867,-0.05136558413505554,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1300] = {shape="Normal", cframe=CFrame.new(-48.531005859375,4.839809417724609,-134.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1459] = {shape="Normal", cframe=CFrame.new(59.065521240234375,5.818290710449219,-15.841926574707031,0.5186454653739929,0.3190838694572449,-0.7932164072990417,-0.3105003833770752,0.9347022175788879,0.17297770082950592,0.7966155409812927,0.15657992660999298,0.5838547348976135)},
    [1488] = {shape="Normal", cframe=CFrame.new(52.365562438964844,6.738698482513428,2.5366196632385254,0.27732419967651367,-0.08514941483736038,0.9569957256317139,-0.3102864623069763,0.9347530007362366,0.17308709025382996,-0.9092929363250732,-0.344944030046463,0.2328088879585266)},
    [1257] = {shape="Normal", cframe=CFrame.new(-65.552734375,21.355920791625977,25.950531005859375,0,0,-1,0,1,0,1,0,0)},
    [1486] = {shape="Normal", cframe=CFrame.new(51.51803970336914,6.718892574310303,-0.8481757640838623,0.8194361925125122,-0.13844040036201477,0.5562002062797546,-0.00017013400793075562,0.970333456993103,0.2417704463005066,-0.5731704831123352,-0.19821009039878845,0.7951027750968933)},
    [1485] = {shape="Normal", cframe=CFrame.new(51.073909759521484,6.71898078918457,-0.87721848487854,-0.9064970016479492,0.1023685559630394,-0.4096151888370514,0.00018790364265441895,0.9702598452568054,0.2420656830072403,0.4222131073474884,0.2193547636270523,-0.8795568943023682)},
    [1149] = {shape="Normal", cframe=CFrame.new(122.279541015625,15.012592315673828,-125.02114868164062,0,0,1,0,1,-0,-1,0,0)},
    [1483] = {shape="Normal", cframe=CFrame.new(58.157470703125,6.71996545791626,-1.7259762287139893,-0.4387904405593872,0.21719838678836823,-0.871944785118103,-0.00020545721054077148,0.9703241586685181,0.2418077290058136,0.8985893726348877,0.1062820628285408,-0.4257242679595947)},
    [1260] = {shape="Normal", cframe=CFrame.new(122.490966796875,15.012592315673828,-37.722564697265625,0,0,-1,0,1,0,1,0,0)},
    [1455] = {shape="Normal", cframe=CFrame.new(54.913475036621094,5.818290710449219,-13.66036605834961,-0.599052906036377,-0.33373934030532837,0.727841854095459,-0.3105278015136719,0.9346882104873657,0.1730041205883026,-0.7380434274673462,-0.12237650901079178,-0.6635631322860718)},
    [1481] = {shape="Normal", cframe=CFrame.new(54.878746032714844,6.724513530731201,-2.703367233276367,-0.7040232419967651,0.519515872001648,-0.4842051863670349,0.07565459609031677,0.732793390750885,0.6762323975563049,0.7061358094215393,0.4394509196281433,-0.555207371711731)},
    [1143] = {shape="Normal", cframe=CFrame.new(67.9522705078125,15.012592315673828,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1476] = {shape="Normal", cframe=CFrame.new(53.598960876464844,6.718514442443848,4.93991756439209,0.913379430770874,0.09832353889942169,-0.3950575590133667,0.00010586529970169067,0.9703393578529358,0.24174681305885315,0.4071093201637268,-0.22084838151931763,0.8862776160240173)},
    [1344] = {shape="Normal", cframe=CFrame.new(-22.531005859375,4.339809417724609,-86.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1110] = {shape="Normal", cframe=CFrame.new(-11.0140380859375,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1091] = {shape="Normal", cframe=CFrame.new(122.279541015625,10.572254180908203,-75.22012329101562,0,0,-1,0,1,0,1,0,0)},
    [1471] = {shape="Normal", cframe=CFrame.new(60.54908752441406,5.79818058013916,-14.137086868286133,-0.6427673101425171,-0.18529999256134033,0.7433128356933594,0.0000254213809967041,0.9702993631362915,0.2419072985649109,-0.7660614252090454,0.15550899505615234,-0.6236720085144043)},
    [1470] = {shape="Normal", cframe=CFrame.new(57.77277755737305,5.79818058013916,-12.99781608581543,-0.3089594841003418,0,0.9510752558708191,0,1,0,-0.9510752558708191,0,-0.3089594841003418)},
    [1468] = {shape="Normal", cframe=CFrame.new(58.68994903564453,5.818290710449219,-16.548282623291016,0.5876901745796204,0.5149846076965332,-0.6240280866622925,0.07585570216178894,0.7328076362609863,0.6761943697929382,0.8055223226547241,-0.44472888112068176,0.3915993571281433)},
    [1467] = {shape="Normal", cframe=CFrame.new(59.29352569580078,5.818290710449219,-15.127777099609375,-0.7696748971939087,-0.3540031909942627,0.5313030481338501,-0.3104906678199768,0.9347028732299805,0.17299175262451172,-0.5578501224517822,-0.031817249953746796,-0.8293319940567017)},
    [1313] = {shape="Normal", cframe=CFrame.new(31.968994140625,3.8398094177246094,-124.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1466] = {shape="Normal", cframe=CFrame.new(55.36084747314453,5.818290710449219,-12.997142791748047,-0.6687039136886597,-0.465755820274353,0.5795745849609375,0.07580798864364624,0.7327213287353516,0.6762932538986206,-0.7396541833877563,0.49617627263069153,-0.4546656608581543)},
    [1265] = {shape="Normal", cframe=CFrame.new(85.450927734375,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1148] = {shape="Normal", cframe=CFrame.new(122.279541015625,7.40057373046875,-125.02114868164062,0,0,1,0,1,-0,-1,0,0)},
    [1397] = {shape="Normal", cframe=CFrame.new(50.208763122558594,8.581242561340332,9.268396377563477,0.40821951627731323,-0.11308973282575607,0.9058518409729004,-0.25886934995651245,0.9372231960296631,0.23366497457027435,-0.8754104375839233,-0.329883873462677,0.3533173203468323)},
    [1095] = {shape="Normal", cframe=CFrame.new(97.3623046875,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1464] = {shape="Normal", cframe=CFrame.new(57.22340774536133,5.818290710449219,-16.748790740966797,-0.9964427947998047,0.08070463687181473,0.024258872494101524,0.07581544667482376,0.7328252792358398,0.6761798858642578,0.036793336272239685,0.6756137609481812,-0.7363371849060059)},
    [1498] = {shape="Normal", cframe=CFrame.new(56.387020111083984,6.739017486572266,5.305271625518799,0.32320457696914673,-0.6597340106964111,0.6784465909004211,0.07594746351242065,0.7326952815055847,0.676305890083313,-0.943276584148407,-0.16705885529518127,0.28691565990448)},
    [1211] = {shape="Normal", cframe=CFrame.new(-17.28826904296875,7.40057373046875,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1461] = {shape="Normal", cframe=CFrame.new(61.12006759643555,5.818290710449219,-13.120140075683594,0.7306042909622192,0.4206640124320984,-0.5378283858299255,0.07586051523685455,0.7327940464019775,0.6762087345123291,0.6785740256309509,-0.5348409414291382,0.5034706592559814)},
    [1457] = {shape="Normal", cframe=CFrame.new(56.44971466064453,5.818290710449219,-11.41342544555664,0.7869498133659363,0.37248003482818604,-0.4919031262397766,0.07581736147403717,0.7328116297721863,0.676194429397583,0.6123412251472473,-0.5694258213043213,0.5484455227851868)},
    [1456] = {shape="Normal", cframe=CFrame.new(60.559059143066406,5.79818058013916,-13.692100524902344,0.5000134110450745,0.20955345034599304,-0.8402820825576782,0.000013068318367004395,0.9702810049057007,0.24198096990585327,0.8660176992416382,-0.12100472301244736,0.4851507544517517)},
    [1311] = {shape="Normal", cframe=CFrame.new(4.468994140625,3.8398094177246094,-40.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1484] = {shape="Normal", cframe=CFrame.new(54.35835647583008,6.708381652832031,5.188149452209473,0.989861786365509,0.02614930085837841,-0.13960599899291992,0.07598692923784256,0.7329190373420715,0.6760588884353638,0.11999836564064026,-0.6798131465911865,0.7235015630722046)},
    [1482] = {shape="Normal", cframe=CFrame.new(55.50603485107422,6.719717502593994,-3.196359872817993,-0.8831839561462402,0.11329380422830582,-0.4551382064819336,-0.000225752592086792,0.9702854156494141,0.2419632226228714,0.4690268635749817,0.21380077302455902,-0.8569149971008301)},
    [1277] = {shape="Normal", cframe=CFrame.new(56.0408935546875,10.572254180908203,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1454] = {shape="Normal", cframe=CFrame.new(61.72403335571289,5.818290710449219,-11.755535125732422,-0.3724874258041382,-0.2870188355445862,0.8825379610061646,-0.3104572892189026,0.9347203969955444,0.17295676469802856,-0.8745681047439575,-0.2095661163330078,-0.43727874755859375)},
    [1450] = {shape="Normal", cframe=CFrame.new(60.45454406738281,5.787954330444336,-9.642349243164062,0.7844775915145874,-0.46243155002593994,0.413221538066864,0.07582171261310577,0.7328369617462158,0.6761664152145386,-0.6155046820640564,-0.4991062581539154,0.6099565029144287)},
    [1142] = {shape="Normal", cframe=CFrame.new(67.9522705078125,7.40057373046875,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1443] = {shape="Normal", cframe=CFrame.new(59.89729690551758,5.818290710449219,-14.602933883666992,-0.8373782634735107,-0.3213515877723694,0.442188560962677,0.07585426419973373,0.7328050136566162,0.6761974096298218,-0.5413351058959961,0.599774956703186,-0.589259147644043)},
    [1543] = {shape="Normal", cframe=CFrame.new(62.60733413696289,15.243486404418945,11.233966827392578,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1235] = {shape="Normal", cframe=CFrame.new(122.490966796875,10.572254180908203,-161.636962890625,0,0,1,0,1,-0,-1,0,0)},
    [1547] = {shape="Normal", cframe=CFrame.new(57.169490814208984,15.243486404418945,8.698257446289062,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1287] = {shape="Normal", cframe=CFrame.new(122.279541015625,21.355920791625977,-25.811203002929688,0,0,-1,0,1,0,1,0,0)},
    [1079] = {shape="Normal", cframe=CFrame.new(39.968994140625,10.83980941772461,17.47735595703125,1,0,0,0,1,0,0,0,1)},
    [1580] = {shape="Normal", cframe=CFrame.new(66.79556274414062,13.278812408447266,-6.544252395629883,0.9397086501121521,0.3419761061668396,0.00006379187107086182,0.000056430697441101074,0.00003141164779663086,-0.9999999403953552,-0.3419761061668396,0.9397086501121521,0.000010251998901367188)},
    [1124] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,10.572254180908203,-115.60993957519531,0,0,-1,0,1,0,1,0,0)},
    [1441] = {shape="Normal", cframe=CFrame.new(55.84099578857422,5.79818058013916,-11.934305191040039,0.5735474824905396,0.19813108444213867,-0.7948506474494934,0.00008303672075271606,0.970295250415802,0.24192383885383606,0.8191724419593811,-0.1388208270072937,0.5564939975738525)},
    [1435] = {shape="Normal", cframe=CFrame.new(48.727088928222656,4.755057334899902,-5.040302753448486,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1262] = {shape="Normal", cframe=CFrame.new(-65.520751953125,10.572254180908203,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1134] = {shape="Normal", cframe=CFrame.new(122.490966796875,15.012592315673828,-87.1314697265625,0,0,-1,0,1,0,1,0,0)},
    [1199] = {shape="Normal", cframe=CFrame.new(85.450927734375,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1187] = {shape="Normal", cframe=CFrame.new(7.416259765625,7.40057373046875,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1176] = {shape="Normal", cframe=CFrame.new(51.482666015625,15.012592315673828,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1133] = {shape="Normal", cframe=CFrame.new(122.490966796875,7.40057373046875,-87.1314697265625,0,0,-1,0,1,0,1,0,0)},
    [1027] = {shape="Normal", cframe=CFrame.new(38.4691162109375,29.139812469482422,-141.02249145507812,0,0,-1,0,1,0,1,0,0)},
    [1100] = {shape="Normal", cframe=CFrame.new(-65.552734375,10.572254180908203,1.6381988525390625,0,0,-1,0,1,0,1,0,0)},
    [1391] = {shape="Normal", cframe=CFrame.new(-15.35571575164795,11.700779914855957,1.0724188089370728,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1251] = {shape="Normal", cframe=CFrame.new(-65.34130859375,15.012592315673828,14.039154052734375,0,0,-1,0,1,0,1,0,0)},
    [1412] = {shape="Normal", cframe=CFrame.new(53.150970458984375,5.653819561004639,11.090208053588867,-0.9396709203720093,0,0.3420807123184204,0,1,0,-0.3420807123184204,0,-0.9396709203720093)},
    [1508] = {shape="Normal", cframe=CFrame.new(57.10196304321289,6.739960670471191,-2.1203317642211914,-0.730309009552002,-0.421018123626709,0.5379528403282166,0.07581008970737457,0.7326814532279968,0.6763362884521484,-0.6788979172706604,0.5347164869308472,-0.5031665563583374)},
    [1200] = {shape="Normal", cframe=CFrame.new(85.450927734375,15.012592315673828,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1366] = {shape="Normal", cframe=CFrame.new(-15.047478675842285,12.676389694213867,-2.4507408142089844,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1424] = {shape="Normal", cframe=CFrame.new(49.95268630981445,5.105051517486572,-7.668603897094727,-0.42259299755096436,0,-0.9063196182250977,0,1,0,0.9063196182250977,0,-0.42259299755096436)},
    [1263] = {shape="Normal", cframe=CFrame.new(-65.520751953125,21.355920791625977,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1253] = {shape="Normal", cframe=CFrame.new(-48.1195068359375,7.40057373046875,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1474] = {shape="Normal", cframe=CFrame.new(52.79947280883789,6.718892574310303,-2.1962649822235107,-0.9273515939712524,0.09041651338338852,-0.3631034195423126,-0.00008402019739151001,0.9703177213668823,0.24183374643325806,0.37419143319129944,0.22429537773132324,-0.8998180627822876)},
    [1272] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,21.355920791625977,-53.40794372558594,0,0,1,0,1,-0,-1,0,0)},
    [1175] = {shape="Normal", cframe=CFrame.new(51.482666015625,7.40057373046875,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1116] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,15.012592315673828,-66.59318542480469,0,0,1,0,1,-0,-1,0,0)},
    [1576] = {shape="Normal", cframe=CFrame.new(64.47543334960938,11.293488502502441,-4.72143030166626,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1101] = {shape="Normal", cframe=CFrame.new(-65.552734375,21.355920791625977,1.6381988525390625,0,0,-1,0,1,0,1,0,0)},
    [1398] = {shape="Normal", cframe=CFrame.new(51.229095458984375,8.84329605102539,10.866222381591797,0.42208003997802734,-0.022148627787828445,0.9062879085540771,0.05237741395831108,0.9986273646354675,0.000011878088116645813,-0.9050441980361938,0.04746400564908981,0.422660768032074)},
    [1214] = {shape="Normal", cframe=CFrame.new(63.883544921875,10.572254180908203,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
    [1157] = {shape="Normal", cframe=CFrame.new(43.247802734375,7.40057373046875,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1587] = {shape="Normal", cframe=CFrame.new(66.83182525634766,11.293488502502441,-3.622626304626465,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1356] = {shape="Normal", cframe=CFrame.new(-15.04216480255127,10.237369537353516,-2.511479139328003,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1161] = {shape="Normal", cframe=CFrame.new(122.279541015625,15.012592315673828,-50.51567077636719,0,0,1,0,1,-0,-1,0,0)},
    [1203] = {shape="Normal", cframe=CFrame.new(-23.41510009765625,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1088] = {shape="Normal", cframe=CFrame.new(-23.41510009765625,10.572254180908203,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1384] = {shape="Normal", cframe=CFrame.new(-14.910050392150879,10.420295715332031,-2.6223344802856445,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1281] = {shape="Normal", cframe=CFrame.new(-53.609375,15.012592315673828,-162.63397216796875,-1,0,0,0,1,0,0,0,-1)},
    [1069] = {shape="Normal", cframe=CFrame.new(44.968994140625,4.839809417724609,-40.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1383] = {shape="Cylinder", cframe=CFrame.new(-15.334458351135254,13.408093452453613,0.8294466137886047,5.960464477539062e-07,-0.08718785643577576,-0.9961918592453003,-1,-5.960464477539062e-07,-5.662441253662109e-07,-5.662441253662109e-07,0.9961918592453003,-0.0871877670288086)},
    [1492] = {shape="Normal", cframe=CFrame.new(52.71894073486328,6.718892574310303,0.3044731616973877,-0.17410433292388916,0.23804429173469543,-0.9555221796035767,-0.00014119595289230347,0.9703359603881836,0.2417605221271515,0.9847272634506226,0.04222647100687027,-0.1689060926437378)},
    [1629] = {shape="Normal", cframe=CFrame.new(61.27784729003906,6.217521667480469,-9.616449356079102,0.773344874382019,-0.35844534635543823,0.5229289531707764,0.017342299222946167,0.8364794254302979,0.5477238893508911,-0.6337484121322632,-0.41451069712638855,0.6531033515930176)},
    [1131] = {shape="Normal", cframe=CFrame.new(-5.3768310546875,21.355920791625977,-162.63397216796875,1,0,0,0,1,0,0,0,1)},
    [1155] = {shape="Normal", cframe=CFrame.new(-65.34130859375,15.012592315673828,-33.01695251464844,0,0,-1,0,1,0,1,0,0)},
    [1274] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,7.40057373046875,-127.52130889892578,0,0,-1,0,1,0,1,0,0)},
    [1226] = {shape="Normal", cframe=CFrame.new(110.54754638671875,7.40057373046875,25.771087646484375,1,0,0,0,1,0,0,0,1)},
    [1212] = {shape="Normal", cframe=CFrame.new(-17.28826904296875,15.012592315673828,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1357] = {shape="Normal", cframe=CFrame.new(-14.910050392150879,11.883708953857422,-2.6223344802856445,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1385] = {shape="Cylinder", cframe=CFrame.new(-16.12413215637207,12.993461608886719,0.7603552937507629,-5.960464477539062e-07,0.08718785643577576,0.9961918592453003,-1,-5.960464477539062e-07,-5.662441253662109e-07,5.662441253662109e-07,-0.9961918592453003,0.08718782663345337)},
    [1363] = {shape="Normal", cframe=CFrame.new(-15.185644149780273,10.969100952148438,-0.8713920712471008,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1362] = {shape="Ball", cframe=CFrame.new(-16.12413215637207,13.188587188720703,0.7603552937507629,0.9961918592453003,-0,-0.08718843013048172,0,1,-0,0.08718843013048172,0,0.9961918592453003)},
    [1049] = {shape="Normal", cframe=CFrame.new(50.4691162109375,39.139808654785156,-129.02249145507812,-1,0,0,0,1,0,0,0,-1)},
    [1054] = {shape="Normal", cframe=CFrame.new(37.9691162109375,48.539825439453125,-129.52249145507812,-1,0,0,0,1,0,0,0,-1)},
    [1358] = {shape="Normal", cframe=CFrame.new(-12.919902801513672,11.700779914855957,-0.18347826600074768,-0.9961918592453003,0,0.08718843013048172,0,1,0,-0.08718843013048172,0,-0.9961918592453003)},
    [1119] = {shape="Normal", cframe=CFrame.new(-66.3370361328125,21.355920791625977,-140.31439208984375,0,0,-1,0,1,0,1,0,0)},
    [1173] = {shape="Normal", cframe=CFrame.new(-60.0308837890625,21.355920791625977,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
    [1499] = {shape="Normal", cframe=CFrame.new(57.289039611816406,6.739396572113037,3.200934648513794,0.03634798526763916,0.6755208373069763,-0.7364444732666016,0.07576465606689453,0.7329477071762085,0.6760528087615967,0.9964630603790283,-0.08036962151527405,-0.024539470672607422)},
    [1284] = {shape="Normal", cframe=CFrame.new(122.45892333984375,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1418] = {shape="Normal", cframe=CFrame.new(63.974849700927734,18.410533905029297,4.433676719665527,0.13853663206100464,0.14192625880241394,-0.9801349639892578,0.11439964175224304,-0.9853465557098389,-0.12651115655899048,-0.9837278127670288,-0.09460065513849258,-0.15274298191070557)},
    [1268] = {shape="Normal", cframe=CFrame.new(122.490966796875,7.40057373046875,-13.018096923828125,0,0,-1,0,1,0,1,0,0)},
    [1122] = {shape="Normal", cframe=CFrame.new(122.490966796875,21.355920791625977,-62.42698669433594,0,0,1,0,1,-0,-1,0,0)},
    [1215] = {shape="Normal", cframe=CFrame.new(63.883544921875,21.355920791625977,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
    [1291] = {shape="Normal", cframe=CFrame.new(0.968994140625,4.339809417724609,-66.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1191] = {shape="Normal", cframe=CFrame.new(80.745361328125,21.355920791625977,-162.84542846679688,-1,0,0,0,1,0,0,0,-1)},
    [1427] = {shape="Normal", cframe=CFrame.new(51.355377197265625,5.105051517486572,-3.8147130012512207,-0.9062966108322144,0,0.4226420819759369,0,1,0,-0.4226420819759369,0,-0.9062966108322144)},
    [1375] = {shape="Cylinder", cframe=CFrame.new(-15.222855567932129,11.152029991149902,-0.4461830258369446,-0.08713150024414062,0,-0.9961968660354614,0,1,0,0.9961968660354614,0,-0.08713150024414062)},
    [1317] = {shape="Normal", cframe=CFrame.new(56.468994140625,4.839809417724609,-92.02264404296875,1,0,0,0,1,0,0,0,1)},
    [1140] = {shape="Normal", cframe=CFrame.new(105.4498291015625,15.012592315673828,-162.84542846679688,1,0,0,0,1,0,0,0,1)},
    [1539] = {shape="Normal", cframe=CFrame.new(59.22201156616211,7.353817462921143,10.998666763305664,0.42259299755096436,0,0.9063196182250977,0,1,0,-0.9063196182250977,0,0.42259299755096436)},
    [1299] = {shape="Normal", cframe=CFrame.new(115.968994140625,10.83980941772461,-64.52264404296875,1,0,0,0,1,0,0,0,1)},
    [1167] = {shape="Normal", cframe=CFrame.new(25.60174560546875,21.355920791625977,25.98260498046875,1,0,0,0,1,0,0,0,1)},
    [1179] = {shape="Normal", cframe=CFrame.new(75.794921875,15.012592315673828,25.98260498046875,-1,0,0,0,1,0,0,0,-1)},
    [1184] = {shape="Normal", cframe=CFrame.new(122.279541015625,7.40057373046875,23.205596923828125,0,0,1,0,1,-0,-1,0,0)},
    [1238] = {shape="Normal", cframe=CFrame.new(-66.1256103515625,7.40057373046875,-152.22576904296875,0,0,-1,0,1,0,1,0,0)},
    [1160] = {shape="Normal", cframe=CFrame.new(122.279541015625,7.40057373046875,-50.51567077636719,0,0,1,0,1,-0,-1,0,0)},
    [1269] = {shape="Normal", cframe=CFrame.new(122.490966796875,15.012592315673828,-13.018096923828125,0,0,-1,0,1,0,1,0,0)},
    [1247] = {shape="Normal", cframe=CFrame.new(122.490966796875,10.572254180908203,-136.93252563476562,0,0,1,0,1,-0,-1,0,0)},
    [1112] = {shape="Normal", cframe=CFrame.new(39.57122802734375,10.572254180908203,25.771087646484375,-1,0,0,0,1,0,0,0,-1)},
}

local pending = 0
for id, def in pairs(partDefs) do
    pending = pending + 1
    task.spawn(function()
        local success, part = pcall(function()
            return endpoint:InvokeServer("CreatePart", def.shape, def.cframe, workspace)
        end)
        if success and part then
            P[id] = part
            syncAnchor(endpoint, part, true)
        end
        pending = pending - 1
    end)
end
while pending > 0 do
    task.wait()
end

local resizeBatch = {}
if P[6] then resizeBatch[#resizeBatch+1] = {Part = P[6], CFrame = P[6].CFrame, Size = Vector3.new(1,1,1)} end
if P[10] then resizeBatch[#resizeBatch+1] = {Part = P[10], CFrame = P[10].CFrame, Size = Vector3.new(4,0.05000000074505806,2)} end
if P[14] then resizeBatch[#resizeBatch+1] = {Part = P[14], CFrame = P[14].CFrame, Size = Vector3.new(4,1,9)} end
if P[16] then resizeBatch[#resizeBatch+1] = {Part = P[16], CFrame = P[16].CFrame, Size = Vector3.new(2,2,2)} end
if P[21] then resizeBatch[#resizeBatch+1] = {Part = P[21], CFrame = P[21].CFrame, Size = Vector3.new(2,2,2)} end
if P[26] then resizeBatch[#resizeBatch+1] = {Part = P[26], CFrame = P[26].CFrame, Size = Vector3.new(2,2,2)} end
if P[31] then resizeBatch[#resizeBatch+1] = {Part = P[31], CFrame = P[31].CFrame, Size = Vector3.new(2,1,6)} end
if P[39] then resizeBatch[#resizeBatch+1] = {Part = P[39], CFrame = P[39].CFrame, Size = Vector3.new(2,2,2)} end
if P[46] then resizeBatch[#resizeBatch+1] = {Part = P[46], CFrame = P[46].CFrame, Size = Vector3.new(0.1159934550523758,4.059770107269287,4.059770107269287)} end
if P[47] then resizeBatch[#resizeBatch+1] = {Part = P[47], CFrame = P[47].CFrame, Size = Vector3.new(0.6959608793258667,0.6959604620933533,0.6959604620933533)} end
if P[48] then resizeBatch[#resizeBatch+1] = {Part = P[48], CFrame = P[48].CFrame, Size = Vector3.new(0.11599372327327728,0.8119539022445679,0.8119539022445679)} end
if P[49] then resizeBatch[#resizeBatch+1] = {Part = P[49], CFrame = P[49].CFrame, Size = Vector3.new(0.1159934550523758,4.175764083862305,4.175764083862305)} end
if P[50] then resizeBatch[#resizeBatch+1] = {Part = P[50], CFrame = P[50].CFrame, Size = Vector3.new(0.1159934550523758,3.7117905616760254,3.7117905616760254)} end
if P[51] then resizeBatch[#resizeBatch+1] = {Part = P[51], CFrame = P[51].CFrame, Size = Vector3.new(0.1159934550523758,4.639737129211426,4.639737129211426)} end
if P[52] then resizeBatch[#resizeBatch+1] = {Part = P[52], CFrame = P[52].CFrame, Size = Vector3.new(3.5957963466644287,0.5799670219421387,0.5799670219421387)} end
if P[53] then resizeBatch[#resizeBatch+1] = {Part = P[53], CFrame = P[53].CFrame, Size = Vector3.new(0.5799674391746521,0.6959604620933533,0.6959604620933533)} end
if P[54] then resizeBatch[#resizeBatch+1] = {Part = P[54], CFrame = P[54].CFrame, Size = Vector3.new(0.11599372327327728,0.8119539022445679,0.8119539022445679)} end
if P[55] then resizeBatch[#resizeBatch+1] = {Part = P[55], CFrame = P[55].CFrame, Size = Vector3.new(0.11599372327327728,0.8119539022445679,0.8119539022445679)} end
if P[57] then resizeBatch[#resizeBatch+1] = {Part = P[57], CFrame = P[57].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,2.087881565093994)} end
if P[58] then resizeBatch[#resizeBatch+1] = {Part = P[58], CFrame = P[58].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[59] then resizeBatch[#resizeBatch+1] = {Part = P[59], CFrame = P[59].CFrame, Size = Vector3.new(2.087881565093994,0.23198680579662323,0.23198680579662323)} end
if P[60] then resizeBatch[#resizeBatch+1] = {Part = P[60], CFrame = P[60].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[61] then resizeBatch[#resizeBatch+1] = {Part = P[61], CFrame = P[61].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[62] then resizeBatch[#resizeBatch+1] = {Part = P[62], CFrame = P[62].CFrame, Size = Vector3.new(2.5518555641174316,0.1275928020477295,2.157477617263794)} end
if P[63] then resizeBatch[#resizeBatch+1] = {Part = P[63], CFrame = P[63].CFrame, Size = Vector3.new(2.575054168701172,0.06959604471921921,1.6703054904937744)} end
if P[64] then resizeBatch[#resizeBatch+1] = {Part = P[64], CFrame = P[64].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,2.087881565093994)} end
if P[65] then resizeBatch[#resizeBatch+1] = {Part = P[65], CFrame = P[65].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[66] then resizeBatch[#resizeBatch+1] = {Part = P[66], CFrame = P[66].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.23198680579662323)} end
if P[67] then resizeBatch[#resizeBatch+1] = {Part = P[67], CFrame = P[67].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.23198680579662323)} end
if P[68] then resizeBatch[#resizeBatch+1] = {Part = P[68], CFrame = P[68].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[69] then resizeBatch[#resizeBatch+1] = {Part = P[69], CFrame = P[69].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.33638086915016174)} end
if P[70] then resizeBatch[#resizeBatch+1] = {Part = P[70], CFrame = P[70].CFrame, Size = Vector3.new(2.5518555641174316,0.1275928020477295,2.157477617263794)} end
if P[71] then resizeBatch[#resizeBatch+1] = {Part = P[71], CFrame = P[71].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.23198680579662323)} end
if P[72] then resizeBatch[#resizeBatch+1] = {Part = P[72], CFrame = P[72].CFrame, Size = Vector3.new(2.575054168701172,0.06959604471921921,1.6703054904937744)} end
if P[73] then resizeBatch[#resizeBatch+1] = {Part = P[73], CFrame = P[73].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[74] then resizeBatch[#resizeBatch+1] = {Part = P[74], CFrame = P[74].CFrame, Size = Vector3.new(2.087881565093994,0.23198680579662323,0.23198680579662323)} end
if P[75] then resizeBatch[#resizeBatch+1] = {Part = P[75], CFrame = P[75].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.33638086915016174)} end
if P[76] then resizeBatch[#resizeBatch+1] = {Part = P[76], CFrame = P[76].CFrame, Size = Vector3.new(2.087881565093994,0.23198680579662323,0.23198680579662323)} end
if P[77] then resizeBatch[#resizeBatch+1] = {Part = P[77], CFrame = P[77].CFrame, Size = Vector3.new(2.087881565093994,0.23198680579662323,0.23198680579662323)} end
if P[78] then resizeBatch[#resizeBatch+1] = {Part = P[78], CFrame = P[78].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[79] then resizeBatch[#resizeBatch+1] = {Part = P[79], CFrame = P[79].CFrame, Size = Vector3.new(1.855894684791565,0.23198680579662323,0.23198680579662323)} end
if P[80] then resizeBatch[#resizeBatch+1] = {Part = P[80], CFrame = P[80].CFrame, Size = Vector3.new(2.5518555641174316,0.1159934550523758,0.23198680579662323)} end
if P[81] then resizeBatch[#resizeBatch+1] = {Part = P[81], CFrame = P[81].CFrame, Size = Vector3.new(22,13,0.0010000000474974513)} end
if P[84] then resizeBatch[#resizeBatch+1] = {Part = P[84], CFrame = P[84].CFrame, Size = Vector3.new(36,2,13)} end
if P[88] then resizeBatch[#resizeBatch+1] = {Part = P[88], CFrame = P[88].CFrame, Size = Vector3.new(5.999999523162842,15,191)} end
if P[89] then resizeBatch[#resizeBatch+1] = {Part = P[89], CFrame = P[89].CFrame, Size = Vector3.new(14,1,17)} end
if P[92] then resizeBatch[#resizeBatch+1] = {Part = P[92], CFrame = P[92].CFrame, Size = Vector3.new(36,2,1)} end
if P[93] then resizeBatch[#resizeBatch+1] = {Part = P[93], CFrame = P[93].CFrame, Size = Vector3.new(57,2,1)} end
if P[97] then resizeBatch[#resizeBatch+1] = {Part = P[97], CFrame = P[97].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[98] then resizeBatch[#resizeBatch+1] = {Part = P[98], CFrame = P[98].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[99] then resizeBatch[#resizeBatch+1] = {Part = P[99], CFrame = P[99].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[100] then resizeBatch[#resizeBatch+1] = {Part = P[100], CFrame = P[100].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[101] then resizeBatch[#resizeBatch+1] = {Part = P[101], CFrame = P[101].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[102] then resizeBatch[#resizeBatch+1] = {Part = P[102], CFrame = P[102].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[103] then resizeBatch[#resizeBatch+1] = {Part = P[103], CFrame = P[103].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[104] then resizeBatch[#resizeBatch+1] = {Part = P[104], CFrame = P[104].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[105] then resizeBatch[#resizeBatch+1] = {Part = P[105], CFrame = P[105].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[107] then resizeBatch[#resizeBatch+1] = {Part = P[107], CFrame = P[107].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[108] then resizeBatch[#resizeBatch+1] = {Part = P[108], CFrame = P[108].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[109] then resizeBatch[#resizeBatch+1] = {Part = P[109], CFrame = P[109].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[110] then resizeBatch[#resizeBatch+1] = {Part = P[110], CFrame = P[110].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[111] then resizeBatch[#resizeBatch+1] = {Part = P[111], CFrame = P[111].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[112] then resizeBatch[#resizeBatch+1] = {Part = P[112], CFrame = P[112].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[113] then resizeBatch[#resizeBatch+1] = {Part = P[113], CFrame = P[113].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[114] then resizeBatch[#resizeBatch+1] = {Part = P[114], CFrame = P[114].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[115] then resizeBatch[#resizeBatch+1] = {Part = P[115], CFrame = P[115].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[116] then resizeBatch[#resizeBatch+1] = {Part = P[116], CFrame = P[116].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[117] then resizeBatch[#resizeBatch+1] = {Part = P[117], CFrame = P[117].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[118] then resizeBatch[#resizeBatch+1] = {Part = P[118], CFrame = P[118].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[119] then resizeBatch[#resizeBatch+1] = {Part = P[119], CFrame = P[119].CFrame, Size = Vector3.new(64,1.2000000476837158,64)} end
if P[123] then resizeBatch[#resizeBatch+1] = {Part = P[123], CFrame = P[123].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[125] then resizeBatch[#resizeBatch+1] = {Part = P[125], CFrame = P[125].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[126] then resizeBatch[#resizeBatch+1] = {Part = P[126], CFrame = P[126].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[127] then resizeBatch[#resizeBatch+1] = {Part = P[127], CFrame = P[127].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[128] then resizeBatch[#resizeBatch+1] = {Part = P[128], CFrame = P[128].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[129] then resizeBatch[#resizeBatch+1] = {Part = P[129], CFrame = P[129].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[130] then resizeBatch[#resizeBatch+1] = {Part = P[130], CFrame = P[130].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[131] then resizeBatch[#resizeBatch+1] = {Part = P[131], CFrame = P[131].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[132] then resizeBatch[#resizeBatch+1] = {Part = P[132], CFrame = P[132].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[133] then resizeBatch[#resizeBatch+1] = {Part = P[133], CFrame = P[133].CFrame, Size = Vector3.new(6,1.2000000476837158,2)} end
if P[134] then resizeBatch[#resizeBatch+1] = {Part = P[134], CFrame = P[134].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[135] then resizeBatch[#resizeBatch+1] = {Part = P[135], CFrame = P[135].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[136] then resizeBatch[#resizeBatch+1] = {Part = P[136], CFrame = P[136].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[137] then resizeBatch[#resizeBatch+1] = {Part = P[137], CFrame = P[137].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[138] then resizeBatch[#resizeBatch+1] = {Part = P[138], CFrame = P[138].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[139] then resizeBatch[#resizeBatch+1] = {Part = P[139], CFrame = P[139].CFrame, Size = Vector3.new(6,1.2000000476837158,2)} end
if P[140] then resizeBatch[#resizeBatch+1] = {Part = P[140], CFrame = P[140].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[141] then resizeBatch[#resizeBatch+1] = {Part = P[141], CFrame = P[141].CFrame, Size = Vector3.new(2,2.4000000953674316,2)} end
if P[142] then resizeBatch[#resizeBatch+1] = {Part = P[142], CFrame = P[142].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[143] then resizeBatch[#resizeBatch+1] = {Part = P[143], CFrame = P[143].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[144] then resizeBatch[#resizeBatch+1] = {Part = P[144], CFrame = P[144].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[145] then resizeBatch[#resizeBatch+1] = {Part = P[145], CFrame = P[145].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[146] then resizeBatch[#resizeBatch+1] = {Part = P[146], CFrame = P[146].CFrame, Size = Vector3.new(8,1.2000000476837158,2)} end
if P[147] then resizeBatch[#resizeBatch+1] = {Part = P[147], CFrame = P[147].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[148] then resizeBatch[#resizeBatch+1] = {Part = P[148], CFrame = P[148].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[149] then resizeBatch[#resizeBatch+1] = {Part = P[149], CFrame = P[149].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[150] then resizeBatch[#resizeBatch+1] = {Part = P[150], CFrame = P[150].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[151] then resizeBatch[#resizeBatch+1] = {Part = P[151], CFrame = P[151].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[152] then resizeBatch[#resizeBatch+1] = {Part = P[152], CFrame = P[152].CFrame, Size = Vector3.new(6,1.2000000476837158,2)} end
if P[153] then resizeBatch[#resizeBatch+1] = {Part = P[153], CFrame = P[153].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[154] then resizeBatch[#resizeBatch+1] = {Part = P[154], CFrame = P[154].CFrame, Size = Vector3.new(6,1.2000000476837158,2)} end
if P[155] then resizeBatch[#resizeBatch+1] = {Part = P[155], CFrame = P[155].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[156] then resizeBatch[#resizeBatch+1] = {Part = P[156], CFrame = P[156].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[157] then resizeBatch[#resizeBatch+1] = {Part = P[157], CFrame = P[157].CFrame, Size = Vector3.new(12,1.2000000476837158,4)} end
if P[158] then resizeBatch[#resizeBatch+1] = {Part = P[158], CFrame = P[158].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[159] then resizeBatch[#resizeBatch+1] = {Part = P[159], CFrame = P[159].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[161] then resizeBatch[#resizeBatch+1] = {Part = P[161], CFrame = P[161].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[162] then resizeBatch[#resizeBatch+1] = {Part = P[162], CFrame = P[162].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[163] then resizeBatch[#resizeBatch+1] = {Part = P[163], CFrame = P[163].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[164] then resizeBatch[#resizeBatch+1] = {Part = P[164], CFrame = P[164].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[165] then resizeBatch[#resizeBatch+1] = {Part = P[165], CFrame = P[165].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[166] then resizeBatch[#resizeBatch+1] = {Part = P[166], CFrame = P[166].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[167] then resizeBatch[#resizeBatch+1] = {Part = P[167], CFrame = P[167].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[168] then resizeBatch[#resizeBatch+1] = {Part = P[168], CFrame = P[168].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[169] then resizeBatch[#resizeBatch+1] = {Part = P[169], CFrame = P[169].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[170] then resizeBatch[#resizeBatch+1] = {Part = P[170], CFrame = P[170].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[171] then resizeBatch[#resizeBatch+1] = {Part = P[171], CFrame = P[171].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[172] then resizeBatch[#resizeBatch+1] = {Part = P[172], CFrame = P[172].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[173] then resizeBatch[#resizeBatch+1] = {Part = P[173], CFrame = P[173].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[174] then resizeBatch[#resizeBatch+1] = {Part = P[174], CFrame = P[174].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[175] then resizeBatch[#resizeBatch+1] = {Part = P[175], CFrame = P[175].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[176] then resizeBatch[#resizeBatch+1] = {Part = P[176], CFrame = P[176].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[177] then resizeBatch[#resizeBatch+1] = {Part = P[177], CFrame = P[177].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[178] then resizeBatch[#resizeBatch+1] = {Part = P[178], CFrame = P[178].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[179] then resizeBatch[#resizeBatch+1] = {Part = P[179], CFrame = P[179].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[180] then resizeBatch[#resizeBatch+1] = {Part = P[180], CFrame = P[180].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[181] then resizeBatch[#resizeBatch+1] = {Part = P[181], CFrame = P[181].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[182] then resizeBatch[#resizeBatch+1] = {Part = P[182], CFrame = P[182].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[183] then resizeBatch[#resizeBatch+1] = {Part = P[183], CFrame = P[183].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[184] then resizeBatch[#resizeBatch+1] = {Part = P[184], CFrame = P[184].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[185] then resizeBatch[#resizeBatch+1] = {Part = P[185], CFrame = P[185].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[186] then resizeBatch[#resizeBatch+1] = {Part = P[186], CFrame = P[186].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[187] then resizeBatch[#resizeBatch+1] = {Part = P[187], CFrame = P[187].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[188] then resizeBatch[#resizeBatch+1] = {Part = P[188], CFrame = P[188].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[189] then resizeBatch[#resizeBatch+1] = {Part = P[189], CFrame = P[189].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[190] then resizeBatch[#resizeBatch+1] = {Part = P[190], CFrame = P[190].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[191] then resizeBatch[#resizeBatch+1] = {Part = P[191], CFrame = P[191].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[192] then resizeBatch[#resizeBatch+1] = {Part = P[192], CFrame = P[192].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[193] then resizeBatch[#resizeBatch+1] = {Part = P[193], CFrame = P[193].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[194] then resizeBatch[#resizeBatch+1] = {Part = P[194], CFrame = P[194].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[195] then resizeBatch[#resizeBatch+1] = {Part = P[195], CFrame = P[195].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[196] then resizeBatch[#resizeBatch+1] = {Part = P[196], CFrame = P[196].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[197] then resizeBatch[#resizeBatch+1] = {Part = P[197], CFrame = P[197].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[198] then resizeBatch[#resizeBatch+1] = {Part = P[198], CFrame = P[198].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[199] then resizeBatch[#resizeBatch+1] = {Part = P[199], CFrame = P[199].CFrame, Size = Vector3.new(6,1.2000000476837158,2)} end
if P[201] then resizeBatch[#resizeBatch+1] = {Part = P[201], CFrame = P[201].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[202] then resizeBatch[#resizeBatch+1] = {Part = P[202], CFrame = P[202].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[203] then resizeBatch[#resizeBatch+1] = {Part = P[203], CFrame = P[203].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[204] then resizeBatch[#resizeBatch+1] = {Part = P[204], CFrame = P[204].CFrame, Size = Vector3.new(1,8.40000057220459,2)} end
if P[205] then resizeBatch[#resizeBatch+1] = {Part = P[205], CFrame = P[205].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[206] then resizeBatch[#resizeBatch+1] = {Part = P[206], CFrame = P[206].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[207] then resizeBatch[#resizeBatch+1] = {Part = P[207], CFrame = P[207].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[208] then resizeBatch[#resizeBatch+1] = {Part = P[208], CFrame = P[208].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[209] then resizeBatch[#resizeBatch+1] = {Part = P[209], CFrame = P[209].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[210] then resizeBatch[#resizeBatch+1] = {Part = P[210], CFrame = P[210].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[211] then resizeBatch[#resizeBatch+1] = {Part = P[211], CFrame = P[211].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[212] then resizeBatch[#resizeBatch+1] = {Part = P[212], CFrame = P[212].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[213] then resizeBatch[#resizeBatch+1] = {Part = P[213], CFrame = P[213].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[214] then resizeBatch[#resizeBatch+1] = {Part = P[214], CFrame = P[214].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[215] then resizeBatch[#resizeBatch+1] = {Part = P[215], CFrame = P[215].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[216] then resizeBatch[#resizeBatch+1] = {Part = P[216], CFrame = P[216].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[217] then resizeBatch[#resizeBatch+1] = {Part = P[217], CFrame = P[217].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[218] then resizeBatch[#resizeBatch+1] = {Part = P[218], CFrame = P[218].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[219] then resizeBatch[#resizeBatch+1] = {Part = P[219], CFrame = P[219].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[220] then resizeBatch[#resizeBatch+1] = {Part = P[220], CFrame = P[220].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[221] then resizeBatch[#resizeBatch+1] = {Part = P[221], CFrame = P[221].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[222] then resizeBatch[#resizeBatch+1] = {Part = P[222], CFrame = P[222].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[223] then resizeBatch[#resizeBatch+1] = {Part = P[223], CFrame = P[223].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[224] then resizeBatch[#resizeBatch+1] = {Part = P[224], CFrame = P[224].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[225] then resizeBatch[#resizeBatch+1] = {Part = P[225], CFrame = P[225].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[226] then resizeBatch[#resizeBatch+1] = {Part = P[226], CFrame = P[226].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[227] then resizeBatch[#resizeBatch+1] = {Part = P[227], CFrame = P[227].CFrame, Size = Vector3.new(2,2.4000000953674316,1.9999992847442627)} end
if P[230] then resizeBatch[#resizeBatch+1] = {Part = P[230], CFrame = P[230].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[231] then resizeBatch[#resizeBatch+1] = {Part = P[231], CFrame = P[231].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[232] then resizeBatch[#resizeBatch+1] = {Part = P[232], CFrame = P[232].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[233] then resizeBatch[#resizeBatch+1] = {Part = P[233], CFrame = P[233].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[234] then resizeBatch[#resizeBatch+1] = {Part = P[234], CFrame = P[234].CFrame, Size = Vector3.new(3,2.4000000953674316,2)} end
if P[235] then resizeBatch[#resizeBatch+1] = {Part = P[235], CFrame = P[235].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[236] then resizeBatch[#resizeBatch+1] = {Part = P[236], CFrame = P[236].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[237] then resizeBatch[#resizeBatch+1] = {Part = P[237], CFrame = P[237].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[238] then resizeBatch[#resizeBatch+1] = {Part = P[238], CFrame = P[238].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[239] then resizeBatch[#resizeBatch+1] = {Part = P[239], CFrame = P[239].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[240] then resizeBatch[#resizeBatch+1] = {Part = P[240], CFrame = P[240].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[241] then resizeBatch[#resizeBatch+1] = {Part = P[241], CFrame = P[241].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[242] then resizeBatch[#resizeBatch+1] = {Part = P[242], CFrame = P[242].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[243] then resizeBatch[#resizeBatch+1] = {Part = P[243], CFrame = P[243].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[244] then resizeBatch[#resizeBatch+1] = {Part = P[244], CFrame = P[244].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[245] then resizeBatch[#resizeBatch+1] = {Part = P[245], CFrame = P[245].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[246] then resizeBatch[#resizeBatch+1] = {Part = P[246], CFrame = P[246].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[247] then resizeBatch[#resizeBatch+1] = {Part = P[247], CFrame = P[247].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[248] then resizeBatch[#resizeBatch+1] = {Part = P[248], CFrame = P[248].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[249] then resizeBatch[#resizeBatch+1] = {Part = P[249], CFrame = P[249].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[250] then resizeBatch[#resizeBatch+1] = {Part = P[250], CFrame = P[250].CFrame, Size = Vector3.new(12,1.2000000476837158,4)} end
if P[251] then resizeBatch[#resizeBatch+1] = {Part = P[251], CFrame = P[251].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[252] then resizeBatch[#resizeBatch+1] = {Part = P[252], CFrame = P[252].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[253] then resizeBatch[#resizeBatch+1] = {Part = P[253], CFrame = P[253].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[254] then resizeBatch[#resizeBatch+1] = {Part = P[254], CFrame = P[254].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[255] then resizeBatch[#resizeBatch+1] = {Part = P[255], CFrame = P[255].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[256] then resizeBatch[#resizeBatch+1] = {Part = P[256], CFrame = P[256].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[257] then resizeBatch[#resizeBatch+1] = {Part = P[257], CFrame = P[257].CFrame, Size = Vector3.new(2,2.4000000953674316,2)} end
if P[258] then resizeBatch[#resizeBatch+1] = {Part = P[258], CFrame = P[258].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[259] then resizeBatch[#resizeBatch+1] = {Part = P[259], CFrame = P[259].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[260] then resizeBatch[#resizeBatch+1] = {Part = P[260], CFrame = P[260].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[262] then resizeBatch[#resizeBatch+1] = {Part = P[262], CFrame = P[262].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[263] then resizeBatch[#resizeBatch+1] = {Part = P[263], CFrame = P[263].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[264] then resizeBatch[#resizeBatch+1] = {Part = P[264], CFrame = P[264].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[265] then resizeBatch[#resizeBatch+1] = {Part = P[265], CFrame = P[265].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[266] then resizeBatch[#resizeBatch+1] = {Part = P[266], CFrame = P[266].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[267] then resizeBatch[#resizeBatch+1] = {Part = P[267], CFrame = P[267].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[268] then resizeBatch[#resizeBatch+1] = {Part = P[268], CFrame = P[268].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[269] then resizeBatch[#resizeBatch+1] = {Part = P[269], CFrame = P[269].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[270] then resizeBatch[#resizeBatch+1] = {Part = P[270], CFrame = P[270].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[271] then resizeBatch[#resizeBatch+1] = {Part = P[271], CFrame = P[271].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[272] then resizeBatch[#resizeBatch+1] = {Part = P[272], CFrame = P[272].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[273] then resizeBatch[#resizeBatch+1] = {Part = P[273], CFrame = P[273].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[274] then resizeBatch[#resizeBatch+1] = {Part = P[274], CFrame = P[274].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[275] then resizeBatch[#resizeBatch+1] = {Part = P[275], CFrame = P[275].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[276] then resizeBatch[#resizeBatch+1] = {Part = P[276], CFrame = P[276].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[277] then resizeBatch[#resizeBatch+1] = {Part = P[277], CFrame = P[277].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[278] then resizeBatch[#resizeBatch+1] = {Part = P[278], CFrame = P[278].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[279] then resizeBatch[#resizeBatch+1] = {Part = P[279], CFrame = P[279].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[280] then resizeBatch[#resizeBatch+1] = {Part = P[280], CFrame = P[280].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[281] then resizeBatch[#resizeBatch+1] = {Part = P[281], CFrame = P[281].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[282] then resizeBatch[#resizeBatch+1] = {Part = P[282], CFrame = P[282].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[283] then resizeBatch[#resizeBatch+1] = {Part = P[283], CFrame = P[283].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[284] then resizeBatch[#resizeBatch+1] = {Part = P[284], CFrame = P[284].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[285] then resizeBatch[#resizeBatch+1] = {Part = P[285], CFrame = P[285].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[286] then resizeBatch[#resizeBatch+1] = {Part = P[286], CFrame = P[286].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[288] then resizeBatch[#resizeBatch+1] = {Part = P[288], CFrame = P[288].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[289] then resizeBatch[#resizeBatch+1] = {Part = P[289], CFrame = P[289].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[290] then resizeBatch[#resizeBatch+1] = {Part = P[290], CFrame = P[290].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[291] then resizeBatch[#resizeBatch+1] = {Part = P[291], CFrame = P[291].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[292] then resizeBatch[#resizeBatch+1] = {Part = P[292], CFrame = P[292].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[293] then resizeBatch[#resizeBatch+1] = {Part = P[293], CFrame = P[293].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[294] then resizeBatch[#resizeBatch+1] = {Part = P[294], CFrame = P[294].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[295] then resizeBatch[#resizeBatch+1] = {Part = P[295], CFrame = P[295].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[296] then resizeBatch[#resizeBatch+1] = {Part = P[296], CFrame = P[296].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[297] then resizeBatch[#resizeBatch+1] = {Part = P[297], CFrame = P[297].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[298] then resizeBatch[#resizeBatch+1] = {Part = P[298], CFrame = P[298].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[299] then resizeBatch[#resizeBatch+1] = {Part = P[299], CFrame = P[299].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[300] then resizeBatch[#resizeBatch+1] = {Part = P[300], CFrame = P[300].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[301] then resizeBatch[#resizeBatch+1] = {Part = P[301], CFrame = P[301].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[302] then resizeBatch[#resizeBatch+1] = {Part = P[302], CFrame = P[302].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[304] then resizeBatch[#resizeBatch+1] = {Part = P[304], CFrame = P[304].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[305] then resizeBatch[#resizeBatch+1] = {Part = P[305], CFrame = P[305].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[306] then resizeBatch[#resizeBatch+1] = {Part = P[306], CFrame = P[306].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[307] then resizeBatch[#resizeBatch+1] = {Part = P[307], CFrame = P[307].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[308] then resizeBatch[#resizeBatch+1] = {Part = P[308], CFrame = P[308].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[309] then resizeBatch[#resizeBatch+1] = {Part = P[309], CFrame = P[309].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[310] then resizeBatch[#resizeBatch+1] = {Part = P[310], CFrame = P[310].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[311] then resizeBatch[#resizeBatch+1] = {Part = P[311], CFrame = P[311].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[312] then resizeBatch[#resizeBatch+1] = {Part = P[312], CFrame = P[312].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[313] then resizeBatch[#resizeBatch+1] = {Part = P[313], CFrame = P[313].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[314] then resizeBatch[#resizeBatch+1] = {Part = P[314], CFrame = P[314].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[315] then resizeBatch[#resizeBatch+1] = {Part = P[315], CFrame = P[315].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[316] then resizeBatch[#resizeBatch+1] = {Part = P[316], CFrame = P[316].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[317] then resizeBatch[#resizeBatch+1] = {Part = P[317], CFrame = P[317].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[318] then resizeBatch[#resizeBatch+1] = {Part = P[318], CFrame = P[318].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[319] then resizeBatch[#resizeBatch+1] = {Part = P[319], CFrame = P[319].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[320] then resizeBatch[#resizeBatch+1] = {Part = P[320], CFrame = P[320].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[321] then resizeBatch[#resizeBatch+1] = {Part = P[321], CFrame = P[321].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[322] then resizeBatch[#resizeBatch+1] = {Part = P[322], CFrame = P[322].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[323] then resizeBatch[#resizeBatch+1] = {Part = P[323], CFrame = P[323].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[324] then resizeBatch[#resizeBatch+1] = {Part = P[324], CFrame = P[324].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[325] then resizeBatch[#resizeBatch+1] = {Part = P[325], CFrame = P[325].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[326] then resizeBatch[#resizeBatch+1] = {Part = P[326], CFrame = P[326].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[327] then resizeBatch[#resizeBatch+1] = {Part = P[327], CFrame = P[327].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[328] then resizeBatch[#resizeBatch+1] = {Part = P[328], CFrame = P[328].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[329] then resizeBatch[#resizeBatch+1] = {Part = P[329], CFrame = P[329].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[330] then resizeBatch[#resizeBatch+1] = {Part = P[330], CFrame = P[330].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[331] then resizeBatch[#resizeBatch+1] = {Part = P[331], CFrame = P[331].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[332] then resizeBatch[#resizeBatch+1] = {Part = P[332], CFrame = P[332].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[333] then resizeBatch[#resizeBatch+1] = {Part = P[333], CFrame = P[333].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[334] then resizeBatch[#resizeBatch+1] = {Part = P[334], CFrame = P[334].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[335] then resizeBatch[#resizeBatch+1] = {Part = P[335], CFrame = P[335].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[336] then resizeBatch[#resizeBatch+1] = {Part = P[336], CFrame = P[336].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[337] then resizeBatch[#resizeBatch+1] = {Part = P[337], CFrame = P[337].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[338] then resizeBatch[#resizeBatch+1] = {Part = P[338], CFrame = P[338].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[339] then resizeBatch[#resizeBatch+1] = {Part = P[339], CFrame = P[339].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[340] then resizeBatch[#resizeBatch+1] = {Part = P[340], CFrame = P[340].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[341] then resizeBatch[#resizeBatch+1] = {Part = P[341], CFrame = P[341].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[342] then resizeBatch[#resizeBatch+1] = {Part = P[342], CFrame = P[342].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[343] then resizeBatch[#resizeBatch+1] = {Part = P[343], CFrame = P[343].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[344] then resizeBatch[#resizeBatch+1] = {Part = P[344], CFrame = P[344].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[345] then resizeBatch[#resizeBatch+1] = {Part = P[345], CFrame = P[345].CFrame, Size = Vector3.new(56,2.4000000953674316,56)} end
if P[346] then resizeBatch[#resizeBatch+1] = {Part = P[346], CFrame = P[346].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[347] then resizeBatch[#resizeBatch+1] = {Part = P[347], CFrame = P[347].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[348] then resizeBatch[#resizeBatch+1] = {Part = P[348], CFrame = P[348].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[349] then resizeBatch[#resizeBatch+1] = {Part = P[349], CFrame = P[349].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[350] then resizeBatch[#resizeBatch+1] = {Part = P[350], CFrame = P[350].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[351] then resizeBatch[#resizeBatch+1] = {Part = P[351], CFrame = P[351].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[352] then resizeBatch[#resizeBatch+1] = {Part = P[352], CFrame = P[352].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[353] then resizeBatch[#resizeBatch+1] = {Part = P[353], CFrame = P[353].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[354] then resizeBatch[#resizeBatch+1] = {Part = P[354], CFrame = P[354].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[355] then resizeBatch[#resizeBatch+1] = {Part = P[355], CFrame = P[355].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[356] then resizeBatch[#resizeBatch+1] = {Part = P[356], CFrame = P[356].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[357] then resizeBatch[#resizeBatch+1] = {Part = P[357], CFrame = P[357].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[358] then resizeBatch[#resizeBatch+1] = {Part = P[358], CFrame = P[358].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[359] then resizeBatch[#resizeBatch+1] = {Part = P[359], CFrame = P[359].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[360] then resizeBatch[#resizeBatch+1] = {Part = P[360], CFrame = P[360].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[361] then resizeBatch[#resizeBatch+1] = {Part = P[361], CFrame = P[361].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[362] then resizeBatch[#resizeBatch+1] = {Part = P[362], CFrame = P[362].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[363] then resizeBatch[#resizeBatch+1] = {Part = P[363], CFrame = P[363].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[364] then resizeBatch[#resizeBatch+1] = {Part = P[364], CFrame = P[364].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[365] then resizeBatch[#resizeBatch+1] = {Part = P[365], CFrame = P[365].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[366] then resizeBatch[#resizeBatch+1] = {Part = P[366], CFrame = P[366].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[367] then resizeBatch[#resizeBatch+1] = {Part = P[367], CFrame = P[367].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[368] then resizeBatch[#resizeBatch+1] = {Part = P[368], CFrame = P[368].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[369] then resizeBatch[#resizeBatch+1] = {Part = P[369], CFrame = P[369].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[370] then resizeBatch[#resizeBatch+1] = {Part = P[370], CFrame = P[370].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[371] then resizeBatch[#resizeBatch+1] = {Part = P[371], CFrame = P[371].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[373] then resizeBatch[#resizeBatch+1] = {Part = P[373], CFrame = P[373].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[374] then resizeBatch[#resizeBatch+1] = {Part = P[374], CFrame = P[374].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[375] then resizeBatch[#resizeBatch+1] = {Part = P[375], CFrame = P[375].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[376] then resizeBatch[#resizeBatch+1] = {Part = P[376], CFrame = P[376].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[377] then resizeBatch[#resizeBatch+1] = {Part = P[377], CFrame = P[377].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[378] then resizeBatch[#resizeBatch+1] = {Part = P[378], CFrame = P[378].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[379] then resizeBatch[#resizeBatch+1] = {Part = P[379], CFrame = P[379].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[380] then resizeBatch[#resizeBatch+1] = {Part = P[380], CFrame = P[380].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[381] then resizeBatch[#resizeBatch+1] = {Part = P[381], CFrame = P[381].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[382] then resizeBatch[#resizeBatch+1] = {Part = P[382], CFrame = P[382].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[383] then resizeBatch[#resizeBatch+1] = {Part = P[383], CFrame = P[383].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[384] then resizeBatch[#resizeBatch+1] = {Part = P[384], CFrame = P[384].CFrame, Size = Vector3.new(12,1.2000000476837158,8)} end
if P[385] then resizeBatch[#resizeBatch+1] = {Part = P[385], CFrame = P[385].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[388] then resizeBatch[#resizeBatch+1] = {Part = P[388], CFrame = P[388].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[389] then resizeBatch[#resizeBatch+1] = {Part = P[389], CFrame = P[389].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[390] then resizeBatch[#resizeBatch+1] = {Part = P[390], CFrame = P[390].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[391] then resizeBatch[#resizeBatch+1] = {Part = P[391], CFrame = P[391].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[392] then resizeBatch[#resizeBatch+1] = {Part = P[392], CFrame = P[392].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[393] then resizeBatch[#resizeBatch+1] = {Part = P[393], CFrame = P[393].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[394] then resizeBatch[#resizeBatch+1] = {Part = P[394], CFrame = P[394].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[395] then resizeBatch[#resizeBatch+1] = {Part = P[395], CFrame = P[395].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[396] then resizeBatch[#resizeBatch+1] = {Part = P[396], CFrame = P[396].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[397] then resizeBatch[#resizeBatch+1] = {Part = P[397], CFrame = P[397].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[398] then resizeBatch[#resizeBatch+1] = {Part = P[398], CFrame = P[398].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[399] then resizeBatch[#resizeBatch+1] = {Part = P[399], CFrame = P[399].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[400] then resizeBatch[#resizeBatch+1] = {Part = P[400], CFrame = P[400].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[401] then resizeBatch[#resizeBatch+1] = {Part = P[401], CFrame = P[401].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[402] then resizeBatch[#resizeBatch+1] = {Part = P[402], CFrame = P[402].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[403] then resizeBatch[#resizeBatch+1] = {Part = P[403], CFrame = P[403].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[404] then resizeBatch[#resizeBatch+1] = {Part = P[404], CFrame = P[404].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[405] then resizeBatch[#resizeBatch+1] = {Part = P[405], CFrame = P[405].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[406] then resizeBatch[#resizeBatch+1] = {Part = P[406], CFrame = P[406].CFrame, Size = Vector3.new(12,1.2000000476837158,4)} end
if P[407] then resizeBatch[#resizeBatch+1] = {Part = P[407], CFrame = P[407].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[408] then resizeBatch[#resizeBatch+1] = {Part = P[408], CFrame = P[408].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[409] then resizeBatch[#resizeBatch+1] = {Part = P[409], CFrame = P[409].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[410] then resizeBatch[#resizeBatch+1] = {Part = P[410], CFrame = P[410].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[411] then resizeBatch[#resizeBatch+1] = {Part = P[411], CFrame = P[411].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[412] then resizeBatch[#resizeBatch+1] = {Part = P[412], CFrame = P[412].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[413] then resizeBatch[#resizeBatch+1] = {Part = P[413], CFrame = P[413].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[414] then resizeBatch[#resizeBatch+1] = {Part = P[414], CFrame = P[414].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[415] then resizeBatch[#resizeBatch+1] = {Part = P[415], CFrame = P[415].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[416] then resizeBatch[#resizeBatch+1] = {Part = P[416], CFrame = P[416].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[417] then resizeBatch[#resizeBatch+1] = {Part = P[417], CFrame = P[417].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[418] then resizeBatch[#resizeBatch+1] = {Part = P[418], CFrame = P[418].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[419] then resizeBatch[#resizeBatch+1] = {Part = P[419], CFrame = P[419].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[420] then resizeBatch[#resizeBatch+1] = {Part = P[420], CFrame = P[420].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[421] then resizeBatch[#resizeBatch+1] = {Part = P[421], CFrame = P[421].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[422] then resizeBatch[#resizeBatch+1] = {Part = P[422], CFrame = P[422].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[423] then resizeBatch[#resizeBatch+1] = {Part = P[423], CFrame = P[423].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[424] then resizeBatch[#resizeBatch+1] = {Part = P[424], CFrame = P[424].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[425] then resizeBatch[#resizeBatch+1] = {Part = P[425], CFrame = P[425].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[426] then resizeBatch[#resizeBatch+1] = {Part = P[426], CFrame = P[426].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[427] then resizeBatch[#resizeBatch+1] = {Part = P[427], CFrame = P[427].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[428] then resizeBatch[#resizeBatch+1] = {Part = P[428], CFrame = P[428].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[429] then resizeBatch[#resizeBatch+1] = {Part = P[429], CFrame = P[429].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[430] then resizeBatch[#resizeBatch+1] = {Part = P[430], CFrame = P[430].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[431] then resizeBatch[#resizeBatch+1] = {Part = P[431], CFrame = P[431].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[432] then resizeBatch[#resizeBatch+1] = {Part = P[432], CFrame = P[432].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[433] then resizeBatch[#resizeBatch+1] = {Part = P[433], CFrame = P[433].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[434] then resizeBatch[#resizeBatch+1] = {Part = P[434], CFrame = P[434].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[435] then resizeBatch[#resizeBatch+1] = {Part = P[435], CFrame = P[435].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[436] then resizeBatch[#resizeBatch+1] = {Part = P[436], CFrame = P[436].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[437] then resizeBatch[#resizeBatch+1] = {Part = P[437], CFrame = P[437].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[438] then resizeBatch[#resizeBatch+1] = {Part = P[438], CFrame = P[438].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[439] then resizeBatch[#resizeBatch+1] = {Part = P[439], CFrame = P[439].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[440] then resizeBatch[#resizeBatch+1] = {Part = P[440], CFrame = P[440].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[441] then resizeBatch[#resizeBatch+1] = {Part = P[441], CFrame = P[441].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[442] then resizeBatch[#resizeBatch+1] = {Part = P[442], CFrame = P[442].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[443] then resizeBatch[#resizeBatch+1] = {Part = P[443], CFrame = P[443].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[444] then resizeBatch[#resizeBatch+1] = {Part = P[444], CFrame = P[444].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[445] then resizeBatch[#resizeBatch+1] = {Part = P[445], CFrame = P[445].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[446] then resizeBatch[#resizeBatch+1] = {Part = P[446], CFrame = P[446].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[447] then resizeBatch[#resizeBatch+1] = {Part = P[447], CFrame = P[447].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[448] then resizeBatch[#resizeBatch+1] = {Part = P[448], CFrame = P[448].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[449] then resizeBatch[#resizeBatch+1] = {Part = P[449], CFrame = P[449].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[450] then resizeBatch[#resizeBatch+1] = {Part = P[450], CFrame = P[450].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[451] then resizeBatch[#resizeBatch+1] = {Part = P[451], CFrame = P[451].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[452] then resizeBatch[#resizeBatch+1] = {Part = P[452], CFrame = P[452].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[453] then resizeBatch[#resizeBatch+1] = {Part = P[453], CFrame = P[453].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[454] then resizeBatch[#resizeBatch+1] = {Part = P[454], CFrame = P[454].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[455] then resizeBatch[#resizeBatch+1] = {Part = P[455], CFrame = P[455].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[456] then resizeBatch[#resizeBatch+1] = {Part = P[456], CFrame = P[456].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[457] then resizeBatch[#resizeBatch+1] = {Part = P[457], CFrame = P[457].CFrame, Size = Vector3.new(1,8.40000057220459,2)} end
if P[458] then resizeBatch[#resizeBatch+1] = {Part = P[458], CFrame = P[458].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[459] then resizeBatch[#resizeBatch+1] = {Part = P[459], CFrame = P[459].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[460] then resizeBatch[#resizeBatch+1] = {Part = P[460], CFrame = P[460].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[461] then resizeBatch[#resizeBatch+1] = {Part = P[461], CFrame = P[461].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[462] then resizeBatch[#resizeBatch+1] = {Part = P[462], CFrame = P[462].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[463] then resizeBatch[#resizeBatch+1] = {Part = P[463], CFrame = P[463].CFrame, Size = Vector3.new(12,1.2000000476837158,4)} end
if P[464] then resizeBatch[#resizeBatch+1] = {Part = P[464], CFrame = P[464].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[465] then resizeBatch[#resizeBatch+1] = {Part = P[465], CFrame = P[465].CFrame, Size = Vector3.new(6,1.2000000476837158,4)} end
if P[466] then resizeBatch[#resizeBatch+1] = {Part = P[466], CFrame = P[466].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[467] then resizeBatch[#resizeBatch+1] = {Part = P[467], CFrame = P[467].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[468] then resizeBatch[#resizeBatch+1] = {Part = P[468], CFrame = P[468].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[469] then resizeBatch[#resizeBatch+1] = {Part = P[469], CFrame = P[469].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[470] then resizeBatch[#resizeBatch+1] = {Part = P[470], CFrame = P[470].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[471] then resizeBatch[#resizeBatch+1] = {Part = P[471], CFrame = P[471].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[472] then resizeBatch[#resizeBatch+1] = {Part = P[472], CFrame = P[472].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[473] then resizeBatch[#resizeBatch+1] = {Part = P[473], CFrame = P[473].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[474] then resizeBatch[#resizeBatch+1] = {Part = P[474], CFrame = P[474].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[475] then resizeBatch[#resizeBatch+1] = {Part = P[475], CFrame = P[475].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[476] then resizeBatch[#resizeBatch+1] = {Part = P[476], CFrame = P[476].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[477] then resizeBatch[#resizeBatch+1] = {Part = P[477], CFrame = P[477].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[478] then resizeBatch[#resizeBatch+1] = {Part = P[478], CFrame = P[478].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[479] then resizeBatch[#resizeBatch+1] = {Part = P[479], CFrame = P[479].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[480] then resizeBatch[#resizeBatch+1] = {Part = P[480], CFrame = P[480].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[481] then resizeBatch[#resizeBatch+1] = {Part = P[481], CFrame = P[481].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[482] then resizeBatch[#resizeBatch+1] = {Part = P[482], CFrame = P[482].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[483] then resizeBatch[#resizeBatch+1] = {Part = P[483], CFrame = P[483].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[484] then resizeBatch[#resizeBatch+1] = {Part = P[484], CFrame = P[484].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[485] then resizeBatch[#resizeBatch+1] = {Part = P[485], CFrame = P[485].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[486] then resizeBatch[#resizeBatch+1] = {Part = P[486], CFrame = P[486].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[487] then resizeBatch[#resizeBatch+1] = {Part = P[487], CFrame = P[487].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[488] then resizeBatch[#resizeBatch+1] = {Part = P[488], CFrame = P[488].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[489] then resizeBatch[#resizeBatch+1] = {Part = P[489], CFrame = P[489].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[490] then resizeBatch[#resizeBatch+1] = {Part = P[490], CFrame = P[490].CFrame, Size = Vector3.new(2,2.4000000953674316,1.9799991846084595)} end
if P[493] then resizeBatch[#resizeBatch+1] = {Part = P[493], CFrame = P[493].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[494] then resizeBatch[#resizeBatch+1] = {Part = P[494], CFrame = P[494].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[495] then resizeBatch[#resizeBatch+1] = {Part = P[495], CFrame = P[495].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[496] then resizeBatch[#resizeBatch+1] = {Part = P[496], CFrame = P[496].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[497] then resizeBatch[#resizeBatch+1] = {Part = P[497], CFrame = P[497].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[498] then resizeBatch[#resizeBatch+1] = {Part = P[498], CFrame = P[498].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[499] then resizeBatch[#resizeBatch+1] = {Part = P[499], CFrame = P[499].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[500] then resizeBatch[#resizeBatch+1] = {Part = P[500], CFrame = P[500].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[501] then resizeBatch[#resizeBatch+1] = {Part = P[501], CFrame = P[501].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[502] then resizeBatch[#resizeBatch+1] = {Part = P[502], CFrame = P[502].CFrame, Size = Vector3.new(12,1.2000000476837158,4)} end
if P[503] then resizeBatch[#resizeBatch+1] = {Part = P[503], CFrame = P[503].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[504] then resizeBatch[#resizeBatch+1] = {Part = P[504], CFrame = P[504].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[505] then resizeBatch[#resizeBatch+1] = {Part = P[505], CFrame = P[505].CFrame, Size = Vector3.new(12,1.2000000476837158,8)} end
if P[506] then resizeBatch[#resizeBatch+1] = {Part = P[506], CFrame = P[506].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[507] then resizeBatch[#resizeBatch+1] = {Part = P[507], CFrame = P[507].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[508] then resizeBatch[#resizeBatch+1] = {Part = P[508], CFrame = P[508].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[509] then resizeBatch[#resizeBatch+1] = {Part = P[509], CFrame = P[509].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[510] then resizeBatch[#resizeBatch+1] = {Part = P[510], CFrame = P[510].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[511] then resizeBatch[#resizeBatch+1] = {Part = P[511], CFrame = P[511].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[512] then resizeBatch[#resizeBatch+1] = {Part = P[512], CFrame = P[512].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[513] then resizeBatch[#resizeBatch+1] = {Part = P[513], CFrame = P[513].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[514] then resizeBatch[#resizeBatch+1] = {Part = P[514], CFrame = P[514].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[515] then resizeBatch[#resizeBatch+1] = {Part = P[515], CFrame = P[515].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[516] then resizeBatch[#resizeBatch+1] = {Part = P[516], CFrame = P[516].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[517] then resizeBatch[#resizeBatch+1] = {Part = P[517], CFrame = P[517].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[518] then resizeBatch[#resizeBatch+1] = {Part = P[518], CFrame = P[518].CFrame, Size = Vector3.new(8,2.4000000953674316,2)} end
if P[519] then resizeBatch[#resizeBatch+1] = {Part = P[519], CFrame = P[519].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[520] then resizeBatch[#resizeBatch+1] = {Part = P[520], CFrame = P[520].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[521] then resizeBatch[#resizeBatch+1] = {Part = P[521], CFrame = P[521].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[522] then resizeBatch[#resizeBatch+1] = {Part = P[522], CFrame = P[522].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[523] then resizeBatch[#resizeBatch+1] = {Part = P[523], CFrame = P[523].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[524] then resizeBatch[#resizeBatch+1] = {Part = P[524], CFrame = P[524].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[525] then resizeBatch[#resizeBatch+1] = {Part = P[525], CFrame = P[525].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[526] then resizeBatch[#resizeBatch+1] = {Part = P[526], CFrame = P[526].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[527] then resizeBatch[#resizeBatch+1] = {Part = P[527], CFrame = P[527].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[528] then resizeBatch[#resizeBatch+1] = {Part = P[528], CFrame = P[528].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[529] then resizeBatch[#resizeBatch+1] = {Part = P[529], CFrame = P[529].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[530] then resizeBatch[#resizeBatch+1] = {Part = P[530], CFrame = P[530].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[531] then resizeBatch[#resizeBatch+1] = {Part = P[531], CFrame = P[531].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[532] then resizeBatch[#resizeBatch+1] = {Part = P[532], CFrame = P[532].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[533] then resizeBatch[#resizeBatch+1] = {Part = P[533], CFrame = P[533].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[534] then resizeBatch[#resizeBatch+1] = {Part = P[534], CFrame = P[534].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[535] then resizeBatch[#resizeBatch+1] = {Part = P[535], CFrame = P[535].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[536] then resizeBatch[#resizeBatch+1] = {Part = P[536], CFrame = P[536].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[537] then resizeBatch[#resizeBatch+1] = {Part = P[537], CFrame = P[537].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[538] then resizeBatch[#resizeBatch+1] = {Part = P[538], CFrame = P[538].CFrame, Size = Vector3.new(52,1.2000000476837158,52)} end
if P[539] then resizeBatch[#resizeBatch+1] = {Part = P[539], CFrame = P[539].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[540] then resizeBatch[#resizeBatch+1] = {Part = P[540], CFrame = P[540].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[541] then resizeBatch[#resizeBatch+1] = {Part = P[541], CFrame = P[541].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[543] then resizeBatch[#resizeBatch+1] = {Part = P[543], CFrame = P[543].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[544] then resizeBatch[#resizeBatch+1] = {Part = P[544], CFrame = P[544].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[545] then resizeBatch[#resizeBatch+1] = {Part = P[545], CFrame = P[545].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[546] then resizeBatch[#resizeBatch+1] = {Part = P[546], CFrame = P[546].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[547] then resizeBatch[#resizeBatch+1] = {Part = P[547], CFrame = P[547].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[548] then resizeBatch[#resizeBatch+1] = {Part = P[548], CFrame = P[548].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[549] then resizeBatch[#resizeBatch+1] = {Part = P[549], CFrame = P[549].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[550] then resizeBatch[#resizeBatch+1] = {Part = P[550], CFrame = P[550].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[551] then resizeBatch[#resizeBatch+1] = {Part = P[551], CFrame = P[551].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[552] then resizeBatch[#resizeBatch+1] = {Part = P[552], CFrame = P[552].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[553] then resizeBatch[#resizeBatch+1] = {Part = P[553], CFrame = P[553].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[554] then resizeBatch[#resizeBatch+1] = {Part = P[554], CFrame = P[554].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[555] then resizeBatch[#resizeBatch+1] = {Part = P[555], CFrame = P[555].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[556] then resizeBatch[#resizeBatch+1] = {Part = P[556], CFrame = P[556].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[557] then resizeBatch[#resizeBatch+1] = {Part = P[557], CFrame = P[557].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[558] then resizeBatch[#resizeBatch+1] = {Part = P[558], CFrame = P[558].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[559] then resizeBatch[#resizeBatch+1] = {Part = P[559], CFrame = P[559].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[560] then resizeBatch[#resizeBatch+1] = {Part = P[560], CFrame = P[560].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[561] then resizeBatch[#resizeBatch+1] = {Part = P[561], CFrame = P[561].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[562] then resizeBatch[#resizeBatch+1] = {Part = P[562], CFrame = P[562].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[563] then resizeBatch[#resizeBatch+1] = {Part = P[563], CFrame = P[563].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[564] then resizeBatch[#resizeBatch+1] = {Part = P[564], CFrame = P[564].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[565] then resizeBatch[#resizeBatch+1] = {Part = P[565], CFrame = P[565].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[566] then resizeBatch[#resizeBatch+1] = {Part = P[566], CFrame = P[566].CFrame, Size = Vector3.new(12,1.2000000476837158,8)} end
if P[567] then resizeBatch[#resizeBatch+1] = {Part = P[567], CFrame = P[567].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[568] then resizeBatch[#resizeBatch+1] = {Part = P[568], CFrame = P[568].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[569] then resizeBatch[#resizeBatch+1] = {Part = P[569], CFrame = P[569].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[570] then resizeBatch[#resizeBatch+1] = {Part = P[570], CFrame = P[570].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[571] then resizeBatch[#resizeBatch+1] = {Part = P[571], CFrame = P[571].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[572] then resizeBatch[#resizeBatch+1] = {Part = P[572], CFrame = P[572].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[573] then resizeBatch[#resizeBatch+1] = {Part = P[573], CFrame = P[573].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[574] then resizeBatch[#resizeBatch+1] = {Part = P[574], CFrame = P[574].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[575] then resizeBatch[#resizeBatch+1] = {Part = P[575], CFrame = P[575].CFrame, Size = Vector3.new(6,1.2000000476837158,8)} end
if P[576] then resizeBatch[#resizeBatch+1] = {Part = P[576], CFrame = P[576].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[577] then resizeBatch[#resizeBatch+1] = {Part = P[577], CFrame = P[577].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[578] then resizeBatch[#resizeBatch+1] = {Part = P[578], CFrame = P[578].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[579] then resizeBatch[#resizeBatch+1] = {Part = P[579], CFrame = P[579].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[580] then resizeBatch[#resizeBatch+1] = {Part = P[580], CFrame = P[580].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[581] then resizeBatch[#resizeBatch+1] = {Part = P[581], CFrame = P[581].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[582] then resizeBatch[#resizeBatch+1] = {Part = P[582], CFrame = P[582].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[583] then resizeBatch[#resizeBatch+1] = {Part = P[583], CFrame = P[583].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[584] then resizeBatch[#resizeBatch+1] = {Part = P[584], CFrame = P[584].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[585] then resizeBatch[#resizeBatch+1] = {Part = P[585], CFrame = P[585].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[586] then resizeBatch[#resizeBatch+1] = {Part = P[586], CFrame = P[586].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[587] then resizeBatch[#resizeBatch+1] = {Part = P[587], CFrame = P[587].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[588] then resizeBatch[#resizeBatch+1] = {Part = P[588], CFrame = P[588].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[589] then resizeBatch[#resizeBatch+1] = {Part = P[589], CFrame = P[589].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[590] then resizeBatch[#resizeBatch+1] = {Part = P[590], CFrame = P[590].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[591] then resizeBatch[#resizeBatch+1] = {Part = P[591], CFrame = P[591].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[592] then resizeBatch[#resizeBatch+1] = {Part = P[592], CFrame = P[592].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[593] then resizeBatch[#resizeBatch+1] = {Part = P[593], CFrame = P[593].CFrame, Size = Vector3.new(6,1.2000000476837158,8)} end
if P[594] then resizeBatch[#resizeBatch+1] = {Part = P[594], CFrame = P[594].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[595] then resizeBatch[#resizeBatch+1] = {Part = P[595], CFrame = P[595].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[596] then resizeBatch[#resizeBatch+1] = {Part = P[596], CFrame = P[596].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[597] then resizeBatch[#resizeBatch+1] = {Part = P[597], CFrame = P[597].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[598] then resizeBatch[#resizeBatch+1] = {Part = P[598], CFrame = P[598].CFrame, Size = Vector3.new(12,1.2000000476837158,8)} end
if P[599] then resizeBatch[#resizeBatch+1] = {Part = P[599], CFrame = P[599].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[600] then resizeBatch[#resizeBatch+1] = {Part = P[600], CFrame = P[600].CFrame, Size = Vector3.new(6,2.4000000953674316,4)} end
if P[601] then resizeBatch[#resizeBatch+1] = {Part = P[601], CFrame = P[601].CFrame, Size = Vector3.new(10,2.4000000953674316,2)} end
if P[602] then resizeBatch[#resizeBatch+1] = {Part = P[602], CFrame = P[602].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[603] then resizeBatch[#resizeBatch+1] = {Part = P[603], CFrame = P[603].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[604] then resizeBatch[#resizeBatch+1] = {Part = P[604], CFrame = P[604].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[605] then resizeBatch[#resizeBatch+1] = {Part = P[605], CFrame = P[605].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[606] then resizeBatch[#resizeBatch+1] = {Part = P[606], CFrame = P[606].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[607] then resizeBatch[#resizeBatch+1] = {Part = P[607], CFrame = P[607].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[608] then resizeBatch[#resizeBatch+1] = {Part = P[608], CFrame = P[608].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[609] then resizeBatch[#resizeBatch+1] = {Part = P[609], CFrame = P[609].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[610] then resizeBatch[#resizeBatch+1] = {Part = P[610], CFrame = P[610].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[611] then resizeBatch[#resizeBatch+1] = {Part = P[611], CFrame = P[611].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[612] then resizeBatch[#resizeBatch+1] = {Part = P[612], CFrame = P[612].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[613] then resizeBatch[#resizeBatch+1] = {Part = P[613], CFrame = P[613].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[614] then resizeBatch[#resizeBatch+1] = {Part = P[614], CFrame = P[614].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[615] then resizeBatch[#resizeBatch+1] = {Part = P[615], CFrame = P[615].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[616] then resizeBatch[#resizeBatch+1] = {Part = P[616], CFrame = P[616].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[617] then resizeBatch[#resizeBatch+1] = {Part = P[617], CFrame = P[617].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[618] then resizeBatch[#resizeBatch+1] = {Part = P[618], CFrame = P[618].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[619] then resizeBatch[#resizeBatch+1] = {Part = P[619], CFrame = P[619].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[620] then resizeBatch[#resizeBatch+1] = {Part = P[620], CFrame = P[620].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[621] then resizeBatch[#resizeBatch+1] = {Part = P[621], CFrame = P[621].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[622] then resizeBatch[#resizeBatch+1] = {Part = P[622], CFrame = P[622].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[623] then resizeBatch[#resizeBatch+1] = {Part = P[623], CFrame = P[623].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[624] then resizeBatch[#resizeBatch+1] = {Part = P[624], CFrame = P[624].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[625] then resizeBatch[#resizeBatch+1] = {Part = P[625], CFrame = P[625].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[626] then resizeBatch[#resizeBatch+1] = {Part = P[626], CFrame = P[626].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[627] then resizeBatch[#resizeBatch+1] = {Part = P[627], CFrame = P[627].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[628] then resizeBatch[#resizeBatch+1] = {Part = P[628], CFrame = P[628].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[629] then resizeBatch[#resizeBatch+1] = {Part = P[629], CFrame = P[629].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[630] then resizeBatch[#resizeBatch+1] = {Part = P[630], CFrame = P[630].CFrame, Size = Vector3.new(2,2.4000000953674316,1.9899996519088745)} end
if P[633] then resizeBatch[#resizeBatch+1] = {Part = P[633], CFrame = P[633].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[634] then resizeBatch[#resizeBatch+1] = {Part = P[634], CFrame = P[634].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[635] then resizeBatch[#resizeBatch+1] = {Part = P[635], CFrame = P[635].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[636] then resizeBatch[#resizeBatch+1] = {Part = P[636], CFrame = P[636].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[637] then resizeBatch[#resizeBatch+1] = {Part = P[637], CFrame = P[637].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[638] then resizeBatch[#resizeBatch+1] = {Part = P[638], CFrame = P[638].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[639] then resizeBatch[#resizeBatch+1] = {Part = P[639], CFrame = P[639].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[640] then resizeBatch[#resizeBatch+1] = {Part = P[640], CFrame = P[640].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[641] then resizeBatch[#resizeBatch+1] = {Part = P[641], CFrame = P[641].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[642] then resizeBatch[#resizeBatch+1] = {Part = P[642], CFrame = P[642].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[643] then resizeBatch[#resizeBatch+1] = {Part = P[643], CFrame = P[643].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[644] then resizeBatch[#resizeBatch+1] = {Part = P[644], CFrame = P[644].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[645] then resizeBatch[#resizeBatch+1] = {Part = P[645], CFrame = P[645].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[646] then resizeBatch[#resizeBatch+1] = {Part = P[646], CFrame = P[646].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[648] then resizeBatch[#resizeBatch+1] = {Part = P[648], CFrame = P[648].CFrame, Size = Vector3.new(8,1.2000000476837158,3)} end
if P[649] then resizeBatch[#resizeBatch+1] = {Part = P[649], CFrame = P[649].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[650] then resizeBatch[#resizeBatch+1] = {Part = P[650], CFrame = P[650].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[651] then resizeBatch[#resizeBatch+1] = {Part = P[651], CFrame = P[651].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[652] then resizeBatch[#resizeBatch+1] = {Part = P[652], CFrame = P[652].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[653] then resizeBatch[#resizeBatch+1] = {Part = P[653], CFrame = P[653].CFrame, Size = Vector3.new(4,1.2000000476837158,2)} end
if P[654] then resizeBatch[#resizeBatch+1] = {Part = P[654], CFrame = P[654].CFrame, Size = Vector3.new(1,2.4000000953674316,2)} end
if P[655] then resizeBatch[#resizeBatch+1] = {Part = P[655], CFrame = P[655].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[656] then resizeBatch[#resizeBatch+1] = {Part = P[656], CFrame = P[656].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[657] then resizeBatch[#resizeBatch+1] = {Part = P[657], CFrame = P[657].CFrame, Size = Vector3.new(1,4.800000190734863,2)} end
if P[658] then resizeBatch[#resizeBatch+1] = {Part = P[658], CFrame = P[658].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[659] then resizeBatch[#resizeBatch+1] = {Part = P[659], CFrame = P[659].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[660] then resizeBatch[#resizeBatch+1] = {Part = P[660], CFrame = P[660].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[661] then resizeBatch[#resizeBatch+1] = {Part = P[661], CFrame = P[661].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[662] then resizeBatch[#resizeBatch+1] = {Part = P[662], CFrame = P[662].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[663] then resizeBatch[#resizeBatch+1] = {Part = P[663], CFrame = P[663].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[664] then resizeBatch[#resizeBatch+1] = {Part = P[664], CFrame = P[664].CFrame, Size = Vector3.new(4,2.4000000953674316,2)} end
if P[665] then resizeBatch[#resizeBatch+1] = {Part = P[665], CFrame = P[665].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[666] then resizeBatch[#resizeBatch+1] = {Part = P[666], CFrame = P[666].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[667] then resizeBatch[#resizeBatch+1] = {Part = P[667], CFrame = P[667].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[668] then resizeBatch[#resizeBatch+1] = {Part = P[668], CFrame = P[668].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[669] then resizeBatch[#resizeBatch+1] = {Part = P[669], CFrame = P[669].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[670] then resizeBatch[#resizeBatch+1] = {Part = P[670], CFrame = P[670].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[671] then resizeBatch[#resizeBatch+1] = {Part = P[671], CFrame = P[671].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[672] then resizeBatch[#resizeBatch+1] = {Part = P[672], CFrame = P[672].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[673] then resizeBatch[#resizeBatch+1] = {Part = P[673], CFrame = P[673].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[674] then resizeBatch[#resizeBatch+1] = {Part = P[674], CFrame = P[674].CFrame, Size = Vector3.new(2,2.4000000953674316,2)} end
if P[675] then resizeBatch[#resizeBatch+1] = {Part = P[675], CFrame = P[675].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[676] then resizeBatch[#resizeBatch+1] = {Part = P[676], CFrame = P[676].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[677] then resizeBatch[#resizeBatch+1] = {Part = P[677], CFrame = P[677].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[678] then resizeBatch[#resizeBatch+1] = {Part = P[678], CFrame = P[678].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[679] then resizeBatch[#resizeBatch+1] = {Part = P[679], CFrame = P[679].CFrame, Size = Vector3.new(6,2.4000000953674316,2)} end
if P[680] then resizeBatch[#resizeBatch+1] = {Part = P[680], CFrame = P[680].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[681] then resizeBatch[#resizeBatch+1] = {Part = P[681], CFrame = P[681].CFrame, Size = Vector3.new(7,2.4000000953674316,2)} end
if P[682] then resizeBatch[#resizeBatch+1] = {Part = P[682], CFrame = P[682].CFrame, Size = Vector3.new(12,1.2000000476837158,6)} end
if P[683] then resizeBatch[#resizeBatch+1] = {Part = P[683], CFrame = P[683].CFrame, Size = Vector3.new(5,2.4000000953674316,2)} end
if P[684] then resizeBatch[#resizeBatch+1] = {Part = P[684], CFrame = P[684].CFrame, Size = Vector3.new(16,2,1)} end
if P[687] then resizeBatch[#resizeBatch+1] = {Part = P[687], CFrame = P[687].CFrame, Size = Vector3.new(68,1,17)} end
if P[694] then resizeBatch[#resizeBatch+1] = {Part = P[694], CFrame = P[694].CFrame, Size = Vector3.new(49,1,11)} end
if P[699] then resizeBatch[#resizeBatch+1] = {Part = P[699], CFrame = P[699].CFrame, Size = Vector3.new(55,2,1)} end
if P[702] then resizeBatch[#resizeBatch+1] = {Part = P[702], CFrame = P[702].CFrame, Size = Vector3.new(52,2,1)} end
if P[704] then resizeBatch[#resizeBatch+1] = {Part = P[704], CFrame = P[704].CFrame, Size = Vector3.new(15,1,15)} end
if P[712] then resizeBatch[#resizeBatch+1] = {Part = P[712], CFrame = P[712].CFrame, Size = Vector3.new(22,1,8)} end
if P[717] then resizeBatch[#resizeBatch+1] = {Part = P[717], CFrame = P[717].CFrame, Size = Vector3.new(67,1,19)} end
if P[720] then resizeBatch[#resizeBatch+1] = {Part = P[720], CFrame = P[720].CFrame, Size = Vector3.new(54,1,24)} end
if P[726] then resizeBatch[#resizeBatch+1] = {Part = P[726], CFrame = P[726].CFrame, Size = Vector3.new(81,1,11)} end
if P[733] then resizeBatch[#resizeBatch+1] = {Part = P[733], CFrame = P[733].CFrame, Size = Vector3.new(35,1,11)} end
if P[737] then resizeBatch[#resizeBatch+1] = {Part = P[737], CFrame = P[737].CFrame, Size = Vector3.new(121,1,13)} end
if P[739] then resizeBatch[#resizeBatch+1] = {Part = P[739], CFrame = P[739].CFrame, Size = Vector3.new(64,1,17)} end
if P[741] then resizeBatch[#resizeBatch+1] = {Part = P[741], CFrame = P[741].CFrame, Size = Vector3.new(21,2,1)} end
if P[744] then resizeBatch[#resizeBatch+1] = {Part = P[744], CFrame = P[744].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[747] then resizeBatch[#resizeBatch+1] = {Part = P[747], CFrame = P[747].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[749] then resizeBatch[#resizeBatch+1] = {Part = P[749], CFrame = P[749].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[751] then resizeBatch[#resizeBatch+1] = {Part = P[751], CFrame = P[751].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[755] then resizeBatch[#resizeBatch+1] = {Part = P[755], CFrame = P[755].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[758] then resizeBatch[#resizeBatch+1] = {Part = P[758], CFrame = P[758].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[761] then resizeBatch[#resizeBatch+1] = {Part = P[761], CFrame = P[761].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[762] then resizeBatch[#resizeBatch+1] = {Part = P[762], CFrame = P[762].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[766] then resizeBatch[#resizeBatch+1] = {Part = P[766], CFrame = P[766].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[771] then resizeBatch[#resizeBatch+1] = {Part = P[771], CFrame = P[771].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[775] then resizeBatch[#resizeBatch+1] = {Part = P[775], CFrame = P[775].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[776] then resizeBatch[#resizeBatch+1] = {Part = P[776], CFrame = P[776].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[777] then resizeBatch[#resizeBatch+1] = {Part = P[777], CFrame = P[777].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[780] then resizeBatch[#resizeBatch+1] = {Part = P[780], CFrame = P[780].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[783] then resizeBatch[#resizeBatch+1] = {Part = P[783], CFrame = P[783].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[792] then resizeBatch[#resizeBatch+1] = {Part = P[792], CFrame = P[792].CFrame, Size = Vector3.new(2,0.4000000059604645,2)} end
if P[795] then resizeBatch[#resizeBatch+1] = {Part = P[795], CFrame = P[795].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[796] then resizeBatch[#resizeBatch+1] = {Part = P[796], CFrame = P[796].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[801] then resizeBatch[#resizeBatch+1] = {Part = P[801], CFrame = P[801].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[803] then resizeBatch[#resizeBatch+1] = {Part = P[803], CFrame = P[803].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[808] then resizeBatch[#resizeBatch+1] = {Part = P[808], CFrame = P[808].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[811] then resizeBatch[#resizeBatch+1] = {Part = P[811], CFrame = P[811].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[813] then resizeBatch[#resizeBatch+1] = {Part = P[813], CFrame = P[813].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[814] then resizeBatch[#resizeBatch+1] = {Part = P[814], CFrame = P[814].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[815] then resizeBatch[#resizeBatch+1] = {Part = P[815], CFrame = P[815].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[818] then resizeBatch[#resizeBatch+1] = {Part = P[818], CFrame = P[818].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[821] then resizeBatch[#resizeBatch+1] = {Part = P[821], CFrame = P[821].CFrame, Size = Vector3.new(1,0.4000000059604645,1)} end
if P[823] then resizeBatch[#resizeBatch+1] = {Part = P[823], CFrame = P[823].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[824] then resizeBatch[#resizeBatch+1] = {Part = P[824], CFrame = P[824].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[825] then resizeBatch[#resizeBatch+1] = {Part = P[825], CFrame = P[825].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[826] then resizeBatch[#resizeBatch+1] = {Part = P[826], CFrame = P[826].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[828] then resizeBatch[#resizeBatch+1] = {Part = P[828], CFrame = P[828].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[833] then resizeBatch[#resizeBatch+1] = {Part = P[833], CFrame = P[833].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[836] then resizeBatch[#resizeBatch+1] = {Part = P[836], CFrame = P[836].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[837] then resizeBatch[#resizeBatch+1] = {Part = P[837], CFrame = P[837].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[841] then resizeBatch[#resizeBatch+1] = {Part = P[841], CFrame = P[841].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[843] then resizeBatch[#resizeBatch+1] = {Part = P[843], CFrame = P[843].CFrame, Size = Vector3.new(1,0.4000000059604645,1)} end
if P[845] then resizeBatch[#resizeBatch+1] = {Part = P[845], CFrame = P[845].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[847] then resizeBatch[#resizeBatch+1] = {Part = P[847], CFrame = P[847].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[850] then resizeBatch[#resizeBatch+1] = {Part = P[850], CFrame = P[850].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[852] then resizeBatch[#resizeBatch+1] = {Part = P[852], CFrame = P[852].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[854] then resizeBatch[#resizeBatch+1] = {Part = P[854], CFrame = P[854].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[857] then resizeBatch[#resizeBatch+1] = {Part = P[857], CFrame = P[857].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[860] then resizeBatch[#resizeBatch+1] = {Part = P[860], CFrame = P[860].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[863] then resizeBatch[#resizeBatch+1] = {Part = P[863], CFrame = P[863].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[864] then resizeBatch[#resizeBatch+1] = {Part = P[864], CFrame = P[864].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[868] then resizeBatch[#resizeBatch+1] = {Part = P[868], CFrame = P[868].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[871] then resizeBatch[#resizeBatch+1] = {Part = P[871], CFrame = P[871].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[874] then resizeBatch[#resizeBatch+1] = {Part = P[874], CFrame = P[874].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[878] then resizeBatch[#resizeBatch+1] = {Part = P[878], CFrame = P[878].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[879] then resizeBatch[#resizeBatch+1] = {Part = P[879], CFrame = P[879].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[881] then resizeBatch[#resizeBatch+1] = {Part = P[881], CFrame = P[881].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[884] then resizeBatch[#resizeBatch+1] = {Part = P[884], CFrame = P[884].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[886] then resizeBatch[#resizeBatch+1] = {Part = P[886], CFrame = P[886].CFrame, Size = Vector3.new(2,0.4000000059604645,2)} end
if P[888] then resizeBatch[#resizeBatch+1] = {Part = P[888], CFrame = P[888].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[891] then resizeBatch[#resizeBatch+1] = {Part = P[891], CFrame = P[891].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[894] then resizeBatch[#resizeBatch+1] = {Part = P[894], CFrame = P[894].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[895] then resizeBatch[#resizeBatch+1] = {Part = P[895], CFrame = P[895].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[897] then resizeBatch[#resizeBatch+1] = {Part = P[897], CFrame = P[897].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[900] then resizeBatch[#resizeBatch+1] = {Part = P[900], CFrame = P[900].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[904] then resizeBatch[#resizeBatch+1] = {Part = P[904], CFrame = P[904].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[908] then resizeBatch[#resizeBatch+1] = {Part = P[908], CFrame = P[908].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[910] then resizeBatch[#resizeBatch+1] = {Part = P[910], CFrame = P[910].CFrame, Size = Vector3.new(1,0.4000000059604645,12)} end
if P[912] then resizeBatch[#resizeBatch+1] = {Part = P[912], CFrame = P[912].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[915] then resizeBatch[#resizeBatch+1] = {Part = P[915], CFrame = P[915].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[918] then resizeBatch[#resizeBatch+1] = {Part = P[918], CFrame = P[918].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[922] then resizeBatch[#resizeBatch+1] = {Part = P[922], CFrame = P[922].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[925] then resizeBatch[#resizeBatch+1] = {Part = P[925], CFrame = P[925].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[929] then resizeBatch[#resizeBatch+1] = {Part = P[929], CFrame = P[929].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[930] then resizeBatch[#resizeBatch+1] = {Part = P[930], CFrame = P[930].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[934] then resizeBatch[#resizeBatch+1] = {Part = P[934], CFrame = P[934].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[938] then resizeBatch[#resizeBatch+1] = {Part = P[938], CFrame = P[938].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[940] then resizeBatch[#resizeBatch+1] = {Part = P[940], CFrame = P[940].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[942] then resizeBatch[#resizeBatch+1] = {Part = P[942], CFrame = P[942].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[943] then resizeBatch[#resizeBatch+1] = {Part = P[943], CFrame = P[943].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[945] then resizeBatch[#resizeBatch+1] = {Part = P[945], CFrame = P[945].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[946] then resizeBatch[#resizeBatch+1] = {Part = P[946], CFrame = P[946].CFrame, Size = Vector3.new(2,1.2000000476837158,2)} end
if P[947] then resizeBatch[#resizeBatch+1] = {Part = P[947], CFrame = P[947].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[949] then resizeBatch[#resizeBatch+1] = {Part = P[949], CFrame = P[949].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[950] then resizeBatch[#resizeBatch+1] = {Part = P[950], CFrame = P[950].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[951] then resizeBatch[#resizeBatch+1] = {Part = P[951], CFrame = P[951].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[954] then resizeBatch[#resizeBatch+1] = {Part = P[954], CFrame = P[954].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[959] then resizeBatch[#resizeBatch+1] = {Part = P[959], CFrame = P[959].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[961] then resizeBatch[#resizeBatch+1] = {Part = P[961], CFrame = P[961].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[963] then resizeBatch[#resizeBatch+1] = {Part = P[963], CFrame = P[963].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[964] then resizeBatch[#resizeBatch+1] = {Part = P[964], CFrame = P[964].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[965] then resizeBatch[#resizeBatch+1] = {Part = P[965], CFrame = P[965].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[968] then resizeBatch[#resizeBatch+1] = {Part = P[968], CFrame = P[968].CFrame, Size = Vector3.new(1,0.4000000059604645,1)} end
if P[971] then resizeBatch[#resizeBatch+1] = {Part = P[971], CFrame = P[971].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[980] then resizeBatch[#resizeBatch+1] = {Part = P[980], CFrame = P[980].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[983] then resizeBatch[#resizeBatch+1] = {Part = P[983], CFrame = P[983].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[985] then resizeBatch[#resizeBatch+1] = {Part = P[985], CFrame = P[985].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[989] then resizeBatch[#resizeBatch+1] = {Part = P[989], CFrame = P[989].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[991] then resizeBatch[#resizeBatch+1] = {Part = P[991], CFrame = P[991].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[994] then resizeBatch[#resizeBatch+1] = {Part = P[994], CFrame = P[994].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[995] then resizeBatch[#resizeBatch+1] = {Part = P[995], CFrame = P[995].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[996] then resizeBatch[#resizeBatch+1] = {Part = P[996], CFrame = P[996].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[997] then resizeBatch[#resizeBatch+1] = {Part = P[997], CFrame = P[997].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[999] then resizeBatch[#resizeBatch+1] = {Part = P[999], CFrame = P[999].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1004] then resizeBatch[#resizeBatch+1] = {Part = P[1004], CFrame = P[1004].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[1005] then resizeBatch[#resizeBatch+1] = {Part = P[1005], CFrame = P[1005].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[1015] then resizeBatch[#resizeBatch+1] = {Part = P[1015], CFrame = P[1015].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1018] then resizeBatch[#resizeBatch+1] = {Part = P[1018], CFrame = P[1018].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[1021] then resizeBatch[#resizeBatch+1] = {Part = P[1021], CFrame = P[1021].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[1023] then resizeBatch[#resizeBatch+1] = {Part = P[1023], CFrame = P[1023].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1406] then resizeBatch[#resizeBatch+1] = {Part = P[1406], CFrame = P[1406].CFrame, Size = Vector3.new(5.199999809265137,0.7000000476837158,6)} end
if P[1118] then resizeBatch[#resizeBatch+1] = {Part = P[1118], CFrame = P[1118].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1615] then resizeBatch[#resizeBatch+1] = {Part = P[1615], CFrame = P[1615].CFrame, Size = Vector3.new(0.561278760433197,0.5612788200378418,0.3367672562599182)} end
if P[1442] then resizeBatch[#resizeBatch+1] = {Part = P[1442], CFrame = P[1442].CFrame, Size = Vector3.new(1.7000000476837158,1,1)} end
if P[1388] then resizeBatch[#resizeBatch+1] = {Part = P[1388], CFrame = P[1388].CFrame, Size = Vector3.new(4.6341471672058105,1.2195123434066772,0.121951162815094)} end
if P[1334] then resizeBatch[#resizeBatch+1] = {Part = P[1334], CFrame = P[1334].CFrame, Size = Vector3.new(64,1,17)} end
if P[1052] then resizeBatch[#resizeBatch+1] = {Part = P[1052], CFrame = P[1052].CFrame, Size = Vector3.new(1,0.4000000059604645,13)} end
if P[1420] then resizeBatch[#resizeBatch+1] = {Part = P[1420], CFrame = P[1420].CFrame, Size = Vector3.new(0.8300001621246338,1,0.9200000762939453)} end
if P[1196] then resizeBatch[#resizeBatch+1] = {Part = P[1196], CFrame = P[1196].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1202] then resizeBatch[#resizeBatch+1] = {Part = P[1202], CFrame = P[1202].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1061] then resizeBatch[#resizeBatch+1] = {Part = P[1061], CFrame = P[1061].CFrame, Size = Vector3.new(22,2,19)} end
if P[1407] then resizeBatch[#resizeBatch+1] = {Part = P[1407], CFrame = P[1407].CFrame, Size = Vector3.new(32.19999694824219,2.6000001430511475,8.5)} end
if P[1541] then resizeBatch[#resizeBatch+1] = {Part = P[1541], CFrame = P[1541].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1188] then resizeBatch[#resizeBatch+1] = {Part = P[1188], CFrame = P[1188].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1381] then resizeBatch[#resizeBatch+1] = {Part = P[1381], CFrame = P[1381].CFrame, Size = Vector3.new(0.48780331015586853,1.7073173522949219,4.1463422775268555)} end
if P[1271] then resizeBatch[#resizeBatch+1] = {Part = P[1271], CFrame = P[1271].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1378] then resizeBatch[#resizeBatch+1] = {Part = P[1378], CFrame = P[1378].CFrame, Size = Vector3.new(0.24390172958374023,0.24390250444412231,0.24390250444412231)} end
if P[1053] then resizeBatch[#resizeBatch+1] = {Part = P[1053], CFrame = P[1053].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[1097] then resizeBatch[#resizeBatch+1] = {Part = P[1097], CFrame = P[1097].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1351] then resizeBatch[#resizeBatch+1] = {Part = P[1351], CFrame = P[1351].CFrame, Size = Vector3.new(22,13,0.0010000000474974513)} end
if P[1166] then resizeBatch[#resizeBatch+1] = {Part = P[1166], CFrame = P[1166].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1194] then resizeBatch[#resizeBatch+1] = {Part = P[1194], CFrame = P[1194].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1571] then resizeBatch[#resizeBatch+1] = {Part = P[1571], CFrame = P[1571].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1045] then resizeBatch[#resizeBatch+1] = {Part = P[1045], CFrame = P[1045].CFrame, Size = Vector3.new(2,0.4000000059604645,2)} end
if P[1448] then resizeBatch[#resizeBatch+1] = {Part = P[1448], CFrame = P[1448].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1224] then resizeBatch[#resizeBatch+1] = {Part = P[1224], CFrame = P[1224].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1290] then resizeBatch[#resizeBatch+1] = {Part = P[1290], CFrame = P[1290].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1426] then resizeBatch[#resizeBatch+1] = {Part = P[1426], CFrame = P[1426].CFrame, Size = Vector3.new(0.699999988079071,0.7000000476837158,5.5)} end
if P[1613] then resizeBatch[#resizeBatch+1] = {Part = P[1613], CFrame = P[1613].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1369] then resizeBatch[#resizeBatch+1] = {Part = P[1369], CFrame = P[1369].CFrame, Size = Vector3.new(2.7804877758026123,1.9024392366409302,1.0487806797027588)} end
if P[1408] then resizeBatch[#resizeBatch+1] = {Part = P[1408], CFrame = P[1408].CFrame, Size = Vector3.new(11.799999237060547,1.2000000476837158,8.700000762939453)} end
if P[1127] then resizeBatch[#resizeBatch+1] = {Part = P[1127], CFrame = P[1127].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1389] then resizeBatch[#resizeBatch+1] = {Part = P[1389], CFrame = P[1389].CFrame, Size = Vector3.new(0.12195112556219101,0.6097560524940491,0.6097560524940491)} end
if P[1033] then resizeBatch[#resizeBatch+1] = {Part = P[1033], CFrame = P[1033].CFrame, Size = Vector3.new(1,0.4000000059604645,1)} end
if P[1169] then resizeBatch[#resizeBatch+1] = {Part = P[1169], CFrame = P[1169].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1624] then resizeBatch[#resizeBatch+1] = {Part = P[1624], CFrame = P[1624].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1145] then resizeBatch[#resizeBatch+1] = {Part = P[1145], CFrame = P[1145].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1413] then resizeBatch[#resizeBatch+1] = {Part = P[1413], CFrame = P[1413].CFrame, Size = Vector3.new(7.699999809265137,1.6999999284744263,8.899999618530273)} end
if P[1275] then resizeBatch[#resizeBatch+1] = {Part = P[1275], CFrame = P[1275].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1239] then resizeBatch[#resizeBatch+1] = {Part = P[1239], CFrame = P[1239].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1339] then resizeBatch[#resizeBatch+1] = {Part = P[1339], CFrame = P[1339].CFrame, Size = Vector3.new(109,1,17)} end
if P[1044] then resizeBatch[#resizeBatch+1] = {Part = P[1044], CFrame = P[1044].CFrame, Size = Vector3.new(2,1.2000000476837158,4)} end
if P[1627] then resizeBatch[#resizeBatch+1] = {Part = P[1627], CFrame = P[1627].CFrame, Size = Vector3.new(0.561278760433197,0.2806394100189209,0.2806393802165985)} end
if P[1581] then resizeBatch[#resizeBatch+1] = {Part = P[1581], CFrame = P[1581].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1633] then resizeBatch[#resizeBatch+1] = {Part = P[1633], CFrame = P[1633].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1404] then resizeBatch[#resizeBatch+1] = {Part = P[1404], CFrame = P[1404].CFrame, Size = Vector3.new(4.400000095367432,0.699999988079071,6.599999904632568)} end
if P[1479] then resizeBatch[#resizeBatch+1] = {Part = P[1479], CFrame = P[1479].CFrame, Size = Vector3.new(4.099999904632568,0.20000000298023224,5)} end
if P[1113] then resizeBatch[#resizeBatch+1] = {Part = P[1113], CFrame = P[1113].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1232] then resizeBatch[#resizeBatch+1] = {Part = P[1232], CFrame = P[1232].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1089] then resizeBatch[#resizeBatch+1] = {Part = P[1089], CFrame = P[1089].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1103] then resizeBatch[#resizeBatch+1] = {Part = P[1103], CFrame = P[1103].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1595] then resizeBatch[#resizeBatch+1] = {Part = P[1595], CFrame = P[1595].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1392] then resizeBatch[#resizeBatch+1] = {Part = P[1392], CFrame = P[1392].CFrame, Size = Vector3.new(3.658536672592163,1.951219916343689,0.24390240013599396)} end
if P[1223] then resizeBatch[#resizeBatch+1] = {Part = P[1223], CFrame = P[1223].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1250] then resizeBatch[#resizeBatch+1] = {Part = P[1250], CFrame = P[1250].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1618] then resizeBatch[#resizeBatch+1] = {Part = P[1618], CFrame = P[1618].CFrame, Size = Vector3.new(0.561278760433197,0.5612788200378418,0.3367672562599182)} end
if P[1477] then resizeBatch[#resizeBatch+1] = {Part = P[1477], CFrame = P[1477].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1209] then resizeBatch[#resizeBatch+1] = {Part = P[1209], CFrame = P[1209].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1056] then resizeBatch[#resizeBatch+1] = {Part = P[1056], CFrame = P[1056].CFrame, Size = Vector3.new(1,2,12)} end
if P[1549] then resizeBatch[#resizeBatch+1] = {Part = P[1549], CFrame = P[1549].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1514] then resizeBatch[#resizeBatch+1] = {Part = P[1514], CFrame = P[1514].CFrame, Size = Vector3.new(0.9000000953674316,1,1.600000023841858)} end
if P[1480] then resizeBatch[#resizeBatch+1] = {Part = P[1480], CFrame = P[1480].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1036] then resizeBatch[#resizeBatch+1] = {Part = P[1036], CFrame = P[1036].CFrame, Size = Vector3.new(13,0.4000000059604645,13)} end
if P[1295] then resizeBatch[#resizeBatch+1] = {Part = P[1295], CFrame = P[1295].CFrame, Size = Vector3.new(1,2,14)} end
if P[1428] then resizeBatch[#resizeBatch+1] = {Part = P[1428], CFrame = P[1428].CFrame, Size = Vector3.new(0.20000000298023224,1.2000000476837158,6)} end
if P[1076] then resizeBatch[#resizeBatch+1] = {Part = P[1076], CFrame = P[1076].CFrame, Size = Vector3.new(1,2,6)} end
if P[1410] then resizeBatch[#resizeBatch+1] = {Part = P[1410], CFrame = P[1410].CFrame, Size = Vector3.new(3,0.30000001192092896,6)} end
if P[1280] then resizeBatch[#resizeBatch+1] = {Part = P[1280], CFrame = P[1280].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1107] then resizeBatch[#resizeBatch+1] = {Part = P[1107], CFrame = P[1107].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1059] then resizeBatch[#resizeBatch+1] = {Part = P[1059], CFrame = P[1059].CFrame, Size = Vector3.new(64,2,1)} end
if P[1139] then resizeBatch[#resizeBatch+1] = {Part = P[1139], CFrame = P[1139].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1591] then resizeBatch[#resizeBatch+1] = {Part = P[1591], CFrame = P[1591].CFrame, Size = Vector3.new(4,7.599999904632568,2)} end
if P[1178] then resizeBatch[#resizeBatch+1] = {Part = P[1178], CFrame = P[1178].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1327] then resizeBatch[#resizeBatch+1] = {Part = P[1327], CFrame = P[1327].CFrame, Size = Vector3.new(32,1,22)} end
if P[1190] then resizeBatch[#resizeBatch+1] = {Part = P[1190], CFrame = P[1190].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1636] then resizeBatch[#resizeBatch+1] = {Part = P[1636], CFrame = P[1636].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1472] then resizeBatch[#resizeBatch+1] = {Part = P[1472], CFrame = P[1472].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1368] then resizeBatch[#resizeBatch+1] = {Part = P[1368], CFrame = P[1368].CFrame, Size = Vector3.new(0.5853654146194458,0.19512198865413666,0.19512198865413666)} end
if P[1289] then resizeBatch[#resizeBatch+1] = {Part = P[1289], CFrame = P[1289].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1158] then resizeBatch[#resizeBatch+1] = {Part = P[1158], CFrame = P[1158].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1536] then resizeBatch[#resizeBatch+1] = {Part = P[1536], CFrame = P[1536].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1566] then resizeBatch[#resizeBatch+1] = {Part = P[1566], CFrame = P[1566].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1206] then resizeBatch[#resizeBatch+1] = {Part = P[1206], CFrame = P[1206].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1593] then resizeBatch[#resizeBatch+1] = {Part = P[1593], CFrame = P[1593].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1600] then resizeBatch[#resizeBatch+1] = {Part = P[1600], CFrame = P[1600].CFrame, Size = Vector3.new(9.199999809265137,0.4999999403953552,8)} end
if P[1487] then resizeBatch[#resizeBatch+1] = {Part = P[1487], CFrame = P[1487].CFrame, Size = Vector3.new(7.099999904632568,0.20000000298023224,3.9000000953674316)} end
if P[1538] then resizeBatch[#resizeBatch+1] = {Part = P[1538], CFrame = P[1538].CFrame, Size = Vector3.new(8.000000953674316,0.5000013113021851,8)} end
if P[1283] then resizeBatch[#resizeBatch+1] = {Part = P[1283], CFrame = P[1283].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1469] then resizeBatch[#resizeBatch+1] = {Part = P[1469], CFrame = P[1469].CFrame, Size = Vector3.new(0.9000000953674316,1,1.600000023841858)} end
if P[1359] then resizeBatch[#resizeBatch+1] = {Part = P[1359], CFrame = P[1359].CFrame, Size = Vector3.new(0.24390164017677307,1.951219916343689,2.682927131652832)} end
if P[1445] then resizeBatch[#resizeBatch+1] = {Part = P[1445], CFrame = P[1445].CFrame, Size = Vector3.new(4.099999904632568,0.20000000298023224,5)} end
if P[1182] then resizeBatch[#resizeBatch+1] = {Part = P[1182], CFrame = P[1182].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1425] then resizeBatch[#resizeBatch+1] = {Part = P[1425], CFrame = P[1425].CFrame, Size = Vector3.new(0.20000000298023224,1.2000000476837158,6)} end
if P[1163] then resizeBatch[#resizeBatch+1] = {Part = P[1163], CFrame = P[1163].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1612] then resizeBatch[#resizeBatch+1] = {Part = P[1612], CFrame = P[1612].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1248] then resizeBatch[#resizeBatch+1] = {Part = P[1248], CFrame = P[1248].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1575] then resizeBatch[#resizeBatch+1] = {Part = P[1575], CFrame = P[1575].CFrame, Size = Vector3.new(8.000000953674316,0.5000013113021851,8)} end
if P[1205] then resizeBatch[#resizeBatch+1] = {Part = P[1205], CFrame = P[1205].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1181] then resizeBatch[#resizeBatch+1] = {Part = P[1181], CFrame = P[1181].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1511] then resizeBatch[#resizeBatch+1] = {Part = P[1511], CFrame = P[1511].CFrame, Size = Vector3.new(1.3999996185302734,1.5,7.5)} end
if P[1092] then resizeBatch[#resizeBatch+1] = {Part = P[1092], CFrame = P[1092].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1185] then resizeBatch[#resizeBatch+1] = {Part = P[1185], CFrame = P[1185].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1320] then resizeBatch[#resizeBatch+1] = {Part = P[1320], CFrame = P[1320].CFrame, Size = Vector3.new(1,2,9)} end
if P[1233] then resizeBatch[#resizeBatch+1] = {Part = P[1233], CFrame = P[1233].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1104] then resizeBatch[#resizeBatch+1] = {Part = P[1104], CFrame = P[1104].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1602] then resizeBatch[#resizeBatch+1] = {Part = P[1602], CFrame = P[1602].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1414] then resizeBatch[#resizeBatch+1] = {Part = P[1414], CFrame = P[1414].CFrame, Size = Vector3.new(5.799999713897705,0.30000001192092896,6)} end
if P[1520] then resizeBatch[#resizeBatch+1] = {Part = P[1520], CFrame = P[1520].CFrame, Size = Vector3.new(33.79999923706055,13.199999809265137,23.899999618530273)} end
if P[1569] then resizeBatch[#resizeBatch+1] = {Part = P[1569], CFrame = P[1569].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1137] then resizeBatch[#resizeBatch+1] = {Part = P[1137], CFrame = P[1137].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1314] then resizeBatch[#resizeBatch+1] = {Part = P[1314], CFrame = P[1314].CFrame, Size = Vector3.new(1,2,8)} end
if P[1286] then resizeBatch[#resizeBatch+1] = {Part = P[1286], CFrame = P[1286].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1152] then resizeBatch[#resizeBatch+1] = {Part = P[1152], CFrame = P[1152].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1245] then resizeBatch[#resizeBatch+1] = {Part = P[1245], CFrame = P[1245].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1128] then resizeBatch[#resizeBatch+1] = {Part = P[1128], CFrame = P[1128].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1146] then resizeBatch[#resizeBatch+1] = {Part = P[1146], CFrame = P[1146].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1465] then resizeBatch[#resizeBatch+1] = {Part = P[1465], CFrame = P[1465].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1489] then resizeBatch[#resizeBatch+1] = {Part = P[1489], CFrame = P[1489].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1399] then resizeBatch[#resizeBatch+1] = {Part = P[1399], CFrame = P[1399].CFrame, Size = Vector3.new(2.0000014305114746,8.000000953674316,2.0000319480895996)} end
if P[1512] then resizeBatch[#resizeBatch+1] = {Part = P[1512], CFrame = P[1512].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1379] then resizeBatch[#resizeBatch+1] = {Part = P[1379], CFrame = P[1379].CFrame, Size = Vector3.new(0.24390171468257904,0.24390171468257904,0.24390171468257904)} end
if P[1496] then resizeBatch[#resizeBatch+1] = {Part = P[1496], CFrame = P[1496].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1463] then resizeBatch[#resizeBatch+1] = {Part = P[1463], CFrame = P[1463].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1495] then resizeBatch[#resizeBatch+1] = {Part = P[1495], CFrame = P[1495].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1304] then resizeBatch[#resizeBatch+1] = {Part = P[1304], CFrame = P[1304].CFrame, Size = Vector3.new(49,1,19)} end
if P[1083] then resizeBatch[#resizeBatch+1] = {Part = P[1083], CFrame = P[1083].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1651] then resizeBatch[#resizeBatch+1] = {Part = P[1651], CFrame = P[1651].CFrame, Size = Vector3.new(3.680000066757202,0.699999988079071,1.4100000858306885)} end
if P[1649] then resizeBatch[#resizeBatch+1] = {Part = P[1649], CFrame = P[1649].CFrame, Size = Vector3.new(3.680000066757202,0.699999988079071,1.4100000858306885)} end
if P[1648] then resizeBatch[#resizeBatch+1] = {Part = P[1648], CFrame = P[1648].CFrame, Size = Vector3.new(2,1.000000238418579,2)} end
if P[1063] then resizeBatch[#resizeBatch+1] = {Part = P[1063], CFrame = P[1063].CFrame, Size = Vector3.new(53,2,11)} end
if P[1635] then resizeBatch[#resizeBatch+1] = {Part = P[1635], CFrame = P[1635].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1645] then resizeBatch[#resizeBatch+1] = {Part = P[1645], CFrame = P[1645].CFrame, Size = Vector3.new(0.561278760433197,0.5612788200378418,0.3367672562599182)} end
if P[1643] then resizeBatch[#resizeBatch+1] = {Part = P[1643], CFrame = P[1643].CFrame, Size = Vector3.new(0.561278760433197,0.2806394100189209,0.2806393802165985)} end
if P[1364] then resizeBatch[#resizeBatch+1] = {Part = P[1364], CFrame = P[1364].CFrame, Size = Vector3.new(0.24390171468257904,0.24390171468257904,0.24390171468257904)} end
if P[1641] then resizeBatch[#resizeBatch+1] = {Part = P[1641], CFrame = P[1641].CFrame, Size = Vector3.new(0.561278760433197,0.2806394100189209,0.2806393802165985)} end
if P[1640] then resizeBatch[#resizeBatch+1] = {Part = P[1640], CFrame = P[1640].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1558] then resizeBatch[#resizeBatch+1] = {Part = P[1558], CFrame = P[1558].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1638] then resizeBatch[#resizeBatch+1] = {Part = P[1638], CFrame = P[1638].CFrame, Size = Vector3.new(0.561278760433197,0.2806394100189209,0.2806393802165985)} end
if P[1446] then resizeBatch[#resizeBatch+1] = {Part = P[1446], CFrame = P[1446].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1494] then resizeBatch[#resizeBatch+1] = {Part = P[1494], CFrame = P[1494].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1647] then resizeBatch[#resizeBatch+1] = {Part = P[1647], CFrame = P[1647].CFrame, Size = Vector3.new(2,1.000000238418579,2)} end
if P[1631] then resizeBatch[#resizeBatch+1] = {Part = P[1631], CFrame = P[1631].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1236] then resizeBatch[#resizeBatch+1] = {Part = P[1236], CFrame = P[1236].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1048] then resizeBatch[#resizeBatch+1] = {Part = P[1048], CFrame = P[1048].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1515] then resizeBatch[#resizeBatch+1] = {Part = P[1515], CFrame = P[1515].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1242] then resizeBatch[#resizeBatch+1] = {Part = P[1242], CFrame = P[1242].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1504] then resizeBatch[#resizeBatch+1] = {Part = P[1504], CFrame = P[1504].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1346] then resizeBatch[#resizeBatch+1] = {Part = P[1346], CFrame = P[1346].CFrame, Size = Vector3.new(1,1,1)} end
if P[1632] then resizeBatch[#resizeBatch+1] = {Part = P[1632], CFrame = P[1632].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1218] then resizeBatch[#resizeBatch+1] = {Part = P[1218], CFrame = P[1218].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1626] then resizeBatch[#resizeBatch+1] = {Part = P[1626], CFrame = P[1626].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1630] then resizeBatch[#resizeBatch+1] = {Part = P[1630], CFrame = P[1630].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1197] then resizeBatch[#resizeBatch+1] = {Part = P[1197], CFrame = P[1197].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1230] then resizeBatch[#resizeBatch+1] = {Part = P[1230], CFrame = P[1230].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1151] then resizeBatch[#resizeBatch+1] = {Part = P[1151], CFrame = P[1151].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1136] then resizeBatch[#resizeBatch+1] = {Part = P[1136], CFrame = P[1136].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1405] then resizeBatch[#resizeBatch+1] = {Part = P[1405], CFrame = P[1405].CFrame, Size = Vector3.new(2.200000047683716,0.6000000238418579,4.900000095367432)} end
if P[1220] then resizeBatch[#resizeBatch+1] = {Part = P[1220], CFrame = P[1220].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1491] then resizeBatch[#resizeBatch+1] = {Part = P[1491], CFrame = P[1491].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1625] then resizeBatch[#resizeBatch+1] = {Part = P[1625], CFrame = P[1625].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1623] then resizeBatch[#resizeBatch+1] = {Part = P[1623], CFrame = P[1623].CFrame, Size = Vector3.new(0.561278760433197,0.5612788200378418,0.3367672562599182)} end
if P[1622] then resizeBatch[#resizeBatch+1] = {Part = P[1622], CFrame = P[1622].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1121] then resizeBatch[#resizeBatch+1] = {Part = P[1121], CFrame = P[1121].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1621] then resizeBatch[#resizeBatch+1] = {Part = P[1621], CFrame = P[1621].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1411] then resizeBatch[#resizeBatch+1] = {Part = P[1411], CFrame = P[1411].CFrame, Size = Vector3.new(13.800000190734863,2.0999999046325684,9.800000190734863)} end
if P[1583] then resizeBatch[#resizeBatch+1] = {Part = P[1583], CFrame = P[1583].CFrame, Size = Vector3.new(9.199999809265137,0.4999999403953552,8)} end
if P[1553] then resizeBatch[#resizeBatch+1] = {Part = P[1553], CFrame = P[1553].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1617] then resizeBatch[#resizeBatch+1] = {Part = P[1617], CFrame = P[1617].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1619] then resizeBatch[#resizeBatch+1] = {Part = P[1619], CFrame = P[1619].CFrame, Size = Vector3.new(0.561278760433197,0.2806394100189209,0.2806393802165985)} end
if P[1278] then resizeBatch[#resizeBatch+1] = {Part = P[1278], CFrame = P[1278].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1614] then resizeBatch[#resizeBatch+1] = {Part = P[1614], CFrame = P[1614].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1254] then resizeBatch[#resizeBatch+1] = {Part = P[1254], CFrame = P[1254].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1259] then resizeBatch[#resizeBatch+1] = {Part = P[1259], CFrame = P[1259].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1449] then resizeBatch[#resizeBatch+1] = {Part = P[1449], CFrame = P[1449].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1458] then resizeBatch[#resizeBatch+1] = {Part = P[1458], CFrame = P[1458].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1453] then resizeBatch[#resizeBatch+1] = {Part = P[1453], CFrame = P[1453].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1106] then resizeBatch[#resizeBatch+1] = {Part = P[1106], CFrame = P[1106].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1323] then resizeBatch[#resizeBatch+1] = {Part = P[1323], CFrame = P[1323].CFrame, Size = Vector3.new(33,1,4)} end
if P[1082] then resizeBatch[#resizeBatch+1] = {Part = P[1082], CFrame = P[1082].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1429] then resizeBatch[#resizeBatch+1] = {Part = P[1429], CFrame = P[1429].CFrame, Size = Vector3.new(6,0.7000000476837158,6)} end
if P[1452] then resizeBatch[#resizeBatch+1] = {Part = P[1452], CFrame = P[1452].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1505] then resizeBatch[#resizeBatch+1] = {Part = P[1505], CFrame = P[1505].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1611] then resizeBatch[#resizeBatch+1] = {Part = P[1611], CFrame = P[1611].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1172] then resizeBatch[#resizeBatch+1] = {Part = P[1172], CFrame = P[1172].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1608] then resizeBatch[#resizeBatch+1] = {Part = P[1608], CFrame = P[1608].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1606] then resizeBatch[#resizeBatch+1] = {Part = P[1606], CFrame = P[1606].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1244] then resizeBatch[#resizeBatch+1] = {Part = P[1244], CFrame = P[1244].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1409] then resizeBatch[#resizeBatch+1] = {Part = P[1409], CFrame = P[1409].CFrame, Size = Vector3.new(4.099999904632568,0.800000011920929,9)} end
if P[1478] then resizeBatch[#resizeBatch+1] = {Part = P[1478], CFrame = P[1478].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1545] then resizeBatch[#resizeBatch+1] = {Part = P[1545], CFrame = P[1545].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1599] then resizeBatch[#resizeBatch+1] = {Part = P[1599], CFrame = P[1599].CFrame, Size = Vector3.new(8.000000953674316,0.5000013113021851,8)} end
if P[1597] then resizeBatch[#resizeBatch+1] = {Part = P[1597], CFrame = P[1597].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1365] then resizeBatch[#resizeBatch+1] = {Part = P[1365], CFrame = P[1365].CFrame, Size = Vector3.new(0.1951213777065277,0.1951213777065277,0.1951213777065277)} end
if P[1043] then resizeBatch[#resizeBatch+1] = {Part = P[1043], CFrame = P[1043].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1241] then resizeBatch[#resizeBatch+1] = {Part = P[1241], CFrame = P[1241].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1227] then resizeBatch[#resizeBatch+1] = {Part = P[1227], CFrame = P[1227].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1589] then resizeBatch[#resizeBatch+1] = {Part = P[1589], CFrame = P[1589].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1360] then resizeBatch[#resizeBatch+1] = {Part = P[1360], CFrame = P[1360].CFrame, Size = Vector3.new(0.24390164017677307,1.951219916343689,2.682927131652832)} end
if P[1308] then resizeBatch[#resizeBatch+1] = {Part = P[1308], CFrame = P[1308].CFrame, Size = Vector3.new(186,15,1)} end
if P[1217] then resizeBatch[#resizeBatch+1] = {Part = P[1217], CFrame = P[1217].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1372] then resizeBatch[#resizeBatch+1] = {Part = P[1372], CFrame = P[1372].CFrame, Size = Vector3.new(0.2439020425081253,0.24390245974063873,0.2439022660255432)} end
if P[1193] then resizeBatch[#resizeBatch+1] = {Part = P[1193], CFrame = P[1193].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1578] then resizeBatch[#resizeBatch+1] = {Part = P[1578], CFrame = P[1578].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1444] then resizeBatch[#resizeBatch+1] = {Part = P[1444], CFrame = P[1444].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1585] then resizeBatch[#resizeBatch+1] = {Part = P[1585], CFrame = P[1585].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1403] then resizeBatch[#resizeBatch+1] = {Part = P[1403], CFrame = P[1403].CFrame, Size = Vector3.new(9.799999237060547,1.4000000953674316,14.399999618530273)} end
if P[1451] then resizeBatch[#resizeBatch+1] = {Part = P[1451], CFrame = P[1451].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1094] then resizeBatch[#resizeBatch+1] = {Part = P[1094], CFrame = P[1094].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1573] then resizeBatch[#resizeBatch+1] = {Part = P[1573], CFrame = P[1573].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1098] then resizeBatch[#resizeBatch+1] = {Part = P[1098], CFrame = P[1098].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1564] then resizeBatch[#resizeBatch+1] = {Part = P[1564], CFrame = P[1564].CFrame, Size = Vector3.new(4,7.599999904632568,2)} end
if P[1208] then resizeBatch[#resizeBatch+1] = {Part = P[1208], CFrame = P[1208].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1355] then resizeBatch[#resizeBatch+1] = {Part = P[1355], CFrame = P[1355].CFrame, Size = Vector3.new(3.658536672592163,1.951219916343689,0.24390240013599396)} end
if P[1562] then resizeBatch[#resizeBatch+1] = {Part = P[1562], CFrame = P[1562].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1560] then resizeBatch[#resizeBatch+1] = {Part = P[1560], CFrame = P[1560].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1509] then resizeBatch[#resizeBatch+1] = {Part = P[1509], CFrame = P[1509].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1557] then resizeBatch[#resizeBatch+1] = {Part = P[1557], CFrame = P[1557].CFrame, Size = Vector3.new(8.100000381469727,8.100000381469727,4.350001811981201)} end
if P[1432] then resizeBatch[#resizeBatch+1] = {Part = P[1432], CFrame = P[1432].CFrame, Size = Vector3.new(6,1.2000000476837158,6)} end
if P[1555] then resizeBatch[#resizeBatch+1] = {Part = P[1555], CFrame = P[1555].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1616] then resizeBatch[#resizeBatch+1] = {Part = P[1616], CFrame = P[1616].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1551] then resizeBatch[#resizeBatch+1] = {Part = P[1551], CFrame = P[1551].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1256] then resizeBatch[#resizeBatch+1] = {Part = P[1256], CFrame = P[1256].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1447] then resizeBatch[#resizeBatch+1] = {Part = P[1447], CFrame = P[1447].CFrame, Size = Vector3.new(1.7000000476837158,1,1)} end
if P[1402] then resizeBatch[#resizeBatch+1] = {Part = P[1402], CFrame = P[1402].CFrame, Size = Vector3.new(7.899999618530273,1,10.199999809265137)} end
if P[1604] then resizeBatch[#resizeBatch+1] = {Part = P[1604], CFrame = P[1604].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1229] then resizeBatch[#resizeBatch+1] = {Part = P[1229], CFrame = P[1229].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1125] then resizeBatch[#resizeBatch+1] = {Part = P[1125], CFrame = P[1125].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1303] then resizeBatch[#resizeBatch+1] = {Part = P[1303], CFrame = P[1303].CFrame, Size = Vector3.new(191,1,74)} end
if P[1534] then resizeBatch[#resizeBatch+1] = {Part = P[1534], CFrame = P[1534].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1533] then resizeBatch[#resizeBatch+1] = {Part = P[1533], CFrame = P[1533].CFrame, Size = Vector3.new(8.000000953674316,0.5000013113021851,8)} end
if P[1497] then resizeBatch[#resizeBatch+1] = {Part = P[1497], CFrame = P[1497].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1475] then resizeBatch[#resizeBatch+1] = {Part = P[1475], CFrame = P[1475].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1031] then resizeBatch[#resizeBatch+1] = {Part = P[1031], CFrame = P[1031].CFrame, Size = Vector3.new(2,0.4000000059604645,1)} end
if P[1529] then resizeBatch[#resizeBatch+1] = {Part = P[1529], CFrame = P[1529].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1527] then resizeBatch[#resizeBatch+1] = {Part = P[1527], CFrame = P[1527].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1349] then resizeBatch[#resizeBatch+1] = {Part = P[1349], CFrame = P[1349].CFrame, Size = Vector3.new(12,1,12)} end
if P[1115] then resizeBatch[#resizeBatch+1] = {Part = P[1115], CFrame = P[1115].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1524] then resizeBatch[#resizeBatch+1] = {Part = P[1524], CFrame = P[1524].CFrame, Size = Vector3.new(6.000000953674316,4.100001811981201,10.850000381469727)} end
if P[1085] then resizeBatch[#resizeBatch+1] = {Part = P[1085], CFrame = P[1085].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1523] then resizeBatch[#resizeBatch+1] = {Part = P[1523], CFrame = P[1523].CFrame, Size = Vector3.new(5.600000381469727,8.40000057220459,2)} end
if P[1086] then resizeBatch[#resizeBatch+1] = {Part = P[1086], CFrame = P[1086].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1522] then resizeBatch[#resizeBatch+1] = {Part = P[1522], CFrame = P[1522].CFrame, Size = Vector3.new(5.100000381469727,9.300000190734863,2)} end
if P[1517] then resizeBatch[#resizeBatch+1] = {Part = P[1517], CFrame = P[1517].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1507] then resizeBatch[#resizeBatch+1] = {Part = P[1507], CFrame = P[1507].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1634] then resizeBatch[#resizeBatch+1] = {Part = P[1634], CFrame = P[1634].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1513] then resizeBatch[#resizeBatch+1] = {Part = P[1513], CFrame = P[1513].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1164] then resizeBatch[#resizeBatch+1] = {Part = P[1164], CFrame = P[1164].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1490] then resizeBatch[#resizeBatch+1] = {Part = P[1490], CFrame = P[1490].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1170] then resizeBatch[#resizeBatch+1] = {Part = P[1170], CFrame = P[1170].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1510] then resizeBatch[#resizeBatch+1] = {Part = P[1510], CFrame = P[1510].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1503] then resizeBatch[#resizeBatch+1] = {Part = P[1503], CFrame = P[1503].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1109] then resizeBatch[#resizeBatch+1] = {Part = P[1109], CFrame = P[1109].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1415] then resizeBatch[#resizeBatch+1] = {Part = P[1415], CFrame = P[1415].CFrame, Size = Vector3.new(13.5,1.2999999523162842,7.799999713897705)} end
if P[1377] then resizeBatch[#resizeBatch+1] = {Part = P[1377], CFrame = P[1377].CFrame, Size = Vector3.new(0.5853654146194458,0.19512198865413666,0.19512198865413666)} end
if P[1221] then resizeBatch[#resizeBatch+1] = {Part = P[1221], CFrame = P[1221].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1516] then resizeBatch[#resizeBatch+1] = {Part = P[1516], CFrame = P[1516].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1506] then resizeBatch[#resizeBatch+1] = {Part = P[1506], CFrame = P[1506].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1502] then resizeBatch[#resizeBatch+1] = {Part = P[1502], CFrame = P[1502].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1386] then resizeBatch[#resizeBatch+1] = {Part = P[1386], CFrame = P[1386].CFrame, Size = Vector3.new(1.2195117473602295,0.24390250444412231,0.24390250444412231)} end
if P[1390] then resizeBatch[#resizeBatch+1] = {Part = P[1390], CFrame = P[1390].CFrame, Size = Vector3.new(5.121951580047607,1.707317590713501,4.1463422775268555)} end
if P[1501] then resizeBatch[#resizeBatch+1] = {Part = P[1501], CFrame = P[1501].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1154] then resizeBatch[#resizeBatch+1] = {Part = P[1154], CFrame = P[1154].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1500] then resizeBatch[#resizeBatch+1] = {Part = P[1500], CFrame = P[1500].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1130] then resizeBatch[#resizeBatch+1] = {Part = P[1130], CFrame = P[1130].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1354] then resizeBatch[#resizeBatch+1] = {Part = P[1354], CFrame = P[1354].CFrame, Size = Vector3.new(0.7317057847976685,0.24390247464179993,3.902439832687378)} end
if P[1361] then resizeBatch[#resizeBatch+1] = {Part = P[1361], CFrame = P[1361].CFrame, Size = Vector3.new(4.146341323852539,0.24390247464179993,1.2195121049880981)} end
if P[1460] then resizeBatch[#resizeBatch+1] = {Part = P[1460], CFrame = P[1460].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1462] then resizeBatch[#resizeBatch+1] = {Part = P[1462], CFrame = P[1462].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1266] then resizeBatch[#resizeBatch+1] = {Part = P[1266], CFrame = P[1266].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1531] then resizeBatch[#resizeBatch+1] = {Part = P[1531], CFrame = P[1531].CFrame, Size = Vector3.new(9.199999809265137,0.4999999403953552,8)} end
if P[1637] then resizeBatch[#resizeBatch+1] = {Part = P[1637], CFrame = P[1637].CFrame, Size = Vector3.new(0.561278760433197,0.5612788200378418,0.3367672562599182)} end
if P[1380] then resizeBatch[#resizeBatch+1] = {Part = P[1380], CFrame = P[1380].CFrame, Size = Vector3.new(4.146340847015381,1.7073173522949219,0.24390247464179993)} end
if P[1387] then resizeBatch[#resizeBatch+1] = {Part = P[1387], CFrame = P[1387].CFrame, Size = Vector3.new(0.3902434706687927,0.19512198865413666,0.19512198865413666)} end
if P[1493] then resizeBatch[#resizeBatch+1] = {Part = P[1493], CFrame = P[1493].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1382] then resizeBatch[#resizeBatch+1] = {Part = P[1382], CFrame = P[1382].CFrame, Size = Vector3.new(0.7317063212394714,0.24390247464179993,3.902439832687378)} end
if P[1300] then resizeBatch[#resizeBatch+1] = {Part = P[1300], CFrame = P[1300].CFrame, Size = Vector3.new(30,1,23)} end
if P[1459] then resizeBatch[#resizeBatch+1] = {Part = P[1459], CFrame = P[1459].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1488] then resizeBatch[#resizeBatch+1] = {Part = P[1488], CFrame = P[1488].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1257] then resizeBatch[#resizeBatch+1] = {Part = P[1257], CFrame = P[1257].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1486] then resizeBatch[#resizeBatch+1] = {Part = P[1486], CFrame = P[1486].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1485] then resizeBatch[#resizeBatch+1] = {Part = P[1485], CFrame = P[1485].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1149] then resizeBatch[#resizeBatch+1] = {Part = P[1149], CFrame = P[1149].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1483] then resizeBatch[#resizeBatch+1] = {Part = P[1483], CFrame = P[1483].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1260] then resizeBatch[#resizeBatch+1] = {Part = P[1260], CFrame = P[1260].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1455] then resizeBatch[#resizeBatch+1] = {Part = P[1455], CFrame = P[1455].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1481] then resizeBatch[#resizeBatch+1] = {Part = P[1481], CFrame = P[1481].CFrame, Size = Vector3.new(1.7000000476837158,1,1)} end
if P[1143] then resizeBatch[#resizeBatch+1] = {Part = P[1143], CFrame = P[1143].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1476] then resizeBatch[#resizeBatch+1] = {Part = P[1476], CFrame = P[1476].CFrame, Size = Vector3.new(1.7000000476837158,1,1)} end
if P[1344] then resizeBatch[#resizeBatch+1] = {Part = P[1344], CFrame = P[1344].CFrame, Size = Vector3.new(82,2,1)} end
if P[1110] then resizeBatch[#resizeBatch+1] = {Part = P[1110], CFrame = P[1110].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1091] then resizeBatch[#resizeBatch+1] = {Part = P[1091], CFrame = P[1091].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1471] then resizeBatch[#resizeBatch+1] = {Part = P[1471], CFrame = P[1471].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1470] then resizeBatch[#resizeBatch+1] = {Part = P[1470], CFrame = P[1470].CFrame, Size = Vector3.new(7.099999904632568,0.20000000298023224,3.9000000953674316)} end
if P[1468] then resizeBatch[#resizeBatch+1] = {Part = P[1468], CFrame = P[1468].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1467] then resizeBatch[#resizeBatch+1] = {Part = P[1467], CFrame = P[1467].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1313] then resizeBatch[#resizeBatch+1] = {Part = P[1313], CFrame = P[1313].CFrame, Size = Vector3.new(191,1,74)} end
if P[1466] then resizeBatch[#resizeBatch+1] = {Part = P[1466], CFrame = P[1466].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1265] then resizeBatch[#resizeBatch+1] = {Part = P[1265], CFrame = P[1265].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1148] then resizeBatch[#resizeBatch+1] = {Part = P[1148], CFrame = P[1148].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1397] then resizeBatch[#resizeBatch+1] = {Part = P[1397], CFrame = P[1397].CFrame, Size = Vector3.new(2.0000014305114746,8.000000953674316,2.0000319480895996)} end
if P[1095] then resizeBatch[#resizeBatch+1] = {Part = P[1095], CFrame = P[1095].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1464] then resizeBatch[#resizeBatch+1] = {Part = P[1464], CFrame = P[1464].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1498] then resizeBatch[#resizeBatch+1] = {Part = P[1498], CFrame = P[1498].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1211] then resizeBatch[#resizeBatch+1] = {Part = P[1211], CFrame = P[1211].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1461] then resizeBatch[#resizeBatch+1] = {Part = P[1461], CFrame = P[1461].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1457] then resizeBatch[#resizeBatch+1] = {Part = P[1457], CFrame = P[1457].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1456] then resizeBatch[#resizeBatch+1] = {Part = P[1456], CFrame = P[1456].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1311] then resizeBatch[#resizeBatch+1] = {Part = P[1311], CFrame = P[1311].CFrame, Size = Vector3.new(136,1,7)} end
if P[1484] then resizeBatch[#resizeBatch+1] = {Part = P[1484], CFrame = P[1484].CFrame, Size = Vector3.new(2.1000001430511475,1,1)} end
if P[1482] then resizeBatch[#resizeBatch+1] = {Part = P[1482], CFrame = P[1482].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1277] then resizeBatch[#resizeBatch+1] = {Part = P[1277], CFrame = P[1277].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1454] then resizeBatch[#resizeBatch+1] = {Part = P[1454], CFrame = P[1454].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1450] then resizeBatch[#resizeBatch+1] = {Part = P[1450], CFrame = P[1450].CFrame, Size = Vector3.new(2.1000001430511475,1,1)} end
if P[1142] then resizeBatch[#resizeBatch+1] = {Part = P[1142], CFrame = P[1142].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1443] then resizeBatch[#resizeBatch+1] = {Part = P[1443], CFrame = P[1443].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1543] then resizeBatch[#resizeBatch+1] = {Part = P[1543], CFrame = P[1543].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1235] then resizeBatch[#resizeBatch+1] = {Part = P[1235], CFrame = P[1235].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1547] then resizeBatch[#resizeBatch+1] = {Part = P[1547], CFrame = P[1547].CFrame, Size = Vector3.new(1.7000000476837158,0.30000001192092896,1.3000000715255737)} end
if P[1287] then resizeBatch[#resizeBatch+1] = {Part = P[1287], CFrame = P[1287].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1079] then resizeBatch[#resizeBatch+1] = {Part = P[1079], CFrame = P[1079].CFrame, Size = Vector3.new(204.99998474121094,15,5)} end
if P[1580] then resizeBatch[#resizeBatch+1] = {Part = P[1580], CFrame = P[1580].CFrame, Size = Vector3.new(8.100000381469727,8.100000381469727,4.350001811981201)} end
if P[1124] then resizeBatch[#resizeBatch+1] = {Part = P[1124], CFrame = P[1124].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1441] then resizeBatch[#resizeBatch+1] = {Part = P[1441], CFrame = P[1441].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1435] then resizeBatch[#resizeBatch+1] = {Part = P[1435], CFrame = P[1435].CFrame, Size = Vector3.new(6,0.5,6)} end
if P[1262] then resizeBatch[#resizeBatch+1] = {Part = P[1262], CFrame = P[1262].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1134] then resizeBatch[#resizeBatch+1] = {Part = P[1134], CFrame = P[1134].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1199] then resizeBatch[#resizeBatch+1] = {Part = P[1199], CFrame = P[1199].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1187] then resizeBatch[#resizeBatch+1] = {Part = P[1187], CFrame = P[1187].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1176] then resizeBatch[#resizeBatch+1] = {Part = P[1176], CFrame = P[1176].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1133] then resizeBatch[#resizeBatch+1] = {Part = P[1133], CFrame = P[1133].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1027] then resizeBatch[#resizeBatch+1] = {Part = P[1027], CFrame = P[1027].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1100] then resizeBatch[#resizeBatch+1] = {Part = P[1100], CFrame = P[1100].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1391] then resizeBatch[#resizeBatch+1] = {Part = P[1391], CFrame = P[1391].CFrame, Size = Vector3.new(4.146340847015381,1.7073173522949219,1.2195123434066772)} end
if P[1251] then resizeBatch[#resizeBatch+1] = {Part = P[1251], CFrame = P[1251].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1412] then resizeBatch[#resizeBatch+1] = {Part = P[1412], CFrame = P[1412].CFrame, Size = Vector3.new(12.100000381469727,2.299999952316284,7.700000286102295)} end
if P[1508] then resizeBatch[#resizeBatch+1] = {Part = P[1508], CFrame = P[1508].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1200] then resizeBatch[#resizeBatch+1] = {Part = P[1200], CFrame = P[1200].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1366] then resizeBatch[#resizeBatch+1] = {Part = P[1366], CFrame = P[1366].CFrame, Size = Vector3.new(5.609755992889404,0.24390247464179993,0.4878047704696655)} end
if P[1424] then resizeBatch[#resizeBatch+1] = {Part = P[1424], CFrame = P[1424].CFrame, Size = Vector3.new(0.20000000298023224,1.2000000476837158,6)} end
if P[1263] then resizeBatch[#resizeBatch+1] = {Part = P[1263], CFrame = P[1263].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1253] then resizeBatch[#resizeBatch+1] = {Part = P[1253], CFrame = P[1253].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1474] then resizeBatch[#resizeBatch+1] = {Part = P[1474], CFrame = P[1474].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1272] then resizeBatch[#resizeBatch+1] = {Part = P[1272], CFrame = P[1272].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1175] then resizeBatch[#resizeBatch+1] = {Part = P[1175], CFrame = P[1175].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1116] then resizeBatch[#resizeBatch+1] = {Part = P[1116], CFrame = P[1116].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1576] then resizeBatch[#resizeBatch+1] = {Part = P[1576], CFrame = P[1576].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1101] then resizeBatch[#resizeBatch+1] = {Part = P[1101], CFrame = P[1101].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1398] then resizeBatch[#resizeBatch+1] = {Part = P[1398], CFrame = P[1398].CFrame, Size = Vector3.new(2.0000014305114746,8.000000953674316,2.0000319480895996)} end
if P[1214] then resizeBatch[#resizeBatch+1] = {Part = P[1214], CFrame = P[1214].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1157] then resizeBatch[#resizeBatch+1] = {Part = P[1157], CFrame = P[1157].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1587] then resizeBatch[#resizeBatch+1] = {Part = P[1587], CFrame = P[1587].CFrame, Size = Vector3.new(0.8000000715255737,8,0.6000000238418579)} end
if P[1356] then resizeBatch[#resizeBatch+1] = {Part = P[1356], CFrame = P[1356].CFrame, Size = Vector3.new(4.6341471672058105,1.2195123434066772,0.121951162815094)} end
if P[1161] then resizeBatch[#resizeBatch+1] = {Part = P[1161], CFrame = P[1161].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1203] then resizeBatch[#resizeBatch+1] = {Part = P[1203], CFrame = P[1203].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1088] then resizeBatch[#resizeBatch+1] = {Part = P[1088], CFrame = P[1088].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1384] then resizeBatch[#resizeBatch+1] = {Part = P[1384], CFrame = P[1384].CFrame, Size = Vector3.new(1.2195141315460205,0.1219511479139328,0.121951162815094)} end
if P[1281] then resizeBatch[#resizeBatch+1] = {Part = P[1281], CFrame = P[1281].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1069] then resizeBatch[#resizeBatch+1] = {Part = P[1069], CFrame = P[1069].CFrame, Size = Vector3.new(25,1,33)} end
if P[1383] then resizeBatch[#resizeBatch+1] = {Part = P[1383], CFrame = P[1383].CFrame, Size = Vector3.new(1.2195117473602295,0.24390250444412231,0.24390250444412231)} end
if P[1492] then resizeBatch[#resizeBatch+1] = {Part = P[1492], CFrame = P[1492].CFrame, Size = Vector3.new(0.9000000953674316,1,1)} end
if P[1629] then resizeBatch[#resizeBatch+1] = {Part = P[1629], CFrame = P[1629].CFrame, Size = Vector3.new(0.2806393802165985,0.5612788200378418,0.3367672562599182)} end
if P[1131] then resizeBatch[#resizeBatch+1] = {Part = P[1131], CFrame = P[1131].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1155] then resizeBatch[#resizeBatch+1] = {Part = P[1155], CFrame = P[1155].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1274] then resizeBatch[#resizeBatch+1] = {Part = P[1274], CFrame = P[1274].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1226] then resizeBatch[#resizeBatch+1] = {Part = P[1226], CFrame = P[1226].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1212] then resizeBatch[#resizeBatch+1] = {Part = P[1212], CFrame = P[1212].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1357] then resizeBatch[#resizeBatch+1] = {Part = P[1357], CFrame = P[1357].CFrame, Size = Vector3.new(1.2195141315460205,0.1219511479139328,0.121951162815094)} end
if P[1385] then resizeBatch[#resizeBatch+1] = {Part = P[1385], CFrame = P[1385].CFrame, Size = Vector3.new(0.3902434706687927,0.19512198865413666,0.19512198865413666)} end
if P[1363] then resizeBatch[#resizeBatch+1] = {Part = P[1363], CFrame = P[1363].CFrame, Size = Vector3.new(3.658536672592163,0.24390247464179993,2.195122241973877)} end
if P[1362] then resizeBatch[#resizeBatch+1] = {Part = P[1362], CFrame = P[1362].CFrame, Size = Vector3.new(0.1951213777065277,0.1951213777065277,0.1951213777065277)} end
if P[1049] then resizeBatch[#resizeBatch+1] = {Part = P[1049], CFrame = P[1049].CFrame, Size = Vector3.new(2,9.600000381469727,2)} end
if P[1054] then resizeBatch[#resizeBatch+1] = {Part = P[1054], CFrame = P[1054].CFrame, Size = Vector3.new(1,1.2000000476837158,1)} end
if P[1358] then resizeBatch[#resizeBatch+1] = {Part = P[1358], CFrame = P[1358].CFrame, Size = Vector3.new(0.48780331015586853,1.7073173522949219,4.1463422775268555)} end
if P[1119] then resizeBatch[#resizeBatch+1] = {Part = P[1119], CFrame = P[1119].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1173] then resizeBatch[#resizeBatch+1] = {Part = P[1173], CFrame = P[1173].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1499] then resizeBatch[#resizeBatch+1] = {Part = P[1499], CFrame = P[1499].CFrame, Size = Vector3.new(1.3000000715255737,1,1)} end
if P[1284] then resizeBatch[#resizeBatch+1] = {Part = P[1284], CFrame = P[1284].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1418] then resizeBatch[#resizeBatch+1] = {Part = P[1418], CFrame = P[1418].CFrame, Size = Vector3.new(0.8300001621246338,1,0.9200000762939453)} end
if P[1268] then resizeBatch[#resizeBatch+1] = {Part = P[1268], CFrame = P[1268].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1122] then resizeBatch[#resizeBatch+1] = {Part = P[1122], CFrame = P[1122].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1215] then resizeBatch[#resizeBatch+1] = {Part = P[1215], CFrame = P[1215].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1291] then resizeBatch[#resizeBatch+1] = {Part = P[1291], CFrame = P[1291].CFrame, Size = Vector3.new(1,2,18)} end
if P[1191] then resizeBatch[#resizeBatch+1] = {Part = P[1191], CFrame = P[1191].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1427] then resizeBatch[#resizeBatch+1] = {Part = P[1427], CFrame = P[1427].CFrame, Size = Vector3.new(0.20000000298023224,1.2000000476837158,6)} end
if P[1375] then resizeBatch[#resizeBatch+1] = {Part = P[1375], CFrame = P[1375].CFrame, Size = Vector3.new(0.12195112556219101,0.6097560524940491,0.6097560524940491)} end
if P[1317] then resizeBatch[#resizeBatch+1] = {Part = P[1317], CFrame = P[1317].CFrame, Size = Vector3.new(24,1,10)} end
if P[1140] then resizeBatch[#resizeBatch+1] = {Part = P[1140], CFrame = P[1140].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1539] then resizeBatch[#resizeBatch+1] = {Part = P[1539], CFrame = P[1539].CFrame, Size = Vector3.new(9.199999809265137,0.4999999403953552,8)} end
if P[1299] then resizeBatch[#resizeBatch+1] = {Part = P[1299], CFrame = P[1299].CFrame, Size = Vector3.new(1,15,189)} end
if P[1167] then resizeBatch[#resizeBatch+1] = {Part = P[1167], CFrame = P[1167].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1179] then resizeBatch[#resizeBatch+1] = {Part = P[1179], CFrame = P[1179].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1184] then resizeBatch[#resizeBatch+1] = {Part = P[1184], CFrame = P[1184].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1238] then resizeBatch[#resizeBatch+1] = {Part = P[1238], CFrame = P[1238].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1160] then resizeBatch[#resizeBatch+1] = {Part = P[1160], CFrame = P[1160].CFrame, Size = Vector3.new(12.68669605255127,14.801146507263184,12.263806343078613)} end
if P[1269] then resizeBatch[#resizeBatch+1] = {Part = P[1269], CFrame = P[1269].CFrame, Size = Vector3.new(12.68669605255127,0.4228898584842682,12.263806343078613)} end
if P[1247] then resizeBatch[#resizeBatch+1] = {Part = P[1247], CFrame = P[1247].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
if P[1112] then resizeBatch[#resizeBatch+1] = {Part = P[1112], CFrame = P[1112].CFrame, Size = Vector3.new(12.68669605255127,21.14449119567871,12.263806343078613)} end
batchResize(endpoint, resizeBatch)
local materialBatch = {}
if P[6] then materialBatch[#materialBatch+1] = {Part = P[6], Material = Enum.Material.Plastic} end
if P[10] then materialBatch[#materialBatch+1] = {Part = P[10], Material = Enum.Material.Concrete} end
if P[14] then materialBatch[#materialBatch+1] = {Part = P[14], Material = Enum.Material.SmoothPlastic} end
if P[16] then materialBatch[#materialBatch+1] = {Part = P[16], Material = Enum.Material.SmoothPlastic} end
if P[21] then materialBatch[#materialBatch+1] = {Part = P[21], Material = Enum.Material.SmoothPlastic} end
if P[26] then materialBatch[#materialBatch+1] = {Part = P[26], Material = Enum.Material.SmoothPlastic} end
if P[31] then materialBatch[#materialBatch+1] = {Part = P[31], Material = Enum.Material.Plastic} end
if P[39] then materialBatch[#materialBatch+1] = {Part = P[39], Material = Enum.Material.SmoothPlastic} end
if P[46] then materialBatch[#materialBatch+1] = {Part = P[46], Material = Enum.Material.Wood} end
if P[47] then materialBatch[#materialBatch+1] = {Part = P[47], Material = Enum.Material.Wood} end
if P[48] then materialBatch[#materialBatch+1] = {Part = P[48], Material = Enum.Material.Slate} end
if P[49] then materialBatch[#materialBatch+1] = {Part = P[49], Material = Enum.Material.Slate} end
if P[50] then materialBatch[#materialBatch+1] = {Part = P[50], Material = Enum.Material.Concrete} end
if P[51] then materialBatch[#materialBatch+1] = {Part = P[51], Material = Enum.Material.Wood} end
if P[52] then materialBatch[#materialBatch+1] = {Part = P[52], Material = Enum.Material.Concrete} end
if P[53] then materialBatch[#materialBatch+1] = {Part = P[53], Material = Enum.Material.Wood} end
if P[54] then materialBatch[#materialBatch+1] = {Part = P[54], Material = Enum.Material.Slate} end
if P[55] then materialBatch[#materialBatch+1] = {Part = P[55], Material = Enum.Material.Slate} end
if P[57] then materialBatch[#materialBatch+1] = {Part = P[57], Material = Enum.Material.Plastic} end
if P[58] then materialBatch[#materialBatch+1] = {Part = P[58], Material = Enum.Material.Wood} end
if P[59] then materialBatch[#materialBatch+1] = {Part = P[59], Material = Enum.Material.Wood} end
if P[60] then materialBatch[#materialBatch+1] = {Part = P[60], Material = Enum.Material.Wood} end
if P[61] then materialBatch[#materialBatch+1] = {Part = P[61], Material = Enum.Material.Wood} end
if P[62] then materialBatch[#materialBatch+1] = {Part = P[62], Material = Enum.Material.Plastic} end
if P[63] then materialBatch[#materialBatch+1] = {Part = P[63], Material = Enum.Material.Plastic} end
if P[64] then materialBatch[#materialBatch+1] = {Part = P[64], Material = Enum.Material.Plastic} end
if P[65] then materialBatch[#materialBatch+1] = {Part = P[65], Material = Enum.Material.Wood} end
if P[66] then materialBatch[#materialBatch+1] = {Part = P[66], Material = Enum.Material.Plastic} end
if P[67] then materialBatch[#materialBatch+1] = {Part = P[67], Material = Enum.Material.Plastic} end
if P[68] then materialBatch[#materialBatch+1] = {Part = P[68], Material = Enum.Material.Wood} end
if P[69] then materialBatch[#materialBatch+1] = {Part = P[69], Material = Enum.Material.Plastic} end
if P[70] then materialBatch[#materialBatch+1] = {Part = P[70], Material = Enum.Material.Plastic} end
if P[71] then materialBatch[#materialBatch+1] = {Part = P[71], Material = Enum.Material.Plastic} end
if P[72] then materialBatch[#materialBatch+1] = {Part = P[72], Material = Enum.Material.Plastic} end
if P[73] then materialBatch[#materialBatch+1] = {Part = P[73], Material = Enum.Material.Wood} end
if P[74] then materialBatch[#materialBatch+1] = {Part = P[74], Material = Enum.Material.Wood} end
if P[75] then materialBatch[#materialBatch+1] = {Part = P[75], Material = Enum.Material.Plastic} end
if P[76] then materialBatch[#materialBatch+1] = {Part = P[76], Material = Enum.Material.Wood} end
if P[77] then materialBatch[#materialBatch+1] = {Part = P[77], Material = Enum.Material.Wood} end
if P[78] then materialBatch[#materialBatch+1] = {Part = P[78], Material = Enum.Material.Wood} end
if P[79] then materialBatch[#materialBatch+1] = {Part = P[79], Material = Enum.Material.Wood} end
if P[80] then materialBatch[#materialBatch+1] = {Part = P[80], Material = Enum.Material.Plastic} end
if P[81] then materialBatch[#materialBatch+1] = {Part = P[81], Material = Enum.Material.Plastic} end
if P[84] then materialBatch[#materialBatch+1] = {Part = P[84], Material = Enum.Material.Plastic} end
if P[88] then materialBatch[#materialBatch+1] = {Part = P[88], Material = Enum.Material.Plastic} end
if P[89] then materialBatch[#materialBatch+1] = {Part = P[89], Material = Enum.Material.Plastic} end
if P[92] then materialBatch[#materialBatch+1] = {Part = P[92], Material = Enum.Material.Plastic} end
if P[93] then materialBatch[#materialBatch+1] = {Part = P[93], Material = Enum.Material.Plastic} end
if P[97] then materialBatch[#materialBatch+1] = {Part = P[97], Material = Enum.Material.Plastic} end
if P[98] then materialBatch[#materialBatch+1] = {Part = P[98], Material = Enum.Material.Plastic} end
if P[99] then materialBatch[#materialBatch+1] = {Part = P[99], Material = Enum.Material.Plastic} end
if P[100] then materialBatch[#materialBatch+1] = {Part = P[100], Material = Enum.Material.Plastic} end
if P[101] then materialBatch[#materialBatch+1] = {Part = P[101], Material = Enum.Material.Plastic} end
if P[102] then materialBatch[#materialBatch+1] = {Part = P[102], Material = Enum.Material.Plastic} end
if P[103] then materialBatch[#materialBatch+1] = {Part = P[103], Material = Enum.Material.Plastic} end
if P[104] then materialBatch[#materialBatch+1] = {Part = P[104], Material = Enum.Material.Plastic} end
if P[105] then materialBatch[#materialBatch+1] = {Part = P[105], Material = Enum.Material.Plastic} end
if P[107] then materialBatch[#materialBatch+1] = {Part = P[107], Material = Enum.Material.Plastic} end
if P[108] then materialBatch[#materialBatch+1] = {Part = P[108], Material = Enum.Material.Plastic} end
if P[109] then materialBatch[#materialBatch+1] = {Part = P[109], Material = Enum.Material.Plastic} end
if P[110] then materialBatch[#materialBatch+1] = {Part = P[110], Material = Enum.Material.Plastic} end
if P[111] then materialBatch[#materialBatch+1] = {Part = P[111], Material = Enum.Material.Plastic} end
if P[112] then materialBatch[#materialBatch+1] = {Part = P[112], Material = Enum.Material.Plastic} end
if P[113] then materialBatch[#materialBatch+1] = {Part = P[113], Material = Enum.Material.Plastic} end
if P[114] then materialBatch[#materialBatch+1] = {Part = P[114], Material = Enum.Material.Plastic} end
if P[115] then materialBatch[#materialBatch+1] = {Part = P[115], Material = Enum.Material.Plastic} end
if P[116] then materialBatch[#materialBatch+1] = {Part = P[116], Material = Enum.Material.Plastic} end
if P[117] then materialBatch[#materialBatch+1] = {Part = P[117], Material = Enum.Material.Plastic} end
if P[118] then materialBatch[#materialBatch+1] = {Part = P[118], Material = Enum.Material.Plastic} end
if P[119] then materialBatch[#materialBatch+1] = {Part = P[119], Material = Enum.Material.Plastic} end
if P[123] then materialBatch[#materialBatch+1] = {Part = P[123], Material = Enum.Material.Plastic} end
if P[125] then materialBatch[#materialBatch+1] = {Part = P[125], Material = Enum.Material.Plastic} end
if P[126] then materialBatch[#materialBatch+1] = {Part = P[126], Material = Enum.Material.Plastic} end
if P[127] then materialBatch[#materialBatch+1] = {Part = P[127], Material = Enum.Material.Plastic} end
if P[128] then materialBatch[#materialBatch+1] = {Part = P[128], Material = Enum.Material.Plastic} end
if P[129] then materialBatch[#materialBatch+1] = {Part = P[129], Material = Enum.Material.Plastic} end
if P[130] then materialBatch[#materialBatch+1] = {Part = P[130], Material = Enum.Material.Plastic} end
if P[131] then materialBatch[#materialBatch+1] = {Part = P[131], Material = Enum.Material.Plastic} end
if P[132] then materialBatch[#materialBatch+1] = {Part = P[132], Material = Enum.Material.Plastic} end
if P[133] then materialBatch[#materialBatch+1] = {Part = P[133], Material = Enum.Material.Plastic} end
if P[134] then materialBatch[#materialBatch+1] = {Part = P[134], Material = Enum.Material.Plastic} end
if P[135] then materialBatch[#materialBatch+1] = {Part = P[135], Material = Enum.Material.Plastic} end
if P[136] then materialBatch[#materialBatch+1] = {Part = P[136], Material = Enum.Material.Plastic} end
if P[137] then materialBatch[#materialBatch+1] = {Part = P[137], Material = Enum.Material.Plastic} end
if P[138] then materialBatch[#materialBatch+1] = {Part = P[138], Material = Enum.Material.Plastic} end
if P[139] then materialBatch[#materialBatch+1] = {Part = P[139], Material = Enum.Material.Plastic} end
if P[140] then materialBatch[#materialBatch+1] = {Part = P[140], Material = Enum.Material.Plastic} end
if P[141] then materialBatch[#materialBatch+1] = {Part = P[141], Material = Enum.Material.Plastic} end
if P[142] then materialBatch[#materialBatch+1] = {Part = P[142], Material = Enum.Material.Plastic} end
if P[143] then materialBatch[#materialBatch+1] = {Part = P[143], Material = Enum.Material.Plastic} end
if P[144] then materialBatch[#materialBatch+1] = {Part = P[144], Material = Enum.Material.Plastic} end
if P[145] then materialBatch[#materialBatch+1] = {Part = P[145], Material = Enum.Material.Plastic} end
if P[146] then materialBatch[#materialBatch+1] = {Part = P[146], Material = Enum.Material.Plastic} end
if P[147] then materialBatch[#materialBatch+1] = {Part = P[147], Material = Enum.Material.Plastic} end
if P[148] then materialBatch[#materialBatch+1] = {Part = P[148], Material = Enum.Material.Plastic} end
if P[149] then materialBatch[#materialBatch+1] = {Part = P[149], Material = Enum.Material.Plastic} end
if P[150] then materialBatch[#materialBatch+1] = {Part = P[150], Material = Enum.Material.Plastic} end
if P[151] then materialBatch[#materialBatch+1] = {Part = P[151], Material = Enum.Material.Plastic} end
if P[152] then materialBatch[#materialBatch+1] = {Part = P[152], Material = Enum.Material.Plastic} end
if P[153] then materialBatch[#materialBatch+1] = {Part = P[153], Material = Enum.Material.Plastic} end
if P[154] then materialBatch[#materialBatch+1] = {Part = P[154], Material = Enum.Material.Plastic} end
if P[155] then materialBatch[#materialBatch+1] = {Part = P[155], Material = Enum.Material.Plastic} end
if P[156] then materialBatch[#materialBatch+1] = {Part = P[156], Material = Enum.Material.Plastic} end
if P[157] then materialBatch[#materialBatch+1] = {Part = P[157], Material = Enum.Material.Plastic} end
if P[158] then materialBatch[#materialBatch+1] = {Part = P[158], Material = Enum.Material.Plastic} end
if P[159] then materialBatch[#materialBatch+1] = {Part = P[159], Material = Enum.Material.Plastic} end
if P[161] then materialBatch[#materialBatch+1] = {Part = P[161], Material = Enum.Material.Plastic} end
if P[162] then materialBatch[#materialBatch+1] = {Part = P[162], Material = Enum.Material.Plastic} end
if P[163] then materialBatch[#materialBatch+1] = {Part = P[163], Material = Enum.Material.Plastic} end
if P[164] then materialBatch[#materialBatch+1] = {Part = P[164], Material = Enum.Material.Plastic} end
if P[165] then materialBatch[#materialBatch+1] = {Part = P[165], Material = Enum.Material.Plastic} end
if P[166] then materialBatch[#materialBatch+1] = {Part = P[166], Material = Enum.Material.Plastic} end
if P[167] then materialBatch[#materialBatch+1] = {Part = P[167], Material = Enum.Material.Plastic} end
if P[168] then materialBatch[#materialBatch+1] = {Part = P[168], Material = Enum.Material.Plastic} end
if P[169] then materialBatch[#materialBatch+1] = {Part = P[169], Material = Enum.Material.Plastic} end
if P[170] then materialBatch[#materialBatch+1] = {Part = P[170], Material = Enum.Material.Plastic} end
if P[171] then materialBatch[#materialBatch+1] = {Part = P[171], Material = Enum.Material.Plastic} end
if P[172] then materialBatch[#materialBatch+1] = {Part = P[172], Material = Enum.Material.Plastic} end
if P[173] then materialBatch[#materialBatch+1] = {Part = P[173], Material = Enum.Material.Plastic} end
if P[174] then materialBatch[#materialBatch+1] = {Part = P[174], Material = Enum.Material.Plastic} end
if P[175] then materialBatch[#materialBatch+1] = {Part = P[175], Material = Enum.Material.Plastic} end
if P[176] then materialBatch[#materialBatch+1] = {Part = P[176], Material = Enum.Material.Plastic} end
if P[177] then materialBatch[#materialBatch+1] = {Part = P[177], Material = Enum.Material.Plastic} end
if P[178] then materialBatch[#materialBatch+1] = {Part = P[178], Material = Enum.Material.Plastic} end
if P[179] then materialBatch[#materialBatch+1] = {Part = P[179], Material = Enum.Material.Plastic} end
if P[180] then materialBatch[#materialBatch+1] = {Part = P[180], Material = Enum.Material.Plastic} end
if P[181] then materialBatch[#materialBatch+1] = {Part = P[181], Material = Enum.Material.Plastic} end
if P[182] then materialBatch[#materialBatch+1] = {Part = P[182], Material = Enum.Material.Plastic} end
if P[183] then materialBatch[#materialBatch+1] = {Part = P[183], Material = Enum.Material.Plastic} end
if P[184] then materialBatch[#materialBatch+1] = {Part = P[184], Material = Enum.Material.Plastic} end
if P[185] then materialBatch[#materialBatch+1] = {Part = P[185], Material = Enum.Material.Plastic} end
if P[186] then materialBatch[#materialBatch+1] = {Part = P[186], Material = Enum.Material.Plastic} end
if P[187] then materialBatch[#materialBatch+1] = {Part = P[187], Material = Enum.Material.Plastic} end
if P[188] then materialBatch[#materialBatch+1] = {Part = P[188], Material = Enum.Material.Plastic} end
if P[189] then materialBatch[#materialBatch+1] = {Part = P[189], Material = Enum.Material.Plastic} end
if P[190] then materialBatch[#materialBatch+1] = {Part = P[190], Material = Enum.Material.Plastic} end
if P[191] then materialBatch[#materialBatch+1] = {Part = P[191], Material = Enum.Material.Plastic} end
if P[192] then materialBatch[#materialBatch+1] = {Part = P[192], Material = Enum.Material.Plastic} end
if P[193] then materialBatch[#materialBatch+1] = {Part = P[193], Material = Enum.Material.Plastic} end
if P[194] then materialBatch[#materialBatch+1] = {Part = P[194], Material = Enum.Material.Plastic} end
if P[195] then materialBatch[#materialBatch+1] = {Part = P[195], Material = Enum.Material.Plastic} end
if P[196] then materialBatch[#materialBatch+1] = {Part = P[196], Material = Enum.Material.Plastic} end
if P[197] then materialBatch[#materialBatch+1] = {Part = P[197], Material = Enum.Material.Plastic} end
if P[198] then materialBatch[#materialBatch+1] = {Part = P[198], Material = Enum.Material.Plastic} end
if P[199] then materialBatch[#materialBatch+1] = {Part = P[199], Material = Enum.Material.Plastic} end
if P[201] then materialBatch[#materialBatch+1] = {Part = P[201], Material = Enum.Material.Plastic} end
if P[202] then materialBatch[#materialBatch+1] = {Part = P[202], Material = Enum.Material.Plastic} end
if P[203] then materialBatch[#materialBatch+1] = {Part = P[203], Material = Enum.Material.Plastic} end
if P[204] then materialBatch[#materialBatch+1] = {Part = P[204], Material = Enum.Material.Plastic} end
if P[205] then materialBatch[#materialBatch+1] = {Part = P[205], Material = Enum.Material.Plastic} end
if P[206] then materialBatch[#materialBatch+1] = {Part = P[206], Material = Enum.Material.Plastic} end
if P[207] then materialBatch[#materialBatch+1] = {Part = P[207], Material = Enum.Material.Plastic} end
if P[208] then materialBatch[#materialBatch+1] = {Part = P[208], Material = Enum.Material.Plastic} end
if P[209] then materialBatch[#materialBatch+1] = {Part = P[209], Material = Enum.Material.Plastic} end
if P[210] then materialBatch[#materialBatch+1] = {Part = P[210], Material = Enum.Material.Plastic} end
if P[211] then materialBatch[#materialBatch+1] = {Part = P[211], Material = Enum.Material.Plastic} end
if P[212] then materialBatch[#materialBatch+1] = {Part = P[212], Material = Enum.Material.Plastic} end
if P[213] then materialBatch[#materialBatch+1] = {Part = P[213], Material = Enum.Material.Plastic} end
if P[214] then materialBatch[#materialBatch+1] = {Part = P[214], Material = Enum.Material.Plastic} end
if P[215] then materialBatch[#materialBatch+1] = {Part = P[215], Material = Enum.Material.Plastic} end
if P[216] then materialBatch[#materialBatch+1] = {Part = P[216], Material = Enum.Material.Plastic} end
if P[217] then materialBatch[#materialBatch+1] = {Part = P[217], Material = Enum.Material.Plastic} end
if P[218] then materialBatch[#materialBatch+1] = {Part = P[218], Material = Enum.Material.Plastic} end
if P[219] then materialBatch[#materialBatch+1] = {Part = P[219], Material = Enum.Material.Plastic} end
if P[220] then materialBatch[#materialBatch+1] = {Part = P[220], Material = Enum.Material.Plastic} end
if P[221] then materialBatch[#materialBatch+1] = {Part = P[221], Material = Enum.Material.Plastic} end
if P[222] then materialBatch[#materialBatch+1] = {Part = P[222], Material = Enum.Material.Plastic} end
if P[223] then materialBatch[#materialBatch+1] = {Part = P[223], Material = Enum.Material.Plastic} end
if P[224] then materialBatch[#materialBatch+1] = {Part = P[224], Material = Enum.Material.Plastic} end
if P[225] then materialBatch[#materialBatch+1] = {Part = P[225], Material = Enum.Material.Plastic} end
if P[226] then materialBatch[#materialBatch+1] = {Part = P[226], Material = Enum.Material.Plastic} end
if P[227] then materialBatch[#materialBatch+1] = {Part = P[227], Material = Enum.Material.Plastic} end
if P[230] then materialBatch[#materialBatch+1] = {Part = P[230], Material = Enum.Material.Plastic} end
if P[231] then materialBatch[#materialBatch+1] = {Part = P[231], Material = Enum.Material.Plastic} end
if P[232] then materialBatch[#materialBatch+1] = {Part = P[232], Material = Enum.Material.Plastic} end
if P[233] then materialBatch[#materialBatch+1] = {Part = P[233], Material = Enum.Material.Plastic} end
if P[234] then materialBatch[#materialBatch+1] = {Part = P[234], Material = Enum.Material.Plastic} end
if P[235] then materialBatch[#materialBatch+1] = {Part = P[235], Material = Enum.Material.Plastic} end
if P[236] then materialBatch[#materialBatch+1] = {Part = P[236], Material = Enum.Material.Plastic} end
if P[237] then materialBatch[#materialBatch+1] = {Part = P[237], Material = Enum.Material.Plastic} end
if P[238] then materialBatch[#materialBatch+1] = {Part = P[238], Material = Enum.Material.Plastic} end
if P[239] then materialBatch[#materialBatch+1] = {Part = P[239], Material = Enum.Material.Plastic} end
if P[240] then materialBatch[#materialBatch+1] = {Part = P[240], Material = Enum.Material.Plastic} end
if P[241] then materialBatch[#materialBatch+1] = {Part = P[241], Material = Enum.Material.Plastic} end
if P[242] then materialBatch[#materialBatch+1] = {Part = P[242], Material = Enum.Material.Plastic} end
if P[243] then materialBatch[#materialBatch+1] = {Part = P[243], Material = Enum.Material.Plastic} end
if P[244] then materialBatch[#materialBatch+1] = {Part = P[244], Material = Enum.Material.Plastic} end
if P[245] then materialBatch[#materialBatch+1] = {Part = P[245], Material = Enum.Material.Plastic} end
if P[246] then materialBatch[#materialBatch+1] = {Part = P[246], Material = Enum.Material.Plastic} end
if P[247] then materialBatch[#materialBatch+1] = {Part = P[247], Material = Enum.Material.Plastic} end
if P[248] then materialBatch[#materialBatch+1] = {Part = P[248], Material = Enum.Material.Plastic} end
if P[249] then materialBatch[#materialBatch+1] = {Part = P[249], Material = Enum.Material.Plastic} end
if P[250] then materialBatch[#materialBatch+1] = {Part = P[250], Material = Enum.Material.Plastic} end
if P[251] then materialBatch[#materialBatch+1] = {Part = P[251], Material = Enum.Material.Plastic} end
if P[252] then materialBatch[#materialBatch+1] = {Part = P[252], Material = Enum.Material.Plastic} end
if P[253] then materialBatch[#materialBatch+1] = {Part = P[253], Material = Enum.Material.Plastic} end
if P[254] then materialBatch[#materialBatch+1] = {Part = P[254], Material = Enum.Material.Plastic} end
if P[255] then materialBatch[#materialBatch+1] = {Part = P[255], Material = Enum.Material.Plastic} end
if P[256] then materialBatch[#materialBatch+1] = {Part = P[256], Material = Enum.Material.Plastic} end
if P[257] then materialBatch[#materialBatch+1] = {Part = P[257], Material = Enum.Material.Plastic} end
if P[258] then materialBatch[#materialBatch+1] = {Part = P[258], Material = Enum.Material.Plastic} end
if P[259] then materialBatch[#materialBatch+1] = {Part = P[259], Material = Enum.Material.Plastic} end
if P[260] then materialBatch[#materialBatch+1] = {Part = P[260], Material = Enum.Material.Plastic} end
if P[262] then materialBatch[#materialBatch+1] = {Part = P[262], Material = Enum.Material.Plastic} end
if P[263] then materialBatch[#materialBatch+1] = {Part = P[263], Material = Enum.Material.Plastic} end
if P[264] then materialBatch[#materialBatch+1] = {Part = P[264], Material = Enum.Material.Plastic} end
if P[265] then materialBatch[#materialBatch+1] = {Part = P[265], Material = Enum.Material.Plastic} end
if P[266] then materialBatch[#materialBatch+1] = {Part = P[266], Material = Enum.Material.Plastic} end
if P[267] then materialBatch[#materialBatch+1] = {Part = P[267], Material = Enum.Material.Plastic} end
if P[268] then materialBatch[#materialBatch+1] = {Part = P[268], Material = Enum.Material.Plastic} end
if P[269] then materialBatch[#materialBatch+1] = {Part = P[269], Material = Enum.Material.Plastic} end
if P[270] then materialBatch[#materialBatch+1] = {Part = P[270], Material = Enum.Material.Plastic} end
if P[271] then materialBatch[#materialBatch+1] = {Part = P[271], Material = Enum.Material.Plastic} end
if P[272] then materialBatch[#materialBatch+1] = {Part = P[272], Material = Enum.Material.Plastic} end
if P[273] then materialBatch[#materialBatch+1] = {Part = P[273], Material = Enum.Material.Plastic} end
if P[274] then materialBatch[#materialBatch+1] = {Part = P[274], Material = Enum.Material.Plastic} end
if P[275] then materialBatch[#materialBatch+1] = {Part = P[275], Material = Enum.Material.Plastic} end
if P[276] then materialBatch[#materialBatch+1] = {Part = P[276], Material = Enum.Material.Plastic} end
if P[277] then materialBatch[#materialBatch+1] = {Part = P[277], Material = Enum.Material.Plastic} end
if P[278] then materialBatch[#materialBatch+1] = {Part = P[278], Material = Enum.Material.Plastic} end
if P[279] then materialBatch[#materialBatch+1] = {Part = P[279], Material = Enum.Material.Plastic} end
if P[280] then materialBatch[#materialBatch+1] = {Part = P[280], Material = Enum.Material.Plastic} end
if P[281] then materialBatch[#materialBatch+1] = {Part = P[281], Material = Enum.Material.Plastic} end
if P[282] then materialBatch[#materialBatch+1] = {Part = P[282], Material = Enum.Material.Plastic} end
if P[283] then materialBatch[#materialBatch+1] = {Part = P[283], Material = Enum.Material.Plastic} end
if P[284] then materialBatch[#materialBatch+1] = {Part = P[284], Material = Enum.Material.Plastic} end
if P[285] then materialBatch[#materialBatch+1] = {Part = P[285], Material = Enum.Material.Plastic} end
if P[286] then materialBatch[#materialBatch+1] = {Part = P[286], Material = Enum.Material.Plastic} end
if P[288] then materialBatch[#materialBatch+1] = {Part = P[288], Material = Enum.Material.Plastic} end
if P[289] then materialBatch[#materialBatch+1] = {Part = P[289], Material = Enum.Material.Plastic} end
if P[290] then materialBatch[#materialBatch+1] = {Part = P[290], Material = Enum.Material.Plastic} end
if P[291] then materialBatch[#materialBatch+1] = {Part = P[291], Material = Enum.Material.Plastic} end
if P[292] then materialBatch[#materialBatch+1] = {Part = P[292], Material = Enum.Material.Plastic} end
if P[293] then materialBatch[#materialBatch+1] = {Part = P[293], Material = Enum.Material.Plastic} end
if P[294] then materialBatch[#materialBatch+1] = {Part = P[294], Material = Enum.Material.Plastic} end
if P[295] then materialBatch[#materialBatch+1] = {Part = P[295], Material = Enum.Material.Plastic} end
if P[296] then materialBatch[#materialBatch+1] = {Part = P[296], Material = Enum.Material.Plastic} end
if P[297] then materialBatch[#materialBatch+1] = {Part = P[297], Material = Enum.Material.Plastic} end
if P[298] then materialBatch[#materialBatch+1] = {Part = P[298], Material = Enum.Material.Plastic} end
if P[299] then materialBatch[#materialBatch+1] = {Part = P[299], Material = Enum.Material.Plastic} end
if P[300] then materialBatch[#materialBatch+1] = {Part = P[300], Material = Enum.Material.Plastic} end
if P[301] then materialBatch[#materialBatch+1] = {Part = P[301], Material = Enum.Material.Plastic} end
if P[302] then materialBatch[#materialBatch+1] = {Part = P[302], Material = Enum.Material.Plastic} end
if P[304] then materialBatch[#materialBatch+1] = {Part = P[304], Material = Enum.Material.Plastic} end
if P[305] then materialBatch[#materialBatch+1] = {Part = P[305], Material = Enum.Material.Plastic} end
if P[306] then materialBatch[#materialBatch+1] = {Part = P[306], Material = Enum.Material.Plastic} end
if P[307] then materialBatch[#materialBatch+1] = {Part = P[307], Material = Enum.Material.Plastic} end
if P[308] then materialBatch[#materialBatch+1] = {Part = P[308], Material = Enum.Material.Plastic} end
if P[309] then materialBatch[#materialBatch+1] = {Part = P[309], Material = Enum.Material.Plastic} end
if P[310] then materialBatch[#materialBatch+1] = {Part = P[310], Material = Enum.Material.Plastic} end
if P[311] then materialBatch[#materialBatch+1] = {Part = P[311], Material = Enum.Material.Plastic} end
if P[312] then materialBatch[#materialBatch+1] = {Part = P[312], Material = Enum.Material.Plastic} end
if P[313] then materialBatch[#materialBatch+1] = {Part = P[313], Material = Enum.Material.Plastic} end
if P[314] then materialBatch[#materialBatch+1] = {Part = P[314], Material = Enum.Material.Plastic} end
if P[315] then materialBatch[#materialBatch+1] = {Part = P[315], Material = Enum.Material.Plastic} end
if P[316] then materialBatch[#materialBatch+1] = {Part = P[316], Material = Enum.Material.Plastic} end
if P[317] then materialBatch[#materialBatch+1] = {Part = P[317], Material = Enum.Material.Plastic} end
if P[318] then materialBatch[#materialBatch+1] = {Part = P[318], Material = Enum.Material.Plastic} end
if P[319] then materialBatch[#materialBatch+1] = {Part = P[319], Material = Enum.Material.Plastic} end
if P[320] then materialBatch[#materialBatch+1] = {Part = P[320], Material = Enum.Material.Plastic} end
if P[321] then materialBatch[#materialBatch+1] = {Part = P[321], Material = Enum.Material.Plastic} end
if P[322] then materialBatch[#materialBatch+1] = {Part = P[322], Material = Enum.Material.Plastic} end
if P[323] then materialBatch[#materialBatch+1] = {Part = P[323], Material = Enum.Material.Plastic} end
if P[324] then materialBatch[#materialBatch+1] = {Part = P[324], Material = Enum.Material.Plastic} end
if P[325] then materialBatch[#materialBatch+1] = {Part = P[325], Material = Enum.Material.Plastic} end
if P[326] then materialBatch[#materialBatch+1] = {Part = P[326], Material = Enum.Material.Plastic} end
if P[327] then materialBatch[#materialBatch+1] = {Part = P[327], Material = Enum.Material.Plastic} end
if P[328] then materialBatch[#materialBatch+1] = {Part = P[328], Material = Enum.Material.Plastic} end
if P[329] then materialBatch[#materialBatch+1] = {Part = P[329], Material = Enum.Material.Plastic} end
if P[330] then materialBatch[#materialBatch+1] = {Part = P[330], Material = Enum.Material.Plastic} end
if P[331] then materialBatch[#materialBatch+1] = {Part = P[331], Material = Enum.Material.Plastic} end
if P[332] then materialBatch[#materialBatch+1] = {Part = P[332], Material = Enum.Material.Plastic} end
if P[333] then materialBatch[#materialBatch+1] = {Part = P[333], Material = Enum.Material.Plastic} end
if P[334] then materialBatch[#materialBatch+1] = {Part = P[334], Material = Enum.Material.Plastic} end
if P[335] then materialBatch[#materialBatch+1] = {Part = P[335], Material = Enum.Material.Plastic} end
if P[336] then materialBatch[#materialBatch+1] = {Part = P[336], Material = Enum.Material.Plastic} end
if P[337] then materialBatch[#materialBatch+1] = {Part = P[337], Material = Enum.Material.Plastic} end
if P[338] then materialBatch[#materialBatch+1] = {Part = P[338], Material = Enum.Material.Plastic} end
if P[339] then materialBatch[#materialBatch+1] = {Part = P[339], Material = Enum.Material.Plastic} end
if P[340] then materialBatch[#materialBatch+1] = {Part = P[340], Material = Enum.Material.Plastic} end
if P[341] then materialBatch[#materialBatch+1] = {Part = P[341], Material = Enum.Material.Plastic} end
if P[342] then materialBatch[#materialBatch+1] = {Part = P[342], Material = Enum.Material.Plastic} end
if P[343] then materialBatch[#materialBatch+1] = {Part = P[343], Material = Enum.Material.Plastic} end
if P[344] then materialBatch[#materialBatch+1] = {Part = P[344], Material = Enum.Material.Plastic} end
if P[345] then materialBatch[#materialBatch+1] = {Part = P[345], Material = Enum.Material.Plastic} end
if P[346] then materialBatch[#materialBatch+1] = {Part = P[346], Material = Enum.Material.Plastic} end
if P[347] then materialBatch[#materialBatch+1] = {Part = P[347], Material = Enum.Material.Plastic} end
if P[348] then materialBatch[#materialBatch+1] = {Part = P[348], Material = Enum.Material.Plastic} end
if P[349] then materialBatch[#materialBatch+1] = {Part = P[349], Material = Enum.Material.Plastic} end
if P[350] then materialBatch[#materialBatch+1] = {Part = P[350], Material = Enum.Material.Plastic} end
if P[351] then materialBatch[#materialBatch+1] = {Part = P[351], Material = Enum.Material.Plastic} end
if P[352] then materialBatch[#materialBatch+1] = {Part = P[352], Material = Enum.Material.Plastic} end
if P[353] then materialBatch[#materialBatch+1] = {Part = P[353], Material = Enum.Material.Plastic} end
if P[354] then materialBatch[#materialBatch+1] = {Part = P[354], Material = Enum.Material.Plastic} end
if P[355] then materialBatch[#materialBatch+1] = {Part = P[355], Material = Enum.Material.Plastic} end
if P[356] then materialBatch[#materialBatch+1] = {Part = P[356], Material = Enum.Material.Plastic} end
if P[357] then materialBatch[#materialBatch+1] = {Part = P[357], Material = Enum.Material.Plastic} end
if P[358] then materialBatch[#materialBatch+1] = {Part = P[358], Material = Enum.Material.Plastic} end
if P[359] then materialBatch[#materialBatch+1] = {Part = P[359], Material = Enum.Material.Plastic} end
if P[360] then materialBatch[#materialBatch+1] = {Part = P[360], Material = Enum.Material.Plastic} end
if P[361] then materialBatch[#materialBatch+1] = {Part = P[361], Material = Enum.Material.Plastic} end
if P[362] then materialBatch[#materialBatch+1] = {Part = P[362], Material = Enum.Material.Plastic} end
if P[363] then materialBatch[#materialBatch+1] = {Part = P[363], Material = Enum.Material.Plastic} end
if P[364] then materialBatch[#materialBatch+1] = {Part = P[364], Material = Enum.Material.Plastic} end
if P[365] then materialBatch[#materialBatch+1] = {Part = P[365], Material = Enum.Material.Plastic} end
if P[366] then materialBatch[#materialBatch+1] = {Part = P[366], Material = Enum.Material.Plastic} end
if P[367] then materialBatch[#materialBatch+1] = {Part = P[367], Material = Enum.Material.Plastic} end
if P[368] then materialBatch[#materialBatch+1] = {Part = P[368], Material = Enum.Material.Plastic} end
if P[369] then materialBatch[#materialBatch+1] = {Part = P[369], Material = Enum.Material.Plastic} end
if P[370] then materialBatch[#materialBatch+1] = {Part = P[370], Material = Enum.Material.Plastic} end
if P[371] then materialBatch[#materialBatch+1] = {Part = P[371], Material = Enum.Material.Plastic} end
if P[373] then materialBatch[#materialBatch+1] = {Part = P[373], Material = Enum.Material.Plastic} end
if P[374] then materialBatch[#materialBatch+1] = {Part = P[374], Material = Enum.Material.Plastic} end
if P[375] then materialBatch[#materialBatch+1] = {Part = P[375], Material = Enum.Material.Plastic} end
if P[376] then materialBatch[#materialBatch+1] = {Part = P[376], Material = Enum.Material.Plastic} end
if P[377] then materialBatch[#materialBatch+1] = {Part = P[377], Material = Enum.Material.Plastic} end
if P[378] then materialBatch[#materialBatch+1] = {Part = P[378], Material = Enum.Material.Plastic} end
if P[379] then materialBatch[#materialBatch+1] = {Part = P[379], Material = Enum.Material.Plastic} end
if P[380] then materialBatch[#materialBatch+1] = {Part = P[380], Material = Enum.Material.Plastic} end
if P[381] then materialBatch[#materialBatch+1] = {Part = P[381], Material = Enum.Material.Plastic} end
if P[382] then materialBatch[#materialBatch+1] = {Part = P[382], Material = Enum.Material.Plastic} end
if P[383] then materialBatch[#materialBatch+1] = {Part = P[383], Material = Enum.Material.Plastic} end
if P[384] then materialBatch[#materialBatch+1] = {Part = P[384], Material = Enum.Material.Plastic} end
if P[385] then materialBatch[#materialBatch+1] = {Part = P[385], Material = Enum.Material.Concrete} end
if P[388] then materialBatch[#materialBatch+1] = {Part = P[388], Material = Enum.Material.Plastic} end
if P[389] then materialBatch[#materialBatch+1] = {Part = P[389], Material = Enum.Material.Plastic} end
if P[390] then materialBatch[#materialBatch+1] = {Part = P[390], Material = Enum.Material.Plastic} end
if P[391] then materialBatch[#materialBatch+1] = {Part = P[391], Material = Enum.Material.Plastic} end
if P[392] then materialBatch[#materialBatch+1] = {Part = P[392], Material = Enum.Material.Plastic} end
if P[393] then materialBatch[#materialBatch+1] = {Part = P[393], Material = Enum.Material.Plastic} end
if P[394] then materialBatch[#materialBatch+1] = {Part = P[394], Material = Enum.Material.Plastic} end
if P[395] then materialBatch[#materialBatch+1] = {Part = P[395], Material = Enum.Material.Plastic} end
if P[396] then materialBatch[#materialBatch+1] = {Part = P[396], Material = Enum.Material.Plastic} end
if P[397] then materialBatch[#materialBatch+1] = {Part = P[397], Material = Enum.Material.Plastic} end
if P[398] then materialBatch[#materialBatch+1] = {Part = P[398], Material = Enum.Material.Plastic} end
if P[399] then materialBatch[#materialBatch+1] = {Part = P[399], Material = Enum.Material.Plastic} end
if P[400] then materialBatch[#materialBatch+1] = {Part = P[400], Material = Enum.Material.Plastic} end
if P[401] then materialBatch[#materialBatch+1] = {Part = P[401], Material = Enum.Material.Plastic} end
if P[402] then materialBatch[#materialBatch+1] = {Part = P[402], Material = Enum.Material.Plastic} end
if P[403] then materialBatch[#materialBatch+1] = {Part = P[403], Material = Enum.Material.Plastic} end
if P[404] then materialBatch[#materialBatch+1] = {Part = P[404], Material = Enum.Material.Plastic} end
if P[405] then materialBatch[#materialBatch+1] = {Part = P[405], Material = Enum.Material.Plastic} end
if P[406] then materialBatch[#materialBatch+1] = {Part = P[406], Material = Enum.Material.Plastic} end
if P[407] then materialBatch[#materialBatch+1] = {Part = P[407], Material = Enum.Material.Plastic} end
if P[408] then materialBatch[#materialBatch+1] = {Part = P[408], Material = Enum.Material.Plastic} end
if P[409] then materialBatch[#materialBatch+1] = {Part = P[409], Material = Enum.Material.Plastic} end
if P[410] then materialBatch[#materialBatch+1] = {Part = P[410], Material = Enum.Material.Plastic} end
if P[411] then materialBatch[#materialBatch+1] = {Part = P[411], Material = Enum.Material.Plastic} end
if P[412] then materialBatch[#materialBatch+1] = {Part = P[412], Material = Enum.Material.Plastic} end
if P[413] then materialBatch[#materialBatch+1] = {Part = P[413], Material = Enum.Material.Plastic} end
if P[414] then materialBatch[#materialBatch+1] = {Part = P[414], Material = Enum.Material.Plastic} end
if P[415] then materialBatch[#materialBatch+1] = {Part = P[415], Material = Enum.Material.Plastic} end
if P[416] then materialBatch[#materialBatch+1] = {Part = P[416], Material = Enum.Material.Plastic} end
if P[417] then materialBatch[#materialBatch+1] = {Part = P[417], Material = Enum.Material.Plastic} end
if P[418] then materialBatch[#materialBatch+1] = {Part = P[418], Material = Enum.Material.Plastic} end
if P[419] then materialBatch[#materialBatch+1] = {Part = P[419], Material = Enum.Material.Plastic} end
if P[420] then materialBatch[#materialBatch+1] = {Part = P[420], Material = Enum.Material.Plastic} end
if P[421] then materialBatch[#materialBatch+1] = {Part = P[421], Material = Enum.Material.Plastic} end
if P[422] then materialBatch[#materialBatch+1] = {Part = P[422], Material = Enum.Material.Plastic} end
if P[423] then materialBatch[#materialBatch+1] = {Part = P[423], Material = Enum.Material.Plastic} end
if P[424] then materialBatch[#materialBatch+1] = {Part = P[424], Material = Enum.Material.Plastic} end
if P[425] then materialBatch[#materialBatch+1] = {Part = P[425], Material = Enum.Material.Plastic} end
if P[426] then materialBatch[#materialBatch+1] = {Part = P[426], Material = Enum.Material.Plastic} end
if P[427] then materialBatch[#materialBatch+1] = {Part = P[427], Material = Enum.Material.Plastic} end
if P[428] then materialBatch[#materialBatch+1] = {Part = P[428], Material = Enum.Material.Plastic} end
if P[429] then materialBatch[#materialBatch+1] = {Part = P[429], Material = Enum.Material.Plastic} end
if P[430] then materialBatch[#materialBatch+1] = {Part = P[430], Material = Enum.Material.Plastic} end
if P[431] then materialBatch[#materialBatch+1] = {Part = P[431], Material = Enum.Material.Plastic} end
if P[432] then materialBatch[#materialBatch+1] = {Part = P[432], Material = Enum.Material.Plastic} end
if P[433] then materialBatch[#materialBatch+1] = {Part = P[433], Material = Enum.Material.Plastic} end
if P[434] then materialBatch[#materialBatch+1] = {Part = P[434], Material = Enum.Material.Plastic} end
if P[435] then materialBatch[#materialBatch+1] = {Part = P[435], Material = Enum.Material.Plastic} end
if P[436] then materialBatch[#materialBatch+1] = {Part = P[436], Material = Enum.Material.Plastic} end
if P[437] then materialBatch[#materialBatch+1] = {Part = P[437], Material = Enum.Material.Plastic} end
if P[438] then materialBatch[#materialBatch+1] = {Part = P[438], Material = Enum.Material.Plastic} end
if P[439] then materialBatch[#materialBatch+1] = {Part = P[439], Material = Enum.Material.Plastic} end
if P[440] then materialBatch[#materialBatch+1] = {Part = P[440], Material = Enum.Material.Plastic} end
if P[441] then materialBatch[#materialBatch+1] = {Part = P[441], Material = Enum.Material.Plastic} end
if P[442] then materialBatch[#materialBatch+1] = {Part = P[442], Material = Enum.Material.Plastic} end
if P[443] then materialBatch[#materialBatch+1] = {Part = P[443], Material = Enum.Material.Plastic} end
if P[444] then materialBatch[#materialBatch+1] = {Part = P[444], Material = Enum.Material.Plastic} end
if P[445] then materialBatch[#materialBatch+1] = {Part = P[445], Material = Enum.Material.Plastic} end
if P[446] then materialBatch[#materialBatch+1] = {Part = P[446], Material = Enum.Material.Plastic} end
if P[447] then materialBatch[#materialBatch+1] = {Part = P[447], Material = Enum.Material.Plastic} end
if P[448] then materialBatch[#materialBatch+1] = {Part = P[448], Material = Enum.Material.Plastic} end
if P[449] then materialBatch[#materialBatch+1] = {Part = P[449], Material = Enum.Material.Plastic} end
if P[450] then materialBatch[#materialBatch+1] = {Part = P[450], Material = Enum.Material.Plastic} end
if P[451] then materialBatch[#materialBatch+1] = {Part = P[451], Material = Enum.Material.Plastic} end
if P[452] then materialBatch[#materialBatch+1] = {Part = P[452], Material = Enum.Material.Plastic} end
if P[453] then materialBatch[#materialBatch+1] = {Part = P[453], Material = Enum.Material.Plastic} end
if P[454] then materialBatch[#materialBatch+1] = {Part = P[454], Material = Enum.Material.Plastic} end
if P[455] then materialBatch[#materialBatch+1] = {Part = P[455], Material = Enum.Material.Plastic} end
if P[456] then materialBatch[#materialBatch+1] = {Part = P[456], Material = Enum.Material.Plastic} end
if P[457] then materialBatch[#materialBatch+1] = {Part = P[457], Material = Enum.Material.Plastic} end
if P[458] then materialBatch[#materialBatch+1] = {Part = P[458], Material = Enum.Material.Plastic} end
if P[459] then materialBatch[#materialBatch+1] = {Part = P[459], Material = Enum.Material.Plastic} end
if P[460] then materialBatch[#materialBatch+1] = {Part = P[460], Material = Enum.Material.Plastic} end
if P[461] then materialBatch[#materialBatch+1] = {Part = P[461], Material = Enum.Material.Plastic} end
if P[462] then materialBatch[#materialBatch+1] = {Part = P[462], Material = Enum.Material.Plastic} end
if P[463] then materialBatch[#materialBatch+1] = {Part = P[463], Material = Enum.Material.Plastic} end
if P[464] then materialBatch[#materialBatch+1] = {Part = P[464], Material = Enum.Material.Plastic} end
if P[465] then materialBatch[#materialBatch+1] = {Part = P[465], Material = Enum.Material.Plastic} end
if P[466] then materialBatch[#materialBatch+1] = {Part = P[466], Material = Enum.Material.Plastic} end
if P[467] then materialBatch[#materialBatch+1] = {Part = P[467], Material = Enum.Material.Plastic} end
if P[468] then materialBatch[#materialBatch+1] = {Part = P[468], Material = Enum.Material.Plastic} end
if P[469] then materialBatch[#materialBatch+1] = {Part = P[469], Material = Enum.Material.Plastic} end
if P[470] then materialBatch[#materialBatch+1] = {Part = P[470], Material = Enum.Material.Plastic} end
if P[471] then materialBatch[#materialBatch+1] = {Part = P[471], Material = Enum.Material.Plastic} end
if P[472] then materialBatch[#materialBatch+1] = {Part = P[472], Material = Enum.Material.Plastic} end
if P[473] then materialBatch[#materialBatch+1] = {Part = P[473], Material = Enum.Material.Plastic} end
if P[474] then materialBatch[#materialBatch+1] = {Part = P[474], Material = Enum.Material.Plastic} end
if P[475] then materialBatch[#materialBatch+1] = {Part = P[475], Material = Enum.Material.Plastic} end
if P[476] then materialBatch[#materialBatch+1] = {Part = P[476], Material = Enum.Material.Plastic} end
if P[477] then materialBatch[#materialBatch+1] = {Part = P[477], Material = Enum.Material.Plastic} end
if P[478] then materialBatch[#materialBatch+1] = {Part = P[478], Material = Enum.Material.Plastic} end
if P[479] then materialBatch[#materialBatch+1] = {Part = P[479], Material = Enum.Material.Plastic} end
if P[480] then materialBatch[#materialBatch+1] = {Part = P[480], Material = Enum.Material.Plastic} end
if P[481] then materialBatch[#materialBatch+1] = {Part = P[481], Material = Enum.Material.Plastic} end
if P[482] then materialBatch[#materialBatch+1] = {Part = P[482], Material = Enum.Material.Plastic} end
if P[483] then materialBatch[#materialBatch+1] = {Part = P[483], Material = Enum.Material.Plastic} end
if P[484] then materialBatch[#materialBatch+1] = {Part = P[484], Material = Enum.Material.Plastic} end
if P[485] then materialBatch[#materialBatch+1] = {Part = P[485], Material = Enum.Material.Plastic} end
if P[486] then materialBatch[#materialBatch+1] = {Part = P[486], Material = Enum.Material.Plastic} end
if P[487] then materialBatch[#materialBatch+1] = {Part = P[487], Material = Enum.Material.Plastic} end
if P[488] then materialBatch[#materialBatch+1] = {Part = P[488], Material = Enum.Material.Plastic} end
if P[489] then materialBatch[#materialBatch+1] = {Part = P[489], Material = Enum.Material.Plastic} end
if P[490] then materialBatch[#materialBatch+1] = {Part = P[490], Material = Enum.Material.Plastic} end
if P[493] then materialBatch[#materialBatch+1] = {Part = P[493], Material = Enum.Material.Plastic} end
if P[494] then materialBatch[#materialBatch+1] = {Part = P[494], Material = Enum.Material.Plastic} end
if P[495] then materialBatch[#materialBatch+1] = {Part = P[495], Material = Enum.Material.Plastic} end
if P[496] then materialBatch[#materialBatch+1] = {Part = P[496], Material = Enum.Material.Plastic} end
if P[497] then materialBatch[#materialBatch+1] = {Part = P[497], Material = Enum.Material.Plastic} end
if P[498] then materialBatch[#materialBatch+1] = {Part = P[498], Material = Enum.Material.Plastic} end
if P[499] then materialBatch[#materialBatch+1] = {Part = P[499], Material = Enum.Material.Plastic} end
if P[500] then materialBatch[#materialBatch+1] = {Part = P[500], Material = Enum.Material.Plastic} end
if P[501] then materialBatch[#materialBatch+1] = {Part = P[501], Material = Enum.Material.Plastic} end
if P[502] then materialBatch[#materialBatch+1] = {Part = P[502], Material = Enum.Material.Plastic} end
if P[503] then materialBatch[#materialBatch+1] = {Part = P[503], Material = Enum.Material.Plastic} end
if P[504] then materialBatch[#materialBatch+1] = {Part = P[504], Material = Enum.Material.Plastic} end
if P[505] then materialBatch[#materialBatch+1] = {Part = P[505], Material = Enum.Material.Plastic} end
if P[506] then materialBatch[#materialBatch+1] = {Part = P[506], Material = Enum.Material.Plastic} end
if P[507] then materialBatch[#materialBatch+1] = {Part = P[507], Material = Enum.Material.Plastic} end
if P[508] then materialBatch[#materialBatch+1] = {Part = P[508], Material = Enum.Material.Plastic} end
if P[509] then materialBatch[#materialBatch+1] = {Part = P[509], Material = Enum.Material.Plastic} end
if P[510] then materialBatch[#materialBatch+1] = {Part = P[510], Material = Enum.Material.Plastic} end
if P[511] then materialBatch[#materialBatch+1] = {Part = P[511], Material = Enum.Material.Plastic} end
if P[512] then materialBatch[#materialBatch+1] = {Part = P[512], Material = Enum.Material.Plastic} end
if P[513] then materialBatch[#materialBatch+1] = {Part = P[513], Material = Enum.Material.Plastic} end
if P[514] then materialBatch[#materialBatch+1] = {Part = P[514], Material = Enum.Material.Plastic} end
if P[515] then materialBatch[#materialBatch+1] = {Part = P[515], Material = Enum.Material.Plastic} end
if P[516] then materialBatch[#materialBatch+1] = {Part = P[516], Material = Enum.Material.Plastic} end
if P[517] then materialBatch[#materialBatch+1] = {Part = P[517], Material = Enum.Material.Plastic} end
if P[518] then materialBatch[#materialBatch+1] = {Part = P[518], Material = Enum.Material.Plastic} end
if P[519] then materialBatch[#materialBatch+1] = {Part = P[519], Material = Enum.Material.Plastic} end
if P[520] then materialBatch[#materialBatch+1] = {Part = P[520], Material = Enum.Material.Plastic} end
if P[521] then materialBatch[#materialBatch+1] = {Part = P[521], Material = Enum.Material.Plastic} end
if P[522] then materialBatch[#materialBatch+1] = {Part = P[522], Material = Enum.Material.Plastic} end
if P[523] then materialBatch[#materialBatch+1] = {Part = P[523], Material = Enum.Material.Plastic} end
if P[524] then materialBatch[#materialBatch+1] = {Part = P[524], Material = Enum.Material.Plastic} end
if P[525] then materialBatch[#materialBatch+1] = {Part = P[525], Material = Enum.Material.Plastic} end
if P[526] then materialBatch[#materialBatch+1] = {Part = P[526], Material = Enum.Material.Plastic} end
if P[527] then materialBatch[#materialBatch+1] = {Part = P[527], Material = Enum.Material.Plastic} end
if P[528] then materialBatch[#materialBatch+1] = {Part = P[528], Material = Enum.Material.Plastic} end
if P[529] then materialBatch[#materialBatch+1] = {Part = P[529], Material = Enum.Material.Plastic} end
if P[530] then materialBatch[#materialBatch+1] = {Part = P[530], Material = Enum.Material.Plastic} end
if P[531] then materialBatch[#materialBatch+1] = {Part = P[531], Material = Enum.Material.Plastic} end
if P[532] then materialBatch[#materialBatch+1] = {Part = P[532], Material = Enum.Material.Plastic} end
if P[533] then materialBatch[#materialBatch+1] = {Part = P[533], Material = Enum.Material.Plastic} end
if P[534] then materialBatch[#materialBatch+1] = {Part = P[534], Material = Enum.Material.Plastic} end
if P[535] then materialBatch[#materialBatch+1] = {Part = P[535], Material = Enum.Material.Plastic} end
if P[536] then materialBatch[#materialBatch+1] = {Part = P[536], Material = Enum.Material.Plastic} end
if P[537] then materialBatch[#materialBatch+1] = {Part = P[537], Material = Enum.Material.Plastic} end
if P[538] then materialBatch[#materialBatch+1] = {Part = P[538], Material = Enum.Material.Plastic} end
if P[539] then materialBatch[#materialBatch+1] = {Part = P[539], Material = Enum.Material.Plastic} end
if P[540] then materialBatch[#materialBatch+1] = {Part = P[540], Material = Enum.Material.Plastic} end
if P[541] then materialBatch[#materialBatch+1] = {Part = P[541], Material = Enum.Material.Plastic} end
if P[543] then materialBatch[#materialBatch+1] = {Part = P[543], Material = Enum.Material.Plastic} end
if P[544] then materialBatch[#materialBatch+1] = {Part = P[544], Material = Enum.Material.Plastic} end
if P[545] then materialBatch[#materialBatch+1] = {Part = P[545], Material = Enum.Material.Plastic} end
if P[546] then materialBatch[#materialBatch+1] = {Part = P[546], Material = Enum.Material.Plastic} end
if P[547] then materialBatch[#materialBatch+1] = {Part = P[547], Material = Enum.Material.Plastic} end
if P[548] then materialBatch[#materialBatch+1] = {Part = P[548], Material = Enum.Material.Plastic} end
if P[549] then materialBatch[#materialBatch+1] = {Part = P[549], Material = Enum.Material.Plastic} end
if P[550] then materialBatch[#materialBatch+1] = {Part = P[550], Material = Enum.Material.Plastic} end
if P[551] then materialBatch[#materialBatch+1] = {Part = P[551], Material = Enum.Material.Plastic} end
if P[552] then materialBatch[#materialBatch+1] = {Part = P[552], Material = Enum.Material.Plastic} end
if P[553] then materialBatch[#materialBatch+1] = {Part = P[553], Material = Enum.Material.Plastic} end
if P[554] then materialBatch[#materialBatch+1] = {Part = P[554], Material = Enum.Material.Plastic} end
if P[555] then materialBatch[#materialBatch+1] = {Part = P[555], Material = Enum.Material.Plastic} end
if P[556] then materialBatch[#materialBatch+1] = {Part = P[556], Material = Enum.Material.Plastic} end
if P[557] then materialBatch[#materialBatch+1] = {Part = P[557], Material = Enum.Material.Plastic} end
if P[558] then materialBatch[#materialBatch+1] = {Part = P[558], Material = Enum.Material.Plastic} end
if P[559] then materialBatch[#materialBatch+1] = {Part = P[559], Material = Enum.Material.Plastic} end
if P[560] then materialBatch[#materialBatch+1] = {Part = P[560], Material = Enum.Material.Plastic} end
if P[561] then materialBatch[#materialBatch+1] = {Part = P[561], Material = Enum.Material.Plastic} end
if P[562] then materialBatch[#materialBatch+1] = {Part = P[562], Material = Enum.Material.Plastic} end
if P[563] then materialBatch[#materialBatch+1] = {Part = P[563], Material = Enum.Material.Plastic} end
if P[564] then materialBatch[#materialBatch+1] = {Part = P[564], Material = Enum.Material.Plastic} end
if P[565] then materialBatch[#materialBatch+1] = {Part = P[565], Material = Enum.Material.Plastic} end
if P[566] then materialBatch[#materialBatch+1] = {Part = P[566], Material = Enum.Material.Plastic} end
if P[567] then materialBatch[#materialBatch+1] = {Part = P[567], Material = Enum.Material.Plastic} end
if P[568] then materialBatch[#materialBatch+1] = {Part = P[568], Material = Enum.Material.Plastic} end
if P[569] then materialBatch[#materialBatch+1] = {Part = P[569], Material = Enum.Material.Plastic} end
if P[570] then materialBatch[#materialBatch+1] = {Part = P[570], Material = Enum.Material.Plastic} end
if P[571] then materialBatch[#materialBatch+1] = {Part = P[571], Material = Enum.Material.Plastic} end
if P[572] then materialBatch[#materialBatch+1] = {Part = P[572], Material = Enum.Material.Plastic} end
if P[573] then materialBatch[#materialBatch+1] = {Part = P[573], Material = Enum.Material.Plastic} end
if P[574] then materialBatch[#materialBatch+1] = {Part = P[574], Material = Enum.Material.Plastic} end
if P[575] then materialBatch[#materialBatch+1] = {Part = P[575], Material = Enum.Material.Plastic} end
if P[576] then materialBatch[#materialBatch+1] = {Part = P[576], Material = Enum.Material.Plastic} end
if P[577] then materialBatch[#materialBatch+1] = {Part = P[577], Material = Enum.Material.Plastic} end
if P[578] then materialBatch[#materialBatch+1] = {Part = P[578], Material = Enum.Material.Plastic} end
if P[579] then materialBatch[#materialBatch+1] = {Part = P[579], Material = Enum.Material.Plastic} end
if P[580] then materialBatch[#materialBatch+1] = {Part = P[580], Material = Enum.Material.Plastic} end
if P[581] then materialBatch[#materialBatch+1] = {Part = P[581], Material = Enum.Material.Plastic} end
if P[582] then materialBatch[#materialBatch+1] = {Part = P[582], Material = Enum.Material.Plastic} end
if P[583] then materialBatch[#materialBatch+1] = {Part = P[583], Material = Enum.Material.Plastic} end
if P[584] then materialBatch[#materialBatch+1] = {Part = P[584], Material = Enum.Material.Plastic} end
if P[585] then materialBatch[#materialBatch+1] = {Part = P[585], Material = Enum.Material.Plastic} end
if P[586] then materialBatch[#materialBatch+1] = {Part = P[586], Material = Enum.Material.Plastic} end
if P[587] then materialBatch[#materialBatch+1] = {Part = P[587], Material = Enum.Material.Plastic} end
if P[588] then materialBatch[#materialBatch+1] = {Part = P[588], Material = Enum.Material.Plastic} end
if P[589] then materialBatch[#materialBatch+1] = {Part = P[589], Material = Enum.Material.Plastic} end
if P[590] then materialBatch[#materialBatch+1] = {Part = P[590], Material = Enum.Material.Plastic} end
if P[591] then materialBatch[#materialBatch+1] = {Part = P[591], Material = Enum.Material.Plastic} end
if P[592] then materialBatch[#materialBatch+1] = {Part = P[592], Material = Enum.Material.Plastic} end
if P[593] then materialBatch[#materialBatch+1] = {Part = P[593], Material = Enum.Material.Plastic} end
if P[594] then materialBatch[#materialBatch+1] = {Part = P[594], Material = Enum.Material.Plastic} end
if P[595] then materialBatch[#materialBatch+1] = {Part = P[595], Material = Enum.Material.Plastic} end
if P[596] then materialBatch[#materialBatch+1] = {Part = P[596], Material = Enum.Material.Plastic} end
if P[597] then materialBatch[#materialBatch+1] = {Part = P[597], Material = Enum.Material.Plastic} end
if P[598] then materialBatch[#materialBatch+1] = {Part = P[598], Material = Enum.Material.Plastic} end
if P[599] then materialBatch[#materialBatch+1] = {Part = P[599], Material = Enum.Material.Plastic} end
if P[600] then materialBatch[#materialBatch+1] = {Part = P[600], Material = Enum.Material.Plastic} end
if P[601] then materialBatch[#materialBatch+1] = {Part = P[601], Material = Enum.Material.Plastic} end
if P[602] then materialBatch[#materialBatch+1] = {Part = P[602], Material = Enum.Material.Plastic} end
if P[603] then materialBatch[#materialBatch+1] = {Part = P[603], Material = Enum.Material.Plastic} end
if P[604] then materialBatch[#materialBatch+1] = {Part = P[604], Material = Enum.Material.Plastic} end
if P[605] then materialBatch[#materialBatch+1] = {Part = P[605], Material = Enum.Material.Plastic} end
if P[606] then materialBatch[#materialBatch+1] = {Part = P[606], Material = Enum.Material.Plastic} end
if P[607] then materialBatch[#materialBatch+1] = {Part = P[607], Material = Enum.Material.Plastic} end
if P[608] then materialBatch[#materialBatch+1] = {Part = P[608], Material = Enum.Material.Plastic} end
if P[609] then materialBatch[#materialBatch+1] = {Part = P[609], Material = Enum.Material.Plastic} end
if P[610] then materialBatch[#materialBatch+1] = {Part = P[610], Material = Enum.Material.Plastic} end
if P[611] then materialBatch[#materialBatch+1] = {Part = P[611], Material = Enum.Material.Plastic} end
if P[612] then materialBatch[#materialBatch+1] = {Part = P[612], Material = Enum.Material.Plastic} end
if P[613] then materialBatch[#materialBatch+1] = {Part = P[613], Material = Enum.Material.Plastic} end
if P[614] then materialBatch[#materialBatch+1] = {Part = P[614], Material = Enum.Material.Plastic} end
if P[615] then materialBatch[#materialBatch+1] = {Part = P[615], Material = Enum.Material.Plastic} end
if P[616] then materialBatch[#materialBatch+1] = {Part = P[616], Material = Enum.Material.Plastic} end
if P[617] then materialBatch[#materialBatch+1] = {Part = P[617], Material = Enum.Material.Plastic} end
if P[618] then materialBatch[#materialBatch+1] = {Part = P[618], Material = Enum.Material.Plastic} end
if P[619] then materialBatch[#materialBatch+1] = {Part = P[619], Material = Enum.Material.Plastic} end
if P[620] then materialBatch[#materialBatch+1] = {Part = P[620], Material = Enum.Material.Plastic} end
if P[621] then materialBatch[#materialBatch+1] = {Part = P[621], Material = Enum.Material.Plastic} end
if P[622] then materialBatch[#materialBatch+1] = {Part = P[622], Material = Enum.Material.Plastic} end
if P[623] then materialBatch[#materialBatch+1] = {Part = P[623], Material = Enum.Material.Plastic} end
if P[624] then materialBatch[#materialBatch+1] = {Part = P[624], Material = Enum.Material.Plastic} end
if P[625] then materialBatch[#materialBatch+1] = {Part = P[625], Material = Enum.Material.Plastic} end
if P[626] then materialBatch[#materialBatch+1] = {Part = P[626], Material = Enum.Material.Plastic} end
if P[627] then materialBatch[#materialBatch+1] = {Part = P[627], Material = Enum.Material.Plastic} end
if P[628] then materialBatch[#materialBatch+1] = {Part = P[628], Material = Enum.Material.Plastic} end
if P[629] then materialBatch[#materialBatch+1] = {Part = P[629], Material = Enum.Material.Plastic} end
if P[630] then materialBatch[#materialBatch+1] = {Part = P[630], Material = Enum.Material.Plastic} end
if P[633] then materialBatch[#materialBatch+1] = {Part = P[633], Material = Enum.Material.Plastic} end
if P[634] then materialBatch[#materialBatch+1] = {Part = P[634], Material = Enum.Material.Plastic} end
if P[635] then materialBatch[#materialBatch+1] = {Part = P[635], Material = Enum.Material.Plastic} end
if P[636] then materialBatch[#materialBatch+1] = {Part = P[636], Material = Enum.Material.Plastic} end
if P[637] then materialBatch[#materialBatch+1] = {Part = P[637], Material = Enum.Material.Plastic} end
if P[638] then materialBatch[#materialBatch+1] = {Part = P[638], Material = Enum.Material.Plastic} end
if P[639] then materialBatch[#materialBatch+1] = {Part = P[639], Material = Enum.Material.Plastic} end
if P[640] then materialBatch[#materialBatch+1] = {Part = P[640], Material = Enum.Material.Plastic} end
if P[641] then materialBatch[#materialBatch+1] = {Part = P[641], Material = Enum.Material.Plastic} end
if P[642] then materialBatch[#materialBatch+1] = {Part = P[642], Material = Enum.Material.Plastic} end
if P[643] then materialBatch[#materialBatch+1] = {Part = P[643], Material = Enum.Material.Plastic} end
if P[644] then materialBatch[#materialBatch+1] = {Part = P[644], Material = Enum.Material.Plastic} end
if P[645] then materialBatch[#materialBatch+1] = {Part = P[645], Material = Enum.Material.Plastic} end
if P[646] then materialBatch[#materialBatch+1] = {Part = P[646], Material = Enum.Material.Plastic} end
if P[648] then materialBatch[#materialBatch+1] = {Part = P[648], Material = Enum.Material.Plastic} end
if P[649] then materialBatch[#materialBatch+1] = {Part = P[649], Material = Enum.Material.Plastic} end
if P[650] then materialBatch[#materialBatch+1] = {Part = P[650], Material = Enum.Material.Plastic} end
if P[651] then materialBatch[#materialBatch+1] = {Part = P[651], Material = Enum.Material.Plastic} end
if P[652] then materialBatch[#materialBatch+1] = {Part = P[652], Material = Enum.Material.Plastic} end
if P[653] then materialBatch[#materialBatch+1] = {Part = P[653], Material = Enum.Material.Plastic} end
if P[654] then materialBatch[#materialBatch+1] = {Part = P[654], Material = Enum.Material.Plastic} end
if P[655] then materialBatch[#materialBatch+1] = {Part = P[655], Material = Enum.Material.Plastic} end
if P[656] then materialBatch[#materialBatch+1] = {Part = P[656], Material = Enum.Material.Plastic} end
if P[657] then materialBatch[#materialBatch+1] = {Part = P[657], Material = Enum.Material.Plastic} end
if P[658] then materialBatch[#materialBatch+1] = {Part = P[658], Material = Enum.Material.Plastic} end
if P[659] then materialBatch[#materialBatch+1] = {Part = P[659], Material = Enum.Material.Plastic} end
if P[660] then materialBatch[#materialBatch+1] = {Part = P[660], Material = Enum.Material.Plastic} end
if P[661] then materialBatch[#materialBatch+1] = {Part = P[661], Material = Enum.Material.Plastic} end
if P[662] then materialBatch[#materialBatch+1] = {Part = P[662], Material = Enum.Material.Plastic} end
if P[663] then materialBatch[#materialBatch+1] = {Part = P[663], Material = Enum.Material.Plastic} end
if P[664] then materialBatch[#materialBatch+1] = {Part = P[664], Material = Enum.Material.Plastic} end
if P[665] then materialBatch[#materialBatch+1] = {Part = P[665], Material = Enum.Material.Plastic} end
if P[666] then materialBatch[#materialBatch+1] = {Part = P[666], Material = Enum.Material.Plastic} end
if P[667] then materialBatch[#materialBatch+1] = {Part = P[667], Material = Enum.Material.Plastic} end
if P[668] then materialBatch[#materialBatch+1] = {Part = P[668], Material = Enum.Material.Plastic} end
if P[669] then materialBatch[#materialBatch+1] = {Part = P[669], Material = Enum.Material.Plastic} end
if P[670] then materialBatch[#materialBatch+1] = {Part = P[670], Material = Enum.Material.Plastic} end
if P[671] then materialBatch[#materialBatch+1] = {Part = P[671], Material = Enum.Material.Plastic} end
if P[672] then materialBatch[#materialBatch+1] = {Part = P[672], Material = Enum.Material.Plastic} end
if P[673] then materialBatch[#materialBatch+1] = {Part = P[673], Material = Enum.Material.Plastic} end
if P[674] then materialBatch[#materialBatch+1] = {Part = P[674], Material = Enum.Material.Plastic} end
if P[675] then materialBatch[#materialBatch+1] = {Part = P[675], Material = Enum.Material.Plastic} end
if P[676] then materialBatch[#materialBatch+1] = {Part = P[676], Material = Enum.Material.Plastic} end
if P[677] then materialBatch[#materialBatch+1] = {Part = P[677], Material = Enum.Material.Plastic} end
if P[678] then materialBatch[#materialBatch+1] = {Part = P[678], Material = Enum.Material.Plastic} end
if P[679] then materialBatch[#materialBatch+1] = {Part = P[679], Material = Enum.Material.Plastic} end
if P[680] then materialBatch[#materialBatch+1] = {Part = P[680], Material = Enum.Material.Plastic} end
if P[681] then materialBatch[#materialBatch+1] = {Part = P[681], Material = Enum.Material.Plastic} end
if P[682] then materialBatch[#materialBatch+1] = {Part = P[682], Material = Enum.Material.Plastic} end
if P[683] then materialBatch[#materialBatch+1] = {Part = P[683], Material = Enum.Material.Plastic} end
if P[684] then materialBatch[#materialBatch+1] = {Part = P[684], Material = Enum.Material.Plastic} end
if P[687] then materialBatch[#materialBatch+1] = {Part = P[687], Material = Enum.Material.Plastic} end
if P[694] then materialBatch[#materialBatch+1] = {Part = P[694], Material = Enum.Material.Plastic} end
if P[699] then materialBatch[#materialBatch+1] = {Part = P[699], Material = Enum.Material.Plastic} end
if P[702] then materialBatch[#materialBatch+1] = {Part = P[702], Material = Enum.Material.Plastic} end
if P[704] then materialBatch[#materialBatch+1] = {Part = P[704], Material = Enum.Material.Plastic} end
if P[712] then materialBatch[#materialBatch+1] = {Part = P[712], Material = Enum.Material.Plastic} end
if P[717] then materialBatch[#materialBatch+1] = {Part = P[717], Material = Enum.Material.Plastic} end
if P[720] then materialBatch[#materialBatch+1] = {Part = P[720], Material = Enum.Material.Plastic} end
if P[726] then materialBatch[#materialBatch+1] = {Part = P[726], Material = Enum.Material.Plastic} end
if P[733] then materialBatch[#materialBatch+1] = {Part = P[733], Material = Enum.Material.Plastic} end
if P[737] then materialBatch[#materialBatch+1] = {Part = P[737], Material = Enum.Material.Plastic} end
if P[739] then materialBatch[#materialBatch+1] = {Part = P[739], Material = Enum.Material.Plastic} end
if P[741] then materialBatch[#materialBatch+1] = {Part = P[741], Material = Enum.Material.Plastic} end
if P[744] then materialBatch[#materialBatch+1] = {Part = P[744], Material = Enum.Material.Plastic} end
if P[747] then materialBatch[#materialBatch+1] = {Part = P[747], Material = Enum.Material.Plastic} end
if P[749] then materialBatch[#materialBatch+1] = {Part = P[749], Material = Enum.Material.Plastic} end
if P[751] then materialBatch[#materialBatch+1] = {Part = P[751], Material = Enum.Material.Plastic} end
if P[755] then materialBatch[#materialBatch+1] = {Part = P[755], Material = Enum.Material.Plastic} end
if P[758] then materialBatch[#materialBatch+1] = {Part = P[758], Material = Enum.Material.Plastic} end
if P[761] then materialBatch[#materialBatch+1] = {Part = P[761], Material = Enum.Material.Plastic} end
if P[762] then materialBatch[#materialBatch+1] = {Part = P[762], Material = Enum.Material.Plastic} end
if P[766] then materialBatch[#materialBatch+1] = {Part = P[766], Material = Enum.Material.Plastic} end
if P[771] then materialBatch[#materialBatch+1] = {Part = P[771], Material = Enum.Material.Plastic} end
if P[775] then materialBatch[#materialBatch+1] = {Part = P[775], Material = Enum.Material.Plastic} end
if P[776] then materialBatch[#materialBatch+1] = {Part = P[776], Material = Enum.Material.Plastic} end
if P[777] then materialBatch[#materialBatch+1] = {Part = P[777], Material = Enum.Material.Plastic} end
if P[780] then materialBatch[#materialBatch+1] = {Part = P[780], Material = Enum.Material.Plastic} end
if P[783] then materialBatch[#materialBatch+1] = {Part = P[783], Material = Enum.Material.Plastic} end
if P[792] then materialBatch[#materialBatch+1] = {Part = P[792], Material = Enum.Material.Plastic} end
if P[795] then materialBatch[#materialBatch+1] = {Part = P[795], Material = Enum.Material.Plastic} end
if P[796] then materialBatch[#materialBatch+1] = {Part = P[796], Material = Enum.Material.Plastic} end
if P[801] then materialBatch[#materialBatch+1] = {Part = P[801], Material = Enum.Material.Plastic} end
if P[803] then materialBatch[#materialBatch+1] = {Part = P[803], Material = Enum.Material.Plastic} end
if P[808] then materialBatch[#materialBatch+1] = {Part = P[808], Material = Enum.Material.Plastic} end
if P[811] then materialBatch[#materialBatch+1] = {Part = P[811], Material = Enum.Material.Plastic} end
if P[813] then materialBatch[#materialBatch+1] = {Part = P[813], Material = Enum.Material.Plastic} end
if P[814] then materialBatch[#materialBatch+1] = {Part = P[814], Material = Enum.Material.Plastic} end
if P[815] then materialBatch[#materialBatch+1] = {Part = P[815], Material = Enum.Material.Plastic} end
if P[818] then materialBatch[#materialBatch+1] = {Part = P[818], Material = Enum.Material.Plastic} end
if P[821] then materialBatch[#materialBatch+1] = {Part = P[821], Material = Enum.Material.Plastic} end
if P[823] then materialBatch[#materialBatch+1] = {Part = P[823], Material = Enum.Material.Plastic} end
if P[824] then materialBatch[#materialBatch+1] = {Part = P[824], Material = Enum.Material.Plastic} end
if P[825] then materialBatch[#materialBatch+1] = {Part = P[825], Material = Enum.Material.Plastic} end
if P[826] then materialBatch[#materialBatch+1] = {Part = P[826], Material = Enum.Material.Plastic} end
if P[828] then materialBatch[#materialBatch+1] = {Part = P[828], Material = Enum.Material.Plastic} end
if P[833] then materialBatch[#materialBatch+1] = {Part = P[833], Material = Enum.Material.Plastic} end
if P[836] then materialBatch[#materialBatch+1] = {Part = P[836], Material = Enum.Material.Plastic} end
if P[837] then materialBatch[#materialBatch+1] = {Part = P[837], Material = Enum.Material.Plastic} end
if P[841] then materialBatch[#materialBatch+1] = {Part = P[841], Material = Enum.Material.Plastic} end
if P[843] then materialBatch[#materialBatch+1] = {Part = P[843], Material = Enum.Material.Plastic} end
if P[845] then materialBatch[#materialBatch+1] = {Part = P[845], Material = Enum.Material.Plastic} end
if P[847] then materialBatch[#materialBatch+1] = {Part = P[847], Material = Enum.Material.Plastic} end
if P[850] then materialBatch[#materialBatch+1] = {Part = P[850], Material = Enum.Material.Plastic} end
if P[852] then materialBatch[#materialBatch+1] = {Part = P[852], Material = Enum.Material.Plastic} end
if P[854] then materialBatch[#materialBatch+1] = {Part = P[854], Material = Enum.Material.Plastic} end
if P[857] then materialBatch[#materialBatch+1] = {Part = P[857], Material = Enum.Material.Plastic} end
if P[860] then materialBatch[#materialBatch+1] = {Part = P[860], Material = Enum.Material.Plastic} end
if P[863] then materialBatch[#materialBatch+1] = {Part = P[863], Material = Enum.Material.Plastic} end
if P[864] then materialBatch[#materialBatch+1] = {Part = P[864], Material = Enum.Material.Plastic} end
if P[868] then materialBatch[#materialBatch+1] = {Part = P[868], Material = Enum.Material.Plastic} end
if P[871] then materialBatch[#materialBatch+1] = {Part = P[871], Material = Enum.Material.Plastic} end
if P[874] then materialBatch[#materialBatch+1] = {Part = P[874], Material = Enum.Material.Plastic} end
if P[878] then materialBatch[#materialBatch+1] = {Part = P[878], Material = Enum.Material.Plastic} end
if P[879] then materialBatch[#materialBatch+1] = {Part = P[879], Material = Enum.Material.Plastic} end
if P[881] then materialBatch[#materialBatch+1] = {Part = P[881], Material = Enum.Material.Plastic} end
if P[884] then materialBatch[#materialBatch+1] = {Part = P[884], Material = Enum.Material.Plastic} end
if P[886] then materialBatch[#materialBatch+1] = {Part = P[886], Material = Enum.Material.Plastic} end
if P[888] then materialBatch[#materialBatch+1] = {Part = P[888], Material = Enum.Material.Plastic} end
if P[891] then materialBatch[#materialBatch+1] = {Part = P[891], Material = Enum.Material.Plastic} end
if P[894] then materialBatch[#materialBatch+1] = {Part = P[894], Material = Enum.Material.Plastic} end
if P[895] then materialBatch[#materialBatch+1] = {Part = P[895], Material = Enum.Material.Plastic} end
if P[897] then materialBatch[#materialBatch+1] = {Part = P[897], Material = Enum.Material.Plastic} end
if P[900] then materialBatch[#materialBatch+1] = {Part = P[900], Material = Enum.Material.Plastic} end
if P[904] then materialBatch[#materialBatch+1] = {Part = P[904], Material = Enum.Material.Plastic} end
if P[908] then materialBatch[#materialBatch+1] = {Part = P[908], Material = Enum.Material.Plastic} end
if P[910] then materialBatch[#materialBatch+1] = {Part = P[910], Material = Enum.Material.Plastic} end
if P[912] then materialBatch[#materialBatch+1] = {Part = P[912], Material = Enum.Material.Plastic} end
if P[915] then materialBatch[#materialBatch+1] = {Part = P[915], Material = Enum.Material.Plastic} end
if P[918] then materialBatch[#materialBatch+1] = {Part = P[918], Material = Enum.Material.Plastic} end
if P[922] then materialBatch[#materialBatch+1] = {Part = P[922], Material = Enum.Material.Plastic} end
if P[925] then materialBatch[#materialBatch+1] = {Part = P[925], Material = Enum.Material.Plastic} end
if P[929] then materialBatch[#materialBatch+1] = {Part = P[929], Material = Enum.Material.Plastic} end
if P[930] then materialBatch[#materialBatch+1] = {Part = P[930], Material = Enum.Material.Plastic} end
if P[934] then materialBatch[#materialBatch+1] = {Part = P[934], Material = Enum.Material.Plastic} end
if P[938] then materialBatch[#materialBatch+1] = {Part = P[938], Material = Enum.Material.Plastic} end
if P[940] then materialBatch[#materialBatch+1] = {Part = P[940], Material = Enum.Material.Plastic} end
if P[942] then materialBatch[#materialBatch+1] = {Part = P[942], Material = Enum.Material.Plastic} end
if P[943] then materialBatch[#materialBatch+1] = {Part = P[943], Material = Enum.Material.Plastic} end
if P[945] then materialBatch[#materialBatch+1] = {Part = P[945], Material = Enum.Material.Plastic} end
if P[946] then materialBatch[#materialBatch+1] = {Part = P[946], Material = Enum.Material.Plastic} end
if P[947] then materialBatch[#materialBatch+1] = {Part = P[947], Material = Enum.Material.Plastic} end
if P[949] then materialBatch[#materialBatch+1] = {Part = P[949], Material = Enum.Material.Plastic} end
if P[950] then materialBatch[#materialBatch+1] = {Part = P[950], Material = Enum.Material.Plastic} end
if P[951] then materialBatch[#materialBatch+1] = {Part = P[951], Material = Enum.Material.Plastic} end
if P[954] then materialBatch[#materialBatch+1] = {Part = P[954], Material = Enum.Material.Plastic} end
if P[959] then materialBatch[#materialBatch+1] = {Part = P[959], Material = Enum.Material.Plastic} end
if P[961] then materialBatch[#materialBatch+1] = {Part = P[961], Material = Enum.Material.Plastic} end
if P[963] then materialBatch[#materialBatch+1] = {Part = P[963], Material = Enum.Material.Plastic} end
if P[964] then materialBatch[#materialBatch+1] = {Part = P[964], Material = Enum.Material.Plastic} end
if P[965] then materialBatch[#materialBatch+1] = {Part = P[965], Material = Enum.Material.Plastic} end
if P[968] then materialBatch[#materialBatch+1] = {Part = P[968], Material = Enum.Material.Plastic} end
if P[971] then materialBatch[#materialBatch+1] = {Part = P[971], Material = Enum.Material.Plastic} end
if P[980] then materialBatch[#materialBatch+1] = {Part = P[980], Material = Enum.Material.Plastic} end
if P[983] then materialBatch[#materialBatch+1] = {Part = P[983], Material = Enum.Material.Plastic} end
if P[985] then materialBatch[#materialBatch+1] = {Part = P[985], Material = Enum.Material.Plastic} end
if P[989] then materialBatch[#materialBatch+1] = {Part = P[989], Material = Enum.Material.Plastic} end
if P[991] then materialBatch[#materialBatch+1] = {Part = P[991], Material = Enum.Material.Plastic} end
if P[994] then materialBatch[#materialBatch+1] = {Part = P[994], Material = Enum.Material.Plastic} end
if P[995] then materialBatch[#materialBatch+1] = {Part = P[995], Material = Enum.Material.Plastic} end
if P[996] then materialBatch[#materialBatch+1] = {Part = P[996], Material = Enum.Material.Plastic} end
if P[997] then materialBatch[#materialBatch+1] = {Part = P[997], Material = Enum.Material.Plastic} end
if P[999] then materialBatch[#materialBatch+1] = {Part = P[999], Material = Enum.Material.Plastic} end
if P[1004] then materialBatch[#materialBatch+1] = {Part = P[1004], Material = Enum.Material.Plastic} end
if P[1005] then materialBatch[#materialBatch+1] = {Part = P[1005], Material = Enum.Material.Plastic} end
if P[1015] then materialBatch[#materialBatch+1] = {Part = P[1015], Material = Enum.Material.Plastic} end
if P[1018] then materialBatch[#materialBatch+1] = {Part = P[1018], Material = Enum.Material.Plastic} end
if P[1021] then materialBatch[#materialBatch+1] = {Part = P[1021], Material = Enum.Material.Plastic} end
if P[1023] then materialBatch[#materialBatch+1] = {Part = P[1023], Material = Enum.Material.Plastic} end
if P[1406] then materialBatch[#materialBatch+1] = {Part = P[1406], Material = Enum.Material.Pebble} end
if P[1118] then materialBatch[#materialBatch+1] = {Part = P[1118], Material = Enum.Material.Plastic} end
if P[1615] then materialBatch[#materialBatch+1] = {Part = P[1615], Material = Enum.Material.Fabric} end
if P[1442] then materialBatch[#materialBatch+1] = {Part = P[1442], Material = Enum.Material.Pebble} end
if P[1388] then materialBatch[#materialBatch+1] = {Part = P[1388], Material = Enum.Material.Wood} end
if P[1334] then materialBatch[#materialBatch+1] = {Part = P[1334], Material = Enum.Material.Plastic} end
if P[1052] then materialBatch[#materialBatch+1] = {Part = P[1052], Material = Enum.Material.Plastic} end
if P[1420] then materialBatch[#materialBatch+1] = {Part = P[1420], Material = Enum.Material.SmoothPlastic} end
if P[1196] then materialBatch[#materialBatch+1] = {Part = P[1196], Material = Enum.Material.Plastic} end
if P[1202] then materialBatch[#materialBatch+1] = {Part = P[1202], Material = Enum.Material.Plastic} end
if P[1061] then materialBatch[#materialBatch+1] = {Part = P[1061], Material = Enum.Material.Plastic} end
if P[1407] then materialBatch[#materialBatch+1] = {Part = P[1407], Material = Enum.Material.Pebble} end
if P[1541] then materialBatch[#materialBatch+1] = {Part = P[1541], Material = Enum.Material.Granite} end
if P[1188] then materialBatch[#materialBatch+1] = {Part = P[1188], Material = Enum.Material.Plastic} end
if P[1381] then materialBatch[#materialBatch+1] = {Part = P[1381], Material = Enum.Material.Wood} end
if P[1271] then materialBatch[#materialBatch+1] = {Part = P[1271], Material = Enum.Material.Plastic} end
if P[1378] then materialBatch[#materialBatch+1] = {Part = P[1378], Material = Enum.Material.Metal} end
if P[1053] then materialBatch[#materialBatch+1] = {Part = P[1053], Material = Enum.Material.Plastic} end
if P[1097] then materialBatch[#materialBatch+1] = {Part = P[1097], Material = Enum.Material.Plastic} end
if P[1351] then materialBatch[#materialBatch+1] = {Part = P[1351], Material = Enum.Material.Plastic} end
if P[1166] then materialBatch[#materialBatch+1] = {Part = P[1166], Material = Enum.Material.Plastic} end
if P[1194] then materialBatch[#materialBatch+1] = {Part = P[1194], Material = Enum.Material.Plastic} end
if P[1571] then materialBatch[#materialBatch+1] = {Part = P[1571], Material = Enum.Material.Granite} end
if P[1045] then materialBatch[#materialBatch+1] = {Part = P[1045], Material = Enum.Material.Plastic} end
if P[1448] then materialBatch[#materialBatch+1] = {Part = P[1448], Material = Enum.Material.Pebble} end
if P[1224] then materialBatch[#materialBatch+1] = {Part = P[1224], Material = Enum.Material.Plastic} end
if P[1290] then materialBatch[#materialBatch+1] = {Part = P[1290], Material = Enum.Material.Plastic} end
if P[1426] then materialBatch[#materialBatch+1] = {Part = P[1426], Material = Enum.Material.Granite} end
if P[1613] then materialBatch[#materialBatch+1] = {Part = P[1613], Material = Enum.Material.SmoothPlastic} end
if P[1369] then materialBatch[#materialBatch+1] = {Part = P[1369], Material = Enum.Material.Metal} end
if P[1408] then materialBatch[#materialBatch+1] = {Part = P[1408], Material = Enum.Material.Pebble} end
if P[1127] then materialBatch[#materialBatch+1] = {Part = P[1127], Material = Enum.Material.Plastic} end
if P[1389] then materialBatch[#materialBatch+1] = {Part = P[1389], Material = Enum.Material.Metal} end
if P[1033] then materialBatch[#materialBatch+1] = {Part = P[1033], Material = Enum.Material.Plastic} end
if P[1169] then materialBatch[#materialBatch+1] = {Part = P[1169], Material = Enum.Material.Plastic} end
if P[1624] then materialBatch[#materialBatch+1] = {Part = P[1624], Material = Enum.Material.SmoothPlastic} end
if P[1145] then materialBatch[#materialBatch+1] = {Part = P[1145], Material = Enum.Material.Plastic} end
if P[1413] then materialBatch[#materialBatch+1] = {Part = P[1413], Material = Enum.Material.Pebble} end
if P[1275] then materialBatch[#materialBatch+1] = {Part = P[1275], Material = Enum.Material.Plastic} end
if P[1239] then materialBatch[#materialBatch+1] = {Part = P[1239], Material = Enum.Material.Plastic} end
if P[1339] then materialBatch[#materialBatch+1] = {Part = P[1339], Material = Enum.Material.Plastic} end
if P[1044] then materialBatch[#materialBatch+1] = {Part = P[1044], Material = Enum.Material.Plastic} end
if P[1627] then materialBatch[#materialBatch+1] = {Part = P[1627], Material = Enum.Material.Plastic} end
if P[1581] then materialBatch[#materialBatch+1] = {Part = P[1581], Material = Enum.Material.Neon} end
if P[1633] then materialBatch[#materialBatch+1] = {Part = P[1633], Material = Enum.Material.SmoothPlastic} end
if P[1404] then materialBatch[#materialBatch+1] = {Part = P[1404], Material = Enum.Material.Pebble} end
if P[1479] then materialBatch[#materialBatch+1] = {Part = P[1479], Material = Enum.Material.Neon} end
if P[1113] then materialBatch[#materialBatch+1] = {Part = P[1113], Material = Enum.Material.Plastic} end
if P[1232] then materialBatch[#materialBatch+1] = {Part = P[1232], Material = Enum.Material.Plastic} end
if P[1089] then materialBatch[#materialBatch+1] = {Part = P[1089], Material = Enum.Material.Plastic} end
if P[1103] then materialBatch[#materialBatch+1] = {Part = P[1103], Material = Enum.Material.Plastic} end
if P[1595] then materialBatch[#materialBatch+1] = {Part = P[1595], Material = Enum.Material.Granite} end
if P[1392] then materialBatch[#materialBatch+1] = {Part = P[1392], Material = Enum.Material.Metal} end
if P[1223] then materialBatch[#materialBatch+1] = {Part = P[1223], Material = Enum.Material.Plastic} end
if P[1250] then materialBatch[#materialBatch+1] = {Part = P[1250], Material = Enum.Material.Plastic} end
if P[1618] then materialBatch[#materialBatch+1] = {Part = P[1618], Material = Enum.Material.Fabric} end
if P[1477] then materialBatch[#materialBatch+1] = {Part = P[1477], Material = Enum.Material.Pebble} end
if P[1209] then materialBatch[#materialBatch+1] = {Part = P[1209], Material = Enum.Material.Plastic} end
if P[1056] then materialBatch[#materialBatch+1] = {Part = P[1056], Material = Enum.Material.Plastic} end
if P[1549] then materialBatch[#materialBatch+1] = {Part = P[1549], Material = Enum.Material.Granite} end
if P[1514] then materialBatch[#materialBatch+1] = {Part = P[1514], Material = Enum.Material.Pebble} end
if P[1480] then materialBatch[#materialBatch+1] = {Part = P[1480], Material = Enum.Material.Pebble} end
if P[1036] then materialBatch[#materialBatch+1] = {Part = P[1036], Material = Enum.Material.Plastic} end
if P[1295] then materialBatch[#materialBatch+1] = {Part = P[1295], Material = Enum.Material.Plastic} end
if P[1428] then materialBatch[#materialBatch+1] = {Part = P[1428], Material = Enum.Material.Granite} end
if P[1076] then materialBatch[#materialBatch+1] = {Part = P[1076], Material = Enum.Material.Plastic} end
if P[1410] then materialBatch[#materialBatch+1] = {Part = P[1410], Material = Enum.Material.Pebble} end
if P[1280] then materialBatch[#materialBatch+1] = {Part = P[1280], Material = Enum.Material.Plastic} end
if P[1107] then materialBatch[#materialBatch+1] = {Part = P[1107], Material = Enum.Material.Plastic} end
if P[1059] then materialBatch[#materialBatch+1] = {Part = P[1059], Material = Enum.Material.Plastic} end
if P[1139] then materialBatch[#materialBatch+1] = {Part = P[1139], Material = Enum.Material.Plastic} end
if P[1591] then materialBatch[#materialBatch+1] = {Part = P[1591], Material = Enum.Material.Pebble} end
if P[1178] then materialBatch[#materialBatch+1] = {Part = P[1178], Material = Enum.Material.Plastic} end
if P[1327] then materialBatch[#materialBatch+1] = {Part = P[1327], Material = Enum.Material.Plastic} end
if P[1190] then materialBatch[#materialBatch+1] = {Part = P[1190], Material = Enum.Material.Plastic} end
if P[1636] then materialBatch[#materialBatch+1] = {Part = P[1636], Material = Enum.Material.SmoothPlastic} end
if P[1472] then materialBatch[#materialBatch+1] = {Part = P[1472], Material = Enum.Material.Pebble} end
if P[1368] then materialBatch[#materialBatch+1] = {Part = P[1368], Material = Enum.Material.Metal} end
if P[1289] then materialBatch[#materialBatch+1] = {Part = P[1289], Material = Enum.Material.Plastic} end
if P[1158] then materialBatch[#materialBatch+1] = {Part = P[1158], Material = Enum.Material.Plastic} end
if P[1536] then materialBatch[#materialBatch+1] = {Part = P[1536], Material = Enum.Material.Neon} end
if P[1566] then materialBatch[#materialBatch+1] = {Part = P[1566], Material = Enum.Material.Neon} end
if P[1206] then materialBatch[#materialBatch+1] = {Part = P[1206], Material = Enum.Material.Plastic} end
if P[1593] then materialBatch[#materialBatch+1] = {Part = P[1593], Material = Enum.Material.Neon} end
if P[1600] then materialBatch[#materialBatch+1] = {Part = P[1600], Material = Enum.Material.Granite} end
if P[1487] then materialBatch[#materialBatch+1] = {Part = P[1487], Material = Enum.Material.Neon} end
if P[1538] then materialBatch[#materialBatch+1] = {Part = P[1538], Material = Enum.Material.Granite} end
if P[1283] then materialBatch[#materialBatch+1] = {Part = P[1283], Material = Enum.Material.Plastic} end
if P[1469] then materialBatch[#materialBatch+1] = {Part = P[1469], Material = Enum.Material.Pebble} end
if P[1359] then materialBatch[#materialBatch+1] = {Part = P[1359], Material = Enum.Material.Metal} end
if P[1445] then materialBatch[#materialBatch+1] = {Part = P[1445], Material = Enum.Material.Neon} end
if P[1182] then materialBatch[#materialBatch+1] = {Part = P[1182], Material = Enum.Material.Plastic} end
if P[1425] then materialBatch[#materialBatch+1] = {Part = P[1425], Material = Enum.Material.Granite} end
if P[1163] then materialBatch[#materialBatch+1] = {Part = P[1163], Material = Enum.Material.Plastic} end
if P[1612] then materialBatch[#materialBatch+1] = {Part = P[1612], Material = Enum.Material.SmoothPlastic} end
if P[1248] then materialBatch[#materialBatch+1] = {Part = P[1248], Material = Enum.Material.Plastic} end
if P[1575] then materialBatch[#materialBatch+1] = {Part = P[1575], Material = Enum.Material.Granite} end
if P[1205] then materialBatch[#materialBatch+1] = {Part = P[1205], Material = Enum.Material.Plastic} end
if P[1181] then materialBatch[#materialBatch+1] = {Part = P[1181], Material = Enum.Material.Plastic} end
if P[1511] then materialBatch[#materialBatch+1] = {Part = P[1511], Material = Enum.Material.Neon} end
if P[1092] then materialBatch[#materialBatch+1] = {Part = P[1092], Material = Enum.Material.Plastic} end
if P[1185] then materialBatch[#materialBatch+1] = {Part = P[1185], Material = Enum.Material.Plastic} end
if P[1320] then materialBatch[#materialBatch+1] = {Part = P[1320], Material = Enum.Material.Plastic} end
if P[1233] then materialBatch[#materialBatch+1] = {Part = P[1233], Material = Enum.Material.Plastic} end
if P[1104] then materialBatch[#materialBatch+1] = {Part = P[1104], Material = Enum.Material.Plastic} end
if P[1602] then materialBatch[#materialBatch+1] = {Part = P[1602], Material = Enum.Material.Granite} end
if P[1414] then materialBatch[#materialBatch+1] = {Part = P[1414], Material = Enum.Material.Pebble} end
if P[1520] then materialBatch[#materialBatch+1] = {Part = P[1520], Material = Enum.Material.SmoothPlastic} end
if P[1569] then materialBatch[#materialBatch+1] = {Part = P[1569], Material = Enum.Material.Granite} end
if P[1137] then materialBatch[#materialBatch+1] = {Part = P[1137], Material = Enum.Material.Plastic} end
if P[1314] then materialBatch[#materialBatch+1] = {Part = P[1314], Material = Enum.Material.Plastic} end
if P[1286] then materialBatch[#materialBatch+1] = {Part = P[1286], Material = Enum.Material.Plastic} end
if P[1152] then materialBatch[#materialBatch+1] = {Part = P[1152], Material = Enum.Material.Plastic} end
if P[1245] then materialBatch[#materialBatch+1] = {Part = P[1245], Material = Enum.Material.Plastic} end
if P[1128] then materialBatch[#materialBatch+1] = {Part = P[1128], Material = Enum.Material.Plastic} end
if P[1146] then materialBatch[#materialBatch+1] = {Part = P[1146], Material = Enum.Material.Plastic} end
if P[1465] then materialBatch[#materialBatch+1] = {Part = P[1465], Material = Enum.Material.Pebble} end
if P[1489] then materialBatch[#materialBatch+1] = {Part = P[1489], Material = Enum.Material.Pebble} end
if P[1399] then materialBatch[#materialBatch+1] = {Part = P[1399], Material = Enum.Material.Neon} end
if P[1512] then materialBatch[#materialBatch+1] = {Part = P[1512], Material = Enum.Material.Pebble} end
if P[1379] then materialBatch[#materialBatch+1] = {Part = P[1379], Material = Enum.Material.Metal} end
if P[1496] then materialBatch[#materialBatch+1] = {Part = P[1496], Material = Enum.Material.Pebble} end
if P[1463] then materialBatch[#materialBatch+1] = {Part = P[1463], Material = Enum.Material.Pebble} end
if P[1495] then materialBatch[#materialBatch+1] = {Part = P[1495], Material = Enum.Material.Pebble} end
if P[1304] then materialBatch[#materialBatch+1] = {Part = P[1304], Material = Enum.Material.Plastic} end
if P[1083] then materialBatch[#materialBatch+1] = {Part = P[1083], Material = Enum.Material.Plastic} end
if P[1651] then materialBatch[#materialBatch+1] = {Part = P[1651], Material = Enum.Material.Neon} end
if P[1649] then materialBatch[#materialBatch+1] = {Part = P[1649], Material = Enum.Material.Neon} end
if P[1648] then materialBatch[#materialBatch+1] = {Part = P[1648], Material = Enum.Material.Granite} end
if P[1063] then materialBatch[#materialBatch+1] = {Part = P[1063], Material = Enum.Material.Plastic} end
if P[1635] then materialBatch[#materialBatch+1] = {Part = P[1635], Material = Enum.Material.SmoothPlastic} end
if P[1645] then materialBatch[#materialBatch+1] = {Part = P[1645], Material = Enum.Material.Fabric} end
if P[1643] then materialBatch[#materialBatch+1] = {Part = P[1643], Material = Enum.Material.Plastic} end
if P[1364] then materialBatch[#materialBatch+1] = {Part = P[1364], Material = Enum.Material.Metal} end
if P[1641] then materialBatch[#materialBatch+1] = {Part = P[1641], Material = Enum.Material.Plastic} end
if P[1640] then materialBatch[#materialBatch+1] = {Part = P[1640], Material = Enum.Material.SmoothPlastic} end
if P[1558] then materialBatch[#materialBatch+1] = {Part = P[1558], Material = Enum.Material.Neon} end
if P[1638] then materialBatch[#materialBatch+1] = {Part = P[1638], Material = Enum.Material.Plastic} end
if P[1446] then materialBatch[#materialBatch+1] = {Part = P[1446], Material = Enum.Material.Pebble} end
if P[1494] then materialBatch[#materialBatch+1] = {Part = P[1494], Material = Enum.Material.Pebble} end
if P[1647] then materialBatch[#materialBatch+1] = {Part = P[1647], Material = Enum.Material.Granite} end
if P[1631] then materialBatch[#materialBatch+1] = {Part = P[1631], Material = Enum.Material.SmoothPlastic} end
if P[1236] then materialBatch[#materialBatch+1] = {Part = P[1236], Material = Enum.Material.Plastic} end
if P[1048] then materialBatch[#materialBatch+1] = {Part = P[1048], Material = Enum.Material.Plastic} end
if P[1515] then materialBatch[#materialBatch+1] = {Part = P[1515], Material = Enum.Material.Pebble} end
if P[1242] then materialBatch[#materialBatch+1] = {Part = P[1242], Material = Enum.Material.Plastic} end
if P[1504] then materialBatch[#materialBatch+1] = {Part = P[1504], Material = Enum.Material.Pebble} end
if P[1346] then materialBatch[#materialBatch+1] = {Part = P[1346], Material = Enum.Material.Plastic} end
if P[1632] then materialBatch[#materialBatch+1] = {Part = P[1632], Material = Enum.Material.SmoothPlastic} end
if P[1218] then materialBatch[#materialBatch+1] = {Part = P[1218], Material = Enum.Material.Plastic} end
if P[1626] then materialBatch[#materialBatch+1] = {Part = P[1626], Material = Enum.Material.SmoothPlastic} end
if P[1630] then materialBatch[#materialBatch+1] = {Part = P[1630], Material = Enum.Material.SmoothPlastic} end
if P[1197] then materialBatch[#materialBatch+1] = {Part = P[1197], Material = Enum.Material.Plastic} end
if P[1230] then materialBatch[#materialBatch+1] = {Part = P[1230], Material = Enum.Material.Plastic} end
if P[1151] then materialBatch[#materialBatch+1] = {Part = P[1151], Material = Enum.Material.Plastic} end
if P[1136] then materialBatch[#materialBatch+1] = {Part = P[1136], Material = Enum.Material.Plastic} end
if P[1405] then materialBatch[#materialBatch+1] = {Part = P[1405], Material = Enum.Material.Pebble} end
if P[1220] then materialBatch[#materialBatch+1] = {Part = P[1220], Material = Enum.Material.Plastic} end
if P[1491] then materialBatch[#materialBatch+1] = {Part = P[1491], Material = Enum.Material.Pebble} end
if P[1625] then materialBatch[#materialBatch+1] = {Part = P[1625], Material = Enum.Material.SmoothPlastic} end
if P[1623] then materialBatch[#materialBatch+1] = {Part = P[1623], Material = Enum.Material.Fabric} end
if P[1622] then materialBatch[#materialBatch+1] = {Part = P[1622], Material = Enum.Material.SmoothPlastic} end
if P[1121] then materialBatch[#materialBatch+1] = {Part = P[1121], Material = Enum.Material.Plastic} end
if P[1621] then materialBatch[#materialBatch+1] = {Part = P[1621], Material = Enum.Material.SmoothPlastic} end
if P[1411] then materialBatch[#materialBatch+1] = {Part = P[1411], Material = Enum.Material.Pebble} end
if P[1583] then materialBatch[#materialBatch+1] = {Part = P[1583], Material = Enum.Material.Granite} end
if P[1553] then materialBatch[#materialBatch+1] = {Part = P[1553], Material = Enum.Material.Neon} end
if P[1617] then materialBatch[#materialBatch+1] = {Part = P[1617], Material = Enum.Material.SmoothPlastic} end
if P[1619] then materialBatch[#materialBatch+1] = {Part = P[1619], Material = Enum.Material.Plastic} end
if P[1278] then materialBatch[#materialBatch+1] = {Part = P[1278], Material = Enum.Material.Plastic} end
if P[1614] then materialBatch[#materialBatch+1] = {Part = P[1614], Material = Enum.Material.SmoothPlastic} end
if P[1254] then materialBatch[#materialBatch+1] = {Part = P[1254], Material = Enum.Material.Plastic} end
if P[1259] then materialBatch[#materialBatch+1] = {Part = P[1259], Material = Enum.Material.Plastic} end
if P[1449] then materialBatch[#materialBatch+1] = {Part = P[1449], Material = Enum.Material.Pebble} end
if P[1458] then materialBatch[#materialBatch+1] = {Part = P[1458], Material = Enum.Material.Pebble} end
if P[1453] then materialBatch[#materialBatch+1] = {Part = P[1453], Material = Enum.Material.Pebble} end
if P[1106] then materialBatch[#materialBatch+1] = {Part = P[1106], Material = Enum.Material.Plastic} end
if P[1323] then materialBatch[#materialBatch+1] = {Part = P[1323], Material = Enum.Material.Plastic} end
if P[1082] then materialBatch[#materialBatch+1] = {Part = P[1082], Material = Enum.Material.Plastic} end
if P[1429] then materialBatch[#materialBatch+1] = {Part = P[1429], Material = Enum.Material.Neon} end
if P[1452] then materialBatch[#materialBatch+1] = {Part = P[1452], Material = Enum.Material.Pebble} end
if P[1505] then materialBatch[#materialBatch+1] = {Part = P[1505], Material = Enum.Material.Pebble} end
if P[1611] then materialBatch[#materialBatch+1] = {Part = P[1611], Material = Enum.Material.SmoothPlastic} end
if P[1172] then materialBatch[#materialBatch+1] = {Part = P[1172], Material = Enum.Material.Plastic} end
if P[1608] then materialBatch[#materialBatch+1] = {Part = P[1608], Material = Enum.Material.Neon} end
if P[1606] then materialBatch[#materialBatch+1] = {Part = P[1606], Material = Enum.Material.Neon} end
if P[1244] then materialBatch[#materialBatch+1] = {Part = P[1244], Material = Enum.Material.Plastic} end
if P[1409] then materialBatch[#materialBatch+1] = {Part = P[1409], Material = Enum.Material.Pebble} end
if P[1478] then materialBatch[#materialBatch+1] = {Part = P[1478], Material = Enum.Material.Pebble} end
if P[1545] then materialBatch[#materialBatch+1] = {Part = P[1545], Material = Enum.Material.Neon} end
if P[1599] then materialBatch[#materialBatch+1] = {Part = P[1599], Material = Enum.Material.Granite} end
if P[1597] then materialBatch[#materialBatch+1] = {Part = P[1597], Material = Enum.Material.Granite} end
if P[1365] then materialBatch[#materialBatch+1] = {Part = P[1365], Material = Enum.Material.Metal} end
if P[1043] then materialBatch[#materialBatch+1] = {Part = P[1043], Material = Enum.Material.Plastic} end
if P[1241] then materialBatch[#materialBatch+1] = {Part = P[1241], Material = Enum.Material.Plastic} end
if P[1227] then materialBatch[#materialBatch+1] = {Part = P[1227], Material = Enum.Material.Plastic} end
if P[1589] then materialBatch[#materialBatch+1] = {Part = P[1589], Material = Enum.Material.Granite} end
if P[1360] then materialBatch[#materialBatch+1] = {Part = P[1360], Material = Enum.Material.Metal} end
if P[1308] then materialBatch[#materialBatch+1] = {Part = P[1308], Material = Enum.Material.Plastic} end
if P[1217] then materialBatch[#materialBatch+1] = {Part = P[1217], Material = Enum.Material.Plastic} end
if P[1372] then materialBatch[#materialBatch+1] = {Part = P[1372], Material = Enum.Material.Metal} end
if P[1193] then materialBatch[#materialBatch+1] = {Part = P[1193], Material = Enum.Material.Plastic} end
if P[1578] then materialBatch[#materialBatch+1] = {Part = P[1578], Material = Enum.Material.Neon} end
if P[1444] then materialBatch[#materialBatch+1] = {Part = P[1444], Material = Enum.Material.Pebble} end
if P[1585] then materialBatch[#materialBatch+1] = {Part = P[1585], Material = Enum.Material.Neon} end
if P[1403] then materialBatch[#materialBatch+1] = {Part = P[1403], Material = Enum.Material.Pebble} end
if P[1451] then materialBatch[#materialBatch+1] = {Part = P[1451], Material = Enum.Material.Pebble} end
if P[1094] then materialBatch[#materialBatch+1] = {Part = P[1094], Material = Enum.Material.Plastic} end
if P[1573] then materialBatch[#materialBatch+1] = {Part = P[1573], Material = Enum.Material.Granite} end
if P[1098] then materialBatch[#materialBatch+1] = {Part = P[1098], Material = Enum.Material.Plastic} end
if P[1564] then materialBatch[#materialBatch+1] = {Part = P[1564], Material = Enum.Material.Pebble} end
if P[1208] then materialBatch[#materialBatch+1] = {Part = P[1208], Material = Enum.Material.Plastic} end
if P[1355] then materialBatch[#materialBatch+1] = {Part = P[1355], Material = Enum.Material.Metal} end
if P[1562] then materialBatch[#materialBatch+1] = {Part = P[1562], Material = Enum.Material.Neon} end
if P[1560] then materialBatch[#materialBatch+1] = {Part = P[1560], Material = Enum.Material.Granite} end
if P[1509] then materialBatch[#materialBatch+1] = {Part = P[1509], Material = Enum.Material.Pebble} end
if P[1557] then materialBatch[#materialBatch+1] = {Part = P[1557], Material = Enum.Material.Granite} end
if P[1432] then materialBatch[#materialBatch+1] = {Part = P[1432], Material = Enum.Material.Neon} end
if P[1555] then materialBatch[#materialBatch+1] = {Part = P[1555], Material = Enum.Material.Granite} end
if P[1616] then materialBatch[#materialBatch+1] = {Part = P[1616], Material = Enum.Material.SmoothPlastic} end
if P[1551] then materialBatch[#materialBatch+1] = {Part = P[1551], Material = Enum.Material.Granite} end
if P[1256] then materialBatch[#materialBatch+1] = {Part = P[1256], Material = Enum.Material.Plastic} end
if P[1447] then materialBatch[#materialBatch+1] = {Part = P[1447], Material = Enum.Material.Pebble} end
if P[1402] then materialBatch[#materialBatch+1] = {Part = P[1402], Material = Enum.Material.Pebble} end
if P[1604] then materialBatch[#materialBatch+1] = {Part = P[1604], Material = Enum.Material.Granite} end
if P[1229] then materialBatch[#materialBatch+1] = {Part = P[1229], Material = Enum.Material.Plastic} end
if P[1125] then materialBatch[#materialBatch+1] = {Part = P[1125], Material = Enum.Material.Plastic} end
if P[1303] then materialBatch[#materialBatch+1] = {Part = P[1303], Material = Enum.Material.Plastic} end
if P[1534] then materialBatch[#materialBatch+1] = {Part = P[1534], Material = Enum.Material.Granite} end
if P[1533] then materialBatch[#materialBatch+1] = {Part = P[1533], Material = Enum.Material.Granite} end
if P[1497] then materialBatch[#materialBatch+1] = {Part = P[1497], Material = Enum.Material.Pebble} end
if P[1475] then materialBatch[#materialBatch+1] = {Part = P[1475], Material = Enum.Material.Pebble} end
if P[1031] then materialBatch[#materialBatch+1] = {Part = P[1031], Material = Enum.Material.Plastic} end
if P[1529] then materialBatch[#materialBatch+1] = {Part = P[1529], Material = Enum.Material.Neon} end
if P[1527] then materialBatch[#materialBatch+1] = {Part = P[1527], Material = Enum.Material.Neon} end
if P[1349] then materialBatch[#materialBatch+1] = {Part = P[1349], Material = Enum.Material.Plastic} end
if P[1115] then materialBatch[#materialBatch+1] = {Part = P[1115], Material = Enum.Material.Plastic} end
if P[1524] then materialBatch[#materialBatch+1] = {Part = P[1524], Material = Enum.Material.Granite} end
if P[1085] then materialBatch[#materialBatch+1] = {Part = P[1085], Material = Enum.Material.Plastic} end
if P[1523] then materialBatch[#materialBatch+1] = {Part = P[1523], Material = Enum.Material.Neon} end
if P[1086] then materialBatch[#materialBatch+1] = {Part = P[1086], Material = Enum.Material.Plastic} end
if P[1522] then materialBatch[#materialBatch+1] = {Part = P[1522], Material = Enum.Material.Neon} end
if P[1517] then materialBatch[#materialBatch+1] = {Part = P[1517], Material = Enum.Material.Pebble} end
if P[1507] then materialBatch[#materialBatch+1] = {Part = P[1507], Material = Enum.Material.Pebble} end
if P[1634] then materialBatch[#materialBatch+1] = {Part = P[1634], Material = Enum.Material.SmoothPlastic} end
if P[1513] then materialBatch[#materialBatch+1] = {Part = P[1513], Material = Enum.Material.Pebble} end
if P[1164] then materialBatch[#materialBatch+1] = {Part = P[1164], Material = Enum.Material.Plastic} end
if P[1490] then materialBatch[#materialBatch+1] = {Part = P[1490], Material = Enum.Material.Pebble} end
if P[1170] then materialBatch[#materialBatch+1] = {Part = P[1170], Material = Enum.Material.Plastic} end
if P[1510] then materialBatch[#materialBatch+1] = {Part = P[1510], Material = Enum.Material.Pebble} end
if P[1503] then materialBatch[#materialBatch+1] = {Part = P[1503], Material = Enum.Material.Pebble} end
if P[1109] then materialBatch[#materialBatch+1] = {Part = P[1109], Material = Enum.Material.Plastic} end
if P[1415] then materialBatch[#materialBatch+1] = {Part = P[1415], Material = Enum.Material.Pebble} end
if P[1377] then materialBatch[#materialBatch+1] = {Part = P[1377], Material = Enum.Material.Metal} end
if P[1221] then materialBatch[#materialBatch+1] = {Part = P[1221], Material = Enum.Material.Plastic} end
if P[1516] then materialBatch[#materialBatch+1] = {Part = P[1516], Material = Enum.Material.Pebble} end
if P[1506] then materialBatch[#materialBatch+1] = {Part = P[1506], Material = Enum.Material.Pebble} end
if P[1502] then materialBatch[#materialBatch+1] = {Part = P[1502], Material = Enum.Material.Pebble} end
if P[1386] then materialBatch[#materialBatch+1] = {Part = P[1386], Material = Enum.Material.Metal} end
if P[1390] then materialBatch[#materialBatch+1] = {Part = P[1390], Material = Enum.Material.Wood} end
if P[1501] then materialBatch[#materialBatch+1] = {Part = P[1501], Material = Enum.Material.Pebble} end
if P[1154] then materialBatch[#materialBatch+1] = {Part = P[1154], Material = Enum.Material.Plastic} end
if P[1500] then materialBatch[#materialBatch+1] = {Part = P[1500], Material = Enum.Material.Pebble} end
if P[1130] then materialBatch[#materialBatch+1] = {Part = P[1130], Material = Enum.Material.Plastic} end
if P[1354] then materialBatch[#materialBatch+1] = {Part = P[1354], Material = Enum.Material.Marble} end
if P[1361] then materialBatch[#materialBatch+1] = {Part = P[1361], Material = Enum.Material.Marble} end
if P[1460] then materialBatch[#materialBatch+1] = {Part = P[1460], Material = Enum.Material.Pebble} end
if P[1462] then materialBatch[#materialBatch+1] = {Part = P[1462], Material = Enum.Material.Pebble} end
if P[1266] then materialBatch[#materialBatch+1] = {Part = P[1266], Material = Enum.Material.Plastic} end
if P[1531] then materialBatch[#materialBatch+1] = {Part = P[1531], Material = Enum.Material.Granite} end
if P[1637] then materialBatch[#materialBatch+1] = {Part = P[1637], Material = Enum.Material.Fabric} end
if P[1380] then materialBatch[#materialBatch+1] = {Part = P[1380], Material = Enum.Material.Wood} end
if P[1387] then materialBatch[#materialBatch+1] = {Part = P[1387], Material = Enum.Material.Metal} end
if P[1493] then materialBatch[#materialBatch+1] = {Part = P[1493], Material = Enum.Material.Pebble} end
if P[1382] then materialBatch[#materialBatch+1] = {Part = P[1382], Material = Enum.Material.Marble} end
if P[1300] then materialBatch[#materialBatch+1] = {Part = P[1300], Material = Enum.Material.Plastic} end
if P[1459] then materialBatch[#materialBatch+1] = {Part = P[1459], Material = Enum.Material.Pebble} end
if P[1488] then materialBatch[#materialBatch+1] = {Part = P[1488], Material = Enum.Material.Pebble} end
if P[1257] then materialBatch[#materialBatch+1] = {Part = P[1257], Material = Enum.Material.Plastic} end
if P[1486] then materialBatch[#materialBatch+1] = {Part = P[1486], Material = Enum.Material.Pebble} end
if P[1485] then materialBatch[#materialBatch+1] = {Part = P[1485], Material = Enum.Material.Pebble} end
if P[1149] then materialBatch[#materialBatch+1] = {Part = P[1149], Material = Enum.Material.Plastic} end
if P[1483] then materialBatch[#materialBatch+1] = {Part = P[1483], Material = Enum.Material.Pebble} end
if P[1260] then materialBatch[#materialBatch+1] = {Part = P[1260], Material = Enum.Material.Plastic} end
if P[1455] then materialBatch[#materialBatch+1] = {Part = P[1455], Material = Enum.Material.Pebble} end
if P[1481] then materialBatch[#materialBatch+1] = {Part = P[1481], Material = Enum.Material.Pebble} end
if P[1143] then materialBatch[#materialBatch+1] = {Part = P[1143], Material = Enum.Material.Plastic} end
if P[1476] then materialBatch[#materialBatch+1] = {Part = P[1476], Material = Enum.Material.Pebble} end
if P[1344] then materialBatch[#materialBatch+1] = {Part = P[1344], Material = Enum.Material.Plastic} end
if P[1110] then materialBatch[#materialBatch+1] = {Part = P[1110], Material = Enum.Material.Plastic} end
if P[1091] then materialBatch[#materialBatch+1] = {Part = P[1091], Material = Enum.Material.Plastic} end
if P[1471] then materialBatch[#materialBatch+1] = {Part = P[1471], Material = Enum.Material.Pebble} end
if P[1470] then materialBatch[#materialBatch+1] = {Part = P[1470], Material = Enum.Material.Neon} end
if P[1468] then materialBatch[#materialBatch+1] = {Part = P[1468], Material = Enum.Material.Pebble} end
if P[1467] then materialBatch[#materialBatch+1] = {Part = P[1467], Material = Enum.Material.Pebble} end
if P[1313] then materialBatch[#materialBatch+1] = {Part = P[1313], Material = Enum.Material.Plastic} end
if P[1466] then materialBatch[#materialBatch+1] = {Part = P[1466], Material = Enum.Material.Pebble} end
if P[1265] then materialBatch[#materialBatch+1] = {Part = P[1265], Material = Enum.Material.Plastic} end
if P[1148] then materialBatch[#materialBatch+1] = {Part = P[1148], Material = Enum.Material.Plastic} end
if P[1397] then materialBatch[#materialBatch+1] = {Part = P[1397], Material = Enum.Material.Neon} end
if P[1095] then materialBatch[#materialBatch+1] = {Part = P[1095], Material = Enum.Material.Plastic} end
if P[1464] then materialBatch[#materialBatch+1] = {Part = P[1464], Material = Enum.Material.Pebble} end
if P[1498] then materialBatch[#materialBatch+1] = {Part = P[1498], Material = Enum.Material.Pebble} end
if P[1211] then materialBatch[#materialBatch+1] = {Part = P[1211], Material = Enum.Material.Plastic} end
if P[1461] then materialBatch[#materialBatch+1] = {Part = P[1461], Material = Enum.Material.Pebble} end
if P[1457] then materialBatch[#materialBatch+1] = {Part = P[1457], Material = Enum.Material.Pebble} end
if P[1456] then materialBatch[#materialBatch+1] = {Part = P[1456], Material = Enum.Material.Pebble} end
if P[1311] then materialBatch[#materialBatch+1] = {Part = P[1311], Material = Enum.Material.Plastic} end
if P[1484] then materialBatch[#materialBatch+1] = {Part = P[1484], Material = Enum.Material.Pebble} end
if P[1482] then materialBatch[#materialBatch+1] = {Part = P[1482], Material = Enum.Material.Pebble} end
if P[1277] then materialBatch[#materialBatch+1] = {Part = P[1277], Material = Enum.Material.Plastic} end
if P[1454] then materialBatch[#materialBatch+1] = {Part = P[1454], Material = Enum.Material.Pebble} end
if P[1450] then materialBatch[#materialBatch+1] = {Part = P[1450], Material = Enum.Material.Pebble} end
if P[1142] then materialBatch[#materialBatch+1] = {Part = P[1142], Material = Enum.Material.Plastic} end
if P[1443] then materialBatch[#materialBatch+1] = {Part = P[1443], Material = Enum.Material.Pebble} end
if P[1543] then materialBatch[#materialBatch+1] = {Part = P[1543], Material = Enum.Material.Granite} end
if P[1235] then materialBatch[#materialBatch+1] = {Part = P[1235], Material = Enum.Material.Plastic} end
if P[1547] then materialBatch[#materialBatch+1] = {Part = P[1547], Material = Enum.Material.Granite} end
if P[1287] then materialBatch[#materialBatch+1] = {Part = P[1287], Material = Enum.Material.Plastic} end
if P[1079] then materialBatch[#materialBatch+1] = {Part = P[1079], Material = Enum.Material.Plastic} end
if P[1580] then materialBatch[#materialBatch+1] = {Part = P[1580], Material = Enum.Material.Granite} end
if P[1124] then materialBatch[#materialBatch+1] = {Part = P[1124], Material = Enum.Material.Plastic} end
if P[1441] then materialBatch[#materialBatch+1] = {Part = P[1441], Material = Enum.Material.Pebble} end
if P[1435] then materialBatch[#materialBatch+1] = {Part = P[1435], Material = Enum.Material.Granite} end
if P[1262] then materialBatch[#materialBatch+1] = {Part = P[1262], Material = Enum.Material.Plastic} end
if P[1134] then materialBatch[#materialBatch+1] = {Part = P[1134], Material = Enum.Material.Plastic} end
if P[1199] then materialBatch[#materialBatch+1] = {Part = P[1199], Material = Enum.Material.Plastic} end
if P[1187] then materialBatch[#materialBatch+1] = {Part = P[1187], Material = Enum.Material.Plastic} end
if P[1176] then materialBatch[#materialBatch+1] = {Part = P[1176], Material = Enum.Material.Plastic} end
if P[1133] then materialBatch[#materialBatch+1] = {Part = P[1133], Material = Enum.Material.Plastic} end
if P[1027] then materialBatch[#materialBatch+1] = {Part = P[1027], Material = Enum.Material.Plastic} end
if P[1100] then materialBatch[#materialBatch+1] = {Part = P[1100], Material = Enum.Material.Plastic} end
if P[1391] then materialBatch[#materialBatch+1] = {Part = P[1391], Material = Enum.Material.Wood} end
if P[1251] then materialBatch[#materialBatch+1] = {Part = P[1251], Material = Enum.Material.Plastic} end
if P[1412] then materialBatch[#materialBatch+1] = {Part = P[1412], Material = Enum.Material.Pebble} end
if P[1508] then materialBatch[#materialBatch+1] = {Part = P[1508], Material = Enum.Material.Pebble} end
if P[1200] then materialBatch[#materialBatch+1] = {Part = P[1200], Material = Enum.Material.Plastic} end
if P[1366] then materialBatch[#materialBatch+1] = {Part = P[1366], Material = Enum.Material.Marble} end
if P[1424] then materialBatch[#materialBatch+1] = {Part = P[1424], Material = Enum.Material.Granite} end
if P[1263] then materialBatch[#materialBatch+1] = {Part = P[1263], Material = Enum.Material.Plastic} end
if P[1253] then materialBatch[#materialBatch+1] = {Part = P[1253], Material = Enum.Material.Plastic} end
if P[1474] then materialBatch[#materialBatch+1] = {Part = P[1474], Material = Enum.Material.Pebble} end
if P[1272] then materialBatch[#materialBatch+1] = {Part = P[1272], Material = Enum.Material.Plastic} end
if P[1175] then materialBatch[#materialBatch+1] = {Part = P[1175], Material = Enum.Material.Plastic} end
if P[1116] then materialBatch[#materialBatch+1] = {Part = P[1116], Material = Enum.Material.Plastic} end
if P[1576] then materialBatch[#materialBatch+1] = {Part = P[1576], Material = Enum.Material.Neon} end
if P[1101] then materialBatch[#materialBatch+1] = {Part = P[1101], Material = Enum.Material.Plastic} end
if P[1398] then materialBatch[#materialBatch+1] = {Part = P[1398], Material = Enum.Material.Neon} end
if P[1214] then materialBatch[#materialBatch+1] = {Part = P[1214], Material = Enum.Material.Plastic} end
if P[1157] then materialBatch[#materialBatch+1] = {Part = P[1157], Material = Enum.Material.Plastic} end
if P[1587] then materialBatch[#materialBatch+1] = {Part = P[1587], Material = Enum.Material.Neon} end
if P[1356] then materialBatch[#materialBatch+1] = {Part = P[1356], Material = Enum.Material.Wood} end
if P[1161] then materialBatch[#materialBatch+1] = {Part = P[1161], Material = Enum.Material.Plastic} end
if P[1203] then materialBatch[#materialBatch+1] = {Part = P[1203], Material = Enum.Material.Plastic} end
if P[1088] then materialBatch[#materialBatch+1] = {Part = P[1088], Material = Enum.Material.Plastic} end
if P[1384] then materialBatch[#materialBatch+1] = {Part = P[1384], Material = Enum.Material.Glass} end
if P[1281] then materialBatch[#materialBatch+1] = {Part = P[1281], Material = Enum.Material.Plastic} end
if P[1069] then materialBatch[#materialBatch+1] = {Part = P[1069], Material = Enum.Material.Plastic} end
if P[1383] then materialBatch[#materialBatch+1] = {Part = P[1383], Material = Enum.Material.Metal} end
if P[1492] then materialBatch[#materialBatch+1] = {Part = P[1492], Material = Enum.Material.Pebble} end
if P[1629] then materialBatch[#materialBatch+1] = {Part = P[1629], Material = Enum.Material.SmoothPlastic} end
if P[1131] then materialBatch[#materialBatch+1] = {Part = P[1131], Material = Enum.Material.Plastic} end
if P[1155] then materialBatch[#materialBatch+1] = {Part = P[1155], Material = Enum.Material.Plastic} end
if P[1274] then materialBatch[#materialBatch+1] = {Part = P[1274], Material = Enum.Material.Plastic} end
if P[1226] then materialBatch[#materialBatch+1] = {Part = P[1226], Material = Enum.Material.Plastic} end
if P[1212] then materialBatch[#materialBatch+1] = {Part = P[1212], Material = Enum.Material.Plastic} end
if P[1357] then materialBatch[#materialBatch+1] = {Part = P[1357], Material = Enum.Material.Glass} end
if P[1385] then materialBatch[#materialBatch+1] = {Part = P[1385], Material = Enum.Material.Metal} end
if P[1363] then materialBatch[#materialBatch+1] = {Part = P[1363], Material = Enum.Material.Metal} end
if P[1362] then materialBatch[#materialBatch+1] = {Part = P[1362], Material = Enum.Material.Metal} end
if P[1049] then materialBatch[#materialBatch+1] = {Part = P[1049], Material = Enum.Material.Plastic} end
if P[1054] then materialBatch[#materialBatch+1] = {Part = P[1054], Material = Enum.Material.Plastic} end
if P[1358] then materialBatch[#materialBatch+1] = {Part = P[1358], Material = Enum.Material.Wood} end
if P[1119] then materialBatch[#materialBatch+1] = {Part = P[1119], Material = Enum.Material.Plastic} end
if P[1173] then materialBatch[#materialBatch+1] = {Part = P[1173], Material = Enum.Material.Plastic} end
if P[1499] then materialBatch[#materialBatch+1] = {Part = P[1499], Material = Enum.Material.Pebble} end
if P[1284] then materialBatch[#materialBatch+1] = {Part = P[1284], Material = Enum.Material.Plastic} end
if P[1418] then materialBatch[#materialBatch+1] = {Part = P[1418], Material = Enum.Material.SmoothPlastic} end
if P[1268] then materialBatch[#materialBatch+1] = {Part = P[1268], Material = Enum.Material.Plastic} end
if P[1122] then materialBatch[#materialBatch+1] = {Part = P[1122], Material = Enum.Material.Plastic} end
if P[1215] then materialBatch[#materialBatch+1] = {Part = P[1215], Material = Enum.Material.Plastic} end
if P[1291] then materialBatch[#materialBatch+1] = {Part = P[1291], Material = Enum.Material.Plastic} end
if P[1191] then materialBatch[#materialBatch+1] = {Part = P[1191], Material = Enum.Material.Plastic} end
if P[1427] then materialBatch[#materialBatch+1] = {Part = P[1427], Material = Enum.Material.Granite} end
if P[1375] then materialBatch[#materialBatch+1] = {Part = P[1375], Material = Enum.Material.Metal} end
if P[1317] then materialBatch[#materialBatch+1] = {Part = P[1317], Material = Enum.Material.Plastic} end
if P[1140] then materialBatch[#materialBatch+1] = {Part = P[1140], Material = Enum.Material.Plastic} end
if P[1539] then materialBatch[#materialBatch+1] = {Part = P[1539], Material = Enum.Material.Granite} end
if P[1299] then materialBatch[#materialBatch+1] = {Part = P[1299], Material = Enum.Material.Plastic} end
if P[1167] then materialBatch[#materialBatch+1] = {Part = P[1167], Material = Enum.Material.Plastic} end
if P[1179] then materialBatch[#materialBatch+1] = {Part = P[1179], Material = Enum.Material.Plastic} end
if P[1184] then materialBatch[#materialBatch+1] = {Part = P[1184], Material = Enum.Material.Plastic} end
if P[1238] then materialBatch[#materialBatch+1] = {Part = P[1238], Material = Enum.Material.Plastic} end
if P[1160] then materialBatch[#materialBatch+1] = {Part = P[1160], Material = Enum.Material.Plastic} end
if P[1269] then materialBatch[#materialBatch+1] = {Part = P[1269], Material = Enum.Material.Plastic} end
if P[1247] then materialBatch[#materialBatch+1] = {Part = P[1247], Material = Enum.Material.Plastic} end
if P[1112] then materialBatch[#materialBatch+1] = {Part = P[1112], Material = Enum.Material.Plastic} end
batchMaterial(endpoint, materialBatch)
local transparencyBatch = {}
if P[6] then transparencyBatch[#transparencyBatch+1] = {Part = P[6], Transparency = 1} end
if P[14] then transparencyBatch[#transparencyBatch+1] = {Part = P[14], Transparency = 1} end
if P[63] then transparencyBatch[#transparencyBatch+1] = {Part = P[63], Transparency = 1} end
if P[72] then transparencyBatch[#transparencyBatch+1] = {Part = P[72], Transparency = 1} end
if P[88] then transparencyBatch[#transparencyBatch+1] = {Part = P[88], Transparency = 1} end
if P[385] then transparencyBatch[#transparencyBatch+1] = {Part = P[385], Transparency = 1} end
if P[1420] then transparencyBatch[#transparencyBatch+1] = {Part = P[1420], Transparency = 1} end
if P[1369] then transparencyBatch[#transparencyBatch+1] = {Part = P[1369], Transparency = 1} end
if P[1520] then transparencyBatch[#transparencyBatch+1] = {Part = P[1520], Transparency = 1} end
if P[1346] then transparencyBatch[#transparencyBatch+1] = {Part = P[1346], Transparency = 1} end
if P[1308] then transparencyBatch[#transparencyBatch+1] = {Part = P[1308], Transparency = 1} end
if P[1372] then transparencyBatch[#transparencyBatch+1] = {Part = P[1372], Transparency = 1} end
if P[1432] then transparencyBatch[#transparencyBatch+1] = {Part = P[1432], Transparency = 0.5} end
if P[1079] then transparencyBatch[#transparencyBatch+1] = {Part = P[1079], Transparency = 1} end
if P[1418] then transparencyBatch[#transparencyBatch+1] = {Part = P[1418], Transparency = 1} end
if P[1375] then transparencyBatch[#transparencyBatch+1] = {Part = P[1375], Transparency = 1} end
if P[1299] then transparencyBatch[#transparencyBatch+1] = {Part = P[1299], Transparency = 1} end
batchMaterial(endpoint, transparencyBatch)
local reflectanceBatch = {}
batchMaterial(endpoint, reflectanceBatch)
local colorBatch = {}
if P[6] then colorBatch[#colorBatch+1] = {Part = P[6], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[10] then colorBatch[#colorBatch+1] = {Part = P[10], Color = Color3.new(0.8549019694328308,0.5215686559677124,0.2549019753932953), UnionColoring = false} end
if P[14] then colorBatch[#colorBatch+1] = {Part = P[14], Color = Color3.new(0.9490196108818054,0.9529411792755127,0.9529411792755127), UnionColoring = false} end
if P[16] then colorBatch[#colorBatch+1] = {Part = P[16], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[21] then colorBatch[#colorBatch+1] = {Part = P[21], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[26] then colorBatch[#colorBatch+1] = {Part = P[26], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[31] then colorBatch[#colorBatch+1] = {Part = P[31], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[39] then colorBatch[#colorBatch+1] = {Part = P[39], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[46] then colorBatch[#colorBatch+1] = {Part = P[46], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[47] then colorBatch[#colorBatch+1] = {Part = P[47], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[48] then colorBatch[#colorBatch+1] = {Part = P[48], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[49] then colorBatch[#colorBatch+1] = {Part = P[49], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[50] then colorBatch[#colorBatch+1] = {Part = P[50], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[51] then colorBatch[#colorBatch+1] = {Part = P[51], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[52] then colorBatch[#colorBatch+1] = {Part = P[52], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[53] then colorBatch[#colorBatch+1] = {Part = P[53], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[54] then colorBatch[#colorBatch+1] = {Part = P[54], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[55] then colorBatch[#colorBatch+1] = {Part = P[55], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[57] then colorBatch[#colorBatch+1] = {Part = P[57], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[58] then colorBatch[#colorBatch+1] = {Part = P[58], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[59] then colorBatch[#colorBatch+1] = {Part = P[59], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[60] then colorBatch[#colorBatch+1] = {Part = P[60], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[61] then colorBatch[#colorBatch+1] = {Part = P[61], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[62] then colorBatch[#colorBatch+1] = {Part = P[62], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[63] then colorBatch[#colorBatch+1] = {Part = P[63], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[64] then colorBatch[#colorBatch+1] = {Part = P[64], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[65] then colorBatch[#colorBatch+1] = {Part = P[65], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[66] then colorBatch[#colorBatch+1] = {Part = P[66], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[67] then colorBatch[#colorBatch+1] = {Part = P[67], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[68] then colorBatch[#colorBatch+1] = {Part = P[68], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[69] then colorBatch[#colorBatch+1] = {Part = P[69], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[70] then colorBatch[#colorBatch+1] = {Part = P[70], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[71] then colorBatch[#colorBatch+1] = {Part = P[71], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[72] then colorBatch[#colorBatch+1] = {Part = P[72], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[73] then colorBatch[#colorBatch+1] = {Part = P[73], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[74] then colorBatch[#colorBatch+1] = {Part = P[74], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[75] then colorBatch[#colorBatch+1] = {Part = P[75], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[76] then colorBatch[#colorBatch+1] = {Part = P[76], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[77] then colorBatch[#colorBatch+1] = {Part = P[77], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[78] then colorBatch[#colorBatch+1] = {Part = P[78], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[79] then colorBatch[#colorBatch+1] = {Part = P[79], Color = Color3.new(0.33725491166114807,0.25882354378700256,0.21176470816135406), UnionColoring = false} end
if P[80] then colorBatch[#colorBatch+1] = {Part = P[80], Color = Color3.new(0.686274528503418,0.5803921818733215,0.5137255191802979), UnionColoring = false} end
if P[81] then colorBatch[#colorBatch+1] = {Part = P[81], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[84] then colorBatch[#colorBatch+1] = {Part = P[84], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[88] then colorBatch[#colorBatch+1] = {Part = P[88], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[89] then colorBatch[#colorBatch+1] = {Part = P[89], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[92] then colorBatch[#colorBatch+1] = {Part = P[92], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[93] then colorBatch[#colorBatch+1] = {Part = P[93], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[97] then colorBatch[#colorBatch+1] = {Part = P[97], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[98] then colorBatch[#colorBatch+1] = {Part = P[98], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[99] then colorBatch[#colorBatch+1] = {Part = P[99], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[100] then colorBatch[#colorBatch+1] = {Part = P[100], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[101] then colorBatch[#colorBatch+1] = {Part = P[101], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[102] then colorBatch[#colorBatch+1] = {Part = P[102], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[103] then colorBatch[#colorBatch+1] = {Part = P[103], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[104] then colorBatch[#colorBatch+1] = {Part = P[104], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[105] then colorBatch[#colorBatch+1] = {Part = P[105], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[107] then colorBatch[#colorBatch+1] = {Part = P[107], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[108] then colorBatch[#colorBatch+1] = {Part = P[108], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[109] then colorBatch[#colorBatch+1] = {Part = P[109], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[110] then colorBatch[#colorBatch+1] = {Part = P[110], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[111] then colorBatch[#colorBatch+1] = {Part = P[111], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[112] then colorBatch[#colorBatch+1] = {Part = P[112], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[113] then colorBatch[#colorBatch+1] = {Part = P[113], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[114] then colorBatch[#colorBatch+1] = {Part = P[114], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[115] then colorBatch[#colorBatch+1] = {Part = P[115], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[116] then colorBatch[#colorBatch+1] = {Part = P[116], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[117] then colorBatch[#colorBatch+1] = {Part = P[117], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[118] then colorBatch[#colorBatch+1] = {Part = P[118], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[119] then colorBatch[#colorBatch+1] = {Part = P[119], Color = Color3.new(0.1568627506494522,0.49803921580314636,0.27843138575553894), UnionColoring = false} end
if P[123] then colorBatch[#colorBatch+1] = {Part = P[123], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[125] then colorBatch[#colorBatch+1] = {Part = P[125], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[126] then colorBatch[#colorBatch+1] = {Part = P[126], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[127] then colorBatch[#colorBatch+1] = {Part = P[127], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[128] then colorBatch[#colorBatch+1] = {Part = P[128], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[129] then colorBatch[#colorBatch+1] = {Part = P[129], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[130] then colorBatch[#colorBatch+1] = {Part = P[130], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[131] then colorBatch[#colorBatch+1] = {Part = P[131], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[132] then colorBatch[#colorBatch+1] = {Part = P[132], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[133] then colorBatch[#colorBatch+1] = {Part = P[133], Color = Color3.new(0.5843137502670288,0.4745098054409027,0.46666666865348816), UnionColoring = false} end
if P[134] then colorBatch[#colorBatch+1] = {Part = P[134], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[135] then colorBatch[#colorBatch+1] = {Part = P[135], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[136] then colorBatch[#colorBatch+1] = {Part = P[136], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[137] then colorBatch[#colorBatch+1] = {Part = P[137], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[138] then colorBatch[#colorBatch+1] = {Part = P[138], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[139] then colorBatch[#colorBatch+1] = {Part = P[139], Color = Color3.new(0.5843137502670288,0.4745098054409027,0.46666666865348816), UnionColoring = false} end
if P[140] then colorBatch[#colorBatch+1] = {Part = P[140], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[141] then colorBatch[#colorBatch+1] = {Part = P[141], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[142] then colorBatch[#colorBatch+1] = {Part = P[142], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[143] then colorBatch[#colorBatch+1] = {Part = P[143], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[144] then colorBatch[#colorBatch+1] = {Part = P[144], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[145] then colorBatch[#colorBatch+1] = {Part = P[145], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[146] then colorBatch[#colorBatch+1] = {Part = P[146], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[147] then colorBatch[#colorBatch+1] = {Part = P[147], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[148] then colorBatch[#colorBatch+1] = {Part = P[148], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[149] then colorBatch[#colorBatch+1] = {Part = P[149], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[150] then colorBatch[#colorBatch+1] = {Part = P[150], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[151] then colorBatch[#colorBatch+1] = {Part = P[151], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[152] then colorBatch[#colorBatch+1] = {Part = P[152], Color = Color3.new(0.5843137502670288,0.4745098054409027,0.46666666865348816), UnionColoring = false} end
if P[153] then colorBatch[#colorBatch+1] = {Part = P[153], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[154] then colorBatch[#colorBatch+1] = {Part = P[154], Color = Color3.new(0.5843137502670288,0.4745098054409027,0.46666666865348816), UnionColoring = false} end
if P[155] then colorBatch[#colorBatch+1] = {Part = P[155], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[156] then colorBatch[#colorBatch+1] = {Part = P[156], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[157] then colorBatch[#colorBatch+1] = {Part = P[157], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[158] then colorBatch[#colorBatch+1] = {Part = P[158], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[159] then colorBatch[#colorBatch+1] = {Part = P[159], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[161] then colorBatch[#colorBatch+1] = {Part = P[161], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[162] then colorBatch[#colorBatch+1] = {Part = P[162], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[163] then colorBatch[#colorBatch+1] = {Part = P[163], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[164] then colorBatch[#colorBatch+1] = {Part = P[164], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[165] then colorBatch[#colorBatch+1] = {Part = P[165], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[166] then colorBatch[#colorBatch+1] = {Part = P[166], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[167] then colorBatch[#colorBatch+1] = {Part = P[167], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[168] then colorBatch[#colorBatch+1] = {Part = P[168], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[169] then colorBatch[#colorBatch+1] = {Part = P[169], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[170] then colorBatch[#colorBatch+1] = {Part = P[170], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[171] then colorBatch[#colorBatch+1] = {Part = P[171], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[172] then colorBatch[#colorBatch+1] = {Part = P[172], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[173] then colorBatch[#colorBatch+1] = {Part = P[173], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[174] then colorBatch[#colorBatch+1] = {Part = P[174], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[175] then colorBatch[#colorBatch+1] = {Part = P[175], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[176] then colorBatch[#colorBatch+1] = {Part = P[176], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[177] then colorBatch[#colorBatch+1] = {Part = P[177], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[178] then colorBatch[#colorBatch+1] = {Part = P[178], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[179] then colorBatch[#colorBatch+1] = {Part = P[179], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[180] then colorBatch[#colorBatch+1] = {Part = P[180], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[181] then colorBatch[#colorBatch+1] = {Part = P[181], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[182] then colorBatch[#colorBatch+1] = {Part = P[182], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[183] then colorBatch[#colorBatch+1] = {Part = P[183], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[184] then colorBatch[#colorBatch+1] = {Part = P[184], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[185] then colorBatch[#colorBatch+1] = {Part = P[185], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[186] then colorBatch[#colorBatch+1] = {Part = P[186], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[187] then colorBatch[#colorBatch+1] = {Part = P[187], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[188] then colorBatch[#colorBatch+1] = {Part = P[188], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[189] then colorBatch[#colorBatch+1] = {Part = P[189], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[190] then colorBatch[#colorBatch+1] = {Part = P[190], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[191] then colorBatch[#colorBatch+1] = {Part = P[191], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[192] then colorBatch[#colorBatch+1] = {Part = P[192], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[193] then colorBatch[#colorBatch+1] = {Part = P[193], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[194] then colorBatch[#colorBatch+1] = {Part = P[194], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[195] then colorBatch[#colorBatch+1] = {Part = P[195], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[196] then colorBatch[#colorBatch+1] = {Part = P[196], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[197] then colorBatch[#colorBatch+1] = {Part = P[197], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[198] then colorBatch[#colorBatch+1] = {Part = P[198], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[199] then colorBatch[#colorBatch+1] = {Part = P[199], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[201] then colorBatch[#colorBatch+1] = {Part = P[201], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[202] then colorBatch[#colorBatch+1] = {Part = P[202], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[203] then colorBatch[#colorBatch+1] = {Part = P[203], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[204] then colorBatch[#colorBatch+1] = {Part = P[204], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[205] then colorBatch[#colorBatch+1] = {Part = P[205], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[206] then colorBatch[#colorBatch+1] = {Part = P[206], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[207] then colorBatch[#colorBatch+1] = {Part = P[207], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[208] then colorBatch[#colorBatch+1] = {Part = P[208], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[209] then colorBatch[#colorBatch+1] = {Part = P[209], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[210] then colorBatch[#colorBatch+1] = {Part = P[210], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[211] then colorBatch[#colorBatch+1] = {Part = P[211], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[212] then colorBatch[#colorBatch+1] = {Part = P[212], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[213] then colorBatch[#colorBatch+1] = {Part = P[213], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[214] then colorBatch[#colorBatch+1] = {Part = P[214], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[215] then colorBatch[#colorBatch+1] = {Part = P[215], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[216] then colorBatch[#colorBatch+1] = {Part = P[216], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[217] then colorBatch[#colorBatch+1] = {Part = P[217], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[218] then colorBatch[#colorBatch+1] = {Part = P[218], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[219] then colorBatch[#colorBatch+1] = {Part = P[219], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[220] then colorBatch[#colorBatch+1] = {Part = P[220], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[221] then colorBatch[#colorBatch+1] = {Part = P[221], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[222] then colorBatch[#colorBatch+1] = {Part = P[222], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[223] then colorBatch[#colorBatch+1] = {Part = P[223], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[224] then colorBatch[#colorBatch+1] = {Part = P[224], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[225] then colorBatch[#colorBatch+1] = {Part = P[225], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[226] then colorBatch[#colorBatch+1] = {Part = P[226], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[227] then colorBatch[#colorBatch+1] = {Part = P[227], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[230] then colorBatch[#colorBatch+1] = {Part = P[230], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[231] then colorBatch[#colorBatch+1] = {Part = P[231], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[232] then colorBatch[#colorBatch+1] = {Part = P[232], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[233] then colorBatch[#colorBatch+1] = {Part = P[233], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[234] then colorBatch[#colorBatch+1] = {Part = P[234], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[235] then colorBatch[#colorBatch+1] = {Part = P[235], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[236] then colorBatch[#colorBatch+1] = {Part = P[236], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[237] then colorBatch[#colorBatch+1] = {Part = P[237], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[238] then colorBatch[#colorBatch+1] = {Part = P[238], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[239] then colorBatch[#colorBatch+1] = {Part = P[239], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[240] then colorBatch[#colorBatch+1] = {Part = P[240], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[241] then colorBatch[#colorBatch+1] = {Part = P[241], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[242] then colorBatch[#colorBatch+1] = {Part = P[242], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[243] then colorBatch[#colorBatch+1] = {Part = P[243], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[244] then colorBatch[#colorBatch+1] = {Part = P[244], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[245] then colorBatch[#colorBatch+1] = {Part = P[245], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[246] then colorBatch[#colorBatch+1] = {Part = P[246], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[247] then colorBatch[#colorBatch+1] = {Part = P[247], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[248] then colorBatch[#colorBatch+1] = {Part = P[248], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[249] then colorBatch[#colorBatch+1] = {Part = P[249], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[250] then colorBatch[#colorBatch+1] = {Part = P[250], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[251] then colorBatch[#colorBatch+1] = {Part = P[251], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[252] then colorBatch[#colorBatch+1] = {Part = P[252], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[253] then colorBatch[#colorBatch+1] = {Part = P[253], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[254] then colorBatch[#colorBatch+1] = {Part = P[254], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[255] then colorBatch[#colorBatch+1] = {Part = P[255], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[256] then colorBatch[#colorBatch+1] = {Part = P[256], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[257] then colorBatch[#colorBatch+1] = {Part = P[257], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[258] then colorBatch[#colorBatch+1] = {Part = P[258], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[259] then colorBatch[#colorBatch+1] = {Part = P[259], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[260] then colorBatch[#colorBatch+1] = {Part = P[260], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[262] then colorBatch[#colorBatch+1] = {Part = P[262], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[263] then colorBatch[#colorBatch+1] = {Part = P[263], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[264] then colorBatch[#colorBatch+1] = {Part = P[264], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[265] then colorBatch[#colorBatch+1] = {Part = P[265], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[266] then colorBatch[#colorBatch+1] = {Part = P[266], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[267] then colorBatch[#colorBatch+1] = {Part = P[267], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[268] then colorBatch[#colorBatch+1] = {Part = P[268], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[269] then colorBatch[#colorBatch+1] = {Part = P[269], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[270] then colorBatch[#colorBatch+1] = {Part = P[270], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[271] then colorBatch[#colorBatch+1] = {Part = P[271], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[272] then colorBatch[#colorBatch+1] = {Part = P[272], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[273] then colorBatch[#colorBatch+1] = {Part = P[273], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[274] then colorBatch[#colorBatch+1] = {Part = P[274], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[275] then colorBatch[#colorBatch+1] = {Part = P[275], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[276] then colorBatch[#colorBatch+1] = {Part = P[276], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[277] then colorBatch[#colorBatch+1] = {Part = P[277], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[278] then colorBatch[#colorBatch+1] = {Part = P[278], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[279] then colorBatch[#colorBatch+1] = {Part = P[279], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[280] then colorBatch[#colorBatch+1] = {Part = P[280], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[281] then colorBatch[#colorBatch+1] = {Part = P[281], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[282] then colorBatch[#colorBatch+1] = {Part = P[282], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[283] then colorBatch[#colorBatch+1] = {Part = P[283], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[284] then colorBatch[#colorBatch+1] = {Part = P[284], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[285] then colorBatch[#colorBatch+1] = {Part = P[285], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[286] then colorBatch[#colorBatch+1] = {Part = P[286], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[288] then colorBatch[#colorBatch+1] = {Part = P[288], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[289] then colorBatch[#colorBatch+1] = {Part = P[289], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[290] then colorBatch[#colorBatch+1] = {Part = P[290], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[291] then colorBatch[#colorBatch+1] = {Part = P[291], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[292] then colorBatch[#colorBatch+1] = {Part = P[292], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[293] then colorBatch[#colorBatch+1] = {Part = P[293], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[294] then colorBatch[#colorBatch+1] = {Part = P[294], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[295] then colorBatch[#colorBatch+1] = {Part = P[295], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[296] then colorBatch[#colorBatch+1] = {Part = P[296], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[297] then colorBatch[#colorBatch+1] = {Part = P[297], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[298] then colorBatch[#colorBatch+1] = {Part = P[298], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[299] then colorBatch[#colorBatch+1] = {Part = P[299], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[300] then colorBatch[#colorBatch+1] = {Part = P[300], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[301] then colorBatch[#colorBatch+1] = {Part = P[301], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[302] then colorBatch[#colorBatch+1] = {Part = P[302], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[304] then colorBatch[#colorBatch+1] = {Part = P[304], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[305] then colorBatch[#colorBatch+1] = {Part = P[305], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[306] then colorBatch[#colorBatch+1] = {Part = P[306], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[307] then colorBatch[#colorBatch+1] = {Part = P[307], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[308] then colorBatch[#colorBatch+1] = {Part = P[308], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[309] then colorBatch[#colorBatch+1] = {Part = P[309], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[310] then colorBatch[#colorBatch+1] = {Part = P[310], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[311] then colorBatch[#colorBatch+1] = {Part = P[311], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[312] then colorBatch[#colorBatch+1] = {Part = P[312], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[313] then colorBatch[#colorBatch+1] = {Part = P[313], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[314] then colorBatch[#colorBatch+1] = {Part = P[314], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[315] then colorBatch[#colorBatch+1] = {Part = P[315], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[316] then colorBatch[#colorBatch+1] = {Part = P[316], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[317] then colorBatch[#colorBatch+1] = {Part = P[317], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[318] then colorBatch[#colorBatch+1] = {Part = P[318], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[319] then colorBatch[#colorBatch+1] = {Part = P[319], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[320] then colorBatch[#colorBatch+1] = {Part = P[320], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[321] then colorBatch[#colorBatch+1] = {Part = P[321], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[322] then colorBatch[#colorBatch+1] = {Part = P[322], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[323] then colorBatch[#colorBatch+1] = {Part = P[323], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[324] then colorBatch[#colorBatch+1] = {Part = P[324], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[325] then colorBatch[#colorBatch+1] = {Part = P[325], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[326] then colorBatch[#colorBatch+1] = {Part = P[326], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[327] then colorBatch[#colorBatch+1] = {Part = P[327], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[328] then colorBatch[#colorBatch+1] = {Part = P[328], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[329] then colorBatch[#colorBatch+1] = {Part = P[329], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[330] then colorBatch[#colorBatch+1] = {Part = P[330], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[331] then colorBatch[#colorBatch+1] = {Part = P[331], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[332] then colorBatch[#colorBatch+1] = {Part = P[332], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[333] then colorBatch[#colorBatch+1] = {Part = P[333], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[334] then colorBatch[#colorBatch+1] = {Part = P[334], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[335] then colorBatch[#colorBatch+1] = {Part = P[335], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[336] then colorBatch[#colorBatch+1] = {Part = P[336], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[337] then colorBatch[#colorBatch+1] = {Part = P[337], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[338] then colorBatch[#colorBatch+1] = {Part = P[338], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[339] then colorBatch[#colorBatch+1] = {Part = P[339], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[340] then colorBatch[#colorBatch+1] = {Part = P[340], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[341] then colorBatch[#colorBatch+1] = {Part = P[341], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[342] then colorBatch[#colorBatch+1] = {Part = P[342], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[343] then colorBatch[#colorBatch+1] = {Part = P[343], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[344] then colorBatch[#colorBatch+1] = {Part = P[344], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[345] then colorBatch[#colorBatch+1] = {Part = P[345], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[346] then colorBatch[#colorBatch+1] = {Part = P[346], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[347] then colorBatch[#colorBatch+1] = {Part = P[347], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[348] then colorBatch[#colorBatch+1] = {Part = P[348], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[349] then colorBatch[#colorBatch+1] = {Part = P[349], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[350] then colorBatch[#colorBatch+1] = {Part = P[350], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[351] then colorBatch[#colorBatch+1] = {Part = P[351], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[352] then colorBatch[#colorBatch+1] = {Part = P[352], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[353] then colorBatch[#colorBatch+1] = {Part = P[353], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[354] then colorBatch[#colorBatch+1] = {Part = P[354], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[355] then colorBatch[#colorBatch+1] = {Part = P[355], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[356] then colorBatch[#colorBatch+1] = {Part = P[356], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[357] then colorBatch[#colorBatch+1] = {Part = P[357], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[358] then colorBatch[#colorBatch+1] = {Part = P[358], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[359] then colorBatch[#colorBatch+1] = {Part = P[359], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[360] then colorBatch[#colorBatch+1] = {Part = P[360], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[361] then colorBatch[#colorBatch+1] = {Part = P[361], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[362] then colorBatch[#colorBatch+1] = {Part = P[362], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[363] then colorBatch[#colorBatch+1] = {Part = P[363], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[364] then colorBatch[#colorBatch+1] = {Part = P[364], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[365] then colorBatch[#colorBatch+1] = {Part = P[365], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[366] then colorBatch[#colorBatch+1] = {Part = P[366], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[367] then colorBatch[#colorBatch+1] = {Part = P[367], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[368] then colorBatch[#colorBatch+1] = {Part = P[368], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[369] then colorBatch[#colorBatch+1] = {Part = P[369], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[370] then colorBatch[#colorBatch+1] = {Part = P[370], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[371] then colorBatch[#colorBatch+1] = {Part = P[371], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[373] then colorBatch[#colorBatch+1] = {Part = P[373], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[374] then colorBatch[#colorBatch+1] = {Part = P[374], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[375] then colorBatch[#colorBatch+1] = {Part = P[375], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[376] then colorBatch[#colorBatch+1] = {Part = P[376], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[377] then colorBatch[#colorBatch+1] = {Part = P[377], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[378] then colorBatch[#colorBatch+1] = {Part = P[378], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[379] then colorBatch[#colorBatch+1] = {Part = P[379], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[380] then colorBatch[#colorBatch+1] = {Part = P[380], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[381] then colorBatch[#colorBatch+1] = {Part = P[381], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[382] then colorBatch[#colorBatch+1] = {Part = P[382], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[383] then colorBatch[#colorBatch+1] = {Part = P[383], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[384] then colorBatch[#colorBatch+1] = {Part = P[384], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[385] then colorBatch[#colorBatch+1] = {Part = P[385], Color = Color3.new(1,1,0), UnionColoring = false} end
if P[388] then colorBatch[#colorBatch+1] = {Part = P[388], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[389] then colorBatch[#colorBatch+1] = {Part = P[389], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[390] then colorBatch[#colorBatch+1] = {Part = P[390], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[391] then colorBatch[#colorBatch+1] = {Part = P[391], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[392] then colorBatch[#colorBatch+1] = {Part = P[392], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[393] then colorBatch[#colorBatch+1] = {Part = P[393], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[394] then colorBatch[#colorBatch+1] = {Part = P[394], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[395] then colorBatch[#colorBatch+1] = {Part = P[395], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[396] then colorBatch[#colorBatch+1] = {Part = P[396], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[397] then colorBatch[#colorBatch+1] = {Part = P[397], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[398] then colorBatch[#colorBatch+1] = {Part = P[398], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[399] then colorBatch[#colorBatch+1] = {Part = P[399], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[400] then colorBatch[#colorBatch+1] = {Part = P[400], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[401] then colorBatch[#colorBatch+1] = {Part = P[401], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[402] then colorBatch[#colorBatch+1] = {Part = P[402], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[403] then colorBatch[#colorBatch+1] = {Part = P[403], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[404] then colorBatch[#colorBatch+1] = {Part = P[404], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[405] then colorBatch[#colorBatch+1] = {Part = P[405], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[406] then colorBatch[#colorBatch+1] = {Part = P[406], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[407] then colorBatch[#colorBatch+1] = {Part = P[407], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[408] then colorBatch[#colorBatch+1] = {Part = P[408], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[409] then colorBatch[#colorBatch+1] = {Part = P[409], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[410] then colorBatch[#colorBatch+1] = {Part = P[410], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[411] then colorBatch[#colorBatch+1] = {Part = P[411], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[412] then colorBatch[#colorBatch+1] = {Part = P[412], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[413] then colorBatch[#colorBatch+1] = {Part = P[413], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[414] then colorBatch[#colorBatch+1] = {Part = P[414], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[415] then colorBatch[#colorBatch+1] = {Part = P[415], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[416] then colorBatch[#colorBatch+1] = {Part = P[416], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[417] then colorBatch[#colorBatch+1] = {Part = P[417], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[418] then colorBatch[#colorBatch+1] = {Part = P[418], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[419] then colorBatch[#colorBatch+1] = {Part = P[419], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[420] then colorBatch[#colorBatch+1] = {Part = P[420], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[421] then colorBatch[#colorBatch+1] = {Part = P[421], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[422] then colorBatch[#colorBatch+1] = {Part = P[422], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[423] then colorBatch[#colorBatch+1] = {Part = P[423], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[424] then colorBatch[#colorBatch+1] = {Part = P[424], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[425] then colorBatch[#colorBatch+1] = {Part = P[425], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[426] then colorBatch[#colorBatch+1] = {Part = P[426], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[427] then colorBatch[#colorBatch+1] = {Part = P[427], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[428] then colorBatch[#colorBatch+1] = {Part = P[428], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[429] then colorBatch[#colorBatch+1] = {Part = P[429], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[430] then colorBatch[#colorBatch+1] = {Part = P[430], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[431] then colorBatch[#colorBatch+1] = {Part = P[431], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[432] then colorBatch[#colorBatch+1] = {Part = P[432], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[433] then colorBatch[#colorBatch+1] = {Part = P[433], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[434] then colorBatch[#colorBatch+1] = {Part = P[434], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[435] then colorBatch[#colorBatch+1] = {Part = P[435], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[436] then colorBatch[#colorBatch+1] = {Part = P[436], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[437] then colorBatch[#colorBatch+1] = {Part = P[437], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[438] then colorBatch[#colorBatch+1] = {Part = P[438], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[439] then colorBatch[#colorBatch+1] = {Part = P[439], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[440] then colorBatch[#colorBatch+1] = {Part = P[440], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[441] then colorBatch[#colorBatch+1] = {Part = P[441], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[442] then colorBatch[#colorBatch+1] = {Part = P[442], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[443] then colorBatch[#colorBatch+1] = {Part = P[443], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[444] then colorBatch[#colorBatch+1] = {Part = P[444], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[445] then colorBatch[#colorBatch+1] = {Part = P[445], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[446] then colorBatch[#colorBatch+1] = {Part = P[446], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[447] then colorBatch[#colorBatch+1] = {Part = P[447], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[448] then colorBatch[#colorBatch+1] = {Part = P[448], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[449] then colorBatch[#colorBatch+1] = {Part = P[449], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[450] then colorBatch[#colorBatch+1] = {Part = P[450], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[451] then colorBatch[#colorBatch+1] = {Part = P[451], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[452] then colorBatch[#colorBatch+1] = {Part = P[452], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[453] then colorBatch[#colorBatch+1] = {Part = P[453], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[454] then colorBatch[#colorBatch+1] = {Part = P[454], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[455] then colorBatch[#colorBatch+1] = {Part = P[455], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[456] then colorBatch[#colorBatch+1] = {Part = P[456], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[457] then colorBatch[#colorBatch+1] = {Part = P[457], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[458] then colorBatch[#colorBatch+1] = {Part = P[458], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[459] then colorBatch[#colorBatch+1] = {Part = P[459], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[460] then colorBatch[#colorBatch+1] = {Part = P[460], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[461] then colorBatch[#colorBatch+1] = {Part = P[461], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[462] then colorBatch[#colorBatch+1] = {Part = P[462], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[463] then colorBatch[#colorBatch+1] = {Part = P[463], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[464] then colorBatch[#colorBatch+1] = {Part = P[464], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[465] then colorBatch[#colorBatch+1] = {Part = P[465], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[466] then colorBatch[#colorBatch+1] = {Part = P[466], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[467] then colorBatch[#colorBatch+1] = {Part = P[467], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[468] then colorBatch[#colorBatch+1] = {Part = P[468], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[469] then colorBatch[#colorBatch+1] = {Part = P[469], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[470] then colorBatch[#colorBatch+1] = {Part = P[470], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[471] then colorBatch[#colorBatch+1] = {Part = P[471], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[472] then colorBatch[#colorBatch+1] = {Part = P[472], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[473] then colorBatch[#colorBatch+1] = {Part = P[473], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[474] then colorBatch[#colorBatch+1] = {Part = P[474], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[475] then colorBatch[#colorBatch+1] = {Part = P[475], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[476] then colorBatch[#colorBatch+1] = {Part = P[476], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[477] then colorBatch[#colorBatch+1] = {Part = P[477], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[478] then colorBatch[#colorBatch+1] = {Part = P[478], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[479] then colorBatch[#colorBatch+1] = {Part = P[479], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[480] then colorBatch[#colorBatch+1] = {Part = P[480], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[481] then colorBatch[#colorBatch+1] = {Part = P[481], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[482] then colorBatch[#colorBatch+1] = {Part = P[482], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[483] then colorBatch[#colorBatch+1] = {Part = P[483], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[484] then colorBatch[#colorBatch+1] = {Part = P[484], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[485] then colorBatch[#colorBatch+1] = {Part = P[485], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[486] then colorBatch[#colorBatch+1] = {Part = P[486], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[487] then colorBatch[#colorBatch+1] = {Part = P[487], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[488] then colorBatch[#colorBatch+1] = {Part = P[488], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[489] then colorBatch[#colorBatch+1] = {Part = P[489], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[490] then colorBatch[#colorBatch+1] = {Part = P[490], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[493] then colorBatch[#colorBatch+1] = {Part = P[493], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[494] then colorBatch[#colorBatch+1] = {Part = P[494], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[495] then colorBatch[#colorBatch+1] = {Part = P[495], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[496] then colorBatch[#colorBatch+1] = {Part = P[496], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[497] then colorBatch[#colorBatch+1] = {Part = P[497], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[498] then colorBatch[#colorBatch+1] = {Part = P[498], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[499] then colorBatch[#colorBatch+1] = {Part = P[499], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[500] then colorBatch[#colorBatch+1] = {Part = P[500], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[501] then colorBatch[#colorBatch+1] = {Part = P[501], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[502] then colorBatch[#colorBatch+1] = {Part = P[502], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[503] then colorBatch[#colorBatch+1] = {Part = P[503], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[504] then colorBatch[#colorBatch+1] = {Part = P[504], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[505] then colorBatch[#colorBatch+1] = {Part = P[505], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[506] then colorBatch[#colorBatch+1] = {Part = P[506], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[507] then colorBatch[#colorBatch+1] = {Part = P[507], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[508] then colorBatch[#colorBatch+1] = {Part = P[508], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[509] then colorBatch[#colorBatch+1] = {Part = P[509], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[510] then colorBatch[#colorBatch+1] = {Part = P[510], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[511] then colorBatch[#colorBatch+1] = {Part = P[511], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[512] then colorBatch[#colorBatch+1] = {Part = P[512], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[513] then colorBatch[#colorBatch+1] = {Part = P[513], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[514] then colorBatch[#colorBatch+1] = {Part = P[514], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[515] then colorBatch[#colorBatch+1] = {Part = P[515], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[516] then colorBatch[#colorBatch+1] = {Part = P[516], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[517] then colorBatch[#colorBatch+1] = {Part = P[517], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[518] then colorBatch[#colorBatch+1] = {Part = P[518], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[519] then colorBatch[#colorBatch+1] = {Part = P[519], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[520] then colorBatch[#colorBatch+1] = {Part = P[520], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[521] then colorBatch[#colorBatch+1] = {Part = P[521], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[522] then colorBatch[#colorBatch+1] = {Part = P[522], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[523] then colorBatch[#colorBatch+1] = {Part = P[523], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[524] then colorBatch[#colorBatch+1] = {Part = P[524], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[525] then colorBatch[#colorBatch+1] = {Part = P[525], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[526] then colorBatch[#colorBatch+1] = {Part = P[526], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[527] then colorBatch[#colorBatch+1] = {Part = P[527], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[528] then colorBatch[#colorBatch+1] = {Part = P[528], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[529] then colorBatch[#colorBatch+1] = {Part = P[529], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[530] then colorBatch[#colorBatch+1] = {Part = P[530], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[531] then colorBatch[#colorBatch+1] = {Part = P[531], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[532] then colorBatch[#colorBatch+1] = {Part = P[532], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[533] then colorBatch[#colorBatch+1] = {Part = P[533], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[534] then colorBatch[#colorBatch+1] = {Part = P[534], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[535] then colorBatch[#colorBatch+1] = {Part = P[535], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[536] then colorBatch[#colorBatch+1] = {Part = P[536], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[537] then colorBatch[#colorBatch+1] = {Part = P[537], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[538] then colorBatch[#colorBatch+1] = {Part = P[538], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[539] then colorBatch[#colorBatch+1] = {Part = P[539], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[540] then colorBatch[#colorBatch+1] = {Part = P[540], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[541] then colorBatch[#colorBatch+1] = {Part = P[541], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[543] then colorBatch[#colorBatch+1] = {Part = P[543], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[544] then colorBatch[#colorBatch+1] = {Part = P[544], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[545] then colorBatch[#colorBatch+1] = {Part = P[545], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[546] then colorBatch[#colorBatch+1] = {Part = P[546], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[547] then colorBatch[#colorBatch+1] = {Part = P[547], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[548] then colorBatch[#colorBatch+1] = {Part = P[548], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[549] then colorBatch[#colorBatch+1] = {Part = P[549], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[550] then colorBatch[#colorBatch+1] = {Part = P[550], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[551] then colorBatch[#colorBatch+1] = {Part = P[551], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[552] then colorBatch[#colorBatch+1] = {Part = P[552], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[553] then colorBatch[#colorBatch+1] = {Part = P[553], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[554] then colorBatch[#colorBatch+1] = {Part = P[554], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[555] then colorBatch[#colorBatch+1] = {Part = P[555], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[556] then colorBatch[#colorBatch+1] = {Part = P[556], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[557] then colorBatch[#colorBatch+1] = {Part = P[557], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[558] then colorBatch[#colorBatch+1] = {Part = P[558], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[559] then colorBatch[#colorBatch+1] = {Part = P[559], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[560] then colorBatch[#colorBatch+1] = {Part = P[560], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[561] then colorBatch[#colorBatch+1] = {Part = P[561], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[562] then colorBatch[#colorBatch+1] = {Part = P[562], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[563] then colorBatch[#colorBatch+1] = {Part = P[563], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[564] then colorBatch[#colorBatch+1] = {Part = P[564], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[565] then colorBatch[#colorBatch+1] = {Part = P[565], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[566] then colorBatch[#colorBatch+1] = {Part = P[566], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[567] then colorBatch[#colorBatch+1] = {Part = P[567], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[568] then colorBatch[#colorBatch+1] = {Part = P[568], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[569] then colorBatch[#colorBatch+1] = {Part = P[569], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[570] then colorBatch[#colorBatch+1] = {Part = P[570], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[571] then colorBatch[#colorBatch+1] = {Part = P[571], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[572] then colorBatch[#colorBatch+1] = {Part = P[572], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[573] then colorBatch[#colorBatch+1] = {Part = P[573], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[574] then colorBatch[#colorBatch+1] = {Part = P[574], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[575] then colorBatch[#colorBatch+1] = {Part = P[575], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[576] then colorBatch[#colorBatch+1] = {Part = P[576], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[577] then colorBatch[#colorBatch+1] = {Part = P[577], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[578] then colorBatch[#colorBatch+1] = {Part = P[578], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[579] then colorBatch[#colorBatch+1] = {Part = P[579], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[580] then colorBatch[#colorBatch+1] = {Part = P[580], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[581] then colorBatch[#colorBatch+1] = {Part = P[581], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[582] then colorBatch[#colorBatch+1] = {Part = P[582], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[583] then colorBatch[#colorBatch+1] = {Part = P[583], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[584] then colorBatch[#colorBatch+1] = {Part = P[584], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[585] then colorBatch[#colorBatch+1] = {Part = P[585], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[586] then colorBatch[#colorBatch+1] = {Part = P[586], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[587] then colorBatch[#colorBatch+1] = {Part = P[587], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[588] then colorBatch[#colorBatch+1] = {Part = P[588], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[589] then colorBatch[#colorBatch+1] = {Part = P[589], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[590] then colorBatch[#colorBatch+1] = {Part = P[590], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[591] then colorBatch[#colorBatch+1] = {Part = P[591], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[592] then colorBatch[#colorBatch+1] = {Part = P[592], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[593] then colorBatch[#colorBatch+1] = {Part = P[593], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[594] then colorBatch[#colorBatch+1] = {Part = P[594], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[595] then colorBatch[#colorBatch+1] = {Part = P[595], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[596] then colorBatch[#colorBatch+1] = {Part = P[596], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[597] then colorBatch[#colorBatch+1] = {Part = P[597], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[598] then colorBatch[#colorBatch+1] = {Part = P[598], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[599] then colorBatch[#colorBatch+1] = {Part = P[599], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[600] then colorBatch[#colorBatch+1] = {Part = P[600], Color = Color3.new(0.38823530077934265,0.37254902720451355,0.3843137323856354), UnionColoring = false} end
if P[601] then colorBatch[#colorBatch+1] = {Part = P[601], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[602] then colorBatch[#colorBatch+1] = {Part = P[602], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[603] then colorBatch[#colorBatch+1] = {Part = P[603], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[604] then colorBatch[#colorBatch+1] = {Part = P[604], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[605] then colorBatch[#colorBatch+1] = {Part = P[605], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[606] then colorBatch[#colorBatch+1] = {Part = P[606], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[607] then colorBatch[#colorBatch+1] = {Part = P[607], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[608] then colorBatch[#colorBatch+1] = {Part = P[608], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[609] then colorBatch[#colorBatch+1] = {Part = P[609], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[610] then colorBatch[#colorBatch+1] = {Part = P[610], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[611] then colorBatch[#colorBatch+1] = {Part = P[611], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[612] then colorBatch[#colorBatch+1] = {Part = P[612], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[613] then colorBatch[#colorBatch+1] = {Part = P[613], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[614] then colorBatch[#colorBatch+1] = {Part = P[614], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[615] then colorBatch[#colorBatch+1] = {Part = P[615], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[616] then colorBatch[#colorBatch+1] = {Part = P[616], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[617] then colorBatch[#colorBatch+1] = {Part = P[617], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[618] then colorBatch[#colorBatch+1] = {Part = P[618], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[619] then colorBatch[#colorBatch+1] = {Part = P[619], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[620] then colorBatch[#colorBatch+1] = {Part = P[620], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[621] then colorBatch[#colorBatch+1] = {Part = P[621], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[622] then colorBatch[#colorBatch+1] = {Part = P[622], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[623] then colorBatch[#colorBatch+1] = {Part = P[623], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[624] then colorBatch[#colorBatch+1] = {Part = P[624], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[625] then colorBatch[#colorBatch+1] = {Part = P[625], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[626] then colorBatch[#colorBatch+1] = {Part = P[626], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[627] then colorBatch[#colorBatch+1] = {Part = P[627], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[628] then colorBatch[#colorBatch+1] = {Part = P[628], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[629] then colorBatch[#colorBatch+1] = {Part = P[629], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[630] then colorBatch[#colorBatch+1] = {Part = P[630], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[633] then colorBatch[#colorBatch+1] = {Part = P[633], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[634] then colorBatch[#colorBatch+1] = {Part = P[634], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[635] then colorBatch[#colorBatch+1] = {Part = P[635], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[636] then colorBatch[#colorBatch+1] = {Part = P[636], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[637] then colorBatch[#colorBatch+1] = {Part = P[637], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[638] then colorBatch[#colorBatch+1] = {Part = P[638], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[639] then colorBatch[#colorBatch+1] = {Part = P[639], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[640] then colorBatch[#colorBatch+1] = {Part = P[640], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[641] then colorBatch[#colorBatch+1] = {Part = P[641], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[642] then colorBatch[#colorBatch+1] = {Part = P[642], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[643] then colorBatch[#colorBatch+1] = {Part = P[643], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[644] then colorBatch[#colorBatch+1] = {Part = P[644], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[645] then colorBatch[#colorBatch+1] = {Part = P[645], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[646] then colorBatch[#colorBatch+1] = {Part = P[646], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[648] then colorBatch[#colorBatch+1] = {Part = P[648], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[649] then colorBatch[#colorBatch+1] = {Part = P[649], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[650] then colorBatch[#colorBatch+1] = {Part = P[650], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[651] then colorBatch[#colorBatch+1] = {Part = P[651], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[652] then colorBatch[#colorBatch+1] = {Part = P[652], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[653] then colorBatch[#colorBatch+1] = {Part = P[653], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[654] then colorBatch[#colorBatch+1] = {Part = P[654], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[655] then colorBatch[#colorBatch+1] = {Part = P[655], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[656] then colorBatch[#colorBatch+1] = {Part = P[656], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[657] then colorBatch[#colorBatch+1] = {Part = P[657], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[658] then colorBatch[#colorBatch+1] = {Part = P[658], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[659] then colorBatch[#colorBatch+1] = {Part = P[659], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[660] then colorBatch[#colorBatch+1] = {Part = P[660], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[661] then colorBatch[#colorBatch+1] = {Part = P[661], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[662] then colorBatch[#colorBatch+1] = {Part = P[662], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[663] then colorBatch[#colorBatch+1] = {Part = P[663], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[664] then colorBatch[#colorBatch+1] = {Part = P[664], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[665] then colorBatch[#colorBatch+1] = {Part = P[665], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[666] then colorBatch[#colorBatch+1] = {Part = P[666], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[667] then colorBatch[#colorBatch+1] = {Part = P[667], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[668] then colorBatch[#colorBatch+1] = {Part = P[668], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[669] then colorBatch[#colorBatch+1] = {Part = P[669], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[670] then colorBatch[#colorBatch+1] = {Part = P[670], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[671] then colorBatch[#colorBatch+1] = {Part = P[671], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[672] then colorBatch[#colorBatch+1] = {Part = P[672], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[673] then colorBatch[#colorBatch+1] = {Part = P[673], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[674] then colorBatch[#colorBatch+1] = {Part = P[674], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[675] then colorBatch[#colorBatch+1] = {Part = P[675], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[676] then colorBatch[#colorBatch+1] = {Part = P[676], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[677] then colorBatch[#colorBatch+1] = {Part = P[677], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[678] then colorBatch[#colorBatch+1] = {Part = P[678], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[679] then colorBatch[#colorBatch+1] = {Part = P[679], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[680] then colorBatch[#colorBatch+1] = {Part = P[680], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[681] then colorBatch[#colorBatch+1] = {Part = P[681], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[682] then colorBatch[#colorBatch+1] = {Part = P[682], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[683] then colorBatch[#colorBatch+1] = {Part = P[683], Color = Color3.new(0.843137264251709,0.772549033164978,0.6039215922355652), UnionColoring = false} end
if P[684] then colorBatch[#colorBatch+1] = {Part = P[684], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[687] then colorBatch[#colorBatch+1] = {Part = P[687], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[694] then colorBatch[#colorBatch+1] = {Part = P[694], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[699] then colorBatch[#colorBatch+1] = {Part = P[699], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[702] then colorBatch[#colorBatch+1] = {Part = P[702], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[704] then colorBatch[#colorBatch+1] = {Part = P[704], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[712] then colorBatch[#colorBatch+1] = {Part = P[712], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[717] then colorBatch[#colorBatch+1] = {Part = P[717], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[720] then colorBatch[#colorBatch+1] = {Part = P[720], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[726] then colorBatch[#colorBatch+1] = {Part = P[726], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[733] then colorBatch[#colorBatch+1] = {Part = P[733], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[737] then colorBatch[#colorBatch+1] = {Part = P[737], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[739] then colorBatch[#colorBatch+1] = {Part = P[739], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[741] then colorBatch[#colorBatch+1] = {Part = P[741], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[744] then colorBatch[#colorBatch+1] = {Part = P[744], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[747] then colorBatch[#colorBatch+1] = {Part = P[747], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[749] then colorBatch[#colorBatch+1] = {Part = P[749], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[751] then colorBatch[#colorBatch+1] = {Part = P[751], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[755] then colorBatch[#colorBatch+1] = {Part = P[755], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[758] then colorBatch[#colorBatch+1] = {Part = P[758], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[761] then colorBatch[#colorBatch+1] = {Part = P[761], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[762] then colorBatch[#colorBatch+1] = {Part = P[762], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[766] then colorBatch[#colorBatch+1] = {Part = P[766], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[771] then colorBatch[#colorBatch+1] = {Part = P[771], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[775] then colorBatch[#colorBatch+1] = {Part = P[775], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[776] then colorBatch[#colorBatch+1] = {Part = P[776], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[777] then colorBatch[#colorBatch+1] = {Part = P[777], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[780] then colorBatch[#colorBatch+1] = {Part = P[780], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[783] then colorBatch[#colorBatch+1] = {Part = P[783], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[792] then colorBatch[#colorBatch+1] = {Part = P[792], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[795] then colorBatch[#colorBatch+1] = {Part = P[795], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[796] then colorBatch[#colorBatch+1] = {Part = P[796], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[801] then colorBatch[#colorBatch+1] = {Part = P[801], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[803] then colorBatch[#colorBatch+1] = {Part = P[803], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[808] then colorBatch[#colorBatch+1] = {Part = P[808], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[811] then colorBatch[#colorBatch+1] = {Part = P[811], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[813] then colorBatch[#colorBatch+1] = {Part = P[813], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[814] then colorBatch[#colorBatch+1] = {Part = P[814], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[815] then colorBatch[#colorBatch+1] = {Part = P[815], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[818] then colorBatch[#colorBatch+1] = {Part = P[818], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[821] then colorBatch[#colorBatch+1] = {Part = P[821], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[823] then colorBatch[#colorBatch+1] = {Part = P[823], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[824] then colorBatch[#colorBatch+1] = {Part = P[824], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[825] then colorBatch[#colorBatch+1] = {Part = P[825], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[826] then colorBatch[#colorBatch+1] = {Part = P[826], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[828] then colorBatch[#colorBatch+1] = {Part = P[828], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[833] then colorBatch[#colorBatch+1] = {Part = P[833], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[836] then colorBatch[#colorBatch+1] = {Part = P[836], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[837] then colorBatch[#colorBatch+1] = {Part = P[837], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[841] then colorBatch[#colorBatch+1] = {Part = P[841], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[843] then colorBatch[#colorBatch+1] = {Part = P[843], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[845] then colorBatch[#colorBatch+1] = {Part = P[845], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[847] then colorBatch[#colorBatch+1] = {Part = P[847], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[850] then colorBatch[#colorBatch+1] = {Part = P[850], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[852] then colorBatch[#colorBatch+1] = {Part = P[852], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[854] then colorBatch[#colorBatch+1] = {Part = P[854], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[857] then colorBatch[#colorBatch+1] = {Part = P[857], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[860] then colorBatch[#colorBatch+1] = {Part = P[860], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[863] then colorBatch[#colorBatch+1] = {Part = P[863], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[864] then colorBatch[#colorBatch+1] = {Part = P[864], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[868] then colorBatch[#colorBatch+1] = {Part = P[868], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[871] then colorBatch[#colorBatch+1] = {Part = P[871], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[874] then colorBatch[#colorBatch+1] = {Part = P[874], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[878] then colorBatch[#colorBatch+1] = {Part = P[878], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[879] then colorBatch[#colorBatch+1] = {Part = P[879], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[881] then colorBatch[#colorBatch+1] = {Part = P[881], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[884] then colorBatch[#colorBatch+1] = {Part = P[884], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[886] then colorBatch[#colorBatch+1] = {Part = P[886], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[888] then colorBatch[#colorBatch+1] = {Part = P[888], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[891] then colorBatch[#colorBatch+1] = {Part = P[891], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[894] then colorBatch[#colorBatch+1] = {Part = P[894], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[895] then colorBatch[#colorBatch+1] = {Part = P[895], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[897] then colorBatch[#colorBatch+1] = {Part = P[897], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[900] then colorBatch[#colorBatch+1] = {Part = P[900], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[904] then colorBatch[#colorBatch+1] = {Part = P[904], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[908] then colorBatch[#colorBatch+1] = {Part = P[908], Color = Color3.new(0.501960813999176,0.7333333492279053,0.8588235378265381), UnionColoring = false} end
if P[910] then colorBatch[#colorBatch+1] = {Part = P[910], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[912] then colorBatch[#colorBatch+1] = {Part = P[912], Color = Color3.new(0.6431372761726379,0.7411764860153198,0.27843138575553894), UnionColoring = false} end
if P[915] then colorBatch[#colorBatch+1] = {Part = P[915], Color = Color3.new(0,0.5607843399047852,0.6117647290229797), UnionColoring = false} end
if P[918] then colorBatch[#colorBatch+1] = {Part = P[918], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[922] then colorBatch[#colorBatch+1] = {Part = P[922], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[925] then colorBatch[#colorBatch+1] = {Part = P[925], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[929] then colorBatch[#colorBatch+1] = {Part = P[929], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[930] then colorBatch[#colorBatch+1] = {Part = P[930], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[934] then colorBatch[#colorBatch+1] = {Part = P[934], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[938] then colorBatch[#colorBatch+1] = {Part = P[938], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[940] then colorBatch[#colorBatch+1] = {Part = P[940], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[942] then colorBatch[#colorBatch+1] = {Part = P[942], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[943] then colorBatch[#colorBatch+1] = {Part = P[943], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[945] then colorBatch[#colorBatch+1] = {Part = P[945], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[946] then colorBatch[#colorBatch+1] = {Part = P[946], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[947] then colorBatch[#colorBatch+1] = {Part = P[947], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[949] then colorBatch[#colorBatch+1] = {Part = P[949], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[950] then colorBatch[#colorBatch+1] = {Part = P[950], Color = Color3.new(0.9490196108818054,0.9529411792755127,0.9529411792755127), UnionColoring = false} end
if P[951] then colorBatch[#colorBatch+1] = {Part = P[951], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[954] then colorBatch[#colorBatch+1] = {Part = P[954], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[959] then colorBatch[#colorBatch+1] = {Part = P[959], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[961] then colorBatch[#colorBatch+1] = {Part = P[961], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[963] then colorBatch[#colorBatch+1] = {Part = P[963], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[964] then colorBatch[#colorBatch+1] = {Part = P[964], Color = Color3.new(0.29411765933036804,0.5921568870544434,0.29411765933036804), UnionColoring = false} end
if P[965] then colorBatch[#colorBatch+1] = {Part = P[965], Color = Color3.new(0.7058823704719543,0.8235294222831726,0.8941176533699036), UnionColoring = false} end
if P[968] then colorBatch[#colorBatch+1] = {Part = P[968], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[971] then colorBatch[#colorBatch+1] = {Part = P[971], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[980] then colorBatch[#colorBatch+1] = {Part = P[980], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[983] then colorBatch[#colorBatch+1] = {Part = P[983], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[985] then colorBatch[#colorBatch+1] = {Part = P[985], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[989] then colorBatch[#colorBatch+1] = {Part = P[989], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[991] then colorBatch[#colorBatch+1] = {Part = P[991], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[994] then colorBatch[#colorBatch+1] = {Part = P[994], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[995] then colorBatch[#colorBatch+1] = {Part = P[995], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[996] then colorBatch[#colorBatch+1] = {Part = P[996], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[997] then colorBatch[#colorBatch+1] = {Part = P[997], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[999] then colorBatch[#colorBatch+1] = {Part = P[999], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1004] then colorBatch[#colorBatch+1] = {Part = P[1004], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[1005] then colorBatch[#colorBatch+1] = {Part = P[1005], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[1015] then colorBatch[#colorBatch+1] = {Part = P[1015], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1018] then colorBatch[#colorBatch+1] = {Part = P[1018], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[1021] then colorBatch[#colorBatch+1] = {Part = P[1021], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[1023] then colorBatch[#colorBatch+1] = {Part = P[1023], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1406] then colorBatch[#colorBatch+1] = {Part = P[1406], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1118] then colorBatch[#colorBatch+1] = {Part = P[1118], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1615] then colorBatch[#colorBatch+1] = {Part = P[1615], Color = Color3.new(0.5921568870544434,0,0), UnionColoring = false} end
if P[1442] then colorBatch[#colorBatch+1] = {Part = P[1442], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1388] then colorBatch[#colorBatch+1] = {Part = P[1388], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1334] then colorBatch[#colorBatch+1] = {Part = P[1334], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1052] then colorBatch[#colorBatch+1] = {Part = P[1052], Color = Color3.new(0.9921568632125854,0.9176470637321472,0.5529412031173706), UnionColoring = false} end
if P[1420] then colorBatch[#colorBatch+1] = {Part = P[1420], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[1196] then colorBatch[#colorBatch+1] = {Part = P[1196], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1202] then colorBatch[#colorBatch+1] = {Part = P[1202], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1061] then colorBatch[#colorBatch+1] = {Part = P[1061], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1407] then colorBatch[#colorBatch+1] = {Part = P[1407], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1541] then colorBatch[#colorBatch+1] = {Part = P[1541], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1188] then colorBatch[#colorBatch+1] = {Part = P[1188], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1381] then colorBatch[#colorBatch+1] = {Part = P[1381], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1271] then colorBatch[#colorBatch+1] = {Part = P[1271], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1378] then colorBatch[#colorBatch+1] = {Part = P[1378], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1053] then colorBatch[#colorBatch+1] = {Part = P[1053], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[1097] then colorBatch[#colorBatch+1] = {Part = P[1097], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1351] then colorBatch[#colorBatch+1] = {Part = P[1351], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[1166] then colorBatch[#colorBatch+1] = {Part = P[1166], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1194] then colorBatch[#colorBatch+1] = {Part = P[1194], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1571] then colorBatch[#colorBatch+1] = {Part = P[1571], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1045] then colorBatch[#colorBatch+1] = {Part = P[1045], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[1448] then colorBatch[#colorBatch+1] = {Part = P[1448], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1224] then colorBatch[#colorBatch+1] = {Part = P[1224], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1290] then colorBatch[#colorBatch+1] = {Part = P[1290], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1426] then colorBatch[#colorBatch+1] = {Part = P[1426], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1613] then colorBatch[#colorBatch+1] = {Part = P[1613], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1369] then colorBatch[#colorBatch+1] = {Part = P[1369], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1408] then colorBatch[#colorBatch+1] = {Part = P[1408], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1127] then colorBatch[#colorBatch+1] = {Part = P[1127], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1389] then colorBatch[#colorBatch+1] = {Part = P[1389], Color = Color3.new(0.35686275362968445,0.364705890417099,0.4117647111415863), UnionColoring = false} end
if P[1033] then colorBatch[#colorBatch+1] = {Part = P[1033], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[1169] then colorBatch[#colorBatch+1] = {Part = P[1169], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1624] then colorBatch[#colorBatch+1] = {Part = P[1624], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1145] then colorBatch[#colorBatch+1] = {Part = P[1145], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1413] then colorBatch[#colorBatch+1] = {Part = P[1413], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1275] then colorBatch[#colorBatch+1] = {Part = P[1275], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1239] then colorBatch[#colorBatch+1] = {Part = P[1239], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1339] then colorBatch[#colorBatch+1] = {Part = P[1339], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1044] then colorBatch[#colorBatch+1] = {Part = P[1044], Color = Color3.new(0.9607843160629272,0.8039215803146362,0.1882352977991104), UnionColoring = false} end
if P[1627] then colorBatch[#colorBatch+1] = {Part = P[1627], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1581] then colorBatch[#colorBatch+1] = {Part = P[1581], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1633] then colorBatch[#colorBatch+1] = {Part = P[1633], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1404] then colorBatch[#colorBatch+1] = {Part = P[1404], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1479] then colorBatch[#colorBatch+1] = {Part = P[1479], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1113] then colorBatch[#colorBatch+1] = {Part = P[1113], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1232] then colorBatch[#colorBatch+1] = {Part = P[1232], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1089] then colorBatch[#colorBatch+1] = {Part = P[1089], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1103] then colorBatch[#colorBatch+1] = {Part = P[1103], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1595] then colorBatch[#colorBatch+1] = {Part = P[1595], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1392] then colorBatch[#colorBatch+1] = {Part = P[1392], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1223] then colorBatch[#colorBatch+1] = {Part = P[1223], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1250] then colorBatch[#colorBatch+1] = {Part = P[1250], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1618] then colorBatch[#colorBatch+1] = {Part = P[1618], Color = Color3.new(0.5921568870544434,0,0), UnionColoring = false} end
if P[1477] then colorBatch[#colorBatch+1] = {Part = P[1477], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1209] then colorBatch[#colorBatch+1] = {Part = P[1209], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1056] then colorBatch[#colorBatch+1] = {Part = P[1056], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1549] then colorBatch[#colorBatch+1] = {Part = P[1549], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1514] then colorBatch[#colorBatch+1] = {Part = P[1514], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1480] then colorBatch[#colorBatch+1] = {Part = P[1480], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1036] then colorBatch[#colorBatch+1] = {Part = P[1036], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[1295] then colorBatch[#colorBatch+1] = {Part = P[1295], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1428] then colorBatch[#colorBatch+1] = {Part = P[1428], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1076] then colorBatch[#colorBatch+1] = {Part = P[1076], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1410] then colorBatch[#colorBatch+1] = {Part = P[1410], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1280] then colorBatch[#colorBatch+1] = {Part = P[1280], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1107] then colorBatch[#colorBatch+1] = {Part = P[1107], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1059] then colorBatch[#colorBatch+1] = {Part = P[1059], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1139] then colorBatch[#colorBatch+1] = {Part = P[1139], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1591] then colorBatch[#colorBatch+1] = {Part = P[1591], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1178] then colorBatch[#colorBatch+1] = {Part = P[1178], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1327] then colorBatch[#colorBatch+1] = {Part = P[1327], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[1190] then colorBatch[#colorBatch+1] = {Part = P[1190], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1636] then colorBatch[#colorBatch+1] = {Part = P[1636], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1472] then colorBatch[#colorBatch+1] = {Part = P[1472], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1368] then colorBatch[#colorBatch+1] = {Part = P[1368], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1289] then colorBatch[#colorBatch+1] = {Part = P[1289], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1158] then colorBatch[#colorBatch+1] = {Part = P[1158], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1536] then colorBatch[#colorBatch+1] = {Part = P[1536], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1566] then colorBatch[#colorBatch+1] = {Part = P[1566], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1206] then colorBatch[#colorBatch+1] = {Part = P[1206], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1593] then colorBatch[#colorBatch+1] = {Part = P[1593], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1600] then colorBatch[#colorBatch+1] = {Part = P[1600], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1487] then colorBatch[#colorBatch+1] = {Part = P[1487], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1538] then colorBatch[#colorBatch+1] = {Part = P[1538], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1283] then colorBatch[#colorBatch+1] = {Part = P[1283], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1469] then colorBatch[#colorBatch+1] = {Part = P[1469], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1359] then colorBatch[#colorBatch+1] = {Part = P[1359], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1445] then colorBatch[#colorBatch+1] = {Part = P[1445], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1182] then colorBatch[#colorBatch+1] = {Part = P[1182], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1425] then colorBatch[#colorBatch+1] = {Part = P[1425], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1163] then colorBatch[#colorBatch+1] = {Part = P[1163], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1612] then colorBatch[#colorBatch+1] = {Part = P[1612], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1248] then colorBatch[#colorBatch+1] = {Part = P[1248], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1575] then colorBatch[#colorBatch+1] = {Part = P[1575], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1205] then colorBatch[#colorBatch+1] = {Part = P[1205], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1181] then colorBatch[#colorBatch+1] = {Part = P[1181], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1511] then colorBatch[#colorBatch+1] = {Part = P[1511], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1092] then colorBatch[#colorBatch+1] = {Part = P[1092], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1185] then colorBatch[#colorBatch+1] = {Part = P[1185], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1320] then colorBatch[#colorBatch+1] = {Part = P[1320], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1233] then colorBatch[#colorBatch+1] = {Part = P[1233], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1104] then colorBatch[#colorBatch+1] = {Part = P[1104], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1602] then colorBatch[#colorBatch+1] = {Part = P[1602], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1414] then colorBatch[#colorBatch+1] = {Part = P[1414], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1520] then colorBatch[#colorBatch+1] = {Part = P[1520], Color = Color3.new(0.05098039284348488,0.4117647111415863,0.6745098233222961), UnionColoring = false} end
if P[1569] then colorBatch[#colorBatch+1] = {Part = P[1569], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1137] then colorBatch[#colorBatch+1] = {Part = P[1137], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1314] then colorBatch[#colorBatch+1] = {Part = P[1314], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1286] then colorBatch[#colorBatch+1] = {Part = P[1286], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1152] then colorBatch[#colorBatch+1] = {Part = P[1152], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1245] then colorBatch[#colorBatch+1] = {Part = P[1245], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1128] then colorBatch[#colorBatch+1] = {Part = P[1128], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1146] then colorBatch[#colorBatch+1] = {Part = P[1146], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1465] then colorBatch[#colorBatch+1] = {Part = P[1465], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1489] then colorBatch[#colorBatch+1] = {Part = P[1489], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1399] then colorBatch[#colorBatch+1] = {Part = P[1399], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1512] then colorBatch[#colorBatch+1] = {Part = P[1512], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1379] then colorBatch[#colorBatch+1] = {Part = P[1379], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1496] then colorBatch[#colorBatch+1] = {Part = P[1496], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1463] then colorBatch[#colorBatch+1] = {Part = P[1463], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1495] then colorBatch[#colorBatch+1] = {Part = P[1495], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1304] then colorBatch[#colorBatch+1] = {Part = P[1304], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1083] then colorBatch[#colorBatch+1] = {Part = P[1083], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1651] then colorBatch[#colorBatch+1] = {Part = P[1651], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1649] then colorBatch[#colorBatch+1] = {Part = P[1649], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1648] then colorBatch[#colorBatch+1] = {Part = P[1648], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1063] then colorBatch[#colorBatch+1] = {Part = P[1063], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1635] then colorBatch[#colorBatch+1] = {Part = P[1635], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1645] then colorBatch[#colorBatch+1] = {Part = P[1645], Color = Color3.new(0.5921568870544434,0,0), UnionColoring = false} end
if P[1643] then colorBatch[#colorBatch+1] = {Part = P[1643], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1364] then colorBatch[#colorBatch+1] = {Part = P[1364], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1641] then colorBatch[#colorBatch+1] = {Part = P[1641], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1640] then colorBatch[#colorBatch+1] = {Part = P[1640], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1558] then colorBatch[#colorBatch+1] = {Part = P[1558], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1638] then colorBatch[#colorBatch+1] = {Part = P[1638], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1446] then colorBatch[#colorBatch+1] = {Part = P[1446], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1494] then colorBatch[#colorBatch+1] = {Part = P[1494], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1647] then colorBatch[#colorBatch+1] = {Part = P[1647], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1631] then colorBatch[#colorBatch+1] = {Part = P[1631], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1236] then colorBatch[#colorBatch+1] = {Part = P[1236], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1048] then colorBatch[#colorBatch+1] = {Part = P[1048], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1515] then colorBatch[#colorBatch+1] = {Part = P[1515], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1242] then colorBatch[#colorBatch+1] = {Part = P[1242], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1504] then colorBatch[#colorBatch+1] = {Part = P[1504], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1346] then colorBatch[#colorBatch+1] = {Part = P[1346], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[1632] then colorBatch[#colorBatch+1] = {Part = P[1632], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1218] then colorBatch[#colorBatch+1] = {Part = P[1218], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1626] then colorBatch[#colorBatch+1] = {Part = P[1626], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1630] then colorBatch[#colorBatch+1] = {Part = P[1630], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1197] then colorBatch[#colorBatch+1] = {Part = P[1197], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1230] then colorBatch[#colorBatch+1] = {Part = P[1230], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1151] then colorBatch[#colorBatch+1] = {Part = P[1151], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1136] then colorBatch[#colorBatch+1] = {Part = P[1136], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1405] then colorBatch[#colorBatch+1] = {Part = P[1405], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1220] then colorBatch[#colorBatch+1] = {Part = P[1220], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1491] then colorBatch[#colorBatch+1] = {Part = P[1491], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1625] then colorBatch[#colorBatch+1] = {Part = P[1625], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1623] then colorBatch[#colorBatch+1] = {Part = P[1623], Color = Color3.new(0.5921568870544434,0,0), UnionColoring = false} end
if P[1622] then colorBatch[#colorBatch+1] = {Part = P[1622], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1121] then colorBatch[#colorBatch+1] = {Part = P[1121], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1621] then colorBatch[#colorBatch+1] = {Part = P[1621], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1411] then colorBatch[#colorBatch+1] = {Part = P[1411], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1583] then colorBatch[#colorBatch+1] = {Part = P[1583], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1553] then colorBatch[#colorBatch+1] = {Part = P[1553], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1617] then colorBatch[#colorBatch+1] = {Part = P[1617], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1619] then colorBatch[#colorBatch+1] = {Part = P[1619], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1278] then colorBatch[#colorBatch+1] = {Part = P[1278], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1614] then colorBatch[#colorBatch+1] = {Part = P[1614], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1254] then colorBatch[#colorBatch+1] = {Part = P[1254], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1259] then colorBatch[#colorBatch+1] = {Part = P[1259], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1449] then colorBatch[#colorBatch+1] = {Part = P[1449], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1458] then colorBatch[#colorBatch+1] = {Part = P[1458], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1453] then colorBatch[#colorBatch+1] = {Part = P[1453], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1106] then colorBatch[#colorBatch+1] = {Part = P[1106], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1323] then colorBatch[#colorBatch+1] = {Part = P[1323], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1082] then colorBatch[#colorBatch+1] = {Part = P[1082], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1429] then colorBatch[#colorBatch+1] = {Part = P[1429], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1452] then colorBatch[#colorBatch+1] = {Part = P[1452], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1505] then colorBatch[#colorBatch+1] = {Part = P[1505], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1611] then colorBatch[#colorBatch+1] = {Part = P[1611], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1172] then colorBatch[#colorBatch+1] = {Part = P[1172], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1608] then colorBatch[#colorBatch+1] = {Part = P[1608], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1606] then colorBatch[#colorBatch+1] = {Part = P[1606], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1244] then colorBatch[#colorBatch+1] = {Part = P[1244], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1409] then colorBatch[#colorBatch+1] = {Part = P[1409], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1478] then colorBatch[#colorBatch+1] = {Part = P[1478], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1545] then colorBatch[#colorBatch+1] = {Part = P[1545], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1599] then colorBatch[#colorBatch+1] = {Part = P[1599], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1597] then colorBatch[#colorBatch+1] = {Part = P[1597], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1365] then colorBatch[#colorBatch+1] = {Part = P[1365], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1043] then colorBatch[#colorBatch+1] = {Part = P[1043], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1241] then colorBatch[#colorBatch+1] = {Part = P[1241], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1227] then colorBatch[#colorBatch+1] = {Part = P[1227], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1589] then colorBatch[#colorBatch+1] = {Part = P[1589], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1360] then colorBatch[#colorBatch+1] = {Part = P[1360], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1308] then colorBatch[#colorBatch+1] = {Part = P[1308], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1217] then colorBatch[#colorBatch+1] = {Part = P[1217], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1372] then colorBatch[#colorBatch+1] = {Part = P[1372], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1193] then colorBatch[#colorBatch+1] = {Part = P[1193], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1578] then colorBatch[#colorBatch+1] = {Part = P[1578], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1444] then colorBatch[#colorBatch+1] = {Part = P[1444], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1585] then colorBatch[#colorBatch+1] = {Part = P[1585], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1403] then colorBatch[#colorBatch+1] = {Part = P[1403], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1451] then colorBatch[#colorBatch+1] = {Part = P[1451], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1094] then colorBatch[#colorBatch+1] = {Part = P[1094], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1573] then colorBatch[#colorBatch+1] = {Part = P[1573], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1098] then colorBatch[#colorBatch+1] = {Part = P[1098], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1564] then colorBatch[#colorBatch+1] = {Part = P[1564], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1208] then colorBatch[#colorBatch+1] = {Part = P[1208], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1355] then colorBatch[#colorBatch+1] = {Part = P[1355], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1562] then colorBatch[#colorBatch+1] = {Part = P[1562], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1560] then colorBatch[#colorBatch+1] = {Part = P[1560], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1509] then colorBatch[#colorBatch+1] = {Part = P[1509], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1557] then colorBatch[#colorBatch+1] = {Part = P[1557], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1432] then colorBatch[#colorBatch+1] = {Part = P[1432], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1555] then colorBatch[#colorBatch+1] = {Part = P[1555], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1616] then colorBatch[#colorBatch+1] = {Part = P[1616], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1551] then colorBatch[#colorBatch+1] = {Part = P[1551], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1256] then colorBatch[#colorBatch+1] = {Part = P[1256], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1447] then colorBatch[#colorBatch+1] = {Part = P[1447], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1402] then colorBatch[#colorBatch+1] = {Part = P[1402], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1604] then colorBatch[#colorBatch+1] = {Part = P[1604], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1229] then colorBatch[#colorBatch+1] = {Part = P[1229], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1125] then colorBatch[#colorBatch+1] = {Part = P[1125], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1303] then colorBatch[#colorBatch+1] = {Part = P[1303], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1534] then colorBatch[#colorBatch+1] = {Part = P[1534], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1533] then colorBatch[#colorBatch+1] = {Part = P[1533], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1497] then colorBatch[#colorBatch+1] = {Part = P[1497], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1475] then colorBatch[#colorBatch+1] = {Part = P[1475], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1031] then colorBatch[#colorBatch+1] = {Part = P[1031], Color = Color3.new(0.4313725531101227,0.6000000238418579,0.7921568751335144), UnionColoring = false} end
if P[1529] then colorBatch[#colorBatch+1] = {Part = P[1529], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1527] then colorBatch[#colorBatch+1] = {Part = P[1527], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1349] then colorBatch[#colorBatch+1] = {Part = P[1349], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[1115] then colorBatch[#colorBatch+1] = {Part = P[1115], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1524] then colorBatch[#colorBatch+1] = {Part = P[1524], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1085] then colorBatch[#colorBatch+1] = {Part = P[1085], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1523] then colorBatch[#colorBatch+1] = {Part = P[1523], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1086] then colorBatch[#colorBatch+1] = {Part = P[1086], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1522] then colorBatch[#colorBatch+1] = {Part = P[1522], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1517] then colorBatch[#colorBatch+1] = {Part = P[1517], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1507] then colorBatch[#colorBatch+1] = {Part = P[1507], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1634] then colorBatch[#colorBatch+1] = {Part = P[1634], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1513] then colorBatch[#colorBatch+1] = {Part = P[1513], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1164] then colorBatch[#colorBatch+1] = {Part = P[1164], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1490] then colorBatch[#colorBatch+1] = {Part = P[1490], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1170] then colorBatch[#colorBatch+1] = {Part = P[1170], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1510] then colorBatch[#colorBatch+1] = {Part = P[1510], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1503] then colorBatch[#colorBatch+1] = {Part = P[1503], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1109] then colorBatch[#colorBatch+1] = {Part = P[1109], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1415] then colorBatch[#colorBatch+1] = {Part = P[1415], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1377] then colorBatch[#colorBatch+1] = {Part = P[1377], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1221] then colorBatch[#colorBatch+1] = {Part = P[1221], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1516] then colorBatch[#colorBatch+1] = {Part = P[1516], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1506] then colorBatch[#colorBatch+1] = {Part = P[1506], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1502] then colorBatch[#colorBatch+1] = {Part = P[1502], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1386] then colorBatch[#colorBatch+1] = {Part = P[1386], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1390] then colorBatch[#colorBatch+1] = {Part = P[1390], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1501] then colorBatch[#colorBatch+1] = {Part = P[1501], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1154] then colorBatch[#colorBatch+1] = {Part = P[1154], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1500] then colorBatch[#colorBatch+1] = {Part = P[1500], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1130] then colorBatch[#colorBatch+1] = {Part = P[1130], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1354] then colorBatch[#colorBatch+1] = {Part = P[1354], Color = Color3.new(0.9725490212440491,0.9725490212440491,0.9725490212440491), UnionColoring = false} end
if P[1361] then colorBatch[#colorBatch+1] = {Part = P[1361], Color = Color3.new(0.9725490212440491,0.9725490212440491,0.9725490212440491), UnionColoring = false} end
if P[1460] then colorBatch[#colorBatch+1] = {Part = P[1460], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1462] then colorBatch[#colorBatch+1] = {Part = P[1462], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1266] then colorBatch[#colorBatch+1] = {Part = P[1266], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1531] then colorBatch[#colorBatch+1] = {Part = P[1531], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1637] then colorBatch[#colorBatch+1] = {Part = P[1637], Color = Color3.new(0.5921568870544434,0,0), UnionColoring = false} end
if P[1380] then colorBatch[#colorBatch+1] = {Part = P[1380], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1387] then colorBatch[#colorBatch+1] = {Part = P[1387], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1493] then colorBatch[#colorBatch+1] = {Part = P[1493], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1382] then colorBatch[#colorBatch+1] = {Part = P[1382], Color = Color3.new(0.9725490212440491,0.9725490212440491,0.9725490212440491), UnionColoring = false} end
if P[1300] then colorBatch[#colorBatch+1] = {Part = P[1300], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1459] then colorBatch[#colorBatch+1] = {Part = P[1459], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1488] then colorBatch[#colorBatch+1] = {Part = P[1488], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1257] then colorBatch[#colorBatch+1] = {Part = P[1257], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1486] then colorBatch[#colorBatch+1] = {Part = P[1486], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1485] then colorBatch[#colorBatch+1] = {Part = P[1485], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1149] then colorBatch[#colorBatch+1] = {Part = P[1149], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1483] then colorBatch[#colorBatch+1] = {Part = P[1483], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1260] then colorBatch[#colorBatch+1] = {Part = P[1260], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1455] then colorBatch[#colorBatch+1] = {Part = P[1455], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1481] then colorBatch[#colorBatch+1] = {Part = P[1481], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1143] then colorBatch[#colorBatch+1] = {Part = P[1143], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1476] then colorBatch[#colorBatch+1] = {Part = P[1476], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1344] then colorBatch[#colorBatch+1] = {Part = P[1344], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1110] then colorBatch[#colorBatch+1] = {Part = P[1110], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1091] then colorBatch[#colorBatch+1] = {Part = P[1091], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1471] then colorBatch[#colorBatch+1] = {Part = P[1471], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1470] then colorBatch[#colorBatch+1] = {Part = P[1470], Color = Color3.new(0.7686274647712708,0.1568627506494522,0.10980392247438431), UnionColoring = false} end
if P[1468] then colorBatch[#colorBatch+1] = {Part = P[1468], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1467] then colorBatch[#colorBatch+1] = {Part = P[1467], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1313] then colorBatch[#colorBatch+1] = {Part = P[1313], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1466] then colorBatch[#colorBatch+1] = {Part = P[1466], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1265] then colorBatch[#colorBatch+1] = {Part = P[1265], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1148] then colorBatch[#colorBatch+1] = {Part = P[1148], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1397] then colorBatch[#colorBatch+1] = {Part = P[1397], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1095] then colorBatch[#colorBatch+1] = {Part = P[1095], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1464] then colorBatch[#colorBatch+1] = {Part = P[1464], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1498] then colorBatch[#colorBatch+1] = {Part = P[1498], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1211] then colorBatch[#colorBatch+1] = {Part = P[1211], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1461] then colorBatch[#colorBatch+1] = {Part = P[1461], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1457] then colorBatch[#colorBatch+1] = {Part = P[1457], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1456] then colorBatch[#colorBatch+1] = {Part = P[1456], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1311] then colorBatch[#colorBatch+1] = {Part = P[1311], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1484] then colorBatch[#colorBatch+1] = {Part = P[1484], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1482] then colorBatch[#colorBatch+1] = {Part = P[1482], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1277] then colorBatch[#colorBatch+1] = {Part = P[1277], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1454] then colorBatch[#colorBatch+1] = {Part = P[1454], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1450] then colorBatch[#colorBatch+1] = {Part = P[1450], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1142] then colorBatch[#colorBatch+1] = {Part = P[1142], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1443] then colorBatch[#colorBatch+1] = {Part = P[1443], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1543] then colorBatch[#colorBatch+1] = {Part = P[1543], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1235] then colorBatch[#colorBatch+1] = {Part = P[1235], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1547] then colorBatch[#colorBatch+1] = {Part = P[1547], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1287] then colorBatch[#colorBatch+1] = {Part = P[1287], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1079] then colorBatch[#colorBatch+1] = {Part = P[1079], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1580] then colorBatch[#colorBatch+1] = {Part = P[1580], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1124] then colorBatch[#colorBatch+1] = {Part = P[1124], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1441] then colorBatch[#colorBatch+1] = {Part = P[1441], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1435] then colorBatch[#colorBatch+1] = {Part = P[1435], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1262] then colorBatch[#colorBatch+1] = {Part = P[1262], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1134] then colorBatch[#colorBatch+1] = {Part = P[1134], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1199] then colorBatch[#colorBatch+1] = {Part = P[1199], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1187] then colorBatch[#colorBatch+1] = {Part = P[1187], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1176] then colorBatch[#colorBatch+1] = {Part = P[1176], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1133] then colorBatch[#colorBatch+1] = {Part = P[1133], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1027] then colorBatch[#colorBatch+1] = {Part = P[1027], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1100] then colorBatch[#colorBatch+1] = {Part = P[1100], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1391] then colorBatch[#colorBatch+1] = {Part = P[1391], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1251] then colorBatch[#colorBatch+1] = {Part = P[1251], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1412] then colorBatch[#colorBatch+1] = {Part = P[1412], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1508] then colorBatch[#colorBatch+1] = {Part = P[1508], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1200] then colorBatch[#colorBatch+1] = {Part = P[1200], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1366] then colorBatch[#colorBatch+1] = {Part = P[1366], Color = Color3.new(0.9725490212440491,0.9725490212440491,0.9725490212440491), UnionColoring = false} end
if P[1424] then colorBatch[#colorBatch+1] = {Part = P[1424], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1263] then colorBatch[#colorBatch+1] = {Part = P[1263], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1253] then colorBatch[#colorBatch+1] = {Part = P[1253], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1474] then colorBatch[#colorBatch+1] = {Part = P[1474], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1272] then colorBatch[#colorBatch+1] = {Part = P[1272], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1175] then colorBatch[#colorBatch+1] = {Part = P[1175], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1116] then colorBatch[#colorBatch+1] = {Part = P[1116], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1576] then colorBatch[#colorBatch+1] = {Part = P[1576], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1101] then colorBatch[#colorBatch+1] = {Part = P[1101], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1398] then colorBatch[#colorBatch+1] = {Part = P[1398], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1214] then colorBatch[#colorBatch+1] = {Part = P[1214], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1157] then colorBatch[#colorBatch+1] = {Part = P[1157], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1587] then colorBatch[#colorBatch+1] = {Part = P[1587], Color = Color3.new(1,0,0), UnionColoring = false} end
if P[1356] then colorBatch[#colorBatch+1] = {Part = P[1356], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1161] then colorBatch[#colorBatch+1] = {Part = P[1161], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1203] then colorBatch[#colorBatch+1] = {Part = P[1203], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1088] then colorBatch[#colorBatch+1] = {Part = P[1088], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1384] then colorBatch[#colorBatch+1] = {Part = P[1384], Color = Color3.new(0.9058823585510254,0.9058823585510254,0.9254902005195618), UnionColoring = false} end
if P[1281] then colorBatch[#colorBatch+1] = {Part = P[1281], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1069] then colorBatch[#colorBatch+1] = {Part = P[1069], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1383] then colorBatch[#colorBatch+1] = {Part = P[1383], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1492] then colorBatch[#colorBatch+1] = {Part = P[1492], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1629] then colorBatch[#colorBatch+1] = {Part = P[1629], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1131] then colorBatch[#colorBatch+1] = {Part = P[1131], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1155] then colorBatch[#colorBatch+1] = {Part = P[1155], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1274] then colorBatch[#colorBatch+1] = {Part = P[1274], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1226] then colorBatch[#colorBatch+1] = {Part = P[1226], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1212] then colorBatch[#colorBatch+1] = {Part = P[1212], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1357] then colorBatch[#colorBatch+1] = {Part = P[1357], Color = Color3.new(0.9058823585510254,0.9058823585510254,0.9254902005195618), UnionColoring = false} end
if P[1385] then colorBatch[#colorBatch+1] = {Part = P[1385], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1363] then colorBatch[#colorBatch+1] = {Part = P[1363], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1362] then colorBatch[#colorBatch+1] = {Part = P[1362], Color = Color3.new(0.7921568751335144,0.7960784435272217,0.8196078538894653), UnionColoring = false} end
if P[1049] then colorBatch[#colorBatch+1] = {Part = P[1049], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1054] then colorBatch[#colorBatch+1] = {Part = P[1054], Color = Color3.new(0.1568627506494522,0.49803921580314636,0.27843138575553894), UnionColoring = false} end
if P[1358] then colorBatch[#colorBatch+1] = {Part = P[1358], Color = Color3.new(0.6274510025978088,0.37254902720451355,0.2078431397676468), UnionColoring = false} end
if P[1119] then colorBatch[#colorBatch+1] = {Part = P[1119], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1173] then colorBatch[#colorBatch+1] = {Part = P[1173], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1499] then colorBatch[#colorBatch+1] = {Part = P[1499], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1284] then colorBatch[#colorBatch+1] = {Part = P[1284], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1418] then colorBatch[#colorBatch+1] = {Part = P[1418], Color = Color3.new(0.6392157077789307,0.6352941393852234,0.6470588445663452), UnionColoring = false} end
if P[1268] then colorBatch[#colorBatch+1] = {Part = P[1268], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1122] then colorBatch[#colorBatch+1] = {Part = P[1122], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1215] then colorBatch[#colorBatch+1] = {Part = P[1215], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1291] then colorBatch[#colorBatch+1] = {Part = P[1291], Color = Color3.new(0.4117647111415863,0.250980406999588,0.1568627506494522), UnionColoring = false} end
if P[1191] then colorBatch[#colorBatch+1] = {Part = P[1191], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1427] then colorBatch[#colorBatch+1] = {Part = P[1427], Color = Color3.new(0.10588235408067703,0.16470588743686676,0.2078431397676468), UnionColoring = false} end
if P[1375] then colorBatch[#colorBatch+1] = {Part = P[1375], Color = Color3.new(0.35686275362968445,0.364705890417099,0.4117647111415863), UnionColoring = false} end
if P[1317] then colorBatch[#colorBatch+1] = {Part = P[1317], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1140] then colorBatch[#colorBatch+1] = {Part = P[1140], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1539] then colorBatch[#colorBatch+1] = {Part = P[1539], Color = Color3.new(0.06666667014360428,0.06666667014360428,0.06666667014360428), UnionColoring = false} end
if P[1299] then colorBatch[#colorBatch+1] = {Part = P[1299], Color = Color3.new(0.12156862765550613,0.501960813999176,0.11372549086809158), UnionColoring = false} end
if P[1167] then colorBatch[#colorBatch+1] = {Part = P[1167], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1179] then colorBatch[#colorBatch+1] = {Part = P[1179], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1184] then colorBatch[#colorBatch+1] = {Part = P[1184], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1238] then colorBatch[#colorBatch+1] = {Part = P[1238], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1160] then colorBatch[#colorBatch+1] = {Part = P[1160], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1269] then colorBatch[#colorBatch+1] = {Part = P[1269], Color = Color3.new(0.20392157137393951,0.5568627715110779,0.250980406999588), UnionColoring = false} end
if P[1247] then colorBatch[#colorBatch+1] = {Part = P[1247], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
if P[1112] then colorBatch[#colorBatch+1] = {Part = P[1112], Color = Color3.new(0.6666666865348816,0.3333333432674408,0), UnionColoring = false} end
batchColor(endpoint, colorBatch)
local collisionBatch = {}
if P[6] then collisionBatch[#collisionBatch+1] = {Part = P[6], CanCollide = false} end
if P[10] then collisionBatch[#collisionBatch+1] = {Part = P[10], CanCollide = true} end
if P[14] then collisionBatch[#collisionBatch+1] = {Part = P[14], CanCollide = true} end
if P[16] then collisionBatch[#collisionBatch+1] = {Part = P[16], CanCollide = true} end
if P[21] then collisionBatch[#collisionBatch+1] = {Part = P[21], CanCollide = true} end
if P[26] then collisionBatch[#collisionBatch+1] = {Part = P[26], CanCollide = true} end
if P[31] then collisionBatch[#collisionBatch+1] = {Part = P[31], CanCollide = true} end
if P[39] then collisionBatch[#collisionBatch+1] = {Part = P[39], CanCollide = true} end
if P[46] then collisionBatch[#collisionBatch+1] = {Part = P[46], CanCollide = true} end
if P[47] then collisionBatch[#collisionBatch+1] = {Part = P[47], CanCollide = true} end
if P[48] then collisionBatch[#collisionBatch+1] = {Part = P[48], CanCollide = true} end
if P[49] then collisionBatch[#collisionBatch+1] = {Part = P[49], CanCollide = true} end
if P[50] then collisionBatch[#collisionBatch+1] = {Part = P[50], CanCollide = true} end
if P[51] then collisionBatch[#collisionBatch+1] = {Part = P[51], CanCollide = true} end
if P[52] then collisionBatch[#collisionBatch+1] = {Part = P[52], CanCollide = true} end
if P[53] then collisionBatch[#collisionBatch+1] = {Part = P[53], CanCollide = true} end
if P[54] then collisionBatch[#collisionBatch+1] = {Part = P[54], CanCollide = true} end
if P[55] then collisionBatch[#collisionBatch+1] = {Part = P[55], CanCollide = true} end
if P[57] then collisionBatch[#collisionBatch+1] = {Part = P[57], CanCollide = true} end
if P[58] then collisionBatch[#collisionBatch+1] = {Part = P[58], CanCollide = true} end
if P[59] then collisionBatch[#collisionBatch+1] = {Part = P[59], CanCollide = true} end
if P[60] then collisionBatch[#collisionBatch+1] = {Part = P[60], CanCollide = true} end
if P[61] then collisionBatch[#collisionBatch+1] = {Part = P[61], CanCollide = true} end
if P[62] then collisionBatch[#collisionBatch+1] = {Part = P[62], CanCollide = true} end
if P[63] then collisionBatch[#collisionBatch+1] = {Part = P[63], CanCollide = false} end
if P[64] then collisionBatch[#collisionBatch+1] = {Part = P[64], CanCollide = true} end
if P[65] then collisionBatch[#collisionBatch+1] = {Part = P[65], CanCollide = true} end
if P[66] then collisionBatch[#collisionBatch+1] = {Part = P[66], CanCollide = true} end
if P[67] then collisionBatch[#collisionBatch+1] = {Part = P[67], CanCollide = true} end
if P[68] then collisionBatch[#collisionBatch+1] = {Part = P[68], CanCollide = true} end
if P[69] then collisionBatch[#collisionBatch+1] = {Part = P[69], CanCollide = true} end
if P[70] then collisionBatch[#collisionBatch+1] = {Part = P[70], CanCollide = true} end
if P[71] then collisionBatch[#collisionBatch+1] = {Part = P[71], CanCollide = true} end
if P[72] then collisionBatch[#collisionBatch+1] = {Part = P[72], CanCollide = false} end
if P[73] then collisionBatch[#collisionBatch+1] = {Part = P[73], CanCollide = true} end
if P[74] then collisionBatch[#collisionBatch+1] = {Part = P[74], CanCollide = true} end
if P[75] then collisionBatch[#collisionBatch+1] = {Part = P[75], CanCollide = true} end
if P[76] then collisionBatch[#collisionBatch+1] = {Part = P[76], CanCollide = true} end
if P[77] then collisionBatch[#collisionBatch+1] = {Part = P[77], CanCollide = true} end
if P[78] then collisionBatch[#collisionBatch+1] = {Part = P[78], CanCollide = true} end
if P[79] then collisionBatch[#collisionBatch+1] = {Part = P[79], CanCollide = true} end
if P[80] then collisionBatch[#collisionBatch+1] = {Part = P[80], CanCollide = true} end
if P[81] then collisionBatch[#collisionBatch+1] = {Part = P[81], CanCollide = true} end
if P[84] then collisionBatch[#collisionBatch+1] = {Part = P[84], CanCollide = true} end
if P[88] then collisionBatch[#collisionBatch+1] = {Part = P[88], CanCollide = true} end
if P[89] then collisionBatch[#collisionBatch+1] = {Part = P[89], CanCollide = true} end
if P[92] then collisionBatch[#collisionBatch+1] = {Part = P[92], CanCollide = true} end
if P[93] then collisionBatch[#collisionBatch+1] = {Part = P[93], CanCollide = true} end
if P[97] then collisionBatch[#collisionBatch+1] = {Part = P[97], CanCollide = true} end
if P[98] then collisionBatch[#collisionBatch+1] = {Part = P[98], CanCollide = true} end
if P[99] then collisionBatch[#collisionBatch+1] = {Part = P[99], CanCollide = true} end
if P[100] then collisionBatch[#collisionBatch+1] = {Part = P[100], CanCollide = true} end
if P[101] then collisionBatch[#collisionBatch+1] = {Part = P[101], CanCollide = true} end
if P[102] then collisionBatch[#collisionBatch+1] = {Part = P[102], CanCollide = true} end
if P[103] then collisionBatch[#collisionBatch+1] = {Part = P[103], CanCollide = true} end
if P[104] then collisionBatch[#collisionBatch+1] = {Part = P[104], CanCollide = true} end
if P[105] then collisionBatch[#collisionBatch+1] = {Part = P[105], CanCollide = true} end
if P[107] then collisionBatch[#collisionBatch+1] = {Part = P[107], CanCollide = true} end
if P[108] then collisionBatch[#collisionBatch+1] = {Part = P[108], CanCollide = true} end
if P[109] then collisionBatch[#collisionBatch+1] = {Part = P[109], CanCollide = true} end
if P[110] then collisionBatch[#collisionBatch+1] = {Part = P[110], CanCollide = true} end
if P[111] then collisionBatch[#collisionBatch+1] = {Part = P[111], CanCollide = true} end
if P[112] then collisionBatch[#collisionBatch+1] = {Part = P[112], CanCollide = true} end
if P[113] then collisionBatch[#collisionBatch+1] = {Part = P[113], CanCollide = true} end
if P[114] then collisionBatch[#collisionBatch+1] = {Part = P[114], CanCollide = true} end
if P[115] then collisionBatch[#collisionBatch+1] = {Part = P[115], CanCollide = true} end
if P[116] then collisionBatch[#collisionBatch+1] = {Part = P[116], CanCollide = true} end
if P[117] then collisionBatch[#collisionBatch+1] = {Part = P[117], CanCollide = true} end
if P[118] then collisionBatch[#collisionBatch+1] = {Part = P[118], CanCollide = true} end
if P[119] then collisionBatch[#collisionBatch+1] = {Part = P[119], CanCollide = true} end
if P[123] then collisionBatch[#collisionBatch+1] = {Part = P[123], CanCollide = true} end
if P[125] then collisionBatch[#collisionBatch+1] = {Part = P[125], CanCollide = true} end
if P[126] then collisionBatch[#collisionBatch+1] = {Part = P[126], CanCollide = true} end
if P[127] then collisionBatch[#collisionBatch+1] = {Part = P[127], CanCollide = true} end
if P[128] then collisionBatch[#collisionBatch+1] = {Part = P[128], CanCollide = true} end
if P[129] then collisionBatch[#collisionBatch+1] = {Part = P[129], CanCollide = true} end
if P[130] then collisionBatch[#collisionBatch+1] = {Part = P[130], CanCollide = true} end
if P[131] then collisionBatch[#collisionBatch+1] = {Part = P[131], CanCollide = true} end
if P[132] then collisionBatch[#collisionBatch+1] = {Part = P[132], CanCollide = true} end
if P[133] then collisionBatch[#collisionBatch+1] = {Part = P[133], CanCollide = true} end
if P[134] then collisionBatch[#collisionBatch+1] = {Part = P[134], CanCollide = true} end
if P[135] then collisionBatch[#collisionBatch+1] = {Part = P[135], CanCollide = true} end
if P[136] then collisionBatch[#collisionBatch+1] = {Part = P[136], CanCollide = true} end
if P[137] then collisionBatch[#collisionBatch+1] = {Part = P[137], CanCollide = true} end
if P[138] then collisionBatch[#collisionBatch+1] = {Part = P[138], CanCollide = true} end
if P[139] then collisionBatch[#collisionBatch+1] = {Part = P[139], CanCollide = true} end
if P[140] then collisionBatch[#collisionBatch+1] = {Part = P[140], CanCollide = true} end
if P[141] then collisionBatch[#collisionBatch+1] = {Part = P[141], CanCollide = true} end
if P[142] then collisionBatch[#collisionBatch+1] = {Part = P[142], CanCollide = true} end
if P[143] then collisionBatch[#collisionBatch+1] = {Part = P[143], CanCollide = true} end
if P[144] then collisionBatch[#collisionBatch+1] = {Part = P[144], CanCollide = true} end
if P[145] then collisionBatch[#collisionBatch+1] = {Part = P[145], CanCollide = true} end
if P[146] then collisionBatch[#collisionBatch+1] = {Part = P[146], CanCollide = true} end
if P[147] then collisionBatch[#collisionBatch+1] = {Part = P[147], CanCollide = true} end
if P[148] then collisionBatch[#collisionBatch+1] = {Part = P[148], CanCollide = true} end
if P[149] then collisionBatch[#collisionBatch+1] = {Part = P[149], CanCollide = true} end
if P[150] then collisionBatch[#collisionBatch+1] = {Part = P[150], CanCollide = true} end
if P[151] then collisionBatch[#collisionBatch+1] = {Part = P[151], CanCollide = true} end
if P[152] then collisionBatch[#collisionBatch+1] = {Part = P[152], CanCollide = true} end
if P[153] then collisionBatch[#collisionBatch+1] = {Part = P[153], CanCollide = true} end
if P[154] then collisionBatch[#collisionBatch+1] = {Part = P[154], CanCollide = true} end
if P[155] then collisionBatch[#collisionBatch+1] = {Part = P[155], CanCollide = true} end
if P[156] then collisionBatch[#collisionBatch+1] = {Part = P[156], CanCollide = true} end
if P[157] then collisionBatch[#collisionBatch+1] = {Part = P[157], CanCollide = true} end
if P[158] then collisionBatch[#collisionBatch+1] = {Part = P[158], CanCollide = true} end
if P[159] then collisionBatch[#collisionBatch+1] = {Part = P[159], CanCollide = true} end
if P[161] then collisionBatch[#collisionBatch+1] = {Part = P[161], CanCollide = true} end
if P[162] then collisionBatch[#collisionBatch+1] = {Part = P[162], CanCollide = true} end
if P[163] then collisionBatch[#collisionBatch+1] = {Part = P[163], CanCollide = true} end
if P[164] then collisionBatch[#collisionBatch+1] = {Part = P[164], CanCollide = true} end
if P[165] then collisionBatch[#collisionBatch+1] = {Part = P[165], CanCollide = true} end
if P[166] then collisionBatch[#collisionBatch+1] = {Part = P[166], CanCollide = true} end
if P[167] then collisionBatch[#collisionBatch+1] = {Part = P[167], CanCollide = true} end
if P[168] then collisionBatch[#collisionBatch+1] = {Part = P[168], CanCollide = true} end
if P[169] then collisionBatch[#collisionBatch+1] = {Part = P[169], CanCollide = true} end
if P[170] then collisionBatch[#collisionBatch+1] = {Part = P[170], CanCollide = true} end
if P[171] then collisionBatch[#collisionBatch+1] = {Part = P[171], CanCollide = true} end
if P[172] then collisionBatch[#collisionBatch+1] = {Part = P[172], CanCollide = true} end
if P[173] then collisionBatch[#collisionBatch+1] = {Part = P[173], CanCollide = true} end
if P[174] then collisionBatch[#collisionBatch+1] = {Part = P[174], CanCollide = true} end
if P[175] then collisionBatch[#collisionBatch+1] = {Part = P[175], CanCollide = true} end
if P[176] then collisionBatch[#collisionBatch+1] = {Part = P[176], CanCollide = true} end
if P[177] then collisionBatch[#collisionBatch+1] = {Part = P[177], CanCollide = true} end
if P[178] then collisionBatch[#collisionBatch+1] = {Part = P[178], CanCollide = true} end
if P[179] then collisionBatch[#collisionBatch+1] = {Part = P[179], CanCollide = true} end
if P[180] then collisionBatch[#collisionBatch+1] = {Part = P[180], CanCollide = true} end
if P[181] then collisionBatch[#collisionBatch+1] = {Part = P[181], CanCollide = true} end
if P[182] then collisionBatch[#collisionBatch+1] = {Part = P[182], CanCollide = true} end
if P[183] then collisionBatch[#collisionBatch+1] = {Part = P[183], CanCollide = true} end
if P[184] then collisionBatch[#collisionBatch+1] = {Part = P[184], CanCollide = true} end
if P[185] then collisionBatch[#collisionBatch+1] = {Part = P[185], CanCollide = true} end
if P[186] then collisionBatch[#collisionBatch+1] = {Part = P[186], CanCollide = true} end
if P[187] then collisionBatch[#collisionBatch+1] = {Part = P[187], CanCollide = true} end
if P[188] then collisionBatch[#collisionBatch+1] = {Part = P[188], CanCollide = true} end
if P[189] then collisionBatch[#collisionBatch+1] = {Part = P[189], CanCollide = true} end
if P[190] then collisionBatch[#collisionBatch+1] = {Part = P[190], CanCollide = true} end
if P[191] then collisionBatch[#collisionBatch+1] = {Part = P[191], CanCollide = true} end
if P[192] then collisionBatch[#collisionBatch+1] = {Part = P[192], CanCollide = true} end
if P[193] then collisionBatch[#collisionBatch+1] = {Part = P[193], CanCollide = true} end
if P[194] then collisionBatch[#collisionBatch+1] = {Part = P[194], CanCollide = true} end
if P[195] then collisionBatch[#collisionBatch+1] = {Part = P[195], CanCollide = true} end
if P[196] then collisionBatch[#collisionBatch+1] = {Part = P[196], CanCollide = true} end
if P[197] then collisionBatch[#collisionBatch+1] = {Part = P[197], CanCollide = true} end
if P[198] then collisionBatch[#collisionBatch+1] = {Part = P[198], CanCollide = true} end
if P[199] then collisionBatch[#collisionBatch+1] = {Part = P[199], CanCollide = true} end
if P[201] then collisionBatch[#collisionBatch+1] = {Part = P[201], CanCollide = true} end
if P[202] then collisionBatch[#collisionBatch+1] = {Part = P[202], CanCollide = true} end
if P[203] then collisionBatch[#collisionBatch+1] = {Part = P[203], CanCollide = true} end
if P[204] then collisionBatch[#collisionBatch+1] = {Part = P[204], CanCollide = true} end
if P[205] then collisionBatch[#collisionBatch+1] = {Part = P[205], CanCollide = true} end
if P[206] then collisionBatch[#collisionBatch+1] = {Part = P[206], CanCollide = true} end
if P[207] then collisionBatch[#collisionBatch+1] = {Part = P[207], CanCollide = true} end
if P[208] then collisionBatch[#collisionBatch+1] = {Part = P[208], CanCollide = true} end
if P[209] then collisionBatch[#collisionBatch+1] = {Part = P[209], CanCollide = true} end
if P[210] then collisionBatch[#collisionBatch+1] = {Part = P[210], CanCollide = true} end
if P[211] then collisionBatch[#collisionBatch+1] = {Part = P[211], CanCollide = true} end
if P[212] then collisionBatch[#collisionBatch+1] = {Part = P[212], CanCollide = true} end
if P[213] then collisionBatch[#collisionBatch+1] = {Part = P[213], CanCollide = true} end
if P[214] then collisionBatch[#collisionBatch+1] = {Part = P[214], CanCollide = true} end
if P[215] then collisionBatch[#collisionBatch+1] = {Part = P[215], CanCollide = true} end
if P[216] then collisionBatch[#collisionBatch+1] = {Part = P[216], CanCollide = true} end
if P[217] then collisionBatch[#collisionBatch+1] = {Part = P[217], CanCollide = true} end
if P[218] then collisionBatch[#collisionBatch+1] = {Part = P[218], CanCollide = true} end
if P[219] then collisionBatch[#collisionBatch+1] = {Part = P[219], CanCollide = true} end
if P[220] then collisionBatch[#collisionBatch+1] = {Part = P[220], CanCollide = true} end
if P[221] then collisionBatch[#collisionBatch+1] = {Part = P[221], CanCollide = true} end
if P[222] then collisionBatch[#collisionBatch+1] = {Part = P[222], CanCollide = true} end
if P[223] then collisionBatch[#collisionBatch+1] = {Part = P[223], CanCollide = true} end
if P[224] then collisionBatch[#collisionBatch+1] = {Part = P[224], CanCollide = true} end
if P[225] then collisionBatch[#collisionBatch+1] = {Part = P[225], CanCollide = true} end
if P[226] then collisionBatch[#collisionBatch+1] = {Part = P[226], CanCollide = true} end
if P[227] then collisionBatch[#collisionBatch+1] = {Part = P[227], CanCollide = true} end
if P[230] then collisionBatch[#collisionBatch+1] = {Part = P[230], CanCollide = true} end
if P[231] then collisionBatch[#collisionBatch+1] = {Part = P[231], CanCollide = true} end
if P[232] then collisionBatch[#collisionBatch+1] = {Part = P[232], CanCollide = true} end
if P[233] then collisionBatch[#collisionBatch+1] = {Part = P[233], CanCollide = true} end
if P[234] then collisionBatch[#collisionBatch+1] = {Part = P[234], CanCollide = true} end
if P[235] then collisionBatch[#collisionBatch+1] = {Part = P[235], CanCollide = true} end
if P[236] then collisionBatch[#collisionBatch+1] = {Part = P[236], CanCollide = true} end
if P[237] then collisionBatch[#collisionBatch+1] = {Part = P[237], CanCollide = true} end
if P[238] then collisionBatch[#collisionBatch+1] = {Part = P[238], CanCollide = true} end
if P[239] then collisionBatch[#collisionBatch+1] = {Part = P[239], CanCollide = true} end
if P[240] then collisionBatch[#collisionBatch+1] = {Part = P[240], CanCollide = true} end
if P[241] then collisionBatch[#collisionBatch+1] = {Part = P[241], CanCollide = true} end
if P[242] then collisionBatch[#collisionBatch+1] = {Part = P[242], CanCollide = true} end
if P[243] then collisionBatch[#collisionBatch+1] = {Part = P[243], CanCollide = true} end
if P[244] then collisionBatch[#collisionBatch+1] = {Part = P[244], CanCollide = true} end
if P[245] then collisionBatch[#collisionBatch+1] = {Part = P[245], CanCollide = true} end
if P[246] then collisionBatch[#collisionBatch+1] = {Part = P[246], CanCollide = true} end
if P[247] then collisionBatch[#collisionBatch+1] = {Part = P[247], CanCollide = true} end
if P[248] then collisionBatch[#collisionBatch+1] = {Part = P[248], CanCollide = true} end
if P[249] then collisionBatch[#collisionBatch+1] = {Part = P[249], CanCollide = true} end
if P[250] then collisionBatch[#collisionBatch+1] = {Part = P[250], CanCollide = true} end
if P[251] then collisionBatch[#collisionBatch+1] = {Part = P[251], CanCollide = true} end
if P[252] then collisionBatch[#collisionBatch+1] = {Part = P[252], CanCollide = true} end
if P[253] then collisionBatch[#collisionBatch+1] = {Part = P[253], CanCollide = true} end
if P[254] then collisionBatch[#collisionBatch+1] = {Part = P[254], CanCollide = true} end
if P[255] then collisionBatch[#collisionBatch+1] = {Part = P[255], CanCollide = true} end
if P[256] then collisionBatch[#collisionBatch+1] = {Part = P[256], CanCollide = true} end
if P[257] then collisionBatch[#collisionBatch+1] = {Part = P[257], CanCollide = true} end
if P[258] then collisionBatch[#collisionBatch+1] = {Part = P[258], CanCollide = true} end
if P[259] then collisionBatch[#collisionBatch+1] = {Part = P[259], CanCollide = true} end
if P[260] then collisionBatch[#collisionBatch+1] = {Part = P[260], CanCollide = true} end
if P[262] then collisionBatch[#collisionBatch+1] = {Part = P[262], CanCollide = true} end
if P[263] then collisionBatch[#collisionBatch+1] = {Part = P[263], CanCollide = true} end
if P[264] then collisionBatch[#collisionBatch+1] = {Part = P[264], CanCollide = true} end
if P[265] then collisionBatch[#collisionBatch+1] = {Part = P[265], CanCollide = true} end
if P[266] then collisionBatch[#collisionBatch+1] = {Part = P[266], CanCollide = true} end
if P[267] then collisionBatch[#collisionBatch+1] = {Part = P[267], CanCollide = true} end
if P[268] then collisionBatch[#collisionBatch+1] = {Part = P[268], CanCollide = true} end
if P[269] then collisionBatch[#collisionBatch+1] = {Part = P[269], CanCollide = true} end
if P[270] then collisionBatch[#collisionBatch+1] = {Part = P[270], CanCollide = true} end
if P[271] then collisionBatch[#collisionBatch+1] = {Part = P[271], CanCollide = true} end
if P[272] then collisionBatch[#collisionBatch+1] = {Part = P[272], CanCollide = true} end
if P[273] then collisionBatch[#collisionBatch+1] = {Part = P[273], CanCollide = true} end
if P[274] then collisionBatch[#collisionBatch+1] = {Part = P[274], CanCollide = true} end
if P[275] then collisionBatch[#collisionBatch+1] = {Part = P[275], CanCollide = true} end
if P[276] then collisionBatch[#collisionBatch+1] = {Part = P[276], CanCollide = true} end
if P[277] then collisionBatch[#collisionBatch+1] = {Part = P[277], CanCollide = true} end
if P[278] then collisionBatch[#collisionBatch+1] = {Part = P[278], CanCollide = true} end
if P[279] then collisionBatch[#collisionBatch+1] = {Part = P[279], CanCollide = true} end
if P[280] then collisionBatch[#collisionBatch+1] = {Part = P[280], CanCollide = true} end
if P[281] then collisionBatch[#collisionBatch+1] = {Part = P[281], CanCollide = true} end
if P[282] then collisionBatch[#collisionBatch+1] = {Part = P[282], CanCollide = true} end
if P[283] then collisionBatch[#collisionBatch+1] = {Part = P[283], CanCollide = true} end
if P[284] then collisionBatch[#collisionBatch+1] = {Part = P[284], CanCollide = true} end
if P[285] then collisionBatch[#collisionBatch+1] = {Part = P[285], CanCollide = true} end
if P[286] then collisionBatch[#collisionBatch+1] = {Part = P[286], CanCollide = true} end
if P[288] then collisionBatch[#collisionBatch+1] = {Part = P[288], CanCollide = true} end
if P[289] then collisionBatch[#collisionBatch+1] = {Part = P[289], CanCollide = true} end
if P[290] then collisionBatch[#collisionBatch+1] = {Part = P[290], CanCollide = true} end
if P[291] then collisionBatch[#collisionBatch+1] = {Part = P[291], CanCollide = true} end
if P[292] then collisionBatch[#collisionBatch+1] = {Part = P[292], CanCollide = true} end
if P[293] then collisionBatch[#collisionBatch+1] = {Part = P[293], CanCollide = true} end
if P[294] then collisionBatch[#collisionBatch+1] = {Part = P[294], CanCollide = true} end
if P[295] then collisionBatch[#collisionBatch+1] = {Part = P[295], CanCollide = true} end
if P[296] then collisionBatch[#collisionBatch+1] = {Part = P[296], CanCollide = true} end
if P[297] then collisionBatch[#collisionBatch+1] = {Part = P[297], CanCollide = true} end
if P[298] then collisionBatch[#collisionBatch+1] = {Part = P[298], CanCollide = true} end
if P[299] then collisionBatch[#collisionBatch+1] = {Part = P[299], CanCollide = true} end
if P[300] then collisionBatch[#collisionBatch+1] = {Part = P[300], CanCollide = true} end
if P[301] then collisionBatch[#collisionBatch+1] = {Part = P[301], CanCollide = true} end
if P[302] then collisionBatch[#collisionBatch+1] = {Part = P[302], CanCollide = true} end
if P[304] then collisionBatch[#collisionBatch+1] = {Part = P[304], CanCollide = true} end
if P[305] then collisionBatch[#collisionBatch+1] = {Part = P[305], CanCollide = true} end
if P[306] then collisionBatch[#collisionBatch+1] = {Part = P[306], CanCollide = true} end
if P[307] then collisionBatch[#collisionBatch+1] = {Part = P[307], CanCollide = true} end
if P[308] then collisionBatch[#collisionBatch+1] = {Part = P[308], CanCollide = true} end
if P[309] then collisionBatch[#collisionBatch+1] = {Part = P[309], CanCollide = true} end
if P[310] then collisionBatch[#collisionBatch+1] = {Part = P[310], CanCollide = true} end
if P[311] then collisionBatch[#collisionBatch+1] = {Part = P[311], CanCollide = true} end
if P[312] then collisionBatch[#collisionBatch+1] = {Part = P[312], CanCollide = true} end
if P[313] then collisionBatch[#collisionBatch+1] = {Part = P[313], CanCollide = true} end
if P[314] then collisionBatch[#collisionBatch+1] = {Part = P[314], CanCollide = true} end
if P[315] then collisionBatch[#collisionBatch+1] = {Part = P[315], CanCollide = true} end
if P[316] then collisionBatch[#collisionBatch+1] = {Part = P[316], CanCollide = true} end
if P[317] then collisionBatch[#collisionBatch+1] = {Part = P[317], CanCollide = true} end
if P[318] then collisionBatch[#collisionBatch+1] = {Part = P[318], CanCollide = true} end
if P[319] then collisionBatch[#collisionBatch+1] = {Part = P[319], CanCollide = true} end
if P[320] then collisionBatch[#collisionBatch+1] = {Part = P[320], CanCollide = true} end
if P[321] then collisionBatch[#collisionBatch+1] = {Part = P[321], CanCollide = true} end
if P[322] then collisionBatch[#collisionBatch+1] = {Part = P[322], CanCollide = true} end
if P[323] then collisionBatch[#collisionBatch+1] = {Part = P[323], CanCollide = true} end
if P[324] then collisionBatch[#collisionBatch+1] = {Part = P[324], CanCollide = true} end
if P[325] then collisionBatch[#collisionBatch+1] = {Part = P[325], CanCollide = true} end
if P[326] then collisionBatch[#collisionBatch+1] = {Part = P[326], CanCollide = true} end
if P[327] then collisionBatch[#collisionBatch+1] = {Part = P[327], CanCollide = true} end
if P[328] then collisionBatch[#collisionBatch+1] = {Part = P[328], CanCollide = true} end
if P[329] then collisionBatch[#collisionBatch+1] = {Part = P[329], CanCollide = true} end
if P[330] then collisionBatch[#collisionBatch+1] = {Part = P[330], CanCollide = true} end
if P[331] then collisionBatch[#collisionBatch+1] = {Part = P[331], CanCollide = true} end
if P[332] then collisionBatch[#collisionBatch+1] = {Part = P[332], CanCollide = true} end
if P[333] then collisionBatch[#collisionBatch+1] = {Part = P[333], CanCollide = true} end
if P[334] then collisionBatch[#collisionBatch+1] = {Part = P[334], CanCollide = true} end
if P[335] then collisionBatch[#collisionBatch+1] = {Part = P[335], CanCollide = true} end
if P[336] then collisionBatch[#collisionBatch+1] = {Part = P[336], CanCollide = true} end
if P[337] then collisionBatch[#collisionBatch+1] = {Part = P[337], CanCollide = true} end
if P[338] then collisionBatch[#collisionBatch+1] = {Part = P[338], CanCollide = true} end
if P[339] then collisionBatch[#collisionBatch+1] = {Part = P[339], CanCollide = true} end
if P[340] then collisionBatch[#collisionBatch+1] = {Part = P[340], CanCollide = true} end
if P[341] then collisionBatch[#collisionBatch+1] = {Part = P[341], CanCollide = true} end
if P[342] then collisionBatch[#collisionBatch+1] = {Part = P[342], CanCollide = true} end
if P[343] then collisionBatch[#collisionBatch+1] = {Part = P[343], CanCollide = true} end
if P[344] then collisionBatch[#collisionBatch+1] = {Part = P[344], CanCollide = true} end
if P[345] then collisionBatch[#collisionBatch+1] = {Part = P[345], CanCollide = true} end
if P[346] then collisionBatch[#collisionBatch+1] = {Part = P[346], CanCollide = true} end
if P[347] then collisionBatch[#collisionBatch+1] = {Part = P[347], CanCollide = true} end
if P[348] then collisionBatch[#collisionBatch+1] = {Part = P[348], CanCollide = true} end
if P[349] then collisionBatch[#collisionBatch+1] = {Part = P[349], CanCollide = true} end
if P[350] then collisionBatch[#collisionBatch+1] = {Part = P[350], CanCollide = true} end
if P[351] then collisionBatch[#collisionBatch+1] = {Part = P[351], CanCollide = true} end
if P[352] then collisionBatch[#collisionBatch+1] = {Part = P[352], CanCollide = true} end
if P[353] then collisionBatch[#collisionBatch+1] = {Part = P[353], CanCollide = true} end
if P[354] then collisionBatch[#collisionBatch+1] = {Part = P[354], CanCollide = true} end
if P[355] then collisionBatch[#collisionBatch+1] = {Part = P[355], CanCollide = true} end
if P[356] then collisionBatch[#collisionBatch+1] = {Part = P[356], CanCollide = true} end
if P[357] then collisionBatch[#collisionBatch+1] = {Part = P[357], CanCollide = true} end
if P[358] then collisionBatch[#collisionBatch+1] = {Part = P[358], CanCollide = true} end
if P[359] then collisionBatch[#collisionBatch+1] = {Part = P[359], CanCollide = true} end
if P[360] then collisionBatch[#collisionBatch+1] = {Part = P[360], CanCollide = true} end
if P[361] then collisionBatch[#collisionBatch+1] = {Part = P[361], CanCollide = true} end
if P[362] then collisionBatch[#collisionBatch+1] = {Part = P[362], CanCollide = true} end
if P[363] then collisionBatch[#collisionBatch+1] = {Part = P[363], CanCollide = true} end
if P[364] then collisionBatch[#collisionBatch+1] = {Part = P[364], CanCollide = true} end
if P[365] then collisionBatch[#collisionBatch+1] = {Part = P[365], CanCollide = true} end
if P[366] then collisionBatch[#collisionBatch+1] = {Part = P[366], CanCollide = true} end
if P[367] then collisionBatch[#collisionBatch+1] = {Part = P[367], CanCollide = true} end
if P[368] then collisionBatch[#collisionBatch+1] = {Part = P[368], CanCollide = true} end
if P[369] then collisionBatch[#collisionBatch+1] = {Part = P[369], CanCollide = true} end
if P[370] then collisionBatch[#collisionBatch+1] = {Part = P[370], CanCollide = true} end
if P[371] then collisionBatch[#collisionBatch+1] = {Part = P[371], CanCollide = true} end
if P[373] then collisionBatch[#collisionBatch+1] = {Part = P[373], CanCollide = true} end
if P[374] then collisionBatch[#collisionBatch+1] = {Part = P[374], CanCollide = true} end
if P[375] then collisionBatch[#collisionBatch+1] = {Part = P[375], CanCollide = true} end
if P[376] then collisionBatch[#collisionBatch+1] = {Part = P[376], CanCollide = true} end
if P[377] then collisionBatch[#collisionBatch+1] = {Part = P[377], CanCollide = true} end
if P[378] then collisionBatch[#collisionBatch+1] = {Part = P[378], CanCollide = true} end
if P[379] then collisionBatch[#collisionBatch+1] = {Part = P[379], CanCollide = true} end
if P[380] then collisionBatch[#collisionBatch+1] = {Part = P[380], CanCollide = true} end
if P[381] then collisionBatch[#collisionBatch+1] = {Part = P[381], CanCollide = true} end
if P[382] then collisionBatch[#collisionBatch+1] = {Part = P[382], CanCollide = true} end
if P[383] then collisionBatch[#collisionBatch+1] = {Part = P[383], CanCollide = true} end
if P[384] then collisionBatch[#collisionBatch+1] = {Part = P[384], CanCollide = true} end
if P[385] then collisionBatch[#collisionBatch+1] = {Part = P[385], CanCollide = true} end
if P[388] then collisionBatch[#collisionBatch+1] = {Part = P[388], CanCollide = true} end
if P[389] then collisionBatch[#collisionBatch+1] = {Part = P[389], CanCollide = true} end
if P[390] then collisionBatch[#collisionBatch+1] = {Part = P[390], CanCollide = true} end
if P[391] then collisionBatch[#collisionBatch+1] = {Part = P[391], CanCollide = true} end
if P[392] then collisionBatch[#collisionBatch+1] = {Part = P[392], CanCollide = true} end
if P[393] then collisionBatch[#collisionBatch+1] = {Part = P[393], CanCollide = true} end
if P[394] then collisionBatch[#collisionBatch+1] = {Part = P[394], CanCollide = true} end
if P[395] then collisionBatch[#collisionBatch+1] = {Part = P[395], CanCollide = true} end
if P[396] then collisionBatch[#collisionBatch+1] = {Part = P[396], CanCollide = true} end
if P[397] then collisionBatch[#collisionBatch+1] = {Part = P[397], CanCollide = true} end
if P[398] then collisionBatch[#collisionBatch+1] = {Part = P[398], CanCollide = true} end
if P[399] then collisionBatch[#collisionBatch+1] = {Part = P[399], CanCollide = true} end
if P[400] then collisionBatch[#collisionBatch+1] = {Part = P[400], CanCollide = true} end
if P[401] then collisionBatch[#collisionBatch+1] = {Part = P[401], CanCollide = true} end
if P[402] then collisionBatch[#collisionBatch+1] = {Part = P[402], CanCollide = true} end
if P[403] then collisionBatch[#collisionBatch+1] = {Part = P[403], CanCollide = true} end
if P[404] then collisionBatch[#collisionBatch+1] = {Part = P[404], CanCollide = true} end
if P[405] then collisionBatch[#collisionBatch+1] = {Part = P[405], CanCollide = true} end
if P[406] then collisionBatch[#collisionBatch+1] = {Part = P[406], CanCollide = true} end
if P[407] then collisionBatch[#collisionBatch+1] = {Part = P[407], CanCollide = true} end
if P[408] then collisionBatch[#collisionBatch+1] = {Part = P[408], CanCollide = true} end
if P[409] then collisionBatch[#collisionBatch+1] = {Part = P[409], CanCollide = true} end
if P[410] then collisionBatch[#collisionBatch+1] = {Part = P[410], CanCollide = true} end
if P[411] then collisionBatch[#collisionBatch+1] = {Part = P[411], CanCollide = true} end
if P[412] then collisionBatch[#collisionBatch+1] = {Part = P[412], CanCollide = true} end
if P[413] then collisionBatch[#collisionBatch+1] = {Part = P[413], CanCollide = true} end
if P[414] then collisionBatch[#collisionBatch+1] = {Part = P[414], CanCollide = true} end
if P[415] then collisionBatch[#collisionBatch+1] = {Part = P[415], CanCollide = true} end
if P[416] then collisionBatch[#collisionBatch+1] = {Part = P[416], CanCollide = true} end
if P[417] then collisionBatch[#collisionBatch+1] = {Part = P[417], CanCollide = true} end
if P[418] then collisionBatch[#collisionBatch+1] = {Part = P[418], CanCollide = true} end
if P[419] then collisionBatch[#collisionBatch+1] = {Part = P[419], CanCollide = true} end
if P[420] then collisionBatch[#collisionBatch+1] = {Part = P[420], CanCollide = true} end
if P[421] then collisionBatch[#collisionBatch+1] = {Part = P[421], CanCollide = true} end
if P[422] then collisionBatch[#collisionBatch+1] = {Part = P[422], CanCollide = true} end
if P[423] then collisionBatch[#collisionBatch+1] = {Part = P[423], CanCollide = true} end
if P[424] then collisionBatch[#collisionBatch+1] = {Part = P[424], CanCollide = true} end
if P[425] then collisionBatch[#collisionBatch+1] = {Part = P[425], CanCollide = true} end
if P[426] then collisionBatch[#collisionBatch+1] = {Part = P[426], CanCollide = true} end
if P[427] then collisionBatch[#collisionBatch+1] = {Part = P[427], CanCollide = true} end
if P[428] then collisionBatch[#collisionBatch+1] = {Part = P[428], CanCollide = true} end
if P[429] then collisionBatch[#collisionBatch+1] = {Part = P[429], CanCollide = true} end
if P[430] then collisionBatch[#collisionBatch+1] = {Part = P[430], CanCollide = true} end
if P[431] then collisionBatch[#collisionBatch+1] = {Part = P[431], CanCollide = true} end
if P[432] then collisionBatch[#collisionBatch+1] = {Part = P[432], CanCollide = true} end
if P[433] then collisionBatch[#collisionBatch+1] = {Part = P[433], CanCollide = true} end
if P[434] then collisionBatch[#collisionBatch+1] = {Part = P[434], CanCollide = true} end
if P[435] then collisionBatch[#collisionBatch+1] = {Part = P[435], CanCollide = true} end
if P[436] then collisionBatch[#collisionBatch+1] = {Part = P[436], CanCollide = true} end
if P[437] then collisionBatch[#collisionBatch+1] = {Part = P[437], CanCollide = true} end
if P[438] then collisionBatch[#collisionBatch+1] = {Part = P[438], CanCollide = true} end
if P[439] then collisionBatch[#collisionBatch+1] = {Part = P[439], CanCollide = true} end
if P[440] then collisionBatch[#collisionBatch+1] = {Part = P[440], CanCollide = true} end
if P[441] then collisionBatch[#collisionBatch+1] = {Part = P[441], CanCollide = true} end
if P[442] then collisionBatch[#collisionBatch+1] = {Part = P[442], CanCollide = true} end
if P[443] then collisionBatch[#collisionBatch+1] = {Part = P[443], CanCollide = true} end
if P[444] then collisionBatch[#collisionBatch+1] = {Part = P[444], CanCollide = true} end
if P[445] then collisionBatch[#collisionBatch+1] = {Part = P[445], CanCollide = true} end
if P[446] then collisionBatch[#collisionBatch+1] = {Part = P[446], CanCollide = true} end
if P[447] then collisionBatch[#collisionBatch+1] = {Part = P[447], CanCollide = true} end
if P[448] then collisionBatch[#collisionBatch+1] = {Part = P[448], CanCollide = true} end
if P[449] then collisionBatch[#collisionBatch+1] = {Part = P[449], CanCollide = true} end
if P[450] then collisionBatch[#collisionBatch+1] = {Part = P[450], CanCollide = true} end
if P[451] then collisionBatch[#collisionBatch+1] = {Part = P[451], CanCollide = true} end
if P[452] then collisionBatch[#collisionBatch+1] = {Part = P[452], CanCollide = true} end
if P[453] then collisionBatch[#collisionBatch+1] = {Part = P[453], CanCollide = true} end
if P[454] then collisionBatch[#collisionBatch+1] = {Part = P[454], CanCollide = true} end
if P[455] then collisionBatch[#collisionBatch+1] = {Part = P[455], CanCollide = true} end
if P[456] then collisionBatch[#collisionBatch+1] = {Part = P[456], CanCollide = true} end
if P[457] then collisionBatch[#collisionBatch+1] = {Part = P[457], CanCollide = true} end
if P[458] then collisionBatch[#collisionBatch+1] = {Part = P[458], CanCollide = true} end
if P[459] then collisionBatch[#collisionBatch+1] = {Part = P[459], CanCollide = true} end
if P[460] then collisionBatch[#collisionBatch+1] = {Part = P[460], CanCollide = true} end
if P[461] then collisionBatch[#collisionBatch+1] = {Part = P[461], CanCollide = true} end
if P[462] then collisionBatch[#collisionBatch+1] = {Part = P[462], CanCollide = true} end
if P[463] then collisionBatch[#collisionBatch+1] = {Part = P[463], CanCollide = true} end
if P[464] then collisionBatch[#collisionBatch+1] = {Part = P[464], CanCollide = true} end
if P[465] then collisionBatch[#collisionBatch+1] = {Part = P[465], CanCollide = true} end
if P[466] then collisionBatch[#collisionBatch+1] = {Part = P[466], CanCollide = true} end
if P[467] then collisionBatch[#collisionBatch+1] = {Part = P[467], CanCollide = true} end
if P[468] then collisionBatch[#collisionBatch+1] = {Part = P[468], CanCollide = true} end
if P[469] then collisionBatch[#collisionBatch+1] = {Part = P[469], CanCollide = true} end
if P[470] then collisionBatch[#collisionBatch+1] = {Part = P[470], CanCollide = true} end
if P[471] then collisionBatch[#collisionBatch+1] = {Part = P[471], CanCollide = true} end
if P[472] then collisionBatch[#collisionBatch+1] = {Part = P[472], CanCollide = true} end
if P[473] then collisionBatch[#collisionBatch+1] = {Part = P[473], CanCollide = true} end
if P[474] then collisionBatch[#collisionBatch+1] = {Part = P[474], CanCollide = true} end
if P[475] then collisionBatch[#collisionBatch+1] = {Part = P[475], CanCollide = true} end
if P[476] then collisionBatch[#collisionBatch+1] = {Part = P[476], CanCollide = true} end
if P[477] then collisionBatch[#collisionBatch+1] = {Part = P[477], CanCollide = true} end
if P[478] then collisionBatch[#collisionBatch+1] = {Part = P[478], CanCollide = true} end
if P[479] then collisionBatch[#collisionBatch+1] = {Part = P[479], CanCollide = true} end
if P[480] then collisionBatch[#collisionBatch+1] = {Part = P[480], CanCollide = true} end
if P[481] then collisionBatch[#collisionBatch+1] = {Part = P[481], CanCollide = true} end
if P[482] then collisionBatch[#collisionBatch+1] = {Part = P[482], CanCollide = true} end
if P[483] then collisionBatch[#collisionBatch+1] = {Part = P[483], CanCollide = true} end
if P[484] then collisionBatch[#collisionBatch+1] = {Part = P[484], CanCollide = true} end
if P[485] then collisionBatch[#collisionBatch+1] = {Part = P[485], CanCollide = true} end
if P[486] then collisionBatch[#collisionBatch+1] = {Part = P[486], CanCollide = true} end
if P[487] then collisionBatch[#collisionBatch+1] = {Part = P[487], CanCollide = true} end
if P[488] then collisionBatch[#collisionBatch+1] = {Part = P[488], CanCollide = true} end
if P[489] then collisionBatch[#collisionBatch+1] = {Part = P[489], CanCollide = true} end
if P[490] then collisionBatch[#collisionBatch+1] = {Part = P[490], CanCollide = true} end
if P[493] then collisionBatch[#collisionBatch+1] = {Part = P[493], CanCollide = true} end
if P[494] then collisionBatch[#collisionBatch+1] = {Part = P[494], CanCollide = true} end
if P[495] then collisionBatch[#collisionBatch+1] = {Part = P[495], CanCollide = true} end
if P[496] then collisionBatch[#collisionBatch+1] = {Part = P[496], CanCollide = true} end
if P[497] then collisionBatch[#collisionBatch+1] = {Part = P[497], CanCollide = true} end
if P[498] then collisionBatch[#collisionBatch+1] = {Part = P[498], CanCollide = true} end
if P[499] then collisionBatch[#collisionBatch+1] = {Part = P[499], CanCollide = true} end
if P[500] then collisionBatch[#collisionBatch+1] = {Part = P[500], CanCollide = true} end
if P[501] then collisionBatch[#collisionBatch+1] = {Part = P[501], CanCollide = true} end
if P[502] then collisionBatch[#collisionBatch+1] = {Part = P[502], CanCollide = true} end
if P[503] then collisionBatch[#collisionBatch+1] = {Part = P[503], CanCollide = true} end
if P[504] then collisionBatch[#collisionBatch+1] = {Part = P[504], CanCollide = true} end
if P[505] then collisionBatch[#collisionBatch+1] = {Part = P[505], CanCollide = true} end
if P[506] then collisionBatch[#collisionBatch+1] = {Part = P[506], CanCollide = true} end
if P[507] then collisionBatch[#collisionBatch+1] = {Part = P[507], CanCollide = true} end
if P[508] then collisionBatch[#collisionBatch+1] = {Part = P[508], CanCollide = true} end
if P[509] then collisionBatch[#collisionBatch+1] = {Part = P[509], CanCollide = true} end
if P[510] then collisionBatch[#collisionBatch+1] = {Part = P[510], CanCollide = true} end
if P[511] then collisionBatch[#collisionBatch+1] = {Part = P[511], CanCollide = true} end
if P[512] then collisionBatch[#collisionBatch+1] = {Part = P[512], CanCollide = true} end
if P[513] then collisionBatch[#collisionBatch+1] = {Part = P[513], CanCollide = true} end
if P[514] then collisionBatch[#collisionBatch+1] = {Part = P[514], CanCollide = true} end
if P[515] then collisionBatch[#collisionBatch+1] = {Part = P[515], CanCollide = true} end
if P[516] then collisionBatch[#collisionBatch+1] = {Part = P[516], CanCollide = true} end
if P[517] then collisionBatch[#collisionBatch+1] = {Part = P[517], CanCollide = true} end
if P[518] then collisionBatch[#collisionBatch+1] = {Part = P[518], CanCollide = true} end
if P[519] then collisionBatch[#collisionBatch+1] = {Part = P[519], CanCollide = true} end
if P[520] then collisionBatch[#collisionBatch+1] = {Part = P[520], CanCollide = true} end
if P[521] then collisionBatch[#collisionBatch+1] = {Part = P[521], CanCollide = true} end
if P[522] then collisionBatch[#collisionBatch+1] = {Part = P[522], CanCollide = true} end
if P[523] then collisionBatch[#collisionBatch+1] = {Part = P[523], CanCollide = true} end
if P[524] then collisionBatch[#collisionBatch+1] = {Part = P[524], CanCollide = true} end
if P[525] then collisionBatch[#collisionBatch+1] = {Part = P[525], CanCollide = true} end
if P[526] then collisionBatch[#collisionBatch+1] = {Part = P[526], CanCollide = true} end
if P[527] then collisionBatch[#collisionBatch+1] = {Part = P[527], CanCollide = true} end
if P[528] then collisionBatch[#collisionBatch+1] = {Part = P[528], CanCollide = true} end
if P[529] then collisionBatch[#collisionBatch+1] = {Part = P[529], CanCollide = true} end
if P[530] then collisionBatch[#collisionBatch+1] = {Part = P[530], CanCollide = true} end
if P[531] then collisionBatch[#collisionBatch+1] = {Part = P[531], CanCollide = true} end
if P[532] then collisionBatch[#collisionBatch+1] = {Part = P[532], CanCollide = true} end
if P[533] then collisionBatch[#collisionBatch+1] = {Part = P[533], CanCollide = true} end
if P[534] then collisionBatch[#collisionBatch+1] = {Part = P[534], CanCollide = true} end
if P[535] then collisionBatch[#collisionBatch+1] = {Part = P[535], CanCollide = true} end
if P[536] then collisionBatch[#collisionBatch+1] = {Part = P[536], CanCollide = true} end
if P[537] then collisionBatch[#collisionBatch+1] = {Part = P[537], CanCollide = true} end
if P[538] then collisionBatch[#collisionBatch+1] = {Part = P[538], CanCollide = true} end
if P[539] then collisionBatch[#collisionBatch+1] = {Part = P[539], CanCollide = true} end
if P[540] then collisionBatch[#collisionBatch+1] = {Part = P[540], CanCollide = true} end
if P[541] then collisionBatch[#collisionBatch+1] = {Part = P[541], CanCollide = true} end
if P[543] then collisionBatch[#collisionBatch+1] = {Part = P[543], CanCollide = true} end
if P[544] then collisionBatch[#collisionBatch+1] = {Part = P[544], CanCollide = true} end
if P[545] then collisionBatch[#collisionBatch+1] = {Part = P[545], CanCollide = true} end
if P[546] then collisionBatch[#collisionBatch+1] = {Part = P[546], CanCollide = true} end
if P[547] then collisionBatch[#collisionBatch+1] = {Part = P[547], CanCollide = true} end
if P[548] then collisionBatch[#collisionBatch+1] = {Part = P[548], CanCollide = true} end
if P[549] then collisionBatch[#collisionBatch+1] = {Part = P[549], CanCollide = true} end
if P[550] then collisionBatch[#collisionBatch+1] = {Part = P[550], CanCollide = true} end
if P[551] then collisionBatch[#collisionBatch+1] = {Part = P[551], CanCollide = true} end
if P[552] then collisionBatch[#collisionBatch+1] = {Part = P[552], CanCollide = true} end
if P[553] then collisionBatch[#collisionBatch+1] = {Part = P[553], CanCollide = true} end
if P[554] then collisionBatch[#collisionBatch+1] = {Part = P[554], CanCollide = true} end
if P[555] then collisionBatch[#collisionBatch+1] = {Part = P[555], CanCollide = true} end
if P[556] then collisionBatch[#collisionBatch+1] = {Part = P[556], CanCollide = true} end
if P[557] then collisionBatch[#collisionBatch+1] = {Part = P[557], CanCollide = true} end
if P[558] then collisionBatch[#collisionBatch+1] = {Part = P[558], CanCollide = true} end
if P[559] then collisionBatch[#collisionBatch+1] = {Part = P[559], CanCollide = true} end
if P[560] then collisionBatch[#collisionBatch+1] = {Part = P[560], CanCollide = true} end
if P[561] then collisionBatch[#collisionBatch+1] = {Part = P[561], CanCollide = true} end
if P[562] then collisionBatch[#collisionBatch+1] = {Part = P[562], CanCollide = true} end
if P[563] then collisionBatch[#collisionBatch+1] = {Part = P[563], CanCollide = true} end
if P[564] then collisionBatch[#collisionBatch+1] = {Part = P[564], CanCollide = true} end
if P[565] then collisionBatch[#collisionBatch+1] = {Part = P[565], CanCollide = true} end
if P[566] then collisionBatch[#collisionBatch+1] = {Part = P[566], CanCollide = true} end
if P[567] then collisionBatch[#collisionBatch+1] = {Part = P[567], CanCollide = true} end
if P[568] then collisionBatch[#collisionBatch+1] = {Part = P[568], CanCollide = true} end
if P[569] then collisionBatch[#collisionBatch+1] = {Part = P[569], CanCollide = true} end
if P[570] then collisionBatch[#collisionBatch+1] = {Part = P[570], CanCollide = true} end
if P[571] then collisionBatch[#collisionBatch+1] = {Part = P[571], CanCollide = true} end
if P[572] then collisionBatch[#collisionBatch+1] = {Part = P[572], CanCollide = true} end
if P[573] then collisionBatch[#collisionBatch+1] = {Part = P[573], CanCollide = true} end
if P[574] then collisionBatch[#collisionBatch+1] = {Part = P[574], CanCollide = true} end
if P[575] then collisionBatch[#collisionBatch+1] = {Part = P[575], CanCollide = true} end
if P[576] then collisionBatch[#collisionBatch+1] = {Part = P[576], CanCollide = true} end
if P[577] then collisionBatch[#collisionBatch+1] = {Part = P[577], CanCollide = true} end
if P[578] then collisionBatch[#collisionBatch+1] = {Part = P[578], CanCollide = true} end
if P[579] then collisionBatch[#collisionBatch+1] = {Part = P[579], CanCollide = true} end
if P[580] then collisionBatch[#collisionBatch+1] = {Part = P[580], CanCollide = true} end
if P[581] then collisionBatch[#collisionBatch+1] = {Part = P[581], CanCollide = true} end
if P[582] then collisionBatch[#collisionBatch+1] = {Part = P[582], CanCollide = true} end
if P[583] then collisionBatch[#collisionBatch+1] = {Part = P[583], CanCollide = true} end
if P[584] then collisionBatch[#collisionBatch+1] = {Part = P[584], CanCollide = true} end
if P[585] then collisionBatch[#collisionBatch+1] = {Part = P[585], CanCollide = true} end
if P[586] then collisionBatch[#collisionBatch+1] = {Part = P[586], CanCollide = true} end
if P[587] then collisionBatch[#collisionBatch+1] = {Part = P[587], CanCollide = true} end
if P[588] then collisionBatch[#collisionBatch+1] = {Part = P[588], CanCollide = true} end
if P[589] then collisionBatch[#collisionBatch+1] = {Part = P[589], CanCollide = true} end
if P[590] then collisionBatch[#collisionBatch+1] = {Part = P[590], CanCollide = true} end
if P[591] then collisionBatch[#collisionBatch+1] = {Part = P[591], CanCollide = true} end
if P[592] then collisionBatch[#collisionBatch+1] = {Part = P[592], CanCollide = true} end
if P[593] then collisionBatch[#collisionBatch+1] = {Part = P[593], CanCollide = true} end
if P[594] then collisionBatch[#collisionBatch+1] = {Part = P[594], CanCollide = true} end
if P[595] then collisionBatch[#collisionBatch+1] = {Part = P[595], CanCollide = true} end
if P[596] then collisionBatch[#collisionBatch+1] = {Part = P[596], CanCollide = true} end
if P[597] then collisionBatch[#collisionBatch+1] = {Part = P[597], CanCollide = true} end
if P[598] then collisionBatch[#collisionBatch+1] = {Part = P[598], CanCollide = true} end
if P[599] then collisionBatch[#collisionBatch+1] = {Part = P[599], CanCollide = true} end
if P[600] then collisionBatch[#collisionBatch+1] = {Part = P[600], CanCollide = true} end
if P[601] then collisionBatch[#collisionBatch+1] = {Part = P[601], CanCollide = true} end
if P[602] then collisionBatch[#collisionBatch+1] = {Part = P[602], CanCollide = true} end
if P[603] then collisionBatch[#collisionBatch+1] = {Part = P[603], CanCollide = true} end
if P[604] then collisionBatch[#collisionBatch+1] = {Part = P[604], CanCollide = true} end
if P[605] then collisionBatch[#collisionBatch+1] = {Part = P[605], CanCollide = true} end
if P[606] then collisionBatch[#collisionBatch+1] = {Part = P[606], CanCollide = true} end
if P[607] then collisionBatch[#collisionBatch+1] = {Part = P[607], CanCollide = true} end
if P[608] then collisionBatch[#collisionBatch+1] = {Part = P[608], CanCollide = true} end
if P[609] then collisionBatch[#collisionBatch+1] = {Part = P[609], CanCollide = true} end
if P[610] then collisionBatch[#collisionBatch+1] = {Part = P[610], CanCollide = true} end
if P[611] then collisionBatch[#collisionBatch+1] = {Part = P[611], CanCollide = true} end
if P[612] then collisionBatch[#collisionBatch+1] = {Part = P[612], CanCollide = true} end
if P[613] then collisionBatch[#collisionBatch+1] = {Part = P[613], CanCollide = true} end
if P[614] then collisionBatch[#collisionBatch+1] = {Part = P[614], CanCollide = true} end
if P[615] then collisionBatch[#collisionBatch+1] = {Part = P[615], CanCollide = true} end
if P[616] then collisionBatch[#collisionBatch+1] = {Part = P[616], CanCollide = true} end
if P[617] then collisionBatch[#collisionBatch+1] = {Part = P[617], CanCollide = true} end
if P[618] then collisionBatch[#collisionBatch+1] = {Part = P[618], CanCollide = true} end
if P[619] then collisionBatch[#collisionBatch+1] = {Part = P[619], CanCollide = true} end
if P[620] then collisionBatch[#collisionBatch+1] = {Part = P[620], CanCollide = true} end
if P[621] then collisionBatch[#collisionBatch+1] = {Part = P[621], CanCollide = true} end
if P[622] then collisionBatch[#collisionBatch+1] = {Part = P[622], CanCollide = true} end
if P[623] then collisionBatch[#collisionBatch+1] = {Part = P[623], CanCollide = true} end
if P[624] then collisionBatch[#collisionBatch+1] = {Part = P[624], CanCollide = true} end
if P[625] then collisionBatch[#collisionBatch+1] = {Part = P[625], CanCollide = true} end
if P[626] then collisionBatch[#collisionBatch+1] = {Part = P[626], CanCollide = true} end
if P[627] then collisionBatch[#collisionBatch+1] = {Part = P[627], CanCollide = true} end
if P[628] then collisionBatch[#collisionBatch+1] = {Part = P[628], CanCollide = true} end
if P[629] then collisionBatch[#collisionBatch+1] = {Part = P[629], CanCollide = true} end
if P[630] then collisionBatch[#collisionBatch+1] = {Part = P[630], CanCollide = true} end
if P[633] then collisionBatch[#collisionBatch+1] = {Part = P[633], CanCollide = true} end
if P[634] then collisionBatch[#collisionBatch+1] = {Part = P[634], CanCollide = true} end
if P[635] then collisionBatch[#collisionBatch+1] = {Part = P[635], CanCollide = true} end
if P[636] then collisionBatch[#collisionBatch+1] = {Part = P[636], CanCollide = true} end
if P[637] then collisionBatch[#collisionBatch+1] = {Part = P[637], CanCollide = true} end
if P[638] then collisionBatch[#collisionBatch+1] = {Part = P[638], CanCollide = true} end
if P[639] then collisionBatch[#collisionBatch+1] = {Part = P[639], CanCollide = true} end
if P[640] then collisionBatch[#collisionBatch+1] = {Part = P[640], CanCollide = true} end
if P[641] then collisionBatch[#collisionBatch+1] = {Part = P[641], CanCollide = true} end
if P[642] then collisionBatch[#collisionBatch+1] = {Part = P[642], CanCollide = true} end
if P[643] then collisionBatch[#collisionBatch+1] = {Part = P[643], CanCollide = true} end
if P[644] then collisionBatch[#collisionBatch+1] = {Part = P[644], CanCollide = true} end
if P[645] then collisionBatch[#collisionBatch+1] = {Part = P[645], CanCollide = true} end
if P[646] then collisionBatch[#collisionBatch+1] = {Part = P[646], CanCollide = true} end
if P[648] then collisionBatch[#collisionBatch+1] = {Part = P[648], CanCollide = true} end
if P[649] then collisionBatch[#collisionBatch+1] = {Part = P[649], CanCollide = true} end
if P[650] then collisionBatch[#collisionBatch+1] = {Part = P[650], CanCollide = true} end
if P[651] then collisionBatch[#collisionBatch+1] = {Part = P[651], CanCollide = true} end
if P[652] then collisionBatch[#collisionBatch+1] = {Part = P[652], CanCollide = true} end
if P[653] then collisionBatch[#collisionBatch+1] = {Part = P[653], CanCollide = true} end
if P[654] then collisionBatch[#collisionBatch+1] = {Part = P[654], CanCollide = true} end
if P[655] then collisionBatch[#collisionBatch+1] = {Part = P[655], CanCollide = true} end
if P[656] then collisionBatch[#collisionBatch+1] = {Part = P[656], CanCollide = true} end
if P[657] then collisionBatch[#collisionBatch+1] = {Part = P[657], CanCollide = true} end
if P[658] then collisionBatch[#collisionBatch+1] = {Part = P[658], CanCollide = true} end
if P[659] then collisionBatch[#collisionBatch+1] = {Part = P[659], CanCollide = true} end
if P[660] then collisionBatch[#collisionBatch+1] = {Part = P[660], CanCollide = true} end
if P[661] then collisionBatch[#collisionBatch+1] = {Part = P[661], CanCollide = true} end
if P[662] then collisionBatch[#collisionBatch+1] = {Part = P[662], CanCollide = true} end
if P[663] then collisionBatch[#collisionBatch+1] = {Part = P[663], CanCollide = true} end
if P[664] then collisionBatch[#collisionBatch+1] = {Part = P[664], CanCollide = true} end
if P[665] then collisionBatch[#collisionBatch+1] = {Part = P[665], CanCollide = true} end
if P[666] then collisionBatch[#collisionBatch+1] = {Part = P[666], CanCollide = true} end
if P[667] then collisionBatch[#collisionBatch+1] = {Part = P[667], CanCollide = true} end
if P[668] then collisionBatch[#collisionBatch+1] = {Part = P[668], CanCollide = true} end
if P[669] then collisionBatch[#collisionBatch+1] = {Part = P[669], CanCollide = true} end
if P[670] then collisionBatch[#collisionBatch+1] = {Part = P[670], CanCollide = true} end
if P[671] then collisionBatch[#collisionBatch+1] = {Part = P[671], CanCollide = true} end
if P[672] then collisionBatch[#collisionBatch+1] = {Part = P[672], CanCollide = true} end
if P[673] then collisionBatch[#collisionBatch+1] = {Part = P[673], CanCollide = true} end
if P[674] then collisionBatch[#collisionBatch+1] = {Part = P[674], CanCollide = true} end
if P[675] then collisionBatch[#collisionBatch+1] = {Part = P[675], CanCollide = true} end
if P[676] then collisionBatch[#collisionBatch+1] = {Part = P[676], CanCollide = true} end
if P[677] then collisionBatch[#collisionBatch+1] = {Part = P[677], CanCollide = true} end
if P[678] then collisionBatch[#collisionBatch+1] = {Part = P[678], CanCollide = true} end
if P[679] then collisionBatch[#collisionBatch+1] = {Part = P[679], CanCollide = true} end
if P[680] then collisionBatch[#collisionBatch+1] = {Part = P[680], CanCollide = true} end
if P[681] then collisionBatch[#collisionBatch+1] = {Part = P[681], CanCollide = true} end
if P[682] then collisionBatch[#collisionBatch+1] = {Part = P[682], CanCollide = true} end
if P[683] then collisionBatch[#collisionBatch+1] = {Part = P[683], CanCollide = true} end
if P[684] then collisionBatch[#collisionBatch+1] = {Part = P[684], CanCollide = true} end
if P[687] then collisionBatch[#collisionBatch+1] = {Part = P[687], CanCollide = true} end
if P[694] then collisionBatch[#collisionBatch+1] = {Part = P[694], CanCollide = true} end
if P[699] then collisionBatch[#collisionBatch+1] = {Part = P[699], CanCollide = true} end
if P[702] then collisionBatch[#collisionBatch+1] = {Part = P[702], CanCollide = true} end
if P[704] then collisionBatch[#collisionBatch+1] = {Part = P[704], CanCollide = true} end
if P[712] then collisionBatch[#collisionBatch+1] = {Part = P[712], CanCollide = true} end
if P[717] then collisionBatch[#collisionBatch+1] = {Part = P[717], CanCollide = true} end
if P[720] then collisionBatch[#collisionBatch+1] = {Part = P[720], CanCollide = true} end
if P[726] then collisionBatch[#collisionBatch+1] = {Part = P[726], CanCollide = true} end
if P[733] then collisionBatch[#collisionBatch+1] = {Part = P[733], CanCollide = true} end
if P[737] then collisionBatch[#collisionBatch+1] = {Part = P[737], CanCollide = true} end
if P[739] then collisionBatch[#collisionBatch+1] = {Part = P[739], CanCollide = true} end
if P[741] then collisionBatch[#collisionBatch+1] = {Part = P[741], CanCollide = true} end
if P[744] then collisionBatch[#collisionBatch+1] = {Part = P[744], CanCollide = true} end
if P[747] then collisionBatch[#collisionBatch+1] = {Part = P[747], CanCollide = true} end
if P[749] then collisionBatch[#collisionBatch+1] = {Part = P[749], CanCollide = true} end
if P[751] then collisionBatch[#collisionBatch+1] = {Part = P[751], CanCollide = true} end
if P[755] then collisionBatch[#collisionBatch+1] = {Part = P[755], CanCollide = true} end
if P[758] then collisionBatch[#collisionBatch+1] = {Part = P[758], CanCollide = true} end
if P[761] then collisionBatch[#collisionBatch+1] = {Part = P[761], CanCollide = true} end
if P[762] then collisionBatch[#collisionBatch+1] = {Part = P[762], CanCollide = true} end
if P[766] then collisionBatch[#collisionBatch+1] = {Part = P[766], CanCollide = true} end
if P[771] then collisionBatch[#collisionBatch+1] = {Part = P[771], CanCollide = true} end
if P[775] then collisionBatch[#collisionBatch+1] = {Part = P[775], CanCollide = true} end
if P[776] then collisionBatch[#collisionBatch+1] = {Part = P[776], CanCollide = true} end
if P[777] then collisionBatch[#collisionBatch+1] = {Part = P[777], CanCollide = true} end
if P[780] then collisionBatch[#collisionBatch+1] = {Part = P[780], CanCollide = true} end
if P[783] then collisionBatch[#collisionBatch+1] = {Part = P[783], CanCollide = true} end
if P[792] then collisionBatch[#collisionBatch+1] = {Part = P[792], CanCollide = true} end
if P[795] then collisionBatch[#collisionBatch+1] = {Part = P[795], CanCollide = true} end
if P[796] then collisionBatch[#collisionBatch+1] = {Part = P[796], CanCollide = true} end
if P[801] then collisionBatch[#collisionBatch+1] = {Part = P[801], CanCollide = true} end
if P[803] then collisionBatch[#collisionBatch+1] = {Part = P[803], CanCollide = true} end
if P[808] then collisionBatch[#collisionBatch+1] = {Part = P[808], CanCollide = true} end
if P[811] then collisionBatch[#collisionBatch+1] = {Part = P[811], CanCollide = true} end
if P[813] then collisionBatch[#collisionBatch+1] = {Part = P[813], CanCollide = true} end
if P[814] then collisionBatch[#collisionBatch+1] = {Part = P[814], CanCollide = true} end
if P[815] then collisionBatch[#collisionBatch+1] = {Part = P[815], CanCollide = true} end
if P[818] then collisionBatch[#collisionBatch+1] = {Part = P[818], CanCollide = true} end
if P[821] then collisionBatch[#collisionBatch+1] = {Part = P[821], CanCollide = true} end
if P[823] then collisionBatch[#collisionBatch+1] = {Part = P[823], CanCollide = true} end
if P[824] then collisionBatch[#collisionBatch+1] = {Part = P[824], CanCollide = true} end
if P[825] then collisionBatch[#collisionBatch+1] = {Part = P[825], CanCollide = true} end
if P[826] then collisionBatch[#collisionBatch+1] = {Part = P[826], CanCollide = true} end
if P[828] then collisionBatch[#collisionBatch+1] = {Part = P[828], CanCollide = true} end
if P[833] then collisionBatch[#collisionBatch+1] = {Part = P[833], CanCollide = true} end
if P[836] then collisionBatch[#collisionBatch+1] = {Part = P[836], CanCollide = true} end
if P[837] then collisionBatch[#collisionBatch+1] = {Part = P[837], CanCollide = true} end
if P[841] then collisionBatch[#collisionBatch+1] = {Part = P[841], CanCollide = true} end
if P[843] then collisionBatch[#collisionBatch+1] = {Part = P[843], CanCollide = true} end
if P[845] then collisionBatch[#collisionBatch+1] = {Part = P[845], CanCollide = true} end
if P[847] then collisionBatch[#collisionBatch+1] = {Part = P[847], CanCollide = true} end
if P[850] then collisionBatch[#collisionBatch+1] = {Part = P[850], CanCollide = true} end
if P[852] then collisionBatch[#collisionBatch+1] = {Part = P[852], CanCollide = true} end
if P[854] then collisionBatch[#collisionBatch+1] = {Part = P[854], CanCollide = true} end
if P[857] then collisionBatch[#collisionBatch+1] = {Part = P[857], CanCollide = true} end
if P[860] then collisionBatch[#collisionBatch+1] = {Part = P[860], CanCollide = true} end
if P[863] then collisionBatch[#collisionBatch+1] = {Part = P[863], CanCollide = true} end
if P[864] then collisionBatch[#collisionBatch+1] = {Part = P[864], CanCollide = true} end
if P[868] then collisionBatch[#collisionBatch+1] = {Part = P[868], CanCollide = true} end
if P[871] then collisionBatch[#collisionBatch+1] = {Part = P[871], CanCollide = true} end
if P[874] then collisionBatch[#collisionBatch+1] = {Part = P[874], CanCollide = true} end
if P[878] then collisionBatch[#collisionBatch+1] = {Part = P[878], CanCollide = true} end
if P[879] then collisionBatch[#collisionBatch+1] = {Part = P[879], CanCollide = true} end
if P[881] then collisionBatch[#collisionBatch+1] = {Part = P[881], CanCollide = true} end
if P[884] then collisionBatch[#collisionBatch+1] = {Part = P[884], CanCollide = true} end
if P[886] then collisionBatch[#collisionBatch+1] = {Part = P[886], CanCollide = true} end
if P[888] then collisionBatch[#collisionBatch+1] = {Part = P[888], CanCollide = true} end
if P[891] then collisionBatch[#collisionBatch+1] = {Part = P[891], CanCollide = true} end
if P[894] then collisionBatch[#collisionBatch+1] = {Part = P[894], CanCollide = true} end
if P[895] then collisionBatch[#collisionBatch+1] = {Part = P[895], CanCollide = true} end
if P[897] then collisionBatch[#collisionBatch+1] = {Part = P[897], CanCollide = true} end
if P[900] then collisionBatch[#collisionBatch+1] = {Part = P[900], CanCollide = true} end
if P[904] then collisionBatch[#collisionBatch+1] = {Part = P[904], CanCollide = true} end
if P[908] then collisionBatch[#collisionBatch+1] = {Part = P[908], CanCollide = true} end
if P[910] then collisionBatch[#collisionBatch+1] = {Part = P[910], CanCollide = true} end
if P[912] then collisionBatch[#collisionBatch+1] = {Part = P[912], CanCollide = true} end
if P[915] then collisionBatch[#collisionBatch+1] = {Part = P[915], CanCollide = true} end
if P[918] then collisionBatch[#collisionBatch+1] = {Part = P[918], CanCollide = true} end
if P[922] then collisionBatch[#collisionBatch+1] = {Part = P[922], CanCollide = true} end
if P[925] then collisionBatch[#collisionBatch+1] = {Part = P[925], CanCollide = true} end
if P[929] then collisionBatch[#collisionBatch+1] = {Part = P[929], CanCollide = true} end
if P[930] then collisionBatch[#collisionBatch+1] = {Part = P[930], CanCollide = true} end
if P[934] then collisionBatch[#collisionBatch+1] = {Part = P[934], CanCollide = true} end
if P[938] then collisionBatch[#collisionBatch+1] = {Part = P[938], CanCollide = true} end
if P[940] then collisionBatch[#collisionBatch+1] = {Part = P[940], CanCollide = true} end
if P[942] then collisionBatch[#collisionBatch+1] = {Part = P[942], CanCollide = true} end
if P[943] then collisionBatch[#collisionBatch+1] = {Part = P[943], CanCollide = true} end
if P[945] then collisionBatch[#collisionBatch+1] = {Part = P[945], CanCollide = true} end
if P[946] then collisionBatch[#collisionBatch+1] = {Part = P[946], CanCollide = true} end
if P[947] then collisionBatch[#collisionBatch+1] = {Part = P[947], CanCollide = true} end
if P[949] then collisionBatch[#collisionBatch+1] = {Part = P[949], CanCollide = true} end
if P[950] then collisionBatch[#collisionBatch+1] = {Part = P[950], CanCollide = true} end
if P[951] then collisionBatch[#collisionBatch+1] = {Part = P[951], CanCollide = true} end
if P[954] then collisionBatch[#collisionBatch+1] = {Part = P[954], CanCollide = true} end
if P[959] then collisionBatch[#collisionBatch+1] = {Part = P[959], CanCollide = true} end
if P[961] then collisionBatch[#collisionBatch+1] = {Part = P[961], CanCollide = true} end
if P[963] then collisionBatch[#collisionBatch+1] = {Part = P[963], CanCollide = true} end
if P[964] then collisionBatch[#collisionBatch+1] = {Part = P[964], CanCollide = true} end
if P[965] then collisionBatch[#collisionBatch+1] = {Part = P[965], CanCollide = true} end
if P[968] then collisionBatch[#collisionBatch+1] = {Part = P[968], CanCollide = true} end
if P[971] then collisionBatch[#collisionBatch+1] = {Part = P[971], CanCollide = true} end
if P[980] then collisionBatch[#collisionBatch+1] = {Part = P[980], CanCollide = true} end
if P[983] then collisionBatch[#collisionBatch+1] = {Part = P[983], CanCollide = true} end
if P[985] then collisionBatch[#collisionBatch+1] = {Part = P[985], CanCollide = true} end
if P[989] then collisionBatch[#collisionBatch+1] = {Part = P[989], CanCollide = true} end
if P[991] then collisionBatch[#collisionBatch+1] = {Part = P[991], CanCollide = true} end
if P[994] then collisionBatch[#collisionBatch+1] = {Part = P[994], CanCollide = true} end
if P[995] then collisionBatch[#collisionBatch+1] = {Part = P[995], CanCollide = true} end
if P[996] then collisionBatch[#collisionBatch+1] = {Part = P[996], CanCollide = true} end
if P[997] then collisionBatch[#collisionBatch+1] = {Part = P[997], CanCollide = true} end
if P[999] then collisionBatch[#collisionBatch+1] = {Part = P[999], CanCollide = true} end
if P[1004] then collisionBatch[#collisionBatch+1] = {Part = P[1004], CanCollide = true} end
if P[1005] then collisionBatch[#collisionBatch+1] = {Part = P[1005], CanCollide = true} end
if P[1015] then collisionBatch[#collisionBatch+1] = {Part = P[1015], CanCollide = true} end
if P[1018] then collisionBatch[#collisionBatch+1] = {Part = P[1018], CanCollide = true} end
if P[1021] then collisionBatch[#collisionBatch+1] = {Part = P[1021], CanCollide = true} end
if P[1023] then collisionBatch[#collisionBatch+1] = {Part = P[1023], CanCollide = true} end
if P[1406] then collisionBatch[#collisionBatch+1] = {Part = P[1406], CanCollide = true} end
if P[1118] then collisionBatch[#collisionBatch+1] = {Part = P[1118], CanCollide = true} end
if P[1615] then collisionBatch[#collisionBatch+1] = {Part = P[1615], CanCollide = true} end
if P[1442] then collisionBatch[#collisionBatch+1] = {Part = P[1442], CanCollide = true} end
if P[1388] then collisionBatch[#collisionBatch+1] = {Part = P[1388], CanCollide = true} end
if P[1334] then collisionBatch[#collisionBatch+1] = {Part = P[1334], CanCollide = true} end
if P[1052] then collisionBatch[#collisionBatch+1] = {Part = P[1052], CanCollide = true} end
if P[1420] then collisionBatch[#collisionBatch+1] = {Part = P[1420], CanCollide = true} end
if P[1196] then collisionBatch[#collisionBatch+1] = {Part = P[1196], CanCollide = true} end
if P[1202] then collisionBatch[#collisionBatch+1] = {Part = P[1202], CanCollide = true} end
if P[1061] then collisionBatch[#collisionBatch+1] = {Part = P[1061], CanCollide = true} end
if P[1407] then collisionBatch[#collisionBatch+1] = {Part = P[1407], CanCollide = true} end
if P[1541] then collisionBatch[#collisionBatch+1] = {Part = P[1541], CanCollide = true} end
if P[1188] then collisionBatch[#collisionBatch+1] = {Part = P[1188], CanCollide = true} end
if P[1381] then collisionBatch[#collisionBatch+1] = {Part = P[1381], CanCollide = true} end
if P[1271] then collisionBatch[#collisionBatch+1] = {Part = P[1271], CanCollide = true} end
if P[1378] then collisionBatch[#collisionBatch+1] = {Part = P[1378], CanCollide = true} end
if P[1053] then collisionBatch[#collisionBatch+1] = {Part = P[1053], CanCollide = true} end
if P[1097] then collisionBatch[#collisionBatch+1] = {Part = P[1097], CanCollide = true} end
if P[1351] then collisionBatch[#collisionBatch+1] = {Part = P[1351], CanCollide = true} end
if P[1166] then collisionBatch[#collisionBatch+1] = {Part = P[1166], CanCollide = true} end
if P[1194] then collisionBatch[#collisionBatch+1] = {Part = P[1194], CanCollide = true} end
if P[1571] then collisionBatch[#collisionBatch+1] = {Part = P[1571], CanCollide = true} end
if P[1045] then collisionBatch[#collisionBatch+1] = {Part = P[1045], CanCollide = true} end
if P[1448] then collisionBatch[#collisionBatch+1] = {Part = P[1448], CanCollide = true} end
if P[1224] then collisionBatch[#collisionBatch+1] = {Part = P[1224], CanCollide = true} end
if P[1290] then collisionBatch[#collisionBatch+1] = {Part = P[1290], CanCollide = true} end
if P[1426] then collisionBatch[#collisionBatch+1] = {Part = P[1426], CanCollide = true} end
if P[1613] then collisionBatch[#collisionBatch+1] = {Part = P[1613], CanCollide = true} end
if P[1369] then collisionBatch[#collisionBatch+1] = {Part = P[1369], CanCollide = true} end
if P[1408] then collisionBatch[#collisionBatch+1] = {Part = P[1408], CanCollide = true} end
if P[1127] then collisionBatch[#collisionBatch+1] = {Part = P[1127], CanCollide = true} end
if P[1389] then collisionBatch[#collisionBatch+1] = {Part = P[1389], CanCollide = true} end
if P[1033] then collisionBatch[#collisionBatch+1] = {Part = P[1033], CanCollide = true} end
if P[1169] then collisionBatch[#collisionBatch+1] = {Part = P[1169], CanCollide = true} end
if P[1624] then collisionBatch[#collisionBatch+1] = {Part = P[1624], CanCollide = true} end
if P[1145] then collisionBatch[#collisionBatch+1] = {Part = P[1145], CanCollide = true} end
if P[1413] then collisionBatch[#collisionBatch+1] = {Part = P[1413], CanCollide = true} end
if P[1275] then collisionBatch[#collisionBatch+1] = {Part = P[1275], CanCollide = true} end
if P[1239] then collisionBatch[#collisionBatch+1] = {Part = P[1239], CanCollide = true} end
if P[1339] then collisionBatch[#collisionBatch+1] = {Part = P[1339], CanCollide = true} end
if P[1044] then collisionBatch[#collisionBatch+1] = {Part = P[1044], CanCollide = true} end
if P[1627] then collisionBatch[#collisionBatch+1] = {Part = P[1627], CanCollide = true} end
if P[1581] then collisionBatch[#collisionBatch+1] = {Part = P[1581], CanCollide = true} end
if P[1633] then collisionBatch[#collisionBatch+1] = {Part = P[1633], CanCollide = true} end
if P[1404] then collisionBatch[#collisionBatch+1] = {Part = P[1404], CanCollide = true} end
if P[1479] then collisionBatch[#collisionBatch+1] = {Part = P[1479], CanCollide = true} end
if P[1113] then collisionBatch[#collisionBatch+1] = {Part = P[1113], CanCollide = true} end
if P[1232] then collisionBatch[#collisionBatch+1] = {Part = P[1232], CanCollide = true} end
if P[1089] then collisionBatch[#collisionBatch+1] = {Part = P[1089], CanCollide = true} end
if P[1103] then collisionBatch[#collisionBatch+1] = {Part = P[1103], CanCollide = true} end
if P[1595] then collisionBatch[#collisionBatch+1] = {Part = P[1595], CanCollide = true} end
if P[1392] then collisionBatch[#collisionBatch+1] = {Part = P[1392], CanCollide = true} end
if P[1223] then collisionBatch[#collisionBatch+1] = {Part = P[1223], CanCollide = true} end
if P[1250] then collisionBatch[#collisionBatch+1] = {Part = P[1250], CanCollide = true} end
if P[1618] then collisionBatch[#collisionBatch+1] = {Part = P[1618], CanCollide = true} end
if P[1477] then collisionBatch[#collisionBatch+1] = {Part = P[1477], CanCollide = true} end
if P[1209] then collisionBatch[#collisionBatch+1] = {Part = P[1209], CanCollide = true} end
if P[1056] then collisionBatch[#collisionBatch+1] = {Part = P[1056], CanCollide = true} end
if P[1549] then collisionBatch[#collisionBatch+1] = {Part = P[1549], CanCollide = true} end
if P[1514] then collisionBatch[#collisionBatch+1] = {Part = P[1514], CanCollide = true} end
if P[1480] then collisionBatch[#collisionBatch+1] = {Part = P[1480], CanCollide = true} end
if P[1036] then collisionBatch[#collisionBatch+1] = {Part = P[1036], CanCollide = true} end
if P[1295] then collisionBatch[#collisionBatch+1] = {Part = P[1295], CanCollide = true} end
if P[1428] then collisionBatch[#collisionBatch+1] = {Part = P[1428], CanCollide = false} end
if P[1076] then collisionBatch[#collisionBatch+1] = {Part = P[1076], CanCollide = true} end
if P[1410] then collisionBatch[#collisionBatch+1] = {Part = P[1410], CanCollide = true} end
if P[1280] then collisionBatch[#collisionBatch+1] = {Part = P[1280], CanCollide = true} end
if P[1107] then collisionBatch[#collisionBatch+1] = {Part = P[1107], CanCollide = true} end
if P[1059] then collisionBatch[#collisionBatch+1] = {Part = P[1059], CanCollide = true} end
if P[1139] then collisionBatch[#collisionBatch+1] = {Part = P[1139], CanCollide = true} end
if P[1591] then collisionBatch[#collisionBatch+1] = {Part = P[1591], CanCollide = true} end
if P[1178] then collisionBatch[#collisionBatch+1] = {Part = P[1178], CanCollide = true} end
if P[1327] then collisionBatch[#collisionBatch+1] = {Part = P[1327], CanCollide = true} end
if P[1190] then collisionBatch[#collisionBatch+1] = {Part = P[1190], CanCollide = true} end
if P[1636] then collisionBatch[#collisionBatch+1] = {Part = P[1636], CanCollide = true} end
if P[1472] then collisionBatch[#collisionBatch+1] = {Part = P[1472], CanCollide = true} end
if P[1368] then collisionBatch[#collisionBatch+1] = {Part = P[1368], CanCollide = true} end
if P[1289] then collisionBatch[#collisionBatch+1] = {Part = P[1289], CanCollide = true} end
if P[1158] then collisionBatch[#collisionBatch+1] = {Part = P[1158], CanCollide = true} end
if P[1536] then collisionBatch[#collisionBatch+1] = {Part = P[1536], CanCollide = true} end
if P[1566] then collisionBatch[#collisionBatch+1] = {Part = P[1566], CanCollide = true} end
if P[1206] then collisionBatch[#collisionBatch+1] = {Part = P[1206], CanCollide = true} end
if P[1593] then collisionBatch[#collisionBatch+1] = {Part = P[1593], CanCollide = true} end
if P[1600] then collisionBatch[#collisionBatch+1] = {Part = P[1600], CanCollide = true} end
if P[1487] then collisionBatch[#collisionBatch+1] = {Part = P[1487], CanCollide = true} end
if P[1538] then collisionBatch[#collisionBatch+1] = {Part = P[1538], CanCollide = true} end
if P[1283] then collisionBatch[#collisionBatch+1] = {Part = P[1283], CanCollide = true} end
if P[1469] then collisionBatch[#collisionBatch+1] = {Part = P[1469], CanCollide = true} end
if P[1359] then collisionBatch[#collisionBatch+1] = {Part = P[1359], CanCollide = true} end
if P[1445] then collisionBatch[#collisionBatch+1] = {Part = P[1445], CanCollide = true} end
if P[1182] then collisionBatch[#collisionBatch+1] = {Part = P[1182], CanCollide = true} end
if P[1425] then collisionBatch[#collisionBatch+1] = {Part = P[1425], CanCollide = false} end
if P[1163] then collisionBatch[#collisionBatch+1] = {Part = P[1163], CanCollide = true} end
if P[1612] then collisionBatch[#collisionBatch+1] = {Part = P[1612], CanCollide = true} end
if P[1248] then collisionBatch[#collisionBatch+1] = {Part = P[1248], CanCollide = true} end
if P[1575] then collisionBatch[#collisionBatch+1] = {Part = P[1575], CanCollide = true} end
if P[1205] then collisionBatch[#collisionBatch+1] = {Part = P[1205], CanCollide = true} end
if P[1181] then collisionBatch[#collisionBatch+1] = {Part = P[1181], CanCollide = true} end
if P[1511] then collisionBatch[#collisionBatch+1] = {Part = P[1511], CanCollide = true} end
if P[1092] then collisionBatch[#collisionBatch+1] = {Part = P[1092], CanCollide = true} end
if P[1185] then collisionBatch[#collisionBatch+1] = {Part = P[1185], CanCollide = true} end
if P[1320] then collisionBatch[#collisionBatch+1] = {Part = P[1320], CanCollide = true} end
if P[1233] then collisionBatch[#collisionBatch+1] = {Part = P[1233], CanCollide = true} end
if P[1104] then collisionBatch[#collisionBatch+1] = {Part = P[1104], CanCollide = true} end
if P[1602] then collisionBatch[#collisionBatch+1] = {Part = P[1602], CanCollide = true} end
if P[1414] then collisionBatch[#collisionBatch+1] = {Part = P[1414], CanCollide = true} end
if P[1520] then collisionBatch[#collisionBatch+1] = {Part = P[1520], CanCollide = false} end
if P[1569] then collisionBatch[#collisionBatch+1] = {Part = P[1569], CanCollide = true} end
if P[1137] then collisionBatch[#collisionBatch+1] = {Part = P[1137], CanCollide = true} end
if P[1314] then collisionBatch[#collisionBatch+1] = {Part = P[1314], CanCollide = true} end
if P[1286] then collisionBatch[#collisionBatch+1] = {Part = P[1286], CanCollide = true} end
if P[1152] then collisionBatch[#collisionBatch+1] = {Part = P[1152], CanCollide = true} end
if P[1245] then collisionBatch[#collisionBatch+1] = {Part = P[1245], CanCollide = true} end
if P[1128] then collisionBatch[#collisionBatch+1] = {Part = P[1128], CanCollide = true} end
if P[1146] then collisionBatch[#collisionBatch+1] = {Part = P[1146], CanCollide = true} end
if P[1465] then collisionBatch[#collisionBatch+1] = {Part = P[1465], CanCollide = true} end
if P[1489] then collisionBatch[#collisionBatch+1] = {Part = P[1489], CanCollide = true} end
if P[1399] then collisionBatch[#collisionBatch+1] = {Part = P[1399], CanCollide = true} end
if P[1512] then collisionBatch[#collisionBatch+1] = {Part = P[1512], CanCollide = true} end
if P[1379] then collisionBatch[#collisionBatch+1] = {Part = P[1379], CanCollide = true} end
if P[1496] then collisionBatch[#collisionBatch+1] = {Part = P[1496], CanCollide = true} end
if P[1463] then collisionBatch[#collisionBatch+1] = {Part = P[1463], CanCollide = true} end
if P[1495] then collisionBatch[#collisionBatch+1] = {Part = P[1495], CanCollide = true} end
if P[1304] then collisionBatch[#collisionBatch+1] = {Part = P[1304], CanCollide = true} end
if P[1083] then collisionBatch[#collisionBatch+1] = {Part = P[1083], CanCollide = true} end
if P[1651] then collisionBatch[#collisionBatch+1] = {Part = P[1651], CanCollide = true} end
if P[1649] then collisionBatch[#collisionBatch+1] = {Part = P[1649], CanCollide = true} end
if P[1648] then collisionBatch[#collisionBatch+1] = {Part = P[1648], CanCollide = true} end
if P[1063] then collisionBatch[#collisionBatch+1] = {Part = P[1063], CanCollide = true} end
if P[1635] then collisionBatch[#collisionBatch+1] = {Part = P[1635], CanCollide = true} end
if P[1645] then collisionBatch[#collisionBatch+1] = {Part = P[1645], CanCollide = true} end
if P[1643] then collisionBatch[#collisionBatch+1] = {Part = P[1643], CanCollide = true} end
if P[1364] then collisionBatch[#collisionBatch+1] = {Part = P[1364], CanCollide = true} end
if P[1641] then collisionBatch[#collisionBatch+1] = {Part = P[1641], CanCollide = true} end
if P[1640] then collisionBatch[#collisionBatch+1] = {Part = P[1640], CanCollide = true} end
if P[1558] then collisionBatch[#collisionBatch+1] = {Part = P[1558], CanCollide = true} end
if P[1638] then collisionBatch[#collisionBatch+1] = {Part = P[1638], CanCollide = true} end
if P[1446] then collisionBatch[#collisionBatch+1] = {Part = P[1446], CanCollide = true} end
if P[1494] then collisionBatch[#collisionBatch+1] = {Part = P[1494], CanCollide = true} end
if P[1647] then collisionBatch[#collisionBatch+1] = {Part = P[1647], CanCollide = true} end
if P[1631] then collisionBatch[#collisionBatch+1] = {Part = P[1631], CanCollide = true} end
if P[1236] then collisionBatch[#collisionBatch+1] = {Part = P[1236], CanCollide = true} end
if P[1048] then collisionBatch[#collisionBatch+1] = {Part = P[1048], CanCollide = true} end
if P[1515] then collisionBatch[#collisionBatch+1] = {Part = P[1515], CanCollide = true} end
if P[1242] then collisionBatch[#collisionBatch+1] = {Part = P[1242], CanCollide = true} end
if P[1504] then collisionBatch[#collisionBatch+1] = {Part = P[1504], CanCollide = true} end
if P[1346] then collisionBatch[#collisionBatch+1] = {Part = P[1346], CanCollide = false} end
if P[1632] then collisionBatch[#collisionBatch+1] = {Part = P[1632], CanCollide = true} end
if P[1218] then collisionBatch[#collisionBatch+1] = {Part = P[1218], CanCollide = true} end
if P[1626] then collisionBatch[#collisionBatch+1] = {Part = P[1626], CanCollide = true} end
if P[1630] then collisionBatch[#collisionBatch+1] = {Part = P[1630], CanCollide = true} end
if P[1197] then collisionBatch[#collisionBatch+1] = {Part = P[1197], CanCollide = true} end
if P[1230] then collisionBatch[#collisionBatch+1] = {Part = P[1230], CanCollide = true} end
if P[1151] then collisionBatch[#collisionBatch+1] = {Part = P[1151], CanCollide = true} end
if P[1136] then collisionBatch[#collisionBatch+1] = {Part = P[1136], CanCollide = true} end
if P[1405] then collisionBatch[#collisionBatch+1] = {Part = P[1405], CanCollide = true} end
if P[1220] then collisionBatch[#collisionBatch+1] = {Part = P[1220], CanCollide = true} end
if P[1491] then collisionBatch[#collisionBatch+1] = {Part = P[1491], CanCollide = true} end
if P[1625] then collisionBatch[#collisionBatch+1] = {Part = P[1625], CanCollide = true} end
if P[1623] then collisionBatch[#collisionBatch+1] = {Part = P[1623], CanCollide = true} end
if P[1622] then collisionBatch[#collisionBatch+1] = {Part = P[1622], CanCollide = true} end
if P[1121] then collisionBatch[#collisionBatch+1] = {Part = P[1121], CanCollide = true} end
if P[1621] then collisionBatch[#collisionBatch+1] = {Part = P[1621], CanCollide = true} end
if P[1411] then collisionBatch[#collisionBatch+1] = {Part = P[1411], CanCollide = true} end
if P[1583] then collisionBatch[#collisionBatch+1] = {Part = P[1583], CanCollide = true} end
if P[1553] then collisionBatch[#collisionBatch+1] = {Part = P[1553], CanCollide = true} end
if P[1617] then collisionBatch[#collisionBatch+1] = {Part = P[1617], CanCollide = true} end
if P[1619] then collisionBatch[#collisionBatch+1] = {Part = P[1619], CanCollide = true} end
if P[1278] then collisionBatch[#collisionBatch+1] = {Part = P[1278], CanCollide = true} end
if P[1614] then collisionBatch[#collisionBatch+1] = {Part = P[1614], CanCollide = true} end
if P[1254] then collisionBatch[#collisionBatch+1] = {Part = P[1254], CanCollide = true} end
if P[1259] then collisionBatch[#collisionBatch+1] = {Part = P[1259], CanCollide = true} end
if P[1449] then collisionBatch[#collisionBatch+1] = {Part = P[1449], CanCollide = true} end
if P[1458] then collisionBatch[#collisionBatch+1] = {Part = P[1458], CanCollide = true} end
if P[1453] then collisionBatch[#collisionBatch+1] = {Part = P[1453], CanCollide = true} end
if P[1106] then collisionBatch[#collisionBatch+1] = {Part = P[1106], CanCollide = true} end
if P[1323] then collisionBatch[#collisionBatch+1] = {Part = P[1323], CanCollide = true} end
if P[1082] then collisionBatch[#collisionBatch+1] = {Part = P[1082], CanCollide = true} end
if P[1429] then collisionBatch[#collisionBatch+1] = {Part = P[1429], CanCollide = false} end
if P[1452] then collisionBatch[#collisionBatch+1] = {Part = P[1452], CanCollide = true} end
if P[1505] then collisionBatch[#collisionBatch+1] = {Part = P[1505], CanCollide = true} end
if P[1611] then collisionBatch[#collisionBatch+1] = {Part = P[1611], CanCollide = true} end
if P[1172] then collisionBatch[#collisionBatch+1] = {Part = P[1172], CanCollide = true} end
if P[1608] then collisionBatch[#collisionBatch+1] = {Part = P[1608], CanCollide = true} end
if P[1606] then collisionBatch[#collisionBatch+1] = {Part = P[1606], CanCollide = true} end
if P[1244] then collisionBatch[#collisionBatch+1] = {Part = P[1244], CanCollide = true} end
if P[1409] then collisionBatch[#collisionBatch+1] = {Part = P[1409], CanCollide = true} end
if P[1478] then collisionBatch[#collisionBatch+1] = {Part = P[1478], CanCollide = true} end
if P[1545] then collisionBatch[#collisionBatch+1] = {Part = P[1545], CanCollide = true} end
if P[1599] then collisionBatch[#collisionBatch+1] = {Part = P[1599], CanCollide = true} end
if P[1597] then collisionBatch[#collisionBatch+1] = {Part = P[1597], CanCollide = true} end
if P[1365] then collisionBatch[#collisionBatch+1] = {Part = P[1365], CanCollide = true} end
if P[1043] then collisionBatch[#collisionBatch+1] = {Part = P[1043], CanCollide = true} end
if P[1241] then collisionBatch[#collisionBatch+1] = {Part = P[1241], CanCollide = true} end
if P[1227] then collisionBatch[#collisionBatch+1] = {Part = P[1227], CanCollide = true} end
if P[1589] then collisionBatch[#collisionBatch+1] = {Part = P[1589], CanCollide = true} end
if P[1360] then collisionBatch[#collisionBatch+1] = {Part = P[1360], CanCollide = true} end
if P[1308] then collisionBatch[#collisionBatch+1] = {Part = P[1308], CanCollide = true} end
if P[1217] then collisionBatch[#collisionBatch+1] = {Part = P[1217], CanCollide = true} end
if P[1372] then collisionBatch[#collisionBatch+1] = {Part = P[1372], CanCollide = true} end
if P[1193] then collisionBatch[#collisionBatch+1] = {Part = P[1193], CanCollide = true} end
if P[1578] then collisionBatch[#collisionBatch+1] = {Part = P[1578], CanCollide = true} end
if P[1444] then collisionBatch[#collisionBatch+1] = {Part = P[1444], CanCollide = true} end
if P[1585] then collisionBatch[#collisionBatch+1] = {Part = P[1585], CanCollide = true} end
if P[1403] then collisionBatch[#collisionBatch+1] = {Part = P[1403], CanCollide = true} end
if P[1451] then collisionBatch[#collisionBatch+1] = {Part = P[1451], CanCollide = true} end
if P[1094] then collisionBatch[#collisionBatch+1] = {Part = P[1094], CanCollide = true} end
if P[1573] then collisionBatch[#collisionBatch+1] = {Part = P[1573], CanCollide = true} end
if P[1098] then collisionBatch[#collisionBatch+1] = {Part = P[1098], CanCollide = true} end
if P[1564] then collisionBatch[#collisionBatch+1] = {Part = P[1564], CanCollide = true} end
if P[1208] then collisionBatch[#collisionBatch+1] = {Part = P[1208], CanCollide = true} end
if P[1355] then collisionBatch[#collisionBatch+1] = {Part = P[1355], CanCollide = true} end
if P[1562] then collisionBatch[#collisionBatch+1] = {Part = P[1562], CanCollide = true} end
if P[1560] then collisionBatch[#collisionBatch+1] = {Part = P[1560], CanCollide = true} end
if P[1509] then collisionBatch[#collisionBatch+1] = {Part = P[1509], CanCollide = true} end
if P[1557] then collisionBatch[#collisionBatch+1] = {Part = P[1557], CanCollide = true} end
if P[1432] then collisionBatch[#collisionBatch+1] = {Part = P[1432], CanCollide = false} end
if P[1555] then collisionBatch[#collisionBatch+1] = {Part = P[1555], CanCollide = true} end
if P[1616] then collisionBatch[#collisionBatch+1] = {Part = P[1616], CanCollide = true} end
if P[1551] then collisionBatch[#collisionBatch+1] = {Part = P[1551], CanCollide = true} end
if P[1256] then collisionBatch[#collisionBatch+1] = {Part = P[1256], CanCollide = true} end
if P[1447] then collisionBatch[#collisionBatch+1] = {Part = P[1447], CanCollide = true} end
if P[1402] then collisionBatch[#collisionBatch+1] = {Part = P[1402], CanCollide = true} end
if P[1604] then collisionBatch[#collisionBatch+1] = {Part = P[1604], CanCollide = true} end
if P[1229] then collisionBatch[#collisionBatch+1] = {Part = P[1229], CanCollide = true} end
if P[1125] then collisionBatch[#collisionBatch+1] = {Part = P[1125], CanCollide = true} end
if P[1303] then collisionBatch[#collisionBatch+1] = {Part = P[1303], CanCollide = true} end
if P[1534] then collisionBatch[#collisionBatch+1] = {Part = P[1534], CanCollide = true} end
if P[1533] then collisionBatch[#collisionBatch+1] = {Part = P[1533], CanCollide = true} end
if P[1497] then collisionBatch[#collisionBatch+1] = {Part = P[1497], CanCollide = true} end
if P[1475] then collisionBatch[#collisionBatch+1] = {Part = P[1475], CanCollide = true} end
if P[1031] then collisionBatch[#collisionBatch+1] = {Part = P[1031], CanCollide = true} end
if P[1529] then collisionBatch[#collisionBatch+1] = {Part = P[1529], CanCollide = true} end
if P[1527] then collisionBatch[#collisionBatch+1] = {Part = P[1527], CanCollide = true} end
if P[1349] then collisionBatch[#collisionBatch+1] = {Part = P[1349], CanCollide = true} end
if P[1115] then collisionBatch[#collisionBatch+1] = {Part = P[1115], CanCollide = true} end
if P[1524] then collisionBatch[#collisionBatch+1] = {Part = P[1524], CanCollide = true} end
if P[1085] then collisionBatch[#collisionBatch+1] = {Part = P[1085], CanCollide = true} end
if P[1523] then collisionBatch[#collisionBatch+1] = {Part = P[1523], CanCollide = true} end
if P[1086] then collisionBatch[#collisionBatch+1] = {Part = P[1086], CanCollide = true} end
if P[1522] then collisionBatch[#collisionBatch+1] = {Part = P[1522], CanCollide = true} end
if P[1517] then collisionBatch[#collisionBatch+1] = {Part = P[1517], CanCollide = true} end
if P[1507] then collisionBatch[#collisionBatch+1] = {Part = P[1507], CanCollide = true} end
if P[1634] then collisionBatch[#collisionBatch+1] = {Part = P[1634], CanCollide = true} end
if P[1513] then collisionBatch[#collisionBatch+1] = {Part = P[1513], CanCollide = true} end
if P[1164] then collisionBatch[#collisionBatch+1] = {Part = P[1164], CanCollide = true} end
if P[1490] then collisionBatch[#collisionBatch+1] = {Part = P[1490], CanCollide = true} end
if P[1170] then collisionBatch[#collisionBatch+1] = {Part = P[1170], CanCollide = true} end
if P[1510] then collisionBatch[#collisionBatch+1] = {Part = P[1510], CanCollide = true} end
if P[1503] then collisionBatch[#collisionBatch+1] = {Part = P[1503], CanCollide = true} end
if P[1109] then collisionBatch[#collisionBatch+1] = {Part = P[1109], CanCollide = true} end
if P[1415] then collisionBatch[#collisionBatch+1] = {Part = P[1415], CanCollide = true} end
if P[1377] then collisionBatch[#collisionBatch+1] = {Part = P[1377], CanCollide = true} end
if P[1221] then collisionBatch[#collisionBatch+1] = {Part = P[1221], CanCollide = true} end
if P[1516] then collisionBatch[#collisionBatch+1] = {Part = P[1516], CanCollide = true} end
if P[1506] then collisionBatch[#collisionBatch+1] = {Part = P[1506], CanCollide = true} end
if P[1502] then collisionBatch[#collisionBatch+1] = {Part = P[1502], CanCollide = true} end
if P[1386] then collisionBatch[#collisionBatch+1] = {Part = P[1386], CanCollide = true} end
if P[1390] then collisionBatch[#collisionBatch+1] = {Part = P[1390], CanCollide = true} end
if P[1501] then collisionBatch[#collisionBatch+1] = {Part = P[1501], CanCollide = true} end
if P[1154] then collisionBatch[#collisionBatch+1] = {Part = P[1154], CanCollide = true} end
if P[1500] then collisionBatch[#collisionBatch+1] = {Part = P[1500], CanCollide = true} end
if P[1130] then collisionBatch[#collisionBatch+1] = {Part = P[1130], CanCollide = true} end
if P[1354] then collisionBatch[#collisionBatch+1] = {Part = P[1354], CanCollide = true} end
if P[1361] then collisionBatch[#collisionBatch+1] = {Part = P[1361], CanCollide = true} end
if P[1460] then collisionBatch[#collisionBatch+1] = {Part = P[1460], CanCollide = true} end
if P[1462] then collisionBatch[#collisionBatch+1] = {Part = P[1462], CanCollide = true} end
if P[1266] then collisionBatch[#collisionBatch+1] = {Part = P[1266], CanCollide = true} end
if P[1531] then collisionBatch[#collisionBatch+1] = {Part = P[1531], CanCollide = true} end
if P[1637] then collisionBatch[#collisionBatch+1] = {Part = P[1637], CanCollide = true} end
if P[1380] then collisionBatch[#collisionBatch+1] = {Part = P[1380], CanCollide = true} end
if P[1387] then collisionBatch[#collisionBatch+1] = {Part = P[1387], CanCollide = true} end
if P[1493] then collisionBatch[#collisionBatch+1] = {Part = P[1493], CanCollide = true} end
if P[1382] then collisionBatch[#collisionBatch+1] = {Part = P[1382], CanCollide = true} end
if P[1300] then collisionBatch[#collisionBatch+1] = {Part = P[1300], CanCollide = true} end
if P[1459] then collisionBatch[#collisionBatch+1] = {Part = P[1459], CanCollide = true} end
if P[1488] then collisionBatch[#collisionBatch+1] = {Part = P[1488], CanCollide = true} end
if P[1257] then collisionBatch[#collisionBatch+1] = {Part = P[1257], CanCollide = true} end
if P[1486] then collisionBatch[#collisionBatch+1] = {Part = P[1486], CanCollide = true} end
if P[1485] then collisionBatch[#collisionBatch+1] = {Part = P[1485], CanCollide = true} end
if P[1149] then collisionBatch[#collisionBatch+1] = {Part = P[1149], CanCollide = true} end
if P[1483] then collisionBatch[#collisionBatch+1] = {Part = P[1483], CanCollide = true} end
if P[1260] then collisionBatch[#collisionBatch+1] = {Part = P[1260], CanCollide = true} end
if P[1455] then collisionBatch[#collisionBatch+1] = {Part = P[1455], CanCollide = true} end
if P[1481] then collisionBatch[#collisionBatch+1] = {Part = P[1481], CanCollide = true} end
if P[1143] then collisionBatch[#collisionBatch+1] = {Part = P[1143], CanCollide = true} end
if P[1476] then collisionBatch[#collisionBatch+1] = {Part = P[1476], CanCollide = true} end
if P[1344] then collisionBatch[#collisionBatch+1] = {Part = P[1344], CanCollide = true} end
if P[1110] then collisionBatch[#collisionBatch+1] = {Part = P[1110], CanCollide = true} end
if P[1091] then collisionBatch[#collisionBatch+1] = {Part = P[1091], CanCollide = true} end
if P[1471] then collisionBatch[#collisionBatch+1] = {Part = P[1471], CanCollide = true} end
if P[1470] then collisionBatch[#collisionBatch+1] = {Part = P[1470], CanCollide = true} end
if P[1468] then collisionBatch[#collisionBatch+1] = {Part = P[1468], CanCollide = true} end
if P[1467] then collisionBatch[#collisionBatch+1] = {Part = P[1467], CanCollide = true} end
if P[1313] then collisionBatch[#collisionBatch+1] = {Part = P[1313], CanCollide = true} end
if P[1466] then collisionBatch[#collisionBatch+1] = {Part = P[1466], CanCollide = true} end
if P[1265] then collisionBatch[#collisionBatch+1] = {Part = P[1265], CanCollide = true} end
if P[1148] then collisionBatch[#collisionBatch+1] = {Part = P[1148], CanCollide = true} end
if P[1397] then collisionBatch[#collisionBatch+1] = {Part = P[1397], CanCollide = true} end
if P[1095] then collisionBatch[#collisionBatch+1] = {Part = P[1095], CanCollide = true} end
if P[1464] then collisionBatch[#collisionBatch+1] = {Part = P[1464], CanCollide = true} end
if P[1498] then collisionBatch[#collisionBatch+1] = {Part = P[1498], CanCollide = true} end
if P[1211] then collisionBatch[#collisionBatch+1] = {Part = P[1211], CanCollide = true} end
if P[1461] then collisionBatch[#collisionBatch+1] = {Part = P[1461], CanCollide = true} end
if P[1457] then collisionBatch[#collisionBatch+1] = {Part = P[1457], CanCollide = true} end
if P[1456] then collisionBatch[#collisionBatch+1] = {Part = P[1456], CanCollide = true} end
if P[1311] then collisionBatch[#collisionBatch+1] = {Part = P[1311], CanCollide = true} end
if P[1484] then collisionBatch[#collisionBatch+1] = {Part = P[1484], CanCollide = true} end
if P[1482] then collisionBatch[#collisionBatch+1] = {Part = P[1482], CanCollide = true} end
if P[1277] then collisionBatch[#collisionBatch+1] = {Part = P[1277], CanCollide = true} end
if P[1454] then collisionBatch[#collisionBatch+1] = {Part = P[1454], CanCollide = true} end
if P[1450] then collisionBatch[#collisionBatch+1] = {Part = P[1450], CanCollide = true} end
if P[1142] then collisionBatch[#collisionBatch+1] = {Part = P[1142], CanCollide = true} end
if P[1443] then collisionBatch[#collisionBatch+1] = {Part = P[1443], CanCollide = true} end
if P[1543] then collisionBatch[#collisionBatch+1] = {Part = P[1543], CanCollide = true} end
if P[1235] then collisionBatch[#collisionBatch+1] = {Part = P[1235], CanCollide = true} end
if P[1547] then collisionBatch[#collisionBatch+1] = {Part = P[1547], CanCollide = true} end
if P[1287] then collisionBatch[#collisionBatch+1] = {Part = P[1287], CanCollide = true} end
if P[1079] then collisionBatch[#collisionBatch+1] = {Part = P[1079], CanCollide = true} end
if P[1580] then collisionBatch[#collisionBatch+1] = {Part = P[1580], CanCollide = true} end
if P[1124] then collisionBatch[#collisionBatch+1] = {Part = P[1124], CanCollide = true} end
if P[1441] then collisionBatch[#collisionBatch+1] = {Part = P[1441], CanCollide = true} end
if P[1435] then collisionBatch[#collisionBatch+1] = {Part = P[1435], CanCollide = true} end
if P[1262] then collisionBatch[#collisionBatch+1] = {Part = P[1262], CanCollide = true} end
if P[1134] then collisionBatch[#collisionBatch+1] = {Part = P[1134], CanCollide = true} end
if P[1199] then collisionBatch[#collisionBatch+1] = {Part = P[1199], CanCollide = true} end
if P[1187] then collisionBatch[#collisionBatch+1] = {Part = P[1187], CanCollide = true} end
if P[1176] then collisionBatch[#collisionBatch+1] = {Part = P[1176], CanCollide = true} end
if P[1133] then collisionBatch[#collisionBatch+1] = {Part = P[1133], CanCollide = true} end
if P[1027] then collisionBatch[#collisionBatch+1] = {Part = P[1027], CanCollide = true} end
if P[1100] then collisionBatch[#collisionBatch+1] = {Part = P[1100], CanCollide = true} end
if P[1391] then collisionBatch[#collisionBatch+1] = {Part = P[1391], CanCollide = true} end
if P[1251] then collisionBatch[#collisionBatch+1] = {Part = P[1251], CanCollide = true} end
if P[1412] then collisionBatch[#collisionBatch+1] = {Part = P[1412], CanCollide = true} end
if P[1508] then collisionBatch[#collisionBatch+1] = {Part = P[1508], CanCollide = true} end
if P[1200] then collisionBatch[#collisionBatch+1] = {Part = P[1200], CanCollide = true} end
if P[1366] then collisionBatch[#collisionBatch+1] = {Part = P[1366], CanCollide = true} end
if P[1424] then collisionBatch[#collisionBatch+1] = {Part = P[1424], CanCollide = false} end
if P[1263] then collisionBatch[#collisionBatch+1] = {Part = P[1263], CanCollide = true} end
if P[1253] then collisionBatch[#collisionBatch+1] = {Part = P[1253], CanCollide = true} end
if P[1474] then collisionBatch[#collisionBatch+1] = {Part = P[1474], CanCollide = true} end
if P[1272] then collisionBatch[#collisionBatch+1] = {Part = P[1272], CanCollide = true} end
if P[1175] then collisionBatch[#collisionBatch+1] = {Part = P[1175], CanCollide = true} end
if P[1116] then collisionBatch[#collisionBatch+1] = {Part = P[1116], CanCollide = true} end
if P[1576] then collisionBatch[#collisionBatch+1] = {Part = P[1576], CanCollide = true} end
if P[1101] then collisionBatch[#collisionBatch+1] = {Part = P[1101], CanCollide = true} end
if P[1398] then collisionBatch[#collisionBatch+1] = {Part = P[1398], CanCollide = true} end
if P[1214] then collisionBatch[#collisionBatch+1] = {Part = P[1214], CanCollide = true} end
if P[1157] then collisionBatch[#collisionBatch+1] = {Part = P[1157], CanCollide = true} end
if P[1587] then collisionBatch[#collisionBatch+1] = {Part = P[1587], CanCollide = true} end
if P[1356] then collisionBatch[#collisionBatch+1] = {Part = P[1356], CanCollide = true} end
if P[1161] then collisionBatch[#collisionBatch+1] = {Part = P[1161], CanCollide = true} end
if P[1203] then collisionBatch[#collisionBatch+1] = {Part = P[1203], CanCollide = true} end
if P[1088] then collisionBatch[#collisionBatch+1] = {Part = P[1088], CanCollide = true} end
if P[1384] then collisionBatch[#collisionBatch+1] = {Part = P[1384], CanCollide = true} end
if P[1281] then collisionBatch[#collisionBatch+1] = {Part = P[1281], CanCollide = true} end
if P[1069] then collisionBatch[#collisionBatch+1] = {Part = P[1069], CanCollide = true} end
if P[1383] then collisionBatch[#collisionBatch+1] = {Part = P[1383], CanCollide = true} end
if P[1492] then collisionBatch[#collisionBatch+1] = {Part = P[1492], CanCollide = true} end
if P[1629] then collisionBatch[#collisionBatch+1] = {Part = P[1629], CanCollide = true} end
if P[1131] then collisionBatch[#collisionBatch+1] = {Part = P[1131], CanCollide = true} end
if P[1155] then collisionBatch[#collisionBatch+1] = {Part = P[1155], CanCollide = true} end
if P[1274] then collisionBatch[#collisionBatch+1] = {Part = P[1274], CanCollide = true} end
if P[1226] then collisionBatch[#collisionBatch+1] = {Part = P[1226], CanCollide = true} end
if P[1212] then collisionBatch[#collisionBatch+1] = {Part = P[1212], CanCollide = true} end
if P[1357] then collisionBatch[#collisionBatch+1] = {Part = P[1357], CanCollide = true} end
if P[1385] then collisionBatch[#collisionBatch+1] = {Part = P[1385], CanCollide = true} end
if P[1363] then collisionBatch[#collisionBatch+1] = {Part = P[1363], CanCollide = true} end
if P[1362] then collisionBatch[#collisionBatch+1] = {Part = P[1362], CanCollide = true} end
if P[1049] then collisionBatch[#collisionBatch+1] = {Part = P[1049], CanCollide = true} end
if P[1054] then collisionBatch[#collisionBatch+1] = {Part = P[1054], CanCollide = true} end
if P[1358] then collisionBatch[#collisionBatch+1] = {Part = P[1358], CanCollide = true} end
if P[1119] then collisionBatch[#collisionBatch+1] = {Part = P[1119], CanCollide = true} end
if P[1173] then collisionBatch[#collisionBatch+1] = {Part = P[1173], CanCollide = true} end
if P[1499] then collisionBatch[#collisionBatch+1] = {Part = P[1499], CanCollide = true} end
if P[1284] then collisionBatch[#collisionBatch+1] = {Part = P[1284], CanCollide = true} end
if P[1418] then collisionBatch[#collisionBatch+1] = {Part = P[1418], CanCollide = true} end
if P[1268] then collisionBatch[#collisionBatch+1] = {Part = P[1268], CanCollide = true} end
if P[1122] then collisionBatch[#collisionBatch+1] = {Part = P[1122], CanCollide = true} end
if P[1215] then collisionBatch[#collisionBatch+1] = {Part = P[1215], CanCollide = true} end
if P[1291] then collisionBatch[#collisionBatch+1] = {Part = P[1291], CanCollide = true} end
if P[1191] then collisionBatch[#collisionBatch+1] = {Part = P[1191], CanCollide = true} end
if P[1427] then collisionBatch[#collisionBatch+1] = {Part = P[1427], CanCollide = false} end
if P[1375] then collisionBatch[#collisionBatch+1] = {Part = P[1375], CanCollide = true} end
if P[1317] then collisionBatch[#collisionBatch+1] = {Part = P[1317], CanCollide = true} end
if P[1140] then collisionBatch[#collisionBatch+1] = {Part = P[1140], CanCollide = true} end
if P[1539] then collisionBatch[#collisionBatch+1] = {Part = P[1539], CanCollide = true} end
if P[1299] then collisionBatch[#collisionBatch+1] = {Part = P[1299], CanCollide = true} end
if P[1167] then collisionBatch[#collisionBatch+1] = {Part = P[1167], CanCollide = true} end
if P[1179] then collisionBatch[#collisionBatch+1] = {Part = P[1179], CanCollide = true} end
if P[1184] then collisionBatch[#collisionBatch+1] = {Part = P[1184], CanCollide = true} end
if P[1238] then collisionBatch[#collisionBatch+1] = {Part = P[1238], CanCollide = true} end
if P[1160] then collisionBatch[#collisionBatch+1] = {Part = P[1160], CanCollide = true} end
if P[1269] then collisionBatch[#collisionBatch+1] = {Part = P[1269], CanCollide = true} end
if P[1247] then collisionBatch[#collisionBatch+1] = {Part = P[1247], CanCollide = true} end
if P[1112] then collisionBatch[#collisionBatch+1] = {Part = P[1112], CanCollide = true} end
batchCollision(endpoint, collisionBatch)
local lockTasks, nameTasks = {}, {}

if P[6] then lockTasks[#lockTasks+1] = task.spawn(function() setLocked(endpoint, P[6], true) end) end
if P[6] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[6], "FlyCameraFocus") end) end
if P[10] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[10], "Head?") end) end
if P[14] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[14], "Color") end) end
if P[16] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[16], "Wheel12") end) end
if P[21] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[21], "Wheel17") end) end
if P[26] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[26], "Wheel1") end) end
if P[31] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[31], "Driver's Seat") end) end
if P[39] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[39], "Wheel") end) end
if P[46] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[46], "Part3") end) end
if P[47] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[47], "Part5") end) end
if P[49] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[49], "Part8") end) end
if P[50] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[50], "Part4") end) end
if P[51] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[51], "Part2") end) end
if P[52] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[52], "Part7") end) end
if P[53] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[53], "Part9") end) end
if P[54] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[54], "Part10") end) end
if P[55] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[55], "Part6") end) end
if P[57] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[57], "Part5") end) end
if P[58] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[58], "Part6") end) end
if P[59] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[59], "Part10") end) end
if P[60] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[60], "Part21") end) end
if P[61] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[61], "Part19") end) end
if P[62] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[62], "Part14") end) end
if P[63] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[63], "Seat2") end) end
if P[64] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[64], "Part4") end) end
if P[65] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[65], "Part22") end) end
if P[66] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[66], "Part17") end) end
if P[67] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[67], "Part3") end) end
if P[69] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[69], "Part18") end) end
if P[70] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[70], "Part15") end) end
if P[71] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[71], "Part13") end) end
if P[72] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[72], "Seat") end) end
if P[73] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[73], "Part8") end) end
if P[74] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[74], "Part9") end) end
if P[75] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[75], "Part20") end) end
if P[76] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[76], "Part11") end) end
if P[77] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[77], "Part7") end) end
if P[78] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[78], "Part12") end) end
if P[79] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[79], "Part2") end) end
if P[80] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[80], "Part16") end) end
if P[84] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[84], "Part1240") end) end
if P[89] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[89], "Part972") end) end
if P[92] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[92], "Part1250") end) end
if P[93] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[93], "Part959") end) end
if P[97] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[97], "Smooth Block Model") end) end
if P[98] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[98], "Smooth Block Model") end) end
if P[99] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[99], "Smooth Block Model") end) end
if P[100] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[100], "Smooth Block Model") end) end
if P[101] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[101], "Smooth Block Model") end) end
if P[102] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[102], "Smooth Block Model") end) end
if P[103] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[103], "Smooth Block Model") end) end
if P[104] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[104], "Smooth Block Model") end) end
if P[105] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[105], "Smooth Block Model") end) end
if P[107] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[107], "Smooth Block Model") end) end
if P[108] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[108], "Smooth Block Model") end) end
if P[109] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[109], "Smooth Block Model") end) end
if P[110] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[110], "Smooth Block Model") end) end
if P[111] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[111], "Smooth Block Model") end) end
if P[112] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[112], "Smooth Block Model") end) end
if P[113] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[113], "Smooth Block Model") end) end
if P[114] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[114], "Smooth Block Model105") end) end
if P[115] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[115], "Smooth Block Model") end) end
if P[116] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[116], "Smooth Block Model") end) end
if P[117] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[117], "Smooth Block Model") end) end
if P[118] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[118], "Smooth Block Model") end) end
if P[119] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[119], "Smooth Block Model552") end) end
if P[123] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[123], "Smooth Block Model") end) end
if P[125] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[125], "Smooth Block Model") end) end
if P[126] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[126], "Smooth Block Model") end) end
if P[127] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[127], "Smooth Block Model") end) end
if P[128] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[128], "Smooth Block Model") end) end
if P[129] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[129], "Smooth Block Model") end) end
if P[130] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[130], "Smooth Block Model") end) end
if P[131] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[131], "Smooth Block Model") end) end
if P[132] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[132], "Smooth Block Model") end) end
if P[133] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[133], "Smooth Block Model") end) end
if P[134] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[134], "Smooth Block Model") end) end
if P[135] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[135], "Smooth Block Model") end) end
if P[136] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[136], "Smooth Block Model") end) end
if P[137] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[137], "Smooth Block Model") end) end
if P[138] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[138], "Smooth Block Model") end) end
if P[139] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[139], "Smooth Block Model") end) end
if P[140] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[140], "Smooth Block Model") end) end
if P[141] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[141], "Smooth Block Model") end) end
if P[142] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[142], "Smooth Block Model") end) end
if P[143] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[143], "Smooth Block Model") end) end
if P[144] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[144], "Smooth Block Model") end) end
if P[145] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[145], "Smooth Block Model") end) end
if P[146] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[146], "Smooth Block Model66") end) end
if P[147] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[147], "Smooth Block Model") end) end
if P[148] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[148], "Smooth Block Model") end) end
if P[149] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[149], "Smooth Block Model") end) end
if P[150] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[150], "Smooth Block Model") end) end
if P[151] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[151], "Smooth Block Model") end) end
if P[152] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[152], "Smooth Block Model") end) end
if P[153] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[153], "Smooth Block Model") end) end
if P[154] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[154], "Smooth Block Model") end) end
if P[155] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[155], "Smooth Block Model") end) end
if P[156] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[156], "Smooth Block Model") end) end
if P[157] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[157], "Smooth Block Model") end) end
if P[158] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[158], "Smooth Block Model") end) end
if P[159] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[159], "Smooth Block Model") end) end
if P[161] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[161], "Smooth Block Model") end) end
if P[162] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[162], "Smooth Block Model") end) end
if P[163] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[163], "Smooth Block Model") end) end
if P[164] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[164], "Smooth Block Model") end) end
if P[165] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[165], "Smooth Block Model") end) end
if P[166] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[166], "Smooth Block Model") end) end
if P[167] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[167], "Smooth Block Model") end) end
if P[168] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[168], "Smooth Block Model138") end) end
if P[169] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[169], "Smooth Block Model") end) end
if P[170] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[170], "Smooth Block Model") end) end
if P[171] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[171], "Smooth Block Model") end) end
if P[172] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[172], "Smooth Block Model") end) end
if P[173] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[173], "Smooth Block Model") end) end
if P[174] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[174], "Smooth Block Model") end) end
if P[175] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[175], "Smooth Block Model290") end) end
if P[176] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[176], "Smooth Block Model") end) end
if P[177] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[177], "Smooth Block Model") end) end
if P[178] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[178], "Smooth Block Model") end) end
if P[179] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[179], "Smooth Block Model") end) end
if P[180] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[180], "Smooth Block Model") end) end
if P[181] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[181], "Smooth Block Model") end) end
if P[182] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[182], "Smooth Block Model") end) end
if P[183] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[183], "Smooth Block Model") end) end
if P[184] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[184], "Smooth Block Model") end) end
if P[185] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[185], "Smooth Block Model") end) end
if P[186] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[186], "Smooth Block Model") end) end
if P[187] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[187], "Smooth Block Model") end) end
if P[188] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[188], "Smooth Block Model") end) end
if P[189] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[189], "Smooth Block Model") end) end
if P[190] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[190], "Smooth Block Model") end) end
if P[191] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[191], "Smooth Block Model") end) end
if P[192] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[192], "Smooth Block Model") end) end
if P[193] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[193], "Smooth Block Model") end) end
if P[194] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[194], "Smooth Block Model") end) end
if P[195] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[195], "Smooth Block Model") end) end
if P[196] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[196], "Smooth Block Model") end) end
if P[197] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[197], "Smooth Block Model") end) end
if P[198] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[198], "Smooth Block Model") end) end
if P[199] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[199], "Smooth Block Model153") end) end
if P[201] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[201], "Smooth Block Model") end) end
if P[202] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[202], "Smooth Block Model") end) end
if P[203] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[203], "Smooth Block Model") end) end
if P[204] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[204], "Smooth Block Model") end) end
if P[205] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[205], "Smooth Block Model") end) end
if P[206] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[206], "Smooth Block Model") end) end
if P[207] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[207], "Smooth Block Model") end) end
if P[208] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[208], "Smooth Block Model") end) end
if P[209] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[209], "Smooth Block Model") end) end
if P[210] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[210], "Smooth Block Model") end) end
if P[211] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[211], "Smooth Block Model") end) end
if P[212] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[212], "Smooth Block Model") end) end
if P[213] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[213], "Smooth Block Model") end) end
if P[214] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[214], "Smooth Block Model") end) end
if P[215] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[215], "Smooth Block Model") end) end
if P[216] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[216], "Smooth Block Model") end) end
if P[217] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[217], "Smooth Block Model") end) end
if P[218] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[218], "Smooth Block Model") end) end
if P[219] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[219], "Smooth Block Model") end) end
if P[220] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[220], "Smooth Block Model") end) end
if P[221] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[221], "Smooth Block Model") end) end
if P[222] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[222], "Smooth Block Model") end) end
if P[223] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[223], "Smooth Block Model") end) end
if P[224] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[224], "Smooth Block Model") end) end
if P[225] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[225], "Smooth Block Model") end) end
if P[226] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[226], "Smooth Block Model") end) end
if P[227] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[227], "Smooth Block Model253") end) end
if P[230] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[230], "Smooth Block Model") end) end
if P[231] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[231], "Smooth Block Model") end) end
if P[232] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[232], "Smooth Block Model") end) end
if P[233] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[233], "Smooth Block Model") end) end
if P[234] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[234], "Smooth Block Model") end) end
if P[235] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[235], "Smooth Block Model") end) end
if P[236] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[236], "Smooth Block Model") end) end
if P[237] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[237], "Smooth Block Model") end) end
if P[238] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[238], "Smooth Block Model") end) end
if P[239] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[239], "Smooth Block Model") end) end
if P[240] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[240], "Smooth Block Model256") end) end
if P[241] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[241], "Smooth Block Model") end) end
if P[242] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[242], "Smooth Block Model") end) end
if P[243] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[243], "Smooth Block Model") end) end
if P[244] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[244], "Smooth Block Model") end) end
if P[245] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[245], "Smooth Block Model") end) end
if P[246] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[246], "Smooth Block Model") end) end
if P[247] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[247], "Smooth Block Model") end) end
if P[248] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[248], "Smooth Block Model") end) end
if P[249] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[249], "Smooth Block Model") end) end
if P[250] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[250], "Smooth Block Model") end) end
if P[251] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[251], "Smooth Block Model") end) end
if P[252] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[252], "Smooth Block Model") end) end
if P[253] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[253], "Smooth Block Model") end) end
if P[254] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[254], "Smooth Block Model") end) end
if P[255] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[255], "Smooth Block Model") end) end
if P[256] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[256], "Smooth Block Model") end) end
if P[257] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[257], "Smooth Block Model") end) end
if P[258] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[258], "Smooth Block Model") end) end
if P[259] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[259], "Smooth Block Model") end) end
if P[260] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[260], "Smooth Block Model607") end) end
if P[262] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[262], "Smooth Block Model") end) end
if P[263] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[263], "Smooth Block Model") end) end
if P[264] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[264], "Smooth Block Model") end) end
if P[265] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[265], "Smooth Block Model") end) end
if P[266] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[266], "Smooth Block Model") end) end
if P[267] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[267], "Smooth Block Model") end) end
if P[268] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[268], "Smooth Block Model") end) end
if P[269] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[269], "Smooth Block Model") end) end
if P[270] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[270], "Smooth Block Model") end) end
if P[271] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[271], "Smooth Block Model") end) end
if P[272] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[272], "Smooth Block Model") end) end
if P[273] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[273], "Smooth Block Model") end) end
if P[274] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[274], "Smooth Block Model239") end) end
if P[275] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[275], "Smooth Block Model") end) end
if P[276] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[276], "Smooth Block Model") end) end
if P[277] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[277], "Smooth Block Model") end) end
if P[278] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[278], "Smooth Block Model") end) end
if P[279] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[279], "Smooth Block Model") end) end
if P[280] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[280], "Smooth Block Model") end) end
if P[281] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[281], "Smooth Block Model") end) end
if P[282] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[282], "Smooth Block Model") end) end
if P[283] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[283], "Smooth Block Model") end) end
if P[284] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[284], "Smooth Block Model") end) end
if P[285] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[285], "Smooth Block Model") end) end
if P[286] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[286], "Smooth Block Model") end) end
if P[288] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[288], "Smooth Block Model") end) end
if P[289] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[289], "Smooth Block Model") end) end
if P[290] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[290], "Smooth Block Model") end) end
if P[291] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[291], "Smooth Block Model") end) end
if P[292] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[292], "Smooth Block Model") end) end
if P[293] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[293], "Smooth Block Model") end) end
if P[294] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[294], "Smooth Block Model116") end) end
if P[295] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[295], "Smooth Block Model") end) end
if P[296] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[296], "Smooth Block Model") end) end
if P[297] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[297], "Smooth Block Model") end) end
if P[298] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[298], "Smooth Block Model") end) end
if P[299] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[299], "Smooth Block Model") end) end
if P[300] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[300], "Smooth Block Model") end) end
if P[301] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[301], "Smooth Block Model") end) end
if P[302] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[302], "Smooth Block Model") end) end
if P[304] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[304], "Smooth Block Model") end) end
if P[305] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[305], "Smooth Block Model83") end) end
if P[306] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[306], "Smooth Block Model") end) end
if P[307] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[307], "Smooth Block Model") end) end
if P[308] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[308], "Smooth Block Model") end) end
if P[309] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[309], "Smooth Block Model") end) end
if P[310] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[310], "Smooth Block Model") end) end
if P[311] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[311], "Smooth Block Model") end) end
if P[312] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[312], "Smooth Block Model") end) end
if P[313] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[313], "Smooth Block Model") end) end
if P[314] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[314], "Smooth Block Model") end) end
if P[315] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[315], "Smooth Block Model") end) end
if P[316] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[316], "Smooth Block Model") end) end
if P[317] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[317], "Smooth Block Model") end) end
if P[318] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[318], "Smooth Block Model") end) end
if P[319] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[319], "Smooth Block Model") end) end
if P[320] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[320], "Smooth Block Model") end) end
if P[321] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[321], "Smooth Block Model") end) end
if P[322] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[322], "Smooth Block Model") end) end
if P[323] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[323], "Smooth Block Model") end) end
if P[324] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[324], "Smooth Block Model") end) end
if P[325] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[325], "Smooth Block Model") end) end
if P[326] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[326], "Smooth Block Model") end) end
if P[327] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[327], "Smooth Block Model") end) end
if P[328] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[328], "Smooth Block Model") end) end
if P[329] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[329], "Smooth Block Model") end) end
if P[330] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[330], "Smooth Block Model") end) end
if P[331] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[331], "Smooth Block Model") end) end
if P[332] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[332], "Smooth Block Model") end) end
if P[333] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[333], "Smooth Block Model") end) end
if P[334] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[334], "Smooth Block Model") end) end
if P[335] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[335], "Smooth Block Model") end) end
if P[336] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[336], "Smooth Block Model") end) end
if P[337] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[337], "Smooth Block Model") end) end
if P[338] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[338], "Smooth Block Model") end) end
if P[339] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[339], "Smooth Block Model") end) end
if P[340] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[340], "Smooth Block Model") end) end
if P[341] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[341], "Smooth Block Model") end) end
if P[342] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[342], "Smooth Block Model280") end) end
if P[343] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[343], "Smooth Block Model") end) end
if P[344] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[344], "Smooth Block Model") end) end
if P[345] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[345], "Smooth Block Model") end) end
if P[346] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[346], "Smooth Block Model") end) end
if P[347] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[347], "Smooth Block Model") end) end
if P[348] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[348], "Smooth Block Model") end) end
if P[349] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[349], "Smooth Block Model") end) end
if P[350] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[350], "Smooth Block Model") end) end
if P[351] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[351], "Smooth Block Model") end) end
if P[352] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[352], "Smooth Block Model") end) end
if P[353] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[353], "Smooth Block Model") end) end
if P[354] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[354], "Smooth Block Model") end) end
if P[355] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[355], "Smooth Block Model") end) end
if P[356] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[356], "Smooth Block Model") end) end
if P[357] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[357], "Smooth Block Model") end) end
if P[358] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[358], "Smooth Block Model") end) end
if P[359] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[359], "Smooth Block Model") end) end
if P[360] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[360], "Smooth Block Model") end) end
if P[361] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[361], "Smooth Block Model") end) end
if P[362] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[362], "Smooth Block Model") end) end
if P[363] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[363], "Smooth Block Model") end) end
if P[364] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[364], "Smooth Block Model") end) end
if P[365] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[365], "Smooth Block Model") end) end
if P[366] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[366], "Smooth Block Model") end) end
if P[367] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[367], "Smooth Block Model") end) end
if P[368] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[368], "Smooth Block Model") end) end
if P[369] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[369], "Smooth Block Model") end) end
if P[370] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[370], "Smooth Block Model") end) end
if P[371] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[371], "Smooth Block Model") end) end
if P[373] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[373], "Smooth Block Model") end) end
if P[374] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[374], "Smooth Block Model149") end) end
if P[375] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[375], "Smooth Block Model") end) end
if P[376] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[376], "Smooth Block Model") end) end
if P[377] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[377], "Smooth Block Model") end) end
if P[378] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[378], "Smooth Block Model") end) end
if P[379] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[379], "Smooth Block Model") end) end
if P[380] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[380], "Smooth Block Model") end) end
if P[381] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[381], "Smooth Block Model") end) end
if P[382] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[382], "Smooth Block Model") end) end
if P[383] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[383], "Smooth Block Model") end) end
if P[384] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[384], "Smooth Block Model") end) end
if P[385] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[385], "Brightness") end) end
if P[388] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[388], "Smooth Block Model") end) end
if P[389] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[389], "Smooth Block Model") end) end
if P[390] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[390], "Smooth Block Model") end) end
if P[391] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[391], "Smooth Block Model") end) end
if P[392] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[392], "Smooth Block Model") end) end
if P[393] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[393], "Smooth Block Model") end) end
if P[394] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[394], "Smooth Block Model") end) end
if P[395] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[395], "Smooth Block Model") end) end
if P[396] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[396], "Smooth Block Model") end) end
if P[397] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[397], "Smooth Block Model") end) end
if P[398] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[398], "Smooth Block Model") end) end
if P[399] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[399], "Smooth Block Model") end) end
if P[400] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[400], "Smooth Block Model") end) end
if P[401] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[401], "Smooth Block Model") end) end
if P[402] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[402], "Smooth Block Model") end) end
if P[403] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[403], "Smooth Block Model") end) end
if P[404] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[404], "Smooth Block Model") end) end
if P[405] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[405], "Smooth Block Model") end) end
if P[406] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[406], "Smooth Block Model") end) end
if P[407] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[407], "Smooth Block Model") end) end
if P[408] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[408], "Smooth Block Model") end) end
if P[409] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[409], "Smooth Block Model") end) end
if P[410] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[410], "Smooth Block Model") end) end
if P[411] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[411], "Smooth Block Model") end) end
if P[412] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[412], "Smooth Block Model") end) end
if P[413] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[413], "Smooth Block Model") end) end
if P[414] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[414], "Smooth Block Model") end) end
if P[415] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[415], "Smooth Block Model") end) end
if P[416] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[416], "Smooth Block Model") end) end
if P[417] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[417], "Smooth Block Model") end) end
if P[418] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[418], "Smooth Block Model") end) end
if P[419] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[419], "Smooth Block Model") end) end
if P[420] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[420], "Smooth Block Model") end) end
if P[421] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[421], "Smooth Block Model") end) end
if P[422] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[422], "Smooth Block Model") end) end
if P[423] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[423], "Smooth Block Model") end) end
if P[424] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[424], "Smooth Block Model") end) end
if P[425] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[425], "Smooth Block Model") end) end
if P[426] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[426], "Smooth Block Model") end) end
if P[427] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[427], "Smooth Block Model") end) end
if P[428] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[428], "Smooth Block Model") end) end
if P[429] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[429], "Smooth Block Model") end) end
if P[430] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[430], "Smooth Block Model") end) end
if P[431] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[431], "Smooth Block Model") end) end
if P[432] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[432], "Smooth Block Model") end) end
if P[433] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[433], "Smooth Block Model") end) end
if P[434] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[434], "Smooth Block Model") end) end
if P[435] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[435], "Smooth Block Model") end) end
if P[436] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[436], "Smooth Block Model") end) end
if P[437] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[437], "Smooth Block Model") end) end
if P[438] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[438], "Smooth Block Model") end) end
if P[439] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[439], "Smooth Block Model") end) end
if P[440] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[440], "Smooth Block Model") end) end
if P[441] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[441], "Smooth Block Model") end) end
if P[442] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[442], "Smooth Block Model") end) end
if P[443] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[443], "Smooth Block Model") end) end
if P[444] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[444], "Smooth Block Model") end) end
if P[445] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[445], "Smooth Block Model") end) end
if P[446] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[446], "Smooth Block Model") end) end
if P[447] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[447], "Smooth Block Model542") end) end
if P[448] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[448], "Smooth Block Model") end) end
if P[449] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[449], "Smooth Block Model") end) end
if P[450] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[450], "Smooth Block Model") end) end
if P[451] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[451], "Smooth Block Model") end) end
if P[452] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[452], "Smooth Block Model") end) end
if P[453] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[453], "Smooth Block Model") end) end
if P[454] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[454], "Smooth Block Model") end) end
if P[455] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[455], "Smooth Block Model") end) end
if P[456] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[456], "Smooth Block Model") end) end
if P[457] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[457], "Smooth Block Model") end) end
if P[458] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[458], "Smooth Block Model") end) end
if P[459] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[459], "Smooth Block Model") end) end
if P[460] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[460], "Smooth Block Model") end) end
if P[461] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[461], "Smooth Block Model") end) end
if P[462] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[462], "Smooth Block Model") end) end
if P[463] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[463], "Smooth Block Model") end) end
if P[464] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[464], "Smooth Block Model") end) end
if P[465] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[465], "Smooth Block Model") end) end
if P[466] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[466], "Smooth Block Model") end) end
if P[467] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[467], "Smooth Block Model") end) end
if P[468] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[468], "Smooth Block Model") end) end
if P[469] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[469], "Smooth Block Model") end) end
if P[470] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[470], "Smooth Block Model") end) end
if P[471] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[471], "Smooth Block Model") end) end
if P[472] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[472], "Smooth Block Model") end) end
if P[473] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[473], "Smooth Block Model") end) end
if P[474] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[474], "Smooth Block Model") end) end
if P[475] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[475], "Smooth Block Model") end) end
if P[476] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[476], "Smooth Block Model") end) end
if P[477] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[477], "Smooth Block Model") end) end
if P[478] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[478], "Smooth Block Model") end) end
if P[479] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[479], "Smooth Block Model") end) end
if P[480] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[480], "Smooth Block Model") end) end
if P[481] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[481], "Smooth Block Model") end) end
if P[482] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[482], "Smooth Block Model") end) end
if P[483] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[483], "Smooth Block Model") end) end
if P[484] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[484], "Smooth Block Model") end) end
if P[485] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[485], "Smooth Block Model") end) end
if P[486] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[486], "Smooth Block Model") end) end
if P[487] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[487], "Smooth Block Model") end) end
if P[488] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[488], "Smooth Block Model") end) end
if P[489] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[489], "Smooth Block Model") end) end
if P[490] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[490], "Smooth Block Model571") end) end
if P[493] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[493], "Smooth Block Model") end) end
if P[494] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[494], "Smooth Block Model") end) end
if P[495] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[495], "Smooth Block Model") end) end
if P[496] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[496], "Smooth Block Model") end) end
if P[497] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[497], "Smooth Block Model") end) end
if P[498] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[498], "Smooth Block Model") end) end
if P[499] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[499], "Smooth Block Model") end) end
if P[500] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[500], "Smooth Block Model") end) end
if P[501] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[501], "Smooth Block Model") end) end
if P[502] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[502], "Smooth Block Model") end) end
if P[503] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[503], "Smooth Block Model") end) end
if P[504] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[504], "Smooth Block Model") end) end
if P[505] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[505], "Smooth Block Model") end) end
if P[506] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[506], "Smooth Block Model") end) end
if P[507] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[507], "Smooth Block Model") end) end
if P[508] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[508], "Smooth Block Model") end) end
if P[509] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[509], "Smooth Block Model") end) end
if P[510] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[510], "Smooth Block Model") end) end
if P[511] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[511], "Smooth Block Model") end) end
if P[512] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[512], "Smooth Block Model") end) end
if P[513] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[513], "Smooth Block Model") end) end
if P[514] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[514], "Smooth Block Model") end) end
if P[515] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[515], "Smooth Block Model") end) end
if P[516] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[516], "Smooth Block Model") end) end
if P[517] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[517], "Smooth Block Model") end) end
if P[518] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[518], "Smooth Block Model") end) end
if P[519] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[519], "Smooth Block Model") end) end
if P[520] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[520], "Smooth Block Model") end) end
if P[521] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[521], "Smooth Block Model") end) end
if P[522] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[522], "Smooth Block Model") end) end
if P[523] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[523], "Smooth Block Model") end) end
if P[524] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[524], "Smooth Block Model") end) end
if P[525] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[525], "Smooth Block Model") end) end
if P[526] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[526], "Smooth Block Model") end) end
if P[527] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[527], "Smooth Block Model") end) end
if P[528] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[528], "Smooth Block Model") end) end
if P[529] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[529], "Smooth Block Model") end) end
if P[530] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[530], "Smooth Block Model") end) end
if P[531] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[531], "Smooth Block Model") end) end
if P[532] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[532], "Smooth Block Model") end) end
if P[533] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[533], "Smooth Block Model") end) end
if P[534] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[534], "Smooth Block Model") end) end
if P[535] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[535], "Smooth Block Model") end) end
if P[536] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[536], "Smooth Block Model") end) end
if P[537] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[537], "Smooth Block Model") end) end
if P[538] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[538], "Smooth Block Model") end) end
if P[539] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[539], "Smooth Block Model") end) end
if P[540] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[540], "Smooth Block Model568") end) end
if P[541] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[541], "Smooth Block Model") end) end
if P[543] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[543], "Smooth Block Model") end) end
if P[544] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[544], "Smooth Block Model") end) end
if P[545] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[545], "Smooth Block Model") end) end
if P[546] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[546], "Smooth Block Model") end) end
if P[547] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[547], "Smooth Block Model") end) end
if P[548] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[548], "Smooth Block Model") end) end
if P[549] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[549], "Smooth Block Model") end) end
if P[550] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[550], "Smooth Block Model94") end) end
if P[551] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[551], "Smooth Block Model") end) end
if P[552] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[552], "Smooth Block Model") end) end
if P[553] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[553], "Smooth Block Model") end) end
if P[554] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[554], "Smooth Block Model") end) end
if P[555] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[555], "Smooth Block Model") end) end
if P[556] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[556], "Smooth Block Model") end) end
if P[557] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[557], "Smooth Block Model") end) end
if P[558] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[558], "Smooth Block Model") end) end
if P[559] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[559], "Smooth Block Model") end) end
if P[560] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[560], "Smooth Block Model") end) end
if P[561] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[561], "Smooth Block Model") end) end
if P[562] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[562], "Smooth Block Model") end) end
if P[563] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[563], "Smooth Block Model") end) end
if P[564] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[564], "Smooth Block Model") end) end
if P[565] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[565], "Smooth Block Model") end) end
if P[566] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[566], "Smooth Block Model") end) end
if P[567] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[567], "Smooth Block Model") end) end
if P[568] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[568], "Smooth Block Model") end) end
if P[569] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[569], "Smooth Block Model") end) end
if P[570] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[570], "Smooth Block Model") end) end
if P[571] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[571], "Smooth Block Model") end) end
if P[572] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[572], "Smooth Block Model") end) end
if P[573] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[573], "Smooth Block Model") end) end
if P[574] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[574], "Smooth Block Model") end) end
if P[575] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[575], "Smooth Block Model") end) end
if P[576] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[576], "Smooth Block Model") end) end
if P[577] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[577], "Smooth Block Model") end) end
if P[578] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[578], "Smooth Block Model") end) end
if P[579] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[579], "Smooth Block Model") end) end
if P[580] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[580], "Smooth Block Model") end) end
if P[581] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[581], "Smooth Block Model") end) end
if P[582] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[582], "Smooth Block Model") end) end
if P[583] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[583], "Smooth Block Model") end) end
if P[584] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[584], "Smooth Block Model") end) end
if P[585] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[585], "Smooth Block Model") end) end
if P[586] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[586], "Smooth Block Model") end) end
if P[587] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[587], "Smooth Block Model") end) end
if P[588] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[588], "Smooth Block Model") end) end
if P[589] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[589], "Smooth Block Model") end) end
if P[590] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[590], "Smooth Block Model") end) end
if P[591] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[591], "Smooth Block Model") end) end
if P[592] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[592], "Smooth Block Model") end) end
if P[593] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[593], "Smooth Block Model") end) end
if P[594] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[594], "Smooth Block Model") end) end
if P[595] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[595], "Smooth Block Model") end) end
if P[596] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[596], "Smooth Block Model") end) end
if P[597] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[597], "Smooth Block Model") end) end
if P[598] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[598], "Smooth Block Model") end) end
if P[599] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[599], "Smooth Block Model") end) end
if P[600] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[600], "Smooth Block Model") end) end
if P[601] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[601], "Smooth Block Model") end) end
if P[602] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[602], "Smooth Block Model") end) end
if P[603] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[603], "Smooth Block Model") end) end
if P[604] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[604], "Smooth Block Model") end) end
if P[605] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[605], "Smooth Block Model") end) end
if P[606] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[606], "Smooth Block Model") end) end
if P[607] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[607], "Smooth Block Model") end) end
if P[608] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[608], "Smooth Block Model") end) end
if P[609] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[609], "Smooth Block Model") end) end
if P[610] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[610], "Smooth Block Model") end) end
if P[611] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[611], "Smooth Block Model") end) end
if P[612] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[612], "Smooth Block Model") end) end
if P[613] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[613], "Smooth Block Model") end) end
if P[614] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[614], "Smooth Block Model") end) end
if P[615] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[615], "Smooth Block Model") end) end
if P[616] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[616], "Smooth Block Model") end) end
if P[617] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[617], "Smooth Block Model") end) end
if P[618] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[618], "Smooth Block Model") end) end
if P[619] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[619], "Smooth Block Model") end) end
if P[620] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[620], "Smooth Block Model") end) end
if P[621] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[621], "Smooth Block Model") end) end
if P[622] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[622], "Smooth Block Model") end) end
if P[623] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[623], "Smooth Block Model") end) end
if P[624] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[624], "Smooth Block Model") end) end
if P[625] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[625], "Smooth Block Model") end) end
if P[626] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[626], "Smooth Block Model") end) end
if P[627] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[627], "Smooth Block Model") end) end
if P[628] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[628], "Smooth Block Model") end) end
if P[629] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[629], "Smooth Block Model") end) end
if P[630] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[630], "Smooth Block Model283") end) end
if P[633] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[633], "Smooth Block Model") end) end
if P[634] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[634], "Smooth Block Model") end) end
if P[635] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[635], "Smooth Block Model") end) end
if P[636] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[636], "Smooth Block Model") end) end
if P[637] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[637], "Smooth Block Model") end) end
if P[638] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[638], "Smooth Block Model") end) end
if P[639] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[639], "Smooth Block Model") end) end
if P[640] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[640], "Smooth Block Model") end) end
if P[641] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[641], "Smooth Block Model") end) end
if P[642] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[642], "Smooth Block Model") end) end
if P[643] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[643], "Smooth Block Model") end) end
if P[644] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[644], "Smooth Block Model") end) end
if P[645] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[645], "Smooth Block Model") end) end
if P[646] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[646], "Smooth Block Model") end) end
if P[648] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[648], "Smooth Block Model127") end) end
if P[649] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[649], "Smooth Block Model") end) end
if P[650] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[650], "Smooth Block Model") end) end
if P[651] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[651], "Smooth Block Model") end) end
if P[652] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[652], "Smooth Block Model") end) end
if P[653] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[653], "Smooth Block Model") end) end
if P[654] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[654], "Smooth Block Model") end) end
if P[655] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[655], "Smooth Block Model") end) end
if P[656] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[656], "Smooth Block Model") end) end
if P[657] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[657], "Smooth Block Model") end) end
if P[658] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[658], "Smooth Block Model") end) end
if P[659] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[659], "Smooth Block Model") end) end
if P[660] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[660], "Smooth Block Model") end) end
if P[661] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[661], "Smooth Block Model") end) end
if P[662] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[662], "Smooth Block Model") end) end
if P[663] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[663], "Smooth Block Model") end) end
if P[664] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[664], "Smooth Block Model") end) end
if P[665] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[665], "Smooth Block Model") end) end
if P[666] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[666], "Smooth Block Model") end) end
if P[667] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[667], "Smooth Block Model") end) end
if P[668] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[668], "Smooth Block Model") end) end
if P[669] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[669], "Smooth Block Model") end) end
if P[670] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[670], "Smooth Block Model") end) end
if P[671] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[671], "Smooth Block Model") end) end
if P[672] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[672], "Smooth Block Model") end) end
if P[673] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[673], "Smooth Block Model") end) end
if P[674] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[674], "Smooth Block Model") end) end
if P[675] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[675], "Smooth Block Model") end) end
if P[676] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[676], "Smooth Block Model") end) end
if P[677] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[677], "Smooth Block Model") end) end
if P[678] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[678], "Smooth Block Model") end) end
if P[679] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[679], "Smooth Block Model") end) end
if P[680] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[680], "Smooth Block Model") end) end
if P[681] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[681], "Smooth Block Model") end) end
if P[682] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[682], "Smooth Block Model") end) end
if P[683] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[683], "Smooth Block Model") end) end
if P[684] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[684], "Part1206") end) end
if P[687] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[687], "Part965") end) end
if P[694] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[694], "Part975") end) end
if P[699] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[699], "Part1251") end) end
if P[702] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[702], "Part950") end) end
if P[704] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[704], "Part1226") end) end
if P[712] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[712], "Part1234") end) end
if P[717] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[717], "Part8") end) end
if P[720] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[720], "Part1244") end) end
if P[726] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[726], "Part20") end) end
if P[733] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[733], "Part1254") end) end
if P[737] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[737], "Part942") end) end
if P[739] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[739], "Part12") end) end
if P[741] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[741], "Part1197") end) end
if P[744] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[744], "Smooth Block Model681") end) end
if P[747] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[747], "Smooth Block Model938") end) end
if P[749] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[749], "Smooth Block Model654") end) end
if P[751] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[751], "Smooth Block Model661") end) end
if P[755] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[755], "Smooth Block Model828") end) end
if P[758] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[758], "Smooth Block Model844") end) end
if P[761] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[761], "Smooth Block Model823") end) end
if P[762] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[762], "Smooth Block Model797") end) end
if P[766] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[766], "Smooth Block Model818") end) end
if P[771] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[771], "Smooth Block Model847") end) end
if P[775] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[775], "Smooth Block Model851") end) end
if P[776] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[776], "Smooth Block Model827") end) end
if P[777] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[777], "Smooth Block Model787") end) end
if P[780] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[780], "Smooth Block Model832") end) end
if P[783] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[783], "Smooth Block Model806") end) end
if P[792] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[792], "Smooth Block Model853") end) end
if P[795] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[795], "Smooth Block Model831") end) end
if P[796] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[796], "Smooth Block Model792") end) end
if P[801] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[801], "Smooth Block Model842") end) end
if P[803] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[803], "Smooth Block Model801") end) end
if P[808] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[808], "Smooth Block Model835") end) end
if P[811] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[811], "Smooth Block Model790") end) end
if P[813] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[813], "Smooth Block Model") end) end
if P[814] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[814], "Smooth Block Model841") end) end
if P[815] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[815], "Smooth Block Model824") end) end
if P[818] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[818], "Smooth Block Model838") end) end
if P[821] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[821], "Smooth Block Model816") end) end
if P[823] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[823], "Smooth Block Model815") end) end
if P[824] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[824], "Smooth Block Model671") end) end
if P[825] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[825], "Smooth Block Model755") end) end
if P[826] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[826], "Smooth Block Model") end) end
if P[828] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[828], "Smooth Block Model931") end) end
if P[833] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[833], "Smooth Block Model899") end) end
if P[836] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[836], "Smooth Block Model920") end) end
if P[837] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[837], "Smooth Block Model877") end) end
if P[841] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[841], "Smooth Block Model913") end) end
if P[843] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[843], "Smooth Block Model886") end) end
if P[845] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[845], "Smooth Block Model895") end) end
if P[847] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[847], "Smooth Block Model888") end) end
if P[850] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[850], "Smooth Block Model") end) end
if P[852] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[852], "Smooth Block Model897") end) end
if P[854] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[854], "Smooth Block Model874") end) end
if P[857] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[857], "Smooth Block Model883") end) end
if P[860] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[860], "Smooth Block Model906") end) end
if P[863] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[863], "Smooth Block Model894") end) end
if P[864] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[864], "Smooth Block Model902") end) end
if P[868] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[868], "Smooth Block Model909") end) end
if P[871] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[871], "Smooth Block Model867") end) end
if P[874] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[874], "Smooth Block Model870") end) end
if P[878] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[878], "Smooth Block Model912") end) end
if P[879] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[879], "Smooth Block Model881") end) end
if P[881] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[881], "Smooth Block Model864") end) end
if P[884] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[884], "Smooth Block Model915") end) end
if P[886] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[886], "Smooth Block Model923") end) end
if P[888] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[888], "Smooth Block Model891") end) end
if P[891] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[891], "Smooth Block Model917") end) end
if P[894] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[894], "Smooth Block Model935") end) end
if P[895] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[895], "Smooth Block Model674") end) end
if P[897] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[897], "Smooth Block Model642") end) end
if P[900] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[900], "Smooth Block Model927") end) end
if P[904] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[904], "Smooth Block Model764") end) end
if P[908] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[908], "Smooth Block Model679") end) end
if P[910] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[910], "Smooth Block Model770") end) end
if P[912] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[912], "Smooth Block Model630") end) end
if P[915] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[915], "Smooth Block Model634") end) end
if P[918] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[918], "Smooth Block Model756") end) end
if P[922] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[922], "Smooth Block Model676") end) end
if P[925] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[925], "Smooth Block Model776") end) end
if P[929] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[929], "Smooth Block Model668") end) end
if P[930] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[930], "Smooth Block Model856") end) end
if P[934] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[934], "Smooth Block Model772") end) end
if P[938] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[938], "Smooth Block Model768") end) end
if P[940] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[940], "Smooth Block Model925") end) end
if P[942] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[942], "Smooth Block Model763") end) end
if P[943] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[943], "Smooth Block Model672") end) end
if P[945] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[945], "Smooth Block Model860") end) end
if P[946] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[946], "Smooth Block Model754") end) end
if P[947] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[947], "Smooth Block Model669") end) end
if P[949] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[949], "Smooth Block Model638") end) end
if P[950] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[950], "Smooth Block Model633") end) end
if P[951] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[951], "Smooth Block Model665") end) end
if P[954] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[954], "Smooth Block Model780") end) end
if P[959] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[959], "Smooth Block Model659") end) end
if P[961] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[961], "Smooth Block Model861") end) end
if P[963] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[963], "Smooth Block Model645") end) end
if P[964] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[964], "Smooth Block Model637") end) end
if P[965] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[965], "Smooth Block Model639") end) end
if P[968] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[968], "Smooth Block Model760") end) end
if P[971] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[971], "Smooth Block Model646") end) end
if P[980] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[980], "Smooth Block Model741") end) end
if P[983] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[983], "Smooth Block Model702") end) end
if P[985] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[985], "Smooth Block Model698") end) end
if P[989] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[989], "Smooth Block Model685") end) end
if P[991] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[991], "Smooth Block Model735") end) end
if P[994] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[994], "Smooth Block Model749") end) end
if P[995] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[995], "Smooth Block Model722") end) end
if P[996] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[996], "Smooth Block Model744") end) end
if P[997] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[997], "Smooth Block Model723") end) end
if P[999] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[999], "Smooth Block Model711") end) end
if P[1004] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1004], "Smooth Block Model740") end) end
if P[1005] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1005], "Smooth Block Model725") end) end
if P[1015] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1015], "Smooth Block Model705") end) end
if P[1018] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1018], "Smooth Block Model718") end) end
if P[1021] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1021], "Smooth Block Model738") end) end
if P[1023] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1023], "Smooth Block Model694") end) end
if P[1406] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1406], "Part3") end) end
if P[1118] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1118], "Part2") end) end
if P[1615] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1615], "Part19") end) end
if P[1442] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1442], "Part5") end) end
if P[1388] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1388], "Part26") end) end
if P[1334] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1334], "Part27") end) end
if P[1052] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1052], "Smooth Block Model785") end) end
if P[1196] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1196], "Part2") end) end
if P[1202] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1202], "Part2") end) end
if P[1061] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1061], "Part1192") end) end
if P[1407] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1407], "Part13") end) end
if P[1541] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1541], "Part3") end) end
if P[1381] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1381], "Part4") end) end
if P[1271] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1271], "Part2") end) end
if P[1378] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1378], "Part11") end) end
if P[1053] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1053], "Smooth Block Model664") end) end
if P[1097] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1097], "Part2") end) end
if P[1351] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1351], "Part2") end) end
if P[1166] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1166], "Part2") end) end
if P[1571] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1571], "Part6") end) end
if P[1045] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1045], "Smooth Block Model751") end) end
if P[1448] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1448], "Part22") end) end
if P[1426] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1426], "Part6") end) end
if P[1613] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1613], "Part10") end) end
if P[1369] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1369], "OnOff") end) end
if P[1408] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1408], "Part8") end) end
if P[1127] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1127], "Part2") end) end
if P[1389] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1389], "Part13") end) end
if P[1033] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1033], "Smooth Block Model708") end) end
if P[1169] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1169], "Part2") end) end
if P[1624] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1624], "Part20") end) end
if P[1145] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1145], "Part2") end) end
if P[1413] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1413], "Part12") end) end
if P[1339] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1339], "Part15") end) end
if P[1044] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1044], "Smooth Block Model721") end) end
if P[1627] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1627], "Head") end) end
if P[1581] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1581], "Part17") end) end
if P[1633] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1633], "Part17") end) end
if P[1404] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1404], "Part10") end) end
if P[1479] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1479], "Part10") end) end
if P[1232] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1232], "Part2") end) end
if P[1103] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1103], "Part2") end) end
if P[1595] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1595], "Part8") end) end
if P[1392] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1392], "Part2") end) end
if P[1223] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1223], "Part2") end) end
if P[1250] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1250], "Part2") end) end
if P[1618] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1618], "Part18") end) end
if P[1056] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1056], "Part952") end) end
if P[1549] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1549], "Part14") end) end
if P[1514] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1514], "Part7") end) end
if P[1480] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1480], "Part23") end) end
if P[1036] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1036], "Smooth Block Model687") end) end
if P[1295] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1295], "Part1202") end) end
if P[1428] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1428], "Part2") end) end
if P[1076] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1076], "Part1194") end) end
if P[1410] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1410], "Part4") end) end
if P[1280] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1280], "Part2") end) end
if P[1059] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1059], "Part6") end) end
if P[1139] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1139], "Part2") end) end
if P[1591] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1591], "Part14") end) end
if P[1178] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1178], "Part2") end) end
if P[1327] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1327], "Part1212") end) end
if P[1190] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1190], "Part2") end) end
if P[1636] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1636], "Part13") end) end
if P[1472] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1472], "Part15") end) end
if P[1368] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1368], "hot") end) end
if P[1289] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1289], "Part2") end) end
if P[1536] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1536], "Part15") end) end
if P[1566] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1566], "Part19") end) end
if P[1593] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1593], "Part2") end) end
if P[1600] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1600], "Part11") end) end
if P[1487] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1487], "Part31") end) end
if P[1538] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1538], "Union") end) end
if P[1283] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1283], "Part2") end) end
if P[1469] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1469], "Part7") end) end
if P[1359] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1359], "Part19") end) end
if P[1445] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1445], "Part10") end) end
if P[1425] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1425], "Part5") end) end
if P[1163] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1163], "Part2") end) end
if P[1575] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1575], "Union") end) end
if P[1205] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1205], "Part1124") end) end
if P[1181] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1181], "Part2") end) end
if P[1511] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1511], "Part2") end) end
if P[1320] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1320], "Part1199") end) end
if P[1602] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1602], "Part7") end) end
if P[1414] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1414], "Part6") end) end
if P[1520] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1520], "Hitbox") end) end
if P[1569] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1569], "Part5") end) end
if P[1314] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1314], "Part1209") end) end
if P[1286] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1286], "Part2") end) end
if P[1465] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1465], "Part13") end) end
if P[1489] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1489], "Part20") end) end
if P[1399] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1399], "Union") end) end
if P[1512] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1512], "Part24") end) end
if P[1379] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1379], "Part12") end) end
if P[1496] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1496], "Part4") end) end
if P[1463] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1463], "Part3") end) end
if P[1495] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1495], "Part41") end) end
if P[1304] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1304], "Part32") end) end
if P[1651] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1651], "Lava") end) end
if P[1649] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1649], "Lava") end) end
if P[1648] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1648], "Pipe") end) end
if P[1063] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1063], "Part944") end) end
if P[1635] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1635], "Part14") end) end
if P[1645] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1645], "Part2") end) end
if P[1643] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1643], "Head") end) end
if P[1364] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1364], "Part8") end) end
if P[1641] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1641], "Head") end) end
if P[1640] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1640], "Part7") end) end
if P[1558] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1558], "Part11") end) end
if P[1638] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1638], "Head") end) end
if P[1446] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1446], "Part23") end) end
if P[1494] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1494], "Part6") end) end
if P[1647] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1647], "Pipe") end) end
if P[1631] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1631], "Part21") end) end
if P[1048] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1048], "Smooth Block Model704") end) end
if P[1515] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1515], "Part37") end) end
if P[1504] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1504], "Part34") end) end
if P[1346] then lockTasks[#lockTasks+1] = task.spawn(function() setLocked(endpoint, P[1346], true) end) end
if P[1346] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1346], "FlyCameraFocus") end) end
if P[1632] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1632], "Part16") end) end
if P[1626] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1626], "Part12") end) end
if P[1630] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1630], "Part4") end) end
if P[1151] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1151], "Part2") end) end
if P[1136] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1136], "Part2") end) end
if P[1405] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1405], "Part2") end) end
if P[1220] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1220], "Part2") end) end
if P[1491] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1491], "Part11") end) end
if P[1625] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1625], "Part11") end) end
if P[1623] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1623], "Part9") end) end
if P[1622] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1622], "Part8") end) end
if P[1121] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1121], "Part2") end) end
if P[1621] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1621], "Part15") end) end
if P[1411] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1411], "Part14") end) end
if P[1583] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1583], "Part3") end) end
if P[1553] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1553], "Part8") end) end
if P[1617] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1617], "Part25") end) end
if P[1619] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1619], "Head") end) end
if P[1614] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1614], "Part23") end) end
if P[1259] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1259], "Part2") end) end
if P[1449] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1449], "Part25") end) end
if P[1458] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1458], "Part4") end) end
if P[1453] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1453], "Part9") end) end
if P[1106] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1106], "Part2") end) end
if P[1323] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1323], "Part1258") end) end
if P[1082] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1082], "Part2") end) end
if P[1429] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1429], "MiniLava") end) end
if P[1452] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1452], "Part31") end) end
if P[1505] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1505], "Part13") end) end
if P[1611] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1611], "Part5") end) end
if P[1172] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1172], "Part2") end) end
if P[1608] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1608], "Part19") end) end
if P[1606] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1606], "Part10") end) end
if P[1244] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1244], "Part2") end) end
if P[1409] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1409], "Part9") end) end
if P[1478] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1478], "Part27") end) end
if P[1545] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1545], "Part18") end) end
if P[1599] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1599], "Union") end) end
if P[1597] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1597], "Part9") end) end
if P[1365] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1365], "Part9") end) end
if P[1043] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1043], "Smooth Block Model") end) end
if P[1241] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1241], "Part2") end) end
if P[1589] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1589], "Part13") end) end
if P[1360] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1360], "Part22") end) end
if P[1308] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1308], "Part36") end) end
if P[1217] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1217], "Part2") end) end
if P[1372] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1372], "Faucet") end) end
if P[1193] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1193], "Part2") end) end
if P[1578] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1578], "Part15") end) end
if P[1444] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1444], "Part27") end) end
if P[1451] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1451], "Part24") end) end
if P[1094] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1094], "Part2") end) end
if P[1573] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1573], "Part4") end) end
if P[1564] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1564], "Part10") end) end
if P[1208] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1208], "Part2") end) end
if P[1562] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1562], "Part12") end) end
if P[1560] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1560], "Part7") end) end
if P[1509] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1509], "Part8") end) end
if P[1557] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1557], "Union") end) end
if P[1432] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1432], "Lava") end) end
if P[1555] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1555], "Part9") end) end
if P[1616] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1616], "Part22") end) end
if P[1551] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1551], "Part2") end) end
if P[1256] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1256], "Part2") end) end
if P[1447] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1447], "Part19") end) end
if P[1402] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1402], "Part5") end) end
if P[1604] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1604], "Part12") end) end
if P[1229] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1229], "Part2") end) end
if P[1303] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1303], "Part1191") end) end
if P[1534] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1534], "Part16") end) end
if P[1533] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1533], "Union") end) end
if P[1497] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1497], "Part44") end) end
if P[1475] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1475], "Part39") end) end
if P[1031] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1031], "Smooth Block Model716") end) end
if P[1529] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1529], "Part6") end) end
if P[1527] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1527], "Part5") end) end
if P[1349] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1349], "SpawnLocation") end) end
if P[1115] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1115], "Part2") end) end
if P[1524] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1524], "gatething") end) end
if P[1085] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1085], "Part2") end) end
if P[1523] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1523], "L1") end) end
if P[1522] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1522], "L2") end) end
if P[1517] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1517], "Part21") end) end
if P[1507] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1507], "Part14") end) end
if P[1634] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1634], "Part3") end) end
if P[1513] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1513], "Part30") end) end
if P[1490] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1490], "Part40") end) end
if P[1510] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1510], "Part15") end) end
if P[1503] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1503], "Part3") end) end
if P[1109] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1109], "Part2") end) end
if P[1415] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1415], "Part11") end) end
if P[1377] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1377], "cold") end) end
if P[1516] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1516], "Part12") end) end
if P[1506] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1506], "Part32") end) end
if P[1502] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1502], "Part17") end) end
if P[1386] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1386], "Part3") end) end
if P[1390] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1390], "Part7") end) end
if P[1501] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1501], "Part36") end) end
if P[1154] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1154], "Part2") end) end
if P[1500] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1500], "Part43") end) end
if P[1130] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1130], "Part2") end) end
if P[1354] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1354], "Part5") end) end
if P[1361] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1361], "Part25") end) end
if P[1460] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1460], "Part16") end) end
if P[1462] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1462], "Part17") end) end
if P[1531] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1531], "Part4") end) end
if P[1637] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1637], "Part24") end) end
if P[1380] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1380], "Part6") end) end
if P[1387] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1387], "Part14") end) end
if P[1493] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1493], "Part33") end) end
if P[1382] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1382], "Part21") end) end
if P[1300] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1300], "Part1") end) end
if P[1459] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1459], "Part21") end) end
if P[1488] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1488], "Part9") end) end
if P[1486] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1486], "Part42") end) end
if P[1485] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1485], "Part38") end) end
if P[1483] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1483], "Part25") end) end
if P[1455] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1455], "Part11") end) end
if P[1481] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1481], "Part19") end) end
if P[1476] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1476], "Part5") end) end
if P[1344] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1344], "Part4") end) end
if P[1091] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1091], "Part2") end) end
if P[1471] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1471], "Part30") end) end
if P[1470] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1470], "Part2") end) end
if P[1468] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1468], "Part8") end) end
if P[1467] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1467], "Part14") end) end
if P[1313] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1313], "Part14") end) end
if P[1466] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1466], "Part26") end) end
if P[1265] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1265], "Part2") end) end
if P[1148] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1148], "Part2") end) end
if P[1397] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1397], "Union") end) end
if P[1464] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1464], "Part32") end) end
if P[1498] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1498], "Part16") end) end
if P[1211] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1211], "Part2") end) end
if P[1461] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1461], "Part28") end) end
if P[1457] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1457], "Part6") end) end
if P[1456] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1456], "Part12") end) end
if P[1311] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1311], "Part940") end) end
if P[1484] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1484], "Part18") end) end
if P[1482] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1482], "Part22") end) end
if P[1277] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1277], "Part2") end) end
if P[1454] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1454], "Part20") end) end
if P[1450] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1450], "Part18") end) end
if P[1142] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1142], "Part2") end) end
if P[1235] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1235], "Part2") end) end
if P[1547] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1547], "Part13") end) end
if P[1079] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1079], "Part2") end) end
if P[1580] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1580], "Union") end) end
if P[1124] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1124], "Part2") end) end
if P[1441] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1441], "Part29") end) end
if P[1262] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1262], "Part2") end) end
if P[1199] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1199], "Part2") end) end
if P[1187] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1187], "Part2") end) end
if P[1133] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1133], "Part2") end) end
if P[1027] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1027], "Smooth Block Model745") end) end
if P[1100] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1100], "Part2") end) end
if P[1391] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1391], "Part24") end) end
if P[1412] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1412], "Part7") end) end
if P[1508] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1508], "Part26") end) end
if P[1366] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1366], "Part20") end) end
if P[1424] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1424], "Part3") end) end
if P[1253] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1253], "Part2") end) end
if P[1474] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1474], "Part29") end) end
if P[1175] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1175], "Part2") end) end
if P[1576] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1576], "Part16") end) end
if P[1398] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1398], "Union") end) end
if P[1214] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1214], "Part2") end) end
if P[1157] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1157], "Part2") end) end
if P[1587] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1587], "Part18") end) end
if P[1356] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1356], "Part27") end) end
if P[1088] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1088], "Part2") end) end
if P[1384] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1384], "Part28") end) end
if P[1069] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1069], "Part1219") end) end
if P[1383] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1383], "Part16") end) end
if P[1492] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1492], "Part35") end) end
if P[1629] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1629], "Part6") end) end
if P[1274] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1274], "Part2") end) end
if P[1226] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1226], "Part2") end) end
if P[1357] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1357], "Part10") end) end
if P[1385] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1385], "Part17") end) end
if P[1363] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1363], "Part15") end) end
if P[1362] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1362], "Part18") end) end
if P[1049] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1049], "Smooth Block Model656") end) end
if P[1054] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1054], "Smooth Block Model628") end) end
if P[1358] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1358], "Part23") end) end
if P[1499] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1499], "Part28") end) end
if P[1418] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1418], "Part2") end) end
if P[1268] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1268], "Part2") end) end
if P[1291] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1291], "Part955") end) end
if P[1427] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1427], "Part4") end) end
if P[1317] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1317], "Part962") end) end
if P[1539] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1539], "Part17") end) end
if P[1299] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1299], "Part3") end) end
if P[1184] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1184], "Part2") end) end
if P[1238] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1238], "Part2") end) end
if P[1160] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1160], "Part2") end) end
if P[1247] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1247], "Part2") end) end
if P[1112] then nameTasks[#nameTasks+1] = task.spawn(function() setName(endpoint, P[1112], "Part2") end) end
task.wait(0.2)
if P[10] then
    task.spawn(function()
        createMesh(endpoint, P[10])
        syncMeshType(endpoint, P[10], Enum.MeshType.FileMesh)
        syncMeshScale(endpoint, P[10], Vector3.new(7.940999984741211,5.739999771118164,14.020999908447266))
        syncMeshOffset(endpoint, P[10], Vector3.new(0,2,0))
        syncMeshId(endpoint, P[10], "rbxassetid://5918550231")
        syncMeshTexture(endpoint, P[10], "https://www.roblox.com/asset/?id=5915100392")
    end)
end
if P[16] then
    task.spawn(function()
        createMesh(endpoint, P[16])
        syncMeshType(endpoint, P[16], Enum.MeshType.Cylinder)
        syncMeshScale(endpoint, P[16], Vector3.new(0.5,1,1))
        syncMeshOffset(endpoint, P[16], Vector3.new(0.800000011920929,0,0))
    end)
end
if P[21] then
    task.spawn(function()
        createMesh(endpoint, P[21])
        syncMeshType(endpoint, P[21], Enum.MeshType.Cylinder)
        syncMeshScale(endpoint, P[21], Vector3.new(0.5,1,1))
        syncMeshOffset(endpoint, P[21], Vector3.new(0.800000011920929,0,0))
    end)
end
if P[26] then
    task.spawn(function()
        createMesh(endpoint, P[26])
        syncMeshType(endpoint, P[26], Enum.MeshType.Cylinder)
        syncMeshScale(endpoint, P[26], Vector3.new(0.5,1,1))
        syncMeshOffset(endpoint, P[26], Vector3.new(0.800000011920929,0,0))
    end)
end
if P[39] then
    task.spawn(function()
        createMesh(endpoint, P[39])
        syncMeshType(endpoint, P[39], Enum.MeshType.Cylinder)
        syncMeshScale(endpoint, P[39], Vector3.new(0.5,1,1))
        syncMeshOffset(endpoint, P[39], Vector3.new(0.800000011920929,0,0))
    end)
end
if P[385] then
    task.spawn(function()
        createMesh(endpoint, P[385])
        syncMeshType(endpoint, P[385], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[385], Vector3.new(1,1,1))
        syncMeshOffset(endpoint, P[385], Vector3.new(0,0,0))
    end)
end
if P[1619] then
    task.spawn(function()
        createMesh(endpoint, P[1619])
        syncMeshType(endpoint, P[1619], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[1619], Vector3.new(1.25,1.25,1.25))
        syncMeshOffset(endpoint, P[1619], Vector3.new(0,0,0))
    end)
end
if P[1627] then
    task.spawn(function()
        createMesh(endpoint, P[1627])
        syncMeshType(endpoint, P[1627], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[1627], Vector3.new(1.25,1.25,1.25))
        syncMeshOffset(endpoint, P[1627], Vector3.new(0,0,0))
    end)
end
if P[1638] then
    task.spawn(function()
        createMesh(endpoint, P[1638])
        syncMeshType(endpoint, P[1638], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[1638], Vector3.new(1.25,1.25,1.25))
        syncMeshOffset(endpoint, P[1638], Vector3.new(0,0,0))
    end)
end
if P[1641] then
    task.spawn(function()
        createMesh(endpoint, P[1641])
        syncMeshType(endpoint, P[1641], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[1641], Vector3.new(1.25,1.25,1.25))
        syncMeshOffset(endpoint, P[1641], Vector3.new(0,0,0))
    end)
end
if P[1643] then
    task.spawn(function()
        createMesh(endpoint, P[1643])
        syncMeshType(endpoint, P[1643], Enum.MeshType.Head)
        syncMeshScale(endpoint, P[1643], Vector3.new(1.25,1.25,1.25))
        syncMeshOffset(endpoint, P[1643], Vector3.new(0,0,0))
    end)
end
task.wait(0.3)
if P[16] then
    task.spawn(function()
        createDecal(endpoint, P[16], Enum.NormalId.Left)
        setDecalTexture(endpoint, P[16], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Left)
    end)
end
if P[16] then
    task.spawn(function()
        createDecal(endpoint, P[16], Enum.NormalId.Right)
        setDecalTexture(endpoint, P[16], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Right)
    end)
end
if P[21] then
    task.spawn(function()
        createDecal(endpoint, P[21], Enum.NormalId.Left)
        setDecalTexture(endpoint, P[21], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Left)
    end)
end
if P[21] then
    task.spawn(function()
        createDecal(endpoint, P[21], Enum.NormalId.Right)
        setDecalTexture(endpoint, P[21], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Right)
    end)
end
if P[26] then
    task.spawn(function()
        createDecal(endpoint, P[26], Enum.NormalId.Left)
        setDecalTexture(endpoint, P[26], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Left)
    end)
end
if P[26] then
    task.spawn(function()
        createDecal(endpoint, P[26], Enum.NormalId.Right)
        setDecalTexture(endpoint, P[26], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Right)
    end)
end
if P[39] then
    task.spawn(function()
        createDecal(endpoint, P[39], Enum.NormalId.Left)
        setDecalTexture(endpoint, P[39], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Left)
    end)
end
if P[39] then
    task.spawn(function()
        createDecal(endpoint, P[39], Enum.NormalId.Right)
        setDecalTexture(endpoint, P[39], "http://www.roblox.com/asset/?id=187012669", Enum.NormalId.Right)
    end)
end
if P[81] then
    task.spawn(function()
        createDecal(endpoint, P[81], Enum.NormalId.Front)
        setDecalTexture(endpoint, P[81], "rbxthumb://type=Asset&id=119416256159676&w=420&h=420", Enum.NormalId.Front)
    end)
end
if P[1349] then
    task.spawn(function()
        createDecal(endpoint, P[1349], Enum.NormalId.Top)
        setDecalTexture(endpoint, P[1349], "rbxasset://textures/SpawnLocation.png", Enum.NormalId.Top)
    end)
end
if P[1351] then
    task.spawn(function()
        createDecal(endpoint, P[1351], Enum.NormalId.Front)
        setDecalTexture(endpoint, P[1351], "rbxthumb://type=Asset&id=82934289144205&w=420&h=420", Enum.NormalId.Front)
    end)
end
task.wait(0.3)
if P[385] then
    task.spawn(function()
        createLight(endpoint, P[385], "PointLight")
        syncLight(endpoint, P[385], "PointLight", 2, 60, Color3.new(1,1,1), false, nil, 90)
    end)
end
task.wait(0.3)
local G = {}
task.spawn(function()
    G[1120] = createGroup(endpoint, "Model", workspace, {1121,1122})
    setName(endpoint, G[1120], "Mountain Border Part")
end)
task.spawn(function()
    G[1252] = createGroup(endpoint, "Model", workspace, {1253,1254})
    setName(endpoint, G[1252], "Small Mountain Border Part")
end)
task.spawn(function()
    G[96] = createGroup(endpoint, "Model", workspace, {97,98,99,100,101,102,103,104,105,117,118,119,123,157,158,159,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,298,299,300,301,302,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,383,384,385,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,633,634,635,636,637,638,639,640,641,642,643,644,645,646,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683})
    setName(endpoint, G[96], "My House")
end)
task.spawn(function()
    G[1099] = createGroup(endpoint, "Model", workspace, {1100,1101})
    setName(endpoint, G[1099], "Mountain Border Part")
end)
task.spawn(function()
    G[1417] = createGroup(endpoint, "Model", workspace, {1418,1420})
    setName(endpoint, G[1417], "Particles")
end)
task.spawn(function()
    G[1243] = createGroup(endpoint, "Model", workspace, {1244,1245})
    setName(endpoint, G[1243], "Mountain Border Part")
end)
task.spawn(function()
    G[1423] = createGroup(endpoint, "Model", workspace, {1424,1425,1426,1427,1428,1429,1432,1435})
    setName(endpoint, G[1423], "Furnace")
end)
task.spawn(function()
    G[1087] = createGroup(endpoint, "Model", workspace, {1088,1089})
    setName(endpoint, G[1087], "Mountain Border Part")
end)
task.spawn(function()
    G[1249] = createGroup(endpoint, "Model", workspace, {1250,1251})
    setName(endpoint, G[1249], "Small Mountain Border Part")
end)
task.spawn(function()
    G[124] = createGroup(endpoint, "Model", workspace, {125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156})
    setName(endpoint, G[124], "Chimney")
end)
task.spawn(function()
    G[1201] = createGroup(endpoint, "Model", workspace, {1202,1203})
    setName(endpoint, G[1201], "Mountain Border Part")
end)
task.spawn(function()
    G[1207] = createGroup(endpoint, "Model", workspace, {1208,1209})
    setName(endpoint, G[1207], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1129] = createGroup(endpoint, "Model", workspace, {1130,1131})
    setName(endpoint, G[1129], "Mountain Border Part")
end)
task.spawn(function()
    G[1367] = createGroup(endpoint, "Model", workspace, {1368,1369,1372,1375,1377})
    setName(endpoint, G[1367], "Sink System")
end)
task.spawn(function()
    G[1105] = createGroup(endpoint, "Model", workspace, {1106,1107})
    setName(endpoint, G[1105], "Mountain Border Part")
end)
task.spawn(function()
    G[1135] = createGroup(endpoint, "Model", workspace, {1136,1137})
    setName(endpoint, G[1135], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1273] = createGroup(endpoint, "Model", workspace, {1274,1275})
    setName(endpoint, G[1273], "Small Mountain Border Part")
end)
task.spawn(function()
    G[106] = createGroup(endpoint, "Model", workspace, {107,108,109,110,111,112,113,114,115,116})
    setName(endpoint, G[106], "Model3")
end)
task.spawn(function()
    G[1393] = createGroup(endpoint, "Model", workspace, {1520})
    setName(endpoint, G[1393], "Hell's Gate")
end)
task.spawn(function()
    G[1353] = createGroup(endpoint, "Model", workspace, {1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392})
    setName(endpoint, G[1353], "WorkingSink")
end)
task.spawn(function()
    G[1288] = createGroup(endpoint, "Model", workspace, {1289,1290})
    setName(endpoint, G[1288], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1180] = createGroup(endpoint, "Model", workspace, {1181,1182})
    setName(endpoint, G[1180], "Mountain Border Part")
end)
task.spawn(function()
    G[83] = createGroup(endpoint, "Model", workspace, {84,88,89,92,93,684,687,694,699,702,704,712,717,720,726,733,737,739,741,1056,1059,1061,1063,1069,1076,1079,1291,1295,1299,1300,1303,1304,1308,1311,1313,1314,1317,1320,1323,1327,1334,1339,1344})
    setName(endpoint, G[83], "Classic Map")
end)
task.spawn(function()
    G[1258] = createGroup(endpoint, "Model", workspace, {1259,1260})
    setName(endpoint, G[1258], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1195] = createGroup(endpoint, "Model", workspace, {1196,1197})
    setName(endpoint, G[1195], "Small Mountain Border Part")
end)
task.spawn(function()
    G[979] = createGroup(endpoint, "Model", workspace, {980,983,985,989,991,994,995,996,997,999,1004,1005,1015,1018,1021,1023,1027,1031,1033,1036,1043,1044,1045,1048})
end)
task.spawn(function()
    G[1096] = createGroup(endpoint, "Model", workspace, {1097,1098})
    setName(endpoint, G[1096], "Mountain Border Part")
end)
task.spawn(function()
    G[1102] = createGroup(endpoint, "Model", workspace, {1103,1104})
    setName(endpoint, G[1102], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1646] = createGroup(endpoint, "Model", workspace, {1647,1648,1649,1651})
    setName(endpoint, G[1646], "Pipes")
end)
task.spawn(function()
    G[1264] = createGroup(endpoint, "Model", workspace, {1265,1266})
    setName(endpoint, G[1264], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1568] = createGroup(endpoint, "Model", workspace, {1569,1571,1573,1575,1576,1578,1580,1581,1583,1585,1587,1589,1591,1593,1595,1597,1599,1600,1602,1604,1606,1608})
    setName(endpoint, G[1568], "M1")
end)
task.spawn(function()
    G[1473] = createGroup(endpoint, "Model", workspace, {1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517})
    setName(endpoint, G[1473], "Lavafall")
end)
task.spawn(function()
    G[1270] = createGroup(endpoint, "Model", workspace, {1271,1272})
    setName(endpoint, G[1270], "Mountain Border Part")
end)
task.spawn(function()
    G[1123] = createGroup(endpoint, "Model", workspace, {1124,1125})
    setName(endpoint, G[1123], "Mountain Border Part")
end)
task.spawn(function()
    G[1526] = createGroup(endpoint, "Model", workspace, {1527,1529,1531,1533,1534,1536,1538,1539,1541,1543,1545,1547,1549,1551,1553,1555,1557,1558,1560,1562,1564,1566})
    setName(endpoint, G[1526], "M2")
end)
task.spawn(function()
    G[1114] = createGroup(endpoint, "Model", workspace, {1115,1116})
    setName(endpoint, G[1114], "Small Mountain Border Part")
end)
task.spawn(function()
    G[303] = createGroup(endpoint, "Model", workspace, {304,305,306,307,308,309,310,311,312,313})
end)
task.spawn(function()
    G[1141] = createGroup(endpoint, "Model", workspace, {1142,1143})
    setName(endpoint, G[1141], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1521] = createGroup(endpoint, "Model", workspace, {1522,1523,1524})
    setName(endpoint, G[1521], "Gate")
end)
task.spawn(function()
    G[1111] = createGroup(endpoint, "Model", workspace, {1112,1113})
    setName(endpoint, G[1111], "Mountain Border Part")
end)
task.spawn(function()
    G[1126] = createGroup(endpoint, "Model", workspace, {1127,1128})
    setName(endpoint, G[1126], "Mountain Border Part")
end)
task.spawn(function()
    G[1276] = createGroup(endpoint, "Model", workspace, {1277,1278})
    setName(endpoint, G[1276], "Mountain Border Part")
end)
task.spawn(function()
    G[1440] = createGroup(endpoint, "Model", workspace, {1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472})
    setName(endpoint, G[1440], "Lavapool")
end)
task.spawn(function()
    G[1171] = createGroup(endpoint, "Model", workspace, {1172,1173})
    setName(endpoint, G[1171], "Mountain Border Part")
end)
task.spawn(function()
    G[1610] = createGroup(endpoint, "Model", workspace, {1611,1612,1613,1614,1615,1616,1617,1618,1619,1621,1622,1623,1624,1625,1626,1627,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1640,1641,1643,1645})
    setName(endpoint, G[1610], "Demons")
end)
task.spawn(function()
    G[1396] = createGroup(endpoint, "Model", workspace, {1397,1398,1399})
    setName(endpoint, G[1396], "Crystals")
end)
task.spawn(function()
    G[1147] = createGroup(endpoint, "Model", workspace, {1148,1149})
    setName(endpoint, G[1147], "Small Mountain Border Part")
end)
task.spawn(function()
    G[647] = createGroup(endpoint, "Model", workspace, {648,649,650,651,652,653,654,655,656,657})
    setName(endpoint, G[647], "Model5")
end)
task.spawn(function()
    G[372] = createGroup(endpoint, "Model", workspace, {373,374,375,376,377,378,379,380,381,382})
    setName(endpoint, G[372], "Model7")
end)
task.spawn(function()
    G[1282] = createGroup(endpoint, "Model", workspace, {1283,1284})
    setName(endpoint, G[1282], "Mountain Border Part")
end)
task.spawn(function()
    G[1261] = createGroup(endpoint, "Model", workspace, {1262,1263})
    setName(endpoint, G[1261], "Mountain Border Part")
end)
task.spawn(function()
    G[1144] = createGroup(endpoint, "Model", workspace, {1145,1146})
    setName(endpoint, G[1144], "Mountain Border Part")
end)
task.spawn(function()
    G[1219] = createGroup(endpoint, "Model", workspace, {1220,1221})
    setName(endpoint, G[1219], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1401] = createGroup(endpoint, "Model", workspace, {1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415})
    setName(endpoint, G[1401], "baseplate")
end)
task.spawn(function()
    G[1108] = createGroup(endpoint, "Model", workspace, {1109,1110})
    setName(endpoint, G[1108], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1240] = createGroup(endpoint, "Model", workspace, {1241,1242})
    setName(endpoint, G[1240], "Mountain Border Part")
end)
task.spawn(function()
    G[1084] = createGroup(endpoint, "Model", workspace, {1085,1086})
    setName(endpoint, G[1084], "Mountain Border Part")
end)
task.spawn(function()
    G[1216] = createGroup(endpoint, "Model", workspace, {1217,1218})
    setName(endpoint, G[1216], "Mountain Border Part")
end)
task.spawn(function()
    G[1234] = createGroup(endpoint, "Model", workspace, {1235,1236})
    setName(endpoint, G[1234], "Mountain Border Part")
end)
task.spawn(function()
    G[1186] = createGroup(endpoint, "Model", workspace, {1187,1188})
    setName(endpoint, G[1186], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1159] = createGroup(endpoint, "Model", workspace, {1160,1161})
    setName(endpoint, G[1159], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1174] = createGroup(endpoint, "Model", workspace, {1175,1176})
    setName(endpoint, G[1174], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1162] = createGroup(endpoint, "Model", workspace, {1163,1164})
    setName(endpoint, G[1162], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1204] = createGroup(endpoint, "Model", workspace, {1205,1206})
    setName(endpoint, G[1204], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1168] = createGroup(endpoint, "Model", workspace, {1169,1170})
    setName(endpoint, G[1168], "Mountain Border Part")
end)
task.spawn(function()
    G[754] = createGroup(endpoint, "Model", workspace, {755,758,761,762,766,771,775,776,777,780,783,792,795,796,801,803,808,811,813,814,815,818,821,823})
    setName(endpoint, G[754], "Model2")
end)
task.spawn(function()
    G[1156] = createGroup(endpoint, "Model", workspace, {1157,1158})
    setName(endpoint, G[1156], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1246] = createGroup(endpoint, "Model", workspace, {1247,1248})
    setName(endpoint, G[1246], "Mountain Border Part")
end)
task.spawn(function()
    G[1093] = createGroup(endpoint, "Model", workspace, {1094,1095})
    setName(endpoint, G[1093], "Mountain Border Part")
end)
task.spawn(function()
    G[1225] = createGroup(endpoint, "Model", workspace, {1226,1227})
    setName(endpoint, G[1225], "Small Mountain Border Part")
end)
task.spawn(function()
    G[9] = createGroup(endpoint, "Model", workspace, {10,14,16,21,26,31,39})
    setName(endpoint, G[9], ":-)")
end)
task.spawn(function()
    G[287] = createGroup(endpoint, "Model", workspace, {288,289,290,291,292,293,294,295,296,297})
    setName(endpoint, G[287], "Model4")
end)
task.spawn(function()
    G[1210] = createGroup(endpoint, "Model", workspace, {1211,1212})
    setName(endpoint, G[1210], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1237] = createGroup(endpoint, "Model", workspace, {1238,1239})
    setName(endpoint, G[1237], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1213] = createGroup(endpoint, "Model", workspace, {1214,1215})
    setName(endpoint, G[1213], "Mountain Border Part")
end)
task.spawn(function()
    G[1177] = createGroup(endpoint, "Model", workspace, {1178,1179})
    setName(endpoint, G[1177], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1132] = createGroup(endpoint, "Model", workspace, {1133,1134})
    setName(endpoint, G[1132], "Small Mountain Border Part")
end)
task.spawn(function()
    G[160] = createGroup(endpoint, "Model", workspace, {161,162,163,164,165,166,167,168,169,170})
    setName(endpoint, G[160], "Model6")
end)
task.spawn(function()
    G[56] = createGroup(endpoint, "Model", workspace, {57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80})
    setName(endpoint, G[56], "chairs")
end)
task.spawn(function()
    G[1222] = createGroup(endpoint, "Model", workspace, {1223,1224})
    setName(endpoint, G[1222], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1267] = createGroup(endpoint, "Model", workspace, {1268,1269})
    setName(endpoint, G[1267], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1081] = createGroup(endpoint, "Model", workspace, {1082,1083})
    setName(endpoint, G[1081], "Mountain Border Part")
end)
task.spawn(function()
    G[1255] = createGroup(endpoint, "Model", workspace, {1256,1257})
    setName(endpoint, G[1255], "Mountain Border Part")
end)
task.spawn(function()
    G[1165] = createGroup(endpoint, "Model", workspace, {1166,1167})
    setName(endpoint, G[1165], "Mountain Border Part")
end)
task.spawn(function()
    G[1231] = createGroup(endpoint, "Model", workspace, {1232,1233})
    setName(endpoint, G[1231], "Mountain Border Part")
end)
task.spawn(function()
    G[1138] = createGroup(endpoint, "Model", workspace, {1139,1140})
    setName(endpoint, G[1138], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1183] = createGroup(endpoint, "Model", workspace, {1184,1185})
    setName(endpoint, G[1183], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1198] = createGroup(endpoint, "Model", workspace, {1199,1200})
    setName(endpoint, G[1198], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1117] = createGroup(endpoint, "Model", workspace, {1118,1119})
    setName(endpoint, G[1117], "Mountain Border Part")
end)
task.spawn(function()
    G[1192] = createGroup(endpoint, "Model", workspace, {1193,1194})
    setName(endpoint, G[1192], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1189] = createGroup(endpoint, "Model", workspace, {1190,1191})
    setName(endpoint, G[1189], "Mountain Border Part")
end)
task.spawn(function()
    G[743] = createGroup(endpoint, "Model", workspace, {744,747,749,751,824,825,826,828,894,895,897,900,904,908,910,912,915,918,922,925,929,930,934,938,940,942,943,945,946,947,949,950,951,954,959,961,963,964,965,968,971,1049,1052,1053,1054})
    setName(endpoint, G[743], "DarkMarine911's Classic Tower Remade")
end)
task.spawn(function()
    G[1228] = createGroup(endpoint, "Model", workspace, {1229,1230})
    setName(endpoint, G[1228], "Mountain Border Part")
end)
task.spawn(function()
    G[45] = createGroup(endpoint, "Model", workspace, {46,47,48,49,50,51,52,53,54,55})
    setName(endpoint, G[45], "table")
end)
task.spawn(function()
    G[1285] = createGroup(endpoint, "Model", workspace, {1286,1287})
    setName(endpoint, G[1285], "Mountain Border Part")
end)
task.spawn(function()
    G[832] = createGroup(endpoint, "Model", workspace, {833,836,837,841,843,845,847,850,852,854,857,860,863,864,868,871,874,878,879,881,884,886,888,891})
    setName(endpoint, G[832], "Model3")
end)
task.spawn(function()
    G[1153] = createGroup(endpoint, "Model", workspace, {1154,1155})
    setName(endpoint, G[1153], "Small Mountain Border Part")
end)
task.spawn(function()
    G[1150] = createGroup(endpoint, "Model", workspace, {1151,1152})
    setName(endpoint, G[1150], "Small Mountain Border Part")
end)
task.spawn(function()
    G[542] = createGroup(endpoint, "Model", workspace, {543,544,545,546,547,548,549,550,551,552})
    setName(endpoint, G[542], "Model2")
end)
task.spawn(function()
    G[1090] = createGroup(endpoint, "Model", workspace, {1091,1092})
    setName(endpoint, G[1090], "Mountain Border Part")
end)
task.spawn(function()
    G[1279] = createGroup(endpoint, "Model", workspace, {1280,1281})
    setName(endpoint, G[1279], "Small Mountain Border Part")
end)
task.wait(0.3)
task.wait(0.5)
local missed = {}
for id, part in pairs(P) do
    if part and not part.Anchored then
        missed[#missed+1] = {Part = part, Anchored = true}
    end
end
if #missed > 0 then
    print("Fixing", #missed, "missed anchor(s)...")
    for i = 1, #missed, 100 do
        local chunk = {}
        for j = i, math.min(i+99, #missed) do
            chunk[#chunk+1] = missed[j]
        end
        endpoint:InvokeServer("SyncAnchor", chunk)
        task.wait()
    end
end

RequestCommand:InvokeServer(";res all")
task.wait(0.2)
RequestCommand:InvokeServer(";re all")
