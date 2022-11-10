
/*tabela user*/
create table user (
 	id_user int auto_increment,
 	email varchar(40) not null,
 	password varchar(20) not null,
 	primary key(id_user)
);
 

select * from user;

/*inserindo os dados na tabela user*/
insert into user
(email, password)
values
("joao_batista@gmail.com","13579"),
("joao_ricardo@gmail.com","24680"),
("ana_maria@gmail.com","08642"),
("lainne_sousa@gmail.com","97531"),
("celina_cecilia_selena@gmail.com","369246");

/*tabela post*/
create table post (
	id_post int auto_increment, 
	title varchar(20), 
	description text,
	id_user int,
	primary key(id_post),
	foreign key(id_user) references user(id_user)
);

select * from roles;

/*inserindo os post */
insert into post 
(title, description, id_user)
values
/*usuario 1*/
("JavaScript ","JavaScript é uma linguagem de programação que permite a você implementar itens complexos em páginas web.", 1),
("PHP ","O PHP é usado em conjunto com outras linguagens no desenvolvimento web para interações diversas de páginas com bancos
 de dados, por exemplo.", 1),
/*usuario 2*/
("Node","O Node. js não é uma linguagem de programação nem um framework e sim um ambiente de execução.", 2),
("Minecraft ","Minecraft ficou disponível gratuitamente no Android por algumas horas e, ao que parece, a suposta promoção 
aconteceu devido a algum erro.", 2),
/*usuario 3*/
("Gatos","Os gatos escolhem seus donos por se sentirem confortáveis e por receberem boas condições de vida.", 3),
("Lula"," O Governo Lula caracterizou-se pela baixa inflação, que ficou controlada, redução do desemprego e constantes recordes
 da balança comercial.", 3),
/*usuario 4*/
("Gastronomia ","A gastronomia estuda não apenas os vários modos de preparação do alimento, mas também as bebidas indicadas para
 cada refeição e os materiais utilizados na confecção dos pratos.", 4),
("jiu-jitsu","Meu irmão pratica jiu-jitsu, eu não gosto muito mas ele ama.", 4),
/*usuario 5*/
("Os gatos vão dominar o mundo","No futuro tendem a ser mais caseiros e sociáveis. Companhia ideal para quem tem um estilo de vida
 agitado e que, mesmo assim, não abre a mão de ter um melhor amigo.", 5),
("Border Collie","Segundo Stanley Coren, o Border Collie é o cachorro mais inteligente do mundo. Isso significa que a maior parte
 dos indivíduos dessa raça podem aprender novos comandos em menos de cinco segundos e segui-los pelo menos 95% das vezes.", 5);

select * from post;

/*criando tabela roles*/
create table roles (
	id_role int auto_increment,
	primary key(id_role),
	acess varchar(16) not null
);

/*inserindo os niveis de acesso*/
insert into roles 
(acess)
values
("Admin"),
("Employee"),
("Cient");

/*criando a tabela user roles que é n:n*/
create table user_roles (
	id_user int,
	id_roles int,
	foreign key(id_user) references user(id_user),
	foreign key(id_roles) references roles(id_role)
);

select * from user_roles;

/*inserindo as foreign keys na tabela USER_ROLES*/
insert into user_roles 
(id_user, id_roles)
values
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 3),
(5, 2),
(3, 3);

delete from post
	where id_user = 2;

delete from user_roles
	where id_user = 2;
	
delete from user
	where id_user = 2;
/*atualizando o post do usuário 1*/
update post
	set title = 'escola',
	description ='A escola esta me deixando muito mal e estressado'
	where id_post = 1
	limit 1;
/*selecionando os pots dos usuários 3 e 5*/	
select 
post.id_post, 
post.title, 
post.description, 
post.id_user, 
user.id_user from post inner join user
on post.id_user = user.id_user
where user.id_user = 3;

select 
post.id_post, 
post.title, 
post.description, 
post.id_user, 
user.id_user from post inner join user
on post.id_user = user.id_user
where user.id_user = 5;
	
/*selecionando somente os que tem níveis de acesso Admin*/
select 
user.id_user,  
roles.acess from user_roles 
join user on user_roles.id_user = user.id_user 
join roles on roles.id_role = user_roles.id_roles 
where roles.acess = "Admin";






