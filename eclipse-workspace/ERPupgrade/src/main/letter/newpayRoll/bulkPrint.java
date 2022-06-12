package newpayRoll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.color.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.AreaBreakType;
import com.itextpdf.layout.property.UnitValue;

/**
 * Servlet implementation class bulkPrint
 */
@WebServlet("/bulkPrint")
public class bulkPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bulkPrint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String moth = request.getParameter("moth");
		 String depart = request.getParameter("depart");
		 
		 System.out.println("bulk printing ................");
		 
		 Connection con;
         ResultSet rs;
		
         try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms","root","root");
         
         // String queryy = "select * from payroll where id >= 25";
         String queryy ="select * from payroll where payDay='"+moth+"' and department= '"+depart+"'and position not like '%BVO ASSIST%' and position not like '%BVO-ASSISTANT%'";
                   Statement st = con.createStatement();
                   
                   
                     rs =  st.executeQuery(queryy);
                	 response.setContentType("test/pdf");
					 response.setHeader("Content-Disposition","Inline; filename=\"document.pdf\"");
                	 Document document = new Document(new PdfDocument(new PdfWriter(response.getOutputStream())));
                	 PdfFont font1 = PdfFontFactory.createFont(FontConstants.COURIER_BOLD);
                         while(rs.next())
                         {
	 
                        	 float col = 280f;
                        	 
                        	    float llx = 250;
                                float lly = 715;
                                float urx = 400;
                                float ury = 800;
                        	 float colWidth[] = {col};
                        	 Table table = new Table(colWidth);
                        	 table.addCell(new Cell().add("KODSON PLUS CO.LTD")
                        			 .setFontSize(18f)
                        			 .setBorder(Border.NO_BORDER)
                        			 .setBold()
                        			 );
                        	 table.addCell(new Cell().add("PLOT # 10 OLD ADA ROAD.BOX CO3186, TEMA ")
                        			 
                        			 .setFontSize(8f)
                        			 .setBorder(Border.NO_BORDER)
                        			 );
                             table.addCell(new Cell().add(" TEL: 0303305730 email: kodsontransport@gmail.com")
                        			 
                        			 .setFontSize(6f)
                        			 .setBorder(Border.NO_BORDER)
                        			 );
                             
                             SolidLine line = new SolidLine(1f);
                             line.setColor(Color.RED);
                             LineSeparator ls = new LineSeparator(line);
                             ls.setWidthPercent(100);
                             
                             Paragraph p = new Paragraph();
                             p.add("P A Y S L I P For "+ moth).setFixedPosition(llx,lly,urx).setMargin(0).setFontSize(12f).setBold();
                        	 
                             
                             
                             float columnWidth[] = {250,250,250,250,250};
                        	 Table table1 = new Table(columnWidth).setFixedPosition(50, 650, urx);
                        	 table1.setWidth(UnitValue.createPercentValue(100));
                        	 table1.addCell(new Cell().add("EMPLOYEE NAME")
                        			 
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			
                        			 );
                        	 table1.addCell(new Cell().add("SSNIT NUMBER")
                        			 
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 );
                        	 table1.addCell(new Cell().add("DATE")
                        			 
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 );
                        	 table1.addCell(new Cell().add("DEPARTMENT")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add("POSITION")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add(rs.getString("empName"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table1.addCell(new Cell().add(rs.getString("ssnit"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 table1.addCell(new Cell().add(rs.getString("date"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			
                        			 );
                        	 table1.addCell(new Cell().add(rs.getString("department"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add(rs.getString("position"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                             
                        	 float columnWidth1[] = {350,350,350,350};
                        	 Table table2 = new Table(columnWidth1).setFixedPosition(50, 450, urx);
                        	 table2.setWidth(UnitValue.createPercentValue(100));
                        	 table2.addCell(new Cell().add("Description")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			
                        			 );
                        	 table2.addCell(new Cell().add("Amount")                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Description")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 table2.addCell(new Cell().add("Amount")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 
                        	///////////////////////////// // table data///////////////////////////////////////////////
                        	 
                        	 table2.addCell(new Cell().add("Basic")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("basic"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Debt Bal B/D")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("debtBalance"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 
                        	 table2.addCell(new Cell().add("Employer(SSF)")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("employer"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Current Loan/Surcharge")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("currentLoan"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add("Employee(SSF)")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("employee"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Adjustments")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("adjustment"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Taxable Salary")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("taxableSalary"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Deductions")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("dAmount"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add("Paye")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("paye"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Bicycle Deduction")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("bicycle"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Statutory Deduction")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("statutoryD"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Net Before Other Deductions")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("netpayBefore"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Net Pay")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("netSalary"))                                        
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Total Debt")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("totalDebt"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Balance OutStanding")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("outstandingBalance"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(216, 233, 237))
                        			 );
                        	 table2.addCell(new Cell().add("Total Deduction")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("totalDeduction"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Net Salary Payable")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add(rs.getString("netpayable"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	
                             
                        	 float columnWidth2[] = {350,350,350,350};
                        	 Table table3 = new Table(columnWidth2).setFixedPosition(50, 400, urx);
                        	 table3.setWidth(UnitValue.createPercentValue(100));
                        	 table3.addCell(new Cell().add("Payment Method")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			
                        			 );
                        	 table3.addCell(new Cell().add("Bank Branch")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 
                        			 );
                        	 table3.addCell(new Cell().add("Account Number")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 table3.addCell(new Cell().add("Paid Amount")
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 
                        	 table3.addCell(new Cell().add(rs.getString("pmethod"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table3.addCell(new Cell().add(rs.getString("bankBrach"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 table3.addCell(new Cell().add(rs.getString("accountNumber"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			
                        			 );
                        	 table3.addCell(new Cell().add(rs.getString("paidAmount"))
                        			 .setFontSize(9f)
                        			 .setBold()
                        			 .setFont(font1)
                        			 
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 Paragraph p1 = new Paragraph();
                             p1.add(".............................................................\n Approved By General Manager ").setFixedPosition(90, 350, urx).setMargin(0).setFontSize(8f);

                        	 document.add(table);
                        	 document.add(ls);
                        	 document.add(p);
                        	 document.add(table1);
                        	 document.add(table2);
                        	 document.add(table3);
                        	 document.add(p1);
                        	 
                        	 document.add(new AreaBreak(AreaBreakType.NEXT_PAGE));
                        	 
                        	 System.out.println(rs.getString("empName") +" "+ rs.getString("payDay")+" "+rs.getString("department")+" "+ rs.getString("netpayable"));
                        	
                         } document.close();
                         }catch(Exception e) {}
           
		
	}

}
