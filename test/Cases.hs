module Cases (
  testcases,
) where

import Data.List (nub, sort)
import System.Random (getStdGen)
import Test.HUnit (Test(..), assertBool, assertEqual)
import NinetyNine.P0X
import NinetyNine.P1X
import NinetyNine.P2X
import NinetyNine.P3X
import NinetyNine.P4X
import NinetyNine.P5X
import NinetyNine.P6X
import NinetyNine.P7X

emptyTestCase = TestCase $ assertBool "" True

case01 = TestCase $ assertEqual
  "myLast"
  9 $
  myLast [1..9]

case02 = TestCase $ assertEqual
  "myButLast"
  8 $
  myButLast [1..9]

case03 = TestCase $ assertEqual
  "elementAt"
  5 $
  elementAt [1..9] 5

case04 = TestCase $ assertEqual
  "myLength"
  9 $
  myLength [1..9]

case05 = TestCase $ assertEqual
  "myReverse"
  [9, 8..1] $
  myReverse [1..9]

case06 = TestCase $ assertEqual
  "isPalindrome"
  True $
  isPalindrome $ [1..9] ++ [8, 7..1]

case07 = TestCase $ assertEqual
  "flatten"
  [1, 2, 3, 4, 5] $
  flatten $ List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]]

case08 = TestCase $ assertEqual
  "compress"
  "abcade" $
  compress "aaaabccaadeeee"

case09 = TestCase $ assertEqual
  "pack"
  ["aaaa", "b", "cc", "aa", "d", "eeee"] $
  pack "aaaabccaadeeee"

case10 = TestCase $ assertEqual
  "encode"
  [(4, 'a'), (1, 'b'), (2, 'c'), (2, 'a'), (1, 'd'), (4, 'e')] $
  encode "aaaabccaadeeee"

case11 = TestCase $ assertEqual
  "encodeModified" [
    Multiple 4 'a', Single 'b', Multiple 2 'c',
    Multiple 2 'a', Single 'd', Multiple 4 'e'
  ] $
  encodeModified "aaaabccaadeeee"

case12 = TestCase $ assertEqual
  "decodeModified"
  "aaaabccaadeeee" $
  decodeModified [
    Multiple 4 'a', Single 'b', Multiple 2 'c',
    Multiple 2 'a', Single 'd', Multiple 4 'e'
  ]

case13 = TestCase $ assertEqual
  "encodeDirect" [
    Multiple 4 'a', Single 'b', Multiple 2 'c',
    Multiple 2 'a', Single 'd', Multiple 4 'e'
  ] $
  encodeDirect "aaaabccaadeeee"

case14 = TestCase $ assertEqual
  "dupli"
  [1, 1, 2, 2, 3, 3] $
  dupli [1, 2, 3]

case15 = TestCase $ assertEqual
  "repli"
  "aaabbbccc" $
  repli "abc" 3

case16 = TestCase $ assertEqual
  "dropEvery"
  "abdeghk" $
  dropEvery "abcdefghik" 3

case17 = TestCase $ assertEqual
  "split"
  ("abc", "defghik") $
  split "abcdefghik" 3

case18 = TestCase $ assertEqual
  "slice"
  "cdefg" $
  slice ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'] 3 7

case19 = TestCase $ assertEqual
  "rotate"
  "ghabcdef" $
  rotate ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] (-2)

case20 = TestCase $ assertEqual
  "removeAt"
  ('b', "acd") $
  removeAt 2 "abcd"

case21 = TestCase $ assertEqual
  "insertAt"
  "aXbcd" $
  insertAt 'X' "abcd" 2

case22 = TestCase $ assertEqual
  "range"
  [2..7] $
  range 2 7

case23 = TestCase $ do
  gen <- getStdGen
  let rs = rndSelect 5 [1..10] gen :: [Int]
  assertEqual "rndSelect" 5 $ length rs
  assertEqual "rndSelect" 5 $ length (nub rs)
  assertBool "rndSelect" $ all (`elem` [1..10]) rs

