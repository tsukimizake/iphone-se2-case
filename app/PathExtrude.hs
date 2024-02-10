module PathExtrude (pathExtrude, bezier3) where

import Data.Foldable (Foldable (foldl'))
import Data.Function ((&))
import OpenSCAD

pathExtrude :: [Vector3d] -> Model3d -> Model3d
pathExtrude path model =
  zipWith (\p1 p2 -> hull [translate p1 model, translate p2 model]) path (tail path)
    & union

bezier3 :: Vector3d -> Vector3d -> Vector3d -> Vector3d -> [Vector3d]
bezier3 p0 p1 p2 p3 =
  let getx (a, b, c) = a
      gety (a, b, c) = b
      getz (a, b, c) = c
      x = bezier3_impl (getx p0) (getx p1) (getx p2) (getx p3)
      y = bezier3_impl (gety p0) (gety p1) (gety p2) (gety p3)
      z = bezier3_impl (getz p0) (getz p1) (getz p2) (getz p3)
   in zip3 x y z

bezier3_impl :: Double -> Double -> Double -> Double -> [Double]
bezier3_impl p0 p1 p2 p3 =
  [0, 0.02 .. 1]
    & map (\t -> (1 - t) ^ 3 * p0 + 3 * (1 - t) ^ 2 * t * p1 + 3 * (1 - t) * t ^ 2 * p2 + t ^ 3 * p3)
