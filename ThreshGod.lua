-- By Support
Config = scriptConfig("Thresh", "Thresh:")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, false)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
 
 
 
OnLoop(function(myHero)
    if IWalkConfig.Combo then
               local target = GetTarget(1100, DAMAGE_MAGIC)
                if ValidTarget(target, 1100) then
                               
            local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1900,500,1100,70,true,true) --               GetPredictionForPlayer(startPosition, targetUnit, targetUnitMoveSpeed, spellTravelSpeed, spellDelay, spellRange, spellWidth, collision, addHitBox)
                   
                     if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 and Config.Q then
                     CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
                     end
 
                    local Ally = GetObjectType(Object);
                    if Ally == Obj_AI_Hero then
                    local WPred = GetPredictionForPlayer(GetMyHeroPos(),ally,GetMoveSpeed(ally),1875,250,800,55,false,true)
                    if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 and Config.W then
                    CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
                    end
                    end
                    end
 
 
                     local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1875,250,400,55,false,true)
                     if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 and Config.E then
                     CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
                     end
 
           
                    local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),0,250,450,55,false,true)
                     if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 and Config.R then
                     CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
                     end
            end
    end
end)
