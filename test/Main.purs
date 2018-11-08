module Test.Main where

import Prelude
import Effect (Effect)
import Test.Monoid.Optional (test_optional_monoid)

main :: Effect Unit
main = do
  test_optional_monoid
