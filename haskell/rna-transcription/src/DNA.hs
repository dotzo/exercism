module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs
    | (not . all (`elem` "ACGT")) xs = Left . head . dropWhile (`elem` "GCAT") $ xs
    | otherwise = Right . map transform $ xs
    where
        transform 'G' = 'C'
        transform 'C' = 'G'
        transform 'A' = 'U'
        transform 'T' = 'A'
        
