module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = ['a'..'z'] `subset` (map toLower text)
    where subset a b = all (`elem` b) a
