import java.sql.*;
import static javax.swing.JOptionPane.showMessageDialog;

public final class Server extends javax.swing.JFrame{
    String customer;
    String user;
    String pass;
    
    public int a = 0;
 
    public Server(){
        getShows();        
        getShows2();       
        getBookings();
        
        
        
    }
    
    public Server(String username, String password) throws SQLException{
        user = username;
        pass = password;
        Login(username, password);
        Login2( username, password);
        Login3( username, password);
    }
    
    public Server(String username, String tickets, String date, String show, String status){
        String Username = username;
        String Tickets = tickets;
        String Date = date;
        String Show = show;
        String Status = status;
        buyTicket(Username, Tickets, Date, Show, Status);
    }
    
    public Server(String getTitle, String getFirstName, String getLastName, 
                      String getUserName, String getPassword, String getAddress, String getTown,
                      String getPostcode, String getEmail, String getMobileNo, String getType, 
                      String getPaymentMethod, String getAccountNo, 
                      String getCorporate){
        
        Register( getTitle,  getFirstName,  getLastName, 
                       getUserName,  getPassword,  getAddress,  getTown,
                       getPostcode,  getEmail,  getMobileNo,  getType, 
                       getPaymentMethod,  getAccountNo, 
                       getCorporate);
    
    }
    
    public Server(String username){
        user = username;
        getUserAndPayment(user);
    }
    