case24 = TestCase $ do
  gen <- getStdGen
  let rs = diffSelect 5 10 gen :: [Int]
  assertEqual "diffSelect" 5 $ length rs
  assertEqual "diffSelect" 5 $ length (nub rs)
  assertBool "diffSelect" $ all (`elem` [1..10]) rs

case25 = TestCase $ do
  gen <- getStdGen
  let rs = rndPermutation [1..10] gen :: [Int]
  assertEqual "rndPermutation" [1..10] $ sort rs

case26 = TestCase $ assertEqual
  "combinations" [
    "abc", "abd", "abe", "abf", "acd", "ace", "acf", "ade", "adf", "aef",
    "bcd", "bce", "bcf", "bde", "bdf", "bef",
    "cde", "cdf", "cef",
    "def"
  ] $
  combinations 3 "abcdef"

case27 = TestCase $ assertEqual
  "group'"
  1260 $
  length $ group' [2, 3, 4]
    ["aldo", "beat", "carla", "david", "evi", "flip", "gary", "hugo", "ida"]

case28 = TestCase $ assertEqual
  "(lsort, lfsort)" (
    ["o", "de", "de", "mn", "abc", "fgh", "ijkl"],
    ["ijkl", "o", "abc", "fgh", "de", "de", "mn"]
  ) (
    lsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"],
    lfsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
  )

case29 = emptyTestCase

case30 = emptyTestCase

case31 = TestCase $ assertEqual
  "isPrime"
  [True, False] $
  map isPrime [7, 9]

case32 = TestCase $ assertEqual
  "myGCD"
  [9, 3, 3] $
  zipWith myGCD [36, -3, -3] [63, 6, -6]

case33 = TestCase $ assertEqual
  "coprime"
  [True, False, False] $
  zipWith coprime [35, -3, -3] [64, 6, -6]

case34 = TestCase $ assertEqual
  "totient"
  4 $
  totient 10

case35 = TestCase $ assertEqual
  "primeFactors"
  [3, 3, 5, 7] $
  primeFactors 315

case36 = TestCase $ assertEqual
  "primeFactorsMult"
  [(3, 2), (5, 1), (7, 1)] $
  primeFactorsMult 315

case37 = TestCase $ assertEqual
  "totient'"
  4 $
  totient' 10

case38 = TestCase $ assertEqual
  "totient''"
  (4032, 4)
  (totient 10090, totient' 10)

case39 = TestCase $ assertEqual
  "primesR"
  [11, 13, 17, 19] $
  primesR 10 20

case40 = TestCase $ assertEqual
  "goldbach"
  (5, 23) $
  goldbach 28

case41 = TestCase $ assertEqual
  "goldbachList"
  [(3, 7), (5, 7), (3, 11), (3, 13), (5, 13), (3, 17)] $
  goldbachList 9 20

case42 = emptyTestCase

case43 = emptyTestCase

case44 = emptyTestCase

case45 = emptyTestCase

case46 = TestCase $ assertEqual
  "table" [
    [True , True , True ],
    [True , False, True ],
    [False, True , False],
    [False, False, False]
  ] $
  table (\a b -> (and' a (or' a b)))

case47 = TestCase $ assertEqual
  "table2" [
    [True , True , True ],
    [True , False, True ],
    [False, True , False],
    [False, False, False]
  ] $
  table (\a b -> a `and'` (a `or'` not b))

case48 = TestCase $ assertEqual
  "tablen" [
    [True , True , True , True],
    [True , True , False, True],
    [True , False, True , True],
    [True , False, False, True],
    [False, True , True , True],
    [False, True , False, True],
    [False, False, True , True],
    [False, False, False, True]
  ] $
  tablen 3 (\[a, b, c] -> a`and'`(b`or'`c)`equ'`a`and'`b`or'`a`and'`c)

