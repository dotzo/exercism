module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor x = filter isAnagram
    where
        isAnagram y = (strLower x /= strLower y) && (sort (strLower x) == sort (strLower y))
        strLower = map toLower
