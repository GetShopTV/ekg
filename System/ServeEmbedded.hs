{-# LANGUAGE OverloadedStrings#-}

-- Snap does not provide serving internal files, so it extends it.
module System.ServeEmbedded
    ( serveEmbeddedDirectory
    ) where

import Data.ByteString
import Snap.Core (MonadSnap)
import Snap.Util.FileServe (defaultDirectoryConfig, DirectoryConfig)

serveEmbeddedDirectory :: MonadSnap m => [(FilePath, ByteString)] -> m ()
serveEmbeddedDirectory = serveEmbeddedDirectoryWith defaultDirectoryConfig

serveEmbeddedDirectoryWith ::  MonadSnap m => DirectoryConfig m  -> [(FilePath, ByteString)] -> m ()
serveEmbeddedDirectoryWith _cfg _base = return ()
