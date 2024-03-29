function arrivedIDList = getArrivedIDList()
%getArrivedIDList Get the list of arrived vehicles.
%   arrivedIDList = getArrivedIDList() Returns a cell array of strings that
%   contains the IDs of the vehicles which arrived (have reached their 
%   destination and are removed from the road network) in this time step. 

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getArrivedIDList.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
arrivedIDList = traci.simulation.getUniversal(constants.VAR_ARRIVED_VEHICLES_IDS);