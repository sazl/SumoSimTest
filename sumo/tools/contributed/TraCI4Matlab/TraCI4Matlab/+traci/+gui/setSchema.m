function setSchema(viewID, schemeName)
%setSchema Set the coloring scheme of the view.
%   setSchema(VIEWID, SCHEMENAME) Set the current coloring scheme for the 
%   given view.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: setSchema.m 2 2013-12-21 21:39:57Z aacosta $

import traci.constants
traci.sendStringCmd(constants.CMD_SET_GUI_VARIABLE, constants.VAR_VIEW_SCHEMA, viewID, schemeName);