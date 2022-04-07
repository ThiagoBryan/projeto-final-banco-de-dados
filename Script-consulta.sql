/* 5.a*/
select nome_produto, nome_categoria, nome_funcionario
from produto p
inner join categoria c on p.codigo_categoria = c.codigo_categoria 
inner join funcionario f on f.codigo_funcionario = p.codigo_funcionario
order by nome_funcionario


/* 5.b*/
select codigo_pedido, nome, sobrenome, ddd_principal, telefone_principal, ddd_secundario, telefone_secundario
from pedido p
inner join cliente c
on p.codigo_cliente = c.codigo_cliente
inner join telefone_cliente tc 
on tc.codigo_telefone = c.codigo_telefone;

/*5.c*/

select pedido.codigo_pedido, nome, sobrenome, data_pedido, nome_produto, quantidade_comprada from item_compra
inner join produto
on(item_compra.codigo_produto = produto.codigo_produto)
inner join pedido 
on(item_compra.codigo_pedido = pedido.codigo_pedido)
inner join cliente
on(pedido.codigo_cliente = cliente.codigo_cliente);
--where pedido.codigo_pedido = 1,2,3...

/*bonus*/
select count(codigo_pedido) as quantidade_pedido, nome, sobrenome from pedido
	inner join cliente 
	on(pedido.codigo_cliente = cliente.codigo_cliente)
group by nome, sobrenome
order by nome, sobrenome asc;

/*5.d*/

select codigo_pedido, nome, sobrenome from pedido 
inner join cliente 
on(cliente.codigo_cliente = pedido.codigo_cliente)
order by nome 

/*5.e*/

select nome, sobrenome, rua, bairro, ddd_principal, telefone_principal from cliente 
inner join endereco_cliente ec 
on(ec.codigo_endereco = cliente.codigo_cliente)
inner join telefone_cliente tc 
on(tc.codigo_telefone = cliente.codigo_telefone)


/*5.f*/
select nome_produto, nome_funcionario from produto
full join funcionario 
on(produto.codigo_funcionario = funcionario.codigo_funcionario)



/*5.a*/
update funcionario set salario= (salario + 500);

--extra
select nome_funcionario, salario from funcionario where salario between 3000 and 4500;
select nome_funcionario, salario from funcionario where salario not between 3000 and 4500;
/*bonus*/
select nome_funcionario, salario 
from funcionario 
order by salario desc
limit 3
offset 1;

/*bonus*/
select nome_funcionario, salario as salario_atual, salario * 1.2 as salario_aumento from funcionario;
select salario, nome_funcionario from funcionario;

/*5.b*/

update cliente set email_cliente = 'jose_novoemail@gmail.com' where codigo_cliente = 1;

update telefone_cliente set telefone_principal = '990475364' where codigo_telefone = 1;

/*6*/

alter table pedido drop constraint "FK_pedido.codigo_cliente";
delete from cliente where nome like '%e%' or length(senha)<4;

