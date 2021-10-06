create or replace trigger TriggerOnStock

Before INSERT or delete or UPDATE of prix, nb_exemplaires on StockLivre  
   FOR EACH ROW
   
  
    Begin
    
     if(inserting and (:new.prix <=0 or :new.nb_Exemplaires <=0)) then RAISE_APPLICATION_ERROR(-20101,' choisir des valeurs supérieures à 0 '); 
    
     end if;
     
     if((abs(:new.prix -:old.prix)/:old.prix)>0.6) then  RAISE_APPLICATION_ERROR(-20102,'le nouveau prix n est pas accepté');
     
       end if;
       
      if(updating or deleting) then insert into stockhistory values (:old.idlib, :old.idlivre,:old.prix, :old.nb_Exemplaires,sysdate);
        end if;
    
    End;
    /