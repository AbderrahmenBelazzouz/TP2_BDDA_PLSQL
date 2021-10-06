 declare 
 
 cursor p_1 is select * from produit;
 
 nb int;
 dollar  constant real :=175;
 prixDollar produit.prixunitaire%type;
 aucun_produit Exception;
 
 begin
 --vider la table produit etranger --
 delete from produit_etranger;
 -- Compte des produits
SELECT COUNT(*) INTO nb FROM PRODUIT ;

   IF nb=0 THEN RAISE aucun_produit; END IF;
 
 
   for ligne in p_1   loop
      
       prixDollar:=NVL(ligne.prixunitaire,0);
      
      IF prixDollar<>0 THEN     prixDollar:=ceil(prixDollar/dollar)+1;   end if;
   
            insert into Produit_Etranger values (ligne.IDP, UPPER(ligne.designation), prixDollar, ligne.IDCategorie);
   end loop;
 
 -- Validation de la transaction
       COMMIT;
  
  EXCEPTION
    WHEN aucun_produit THEN 
              INSERT INTO Produit_Etranger VALUES(0,'Pas de produit',NULL,NULL);
 end;