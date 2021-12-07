{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
-- -----------------------------------------------------------------------------
--
-- Parser.y, part of Alex
--
-- (c) Simon Marlow 2003
--
-- -----------------------------------------------------------------------------

{-# OPTIONS_GHC -w #-}

module Parser ( parse, P ) where
import AbsSyn
import Scan
import CharSet
import ParseMonad hiding ( StartCode )

import Data.Char
--import Debug.Trace
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.10

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 ((Maybe (AlexPosn,Code), [Directive], Scanner, Maybe (AlexPosn,Code)))
happyIn4 :: ((Maybe (AlexPosn,Code), [Directive], Scanner, Maybe (AlexPosn,Code))) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 (Maybe (AlexPosn,Code))
happyIn5 :: (Maybe (AlexPosn,Code)) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 ([Directive])
happyIn6 :: ([Directive]) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 (Directive)
happyIn7 :: (Directive) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 (Encoding)
happyIn8 :: (Encoding) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (())
happyIn9 :: (()) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 (())
happyIn10 :: (()) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 (Scanner)
happyIn11 :: (Scanner) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 ([RECtx])
happyIn12 :: ([RECtx]) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 ([RECtx])
happyIn13 :: ([RECtx]) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 (RECtx)
happyIn14 :: (RECtx) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 ([RECtx])
happyIn15 :: ([RECtx]) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 ([(String,StartCode)])
happyIn16 :: ([(String,StartCode)]) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 ([(String,StartCode)])
happyIn17 :: ([(String,StartCode)]) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 (String)
happyIn18 :: (String) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Maybe Code)
happyIn19 :: (Maybe Code) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (Maybe CharSet, RExp, RightContext RExp)
happyIn20 :: (Maybe CharSet, RExp, RightContext RExp) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 (CharSet)
happyIn21 :: (CharSet) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 (RightContext RExp)
happyIn22 :: (RightContext RExp) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 (RExp)
happyIn23 :: (RExp) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 (RExp)
happyIn24 :: (RExp) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (RExp)
happyIn25 :: (RExp) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 (RExp -> RExp)
happyIn26 :: (RExp -> RExp) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 (RExp)
happyIn27 :: (RExp) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 (CharSet)
happyIn28 :: (CharSet) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 (CharSet)
happyIn29 :: (CharSet) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
newtype HappyWrap30 = HappyWrap30 ([CharSet])
happyIn30 :: ([CharSet]) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap30 x)
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> HappyWrap30
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
newtype HappyWrap31 = HappyWrap31 ((AlexPosn,String))
happyIn31 :: ((AlexPosn,String)) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap31 x)
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> HappyWrap31
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\xc0\x07\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x08\x00\x14\x60\x00\x00\x00\x00\x80\x00\x48\x21\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x20\x48\x21\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x80\x15\xe2\x00\x00\x00\x00\x80\x00\x40\x01\x06\x00\x00\x00\x00\x08\x00\x54\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x28\x80\x54\xe2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x28\x80\x54\xe2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\xa0\x54\xe2\x00\x00\x00\x00\x00\x01\x00\x00\x01\x00\x00\x00\x00\x08\x80\x14\xe2\x00\x00\x00\x00\x00\x10\x00\x08\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x00\x00\x00\x00\x00\x00\x90\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x14\x60\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x08\x00\x16\x60\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x08\x00\x14\x60\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x80\x14\xe2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x80\x14\xf2\x00\x00\x00\x00\x00\x10\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x80\x54\xe2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x80\x54\xe2\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x90\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","alex","maybe_code","directives","directive","encoding","macdefs","macdef","scanner","tokendefs","tokendef","rule","rules","startcodes","startcodes0","startcode","rhs","context","left_ctx","right_ctx","rexp","alt","term","rep","rexp0","set","set0","sets","smac","'.'","';'","'<'","'>'","','","'$'","'|'","'*'","'+'","'?'","'{'","'}'","'('","')'","'#'","'~'","'-'","'['","']'","'^'","'/'","ZERO","STRING","BIND","ID","CODE","CHAR","SMAC","RMAC","SMAC_DEF","RMAC_DEF","WRAPPER","ENCODING","ACTIONTYPE","TOKENTYPE","TYPECLASS","%eof"]
        bit_start = st * 68
        bit_end = (st + 1) * 68
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..67]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xec\xff\xec\xff\xf3\x00\x00\x00\xe5\xff\xfc\xff\xf3\x00\x0d\x00\x18\x00\x2e\x00\x40\x00\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x49\x00\xfc\xff\x7d\x00\x6f\x00\x00\x00\x27\x00\x00\x00\xb4\x00\x08\x00\x00\x00\x00\x00\x00\x00\x39\x00\x7d\x00\x0f\x00\x00\x00\x3c\x00\x00\x00\x00\x00\x5f\x00\x00\x00\x4f\x00\x01\x00\x00\x00\x01\x00\x00\x00\x15\x00\xff\xff\x6f\x00\xfd\xff\x24\x00\x26\x00\x00\x00\x00\x00\x7d\x00\x58\x00\x75\x00\x62\x00\x7d\x00\x00\x00\x64\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5c\x00\x00\x00\x6f\x00\x00\x00\x21\x00\x00\x00\x68\x00\x00\x00\x00\x00\x00\x00\x00\x00\x79\x00\x7b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x4b\x00\xfd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x5d\x00\x00\x00\x5d\x00\x76\x00\x00\x00\x00\x00\x00\x00\x26\x00\x00\x00\x00\x00\xf9\xff\x00\x00\x00\x00\x77\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x35\x00\x87\x00\x3e\x00\x00\x00\x00\x00\x4d\x00\x57\x00\x00\x00\x85\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x8e\x00\x5a\x00\x36\x00\xf4\xff\x00\x00\xf7\x00\x00\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd7\x00\x22\x00\xb6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x96\x00\x8a\x00\x00\x00\x9e\x00\x00\x00\xce\x00\x8d\x00\xe0\x00\x92\x00\x00\x00\x56\x00\x00\x00\x00\x00\x2f\x00\x00\x00\x00\x01\x00\x00\x04\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe9\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf2\x00\x97\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb0\x00\x00\x00\xc2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xfc\xff\x00\x00\xfa\xff\xfd\xff\x00\x00\xf2\xff\xfa\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf5\xff\xf6\xff\xf7\xff\xf8\xff\xf4\xff\xf9\xff\xfb\xff\x00\x00\xf2\xff\x00\x00\x00\x00\xf0\xff\xd6\xff\xd4\xff\xd2\xff\xc8\xff\xc5\xff\xc2\xff\xbc\xff\x00\x00\x00\x00\xbd\xff\xca\xff\xc4\xff\xbb\xff\xc9\xff\xf1\xff\xf3\xff\xfc\xff\xed\xff\xef\xff\xed\xff\xea\xff\x00\x00\x00\x00\x00\x00\xd8\xff\xc8\xff\x00\x00\xdd\xff\xfe\xff\x00\x00\x00\x00\xbd\xff\x00\x00\xbd\xff\xbf\xff\x00\x00\xcb\xff\xd3\xff\xd1\xff\xd0\xff\xcf\xff\x00\x00\xd5\xff\x00\x00\xd7\xff\x00\x00\xc7\xff\x00\x00\xc1\xff\xbe\xff\xc3\xff\xc6\xff\x00\x00\xe4\xff\xe3\xff\xe2\xff\xdc\xff\xde\xff\xdb\xff\x00\x00\xd8\xff\xe9\xff\xe0\xff\xe1\xff\xec\xff\xe7\xff\xee\xff\xe7\xff\x00\x00\xdf\xff\xda\xff\xd9\xff\x00\x00\xe6\xff\xc0\xff\x00\x00\xce\xff\xcd\xff\x00\x00\xe5\xff\xeb\xff\xe8\xff\xcc\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x02\x00\x01\x00\x06\x00\x03\x00\x0c\x00\x1a\x00\x13\x00\x14\x00\x15\x00\x25\x00\x17\x00\x18\x00\x19\x00\x0d\x00\x1b\x00\x01\x00\x10\x00\x15\x00\x12\x00\x1b\x00\x14\x00\x01\x00\x0f\x00\x17\x00\x1a\x00\x1e\x00\x1f\x00\x1b\x00\x1c\x00\x1d\x00\x10\x00\x0b\x00\x12\x00\x0d\x00\x14\x00\x17\x00\x10\x00\x05\x00\x12\x00\x01\x00\x14\x00\x1b\x00\x1c\x00\x17\x00\x0c\x00\x07\x00\x17\x00\x1b\x00\x1c\x00\x1d\x00\x0f\x00\x0d\x00\x00\x00\x01\x00\x10\x00\x14\x00\x12\x00\x01\x00\x19\x00\x16\x00\x1b\x00\x17\x00\x19\x00\x02\x00\x03\x00\x1b\x00\x1c\x00\x1d\x00\x17\x00\x0d\x00\x0e\x00\x19\x00\x10\x00\x1b\x00\x12\x00\x01\x00\x11\x00\x18\x00\x19\x00\x17\x00\x1b\x00\x05\x00\x06\x00\x1b\x00\x1c\x00\x1d\x00\x17\x00\x0d\x00\x02\x00\x03\x00\x10\x00\x17\x00\x12\x00\x01\x00\x05\x00\x06\x00\x18\x00\x17\x00\x0d\x00\x0e\x00\x1a\x00\x1b\x00\x1c\x00\x1d\x00\x1a\x00\x0d\x00\x0d\x00\x0e\x00\x10\x00\x0f\x00\x12\x00\x01\x00\x14\x00\x0e\x00\x1b\x00\x17\x00\x13\x00\x01\x00\x1b\x00\x1b\x00\x1c\x00\x1d\x00\x13\x00\x0d\x00\x04\x00\x01\x00\x10\x00\x05\x00\x12\x00\x0c\x00\x0c\x00\x0f\x00\x10\x00\x17\x00\x12\x00\x01\x00\x04\x00\x1b\x00\x1c\x00\x1d\x00\x10\x00\x16\x00\x12\x00\x1b\x00\x1c\x00\x08\x00\x09\x00\x0a\x00\x07\x00\x0c\x00\x01\x00\x1b\x00\x1c\x00\x10\x00\x11\x00\x0f\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\x12\x00\x1b\x00\x08\x00\x09\x00\x0a\x00\x12\x00\x0c\x00\xff\xff\xff\xff\xff\xff\x10\x00\x11\x00\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x0a\x00\x0b\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x10\x00\x11\x00\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x0a\x00\x0b\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x10\x00\x11\x00\xff\xff\x13\x00\x14\x00\x15\x00\x0a\x00\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x10\x00\x11\x00\xff\xff\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x13\x00\x14\x00\x15\x00\xff\xff\x17\x00\x18\x00\x19\x00\x15\x00\x1b\x00\x17\x00\x18\x00\x19\x00\xff\xff\x1b\x00\x20\x00\x21\x00\x22\x00\x23\x00\x24\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\x18\x00\x19\x00\x1a\x00\x1b\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x57\x00\x1f\x00\x53\x00\x33\x00\x66\x00\x04\x00\x17\x00\x18\x00\x19\x00\xff\xff\x1a\x00\x1b\x00\x1c\x00\x20\x00\x1d\x00\x1f\x00\x21\x00\x54\x00\x22\x00\x67\x00\x34\x00\x1f\x00\x36\x00\x23\x00\x58\x00\x16\x00\x17\x00\x24\x00\x25\x00\x26\x00\x21\x00\x5a\x00\x22\x00\x20\x00\x3a\x00\x12\x00\x21\x00\x64\x00\x22\x00\x1f\x00\x34\x00\x24\x00\x25\x00\x23\x00\x65\x00\x44\x00\x11\x00\x24\x00\x25\x00\x26\x00\x36\x00\x20\x00\x04\x00\x02\x00\x21\x00\x51\x00\x22\x00\x1f\x00\x3a\x00\x4f\x00\x1d\x00\x23\x00\x50\x00\x05\x00\x06\x00\x24\x00\x25\x00\x26\x00\x0f\x00\x20\x00\x3d\x00\x4b\x00\x21\x00\x1d\x00\x22\x00\x1f\x00\x37\x00\x26\x00\x1c\x00\x23\x00\x1d\x00\x13\x00\x14\x00\x24\x00\x25\x00\x26\x00\x0e\x00\x20\x00\x12\x00\x06\x00\x21\x00\x0d\x00\x22\x00\x1f\x00\x27\x00\x14\x00\x2a\x00\x23\x00\x4c\x00\x4d\x00\x60\x00\x24\x00\x25\x00\x26\x00\x04\x00\x20\x00\x67\x00\x4d\x00\x21\x00\x36\x00\x22\x00\x1f\x00\x34\x00\x47\x00\x4b\x00\x23\x00\x49\x00\x1f\x00\x46\x00\x24\x00\x25\x00\x26\x00\x63\x00\x20\x00\x62\x00\x1f\x00\x21\x00\x61\x00\x22\x00\x69\x00\x6b\x00\x36\x00\x21\x00\x23\x00\x22\x00\x02\x00\x0f\x00\x24\x00\x25\x00\x26\x00\x21\x00\x3d\x00\x22\x00\x24\x00\x25\x00\x2a\x00\x2b\x00\x2c\x00\x28\x00\x2d\x00\x34\x00\x24\x00\x25\x00\x2e\x00\x2f\x00\x55\x00\x30\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x31\x00\x1c\x00\x51\x00\x1d\x00\x5a\x00\x2b\x00\x2c\x00\x5d\x00\x2d\x00\x00\x00\x00\x00\x00\x00\x2e\x00\x2f\x00\x00\x00\x30\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x31\x00\x1c\x00\x00\x00\x1d\x00\x5b\x00\x5c\x00\x3f\x00\x40\x00\x41\x00\x42\x00\x2e\x00\x2f\x00\x00\x00\x30\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x31\x00\x1c\x00\x00\x00\x1d\x00\x5b\x00\x69\x00\x37\x00\x1c\x00\x38\x00\x1d\x00\x2e\x00\x2f\x00\x00\x00\x30\x00\x18\x00\x19\x00\x58\x00\x1a\x00\x31\x00\x1c\x00\x00\x00\x1d\x00\x2e\x00\x2f\x00\x00\x00\x30\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x31\x00\x1c\x00\x00\x00\x1d\x00\x3b\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x1b\x00\x1c\x00\x00\x00\x1d\x00\x54\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x1b\x00\x1c\x00\x00\x00\x1d\x00\x44\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x1b\x00\x1c\x00\x00\x00\x1d\x00\x5e\x00\x18\x00\x19\x00\x00\x00\x1a\x00\x1b\x00\x1c\x00\x42\x00\x1d\x00\x1a\x00\x1b\x00\x1c\x00\x00\x00\x1d\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x0c\x00\x37\x00\x1c\x00\x49\x00\x1d\x00\x37\x00\x1c\x00\x47\x00\x1d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 68) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68)
	]

