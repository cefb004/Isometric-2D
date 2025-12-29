# ROADMAP.md – IsometricGL (Love2D / Lua)
## 1. Project Phases
### Phase 1 – Foundation

Goal: Set up the minimal Love2D engine and basic game structure.
Tasks:

Install Love2D and configure development environment.

Set up project directory structure:
```
/IsometricGL
 ├─ main.lua
 ├─ conf.lua
 ├─ assets/
 │   ├─ sprites/
 │   └─ sounds/
 ├─ src/
 │   ├─ engine/
 │   ├─ player.lua
 │   └─ enemy.lua
 └─ libs/
```
Create mini-engine modules:

sprite.lua – animation & spritesheets

camera.lua – isometric camera

input.lua – keyboard/gamepad/touch abstraction

map.lua – isometric tilemap system

Implement basic hot-reload friendly structure.

Test main loop, window, and asset loading.

### Phase 2 – Player and Animation

Goal: Implement 8-directional player movement with animations.
Tasks:

Load player spritesheet (8x4 directions, idle animation).

Implement movement in isometric space.

Animate player states:

Idle

Walk

Attack (placeholder)

Integrate camera following player.

Test smooth animation and input responsiveness.

### Phase 3 – Map and Tile Rendering

Goal: Display isometric tilemap.
Tasks:

Create sample map (10x10 tiles).

Convert tile coordinates to screen isometric coordinates.

Implement basic map scrolling with camera.

Optimize rendering (only visible tiles).

Optionally integrate STI for Tiled maps for future levels.

### Phase 4 – Enemies and Combat

Goal: Add enemies and basic combat mechanics.
Tasks:

Create enemy entities with animations.

Implement real-time combat:

Simple attacks

Enemy AI (move, chase player)

Integrate collision detection (bounding box/grid).

Add damage, hit, death states.

Test gameplay loop: explore → fight → loot.

### Phase 5 – Loot and Character Progression

Goal: Introduce loot, inventory, and character growth.
Tasks:

Implement collectible items (gold, weapons, potions).

Create basic inventory system (placeholder UI).

Implement leveling/upgrade mechanics (stats increase).

Integrate visual feedback for item pickup.

### Phase 6 – Audio and FX

Goal: Add sound and visual polish.
Tasks:

Load background music and SFX (attack, hit, pickup).

Integrate volume control (music/SFX).

Optional: implement particle effects for attacks or spells.

Ensure retro arcade aesthetic is preserved.

### Phase 7 – UI and Menus

Goal: Build minimal user interface.
Tasks:

Main menu: start, options, exit.

In-game HUD: health, mana, loot counter.

Inventory screen (basic).

Pause menu functionality.

### Phase 8 – Optimization and Portability

Goal: Ensure smooth performance and cross-platform support.
Tasks:

Profile frame rate and memory usage.

Optimize sprite rendering, map scrolling, and animations.

Test integer scaling for retro visuals.

Prepare for Android port (Love2D wrapper).

| Milestone              | Completion Criteria                                                 |
| ---------------------- | ------------------------------------------------------------------- |
| Phase 1 – Foundation   | Love2D project runs, engine modules loaded, hot-reload works        |
| Phase 2 – Player       | Player moves and animates correctly in 8 directions                 |
| Phase 3 – Map          | Isometric tilemap displays correctly with camera scroll             |
| Phase 4 – Enemies      | Enemies appear, basic AI, combat works                              |
| Phase 5 – Loot         | Items can be picked up, inventory updates, character stats increase |
| Phase 6 – Audio        | Background music and SFX integrated, effects visible                |
| Phase 7 – UI           | Menus and HUD functional                                            |
| Phase 8 – Optimization | Smooth performance, cross-platform readiness                        |


## 2. Notes

All phases reuse mini-engine modules; no redundant code.

Prioritize retro aesthetic and performance over modern features.

Lua and Love2D allow fast iteration, so hot-reload should be used extensively.

Mobile/Android support is planned, but development starts on desktop Windows.
