function setImperfection(vehID, imperfection)
%setImperfection
%   setImperfection(VEHID,IMPERFECTION) Sets the driver's imperfection
%   (dawdling). IMPERFECTION is a double precision integer ranging from
%   zero to one.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setImperfection.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendDoubleCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.VAR_IMPERFECTION, vehID, imperfection);