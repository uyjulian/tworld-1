/* lxlogic.h: The game logic for the Lynx ruleset.
 *
 * Copyright (C) 2001 by Brian Raiter, under the GNU General Public
 * License. No warranty. See COPYING for details.
 */

#ifndef	_lxlogic_h_
#define	_lxlogic_h_

#include	"state.h"

/* Initialize the state of the level prior to game play. FALSE is
 * returned if the associated gamesetup is invalid.
 */
extern int lynx_initgame(gamestate *pstate);

/* Advance the state of the level one tick. A positive return value
 * indicates the successful completion of the level, and a negative
 * return value indicates that Chip is dead. Otherwise the return
 * value is zero.
 */
extern int lynx_advancegame(gamestate *pstate);

#endif
