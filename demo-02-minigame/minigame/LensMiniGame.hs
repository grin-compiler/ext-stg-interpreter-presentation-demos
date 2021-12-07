{-# LANGUAGE TemplateHaskell, Rank2Types, NoMonomorphismRestriction, LambdaCase, RecordWildCards, FlexibleContexts, TupleSections #-}

import Graphics.Gloss.Interface.Pure.Game
import Control.Monad.State.Strict
import System.Random.Mersenne.Pure64

import Lens.Micro.Platform

import Entities
import World
import Graphics
import GameLogic

{-
  minigame
    done - shoot bullets with limited lifetime
    done - respawn player
    done - pick up health, weapon and ammo powerups
    done - respawn items
    done - touch lava that cause damage once per second since the first touch
    done - control player's acceleration instead of position, also add friction
    done - don't pickup items when the inventory is full (filter collision by entity state, i.e. they collide when they accepts the event)
    done - randomize spawn time
    done - drop inventory on death
    done - animated visual only elements (i.e. particles on collision)
    * count deaths and kills (persistent data support)
        higher level rules:
          time limit
          frag/ctf score limit
          count score
          keep track of statistics
        idea: emit frags on deathmatch kills, containing the necessary info
              emit flag scores / events
          question: does this break state locality? (this is ad hoc, but it's ok to me)
    done - teleport (target support)
    * teleport telefrag with killbox
    jump pad
    door
    button + movable
    full q3 inventory

  goals:
    rule based
    compositional with reusable small components
    intuitive and easy to use
    simple and efficient operational semantics and implementation (should be easy to imagine the compilation/codegen)

  events:
    collision between entities and client

  design ideas:
    transfer function can emit events (data for higher level rules)

  rule hierarchy
    #1 - game mode
      high score tracking
      count frags / flag scores
      measure time
    #2 - action rules
      kills, teleports, collisions, etc.
-}
{-
  random missing features:
    character animations
    weapon change animation
    weapon animations
      shoot
      explosion
      weapon idle/etc
-}
{-
  interactions to handle
    item on a mover - problem: relative position
    killbox         - problem: many things in one interaction
    teleport target - problem: target = referencex
-}
{-
  quake 3 inventory
    weapons
      gauntlet
      machinegun
      shotgun
      grenade launcher
      rocket launcher
      lightning
      railgun
      plasmagun
      bfg
      grappling hook
    ammos
      for each weapon
    armors
      armor shard   5
      armor combat  50
      armor body    100
    health
      health small  5
      health        25
      health large  50
      health mega   100
    powerup
      quad    (quad damage)
      enviro  (battle suit)
      haste   (speed)
      invis   (invisibility)
      regen   (regeneration)
      flight
    holdable
      teleporter
      medkit
    team
      redflag
      blueflag
-}



-----

inputFun :: Event -> World -> World
inputFun e w = w & wInput .~ i' where
  f Down = 300
  f Up = -300

  i@Input{..} = w^.wInput
  i' = case e of
    EventKey (Char 'w') s _ _ -> i {forwardmove = forwardmove + f s}
    EventKey (Char 's') s _ _ -> i {forwardmove = forwardmove - f s}
    EventKey (Char 'd') s _ _ -> i {rightmove = rightmove - f s}
    EventKey (Char 'a') s _ _ -> i {rightmove = rightmove + f s}
    EventKey (Char 'e') s _ _ -> i {sidemove = sidemove + f s}
    EventKey (Char 'q') s _ _ -> i {sidemove = sidemove - f s}
    EventKey (SpecialKey KeySpace) s _ _ -> i {shoot = s == Down}
    EventKey (Char 'x') s _ _ -> error "terminate game"
    _ -> i

stepFun :: Float -> World -> World
stepFun dt = execState $ do
  -- update time
  wInput %= (\i -> i {dtime = dt, time = time i + dt})
  input <- use wInput
  ents <- use wEntities
  vis <- use wVisuals
  rand <- use wRandomGen
  let (r1,e,v1) = updateEntities rand input ents
      Input{..} = input
      (r2,v2) = updateVisuals r1 time dtime vis
  wEntities .= e
  wRandomGen .= r2
  wVisuals .= v1 ++ v2

emptyWorld = World
  [ EPlayer initialPlayer
  , EBullet   (Bullet (30,30) (10,10) 100 10)
  , EWeapon   (Weapon (10,20) False)
  , EAmmo     (Ammo (100,100) 20 False)
  , EArmor    (Armor (200,100) 30 False)
  , EHealth   (Health (100, 200) 50)
  , ELava     (Lava (-200,-100) 10)
  , ETeleport (Teleport (-200,100) "t1")
  , ETarget   (Target (300,-100) "t1")
--  , EKillbox  (Killbox (300,-100) "t1")
  ] [] emptyInput (pureMT 123456789) where emptyInput = Input 0 0 0 False 0 0

main = play (InWindow "Lens MiniGame" (800, 600) (10, 10)) white 20 emptyWorld renderFun inputFun stepFun
