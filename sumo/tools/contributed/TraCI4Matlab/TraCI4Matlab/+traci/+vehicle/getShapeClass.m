function shapeClass = getShapeClass(vehID)
%getShapeClass
%   shapeClass = getShapeClass(VEHID) Returns the shape class of this 
%   vehicle.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getShapeClass.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
shapeClass = traci.vehicle.getUniversal(constants.VAR_SHAPECLASS, vehID);