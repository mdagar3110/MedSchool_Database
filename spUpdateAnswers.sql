
-- exec spUpdateAnswers 'dpk',1
alter proc spUpdateAnswers
@UserName nvarchar(100),
@count int
as
begin
          Declare @CurrentAnswers int
          Declare @TotalAnswers int

        select @CurrentAnswers=count(NoOfAnswers) from tblAnswers where UserName=@UserName 
print @CurrentAnswers 
print 'above is current value'
  if @CurrentAnswers > 0
  Begin
          print 'Update'
       update tblAnswers set NoOfAnswers=NoOfAnswers +1 where UserName=@UserName
  End
  else
  begin
	set @TotalAnswers = 1
   print 'insert new value'
      Insert into tblAnswers([UserName], [NoOfAnswers], [IsAnswerReset])   
      values  (@UserName, @TotalAnswers, 0) 
	End
	end 

-- select * from tblAnswers