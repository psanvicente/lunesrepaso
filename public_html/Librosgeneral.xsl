<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     <xsl:output method="html"/>
<xsl:template match="/"> 
    
 <html>
 <head>
	<link rel="stylesheet" type="text/css" href="estilo.css"/>
	<title>Ejemplo de XSLT usando todo tipo de condiciones</title>
  </head>
 <body>
   <h1>Mis Libros</h1>
   <h2> Biblioteca IES Trassierra </h2>
   
   <table class="cabecera">
                    <td>
                        <img src="imagenes/biblioteca.jpg" id="left"/>
                    </td>
                 
                    <td>
                        <img src="imagenes/escudoTrassierra.png" id="right"/>
                    </td>
   </table>
   
             
      <div id="centrar">          
                  <table id="principal" border="1">
                        <th>Título </th>
                <th> Autor </th>
                <th> ISBN</th>
                <th> Precio </th>
                      
   <xsl:for-each select="libros">
                    <xsl:variable name="numero" select="count(libro)"/>
                    <xsl:variable name="preciomedio" select="sum(//precio) div $numero"/>
          <xsl:for-each select="libro">
              <xsl:sort select='titulo' data-type='text'/>
             <xsl:if test="precio &lt; $preciomedio "> 
               <!--<xsl:choose>
                                
                                <xsl:when test="precio>30">-->
	                <tr>
                           
                                <td class="libros"><xsl:value-of select="titulo"/></td>
                                <td class="libros"><xsl:value-of select="autor"/></td>
                                <td class="libros"><xsl:value-of select="isbn"/></td>
                                 <td class="libros"><xsl:value-of select="precio"/></td>
                        </tr>
                        
                        
                        
                        
                                                       

                 <!-- </xsl:choose>-->

         </xsl:if> 
        </xsl:for-each>
                 
        
    
                         <tr>
                            <td></td>
                            <td></td>
                            <td class="libros">Número de Libros</td>
                            <td class="valores">
                                <xsl:value-of select="format-number($numero, '##,##')"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td class="libros">Media de Libros</td>
                            <td class="valores"><xsl:value-of select="format-number($preciomedio, '##,##')"/></td>
                        </tr>
      </xsl:for-each>  
                  </table>   
                  </div>
 </body>
 </html>
</xsl:template> 
</xsl:stylesheet>  