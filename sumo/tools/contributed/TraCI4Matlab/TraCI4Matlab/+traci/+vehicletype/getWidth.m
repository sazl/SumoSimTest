function width = getWidth(typeID)
%getVehicleClass
%   vehicleClass = getVehicleClass(TYPEID) Returns the width in m of 
%   vehicles of this type.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getWidth.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
width = traci.vehicletype.getUniversal(constants.VAR_WIDTH, typeID);