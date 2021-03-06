USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spAuthenticateUser]    Script Date: 08/22/2017 15:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[spAuthenticateUser]
@UserName nvarchar(100),
@Password nvarchar(200)
as
Begin
 Declare @AccountLocked bit
 Declare @Count int
 Declare @RetryCount int
 
 Select @AccountLocked = IsLocked
 from tblUsers where UserName = @UserName
  
 --If the account is already locked
 if(@AccountLocked = 1)
 Begin
  Select 1 as AccountLocked, 0 as Authenticated, 0 as RetryAttempts
 End
 Else
 Begin
  -- Check if the username and password match
  Select @Count = COUNT(UserName) from tblUsers
  where [UserName] = @UserName and [Password] = @Password
  
  -- If match found
  if(@Count = 1)
  Begin
   -- Reset RetryAttempts 
   Update tblUsers set RetryAttempts = 0
   where UserName = @UserName
       
   Select 0 as AccountLocked, 1 as Authenticated, 0 as RetryAttempts
  End
  Else
  Begin
   -- If a match is not found
   Select @RetryCount = IsNULL(RetryAttempts, 0)
   from tblUsers
   where UserName = @UserName
   
   Set @RetryCount = @RetryCount + 1
   
   if(@RetryCount <= 3)
   Begin
    -- If re-try attempts are not completed
    Update tblUsers set RetryAttempts = @RetryCount
    where UserName = @UserName 
    
    Select 0 as AccountLocked, 0 as Authenticated, @RetryCount as RetryAttempts
   End
   Else
   Begin
    -- If re-try attempts are completed
    Update tblUsers set RetryAttempts = @RetryCount,
    IsLocked = 1, LockedDateTime = GETDATE()
    where UserName = @UserName

    Select 1 as AccountLocked, 0 as Authenticated, 0 as RetryAttempts
   End
  End
 End
End