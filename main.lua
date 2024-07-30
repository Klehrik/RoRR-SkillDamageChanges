-- Skill Damage Changes v1.0.2
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")
--mods.on_all_mods_loaded(function() for k, v in pairs(mods) do if type(v) == "table" and v.hfuncs then Helper = v end end end)

local init = false



-- ========== Main ==========

local function edit_skill_damage(id, damage, description)
    if damage then gm.array_set(gm.variable_global_get("class_skill")[id], 7, damage) end
    if description then gm.array_set(gm.variable_global_get("class_skill")[id], 3, description) end
end


gm.pre_script_hook(gm.constants.__input_system_tick, function()
    -- Change skill values
    if not init then
        init = true
        
        -- [Commando]
        -- Double Tap:          60% -> 65%
        edit_skill_damage(2, 0.65, "Shoot rapidly for <y>65% damage.</c>")
        -- Full Metal Jacket:   230% -> 260%
        edit_skill_damage(3, 2.6, "Shoot <y>through enemies</c> for <y>260% damage, knocking them back.</c>")
        -- Suppressive Fire:    6x60% -> 6x65%
        edit_skill_damage(5, 0.65, "Fire rapidly, <y>stunning</c> and hitting nearby enemies for <y>6x65% damage</c>, scaling with <y>attack speed</c>.")
        edit_skill_damage(6, 0.65, "Fire rapidly, <y>stunning</c> and hitting nearby enemies for <y>10x65% damage</c>, scaling with <y>attack speed</c>.")


        -- [Huntress]
        -- Pierce:              Description fix
        edit_skill_damage(36, nil, "Hold to charge an arrow shot, firing for up to <y>750% damage</c>. \n<b>Move more slowly While casting.</c>")
        -- Laser Cyclone:       Description fix
        edit_skill_damage(37, nil, "Throw a <y>large, slow-moving</c> glaive, dealing <y>100% damage</c> over time, before returning.")

        
        -- [Enforcer]
        -- Shrapnel Grenade:    3x60% -> 3x75%
        edit_skill_damage(16, 0.75, "Fire a <b>shrapnel grenade</c>, exploding for <y>3x75% damage</c>. <b>Holds up to 4 grenades</c>, reactivate when empty to <y>reload your weapon</c>.")

        
        -- [Bandit]
        -- Blast:               80% -> 90%
        edit_skill_damage(22, 0.9, "Fire a powerful slug for <y>90% damage.</c>")
        -- Lights Out:          500% -> 600%, Description fix
        edit_skill_damage(25, 6.0, "Take aim for a headshot, dealing <y>600% damage</c>. If this ability <r>kills an enemy</c>, the Bandit's <b>cooldowns are all reset to 0.</c>")
        edit_skill_damage(26, 6.0, "Take aim a headshot for <y>2x600% damage</c>. If this ability <r>kills an enemy</c>, the Bandit's <b>cooldowns are all reset to 0.</c>")
        -- Standoff:            500% -> 600%, Description fix
        edit_skill_damage(29, 6.0, "Take aim for a headshot, dealing <y>600% damage</c>. If this ability <r>kills an enemy</c>, gain 1 temporary stack of <b>Standoff.</c>\n<b>Standoff</c> stacks increase <y>damage by 25%</c> each and last 15 seconds.")
        edit_skill_damage(30, 6.0, "Take aim a headshot for <y>2x600% damage</c>. If this ability <r>kills an enemy</c>, gain 1 temporary stack of <b>Standoff.</c><b>Standoff</c> stacks increase <y>damage by 25%</c> each and last 20 seconds.")


        -- [HAN-D]
        -- DISASSEMBLE:         Description fix
        edit_skill_damage(47, nil, "TEAR COMBATANTS APART FOR <y>5x95% DAMAGE</c>, SCALING WITH <y>ATTACK SPEED.</c>\nCAN MOVE SLOWLY WHILE CASTING.")
        edit_skill_damage(48, nil, "TEAR COMBATANTS APART FOR <y>5x95% DAMAGE</c>, SCALING WITH <y>ATTACK SPEED</c>, BURNING THEM FOR <y>20% TOTAL DAMAGE OVER TIME.</c>\nCAN MOVE SLOWLY WHILE CASTING.")


        -- [Engineer]
        -- Shockwave Mine:      120% -> 250%
        edit_skill_damage(55, 2.5, "<y>Drop a defensive mine</c> that knocks enemies back a significant distance for <y>250% damage</c>. Can trigger up to 3 times.\n<b>Hold up to 3.</c>")
        -- Auto Turret:         Description fix
        edit_skill_damage(52, nil, "<y>Drop a turret</c> that shoots for <y>3x60% damage</c>, inheriting all of your items.\n<b>Hold up to 2.</c>")
        edit_skill_damage(53, nil, "<y>Drop a turret</c> that shoots for <y>3x60% damage</c>, inheriting all of your items.\n<b>Hold up to 3.</c>")
        -- V.0.2 Prototype Laser Turret:    Description fix
        edit_skill_damage(56, nil, "<y>Drop a turret</c> that <b>charges up over 8 seconds</c> and fires for <y>1300% damage </c> per hit, scaling with <y>attack speed</c> and <b>inheriting all of your items</c>. \nFragile, rapidly <r>damaging itself</c> while firing.")
        edit_skill_damage(57, nil, "<y>Drop a turret</c> that <b>charges up over 8 seconds</c> and fires for <y>1300% damage </c> per hit, scaling with <y>attack speed</c> and <b>inheriting all of your items</c>. \nFragile, rapidly <r>damaging itself</c> while firing. <b>Hold up to 2.</c>")


        -- [Miner]
        -- Crush:               Description fix
        edit_skill_damage(58, nil, "Crush nearby enemies for <y>160% damage</c>. Gain <b>heat</c> on hit. Deals an additional <y>54% damage</c> while <b>Scorching</c>.")


        -- [Sniper]
        -- Heavy Recoil:        200% -> 320%
        edit_skill_damage(75, 3.2, "<y>Fire at the ground,</c> launching yourself up and away. Deals <y>320% damage</c>.")


        -- [Acrid]
        -- Festering Wounds:    Description fix
        edit_skill_damage(76, nil, "Maul an enemy for <y>120% damage</c>. The target is poisoned for <y>24% TOTAL damage per second.</c>")
        -- Toxic Bubble:        Description fix
        edit_skill_damage(82, nil, "Spit out a Toxic Bubble, dealing <y>50% damage over time</c>, and slowing enemies, exploding for <y>500% damage</c> after 5 seconds. \nCan be pushed by attacking.")


        -- [Mercenary]
        -- Whirlwind:           2x80% -> 2x130%
        edit_skill_damage(85, 1.3, "Quickly slice twice, dealing <y>2x130% damage</c> to all nearby enemies.")


        -- [Loader]
        -- Bullet Punch:        1000% -> 1500%
        edit_skill_damage(98, 15.0, "Charge up and slam enemies forward, for <y>up to 1500% damage.</c>")
        -- Short Circuit:       Description Fix
        edit_skill_damage(99, nil, "Crash down and <y>stun</c> enemies for <y>500% damage</c> in a small radius, and <y>167% damage</c> in larger area.")


        -- [CHEF]
        -- SLICE:               125% -> 200%
        edit_skill_damage(107, 2.0, "STRETCH YOUR ARMS AND SLASH CUSTOMERS FOR <y>200% DAMAGE.</c>")
        -- COOK:                6x50% -> 6x80%, Description is already correct
        edit_skill_damage(109, 0.8)
        edit_skill_damage(110, 0.8)


        -- [Pilot]
        -- Rapid Fire:          Description Fix
        edit_skill_damage(116, nil, "Rapidly fire weapon for <y>65% damage</c>.")
        -- Target Acquired!:    Description Fix
        edit_skill_damage(112, nil, "Shoot <y>diagonally upward</c> for <y>3x125% damage.</c> <b>If airborne</c>, shoot <y>downward</c> instead. <b>Hold</c> to fire continuously.")
        -- Aerial Support:      Description Fix
        edit_skill_damage(118, nil, "<b>Mark</c> an enemy in front of you, launching an airstrike for <y>10x125% damage</c> over time.")
        edit_skill_damage(119, nil, "<b>Mark</c> an enemy in front of you, launching an airstrike for <y>20x125% damage</c> over time.")
    
    
        -- [Drifter]
        -- Scrap Cube:          Description Fix
        edit_skill_damage(134, nil, "Consume a <b>small amount of scrap</c> and toss out a large <y>scrap cube</c> for <y>150% damage</c>. \nThe cube can be pushed and shattered, dealing <y>300% damage</c> while pushed. Fragile!")
    end


    -- Loader Bullet Punch charge bar
    -- Apparently changing the bar time does not actually do anything damagewise
    -- local bars = Helper.find_active_instance_all(gm.constants.oCustomBar)
    -- for _, b in ipairs(bars) do
    --     if b.sprite_index == gm.constants.sLoaderBar and b.maxtime > 120.0 then
    --         b.time = 60.0
    --         b.maxtime = 60.0
    --     end
    -- end
end)