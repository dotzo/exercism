module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = isDivBy year 400 || ((isDivBy year 4) && not (isDivBy year 100))
    where isDivBy n m = n `mod` m == 0
