drop database cpam;
create database cpam;
use cpam;
create table patient(
	NossPat int(11) primary key not null auto_increment,
    nom varchar(50),
    prenom varchar(50),
    adresse varchar(50)
    
);

create table medecin
 (
	 NossMed int (11) primary key auto_increment not null ,
	 NomMed varchar (255),
     PrenomMed varchar (255),
     adresseMed varchar (255)
 );
 
 
create table consultation (
	NoCons int (11) primary key auto_increment not null,
    date_conso date,
    symptome varchar(255),
    NossPat int(11),
    NossMed int (11),
    constraint FK foreign key (NossPat) references patient (NossPat),
    constraint FK1 foreign key (NossMed) references medecin (NossMed)
);

create table medicament
 (
	 Id_medicament int (11) primary key auto_increment not null,
	 NomMedicament varchar (255),
	 NossMed int (11),
	 NomSubst varchar (255),
     prix float 
 );

 create table prescription (
	Id_prescription int (11) primary key auto_increment not null,
	NoCons int(11),
    NossMed int (11),
	NossPat int(11),
    Id_medicament int (11),
    constraint FK2 foreign key (NoCons) references consultation (NoCons),
    constraint FK3 foreign key (NossMed) references medecin (NossMed),
	constraint FK4 foreign key (NossPat) references patient (NossPat),
    constraint FK5 foreign key (Id_medicament) references medicament (Id_medicament)
 );
 
 
 
 ============================================================
 
 a/ select nom, symptome,NomMedicament from patient as P
 inner join consultation as C on P.NossPat = C.NossPat
 inner join medicament as M on M.NossMed = C.NossMed
 where symptome == 'toux seche';
 
 
 b/ select nom, symptome,NomSubst from patient as P
 inner join consultation as C on P.NossPat = C.NossPat
 inner join medicament as M on M.NossMed = C.NossMed
 where symptome = 'toux seche' And count(NossMed) > 1 And date_conso ==date_conso;
 
 c/select nom, symptome,NomSubst from patient as P
 inner join consultation as C on P.NossPat = C.NossPat
 inner join medicament as M on M.NossMed = C.NossMed
 where symptome = 'toux seche' And NomSubst != 'NOSCAPINE';
 
 d/ select min (prix),  NomMedicament from medicament where  NomSubst =='NOSCAPINE';
	
 
 e/ select min (prix), max (prix),NomMedicament from medicament as M1
 inner join medicament as M2 where M1.NomSubst == M2.NomSubst;
 
 
 =========================================================================
 Excercice 2 
 
 
 
 
 drop database enquete;
create database enquete;
use enquete;

create table categorie
 (
	numCat int (11) primary key auto_increment not null,
    intitule varchar (255)

 );

 create table personne
 (
	numPers int (11) primary key auto_increment not null,
    age int (11),
    sexe enum ('Homme', 'Femme'),
    numCat int(11),
    constraint FK foreign key (numCat) references categorie (numCat)
    
 );
 
 
 create table question
 (
	numQues int (11) primary key auto_increment not null,
    description varchar (255)
 
 );
 
 create table avis
 (
	numAvis int (11) primary key auto_increment not null,
    numQues int (11),
    numPers int (11),
    reponse varchar (255),
     constraint FK1 foreign key (numQues) references question (numQues),
     constraint FK2 foreign key (numPers) references personne (numPers)
    
 );
 
 
 
 =====================
 
 une personne peut avoir plusieurs avis sur une meme question
 
 1/select numPers from personne as P 
 inner join categorie as C  on P.numCat = C.numCat
 where sexe == 'Femme' And numCat == 'cadre';
 
 2/select numPers from personne as P 
 inner join avis as A on P.numPers = A.numPers
 where age > 25 And count(numAvis) == 0;
 
 3/select numQues from avis where numAvis >30;
 
 4/select distinct count (numPers) from avis where numQues = 'referendum europeen' 
 and reponse == 'oui';
 
 5/select age from personne as P inner join avis as A on P.numPers = A.numPers
 where age > 40 and numQues = 'baisse des impots'  and reponse == 'oui';
 
 ============================================================
 Excercice 3
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 