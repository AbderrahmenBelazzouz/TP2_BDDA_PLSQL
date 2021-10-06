 create or replace trigger TriggerOnLivre

after INSERT or UPDATE or DELETE on Livre

   FOR EACH ROW
    
    begin
    if(inserting) then insert into HISTORY values (user, :new.idlivre, SYSDATE, 'insert');
    elsif(updating) then  insert into HISTORY values (user, :new.idlivre, SYSDATE, 'update');
    else
                 insert into HISTORY values (user, :old.idlivre, SYSDATE, 'delete');
    end if;
    
    
    
    end;