happy_n_terms = 38 :: Int
happy_n_nonterms = 28 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_1 = happyReduce 5# 0# happyReduction_1
happyReduction_1 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut5 happy_x_1 of { (HappyWrap5 happy_var_1) -> 
	case happyOut6 happy_x_2 of { (HappyWrap6 happy_var_2) -> 
	case happyOut11 happy_x_4 of { (HappyWrap11 happy_var_4) -> 
	case happyOut5 happy_x_5 of { (HappyWrap5 happy_var_5) -> 
	happyIn4
		 ((happy_var_1,happy_var_2,happy_var_4,happy_var_5)
	) `HappyStk` happyRest}}}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (case happy_var_1 of T pos (CodeT code) ->
						Just (pos,code)
	)}

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_3 = happySpecReduce_0  1# happyReduction_3
happyReduction_3  =  happyIn5
		 (Nothing
	)

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_4 = happySpecReduce_2  2# happyReduction_4
happyReduction_4 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut6 happy_x_2 of { (HappyWrap6 happy_var_2) -> 
	happyIn6
		 (happy_var_1 : happy_var_2
	)}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_5 = happySpecReduce_0  2# happyReduction_5
happyReduction_5  =  happyIn6
		 ([]
	)

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_6 = happySpecReduce_2  3# happyReduction_6
happyReduction_6 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (T _ (StringT happy_var_2)) -> 
	happyIn7
		 (WrapperDirective happy_var_2
	)}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_7 = happySpecReduce_2  3# happyReduction_7
