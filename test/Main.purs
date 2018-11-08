module Test.Main where

import Prelude
import Effect (Effect)
import Test.Assert (assert)
import Data.Monoid.Additive (Additive(..))
import Monoid.Optional (Optional(..))

main :: Effect Unit
main = do
  assert (Only (Additive 7) <> Only (Additive 3) == Only (Additive 10))
  assert (Nada <> Only (Additive 5) <> Nada      == Only (Additive 5))
