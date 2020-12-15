module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, union)
import Data.List (group, sort)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
    | null xs = Right baseMap
    | not . all (`elem` "ACGT") $ xs = Left "Invalid Nucelotide"
    | otherwise = Right $ givenMap `union` baseMap
    where
        parse :: Char -> Nucleotide
        parse 'A' = A
        parse 'C' = C
        parse 'G' = G
        parse 'T' = T
        baseMap = fromList [(A,0),(C,0),(G,0),(T,0)]
        givenMap = fromList . map (\ys -> (parse . head $ ys, length ys)) . group . sort $ xs
