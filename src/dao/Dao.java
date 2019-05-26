package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Vene;

public class Dao {
	private Connection con=null;
	private ResultSet rs = null;
	private PreparedStatement stmtPrep=null; 
	private String sql;
	
	private Connection yhdista(){ //yhteys tietokantaan
    	Connection con = null;    	        	
    	String JDBCAjuri = "org.mariadb.jdbc.Driver";
    	String url = "jdbc:mariadb://localhost:15001/username";        	
    	try {
	         Class.forName(JDBCAjuri);
	         con = DriverManager.getConnection(url,"username", "password");	        
	     }catch (Exception e){	         
	        e.printStackTrace();	         
	     }
	     return con;
	}
	public ArrayList<Vene> listaaKaikki(){ //kaikkien veneiden listaaminen
		ArrayList<Vene> veneet = new ArrayList<Vene>();
		sql = "SELECT * FROM Veneet";       
		try {
			con=yhdista();
			if(con!=null){ 
				stmtPrep = con.prepareStatement(sql);        		
        		rs = stmtPrep.executeQuery();   
				if(rs!=null){ 
					con.close();					
					while(rs.next()){
						Vene vene = new Vene();
						vene.setTunnus(rs.getInt(1));
						vene.setNimi(rs.getString(2));
						vene.setMerkkimalli(rs.getString(3));
						vene.setPituus(rs.getDouble(4));
						vene.setLeveys(rs.getDouble(5));
						vene.setHinta(rs.getInt(6));
						veneet.add(vene);
					}					
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return veneet;
	}
	
	public ArrayList<Vene> listaaKaikki(String hakusana){ //veneiden haku hakusanalla
		ArrayList<Vene> veneet = new ArrayList<Vene>();
		sql = "SELECT * FROM Veneet WHERE  nimi LIKE ? or merkkimalli LIKE ? "
				+ "or pituus LIKE ? or leveys LIKE ? or hinta LIKE ?";       
		try {
			con=yhdista();
			if(con!=null){ 
				stmtPrep = con.prepareStatement(sql);
				stmtPrep.setString(1, "%" + hakusana + "%");
				stmtPrep.setString(2, "%" + hakusana + "%");
				stmtPrep.setString(3, "%" + hakusana + "%");
				stmtPrep.setString(4, "%" + hakusana + "%");
				stmtPrep.setString(5, "%" + hakusana + "%");
        		rs = stmtPrep.executeQuery();   
				if(rs!=null){ 
					con.close();					
					while(rs.next()){
						Vene vene = new Vene();
						vene.setTunnus(rs.getInt(1));
						vene.setNimi(rs.getString(2));
						vene.setMerkkimalli(rs.getString(3));
						vene.setPituus(rs.getDouble(4));
						vene.setLeveys(rs.getDouble(5));
						vene.setHinta(rs.getInt(6));
						veneet.add(vene);
					}					
				}				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return veneet;
	}
	public Vene loytyykoVene(int tunnus){ //tutkitaan löytyykö tietyn tunnuksen vene
		Vene vene = null;
		sql = "SELECT * FROM Veneet WHERE tunnus=?";       
		try {
			con=yhdista();
			if(con!=null){ 
				stmtPrep = con.prepareStatement(sql); 
				stmtPrep.setInt(1, tunnus);
        		rs = stmtPrep.executeQuery();  
        		if(rs.isBeforeFirst()){ 
        			rs.next();
        			vene = new Vene(); 
        			vene.setTunnus(rs.getInt(1));
        			vene.setNimi(rs.getString(2));
					vene.setMerkkimalli(rs.getString(3));
					vene.setPituus(rs.getDouble(4));	
					vene.setLeveys(rs.getDouble(5));
					vene.setHinta(rs.getInt(6));
        			con.close();        			
				}			
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return vene;		
	}
	
	public boolean muutaVene(Vene vene, int tunnus){ //muutetaan veneen tietoja
		boolean paluuArvo=true;
		sql="UPDATE Veneet SET nimi=?, merkkimalli=?, pituus=?, leveys=?, hinta=? WHERE tunnus=?";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setString(1, vene.getNimi());
			stmtPrep.setString(2, vene.getMerkkimalli());
			stmtPrep.setDouble(3, vene.getPituus());
			stmtPrep.setDouble(4, vene.getLeveys());
			stmtPrep.setInt(5, vene.getHinta());
			stmtPrep.setInt(6, tunnus);
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}
	
	public boolean lisaaVene(Vene vene){ //lisätään vene tietokantaan
		boolean paluuArvo=true;
		sql="INSERT INTO Veneet(nimi, merkkimalli, pituus, leveys, hinta) VALUES(?,?,?,?,?)";				  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setString(1, vene.getNimi());
			stmtPrep.setString(2, vene.getMerkkimalli());
			stmtPrep.setDouble(3, vene.getPituus());
			stmtPrep.setDouble(4, vene.getLeveys());
			stmtPrep.setInt(5, vene.getHinta());
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}
	
	
	public boolean poistaVene(int tunnus){ //poistetaan vene tietokannasta
		boolean paluuArvo=true;
		sql="DELETE FROM Veneet WHERE tunnus=?";						  
		try {
			con = yhdista();
			stmtPrep=con.prepareStatement(sql); 
			stmtPrep.setInt(1, tunnus);			
			stmtPrep.executeUpdate();
	        con.close();
		} catch (SQLException e) {				
			e.printStackTrace();
			paluuArvo=false;
		}				
		return paluuArvo;
	}
	public String login(String uid, String pwd){ //tutkitaan löytyykö kirjautumistunniste tietokannasta
		String nimi=null;
		sql="SELECT Etunimi, Sukunimi FROM login WHERE userid=? AND pwd=?";						  
		try {
			con = yhdista();
			stmtPrep = con.prepareStatement(sql); 
			stmtPrep.setString(1, uid);
			stmtPrep.setString(2, pwd);
    		rs = stmtPrep.executeQuery();  
    		if(rs.isBeforeFirst()){ 
    			rs.next();
    			nimi = rs.getString("Etunimi") + " " + rs.getString("Sukunimi");
    			con.close();        			
			}		
		} catch (SQLException e) {				
			e.printStackTrace();			
		}				
		return nimi;
	}
}