happyReduction_7 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
	happyIn7
		 (EncodingDirective happy_var_2
	)}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_8 = happySpecReduce_2  3# happyReduction_8
happyReduction_8 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (T _ (StringT happy_var_2)) -> 
	happyIn7
		 (ActionType happy_var_2
	)}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_9 = happySpecReduce_2  3# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (T _ (StringT happy_var_2)) -> 
	happyIn7
		 (TokenType happy_var_2
	)}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_10 = happySpecReduce_2  3# happyReduction_10
happyReduction_10 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (T _ (StringT happy_var_2)) -> 
	happyIn7
		 (TypeClass happy_var_2
	)}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_11 = happyMonadReduce 1# 4# happyReduction_11
happyReduction_11 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { (T _ (StringT happy_var_1)) -> 
	( lookupEncoding happy_var_1)})
	) (\r -> happyReturn (happyIn8 r))

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_12 = happySpecReduce_2  5# happyReduction_12
happyReduction_12 happy_x_2
	happy_x_1
	 =  happyIn9
		 (()
	)

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_13 = happySpecReduce_0  5# happyReduction_13
happyReduction_13  =  happyIn9
		 (()
	)

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_14 = happyMonadReduce 2# 6# happyReduction_14
happyReduction_14 (happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { (T _ (SMacDefT happy_var_1)) -> 
	case happyOut28 happy_x_2 of { (HappyWrap28 happy_var_2) -> 
	( newSMac happy_var_1 happy_var_2)}})
	) (\r -> happyReturn (happyIn10 r))

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_15 = happyMonadReduce 2# 6# happyReduction_15
happyReduction_15 (happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { (T _ (RMacDefT happy_var_1)) -> 
	case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	( newRMac happy_var_1 happy_var_2)}})
	) (\r -> happyReturn (happyIn10 r))

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_16 = happySpecReduce_2  7# happyReduction_16
happyReduction_16 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (T _ (BindT happy_var_1)) -> 
	case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	happyIn11
		 (Scanner happy_var_1 happy_var_2
	)}}

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_17 = happySpecReduce_2  8# happyReduction_17
happyReduction_17 happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	happyIn12
		 (happy_var_1 ++ happy_var_2
	)}}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_18 = happySpecReduce_0  8# happyReduction_18
