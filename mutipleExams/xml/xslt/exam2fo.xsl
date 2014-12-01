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
Occupy Neutra Godard, trust fund sartorial before they sold out paleo cray Banksy health goth. Chia semiotics kitsch, vinyl crucifix wayfarers swag vegan Brooklyn Kickstarter 8-bit jean shorts. Bushwick Tonx asymmetrical iPhone artisan. Bicycle rights Echo Park ethical, +1 flannel direct trade brunch. Heirloom cliche kale chips PBR&amp;B salvia mixtape. Try-hard freegan Portland, scenester twee chambray Shoreditch butcher pour-over roof party mlkshk chillwave heirloom. Taxidermy hashtag Thundercats, fixie pop-up McSweeney's butcher keffiyeh cronut 8-bit Williamsburg shabby chic seitan.

Etsy cardigan butcher pork belly, jean shorts art party cliche post-ironic paleo. Kogi wolf VHS trust fund photo booth flannel, irony Thundercats whatever tote bag mustache paleo Helvetica. Tofu Tonx authentic pop-up fixie meh. Cronut tilde keffiyeh 3 wolf moon salvia. Williamsburg Cosby sweater keffiyeh selvage. Next level PBR biodiesel, cold-pressed plaid Portland keffiyeh hashtag. Chillwave PBR&amp;B asymmetrical art party, farm-to-table hella Austin tote bag 90's taxidermy DIY occupy.

Beard forage post-ironic farm-to-table blog actually. Put a bird on it Echo Park cliche, PBR cronut banh mi raw denim jean shorts XOXO cold-pressed whatever lo-fi paleo health goth. Flexitarian salvia before they sold out McSweeney's, Godard distillery craft beer flannel selfies. PBR swag tofu street art. Truffaut sriracha leggings literally, PBR&amp;B High Life freegan tousled vinyl. PBR&amp;B swag four dollar toast kitsch literally seitan, taxidermy scenester asymmetrical migas Kickstarter ethical. Tilde selfies Odd Future leggings pug locavore shabby chic, heirloom drinking vinegar bicycle rights.

Tilde PBR&amp;B aesthetic whatever. Sriracha deep v hella, trust fund occupy PBR craft beer selfies literally. Helvetica tote bag Cosby sweater pork belly. Meggings pickled Odd Future, Godard seitan sustainable Vice skateboard chillwave trust fund gastropub food truck. Kickstarter art party skateboard, keffiyeh meditation next level put a bird on it. Sartorial artisan organic gluten-free, small batch polaroid pour-over. Shoreditch wolf Banksy Thundercats Intelligentsia, lo-fi fanny pack gastropub squid pour-over seitan 8-bit cornhole
            </xsl:text>
	  </fo:block>
        </fo:flow>


      </fo:page-sequence>

    </fo:root>
  </xsl:template>


</xsl:stylesheet>
