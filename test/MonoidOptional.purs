module Test.Monoid.Optional (test_optional_monoid) where

import Prelude
import Effect (Effect)
import Test.Assert (assert)
import Data.Monoid.Additive (Additive(..))
import Data.Monoid.Multiplicative (Multiplicative(..))
import Monoid.Optional (Optional(..))

sum :: forall a. a -> Additive a
sum = Additive

product :: forall a. a -> Multiplicative a
product = Multiplicative

test_optional_monoid :: Effect Unit
test_optional_monoid = do
  assert (Only (sum 1)     `append` Only (sum 1)     == Only (sum 2))
  assert (Only (product 4) `append` Only (product 2) == Only (product 8))
  assert (Only (sum 1)     `append` Nada             == Only (sum 1))
  assert (Only [1]         `append` Nada             == Only [1])
  assert (Nada             `append` Only (sum 1)     == Only (sum 1))
