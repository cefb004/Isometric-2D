# ENGINE.md – IsometricGL Mini-Engine (Love2D / Lua)
## 1. Overview

This document describes the technical foundation of the IsometricGL mini-engine, built on Love2D and Lua. The engine is lightweight, modular, and specifically designed to support a Diablo-like, isometric arcade RPG with retro Neo Geo aesthetics.

The goal is fast prototyping, clean architecture, and easy expansion, while taking advantage of Love2D’s built-in capabilities.

## 2. Engine Philosophy

Minimal and modular: the engine exists to serve the game, not the other way around.

Lightweight: avoids unnecessary complexity and dependencies.

Lua-centric: simple, hot-reload-friendly code, fast iteration.

Retro design: supports 8-directional isometric movement, large Neo Geo style sprites, and integer scaling.

Portability: desktop-first (Windows), with potential Android/iOS support via Love2D wrappers.

## 3. Engine Responsibilities
### 3.1 Core Loop

Love2D handles love.load, love.update(dt), and love.draw callbacks.

Mini-engine organizes update/draw per entity (player, enemies, projectiles, map).

Supports modular game states (menu, gameplay, pause, etc.).

### 3.2 Input Handling

Keyboard: WASD / arrow keys.

Gamepad: XInput compatible via Love2D joystick/gamepad API.

Future touchscreen: abstracted virtual controls.

Converts input to isometric movement vectors.

### 3.3 Sprite and Animation System

Spritesheet support with quads for multiple states and directions.

States per character: idle, walk, attack, hit, death.

8-directional support, 4+ frames per animation.

Animation timer and frame switching built-in.

Handles large Neo Geo-style sprites (e.g., 64x128 px).

Example structure:
```
sprite.lua
 └─ Sprite class
     ├─ image
     ├─ quads
     ├─ animation state
     ├─ update(dt)
     └─ draw(x, y)
```
### 3.4 Camera System

Isometric camera (2:1 ratio) with smooth following.

Uses HUMP camera library or a custom Lua implementation.

Handles viewport translation for map scrolling.

### 3.5 Map / Tilemap System

Supports isometric tilemaps.

Tile-to-screen coordinate conversion:

screenX = (tileX - tileY) * (tileWidth/2)
screenY = (tileX + tileY) * (tileHeight/2)


Can load maps manually or via Tiled + STI.

Handles efficient rendering, only drawing visible tiles.

### 3.6 Asset Management

Centralized loading for:

Sprites / spritesheets

Tiles

Sounds / music

Keeps assets in tables for easy access.

Supports lazy loading or preloading depending on game needs.

### 3.7 Audio System

Plays background music and sound effects.

Uses Love2D’s love.audio module.

Supports volume control per channel (music / sfx).

Future: positional audio for immersion.

### 3.8 Utilities

Timers (via HUMP timer or custom Lua timers).

Entity management (tables for active objects, garbage collection).

Collision detection (bounding box or simple grid-based for map tiles).

Debugging tools: optional FPS display, debug overlay, hitboxes.

## 4. Mini-Engine Directory Structure
```
/src
 ├─ main.lua           # Love2D entry point
 ├─ engine/
 │   ├─ sprite.lua     # Spritesheet + animation system
 │   ├─ camera.lua     # Isometric camera
 │   ├─ map.lua        # Tilemap system
 │   └─ input.lua      # Input abstraction
 ├─ player.lua         # Player entity
 ├─ enemy.lua          # Enemy entities
 └─ utils.lua          # Timers, collision, debug
```

Key Points:

Each module is self-contained.

Game entities (player, enemies, projectiles) use engine modules.

Allows clean separation of game logic and engine functionality.

## 5. Technical Decisions

| Feature     | Decision                            | Notes                                               |
| ----------- | ----------------------------------- | --------------------------------------------------- |
| Game loop   | Use Love2D callbacks                | Minimal engine organizes update/draw per entity     |
| Sprites     | Quads in Lua                        | Supports 8 directions, multiple states              |
| Animation   | Timer-based frame switching         | Simple, efficient for Neo Geo style                 |
| Map         | Tile-to-screen isometric conversion | Optional STI integration                            |
| Camera      | HUMP or custom Lua camera           | Smooth follow, supports zoom later                  |
| Input       | Abstracted module                   | Converts keyboard/gamepad/touch to movement vectors |
| Audio       | Love2D audio                        | Simple background/music/sfx system                  |
| Assets      | Centralized loader                  | Tables for sprites, sounds, tiles                   |
| Portability | Lua + Love2D                        | Cross-platform: Windows, Linux, macOS, mobile later |


## 6. Out of Scope (Initially)

Visual editor

Advanced physics engine

Networking / online multiplayer

Complex shaders or 3D effects

Full game engine features like Unity/Godot

## 7. Future Enhancements

Hot-reload of Lua modules for faster iteration.

Enemy AI system integrated with engine utilities.

Particle effects for retro arcade style.

Inventory and UI system using engine base modules.

Mobile touch controls and screen scaling.

## ✅ Summary:

The IsometricGL mini-engine provides all core functionality required to build a Diablo-like isometric RPG while keeping the code modular, simple, and Lua-native. Love2D handles the low-level stuff, and our engine adds sprites, animation, camera, input, tilemap, and audio abstraction — everything needed for fast prototyping and retro-style gameplay.
