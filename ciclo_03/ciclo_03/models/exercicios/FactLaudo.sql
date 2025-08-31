
with exame_laudo_xml as (
	select 
		row_number() over() as id_paciente,
		regexp_replace(replace(exame, '''', '"'), '0+', '')::json->>'codigoExame' as id_exame,
		replace("medicoSolicitante", '''', '"')::json->>'codigo' as id_medico,
		convert_from(decode("laudoXml", 'base64'), 'UTF-8')::xml as laudo
	from {{ source('StgLaudo', 'laudos') }}--"ciclo_03_StgReviews".laudos
),
exame_laudo_clinico_xml as (
	select
		l.id_exame,
		l.id_medico,
		l.id_paciente,
	    x.dt_entrada,
	    x.dt_saida,
	    x.tipo,
	    x.versao,
	    x.dados_clinicos
	from exame_laudo_xml as l,
		xmltable(
	    	'/Laudo'
		    passing laudo
		    columns
		    	dt_entrada date path 'DT_Entrada',
		        dt_saida date path 'DT_Saida',
		        tipo int path 'Tipo',
		        versao int path 'Versao',
		        dados_clinicos xml path 'Dados_Clinicos'
	) as x
),
exame_laudo as (
	select 
		row_number() over() as id_laudo,
		id_exame,
		id_paciente,
		dt_entrada,
		dt_saida,
		id_medico,
		tipo,
		versao,
		diagnostica,
		sintomas,
		tratamento
	from exame_laudo_clinico_xml,
		xmltable(
			'/root/Dados_Clinicos'
			passing xmlelement(name root, dados_clinicos)
			columns 
				diagnostica text path 'Diagnostica',
				sintomas text path 'Sintomas',
				tratamento text path 'Tratamento'
		) as x
)
select 
	id_laudo,
	id_exame,
	id_paciente,
	id_medico,
	tipo,
	versao,
	dt_entrada,
	dt_saida,
	diagnostica,
	sintomas,
	tratamento
from exame_laudo