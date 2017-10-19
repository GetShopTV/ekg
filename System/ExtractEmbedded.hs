{-# LANGUAGE OverloadedStrings#-}

module System.ExtractEmbedded where

import Prelude hiding (writeFile)

import Data.ByteString (ByteString, writeFile)

import System.FilePath ((</>))
import System.Directory (createDirectoryIfMissing)

extractEmbeddedDirectory :: FilePath -> [(FilePath, ByteString)] -> IO ()
extractEmbeddedDirectory base files = do
  createDirectoryIfMissing True base
  mapM_ (extractEmbeddedFile base) files

extractEmbeddedFile :: FilePath -> (FilePath, ByteString) -> IO ()
extractEmbeddedFile prefix (path, content) = writeFile (prefix </> path) content

