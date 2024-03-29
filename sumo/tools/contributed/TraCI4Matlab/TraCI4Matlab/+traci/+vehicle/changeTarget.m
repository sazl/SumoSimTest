function changeTarget(vehID, edgeID)
%changeTarget Change the vehicle's destination.
%   changeTarget(VEHID,EDGEID) Changes the vehicle's destination edge to
%   the given. The route is rebuilt.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: changeTarget.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendStringCmd(constants.CMD_SET_VEHICLE_VARIABLE, constants.CMD_CHANGETARGET, vehID, edgeID);