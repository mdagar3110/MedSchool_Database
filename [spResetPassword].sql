USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spResetPassword]    Script Date: 08/22/2017 16:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec spResetPassword 'dpk'
create proc [dbo].[spResetPassword]
@UserName nvarchar(100)
as
Begin
 Declare @UName int
 Declare @Email nvarchar(100)
 
 Select @UName = UserName, @Email = Email 
 from tblUsers
 where UserName = @UserName
 
 if(@UName IS NOT NULL)
 Begin
  --If username exists
  Declare @GUID UniqueIdentifier
  Set @GUID = NEWID()
  
  Insert into dbo.tblResetPasswordRequests
  (UserName, ResetRequestDateTime, UniqueId)
  Values(@UName, GETDATE(),@GUID)
  
  Select 1 as ReturnCode, @GUID as UniqueId, @Email as Email
 End
 Else
 Begin
  --If username does not exist
  SELECT 0 as ReturnCode, NULL as UniqueId, NULL as Email
 End
End