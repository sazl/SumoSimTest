function tau = getTau(typeID)
%getTau
%   tau = getTau(TYPEID) Returns the driver's reaction time in s for 
%   vehicles of this type.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getTau.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
tau = traci.vehicletype.getUniversal(constants.VAR_TAU, typeID);