/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     30/09/2021 16:08:51                          */
/*==============================================================*/


/*==============================================================*/
/* Table: Endereco                                              */
/*==============================================================*/
create table Endereco
(
   UsuarioEmail         char,
   CNPJ                 char,
   IdPontoDeColeta      char,
   TipoLog              char,
   NomeLog              char,
   Numero               char,
   Complemento          char,
   Bairro               char,
   Cidade               char,
   Estado               char,
   Pais                 char
);

/*==============================================================*/
/* Table: Login                                                 */
/*==============================================================*/
create table Login
(
   Login                char not null,
   CNPJ                 char,
   IdPontoDeColeta      char,
   UsuarioEmail         char,
   Senha                char not null
);

alter table Login
   add primary key (Login);

/*==============================================================*/
/* Table: MaterialDescarte                                      */
/*==============================================================*/
create table MaterialDescarte
(
   TipoMaterial         char not null,
   IdTransportador      char,
   CNPJ                 char,
   IdPontoDeColeta      char,
   Material             char
);

alter table MaterialDescarte
   add primary key (TipoMaterial);

/*==============================================================*/
/* Table: PontoDeColeta                                         */
/*==============================================================*/
create table PontoDeColeta
(
   CNPJ                 char not null,
   Telefone             numeric,
   RazaoSocial          char,
   NomeFantasia         char,
   DescartesAptos       char,
   Ocorrencias          char,
   IdPontoDeColeta      char not null
);

alter table PontoDeColeta
   add primary key (CNPJ, IdPontoDeColeta);

/*==============================================================*/
/* Table: TransportadorParceiro                                 */
/*==============================================================*/
create table TransportadorParceiro
(
   IdTransportador      char not null,
   CNPJ                 char,
   IdPontoDeColeta      char,
   PlacaVeiculo         char
);

alter table TransportadorParceiro
   add primary key (IdTransportador);

/*==============================================================*/
/* Table: Usuario                                               */
/*==============================================================*/
create table Usuario
(
   UsuarioEmail         char not null,
   CPF                  numeric not null,
   UsuarioNome          char
);

alter table Usuario
   add primary key (UsuarioEmail);

alter table Endereco add constraint FK_Reference_4 foreign key (UsuarioEmail)
      references Usuario (UsuarioEmail) on delete restrict on update restrict;

alter table Endereco add constraint FK_Reference_5 foreign key (CNPJ, IdPontoDeColeta)
      references PontoDeColeta (CNPJ, IdPontoDeColeta) on delete restrict on update restrict;

alter table Login add constraint FK_Reference_1 foreign key (CNPJ, IdPontoDeColeta)
      references PontoDeColeta (CNPJ, IdPontoDeColeta) on delete restrict on update restrict;

alter table Login add constraint FK_Reference_2 foreign key (UsuarioEmail)
      references Usuario (UsuarioEmail) on delete restrict on update restrict;

alter table MaterialDescarte add constraint FK_Reference_6 foreign key (IdTransportador)
      references TransportadorParceiro (IdTransportador) on delete restrict on update restrict;

alter table MaterialDescarte add constraint FK_Reference_7 foreign key (CNPJ, IdPontoDeColeta)
      references PontoDeColeta (CNPJ, IdPontoDeColeta) on delete restrict on update restrict;

alter table TransportadorParceiro add constraint FK_Reference_3 foreign key (CNPJ, IdPontoDeColeta)
      references PontoDeColeta (CNPJ, IdPontoDeColeta) on delete restrict on update restrict;

