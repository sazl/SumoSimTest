function setLength(vehID, length)
%setLength
%   setLength(VEHID,LENGTH) Sets the length in m for the given vehicle.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setLength.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendDoubleCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.VAR_LENGTH, vehID, length);