function speedDeviation = getSpeedDeviation(typeID)
%getSpeedDeviation
%   speedDeviation = getSpeedDeviation(TYPEID) Returns the maximum speed 
%   deviation of vehicles of this type.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getSpeedDeviation.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
speedDeviation = traci.vehicletype.getUniversal(constants.VAR_SPEED_DEVIATION, typeID);