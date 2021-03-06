USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spIsPasswordResetLinkValid]    Script Date: 08/22/2017 16:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER Proc [dbo].[spIsPasswordResetLinkValid] 
@GUID uniqueidentifier
as
Begin
 Declare @UserId int
 
 If(Exists(Select UserId from tblResetPasswordRequests where Id = @GUID))
 Begin
  Select 1 as IsValidPasswordResetLink
 End
 Else
 Begin
  Select 0 as IsValidPasswordResetLink
 End
End