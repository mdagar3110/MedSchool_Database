USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spAddAdmin]    Script Date: 08/22/2017 15:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER proc [dbo].[spAddAdmin]  
@Email nvarchar(100)
as  
Begin  

 Declare @Count int  
 
  Select @Count = COUNT(UserName) from tblUsers  
  where Email = @Email
  
    if(@Count >= 1)  
  Begin 
  update tblUsers set IsAdmin=1 where Email=@Email
  
  select 1 as Admin
  end
  else
  begin
  select 0 as Admin
  end 
 
 end
 