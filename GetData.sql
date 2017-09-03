

select * from Imagecollection

SELECT TOP 1 * FROM Imagecollection a,Imagecollection b  ORDER BY NEWID()


select * from (
select * from(select top 2 *,NewID = NEWID() from Imagecollection where blockNO=9 and IsMirrorImage='a' 
order by newid()) T1
union 
select * from(select top 1 *,NewID = NEWID() from Imagecollection where blockNo<> 9 order by newid()) T2
union 
select * from(select top 1 *,NewID = NEWID() from Imagecollection where blockNo<> 9 order by newid()) T3
) Main order by newid()


select * FROM dbo.tblUsers

update tblusers set isadmin=0 , issuperadmin=0 where id=3


