function rerouteEffort(vehID)
%rerouteEffort Compute new route based on the edges' assigned effort.
%   rerouteEffort(VEHID) Computes a new route using the vehicle's internal 
%   and the global edge effort information. Replaces the current route by 
%   the found.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: rerouteEffort.m 17 2014-05-30 14:32:09Z afacostag $

import traci.constants
global message

traci.beginMessage(constants.CMD_SET_VEHICLE_VARIABLE, constants.CMD_REROUTE_EFFORT, vehID,...
    1+4);
message.string = [message.string uint8(sscanf(constants.TYPE_COMPOUND,'%x')) ...
    traci.packInt32(0)];
traci.sendExact();