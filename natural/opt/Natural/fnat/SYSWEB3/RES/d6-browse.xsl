<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" omit-xml-declaration="yes" standalone="yes" />
<xsl:template match="/">
<table border='0' cellspacing='3' cellpadding='3' align='center'>
<tr class="top">
<th>ID</th>
<th>Name</th>
<th nowrap='nowrap'>First-Name</th>
<th>Department</th>
<th nowrap='nowrap'>Area-Code</th>
<th>Phone</th>
</tr>
<xsl:for-each select="Result/Employee">
<tr>
<xsl:if test="position() mod 2 = 0">
  <xsl:attribute name="class">gray</xsl:attribute>
</xsl:if>
<td nowrap='nowrap'><a><xsl:attribute name="href">d6index?TODO=SHOW&#38;FROM=$FROM$&#38;TO=$TO$&#38;START=$START$&#38;ID=<xsl:value-of select="@Personnel-ID"/></xsl:attribute><xsl:value-of select="@Personnel-ID"/></a></td>
<td nowrap='nowrap'><xsl:value-of select="Full-Name/Name"/></td>
<td nowrap='nowrap'><xsl:value-of select="Full-Name/First-Name"/></td>
<td><xsl:value-of select="Dept"/></td>
<td><xsl:value-of select="Telephone/Area-Code"/></td>
<td nowrap='nowrap'><xsl:value-of select="Telephone/Phone"/></td>
</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>
