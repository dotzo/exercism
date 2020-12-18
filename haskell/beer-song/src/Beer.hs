module Beer (song) where

makeSong :: Int -> String
makeSong n = case n of
       0 -> "No more" ++ bob ++ otw ++ ", no more" ++ bob ++ ".\n" ++
              "Go to the store and buy some more, 99" ++ bob ++ otw ++ ".\n"
       1 -> "1 bottle of beer" ++ otw ++ ", 1 bottle of beer.\n" ++
              "Take it down and pass it around, no more" ++ bob ++ otw ++ ".\n\n" ++ makeSong 0
       2 -> show n ++ bob ++ otw ++ ", " ++ show n ++ bob ++ ".\n" ++
              tod ++ show (n-1) ++ " bottle of beer" ++ otw ++ ".\n\n" ++ makeSong (n-1)
       _ -> show n ++ bob ++ otw ++ ", " ++ show n ++ bob ++ ".\n" ++
              tod ++ show (n-1) ++ bob ++ otw ++ ".\n\n" ++ makeSong (n-1)
       where
              bob = " bottles of beer"
              otw = " on the wall"
              tod = "Take one down and pass it around, "


song :: String
song = makeSong 99