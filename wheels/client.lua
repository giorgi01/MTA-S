local backGround = {
	x = 785, 
	y = 186, 
	w = 204, 
	h = 32,  
	r = 0,
	g = 0,
	b = 0,
	a = 255
};

local progrees = {
	x = 790, 
	y = 191, 
	w = 194, 
	h = 22,
	r = 255,
	g = 255,
	b = 255,
	a = 155 
};


local timer = true;
local handled = false;
local target = 0;

function getElementSpeed( element, unit )
	if unit == nil then unit = 0 end;
	if isElement( element ) then
		local x,y,z = getElementVelocity( element );
		if unit == "mph" or unit == 1 or unit == "1" then
			return ( x ^ 2 + y ^ 2 + z ^ 2 ) ^ 0.5 * 100;
		else
			return ( x ^ 2 + y ^ 2 + z ^ 2 ) ^ 0.5 * 1.8 * 100;
		end;
	else
		outputDebugString( "Not an element. Can't get speed" );
		return false;
	end;
end;

function increase( limit )
	if limit then
		target = target + 2;
		if target >= limit then
			if isTimer( timer ) then
				return limit;
			end
			timer = setTimer( function( )
				setVehicleWheelStates( getPedOccupiedVehicle( localPlayer ), -1, 1, -1, 1 );
			end, 7000, 1 );
			return limit;
		else
			return target;
		end;
	end;
	return false;
end;

function dxDraw( )
	local w = increase( progrees.w );
	local _backGround = dxDrawRectangle( backGround.x, backGround.y, backGround.w, backGround.h, tocolor( backGround.r, backGround.g, backGround.b, backGround.a ), true );
	local _progrees = dxDrawRectangle( progrees.x, progrees.y, w, progrees.h, tocolor( progrees.r, progrees.g, progrees.b, progrees.a ), true );
end;

addEventHandler( "onClientRender", root,
	function( )
		local vehicle = getPedOccupiedVehicle( localPlayer );
		
		if not vehicle or getVehicleOccupant( vehicle, 0 ) ~= localPlayer or getVehicleEngineState( vehicle ) ~= true or getElementSpeed( vehicle ) > 2 then
			if handled then
				handled = false;
				removeEventHandler( "onClientRender", root, dxDraw );
			end
			if isTimer( timer ) then
				killTimer( timer );
				timer = true;
			end;
			target = 0;
			return;
		end;
		
		if getKeyState( "w" ) ~= true or getKeyState( "s" ) ~= true then
			if handled then
				handled = false;
				removeEventHandler( "onClientRender", root, dxDraw );
			end
			if isTimer( timer ) then
				killTimer( timer );
				timer = true;
			end;
			target = 0;
			return;
		end;
		
		if not handled then
			handled = true;
			addEventHandler( "onClientRender", root, dxDraw );
		end
	end
);


