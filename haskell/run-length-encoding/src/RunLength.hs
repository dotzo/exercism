module RunLength (decode, encode) where

import Data.List (group, groupBy)
import Data.Char (isAlpha, isNumber)

decode :: String -> String
decode "" = ""
decode text = case length times of
                0 -> head remainder : decode (tail remainder)
                _ -> replicate (read times) (head remainder) ++ decode (tail remainder)
    where
        (times, remainder) = span isNumber text

encode :: String -> String
encode = concatMap (\x -> len x ++ [head x]) . group
    where
        len x = if length x == 1 then "" else show (length x)
