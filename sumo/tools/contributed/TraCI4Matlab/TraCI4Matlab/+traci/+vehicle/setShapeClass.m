function setShapeClass(vehID, clazz)
%setShapeClass
%   setShapeClass(VEHID,CLASS) Sets the shape class for this vehicle.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setShapeClass.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendStringCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.VAR_SHAPECLASS, vehID, clazz);