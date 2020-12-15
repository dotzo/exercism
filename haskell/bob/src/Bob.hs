module Bob (responseFor) where

import Data.List (isSuffixOf)
import Data.Char (isUpper, isAlpha, isSpace)

responseFor :: String -> String
responseFor xs 
    | yellQ = "Calm down, I know what I'm doing!"
    | normalQ = "Sure."
    | yelling = "Whoa, chill out!"
    | noAddress = "Fine. Be that way!"
    | otherwise = "Whatever."
    where 
        ts = strip xs
        normalQ = "?" `isSuffixOf` ts
        yelling =  (not $ null getLetters) && (all isUpper getLetters)
        getLetters = filter isAlpha ts
        yellQ = normalQ && yelling
        noAddress = null ts

strip :: String -> String
strip = lstrip . rstrip

lstrip :: String -> String
lstrip "" = ""
lstrip s@(x:xs) = if isSpace x
                then lstrip xs
                else s

rstrip :: String -> String 
rstrip = reverse . lstrip . reverse