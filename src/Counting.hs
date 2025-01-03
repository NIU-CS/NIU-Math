module Counting (
    computeCounting,
) where

import Endl (endl)

-- 計算排列數
-- p(n, r) = n! / (n - r)!
p :: Int -> Int -> Int
p n r = frac n `div` frac (n - r)

-- 計算組合數
-- c(n, r) = n! / (r! * (n - r)!)
c :: Int -> Int -> Int
c n r = frac n `div` (frac r * frac (n - r))

-- 計算階乘
-- frac(n) = n!
frac :: Int -> Int
frac n = product [1 .. n]

-- 0. (a) In how many ways can the letters in DATAGRAM be arranged?
datagramArrangements :: IO ()
datagramArrangements = do
    let n = 8
    let r = 5
    putStrLn $ "0. (a) In how many ways can the letters in DATAGRAM be arranged?"
    putStrLn $ "P(" ++ show n ++ ", " ++ show r ++ ") = " ++ show (p n r)

-- 0. (b) For the arrangements of part(a), how many have all three A's together?
threeAsTogether :: IO ()
threeAsTogether = do
    let n = 6
    putStrLn $ "0. (b) For the arrangements of part(a), how many have all three A's together?"
    putStrLn $ "6! = " ++ show (frac n)

-- 1. (a) In how many ways can eight people, denoted A, B, ..., H, be seated about the square table, where situations (a) and (b) are considered the same, but are distinct from (c).
--   A B   |   G H   |   F G
-- H     C | F     A | E     H
-- G     D | E     B | D     A
--   F E   |   D C   |   C B
-- (a)     | (b)     | (c)
squareTableSeating :: IO ()
squareTableSeating = do
    let n = 8
    let r = 2
    putStrLn $ "1. (a) In how many ways can eight people, denoted A, B, ..., H, be seated about the square table, where situations (a) and (b) are considered the same, but are distinct from (c)."
    -- 2 * 7! = 10080
    putStrLn $ "P(" ++ show n ++ ", " ++ show r ++ ") = " ++ show (2 * frac 7)

-- 1. (b) If two of the eight people, say A and B, do not get along well, how many different seatings are possible with A and B not sitting next to each other?
nonAdjacentAB :: IO ()
nonAdjacentAB = do
    putStrLn $ "1. (b) If two of the eight people, say A and B, do not get along well, how many different seatings are possible with A and B not sitting next to each other?"
    -- 10080 - 4 * 6! = 7200
    putStrLn $ show 10080 ++ " - 4 * 6! = " ++ show (10080 - 4 * frac 6)

-- 2. Find the coefficient of w^2 x^2 y^2 z^2 in the expansion of (2w - x + 3y + z - 2)^12
coefficientExpansion :: IO ()
coefficientExpansion = do
    putStrLn $ "2. Find the coefficient of w^2 x^2 y^2 z^2 in the expansion of (2w - x + 3y + z - 2)^12"
    -- 12! / (2! * 2! * 2! * 2! * 4!) * 2^2 * (-1)^2 * 3^2 * 1^2 * (-2)^4 = 718502400
    putStrLn $ "12! / (2! * 2! * 2! * 2! * 4!) * 2^2 * (-1)^2 * 3^2 * 1^2 * (-2)^4 = " ++ show (frac 12 `div` (frac 2 * frac 2 * frac 2 * frac 2 * frac 4) * 2 ^ 2 * (-1) ^ 2 * 3 ^ 2 * 1 ^ 2 * (-2) ^ 4)

-- 3. In how many ways can a teacher distribute eight chocolate donuts and seven jelly donuts among three students helpers if each helper wants at least one donut of each kind?
donutDistribution :: IO ()
donutDistribution = do
    putStrLn $ "3. In how many ways can a teacher distribute eight chocolate donuts and seven jelly donuts among three students helpers if each helper wants at least one donut of each kind?"
    -- Chocolate donuts: ((5 + 3 - 1)! / 5!) = 21
    -- Jelly donuts: ((4 + 3 - 1)! / 4!) = 15
    -- By the rule of product, there are 21 * 15 = 315 ways
    putStrLn $ "((5 + 3 - 1)! / 5!) * ((4 + 3 - 1)! / 4!) = " ++ show (21 * 15)

