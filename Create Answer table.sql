
    
    create table Answers_Table
    (
    AnswerId int Identity(1,1) not null Primary Key,
    UserName nvarchar(100) not null,
    NoOfAnswers int,
    IsAnswerReset bit,
    constraint FK_AnswerTable foreign key (UserName)
    references tblUsers(UserName)
	)
    
    drop table tblResetPasswordRequests
    create table tblResetPasswordRequests
    (
    Id int identity(1,1) not null primary key,
    UserName nvarchar(100) not null,
    ResetRequestDateTime datetime,
    constraint fk_resetpassword foreign key (UserName) references tblUsers(UserName)
    )
    
   

    
    