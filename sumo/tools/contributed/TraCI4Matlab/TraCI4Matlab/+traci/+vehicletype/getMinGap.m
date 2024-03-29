function minGap = getMinGap(typeID)
%getMinGap
%   minGap = getMinGap(TYPEID) Returns the offset (gap to front vehicle if 
%   halting) of vehicles of this type.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getMinGap.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
minGap = traci.vehicletype.getUniversal(constants.VAR_MINGAP, typeID);