happyReduction_18  =  happyIn12
		 ([]
	)

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_19 = happySpecReduce_2  9# happyReduction_19
happyReduction_19 happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut14 happy_x_2 of { (HappyWrap14 happy_var_2) -> 
	happyIn13
		 ([ replaceCodes happy_var_1 happy_var_2 ]
	)}}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_20 = happyReduce 4# 9# happyReduction_20
happyReduction_20 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut15 happy_x_3 of { (HappyWrap15 happy_var_3) -> 
	happyIn13
		 (map (replaceCodes happy_var_1) happy_var_3
	) `HappyStk` happyRest}}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_21 = happySpecReduce_1  9# happyReduction_21
happyReduction_21 happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn13
		 ([ happy_var_1 ]
	)}

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_22 = happySpecReduce_2  10# happyReduction_22
happyReduction_22 happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn14
		 (let (l,e,r) = happy_var_1 in
					  RECtx [] l e r happy_var_2
	)}}

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_23 = happySpecReduce_2  11# happyReduction_23
happyReduction_23 happy_x_2
	happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	case happyOut15 happy_x_2 of { (HappyWrap15 happy_var_2) -> 
	happyIn15
		 (happy_var_1 : happy_var_2
	)}}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_24 = happySpecReduce_0  11# happyReduction_24
