function lastStepOccupancy = getLastStepOccupancy(detID)
%getLastStepOccupancy Get the percentage of occupation on the areal detector.
%   lastStepOccupancy = getLastStepOccupancy(DETID) Returns the occupancy 
%   in percentage for the last time step on the given areal detector.

%   Copyright 2014 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getLastStepOccupancy.m 14 2014-03-13 21:47:13Z afacostag $

import traci.constants
lastStepOccupancy = traci.areal.getUniversal(constants.LAST_STEP_OCCUPANCY, detID);