case49 = TestCase $ assertEqual
  "gray"
  ["000", "001", "011", "010", "110", "111", "101", "100"] $
  gray 3

case50 = TestCase $ assertEqual
  "huffman" [
    ('a', "0"), ('b', "101"), ('c', "100"),
    ('d', "111"), ('e', "1101"), ('f', "1100")
  ] $
  huffman [
    ('a', 45), ('b', 13), ('c', 12),
    ('d', 16), ('e', 9), ('f', 5)
  ]

case51 = emptyTestCase

case52 = emptyTestCase

case53 = emptyTestCase

case54 = emptyTestCase

case55 = TestCase $ assertEqual
  "cbalTrees" [
    Branch 'x'
      (Branch 'x' Empty Empty)
      (Branch 'x'
        Empty
        (Branch 'x' Empty Empty)),
    Branch 'x'
      (Branch 'x' Empty Empty)
      (Branch 'x'
        (Branch 'x' Empty Empty)
        Empty),
    Branch 'x'
      (Branch 'x'
        Empty
        (Branch 'x' Empty Empty))
      (Branch 'x' Empty Empty),
    Branch 'x'
      (Branch 'x'
        (Branch 'x' Empty Empty)
        Empty)
      (Branch 'x' Empty Empty)
  ] $
  cbalTrees 'x' 4

case56 = TestCase $ assertEqual
  "symmetric" (
    True,
    False
  ) (
    symmetric (
      Branch 'x'
        (Branch 'x' Empty Empty)
        (Branch 'x' Empty Empty)
    ),
    symmetric (
      Branch 'x'
        (Branch 'x' Empty Empty)
        Empty
    )
  )

case57 = TestCase $ assertEqual
  "construct" (
    Branch 3
      (Branch 2
        (Branch 1 Empty Empty)
        Empty)
      (Branch 5
        Empty
        (Branch 7 Empty Empty)),
    True,
    True
  ) (
    construct [3, 2, 5, 7, 1],
    symmetric . construct $ [5, 3, 18, 1, 4, 12, 21],
    symmetric . construct $ [3, 2, 5, 7, 1]
  )

case58 = TestCase $ assertEqual
  "symCbalTrees" [
    Branch 'x'
      (Branch 'x'
        Empty
        (Branch 'x' Empty Empty))
      (Branch 'x'
        (Branch 'x' Empty Empty)
        Empty),
    Branch 'x'
      (Branch 'x'
        (Branch 'x' Empty Empty)
        Empty)
      (Branch 'x'
        Empty
        (Branch 'x' Empty Empty))
  ] $
  symCbalTrees 'x' 5

case59 = TestCase $ assertEqual
  "hbalTreesH" [
    Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' (Branch 'x' Empty Empty) Empty),
    Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' Empty (Branch 'x' Empty Empty)) (Branch 'x' Empty Empty),
    Branch 'x' (Branch 'x' Empty (Branch 'x' Empty Empty)) (Branch 'x' Empty (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' Empty (Branch 'x' Empty Empty)) (Branch 'x' (Branch 'x' Empty Empty) Empty),
    Branch 'x' (Branch 'x' Empty (Branch 'x' Empty Empty)) (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) Empty) (Branch 'x' Empty Empty),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) Empty) (Branch 'x' Empty (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) Empty) (Branch 'x' (Branch 'x' Empty Empty) Empty),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) Empty) (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)) (Branch 'x' Empty Empty),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)) (Branch 'x' Empty (Branch 'x' Empty Empty)),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)) (Branch 'x' (Branch 'x' Empty Empty) Empty),
    Branch 'x' (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)) (Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty))
  ] $
  sort $ hbalTreesH 'x' 3

