<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html><body>
<table>
<tr><th>First-Name</th>
<th>Name</th></tr>
<xsl:for-each select="/Result/Document">
<tr><td><xsl:value-of select="@First-Name"/></td>
<td><xsl:value-of select="@Name"/></td></tr>
</xsl:for-each>
</table>
</body></html>
</xsl:template>
</xsl:stylesheet>

