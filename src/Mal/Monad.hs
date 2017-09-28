{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE KindSignatures #-}

module Mal.Monad
    ( module Mal.Monad.Endpoint
    , module Mal.Monad.Endpoint.Serialize
    , module Mal.Monad.Endpoint.Attoparsec

    , module Mal.Monad.Vertex
    , module Mal.Monad.Vertex.Yieldable
    , module Mal.Monad.Vertex.Serialize

    , module Mal.Monad.Eve
    , module Mal.Monad.Mal

    , EveInner
    , MalInner
    , EveAll
    , MalAll
    ) where

import Mal.Monad.Endpoint
import Mal.Monad.Endpoint.Attoparsec
import Mal.Monad.Endpoint.Serialize
import Mal.Monad.Vertex
import Mal.Monad.Vertex.Yieldable
import Mal.Monad.Vertex.Serialize
import Mal.Monad.Eve
import Mal.Monad.Mal

import GHC.Exts (Constraint)

type EveInner (c :: (* -> *) -> Constraint) m = c (InnerEndpoint m)
type MalInner (c :: (* -> *) -> Constraint) m = c (InnerVertex m)

type EveAll (c :: (* -> *) -> Constraint) m = (c m, c (InnerEndpoint m))
type MalAll (c :: (* -> *) -> Constraint) m = (c m, c (InnerVertex m), c (InnerEndpoint m))
