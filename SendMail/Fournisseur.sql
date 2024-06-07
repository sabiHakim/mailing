create database fournisseur;
\c fournisseur;
create table fourniseur(
    id serial primary key,
    nom text,
    mail text,
    mdp text
);
insert into fourniseur(nom,mail,mdp) values('SHOPRITE','srakotoalimanana@gmail.com','shoprite');
insert into fourniseur(nom,mail,mdp) values('JUMBO SCORE','steven@gmail.com','jumbo');
insert into fourniseur(nom,mail,mdp) values('LEADER PRICE','bry@gmail.com','leader');
select * from fourniseur where nom = 'SHOPRITE' and mdp = 'shoprite';
create table produit(
    id serial primary key,
    nom text,
    quantite int,
    prixUnitaire double precision,
    idF int,
    foreign key(idF) references fourniseur(id)
);
insert into produit(nom,quantite,prixUnitaire,idF) values('gel',100,3000,1);
insert into produit(nom,quantite,prixUnitaire,idF) values('mouchoir',50,600,1);
insert into produit(nom,quantite,prixUnitaire,idF) values('chaise',500,5000,1);
-- f2
insert into produit(nom,quantite,prixUnitaire,idF) values('gel',50,2000,2);
insert into produit(nom,quantite,prixUnitaire,idF) values('mouchoir',150,600,2);
insert into produit(nom,quantite,prixUnitaire,idF) values('chaise',200,6000,2);

select * from produit;

-- view 
CREATE or replace VIEW getProduit AS
SELECT f.id AS id_fournisseur, f.nom AS nom_fournisseur, f.mail AS mail_fournisseur, f.mdp as mdp_fournisseur,
       p.id AS id_produit, p.nom AS nom_produit, p.quantite, p.prixunitaire
FROM fourniseur f
JOIN produit p ON f.id = p.idf;
 select * from  getProduit;