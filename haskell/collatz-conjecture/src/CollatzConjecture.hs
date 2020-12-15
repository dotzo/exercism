module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz number 
    | number <= 0 = Nothing
    | otherwise = helper number 0
    where   
        helper 1 count = Just count
        helper n count = helper (if even n then n `div` 2 else 3*n+1) (count+1)

