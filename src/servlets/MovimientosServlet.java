package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MovimientoDao;
import Dominio.Movimiento;

/**
 * Servlet implementation class MovimientosServlet
 */
@WebServlet("/MovimientosServlet")
public class MovimientosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MovimientosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Movimiento> listadoMovimientosPorCuenta = new ArrayList<>();
		MovimientoDao mDao = new MovimientoDao();
		listadoMovimientosPorCuenta = mDao.ListarMovimientosPorCuenta(Integer.parseInt(request.getParameter("cuenta_seleccionada")));
		request.setAttribute("listadoMovimientosPorCuenta", listadoMovimientosPorCuenta);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Movimientos.jsp");   
		requestDispatcher.forward(request, response);	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
