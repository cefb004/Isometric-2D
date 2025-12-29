# Game Design Document (GDD) – Love2D / Lua Version
## 1. Overview

Temporary name: Abyss Forge

Project: IsometricGL

Genre: Isometric Arcade RPG (Action RPG)

Target platform (initial): Windows (Love2D / Lua)

Future platforms: Android (via Love2D wrappers)

Business model: Premium (low price, e.g., ~US$2)

This project combines Game Design and Game Development simultaneously. The game evolves together with a minimal Love2D-based engine, following a retro philosophy inspired by Neo Geo (1990s), while using a modern, lightweight technical architecture in Lua.

## 2. Project Philosophy

A minimal engine built specifically for this game using Love2D/Lua.

Avoid unnecessary complexity (not competing with Unity/Godot).

Focus on:

Isometric rendering

High-quality 2D sprites

Performance on low-end hardware

Future portability (desktop → mobile)

The engine exists to serve the game, not the other way around.

Lua allows fast iteration, hot reload, and simpler code for 2D games.

## 3. Minimal Game Engine (IsometricGL)

Engine Responsibilities

Window initialization (Love2D handles automatically)

Input handling (keyboard, gamepad, future touchscreen)

2D rendering (via Love2D Canvas / draw functions)

Sprite and spritesheet system (quads for animations)

Isometric camera (HUMP or custom implementation)

Main game loop (Love2D callbacks: load, update, draw)

Basic audio (Love2D sound module)

Asset management (organized folders for sprites, sounds, tiles)

Out of Scope (for now)

Visual editor

Complex physics

Advanced scripting (Lua is embedded already)

Networking / online multiplayer

## 4. Visual Style

Base Resolution

Background: 320x240 (integer scaling for modern displays)

Scalable viewport: 2x, 3x, 4x with no blur

Character Sprites

Size: 64x128 pixels

Palette: 32 colors per character

Style: Retro pixel art (Neo Geo-like)

Animations:

Idle (8 directions, 4 frames each)

Walk (8 directions)

Attack

Hit

Death

Directions: 8 isometric directions

One spritesheet per state (idle, walk, attack)

## 5. Color Palette

Limit of 32 colors per character

Backgrounds may use a larger palette while keeping retro aesthetic

High contrast for readability

Avoid smooth gradients (classic arcade look)

## 6. Camera and Perspective

Classic isometric (2:1)

Mostly fixed camera with light character follow

Smooth scrolling

Implemented using HUMP camera library or custom Lua logic

## 7. Gameplay

Core Loop

Explore the map

Fight enemies

Collect loot

Evolve the character

Progress into deeper areas

Combat

Real-time (arcade)

Simple and special attacks

Enemies encountered in groups

## 8. Controls

Desktop

Keyboard

Gamepad (XInput / Love2D Gamepad module)

Mobile (future)

Touchscreen

Virtual controls

## 9. Audio

Medieval fantasy soundtrack

Retro arcade style

Simple and impactful sound effects

Preferably royalty-free assets

## 10. Repository Structure (Documentation)
```
/IsometricGL
 ├─ README.md
 ├─ docs/
 │   ├─ GDD.md
 │   ├─ ENGINE.md
 │   └─ ROADMAP.md
 ├─ assets/
 │   ├─ sprites/
 │   └─ sounds/
 ├─ src/
 │   ├─ main.lua
 │   ├─ player.lua
 │   └─ map.lua
 └─ libs/
```

README.md: technical overview

GDD.md: design vision (this document)

ENGINE.md: engine technical decisions

ROADMAP.md: planned features and milestones

## 11. Current Project Status

Temporary name defined: Abyss Forge

Visual style defined: Neo Geo / 8-directional sprites

Base resolution defined: 320x240 (integer scaling)

Color palette defined: 32 colors per character

Engine philosophy defined: minimal Love2D engine serving the game