happyReduction_24  =  happyIn15
		 ([]
	)

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_25 = happySpecReduce_3  12# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_2 of { (HappyWrap17 happy_var_2) -> 
	happyIn16
		 (happy_var_2
	)}

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_26 = happySpecReduce_3  13# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn17
		 ((happy_var_1,0) : happy_var_3
	)}}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_27 = happySpecReduce_1  13# happyReduction_27
happyReduction_27 happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	happyIn17
		 ([(happy_var_1,0)]
	)}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_28 = happySpecReduce_1  14# happyReduction_28
happyReduction_28 happy_x_1
	 =  happyIn18
		 ("0"
	)

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_29 = happySpecReduce_1  14# happyReduction_29
happyReduction_29 happy_x_1
	 =  case happyOutTok happy_x_1 of { (T _ (IdT happy_var_1)) -> 
	happyIn18
		 (happy_var_1
	)}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_30 = happySpecReduce_1  15# happyReduction_30
happyReduction_30 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn19
		 (case happy_var_1 of T _ (CodeT code) -> Just code
	)}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_31 = happySpecReduce_1  15# happyReduction_31
happyReduction_31 happy_x_1
	 =  happyIn19
		 (Nothing
	)

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_32 = happySpecReduce_3  16# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	case happyOut22 happy_x_3 of { (HappyWrap22 happy_var_3) -> 
	happyIn20
		 ((Just happy_var_1,happy_var_2,happy_var_3)
	)}}}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_33 = happySpecReduce_2  16# happyReduction_33
