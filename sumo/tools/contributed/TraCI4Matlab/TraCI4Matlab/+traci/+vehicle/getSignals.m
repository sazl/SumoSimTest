function signals = getSignals(vehID)
%getSignals Get the vehicle route.
%   signals = getSignals(VEHID) Returns an integer encoding the state of a 
%   vehicle's signals. 
%   The following table shows the defined signals.
%
%   Name                            Bit
%   VEH_SIGNAL_BLINKER_RIGHT         0
%   VEH_SIGNAL_BLINKER_LEFT          1
%   VEH_SIGNAL_BLINKER_EMERGENCY	 2
%   VEH_SIGNAL_BRAKELIGHT            3
%   VEH_SIGNAL_FRONTLIGHT            4
%   VEH_SIGNAL_FOGLIGHT              5
%   VEH_SIGNAL_HIGHBEAM              6
%   VEH_SIGNAL_BACKDRIVE             7
%   VEH_SIGNAL_WIPER                 8
%   VEH_SIGNAL_DOOR_OPEN_LEFT        9
%   VEH_SIGNAL_DOOR_OPEN_RIGHT       10
%   VEH_SIGNAL_EMERGENCY_BLUE        11
%   VEH_SIGNAL_EMERGENCY_RED         12
%   VEH_SIGNAL_EMERGENCY_YELLOW      13


%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getSignals.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
signals = traci.vehicle.getUniversal(constants.VAR_SIGNALS, vehID);