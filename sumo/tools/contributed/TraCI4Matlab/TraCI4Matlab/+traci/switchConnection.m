function switchConnection(label)
%switchConnection Switch to another connection with SUMO.
%
%   switchConnection(label) Switch to the connection specified in LABEL 
%   with the SUMO server.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: switchConnection.m 2 2013-12-21 21:39:57Z aacosta $

global connections
connections('') = connections(label);