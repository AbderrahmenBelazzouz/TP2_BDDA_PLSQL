create or replace trigger TriggerOnAchatAfter

After INSERT or UPDATE of quantite on Achat
   FOR EACH ROW
   
    Begin
     if(inserting)  then 
     update stocklivre set nb_exemplaires=nb_exemplaires-:new.quantite where idlivre=:new.idlivre and idlib=:new.idlib;
     
     else
         update stocklivre 
         set nb_exemplaires=nb_exemplaires+:old.quantite -:new.quantite where idlivre=:old.idlivre and idlib=:old.idlib;
        --  update stocklivre set nb_exemplaires=nb_exemplaires-:new.quantite where idlivre=:new.idlivre and idlib=:new.idlib;
     end if;
    
    End;
    
    
    
   