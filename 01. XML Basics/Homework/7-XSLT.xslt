<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
      <html>
        <h1>List of all students</h1>
        <table border="1" cellspacing="0" cellpadding="5">
          <tr>
            <th>Name</th>
            <th>Sex</th>
            <th>Birth Date</th>
            <th>Phone</th>
            <th>E-mail</th>
            <th>Course</th>
            <th>Specialty</th>
            <th>Faculty Number</th>
            <th>Exam name</th>
            <th>Exam tutor</th>
            <th>Exam score</th>
          </tr>
          <xsl:for-each select="/students/student">
            <tr>
              <td><xsl:value-of select="name"/></td>
              <td>
                <xsl:value-of select="sex"/>
              </td>
              <td>
                <xsl:value-of select="birthDate"/>
              </td>
              <td>
                <xsl:value-of select="phone"/>
              </td>
              <td>
                <xsl:value-of select="email"/>
              </td>
              <td>
                <xsl:value-of select="course"/>
              </td>
              <td>
                <xsl:value-of select="specialty"/>
              </td>
              <td>
                <xsl:value-of select="facultyNumber"/>
              </td>
              <td colspan="3" style="padding:0">
                  <table width="100%" border="1" cellspacing="0" cellpadding="2">
                    <xsl:for-each select="exams/exam">
                    <tr>
                      <td width="33%">
                        <xsl:value-of select="name"/>
                      </td>
                      <td width="33%">
                        <xsl:value-of select="tutor"/>
                      </td>
                      <td width="33%">
                        <xsl:value-of select="score"/>
                      </td>
                    </tr>
                    </xsl:for-each>
                  </table>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </html>
    </xsl:template>
</xsl:stylesheet>
