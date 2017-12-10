ALTER Procedure [dbo].[sp_BuscarDestino]
@P_vcCodFiltro	Varchar(200)
As
BEGIN
	Select	top 100 d.dist_ID As 'CodDistrito', p.prov_ID As 'CodProvincia', de.dep_ID As 'CodDepartamento',
			de.dep_Nombre + ' - ' + p.prov_Nombre + ' - ' + d.dist_Nombre As 'Nombre'
	From tbl_distrito d
	Inner Join tbl_provincia p ON d.dist_prov = p.prov_ID
	Inner Join tbl_departamento de ON p.prov_Dep = de.dep_ID
	Where (de.dep_Nombre Like '%' + @P_vcCodFiltro + '%' 
	OR p.prov_Nombre Like '%' + @P_vcCodFiltro + '%'
	OR d.dist_Nombre Like '%' + @P_vcCodFiltro + '%')
END

