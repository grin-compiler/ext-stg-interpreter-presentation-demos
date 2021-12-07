{-# LANGUAGE LambdaCase #-}
module Collision where

import Data.Maybe
import Lens.Micro.Platform
import Graphics.Gloss.Data.Vector
import Entities

collide :: [Entity] -> [(Int,Int)]
collide ents = x where
  ients = zip [0..] ents
  x = [ (i1,i2)
      | (i1,e1) <- ients
      , (i2,e2) <- ients
      , i1 < i2
      , (p1,r1) <- maybeToList (brush e1)
      , (p2,r2) <- maybeToList (brush e2)
      , magV (p1 - p2) < r1 + r2
      ]
  brush = \case
    EPlayer a   -> Just (a^.pPosition, 20)
    EBullet a   -> Just (a^.bPosition, 2)
    EWeapon a   -> Just (a^.wPosition, 10)
    EAmmo a     -> Just (a^.aPosition, 8)
    EArmor a    -> Just (a^.rPosition, 10)
    EHealth a   -> Just (a^.hPosition, 10)
    ELava a     -> Just (a^.lPosition, 50)
    ETeleport a -> Just (a^.tPosition, 20)
    EKillbox a  -> Just (a^.kPosition, 20)
    _ -> Nothing
