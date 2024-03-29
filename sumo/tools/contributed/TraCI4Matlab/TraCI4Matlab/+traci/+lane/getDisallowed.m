function disallowed = getDisallowed(laneID)
%getDisallowed Get the disallowed vehicle classes in the lane.
%   disallowed = getDisallowed(LANEID) Returns a cell array of strings containing
%   the disallowed vehicle classes.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getDisallowed.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
disallowed = traci.lane.getUniversal(constants.LANE_DISALLOWED, laneID);