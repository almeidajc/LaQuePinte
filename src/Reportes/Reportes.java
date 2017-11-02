package Reportes;

import java.sql.SQLException;
import java.sql.Connection;






import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import data.FactoryConexion;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.view.JasperViewer;
public class Reportes {
	private String fecha;
	
	public void reporteStock() throws JRException,SQLException {
		 fecha = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
		Connection connect;
		connect= FactoryConexion.getInstancia().getConn();
		JasperReport report=null;
		try{
		report = (JasperReport) JRLoader.loadObjectFromFile("C:\\Users\\valen12\\Desktop\\Facultad\\proyecto\\Git java\\LaQuePinte\\Informe.jasper");
		JasperPrint jasperPrint = JasperFillManager.fillReport(report, null, connect);
		/*JasperViewer ver = new JasperViewer(jasperPrint);
		ver.setTitle("Informe stock "+ fecha );
		ver.setVisible(true);*/
		jasperPrint.setName("Informe stock "+ fecha );
		JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\valen12\\Desktop\\Facultad\\proyecto\\Git java\\LaQuePinte\\reportes\\Informe stock "+ fecha + ".pdf");
		}
		catch(JRException ex){
			ex.printStackTrace();
		}
	}
		
		

		public void ReportePedido(int id)throws JRException,SQLException {
			// TODO Auto-generated method stub
			 fecha = new SimpleDateFormat("dd-MM-yyyy").format(Calendar.getInstance().getTime());
				Connection connect;
				connect= FactoryConexion.getInstancia().getConn();
				JasperReport report=null;
				
				try{
				report = (JasperReport) JRLoader.loadObjectFromFile("C:\\Users\\valen12\\Desktop\\Facultad\\proyecto\\Git java\\LaQuePinte\\Pedido.jasper");
				JasperPrint jasperPrint = JasperFillManager.fillReport(report, null, connect);
				JasperViewer ver = new JasperViewer(jasperPrint);
				ver.setTitle("Pedido: "+ id );
				ver.setVisible(true);
				JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\valen12\\Desktop\\Facultad\\proyecto\\Git java\\reportes\\Pedido: "+ id+ ""+fecha + ".pdf");
				}
				catch(JRException ex){
					ex.printStackTrace();
				}
			
		}
}
