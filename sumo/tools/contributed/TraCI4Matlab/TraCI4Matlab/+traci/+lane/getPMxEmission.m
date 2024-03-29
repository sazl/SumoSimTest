function PMxEmission = getPMxEmission(laneID)
%getPmxEmission Get the particular matter emission in the lane.
%   pmxEmission = getPmxEmission(LANEID) Returns the particular matter 
%   emission in mg for the last time step on the given lane.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getPMxEmission.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
PMxEmission = traci.lane.getUniversal(constants.VAR_PMXEMISSION, laneID);