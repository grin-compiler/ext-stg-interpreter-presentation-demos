{-# LANGUAGE LambdaCase, TemplateHaskell #-}
module Visuals where

import Graphics.Gloss.Data.Vector
import Lens.Micro.Platform
import Control.Monad

-- visuals for game graphics
type Vec2 = Vector

data Particle
  = Particle
  { _vpPosition   :: Vec2
  , _vpDirection  :: Vec2
  , _vpLifeTime   :: Float
  } deriving Show

data Visual
  = VParticle Particle
  deriving Show

concat <$> mapM makeLenses [''Particle]