happyReduction_33 happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	case happyOut22 happy_x_2 of { (HappyWrap22 happy_var_2) -> 
	happyIn20
		 ((Nothing,happy_var_1,happy_var_2)
	)}}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_34 = happySpecReduce_1  17# happyReduction_34
happyReduction_34 happy_x_1
	 =  happyIn21
		 (charSetSingleton '\n'
	)

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_35 = happySpecReduce_2  17# happyReduction_35
happyReduction_35 happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_36 = happySpecReduce_1  18# happyReduction_36
happyReduction_36 happy_x_1
	 =  happyIn22
		 (RightContextRExp (Ch (charSetSingleton '\n'))
	)

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_37 = happySpecReduce_2  18# happyReduction_37
happyReduction_37 happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	happyIn22
		 (RightContextRExp happy_var_2
	)}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_38 = happySpecReduce_2  18# happyReduction_38
happyReduction_38 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { happy_var_2 -> 
	happyIn22
		 (RightContextCode (case happy_var_2 of
						T _ (CodeT code) -> code)
	)}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_39 = happySpecReduce_0  18# happyReduction_39
happyReduction_39  =  happyIn22
		 (NoRightContext
	)

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_40 = happySpecReduce_3  19# happyReduction_40
happyReduction_40 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	case happyOut23 happy_x_3 of { (HappyWrap23 happy_var_3) -> 
	happyIn23
		 (happy_var_1 :| happy_var_3
	)}}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_41 = happySpecReduce_1  19# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	happyIn23
		 (happy_var_1
	)}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_42 = happySpecReduce_2  20# happyReduction_42
happyReduction_42 happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	case happyOut25 happy_x_2 of { (HappyWrap25 happy_var_2) -> 
	happyIn24
		 (happy_var_1 :%% happy_var_2
	)}}

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_43 = happySpecReduce_1  20# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn24
		 (happy_var_1
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_44 = happySpecReduce_2  21# happyReduction_44
happyReduction_44 happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut26 happy_x_2 of { (HappyWrap26 happy_var_2) -> 
	happyIn25
		 (happy_var_2 happy_var_1
	)}}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_45 = happySpecReduce_1  21# happyReduction_45
happyReduction_45 happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	happyIn25
		 (happy_var_1
	)}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_46 = happySpecReduce_1  22# happyReduction_46
happyReduction_46 happy_x_1
	 =  happyIn26
		 (Star
	)

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_47 = happySpecReduce_1  22# happyReduction_47
happyReduction_47 happy_x_1
	 =  happyIn26
		 (Plus
	)

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_48 = happySpecReduce_1  22# happyReduction_48
happyReduction_48 happy_x_1
	 =  happyIn26
		 (Ques
	)

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_49 = happySpecReduce_3  22# happyReduction_49
happyReduction_49 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (T _ (CharT happy_var_2)) -> 
	happyIn26
		 (repeat_rng (digit happy_var_2) Nothing
	)}

happyReduce_50 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_50 = happyReduce 4# 22# happyReduction_50
happyReduction_50 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (T _ (CharT happy_var_2)) -> 
	happyIn26
		 (repeat_rng (digit happy_var_2) (Just Nothing)
	) `HappyStk` happyRest}

