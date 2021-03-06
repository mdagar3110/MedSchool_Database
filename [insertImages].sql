USE [Med_Research]
GO
/****** Object:  StoredProcedure [dbo].[insertImages]    Script Date: 08/22/2017 15:57:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[insertImages] 
@BlockNo int,
@Rotation varchar(10),
@Degree int,
@IsMirrorImage varchar(10),
@ImageName varchar(50),
@CreatedDate varchar(50),
@IsDeleted bit
as begin 
Insert into ImageCollection values (@BlockNo, @Rotation, @Degree, @IsMirrorImage, @ImageName, @CreatedDate, @IsDeleted)
end


