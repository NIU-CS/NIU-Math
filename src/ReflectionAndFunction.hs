module ReflectionAndFunction (
    computeReflectionAndFunction,
) where

import Endl (endl)

-- 1. Prove Theorem 5.1 (d)
--
-- 對任意集合 A, B, C ⊆ U：
-- (d)  (A ∪ B) * C = (A * C) ∪ (B * C)
prove1 :: IO ()
prove1 = do
    putStrLn "1. Prove Theorem 5.1 (d)"
    putStrLn "Let A, B, C ⊆ U"
    putStrLn "Prove (A ∪ B) * C = (A * C) ∪ (B * C)"

    putStrLn "Proof:"
    putStrLn "for a, b ∈ U"
    putStrLn "(a, b) ∈ (A ∪ B) * C"
    putStrLn "<=> a ∈ (A ∪ B) ∧ b ∈ C"
    putStrLn "<=> [(a ∈ A) ∨ (a ∈ B)] ∧ (b ∈ C)"
    putStrLn "<=> [(a ∈ A) ∧ (b ∈ C)] ∨ [(a ∈ B) ∧ (b ∈ C)]"
    putStrLn "<=> [(a, b) ∈ (A * C)] ∨ [(a, b) ∈ (B * C)]"
    putStrLn "<=> (a, b) ∈ (A * C) ∪ (B * C)"

-- 2. If A = {1, 2, 3, 4, 5}, and B = {w, x, y, z}, how many elements are there in P(A * B)?
--
-- |A * B| = |A| * |B| = 5 * 4 = 20
-- |P(A * B)| = 2 ^ 20
prove2 :: IO ()
prove2 = do
    putStrLn "2. If A = {1, 2, 3, 4, 5}, and B = {w, x, y, z}, how many elements are there in P(A * B)?"
    putStrLn "|A * B| = |A| * |B| = 5 * 4 = 20"
    putStrLn "|P(A * B)| = 2 ^ 20"

computeReflectionAndFunction :: IO ()
computeReflectionAndFunction = do
    putStrLn "=============================="
    putStrLn "Reflection and Function"
    putStrLn "=============================="
    endl

    prove1
    endl
    prove2
    endl