case60 = TestCase $ assertEqual
  "hbalTrees" (
    [
      [Empty],
      [Branch 'x' Empty Empty],
      [Branch 'x' Empty (Branch 'x' Empty Empty), Branch 'x' (Branch 'x' Empty Empty) Empty],
      [Branch 'x' (Branch 'x' Empty Empty) (Branch 'x' Empty Empty)]
    ],
    1553
  ) (
    map (hbalTrees 'x') [0..3],
    length $ hbalTrees 'x' 15
  )

bTree5 =
  Branch 'a'
    (Branch 'b'
      Empty
      (Branch 'd' Empty Empty))
    (Branch 'c'
      (Branch 'e' Empty Empty)
      Empty)

case61 = TestCase $ assertEqual
  "countLeaves, leaves"
  (2, ['d', 'e'])
  (countLeaves bTree5, leaves bTree5)

case62 = TestCase $ assertEqual
  "internals, atLevel"
  (['a', 'b', 'c'], ['b', 'c'])
  (internals bTree5, atLevel bTree5 2)

case63 = TestCase $ assertEqual
  "completeBinaryTree, isCompleteBinaryTree" (
    Branch 'x'
      (Branch 'x' (Branch 'x' Empty Empty) Empty)
      (Branch 'x' Empty Empty),
    True
  ) (
    completeBinaryTree 4,
    isCompleteBinaryTree . completeBinaryTree $ 4
  )

case64 = TestCase $ assertEqual
  "layout" (
    Branch ('a', (3, 1))
      (Branch ('b', (1, 2))
        Empty
        (Branch ('d', (2, 3)) Empty Empty))
      (Branch ('c', (5, 2))
        (Branch ('e', (4, 3)) Empty Empty)
        Empty)
  ) $
  layout bTree5

case67 = TestCase $ assertEqual
  "treeToString, stringToTree"
  ("a(b(,d),c(e,))", Just bTree5)
  (treeToString bTree5, stringToTree "a(b(,d),c(e,))")

case68 = TestCase $ assertEqual
  "preorder, inorder"
  ("abdce", "bdaec")
  (preorder bTree5, inorder bTree5)

case69 = TestCase $ assertEqual
  "tree2ds, ds2tree"
  ("ab.d..ce...", Just bTree5)
  (tree2ds bTree5, ds2tree "ab.d..ce...")

mTree7 =
  MTree 'a' [
    MTree 'b' [MTree 'c' []],
    MTree 'd' [MTree 'e' [], MTree 'f' []],
    MTree 'g' []
  ]

case70 = TestCase $ assertEqual
  "nnodes, mtreeToString, stringToMtree"
  (7, "abc^^de^f^^g^^", Just mTree7)
  (nnodes mTree7, mtreeToString mTree7, stringToMtree "abc^^de^f^^g^^")

case71 = TestCase $ assertEqual
  "ipl"
  9 $
  ipl mTree7

case72 = TestCase $ assertEqual
  "bottomUp"
  "cbefdga" $
  bottomUp mTree7

case73 = TestCase $ assertEqual
  "sexp"
  "(a (b c) (d e f) g)" $
  sexp mTree7

case74 = emptyTestCase

case75 = emptyTestCase

case76 = emptyTestCase

case77 = emptyTestCase

case78 = emptyTestCase

case79 = emptyTestCase

testcases =
  TestList [
    case01, case02, case03, case04, case05,
    case06, case07, case08, case09, case10,
    case11, case12, case13, case14, case15,
    case16, case17, case18, case19, case20,
    case21, case22, case23, case24, case25,
    case26, case27, case28, case29, case30,
    case31, case32, case33, case34, case35,
    case36, case37, case38, case39, case40,
    case41, case42, case43, case44, case45,
    case46, case47, case48, case49, case50,
    case51, case52, case53, case54, case55,
    case56, case57, case58, case59, case60,
    case61, case62, case63, case64,
    case67, case68, case69, case70,
    case71, case72, case73, case74, case75,
    case76, case77, case78, case79
  ]
