{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_diamond (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,1,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/bin"
libdir     = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/lib/x86_64-osx-ghc-8.8.4/diamond-1.1.0.6-9QnqumNx5biDAOo6gMtncr"
dynlibdir  = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/share/x86_64-osx-ghc-8.8.4/diamond-1.1.0.6"
libexecdir = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/libexec/x86_64-osx-ghc-8.8.4/diamond-1.1.0.6"
sysconfdir = "/Users/dotzo/Documents/Programming/exercism/haskell/diamond/.stack-work/install/x86_64-osx/c1bd4f0fb4d28c5cd40c842b4bb4c938ab8e17a4cd72b492220e4459dfd951e3/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "diamond_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "diamond_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "diamond_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "diamond_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "diamond_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "diamond_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
