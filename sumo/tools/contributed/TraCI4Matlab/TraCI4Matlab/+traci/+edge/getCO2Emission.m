function CO2Emission = getCO2Emission(edgeID)
%getCO2Emission Returns the CO2 emission on the given edge.
%   CO2Emission = getCO2Emission(EDGEID) Returns the CO2 emission in mg for
%   the last time step on the given edge.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getCO2Emission.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
CO2Emission = traci.edge.getUniversal(constants.VAR_CO2EMISSION, edgeID);