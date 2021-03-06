USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spCheckAdmin]    Script Date: 08/22/2017 16:01:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- spCheckAdmin 'dpk'
ALTER Proc [dbo].[spCheckAdmin]
@UserName nvarchar(100)
as begin
Declare @Count int
-- This procedure returns 2 if the user is a superadmin and returns 2 if it is only an admin
Select @Count = COUNT(UserName) from tblUsers
  where [UserName] = @UserName and issuperadmin=1 and isadmin=1
  
  if(@Count = 1)
   begin 
select 2 as Superadmin
  end
  else
  begin
  select 1 as Admin
  end
  
  end
  