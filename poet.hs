import Data.List
import Data.Maybe
import System.Exit
import System.Random

getRandomElement :: [a] -> IO a
getRandomElement l = do
    i <- randomRIO (0, length l - 1)
    return $ l !! i

successor :: Eq a => [a] -> [a] -> Maybe a
successor s (x:xs)
  | length s == length (x:xs) = Nothing
  | otherwise = Just (head (drop (length s) (x:xs)))

{-
  This function needs an additional "sentinel" parameter. The sentinel is used
  when the Maybe has the value "Nothing", which indicates that the match was at
  the end of the list and we don't have a real successor. Because Haskell is
  strongly typed, we cannot use something generic like Java's "null" to indicate
  that the successor matched right at the end of the list.

  So we have to use a sentinel that fits the type of the list elements. For
  strings (aka lists of characters), the ETX (End of TeXt) seems a good choice.
  For other lists (like a list of musical notes, for example), we would have to
  choose a different sentinel.

  The function can be used like this:

  *Main> successors "the" "theathebthe" '\ETX'
  "ab\ETX"
  *Main> successors "the" "theathebtheb" '\ETX'
  "abb"
-}
successors :: Eq a => [a] -> [a] -> a -> [a]
successors s [] sentinel = []
successors s (x:xs) sentinel
  | isPrefixOf s (x:xs) = fromMaybe sentinel (successor s (x:xs)) : successors s xs sentinel
  | otherwise = successors s xs sentinel

scramble word text = do
  let succs = successors word text '\ETX'
  succ <- getRandomElement succs
  putChar succ
  if succ == '\ETX' then exitSuccess
  else scramble (tail word ++ [succ]) text

main = do

  let wordlen = 3
  text <- getContents

  let word = take wordlen text

  putStr word

  scramble word text
