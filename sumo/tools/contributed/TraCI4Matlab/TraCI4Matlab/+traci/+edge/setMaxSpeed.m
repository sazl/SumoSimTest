function setMaxSpeed(edgeID, speed)
%setMaxSpeed Set the maximum speed in the edge.
%   setMaxSpeed(EDGEID,SPEED) Set a new maximum speed (in m/s) for all 
%   lanes of the edge.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setMaxSpeed.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendDoubleCmd(constants.CMD_SET_EDGE_VARIABLE, constants.VAR_MAXSPEED, edgeID, speed)