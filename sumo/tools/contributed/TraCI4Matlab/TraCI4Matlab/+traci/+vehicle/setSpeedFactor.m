function setSpeedFactor(vehID, factor)
%setSpeedFactor
%   setSpeedFactor(VEHID,FACTOR) Sets the speed factor for the named
%   vehicle within the last step.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setSpeedFactor.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendDoubleCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.VAR_SPEED_FACTOR, vehID, factor);