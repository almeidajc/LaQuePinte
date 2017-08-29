package ui;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import negocio.CtrlProducto;

import com.itextpdf.*;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class Pdf {
	public Pdf(){
		
	}
	public void imprimir() throws DocumentException {
		// TODO Auto-generated method stub
		Document documento = new Document(PageSize.LETTER, 80, 80, 75, 75);
		
		
		documento.open();
		 
		
		
		 Paragraph titulo = new Paragraph();
		    titulo.setAlignment(Paragraph.ALIGN_CENTER);
		    titulo.setFont(FontFactory.getFont("Times New Roman", 24, Font.BOLD, BaseColor.RED));
		    titulo.setLeading(2,1);
		    titulo.add("***INFORME DE PRODUCTOS CON STOCK MENOR AL MINIMO***");

		    Paragraph saltolinea1 = new Paragraph();
		    saltolinea1.add("\n\n");
		    

		    
		    
		 PdfPTable tabla = new PdfPTable(4);
		 tabla.setWidthPercentage(100);
		 
		    tabla.setWidths(new float[] {20, 30, 25, 25});
		 Paragraph columna1 = new Paragraph("ID PRODUCTO");
		    columna1.getFont().setStyle(Font.BOLD);
		    columna1.getFont().setSize(10);
		    tabla.addCell(columna1);

		    Paragraph columna2 = new Paragraph("NOMBRE");
		    columna2.getFont().setStyle(Font.BOLD);
		    columna2.getFont().setSize(10);
		    tabla.addCell(columna2);

		    Paragraph columna3 = new Paragraph("STOCK DISPONIBLE");
		    columna3.getFont().setStyle(Font.BOLD);
		    columna3.getFont().setSize(10);
		    tabla.addCell(columna3);

		    Paragraph columna4 = new Paragraph("STOCK MINIMO");
		    columna4.getFont().setStyle(Font.BOLD);
		    columna4.getFont().setSize(10);
		    tabla.addCell(columna4);

		try {
			PdfWriter.getInstance(documento, new FileOutputStream("Ejemplo4.pdf"));
		} catch (FileNotFoundException | DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		documento.open(); 
		
		CtrlProducto ctrl = new CtrlProducto();
		
	for (int indice = 0; indice < ctrl.listarProductos().size(); indice++){
	 int disp = ctrl.listarProductos().get(indice).getCantidad_stock();
	 int min = ctrl.listarProductos().get(indice).getCantidad_min_stock();
	 if(disp<min){
 
		 int a = ctrl.listarProductos().get(indice).getId_producto();
		    String id=Integer.toString(a);
		    int c= ctrl.listarProductos().get(indice).getCantidad_stock() ;
		    String dispo =Integer.toString(c);
		    int d = ctrl.listarProductos().get(indice).getCantidad_min_stock() ;
		    String minstock =Integer.toString(d);
		        tabla.addCell(id); 
		        tabla.addCell(ctrl.listarProductos().get(indice).getNombre_producto()); 
		        tabla.addCell(dispo); 
		        tabla.addCell(minstock); 
		        
	 			} 
/*
    int a = ctrl.listarProductos().get(indice).getId_producto();
    String id=Integer.toString(a);
     String nombre = ctrl.listarProductos().get(indice).getNombre_producto();
    float b =  ctrl.listarProductos().get(indice).getPrecio();
    String precio = Float.toString(b);
    int c= ctrl.listarProductos().get(indice).getCantidad_stock() ;
    String dispo =Integer.toString(c);
    int d = ctrl.listarProductos().get(indice).getCantidad_min_stock() ;
    String minstock =Integer.toString(d);
    int e =ctrl.listarProductos().get(indice).getCantidad_max_stock() ;
    String maxstock =Integer.toString(e);
    String material =ctrl.listarProductos().get(indice).getNombre_material() ;
			
			try {
				
				documento.add(new Paragraph(id));
				documento.add(new Paragraph(nombre));
				documento.add(new Paragraph(dispo));
				documento.add(new Paragraph(minstock));
				
				
				    
				*/
		}
		
					documento.add(titulo);
					documento.add(saltolinea1);
				    documento.add(tabla); 
				    documento.close();
				    
	}
			
		
	
}
	
	

