create or replace trigger TriggerOnAchatBefore

Before INSERT or UPDATE of quantite on Achat
   FOR EACH ROW
   
  declare 
    nb stocklivre.nb_exemplaires%type;
    Begin
    
    select nb_exemplaires into nb from stocklivre where idlivre=:new.idlivre and idlib=:new.idlib;
    
    
     if(inserting and nb<:new.quantite) then RAISE_APPLICATION_ERROR(-20101,' le nombre d exemplaires est insuffissant  '); 
     
     elsif (updating and (nb+ :old.quantite)<:new.quantite) then      RAISE_APPLICATION_ERROR(-20101,' le nombre d exemplaires est insuffissant  '); 

     
     end if;
    
    End;
    /
    
    