    public void Login(String getUsername, String getPassword){
        try{
            String url = "jdbc:mysql://localhost:3306/music";
            String dbUser = "root";
            String dbPass = "" ; 
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass)) {
                String query = "select UserName,Password from customer where UserName='"+ getUsername +"'and Password='"+
                        getPassword +"'";
                
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                int authStatus = 0;
                while(rs.next()){
                    authStatus = authStatus+1;
                }
                if (authStatus==1){
                    LoginPage.getUsername(getUsername);
                    
                    LoginPage.set(2);
                    CustomerPage CP = new CustomerPage();
                    CP.setVisible(true);
                }
            }
            }catch(SQLException e){
                System.out.println(e);
            }    
    }
    
    
    public void Login2(String getAdmin, String getPassword) throws SQLException{
        try{
            String url = "jdbc:mysql://localhost:3306/music";
            String dbUser = "root";
            String dbPass = "" ; 
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass)) {
                String query = "select Username,Password from admin where Username='"+ getAdmin +"'and Password='"+
                        getPassword +"'"; 
                
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                
                int authStatus = 0;
                while(rs.next()){
                    authStatus = authStatus+1;
                }
                if (authStatus==1){
                    AdminPage.getAdmin(getAdmin);
                    LoginPage.set(2);                                                                             
                    AdminPage AD = new AdminPage();                   
                    AD.setVisible(true);
                                                                       
                }
                               
                 }
           
        }
      
        catch(SQLException e){
                System.out.println(e);
            }
        
    }
     
    public void Login3(String getOrganizer, String getPassword) throws SQLException{
        try{
            String url = "jdbc:mysql://localhost:3306/music";
            String dbUser = "root";
            String dbPass = "" ; 
            try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass)) {
                String query = "select Username,Password from organizer where Username='"+ getOrganizer +"'and Password='"+
                        getPassword +"'"; 
                
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                
                int authStatus = 0;
                while(rs.next()){
                    authStatus = authStatus+1;
                }
                if (authStatus==1){
                    OrganizerPage.getOrganizer(getOrganizer);
                    LoginPage.set(2);                                                                             
                    OrganizerPage OG = new OrganizerPage();                   
                    OG.setVisible(true);
                                                                       
                }
                               
                 }
           
        }
    
              catch(SQLException e){
                System.out.println(e);
            }
    
    
    
    
    
    
    
    
    
    
    
    
    }
    
    public void Register(String getTitle, String getFirstName, String getLastName,String getAddress, 
                      String getTown, String getPostcode, String getType, String getEmail,
                      String getMobileNo, String getUserName, String getPassword,String getPaymentMethod,
                      String getAccountNo, String getCorporate){
            try{
              String url = "jdbc:mysql://localhost:3306/music";
              String dbUser = "root";
              String dbPass = "";
              try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
                    String query = " insert into customer (Title, FirstName, LastName,Address,Town, Postcode, Type, Email, MobileNo, UserName, Password, PaymentMethod, AccountNo,OrganisationName)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
                    // create the mysql insert preparedstatement
                    PreparedStatement preparedStmt = conn.prepareStatement(query);
                    preparedStmt.setString (1, getTitle );
                    preparedStmt.setString (2, getFirstName );
                    preparedStmt.setString (3, getLastName );
                    preparedStmt.setString (4, getAddress );
                    preparedStmt.setString (5, getTown );
                    preparedStmt.setString (6, getPostcode );
                    preparedStmt.setString (7, getType );
                    preparedStmt.setString (8, getEmail );
                    preparedStmt.setString (9, getMobileNo );
                    preparedStmt.setString (10, getUserName );
                    preparedStmt.setString (11, getPassword );
                    preparedStmt.setString (12, getPaymentMethod );
                    preparedStmt.setString (13, getAccountNo );
                    preparedStmt.setString (14, getCorporate );
                    
                    preparedStmt.execute();
                    showMessageDialog(null,  "User successfully created.");
                }
            }catch(SQLException e){
                System.out.println(e);
            }
    } 

        public void getUserAndPayment(String username){
    try{
        String url = "jdbc:mysql://localhost:3306/music";
        String dbUser = "root";
        String dbPass = "";
        
        try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
              String query = "select UserName,PaymentMethod from customer where UserName='"+ username +"'and PaymentMethod=PaymentMethod";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
       
        // iterate through the java resultset
        while (rs.next()){
            username = rs.getString("UserName");
            String payment = rs.getString("PaymentMethod");
            CustomerPage.setPayment(payment);
            
        }}
    }catch(SQLException e){
        System.out.println(e);
    }
    
}

        public void buyTicket(String username, String tickets, String date, String show, String status){
    try{
        String url = "jdbc:mysql://localhost:3306/music";
        String dbUser = "root";
        String dbPass = "";
        try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
              String query = " insert into bookings (Username, NumberOfTickets, BookingDate, ConcertDesc , Status)"
                      + " values (?, ?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            System.out.println("user: " + username + " tickets: " + tickets + " date: "+ date +" show: " + show + " status: " + status);
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString (1, username );
            preparedStmt.setString (2, tickets );
            preparedStmt.setString (3, date );
            preparedStmt.setString (4, show );
            preparedStmt.setString (5, status );
            preparedStmt.execute();
            }
            showMessageDialog(null,  tickets + " tickets succesfully purchased " + " at " + date + show + ".");
          }catch(SQLException e){
              System.out.println(e);
          }
}

        public void getShows(){
    
    try{
        String url = "jdbc:mysql://localhost:3306/music";
        String dbUser = "root";
        String dbPass = "";
        
        try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
              String query = "select ConcertID,StartDate,ConcertDesc,Price from concert where ConcertID=ConcertID and StartDate=StartDate and ConcertDesc=ConcertDesc and Price=Price";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        // iterate through the java resultset
        
        while (rs.next()){
            String concertid = rs.getString("ConcertID");
            String date = rs.getString("StartDate");
            String concertDesc = rs.getString("ConcertDesc");
            String price = rs.getString("Price");
            CustomerPage.setShows(concertid, date, concertDesc, price);
        }}
    }catch(SQLException e){
        System.out.println(e);
    }
}

        public void getShows2(){
    
    try{
        String url = "jdbc:mysql://localhost:3306/music";
        String dbUser = "root";
        String dbPass = "";
        
        try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
              String query = "select ConcertID,StartDate,ConcertDesc,Price from concert where ConcertID=ConcertID and StartDate=StartDate and ConcertDesc=ConcertDesc and Price=Price";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        // iterate through the java resultset
        
        while (rs.next()){
            String concertid = rs.getString("ConcertID");
            String date = rs.getString("StartDate");
            String concertDesc = rs.getString("ConcertDesc");
            String price = rs.getString("Price");
            OrganizerPage.setShows2(concertid, date, concertDesc, price);
        }}
    }catch(SQLException e){
        System.out.println(e);
    }
}




    
    public void getBookings(){
    
    try{
        String url = "jdbc:mysql://localhost:3306/music";
        String dbUser = "root";
        String dbPass = "";
        
        try (Connection conn = DriverManager.getConnection(url,dbUser,dbPass)) {
              String query = "select BookingID,BookingDate,ConcertDesc,Status from bookings where BookingID=BookingID and BookingDate=BookingDate and ConcertDesc=ConcertDesc and Status=Status ";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);

        // iterate through the java resultset
        
        while (rs.next()){
            String BookingID = rs.getString("BookingID");
            String BookingDate = rs.getString("BookingDate");
            String ConcertDesc = rs.getString("ConcertDesc");
            String Status = rs.getString("Status");
            
            
            
            AdminPage.setBookings( BookingID, BookingDate , ConcertDesc,  Status);
        }}
    }catch(SQLException e){
        System.out.println(e);
    }
    }


    


}

