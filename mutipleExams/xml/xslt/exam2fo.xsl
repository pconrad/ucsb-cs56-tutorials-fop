<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>

  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="exam">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

<fo:layout-master-set>
  <fo:simple-page-master  master-name="US-Letter"
     page-height="11in"   page-width="8.5in"
     margin-top="0.5in"   margin-bottom="0.5in"
     margin-left="0.5in"  margin-right="0.5in">


  <fo:region-body margin-top="1.0in"
                  margin-bottom="1.0in"/>
  <fo:region-before extent="1.0in"/>
  <fo:region-after  extent="1.0in"/>


  </fo:simple-page-master>
</fo:layout-master-set>


      <fo:page-sequence master-reference="US-Letter">

	<!-- This is the HEADER -->

        <fo:static-content flow-name="xsl-region-before">
          <fo:block font-size="11pt" font-weight="bold" space-after="5mm">
             <xsl:value-of select="course"/><xsl:text> </xsl:text>
             <xsl:value-of select="examTitle"/><xsl:text> </xsl:text>
             <xsl:value-of select="examNum"/> p. <fo:page-number/>
          </fo:block>
        </fo:static-content>

	<!-- This is the FOOTER -->

        <fo:static-content flow-name="xsl-region-after">
          <fo:block font-size="11pt" font-weight="bold" space-after="5mm">
             <xsl:value-of select="course"/><xsl:text> </xsl:text>
             <xsl:value-of select="examTitle"/><xsl:text> </xsl:text>
             <xsl:value-of select="examNum"/> p. <fo:page-number/>
          </fo:block>
        </fo:static-content>


	<fo:flow flow-name="xsl-region-body">
	  <fo:block>
	    <xsl:text>
This is exam is closed book, except that you are permitted one 8.5x11 sheet of notes.  Please silence all cell phones and remove all headphones.
            </xsl:text>
            <fo:list-block provisional-distance-between-starts="48pt"
			   provisional-label-separation="24pt">
              <xsl:apply-templates select="//questions/question" />
            </fo:list-block>
	  </fo:block>
        </fo:flow>


      </fo:page-sequence>

    </fo:root>
  </xsl:template>

  <xsl:template match="question">
     <fo:list-item>
       <fo:list-item-label  end-indent="label-end()">
         <fo:block>
          (<xsl:number format="1" />) 
         </fo:block>
       </fo:list-item-label>
       <fo:list-item-body  start-indent="body-start()">
        <fo:block>
          <xsl:value-of select="text" />
         </fo:block>
       </fo:list-item-body>
     </fo:list-item>
  </xsl:template>


</xsl:stylesheet>
