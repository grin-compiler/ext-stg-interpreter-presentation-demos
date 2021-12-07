{-# LANGUAGE LambdaCase #-}
module Graphics where

import Text.Printf
import Graphics.Gloss
import Lens.Micro.Platform
import Entities
import Visuals
import World

renderFun :: World -> Picture
renderFun w = Pictures $ ents ++ vis where
  ents = flip map (w^.wEntities) $ \case
    EPlayer p -> let (x,y) = p^.pPosition
                     gfx = Translate x y $ text (p^.pName) $ Rotate (-p^.pAngle) $ Pictures [Polygon [(-10,-6),(10,0),(-10,6)],Circle 20]
                     hud = Translate (-50) 250 $ Scale 0.2 0.2 $ Text $ printf "health:%d ammo:%d armor:%d" (p^.pHealth) (p^.pAmmo) (p^.pArmor)
                 in Pictures [hud,gfx]
    EBullet b   -> Translate x y $ Color green $ Circle 2 where (x,y) = b^.bPosition
    EWeapon a   -> Translate x y $ text "Weapon" $ Color blue $ Circle 10 where (x,y) = a^.wPosition
    EAmmo a     -> Translate x y $ text "Ammo" $ Color (light blue) $ Circle 8 where (x,y) = a^.aPosition
    EArmor a    -> Translate x y $ text "Armor" $ Color red $ Circle 10 where (x,y) = a^.rPosition
    EHealth a   -> Translate x y $ text "Health" $ Color yellow $ Circle 10 where (x,y) = a^.hPosition
    ELava a     -> Translate x y $ text "Lava" $ Color orange $ Circle 50 where (x,y) = a^.lPosition
    ETeleport a -> Translate x y $ text "Teleport" $ Color magenta $ Circle 20 where (x,y) = a^.tPosition
    ETarget a   -> Translate x y $ text "Target" Blank where (x,y) = a^.ttPosition
    EKillbox a  -> Translate x y $ Color violet $ Circle 20 where (x,y) = a^.kPosition
    _ -> Blank

  text s p = Pictures [Scale 0.1 0.1 $ Text s, p]

  vis = flip map (w^.wVisuals) $ \case
    VParticle a -> Translate x y $ Color red $ Circle 1 where (x,y) = a^.vpPosition
    _ -> Blank
