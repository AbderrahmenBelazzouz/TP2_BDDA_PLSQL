create or replace trigger TriggerOnEditeur

Before INSERT on EDITEUR
-- table mutante for update
   FOR EACH ROW
   
   Declare
      n number;
    Begin
    select count(*) into n  from editeur where upper(nom)=upper(:new.nom);    
    
     if(n <>0) then RAISE_APPLICATION_ERROR(-20101,'le nom' || :new.nom
          || ' est déjà utilisé par un autre editeur'); 
    
     end if;
    
    End;
    /
    
    
   