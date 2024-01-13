module Poet where

import Data.List
import Data.Maybe
import System.Exit
import System.Random

getRandomElement :: [a] -> IO a
getRandomElement l = do
    i <- randomRIO (0, length l - 1)
    return $ l !! i

{-
 - TODO: Maybe this function should return an Either, not a Maybe.
-}
successor :: Eq a => [a] -> [a] -> Maybe a
successor s (x:xs)
  | length s == length (x:xs) = Nothing
  | otherwise = Just (head (drop (length s) (x:xs)))

successors :: Eq a => [a] -> [a] -> [Maybe a]
successors s [] = []
successors s (x:xs)
  | isPrefixOf s (x:xs) = successor s (x:xs) : successors s xs
  | otherwise = successors s xs

{-
 - TODO: This function has "output" as a parameter and also as a return value.
 - This is ugly. But for now I don't know how to do this more elegantly.
 - scramble() has to use a "do" because it is "tainted" with IO, which is
 - because it calls a function that returns a random element, and such things
 - are IO in Haskell.
 -
 - Maybe I can further split this up into a part that is "tainted" by IO and
 - another part that can then be reformulated as a proper, recursive function
 - ,similar to the successors() function above.
 -}
scramble word text output = do
  let succs = successors word text
  succ <- getRandomElement succs
  if isNothing succ then return output
  else scramble (tail word ++ [fromJust succ]) text (output ++ [fromJust succ])
