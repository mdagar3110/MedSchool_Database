USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 08/22/2017 16:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
ALTER proc [dbo].[spRegisterUser]    
@UserName nvarchar(100),    
@Password nvarchar (100),    
@Email nvarchar (200)    
as    
Begin    
 Declare @Count int    
 Declare @ReturnCode int    
     
 Select @Count = COUNT(UserName)     
 from tblUsers where UserName = @UserName or Email=@Email
 If @Count > 0    
 Begin    
  Set @ReturnCode = -1    
 End    
 Else    
 Begin    
  Set @ReturnCode = 1    
  --Change: Column list specified while inserting  
  Insert into tblUsers([UserName], [Password], [Email])   
  values  (@UserName, @Password, @Email)    
 End    
 Select @ReturnCode as ReturnValue    
End


--select * from tblUsers where UserName = 'dp' or email='manish.dagar3110@gmail.com'  