happyReduce_51 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_51 = happyReduce 5# 22# happyReduction_51
happyReduction_51 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (T _ (CharT happy_var_2)) -> 
	case happyOutTok happy_x_4 of { (T _ (CharT happy_var_4)) -> 
	happyIn26
		 (repeat_rng (digit happy_var_2) (Just (Just (digit happy_var_4)))
	) `HappyStk` happyRest}}

happyReduce_52 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_52 = happySpecReduce_2  23# happyReduction_52
happyReduction_52 happy_x_2
	happy_x_1
	 =  happyIn27
		 (Eps
	)

happyReduce_53 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_53 = happySpecReduce_1  23# happyReduction_53
happyReduction_53 happy_x_1
	 =  case happyOutTok happy_x_1 of { (T _ (StringT happy_var_1)) -> 
	happyIn27
		 (foldr (:%%) Eps
					    (map (Ch . charSetSingleton) happy_var_1)
	)}

happyReduce_54 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_54 = happyMonadReduce 1# 23# happyReduction_54
happyReduction_54 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { (T _ (RMacT happy_var_1)) -> 
	( lookupRMac happy_var_1)})
	) (\r -> happyReturn (happyIn27 r))

happyReduce_55 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_55 = happySpecReduce_1  23# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn27
		 (Ch happy_var_1
	)}

happyReduce_56 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_56 = happySpecReduce_3  23# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	happyIn27
		 (happy_var_2
	)}

happyReduce_57 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_57 = happySpecReduce_3  24# happyReduction_57
happyReduction_57 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	case happyOut29 happy_x_3 of { (HappyWrap29 happy_var_3) -> 
	happyIn28
		 (happy_var_1 `charSetMinus` happy_var_3
	)}}

happyReduce_58 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_58 = happySpecReduce_1  24# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
	happyIn28
		 (happy_var_1
	)}

happyReduce_59 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_59 = happySpecReduce_1  25# happyReduction_59
happyReduction_59 happy_x_1
	 =  case happyOutTok happy_x_1 of { (T _ (CharT happy_var_1)) -> 
	happyIn29
		 (charSetSingleton happy_var_1
	)}

happyReduce_60 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_60 = happySpecReduce_3  25# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (T _ (CharT happy_var_1)) -> 
	case happyOutTok happy_x_3 of { (T _ (CharT happy_var_3)) -> 
	happyIn29
		 (charSetRange happy_var_1 happy_var_3
	)}}

happyReduce_61 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_61 = happyMonadReduce 1# 25# happyReduction_61
happyReduction_61 (happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	( lookupSMac happy_var_1)})
	) (\r -> happyReturn (happyIn29 r))

happyReduce_62 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_62 = happySpecReduce_3  25# happyReduction_62
happyReduction_62 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn29
		 (foldr charSetUnion emptyCharSet happy_var_2
	)}

happyReduce_63 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_63 = happyMonadReduce 4# 25# happyReduction_63
happyReduction_63 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	( do { dot <- lookupSMac (tokPosn happy_var_1, ".");
		      	        return (dot `charSetMinus`
			      		  foldr charSetUnion emptyCharSet happy_var_3) })}})
	) (\r -> happyReturn (happyIn29 r))

happyReduce_64 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_64 = happyMonadReduce 2# 25# happyReduction_64
happyReduction_64 (happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest) tk
	 = happyThen ((case happyOutTok happy_x_1 of { happy_var_1 -> 
	case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	( do { dot <- lookupSMac (tokPosn happy_var_1, ".");
		      	        return (dot `charSetMinus` happy_var_2) })}})
	) (\r -> happyReturn (happyIn29 r))

happyReduce_65 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_65 = happySpecReduce_2  26# happyReduction_65
happyReduction_65 happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn30
		 (happy_var_1 : happy_var_2
	)}}

happyReduce_66 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_66 = happySpecReduce_0  26# happyReduction_66
happyReduction_66  =  happyIn30
		 ([]
	)

happyReduce_67 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_67 = happySpecReduce_1  27# happyReduction_67
happyReduction_67 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn31
		 ((tokPosn happy_var_1, ".")
	)}

