import Data.List

successors :: Eq a => [a] -> [a] -> [a]
successors s [] = []
successors s (x:xs)
  | isPrefixOf s (x:xs) = head (drop (length s) (x:xs)) : successors s xs
  | otherwise = successors s xs
