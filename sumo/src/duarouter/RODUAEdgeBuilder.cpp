/****************************************************************************/
/// @file    RODUAEdgeBuilder.cpp
/// @author  Daniel Krajzewicz
/// @author  Michael Behrisch
/// @author  Jakob Erdmann
/// @author  Yun-Pang Floetteroed
/// @date    Tue, 20 Jan 2004
/// @version $Id: RODUAEdgeBuilder.cpp 16005 2014-03-24 12:46:02Z cschmidt87 $
///
// Interface for building instances of duarouter-edges
/****************************************************************************/
// SUMO, Simulation of Urban MObility; see http://sumo-sim.org/
// Copyright (C) 2004-2014 DLR (http://www.dlr.de/) and contributors
/****************************************************************************/
//
//   This file is part of SUMO.
//   SUMO is free software: you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
/****************************************************************************/


// ===========================================================================
// included modules
// ===========================================================================
#ifdef _MSC_VER
#include <windows_config.h>
#else
#include <config.h>
#endif

#include "RODUAEdgeBuilder.h"
#include <router/ROEdge.h>

#ifdef CHECK_MEMORY_LEAKS
#include <foreign/nvwa/debug_new.h>
#endif // CHECK_MEMORY_LEAKS


// ===========================================================================
// method definitions
// ===========================================================================
RODUAEdgeBuilder::RODUAEdgeBuilder(bool useBoundariesOnOverride, bool interpolate) {
    ROEdge::setTimeLineOptions(useBoundariesOnOverride, useBoundariesOnOverride, interpolate);
}


RODUAEdgeBuilder::~RODUAEdgeBuilder() {}


ROEdge*
RODUAEdgeBuilder::buildEdge(const std::string& name, RONode* from, RONode* to, const int priority) {
    return new ROEdge(name, from, to, getNextIndex(), priority);
}


/****************************************************************************/

