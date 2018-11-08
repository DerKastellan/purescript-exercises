-- possible solution to "Exercise: Optional Monoid"
-- from "Haskell Programming from First Principles"

module Monoid.Optional (Optional(..)) where

import Prelude

data Optional a = Nada | Only a

instance semigroupOptional :: Semigroup a => Semigroup (Optional a) where
  append (Only x) (Only y) = Only (x `append` y)
  append (Only x) Nada     = Only x
  append Nada     (Only x) = Only x
  append Nada     Nada     = Nada

instance monoidOptional :: Monoid a => Monoid (Optional a) where
  mempty = Nada

derive instance eqOptional :: Eq a => Eq (Optional a)
