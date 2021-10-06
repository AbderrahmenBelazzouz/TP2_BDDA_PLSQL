create or replace 
procedure augmentation(n1 in number, n2 in number)

is 

 cursor p_1 is select * from produit for update;
 
  
 begin
 
  for ligne in p_1   loop
        
      case
      
      when (ligne.prixunitaire< n1 and ligne.prixunitaire>0)  then
            update produit set prixunitaire=prixunitaire*1.1 where current of p_1 ;
      
      when (ligne.prixunitaire< n2 and ligne.prixunitaire>=n1)  then
            update produit set prixunitaire=prixunitaire*1.2 where current of p_1 ;
            
            when ( ligne.prixunitaire>=n2)  then
            update produit set prixunitaire=prixunitaire*1.4 where current of p_1 ;
            
      else             update produit set prixunitaire=prixunitaire where current of p_1 ;
 
      end case;
      
      end loop;
 
 -- Validation de la transaction
       COMMIT;
  
 end;

---Pl/sql----
 BEGIN
augmentation(1100, 1400);
END;


---SQLplus=-->  EXECUTE augmentation(1100, 1400)-----