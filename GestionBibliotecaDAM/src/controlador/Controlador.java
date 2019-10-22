package controlador;

import Vista.Vista;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import modelo.Interfaz;
import modelo.Libro;
import modelo.Usuario;
import modelo.Prestamos;

/**
 *
 * @author DAM
 */
public class Controlador implements ActionListener {
	private Vista vista;
	Prestamos p = new Prestamos();
	Usuario usuario = new Usuario();
	Libro libro = new Libro();
	private Interfaz interfaz;

	@Override
	public void actionPerformed(ActionEvent ae) {
		switch (AccionMVC.valueOf(ae.getActionCommand())) {

		case __InsertarUsuario:

			String nombre = vista.Nombre_Usuario.getText();
			String ciudad = vista.Ciudad_Usuario.getText();
			int cod = Integer.parseInt(vista.CodPost_Usuario.getText());
			String calle = vista.Calle_Usuario.getText();

			try {
				usuario.insertarUsuario(nombre, calle, ciudad, cod);
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			break;

		case __InsertarLibro:
			String titulo = vista.Titulo_Libro.getText();
			String autor = vista.Autor_Libro.getText();
			String editor = vista.Editor_Libro.getText();
			int clase = Integer.parseInt(vista.Clase_Libro.getText());

			try {
				libro.insertarLibro(autor, titulo, editor, clase);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}

			this.vista.Table_Libros.setModel(libro.listarLibros());
			break;
		case __BorrarUsuario:
			int id = Integer.parseInt(vista.ID_Borrar_Usuario.getText()); {
			try {
				usuario.BorrarUsuario(id);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			this.vista.Table_Prestamos.setModel(p.listarPrestamos());
			break;
		case __BorrarLibro:
			id = Integer.parseInt(vista.ID_Borrar_Libro.getText()); {
			try {
				libro.BorrarLibro(id);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Libros.setModel(libro.listarLibros());
			this.vista.Table_Prestamos.setModel(p.listarPrestamos());
			break;
		case __RealizarPrestamo:
			int nuser = Integer.parseInt(vista.Numero_Usuario_Prestamo.getText());
			int nlib = Integer.parseInt(vista.Codigo_Libro_Prestamo.getText()); {
			try {
				p.insertarPrestamo(nuser, nlib);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Prestamos.setModel(p.listarPrestamos());
			this.vista.Table_Libros.setModel(libro.listarLibros());
			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			break;
		case __DevolverLibro:
			id = Integer.parseInt(vista.ID_Devolver_Libro.getText());
			String fecha = vista.F_devol_libro.getText(); {
			try {
				p.DevolverLibro(id, fecha);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Prestamos.setModel(p.listarPrestamos());
			this.vista.Table_Libros.setModel(libro.listarLibros());
			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			break;
		case __PerdonarUsuario:
			id = Integer.parseInt(this.vista.ID_Borrar_Usuario.getText()); {
			try {
				usuario.PerdonarUsuario(id);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			break;
		case __ActualizarUsuario:
			id = Integer.parseInt(vista.Actualizar_id_Usuario.getText());
			nombre = vista.Nombre_Usuario.getText();
			ciudad = vista.Ciudad_Usuario.getText();
			cod = Integer.parseInt(vista.CodPost_Usuario.getText());
			calle = vista.Calle_Usuario.getText(); {
			try {
				usuario.ActualizarUsuario(id, nombre, calle, ciudad, cod);
			} catch (SQLException ex) {
				Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
			this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
			break;
		case __ActualizarLibro:
			titulo = vista.Titulo_Libro.getText();
			autor = vista.Autor_Libro.getText();
			editor = vista.Editor_Libro.getText();
			clase = Integer.parseInt(vista.Clase_Libro.getText());
			int codigo = Integer.parseInt(vista.ID_Borrar_Libro.getText());

			{
				try {
					libro.ActualizarLibro(codigo, autor, titulo, editor, clase);
				} catch (SQLException ex) {
					Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
				this.vista.Table_Libros.setModel(libro.listarLibros());
				break;

		}
	}

	public enum AccionMVC {
		__InsertarUsuario, __InsertarLibro, __BorrarUsuario, __BorrarLibro, __RealizarPrestamo, __DevolverLibro,
		__PerdonarUsuario, __ActualizarUsuario, __ActualizarLibro

	}

	Controlador(Vista vista) {
		this.vista = new Vista();
		// this.interfaz = new Interfaz(vista);
	}

	public void iniciar() {
		this.vista.Table_Usuarios.setModel(usuario.listarUsuarios());
		this.vista.Table_Libros.setModel(libro.listarLibros());
		this.vista.Table_Prestamos.setModel(p.listarPrestamos());
		vista.setVisible(true);
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windowsLookAndFeel");
			SwingUtilities.updateComponentTreeUI(vista);
			vista.setVisible(true);
		} catch (UnsupportedLookAndFeelException ex) {
		} catch (ClassNotFoundException ex) {
		} catch (InstantiationException ex) {
		} catch (IllegalAccessException ex) {
		}

		this.vista.Insert_user.setActionCommand("__InsertarUsuario");
		this.vista.Insert_user.addActionListener(this);

		this.vista.Insert_libro.setActionCommand("__InsertarLibro");
		this.vista.Insert_libro.addActionListener(this);

		this.vista.Insert_prestamos.setActionCommand("__RealizarPrestamo");
		this.vista.Insert_prestamos.addActionListener(this);

		this.vista.Borrar_Libro.setActionCommand("__BorrarLibro");
		this.vista.Borrar_Libro.addActionListener(this);

		this.vista.Borrar_Usuario.setActionCommand("__BorrarUsuario");
		this.vista.Borrar_Usuario.addActionListener(this);

		this.vista.Devolver_Libro.setActionCommand("__DevolverLibro");
		this.vista.Devolver_Libro.addActionListener(this);

		this.vista.PERDONAR_USUARIO.setActionCommand("__PerdonarUsuario");
		this.vista.PERDONAR_USUARIO.addActionListener(this);

		this.vista.Actualizar_Usuario.setActionCommand("__ActualizarUsuario");
		this.vista.Actualizar_Usuario.addActionListener(this);

		this.vista.Actualizar_Libros.setActionCommand("__ActualizarLibro");
		this.vista.Actualizar_Libros.addActionListener(this);

	}

}
