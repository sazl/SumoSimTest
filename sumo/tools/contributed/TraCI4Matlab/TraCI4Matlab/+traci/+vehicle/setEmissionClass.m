function setEmissionClass(vehID, clazz)
%setEmissionClass
%   setEmissionClass(VEHID,CLASS) Sets the emission class for this vehicle.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setEmissionClass.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendStringCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.VAR_EMISSIONCLASS, vehID, clazz);