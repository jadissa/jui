 -------------------------------------
-- jui --------------
-- Emerald Dream/Grobbulus --------

-- 
local ui  = LibStub( 'AceAddon-3.0' ):NewAddon( 'jui' )

function ui:round( num )
  if num >= 0 then
    return math.floor( num+.5 )
  else 
    return math.ceil( num-.5 ) 
  end
end

function ui:OnInitialize( ) end

function ui:MoveFrame( frame )
  if type( frame ) == 'string' then
    frame = _G[ frame ]
  end
  if type( frame ) == 'table' and type( frame.IsObjectType ) == 'function' and frame:IsObjectType( 'Frame' ) then
    self[ 'fname' ] = frame:GetName( )
    if self[ 'hooked' ] and self[ 'hooked' ][ self[ 'fname' ] ] then
      return false
    end
    frame:SetMovable( true )
    frame:SetUserPlaced( true )
    if self[ 'settings' ][ 'frames' ][ self[ 'fname' ] ] then
      local s = self[ 'settings' ][ 'frames' ][ self[ 'fname' ] ]
      local _ap, _, _relp, _x = frame:GetPoint( )
      if _ap ~= s[ 'anchor_point' ] or _relp ~= s[ 'relative_point' ] or ui:round( tonumber( _x ) ) ~= s[ 'x' ] then
        frame:ClearAllPoints( )
        frame:SetPoint( s[ 'anchor_point' ], UIParent, s[ 'relative_point' ], s[ 'x' ], s[ 'y' ] )
        if s[ 'width' ] ~= nil then
          frame:SetWidth( s[ 'width' ] )
        end
        if s[ 'height' ] ~= nil then
          frame:SetHeight( s[ 'height' ] )
        end
        if s[ 'alpha' ] ~= nil then
          frame:SetAlpha( s[ 'alpha' ] )
        end
        frame:SetUserPlaced( true )
        frame:StopMovingOrSizing( )
        frame:SetMovable( s[ 'movable' ] )
        self[ 'hooked' ][ self[ 'fname' ] ] = true
      end
    end
  end
end
function ui:SetConsoleVars( group )
  if self[ 'settings' ][ 'cvars' ][ group ] ~= nil then
    for var, i in pairs( self[ 'settings' ][ 'cvars' ][ group ] ) do
      if tostring( GetCVar( var ) ) ~= tostring( i ) then
        --print( var .. '|' .. GetCVar( var ) .. ' : ' .. i )
        SetCVar( var, i )
      end
    end
  end
end
function ui:OnEnable( )
  self:Enable( )

  self[ 'hooked' ]		= { }
  self[ 'settings' ]	= {
    frames  = {
      PlayerFrame = {
        alpha = 0.9,
        movable = false,
        anchor_point = 'right',
        relative_point = 'center',
        x = -20,
        y = -300,
      },
      TargetFrame = {
        alpha = 0.9,
        movable = false,
        anchor_point = 'right',
        relative_point = 'center',
        x = 250,
        y = -300,
      },
      FocusFrame = {
        alpha = 0.9,
        movable = false,
        anchor_point = 'right',
        relative_point = 'center',
        x = 140,
        y = -120,
      },
      ChatFrame1 = {
        alpha = 1,
        movable = false,
        anchor_point = 'right',
        relative_point = 'center',
        width = 474,
        height = 350,
        x = -600,
        y = -220,
      },
      BuffFrame = {
        alpha = 0.9,
        scale = 0.7,
        movable = false,
        anchor_point = 'bottomleft',
        relative_point = 'bottomleft',
        x = 280,
        y = 18,
      },
    },
    cvars = {
      combat = {
        violencelevel = 5,
      },
      light = {
        ffxglow = 0,
        maxlightcount = 12,
        maxlightdist = 100,
      },
      sound = {
        FootstepSounds = 1,
        Sound_AmbienceVolume = 1,
        Sound_EnableErrorSpeech = 0,
      },
      windows = {
        spamFilter = 1,
        autoClearAFK = 1,
        doNotFlashLowHealthWarning = 1,
        screenEdgeFlash = 0,
        RenderScale = 1,
        uiScale = 0.649,
        uiScaleMultiplier = -1,
        useUiScale = 1,
        xpBarText = 1,
        alwaysShowActionBars = 1,
        colorChatNamesByClass = 1,
        minimapShowArchBlobs = 0,
        minimapShowQuestBlobs = 0,
        nameplateTargetBehindMaxDistance = 0,
        nameplateOverlapV = 1.1,
        nameplateLargerScale = 1.2,
        NameplatePersonalShowAlways = 0,
        nameplateShowEnemyPets = 1,
        nameplateShowFriends = 1,
        nameplateShowFriendlyGuardians = 1,
        nameplateTargetRadialPosition = 0,
        NameplatePersonalShowWithTarget = 0,
        NameplatePersonalShowInCombat = 1,
        nameplateShowEnemyGuardians = 1,
        nameplateShowFriendlyNPCs = 1,
        nameplateShowFriendlyTotems = 1,
        nameplateShowEnemies = 1,
        nameplateShowEnemyTotems = 1,
        ShowClassColorInFriendlyNameplate = 1,
        nameplateShowEnemyMinions = 1,
        nameplateShowEnemyMinus = 1,
        nameplateShowFriendlyPets = 1,
        nameplateShowFriendlyMinions = 1,
        nameplateShowAll = 1,
        NameplatePersonalHideDelaySeconds = 3.0,
        ColorNameplateNameBySelection = 0,
        NameplatePersonalHideDelayAlpha = 0.45,
        NamePlateVerticalScale = 1.0,
        NamePlateHorizontalScale = 1.0,
        nameplateLargeTopInset = .1,
        nameplateOverlapV = 1.1,
        nameplateLargerScale = 1.2,
        nameplateMaxAlpha = 1.0,
        nameplateSelectedScale = 1.0,
        nameplateSelfScale = 1.0,
        nameplateOtherBottomInset = .1,
        nameplateClassResourceTopInset = .03,
        nameplateMotion = 0,
        nameplateMinScaleDistance = 10,
        nameplateOccludedAlphaMult = 1.0,
        nameplateSelectedAlpha = 1.0,
        nameplateSelfAlpha = 0.75,
        nameplateOtherTopInset = .08,
        nameplateMotionSpeed = 0.025,
        nameplateMaxScaleDistance = 10,
        nameplateMinAlphaDistance = 10,
        nameplateNotSelectedAlpha = 0.5,
        nameplateRemovalAnimation = 1,
      },
      weather = {
        weatherDensity = 3,
        particledensity = 100,
        farclip = 200,
        SkyCloudLOD = 3,
        cameradistancemaxzoomfactor = 1,
      },
      detail = {
        projectedtextures = 1,
        maxFPS = 60,
        maxFPSBk = 30,
        emphasizeMySpellEffects = 1,
        ffxDeath = 0,
        groundEffectDensity = 256,
        shadowmode = 3,
        shadowtexturesize = 2048,
        profanityfilter = 0,
      }
    }
  }

  self:SetConsoleVars( 'combat' )
  self:SetConsoleVars( 'light' )
  self:SetConsoleVars( 'sound' )
  self:SetConsoleVars( 'windows' )
  self:SetConsoleVars( 'weather' )
  self:SetConsoleVars( 'detail' )

  -- /script print( GetCVar( 'weatherDensity' ) );
  self:MoveFrame( _G[ 'PlayerFrame' ] )
  self:MoveFrame( _G[ 'TargetFrame' ] )
  self:MoveFrame( _G[ 'BuffFrame' ] )
  self:MoveFrame( _G[ 'ChatFrame1' ] )
end