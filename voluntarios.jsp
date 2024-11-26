<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> VOLUNTARIOS </title>
    <link rel="stylesheet" href="voluntarios.css">
    <link rel="shortcut icon" type="imagex/png" href="short icon.png">
</head>
<body>

    <div id="container">
            <!-- PARTE DO CABEÇALHO E MENU -->
        <div id="cabecalho">
            <h1>Projeto Sorriso Verde</h1>
            <nav id="menu">
                <Ul>
                    <li><A href="home.html"> HOME </A></li>
                    <li><a href="formulario.html"> SEJA VOLUNTARIO </a></li>
                    <li><a href="voluntarios.jsp"> NOSSOS VOLUNTARIOS </a></li>
                </Ul>
            </nav>
        </div>
            <!--.............................-->

            <!-- PARTE DOS CONTEUDOS DA PAGINA  -->
        <div id="conteudo">
    <%
    //variaveis para o banco de dados
    String banco    = "psorrisoverde" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver";

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "select * from voluntarios order by nome";
    PreparedStatement stm = conexao.prepareStatement(sql);
    ResultSet dados = stm.executeQuery();
    out.print("<h1>Nossos Voluntarios</h1>");
    out.print("<table>");
        out.print("<tr>");
            out.print("<th>Nome</th>");
            out.print("<th>CPF</th>");
            out.print("<th>Telefone</th>");
            out.print("<th>Profissao</th>");
            out.print("<th>CEP</th>");
            out.print("<th>Idade</th>");
            out.print("<th>Email</th>");
       out.print("</tr>");
        while( dados.next() )  
        {
            out.print("<tr>") ;
                out.print("<td>") ;
                    out.print( dados.getString("nome") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("cpf") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("telefone") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("profissao") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("cep") ) ;
                out.print("</td>") ; 

                out.print("<td>") ;
                    out.print( dados.getString("idade") ) ;
                out.print("</td>") ;

                out.print("<td>") ;
                    out.print( dados.getString("email") ) ;
                out.print("</td>") ;
             out.print("</tr>") ;

        }

        out.print("</table>") ;

    %>

        </div>
            <!--.............................-->
            <!-- PARTE DO RODAPÉ DA PAG -->

        <div id="rodape">
            <div class="rod1">
                <p> <strong>Projeto Tecnologia Web - Eniac 2024</strong> </p>
                <p> <strong> Desenvolvido por: <br>
                             Bruno Bliudzius; </strong> <br>
                    <strong> Leonardo Geraldes;</strong><br>
                    <strong> Alexsander Camargo.</strong>
                </p>
            </div>
            <div class="rod2">
                <p> <strong> Endereço: <br>
                    Avenida Jose Miguel Ackel, Nº 9999; </strong> <br>
                    <strong> Quadrab Casa 137 no bairro Jardim Guilhermino em Guarulhos;</strong><br>
                    <strong> CEP 07273-000.</strong>
                </p>
                <p> <strong> Siga nossa pagina @projetosorrisoverde </strong> </p>
            </div>
        </div>
</body>
</html>