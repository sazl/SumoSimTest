function pmxEmission = getPmxEmission(edgeID)
%getPmxEmission Get the particular matter emission in the edge.
%   pmxEmission = getPmxEmission(EDGEID) Returns the particular matter 
%   emission in mg for the last time step on the given edge.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getPmxEmission.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
pmxEmission = traci.edge.getUniversal(constants.VAR_PMXEMISSION, edgeID);