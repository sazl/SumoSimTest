function NOxEmission = getNOxEmission(edgeID)
import traci.constants
%getNOxEmission Get the NOx emission in the edge.
%   NOxEmission = getNOxEmission(EDGEID) Returns the NOx emission in mg for
%   the last time step on the given edge.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getNOxEmission.m 2 2013-12-21 21:39:57Z aacosta $

NOxEmission = traci.edge.getUniversal(constants.VAR_NOXEMISSION, edgeID);