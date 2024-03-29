function minGap = getMinGap(vehID)
%getMinGap
%   minGap = getMinGap(VEHID) Returns the offset (gap to front vehicle if 
%   halting) of this vehicle.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getMinGap.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
minGap = traci.vehicle.getUniversal(constants.VAR_MINGAP, vehID);