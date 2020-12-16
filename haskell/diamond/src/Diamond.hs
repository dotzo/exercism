module Diamond (diamond) where

import Data.Char (ord, chr)

diamond :: Char -> Maybe [String]
diamond d
    | d `notElem` ['A'..'Z'] = Nothing
    | otherwise = Just build
    where
        build = map (pad width . layer) $ [0..charNum] ++ [charNum-1,charNum-2..0]
        charNum = ord d - ord 'A'
        width = 2 * charNum + 1

pad :: Int -> String -> String
pad w s = replicate r ' ' ++ s ++ replicate r ' '
    where
        r = (w - length s) `div` 2


layer :: Int -> String
layer 0 = "A"
layer n = letter ++ replicate spacing ' ' ++ letter
    where 
        letter = [chr (ord 'A' + n)]
        spacing = 2 * n - 1

