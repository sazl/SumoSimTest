function setAccel(typeID, accel)
%setAccel
%   setAccel(TYPEID,ACCEL) Sets the maximum acceleration in m/s^2 of 
%   vehicles of this type.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setAccel.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendDoubleCmd(constants.CMD_SET_VEHICLETYPE_VARIABLE, constants.VAR_ACCEL, typeID, accel);