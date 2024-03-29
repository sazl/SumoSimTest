function CO2Emission = getCO2Emission(vehID)
%getCO2Emission Returns the CO2 emission of the vehicle.
%   CO2Emission = getCO2Emission(VEHID) Returns the CO2 emission in mg for
%   the last time step.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getCO2Emission.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
CO2Emission = traci.vehicle.getUniversal(constants.VAR_CO2EMISSION, vehID);