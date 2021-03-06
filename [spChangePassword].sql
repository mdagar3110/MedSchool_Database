USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spChangePassword]    Script Date: 08/22/2017 16:01:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
ALTER Proc [dbo].[spChangePassword]  
@GUID uniqueidentifier,  
@Password nvarchar(100)  
as  
Begin  
 Declare @UserId int  
   
 Select @UserId = UserId   
 from tblResetPasswordRequests  
 where Id= @GUID  
   
 if(@UserId is null)  
 Begin  
  -- If UserId does not exist  
  Select 0 as IsPasswordChanged  
 End  
 Else  
 Begin  
  -- If UserId exists, Update with new password  
  Update tblUsers set  
  [Password] = @Password,
  RetryAttempts=0,
   IsLocked=0,
   LockedDateTime=null
  where Id = @UserId  
    
  -- Delete the password reset request row   
  Delete from tblResetPasswordRequests  
  where Id = @GUID  
    
  Select 1 as IsPasswordChanged  
 End  
End