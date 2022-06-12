package newpayRoll;

import java.io.IOException;
import java.sql.*;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.color.DeviceRgb;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.*;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.property.UnitValue;

/**
 * Servlet implementation class itext7
 */
@WebServlet("/itext7")
public class itext7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itext7() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 String id = request.getParameter("id");
		 String moth = (String) request.getSession(false).getAttribute("months");
		 String depart = (String) request.getSession(false).getAttribute("departments");
		 
		 
		 
            String payEmpName =""; 
        	String date1 = "";
        	String payEmpSsnit =""; 
        	String payEmpCatName =""; 
        	String month =""; 
        	String payEmpBasic =""; 
        	String payEmpDebtBal =""; 
        	String payEmpSFFl =""; 
        	String payEmpCurLoanSur =""; 
        	String payEmpSSFP =""; 
        	String payEmpAdjust = "";
        	String payEmpTaxableS = "";
        	String payEmpDeduct = "";
        	String payEmpPaye = "";
        	String payEmpBicyc =""; 
        	
        	String payEmpStatuDeduc = "";
        	String payEmpBeforOdaDeduc =""; 
        	String payEmpNetSal = "";
        	String payEmpTotDebt =""; 
        	String payEmpBlaAwt = "";
        	String payEmpTotDeduc =""; 
        	String payEmpNetSalPay =""; 
        	String payEmpPayMethod = "";
        	String payEmpBankBranch =""; 
        	String payEmpBankNo =""; 
        	String payEmpPaidAmt = "";
		
		 Connection con;
         ResultSet rs;
		
         try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/kodsonvms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","kodson_maxwell","0040105715@Icon");
         
          String queryy = "select * from payroll where id='"+id+"'";
          // String queryy = "select * from payroll where payDay='"+moth+"' and department='"+depart+"'";
                   Statement st = con.createStatement();
                   

                   
                     rs =  st.executeQuery(queryy);
                     
                         while(rs.next())
                         {
                        	                  	 
                        	 payEmpName=rs.getString("empName");
                        	 date1=rs.getString("date");
                        	 payEmpSsnit=rs.getString("ssnit");
                        	 payEmpCatName=rs.getString("department");
                        	 String position=rs.getString("position");
                        	 month=rs.getString("payDay");
                        	 payEmpBasic=rs.getString("basic");
                        	 payEmpDebtBal=rs.getString("debtBalance");
                        	 payEmpSFFl=rs.getString("employer");
                        	 payEmpCurLoanSur=rs.getString("currentLoan");
                        	 payEmpSSFP=rs.getString("employee");
                        	 payEmpAdjust=rs.getString("adjustment");
                        	 payEmpTaxableS=rs.getString("taxableSalary");
                        	 payEmpDeduct=rs.getString("dAmount");
                        	 payEmpPaye=rs.getString("paye");
                        	 payEmpBicyc=rs.getString("bicycle");
                        	 payEmpStatuDeduc=rs.getString("statutoryD");
                        	 payEmpBeforOdaDeduc=rs.getString("netpayBefore");
                        	 payEmpNetSal=rs.getString("netSalary");
                        	 payEmpTotDebt=rs.getString("totalDebt");
                        	 payEmpBlaAwt=rs.getString("outstandingBalance");
                        	 payEmpTotDeduc=rs.getString("totalDeduction");
                        	 payEmpNetSalPay=rs.getString("netpayable");
                        	 payEmpPayMethod=rs.getString("pmethod");
                        	 payEmpBankBranch=rs.getString("bankBrach");
                        	 payEmpBankNo=rs.getString("accountNumber");
                        	 payEmpPaidAmt=rs.getString("paidAmount");
                        	 
                        	 response.setContentType("test/pdf");
        					 response.setHeader("Content-Disposition","Inline; filename=\"paySlip.pdf\"");
                        	 Document document = new Document(new PdfDocument(new PdfWriter(response.getOutputStream())));
                        	 
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
                             p.add("PAYSLIP For "+ month).setFixedPosition(llx,lly,urx).setMargin(0).setFontSize(12f).setBold();
                        	 
                             
                             
                             float columnWidth[] = {250,250,250,250,250};
                        	 Table table1 = new Table(columnWidth).setFixedPosition(50, 650, urx);
                        	 table1.setWidth(UnitValue.createPercentValue(100));
                        	 table1.addCell(new Cell().add("EMPLOYEE NAME")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table1.addCell(new Cell().add("SSNIT NUMBER")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        	
                        			 
                        			 );
                        	 table1.addCell(new Cell().add("DATE")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			
                        			 );
                        	 table1.addCell(new Cell().add("DEPARTMENT")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add("POSITION")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add(payEmpName)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table1.addCell(new Cell().add(payEmpSsnit)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 table1.addCell(new Cell().add(date1)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			
                        			 );
                        	 table1.addCell(new Cell().add(payEmpCatName)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                        	 table1.addCell(new Cell().add(position)
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 
                             
                        	 float columnWidth1[] = {350,350,350,350};
                        	 Table table2 = new Table(columnWidth1).setFixedPosition(50, 450, urx);
                        	 table2.setWidth(UnitValue.createPercentValue(100));
                        	 table2.addCell(new Cell().add("Description")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			
                        			 );
                        	 table2.addCell(new Cell().add("Amount")                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Description")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 table2.addCell(new Cell().add("Amount")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 
                        	///////////////////////////// // table data///////////////////////////////////////////////
                        	 
                        	 table2.addCell(new Cell().add("Basic")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpBasic)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Debt Bal B/D")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpDebtBal)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 
                        	 table2.addCell(new Cell().add("Employer(SSF)")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpSFFl)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Current Loan/Surcharge")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpCurLoanSur)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Employee(SSF)")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpSSFP)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Adjustments")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpAdjust)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Taxable Salary")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpTaxableS)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Deductions")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpDeduct)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Paye")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpPaye)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Bicycle Deduction")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpBicyc)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Statutory Deduction")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpStatuDeduc)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Net Before Other Deductions")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpBeforOdaDeduc)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Net Pay")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			
                        			 );
                        	 table2.addCell(new Cell().add(payEmpNetSal)                                        
                        			 .setFontSize(9f)
                        			 
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("Total Debt")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpTotDebt)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Balance OutStanding")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpBlaAwt)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Total Deduction")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add(payEmpTotDeduc)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 );
                        	 table2.addCell(new Cell().add("Net Salary Payable")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add(payEmpNetSalPay)
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	 table2.addCell(new Cell().add("")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			 );
                        	
                             
                        	 float columnWidth2[] = {350,350,350,350};
                        	 Table table3 = new Table(columnWidth2).setFixedPosition(50, 400, urx);
                        	 table3.setWidth(UnitValue.createPercentValue(100));
                        	 table3.addCell(new Cell().add("Payment Method")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			
                        			 );
                        	 table3.addCell(new Cell().add("Bank Branch")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 
                        			 );
                        	 table3.addCell(new Cell().add("Account Number")
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 table3.addCell(new Cell().add("Paid Amount")
                        			 .setFontSize(9f)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 .setBorderBottom(Border.NO_BORDER)
                        			 .setBackgroundColor(new DeviceRgb(224, 255, 255))
                        			 );
                        	 
                        	 table3.addCell(new Cell().add(payEmpPayMethod)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 
                        			
                        			 );
                        	 table3.addCell(new Cell().add(payEmpBankBranch)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			 
                        			 );
                        	 table3.addCell(new Cell().add(payEmpBankNo)
                        			 .setFontSize(9f)
                        			 .setBorderRight(Border.NO_BORDER)
                        			 .setBorderTop(Border.NO_BORDER)
                        			 .setBorderLeft(Border.NO_BORDER)
                        			
                        			 );
                        	 table3.addCell(new Cell().add(payEmpPaidAmt)
                        			 .setFontSize(9f)
                        			 
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
                        	 document.close();
                          
                         }
                         
                         
         }catch(Exception e) {
                        	 System.out.println(e);
                         }
	
	}

}
