function IDList = getIDList()
%getIDList Get the IDs of the views in the network.
%   IDList = getIDList() Returns a cell array of strings containing the IDs
%   of the views in the SUMO network.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getIDList.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
IDList = traci.gui.getUniversal(constants.ID_LIST, '');