happyReduce_68 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )
happyReduce_68 = happySpecReduce_1  27# happyReduction_68
happyReduction_68 happy_x_1
	 =  case happyOutTok happy_x_1 of { happy_var_1 -> 
	happyIn31
		 (case happy_var_1 of T p (SMacT s) -> (p, s)
	)}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	T _ EOFT -> happyDoAction 37# tk action sts stk;
	T _ (SpecialT '.') -> cont 1#;
	T _ (SpecialT ';') -> cont 2#;
	T _ (SpecialT '<') -> cont 3#;
	T _ (SpecialT '>') -> cont 4#;
	T _ (SpecialT ',') -> cont 5#;
	T _ (SpecialT '$') -> cont 6#;
	T _ (SpecialT '|') -> cont 7#;
	T _ (SpecialT '*') -> cont 8#;
	T _ (SpecialT '+') -> cont 9#;
	T _ (SpecialT '?') -> cont 10#;
	T _ (SpecialT '{') -> cont 11#;
	T _ (SpecialT '}') -> cont 12#;
	T _ (SpecialT '(') -> cont 13#;
	T _ (SpecialT ')') -> cont 14#;
	T _ (SpecialT '#') -> cont 15#;
	T _ (SpecialT '~') -> cont 16#;
	T _ (SpecialT '-') -> cont 17#;
	T _ (SpecialT '[') -> cont 18#;
	T _ (SpecialT ']') -> cont 19#;
	T _ (SpecialT '^') -> cont 20#;
	T _ (SpecialT '/') -> cont 21#;
	T _ ZeroT -> cont 22#;
	T _ (StringT happy_dollar_dollar) -> cont 23#;
	T _ (BindT happy_dollar_dollar) -> cont 24#;
	T _ (IdT happy_dollar_dollar) -> cont 25#;
	T _ (CodeT _) -> cont 26#;
	T _ (CharT happy_dollar_dollar) -> cont 27#;
	T _ (SMacT _) -> cont 28#;
	T _ (RMacT happy_dollar_dollar) -> cont 29#;
	T _ (SMacDefT happy_dollar_dollar) -> cont 30#;
	T _ (RMacDefT happy_dollar_dollar) -> cont 31#;
	T _ WrapperT -> cont 32#;
	T _ EncodingT -> cont 33#;
	T _ ActionTypeT -> cont 34#;
	T _ TokenTypeT -> cont 35#;
	T _ TypeClassT -> cont 36#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 37# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = ((>>=))
happyReturn :: () => a -> P a
happyReturn = (return)
happyParse :: () => Happy_GHC_Exts.Int# -> P (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> P (HappyAbsSyn ))

happyThen1 :: () => P a -> (a -> P b) -> P b
happyThen1 = happyThen
happyReturn1 :: () => a -> P a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> P a
happyError' tk = (\(tokens, explist) -> happyError) tk
parse = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (let {(HappyWrap4 x') = happyOut4 x} in x'))

happySeq = happyDontSeq


happyError :: P a
happyError = failP "parse error"

-- -----------------------------------------------------------------------------
-- Utils

digit c = ord c - ord '0'

repeat_rng :: Int -> Maybe (Maybe Int) -> (RExp->RExp)
repeat_rng n (Nothing) re = foldr (:%%) Eps (replicate n re)
repeat_rng n (Just Nothing) re = foldr (:%%) (Star re) (replicate n re)
repeat_rng n (Just (Just m)) re = intl :%% rst
	where
	intl = repeat_rng n Nothing re
	rst = foldr (\re re'->Ques(re :%% re')) Eps (replicate (m-n) re)

replaceCodes codes rectx = rectx{ reCtxStartCodes = codes }

lookupEncoding :: String -> P Encoding
lookupEncoding s = case map toLower s of
  "iso-8859-1" -> return Latin1
  "latin1"     -> return Latin1
  "utf-8"      -> return UTF8
  "utf8"       -> return UTF8
  _            -> failP ("encoding " ++ show s ++ " not supported")
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 10 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/home/smarlow/local/lib/ghc-8.4.3/include/ghcversion.h" #-}















{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc27342_0/ghc_2.h" #-}














































































































































































































































































































































































































































































{-# LINE 10 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}


          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}


                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+#  i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 180 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+#  nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+#  nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
