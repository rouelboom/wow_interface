--[[
	ownerSelector.lua
		A owner selector button
--]]

local ADDON, Addon = ...
local Sushi = LibStub('Sushi-3.1')
local L = LibStub('AceLocale-3.0'):GetLocale(ADDON)
local OwnerSelector = Addon.Tipped:NewClass('OwnerSelector', 'Button', true)


--[[ Construct ]]--

function OwnerSelector:New(...)
	local b = self:Super(OwnerSelector):New(...)
	b:RegisterEvent('UNIT_PORTRAIT_UPDATE', 'Update')
	b:RegisterFrameSignal('OWNER_CHANGED', 'Update')
	b:SetScript('OnClick', b.OnClick)
	b:SetScript('OnEnter', b.OnEnter)
	b:SetScript('OnLeave', b.OnLeave)
	b:SetScript('OnShow', b.Update)
	b:RegisterForClicks('anyUp')
	b:Update()
	return b
end

function OwnerSelector:Update()
	local owner = self:GetOwner()
	if owner.offline then
		local icon, coords = owner:GetIcon()
		if coords then
			local u,v,w,z = unpack(coords)
			local s = (v-u) * 0.06

			self.Icon:SetTexCoord(u+s, v-s, w+s, z-s)
			self.Icon:SetTexture(icon)
		else
			self.Icon:SetTexCoord(0,1,0,1)
			self.Icon:SetAtlas(icon)
		end
	else
		SetPortraitTexture(self.Icon, 'player')
		self.Icon:SetTexCoord(.05,.95,.05,.95)
	end
end


--[[ Events ]]--

function OwnerSelector:OnClick(button)
	if button == 'LeftButton' then
		local drop = Sushi.Dropdown:Toggle(self)
		if drop then
			drop:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 0, -11)
			drop:SetChildren(function()
				drop:Add {text = L.SelectCharacter, isTitle = true }

				for i, owner in Addon.Owners:Iterate() do
					if not owner.isguild or Addon.Frames:IsEnabled('guild') then
						local name = owner:GetIconMarkup(14,-5,0) .. owner:GetColorMarkup():format(owner.name)

						drop:Add(Addon.DropButton(drop, {
							text = name,
							checked = owner == self:GetOwner(),
							func = function()
								Addon.Frames:Show(owner.isguild and 'guild' or self:GetFrameID(), owner)
							end,
							delFunc = owner.offline and function()
									Sushi.Popup {
										text = L.ConfirmDelete:format(name), button1 = OKAY, button2 = CANCEL,
										whileDead = 1, exclusive = 1, hideOnEscape = 1,
										OnAccept = function()
											owner:Delete()
										end
									}
							end,
						}))
					end
				end
			end)
		end
	else
		self:GetFrame():SetOwner(nil)
	end
end

function OwnerSelector:OnEnter()
	GameTooltip:SetOwner(self:GetTipAnchor())
	GameTooltip:SetText(CHARACTER)
	GameTooltip:AddLine(L.TipChangePlayer:format(L.LeftClick), 1, 1, 1)
	GameTooltip:AddLine(L.TipResetPlayer:format(L.RightClick), 1, 1, 1)
	GameTooltip:Show()
end
