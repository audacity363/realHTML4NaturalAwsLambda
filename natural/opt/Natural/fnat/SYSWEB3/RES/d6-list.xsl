<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" omit-xml-declaration="yes" standalone="yes" />
<xsl:template match="/">
<table border='0' cellspacing='3' cellpadding='3'>
<tr class='top'>
<th nowrap='nowrap'>Personel-ID</th>
<th nowrap='nowrap'>First-Name</th>
<th nowrap='nowrap'>Name</th>
<th>Sex</th>
<th>Birth</th>
<th>Country</th>
<th>Zip</th>
<th>City</th>
<th nowrap='nowrap'>Area-Code</th>
<th>Phone</th>
<th>Department</th>
</tr>
<xsl:for-each select="Result/Employee">
<tr>
<xsl:if test="position() mod 2 = 0">
  <xsl:attribute name="class">gray</xsl:attribute>
</xsl:if>
<td nowrap='nowrap'><xsl:value-of select="@Personnel-ID"/></td>
<td nowrap='nowrap'><xsl:value-of select="Full-Name/First-Name"/></td>
<td nowrap='nowrap'><xsl:value-of select="Full-Name/Name"/></td>
<td><xsl:value-of select="Sex"/></td>
<td nowrap='nowrap'><xsl:value-of select="Birth"/></td>
<td><xsl:value-of select="Full-Address/Country"/></td>
<td nowrap='nowrap'><xsl:value-of select="Full-Address/Zip"/></td>
<td><xsl:value-of select="Full-Address/City"/></td>
<td><xsl:value-of select="Telephone/Area-Code"/></td>
<td nowrap='nowrap'><xsl:value-of select="Telephone/Phone"/></td>
<td><xsl:value-of select="Dept"/></td>
</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
