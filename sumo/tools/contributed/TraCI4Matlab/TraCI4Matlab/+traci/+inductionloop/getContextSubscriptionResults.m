function ContextSubscriptionResults = getContextSubscriptionResults(loopID)
%getContextSubscriptionResults Get the context subscription results for the
%   last time step.
%   contextSubscriptionResults = getContextSubscriptionResults(LOOPID) 
%   Returns the context subscription results for the last time step and the
%   given induction loop. If no induction loop id is given, all 
%   subscription results are returned in a containers.Map data struccure. 
%   If the induction loop id is unknown or the subscription did for any 
%   reason return no data, 'None' is returned.
%   It is not possible to retrieve older subscription results than the ones
%   from the last time step.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getContextSubscriptionResults.m 2 2013-12-21 21:39:57Z aacosta $

global loopSubscriptionResults
if isempty(loopSubscriptionResults)
    throw(MException('traci:FatalTraCIError',...
        'You have to subscribe to the variable'));
end
if nargin < 1
    loopID=None;
end
ContextSubscriptionResults = loopSubscriptionResults.getContext(loopID);