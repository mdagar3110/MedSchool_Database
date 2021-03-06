USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[spGetImages]    Script Date: 08/22/2017 16:02:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec spGetImages
ALTER Proc [dbo].[spGetImages]
as begin 
Declare @BlockNo int
Declare @replica nvarchar(50)
Declare @ImageName nvarchar(200)

select top 1 @BlockNo=BlockNo, @replica=IsMirrorImage, @ImageName=ImageName from Imagecollection order by newid()

select * from Imagecollection where blockno=@BlockNo and IsMirrorImage=@replica and ImageName=@ImageName

select * from (
select * from(select top 2 *,NewID = NEWID() from Imagecollection where blockNO=@BlockNo and IsMirrorImage=@replica and ImageName<> @ImageName
order by newid()) T1
union 
select * from(select top 1 *,NewID = NEWID() from Imagecollection where blockNo<> @BlockNo order by newid()) T2
union 
select * from(select top 1 *,NewID = NEWID() from Imagecollection where blockNo<> @BlockNo order by newid()) T3
) Main order by newid()

end
