/****************************************************************************/
/// @file    GUIGlobalSelection.h
/// @author  Daniel Krajzewicz
/// @date    Jun 2004
/// @version $Id: GUIGlobalSelection.h 15692 2014-02-22 09:17:02Z behrisch $
///
// A global holder of selected objects
/****************************************************************************/
// SUMO, Simulation of Urban MObility; see http://sumo-sim.org/
// Copyright (C) 2001-2014 DLR (http://www.dlr.de/) and contributors
/****************************************************************************/
//
//   This file is part of SUMO.
//   SUMO is free software: you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation, either version 3 of the License, or
//   (at your option) any later version.
//
/****************************************************************************/
#ifndef GUIGlobalSelection_h
#define GUIGlobalSelection_h


// ===========================================================================
// included modules
// ===========================================================================
#ifdef _MSC_VER
#include <windows_config.h>
#else
#include <config.h>
#endif

#include "GUISelectedStorage.h"


// ===========================================================================
// global variable declarations
// ===========================================================================
/** @brief A global holder of selected objects
 *
 * @todo Check whether this should be replaced by a Singleton
 */
extern GUISelectedStorage gSelected;


#endif

/****************************************************************************/

