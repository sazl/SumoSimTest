function adaptedTraveltime = getAdaptedTraveltime(vehID, time, edgeID)
%getAdaptedTraveltime
%   adaptedTraveltime = getAdaptedTraveltime(VEHID,TIME,EDGEID) Returns the
%   edge travel time for the given time as stored in the vehicle's internal
%   container. If such a value does not exist, -1 is returned.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getAdaptedTraveltime.m 17 2014-05-30 14:32:09Z afacostag $

import traci.constants
global message
traci.beginMessage(constants.CMD_GET_VEHICLE_VARIABLE, constants.VAR_EDGE_TRAVELTIME,...
    vehID, 1+4+1+4+1+4+length(edgeID));
message.string = [message.string uint8(sscanf(constants.TYPE_COMPOUND,'%x')) traci.packInt32(2) ...
    uint8(sscanf(constants.TYPE_INTEGER,'%x')) traci.packInt32(time) ...
    uint8(sscanf(constants.TYPE_STRING,'%x')) traci.packInt32(length(edgeID)) ...
    uint8(edgeID)];
result = traci.checkResult(constants.CMD_GET_VEHICLE_VARIABLE, constants.VAR_EDGE_TRAVELTIME, vehID);
adaptedTraveltime = result.readDouble();