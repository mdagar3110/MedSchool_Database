USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spManageUsers]    Script Date: 08/22/2017 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
ALTER PROCEDURE [dbo].[spManageUsers]   
@UserName varchar(100)=null,  
@IsAdmin bit=0,  
@IsSuperadmin bit=0,  
@status varchar(50)   
AS   
BEGIN   
SET NOCOUNT ON;   
  
--- Select Records in Table   
IF @status='SELECT'   
BEGIN   
select UserName,Email, IsAdmin,IsSuperAdmin from tblusers where  IsAdmin=1 or IsSuperAdmin=1  
END   
--- Update Records in Table    
IF @status='UPDATE'   
BEGIN   
UPDATE tblusers SET IsAdmin=@IsAdmin,ISSuperAdmin=@IsSuperadmin WHERE UserName=@UserName   
END   
  
SET NOCOUNT OFF   
END