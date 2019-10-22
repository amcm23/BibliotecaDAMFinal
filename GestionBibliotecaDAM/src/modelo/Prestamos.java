package modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author DAM
 */

public class Prestamos {
	Connection con;
	CallableStatement cstmt = null;

	public Prestamos() {
	}

	public void DevolverLibro(int ID, String fecha) throws SQLException {
		con = Conexion.getConnection();
		cstmt = con.prepareCall("{call devolver_libro(?,?)}");
		cstmt.setInt(1, ID);
		cstmt.setString(2, fecha);
		cstmt.execute();
		cstmt.close();
		con.close();
	}

	public void insertarPrestamo(int nuser, int nlib) throws SQLException {
		con = Conexion.getConnection();
		cstmt = con.prepareCall("{call INSERTAR_PRESTAMO_SIMPLE(?,?)}");
		cstmt.setInt(1, nuser);
		cstmt.setInt(2, nlib);
		cstmt.execute();
		cstmt.close();
		con.close();
	}

	public DefaultTableModel listarPrestamos() {

		int tamano = 0;
		String[] headers = { "Nº Prestamo", "Cliente", "Nº Carnet", "Libro", "Signatura", "Fecha Inicio", "Fecha Fin",
				"Plazo" };
		DefaultTableModel plantilla = new DefaultTableModel() {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};

		try {
			con = Conexion.getConnection();
			cstmt = con.prepareCall("{call FETCH_PRESTAMOS.get_prestamos(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet cursor = (ResultSet) cstmt.getObject(1);

			while (cursor.next()) {
				tamano++;

			}
			cursor.close();
			cstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String[][] filas = new String[tamano][9];

		try {

			con = Conexion.getConnection();
			cstmt = con.prepareCall("{call FETCH_PRESTAMOS.get_prestamos(?)}");
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet cursor = (ResultSet) cstmt.getObject(1);
			int i = 0;
			while (cursor.next()) {
				System.out.println("LE PRESTAME: " + cursor.getString("n_prestamo"));
				filas[i][0] = cursor.getString("n_prestamo");
				System.out.println("LE NAME: " + cursor.getString("USUARIO.n_carnet"));
				filas[i][1] = cursor.getString("USUARIO.nombre");
				filas[i][2] = cursor.getString("USUARIO.n_carnet");
				filas[i][3] = cursor.getString("LIBRO.titulo");
				filas[i][4] = cursor.getString("LIBRO.signatura");
				filas[i][5] = cursor.getString("FECHA_INICIO");
				filas[i][6] = cursor.getString("FECHA_DEVOLUCION");
				filas[i][7] = cursor.getString("FECHA_FIN");

				i++;
				System.out.println(filas.toString());
			}
			con.close();
			plantilla.setDataVector(filas, headers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plantilla;
	}

}
