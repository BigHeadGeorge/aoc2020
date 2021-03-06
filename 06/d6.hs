import Data.List
import Text.Printf

someYes :: [String] -> Int
someYes = length . nub . foldl1 (++)

allYes :: [String] -> Int
allYes = length . foldl1 intersect

groups :: [String] -> [[String]]
groups ss
    | null ss   = []
    | otherwise = c : (groups $ drop 1 n)
    where c = takeWhile (\l -> not (null l)) ss
          n = dropWhile (\l -> not (null l)) ss

main = do
    s <- getContents
    let gs = groups $ lines s

    printf "Silver: %d\n" $ sum $ map someYes gs
    printf "Gold:   %d\n" $ sum $ map allYes gs
