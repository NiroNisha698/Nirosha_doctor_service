package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Doctor;

import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;

/**
 * Servlet implementation class DoctorAPI
 */
@WebServlet("/DoctorAPI")
public class DoctorAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Doctor doctorObj = new Doctor ();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** Here, I will read the values passed by the client as an XHR request and
		*pass them to the model by calling the insertDoctor() method in the Doctor class 
		*then return the output of the insertDoctor() method to the client.
		*/
		
		String output =doctorObj.insertDoctor(request.getParameter("Name"),
				request.getParameter("Specialization"),
				request.getParameter("NIC"),
				request.getParameter("Mobile"),
				request.getParameter("Email"),
				request.getParameter("DoctorFee"));
		
		response.getWriter().write(output);
		
		
		
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		Map paras = getParasMap(request); 
		String output = doctorObj.updateDoctor(paras.get("hidDIDSave").toString(), 
				paras.get("Name").toString(), 
				paras.get("Specialization").toString(),       
				paras.get("NIC").toString(),        
				paras.get("Mobile").toString(),
				paras.get("Email").toString(),
				paras.get("DoctorFee").toString()); 
		
		response.getWriter().write(output);
		
		
		
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		Map paras = getParasMap(request); 
		String output = doctorObj.deleteDoctor(paras.get("DID").toString()); 
		response.getWriter().write(output); 

		
	}
	
	
	
	/**To read the request parameters in doPut() anddoDelete(), 
	*	I will use a custom method. This method reads the request parameters, 
	*	store them in a Map, and returns.
	*/
	// Convert request parameters to a Map 
		private static Map getParasMap(HttpServletRequest request)
		{  
			Map<String, String> map = new HashMap<String, String>();  
			try 
			{   
				Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");   
				String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";   
				scanner.close(); 
			
			  String[] params = queryString.split("&");   
			  for (String param : params)   {
				  
				  String[] p = param.split("=");    
				  map.put(p[0], p[1]); 
			  }
		}
		
			catch (Exception e)
			{  
				}  return map;
			}
	
	
	
	

}
