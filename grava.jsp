<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações 
    //digitadas pelo usuário

    String vnome = request.getParameter("nome");
    String vemail= request.getParameter("email");;
    String vcpf = request.getParameter("cpf");
    int    vidade= Integer.parseInt( request.getParameter("idade"));
    String vtelefone = request.getParameter("telefone");
    String vprof= request.getParameter("profissao");
    String vcep= request.getParameter("cep");;

    //variaveis para o banco de dados
    String banco    = "psorrisoverde" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql como o comando INSERT
    String sql = "INSERT INTO voluntarios (nome, cpf, telefone, profissao, cep, idade, email) values (?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString( 1 , vnome) ;
    stm.setString( 2 , vcpf ) ;
    stm.setString( 3 , vtelefone ) ;
    stm.setString( 4 , vprof) ;
    stm.setString( 5 , vcep ) ;
    stm.setInt( 6 , vidade ) ;
    stm.setString( 7 , vemail ) ;


    stm.execute() ;
    stm.close() ;
    response.sendRedirect("bemvindo.html");
%>