-- 4. Triangle ACE is equilateral with AC = 1. If five points are selected from the interior of the triangle, there are at least two whose distance apart is less than 1/2.
trianglePoints :: IO ()
trianglePoints = do
    putStrLn "4. Triangle ACE is equilateral with AC = 1. If five points are selected from the interior of the triangle, there are at least two whose distance apart is less than 1/2."
    putStrLn "By pigeonhole principle, at least two points must be closer than 1/2."
    putStrLn $ "Triangle ACE is equilateral with AC = 1. If five points are selected from the interior of the triangle, there are at least two whose distance apart is less than 1/2."
    -- prove by contradiction
    -- 1. Divide the equilateral triangle into 4 smaller equilateral triangles
    -- 2. By the pigeonhole principle, at least one of the smaller triangles contains 2 points
    -- 3. The distance between the 2 points is less than 1/2
    -- 4. Therefore, there are at least two points whose distance apart is less than 1/2
    -- 5. The statement is true
    -- 鴿子 : 5 個點
    -- 鴿洞 : 4 個三角形如右圖
    -- 因為 5 > 4，基於鴿洞原理，
    -- 至少有兩個點落於其中一個三角形內，
    -- 因此至少有兩個點之間距離小於 ½。

-- Counting Suggested Exercises

-- 1. Determine the number of (staircase) paths in the x-y-plane from (2, 1) to (7, 4), where each such path is made up of individual steps going one unit to the right (R) or one unit upward (U).
staircasePaths :: IO ()
staircasePaths = do
    putStrLn $ "1. Determine the number of (staircase) paths in the x-y-plane from (2, 1) to (7, 4), where each such path is made up of individual steps going one unit to the right (R) or one unit upward (U)."
    putStrLn $ "It needs 5R and 3U, so 8! / (5!3!) = " ++ show (c 8 3)

-- 2. How many positive intergers n can we form using the digits 3, 4, 4, 5, 5, 6, 7 if we want n to exceed 5,000,000?
largeNumbers :: IO ()
largeNumbers = do
    -- Case 1: Leading digit 5______ 6! / 2!
    -- Case 2: Leading digit 6______ 6! / 2!2!
    -- Case 3: Leading digit 7______ 6! / 2!2!
    putStrLn $ "2. How many positive intergers n can we form using the digits 3, 4, 4, 5, 5, 6, 7 if we want n to exceed 5,000,000?"
    putStrLn $ "Case 1: Leading digit 5______ 6! / 2! = " ++ show (frac 6 `div` frac 2)
    putStrLn $ "Case 2: Leading digit 6______ 6! / 2!2! = " ++ show (frac 6 `div` (frac 2 * frac 2))
    putStrLn $ "Case 3: Leading digit 7______ 6! / 2!2! = " ++ show (frac 6 `div` (frac 2 * frac 2))
    putStrLn $ "Total = " ++ show (frac 6 `div` frac 2 + frac 6 `div` (frac 2 * frac 2) + frac 6 `div` (frac 2 * frac 2))

-- 3. Determine the sum of all the coefficients in the expansions of (x + y + z)^10
polynomialSum :: IO ()
polynomialSum = do
    -- (1 + 1 + 1)^10 = 3^10
    putStrLn $ "3. Determine the sum of all the coefficients in the expansions of (x + y + z)^10"
    putStrLn $ "3^10 = " ++ show (3 ^ 10)

-- 4. In how many ways can we distribute eight identical white balls into four distinct containers so that (a) no container is left empty? (b) the fourth container has an odd number of balls in it?
distributeBalls :: IO ()
distributeBalls = do
    putStrLn $ "4. In how many ways can we distribute eight identical white balls into four distinct containers so that (a) no container is left empty? (b) the fourth container has an odd number of balls in it?"

    -- (a) ((4 + 4 - 1)! / 4!) = 35
    -- (b) One marble:
    --
    -- implement later

-- 5. In how many ways can the letters in WONDERING be arranged with exactly two Nconsecutive vowels?
consecutiveVowels :: IO ()
consecutiveVowels = do
    putStrLn $ "5. In how many ways can the letters in WONDERING be arranged with exactly two Nconsecutive vowels?"
    -- implement later

-- 6. How many times must we roll a single die in order to get the same score (a) at least twice? (b) at least three time? (c) at least n time, for n >= 4?
sameScore :: IO ()
sameScore = do
    -- (a) 7
    -- (b) 11
    -- (c) 6(n-1)+1
    putStrLn $ "6. How many times must we roll a single die in order to get the same score (a) at least twice? (b) at least three time? (c) at least n time, for n >= 4?"
    putStrLn $ "a) 7"
    putStrLn $ "b) 11"
    putStrLn $ "c) 6(n-1)+1"

-- Entry point for demonstration
computeCounting :: IO ()
computeCounting = do
    putStrLn "=============================="
    putStrLn "Counting"
    putStrLn "=============================="
    endl

    datagramArrangements
    endl
    threeAsTogether
    endl
    squareTableSeating
    endl
    nonAdjacentAB
    endl
    coefficientExpansion
    endl
    endl
    donutDistribution
    endl
    trianglePoints
    endl
    staircasePaths
    endl
    largeNumbers
    endl
    polynomialSum
    endl
