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

function ui:set( frame )
  if type( frame ) == 'string' then
    frame = _G[ frame ]
  end
  if type( frame ) == 'table' and type( frame.IsObjectType ) == 'function' and frame:IsObjectType( 'Frame' ) then
    self[ 'name' ] = frame:GetName( )
    if self[ 'hooked' ] and self[ 'hooked' ][ self[ 'name' ] ] then
      return false
    end
    if self[ 'name' ] then
      UIPARENT_MANAGED_FRAME_POSITIONS[ self[ 'name' ] ] = nil
    end
    frame:SetMovable( true )
    frame:SetUserPlaced( true )
    frame:SetDontSavePosition( true )
    frame:SetAttribute( 'ignoreFramePositionManager', true )
    frame.ignoreFramePositionManager = true
    if self[ 'settings' ][ self[ 'name' ] ] then
      local s = self[ 'settings' ][ self[ 'name' ] ]
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
        self[ 'hooked' ][ self[ 'name' ] ] = true
      end
    end
  end
end
function ui:OnEnable( )
  self:Enable( )
  self[ 'hooked' ]		= { }
  self[ 'settings' ]	= {
    [' PlayerFrame '] = {
      [' alpha '] = 0.9,
      [' movable '] = false,
      [' anchor_point '] = 'right',
      [' relative_point '] = 'center',
      [' x '] = -20,
      [' y '] = -250,
    },
    [' TargetFrame '] = {
      [' alpha '] = 0.9,
      [' movable '] = false,
      [' anchor_point '] = 'right',
      [' relative_point '] = 'center',
      [' x '] = 250,
      [' y '] = -250,
    },
    [' FocusFrame '] = {
      [' alpha '] = 0.7,
      [' movable '] = false,
      [' anchor_point '] = 'right',
      [' relative_point '] = 'center',
      [' x '] = 140,
      [' y '] = -120,
    },
    [' ChatFrame '] = {
      [' alpha '] = 1,
      [' movable '] = false,
      [' anchor_point '] = 'right',
      [' relative_point '] = 'center',
      [' width '] = 569,
      [' height '] = 350,
      [' x '] = -600,
      [' y '] = -200,
    },
    [' BuffFrame '] = {
      [' alpha '] = 0.7,
      [' scale '] = 0.7,
      [' movable '] = false,
      [' anchor_point '] = 'bottomleft',
      [' relative_point '] = 'bottomleft',
      [' x '] = 280,
      [' y '] = 18,
    },
  }
  self:set( _G[ 'PlayerFrame' ] )
  self:set( _G[ 'TargetFrame' ] )
  self:set( _G[ 'FocusFrame' ] )
  self:set( _G[ 'BuffFrame' ] )
  for i = 1, NUM_CHAT_WINDOWS do
    if _G[ 'ChatFrame' .. i ]:IsShown() then
      self:set( _G[ 'ChatFrame' .. i ] )
      SetChatWindowLocked( i, self[ 'settings' ][ 'ChatFrame' ][ 'movable' ] == false )
    end
  end
end