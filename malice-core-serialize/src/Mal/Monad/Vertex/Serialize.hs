{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Mal.Monad.Vertex.Serialize
    ( yieldPut
    ) where

import Mal.Monad.Vertex
import Mal.Monad.Vertex.Yieldable

import Data.Serialize

yieldPut :: (MonadVertex e m, Serialize a) => a -> m ()
yieldPut = yield . put

instance Yieldable Put where
    yieldWith f = yieldWith f . execPut