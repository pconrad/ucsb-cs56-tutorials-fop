package edu.ucsb.cs56.fopMultiple;


//Java
import java.io.File;
import java.io.OutputStream;
import java.io.ByteArrayInputStream;

//JAXP
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Source;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.sax.SAXResult;

//FOP
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

/**
 * This class demonstrates the conversion of XML from a String to PDF using
 * JAXP (XSLT) and FOP (XSL-FO).
 */
public class XMLFromString2PDF {

    /**
     * Main method.
     * @param args command-line arguments
     */
    public static void main(String[] args) {
        try {
            System.out.println("Preparing...");

            // Setup directories
            File baseDir = new File(".");
            File outDir = new File(baseDir, "out");
            outDir.mkdirs();

            // Setup input and output files

	    String inputString = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
		"<exam>" + 
		"  <course>CS16</course>" +
		"  <examTitle>Midterm Exam</examTitle>" +
		"  <examNum>E02</examNum>";

	    inputString +=		"  <questions>";

	    for (int i=0;i<100;i++) {
		inputString += (
				"   <question>" +
				"     <pts>10</pts>" +
				"     <text>This is a question</text>" +
				"   </question>");
	    }

	    inputString += ("  </questions>" +
			    "</exam>");
	    
            File xsltfile = new File(baseDir, "xml/xslt/exam2fo.xsl");
            File pdffile = new File(outDir, "XMLFromString2PDF.pdf");

            System.out.println("Input: XML (" + inputString + ")");
            System.out.println("Stylesheet: " + xsltfile);
            System.out.println("Output: PDF (" + pdffile + ")");
            System.out.println();
            System.out.println("Transforming...");

            // configure fopFactory as desired
            FopFactory fopFactory = FopFactory.newInstance();

            FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
            // configure foUserAgent as desired

            // Setup output
            OutputStream out = new java.io.FileOutputStream(pdffile);
            out = new java.io.BufferedOutputStream(out);

            try {
                // Construct fop with desired output format
                Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);

                // Setup XSLT
                TransformerFactory factory = TransformerFactory.newInstance();
                Transformer transformer = factory.newTransformer(new StreamSource(xsltfile));

                // Set the value of a <param> in the stylesheet
                transformer.setParameter("versionParam", "2.0");

                // Setup input for XSLT transformation

		ByteArrayInputStream bais = new ByteArrayInputStream(inputString.getBytes("UTF-8"));

		    Source src = new StreamSource(bais); // uses InputStream constructor;

                // Resulting SAX events (the generated FO) must be piped through to FOP
                Result res = new SAXResult(fop.getDefaultHandler());

                // Start XSLT transformation and FOP processing
                transformer.transform(src, res);
            } finally {
                out.close();
            }

            System.out.println("Success!");
        } catch (Exception e) {
            e.printStackTrace(System.err);
            System.exit(-1);
        }
    }
}
