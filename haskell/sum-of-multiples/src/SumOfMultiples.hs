module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [] _ = 0
sumOfMultiples _ 0 = 0
sumOfMultiples factors limit = sum [x | x <- [1..limit-1], any (divBy x) $ filter (/= 0) factors]
    where
        divBy x y = x `mod` y == 0
