<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" omit-xml-declaration="yes" standalone="yes" />
<xsl:template match="/">
<table>
<tr><th>First-Name</th>
<th>Name</th></tr>
<xsl:for-each select="/Result/Document">
<tr><td><xsl:value-of select="@First-Name"/></td>
<td><xsl:value-of select="@Name"/></td></tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>

