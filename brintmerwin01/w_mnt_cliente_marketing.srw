HA$PBExportHeader$w_mnt_cliente_marketing.srw
$PBExportComments$Ventana de Administracion de Clientes Datos generales, Datos de marketing, Sucursales, Contactos, Contactos Empleados, Visitas, proyectos, reclamos, Servicios, Numero de empleados, ingresos, pcs
forward
global type w_mnt_cliente_marketing from w_mnt_std
end type
type tab_1 from tab within w_mnt_cliente_marketing
end type
type tp_1 from userobject within tab_1
end type
type gb_1 from groupbox within tp_1
end type
type dw_1 from uo_dw_std within tp_1
end type
type dw_10 from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
gb_1 gb_1
dw_1 dw_1
dw_10 dw_10
end type
type tp_2 from userobject within tab_1
end type
type dw_2 from uo_dw_std within tp_2
end type
type tp_2 from userobject within tab_1
dw_2 dw_2
end type
type tp_3 from userobject within tab_1
end type
type dw_3 from uo_dw_std within tp_3
end type
type tp_3 from userobject within tab_1
dw_3 dw_3
end type
type tp_4 from userobject within tab_1
end type
type dw_4 from uo_dw_std within tp_4
end type
type tp_4 from userobject within tab_1
dw_4 dw_4
end type
type tp_5 from userobject within tab_1
end type
type dw_12 from uo_dw_std within tp_5
end type
type dw_5 from uo_dw_std within tp_5
end type
type tp_5 from userobject within tab_1
dw_12 dw_12
dw_5 dw_5
end type
type tp_6 from userobject within tab_1
end type
type dw_6 from uo_dw_std within tp_6
end type
type tp_6 from userobject within tab_1
dw_6 dw_6
end type
type tp_7 from userobject within tab_1
end type
type dw_7 from uo_dw_std within tp_7
end type
type tp_7 from userobject within tab_1
dw_7 dw_7
end type
type tp_8 from userobject within tab_1
end type
type dw_8 from uo_dw_std within tp_8
end type
type tp_8 from userobject within tab_1
dw_8 dw_8
end type
type tp_9 from userobject within tab_1
end type
type dw_9 from uo_dw_std within tp_9
end type
type tp_9 from userobject within tab_1
dw_9 dw_9
end type
type tp_11 from userobject within tab_1
end type
type dw_17 from uo_dw_std within tp_11
end type
type dw_11 from uo_dw_std within tp_11
end type
type tp_11 from userobject within tab_1
dw_17 dw_17
dw_11 dw_11
end type
type tp_12 from userobject within tab_1
end type
type dw_13 from uo_dw_std within tp_12
end type
type tp_12 from userobject within tab_1
dw_13 dw_13
end type
type tp_13 from userobject within tab_1
end type
type tab_facturacion from tab within tp_13
end type
type tp_1f from userobject within tab_facturacion
end type
type dw_15 from uo_dw_std within tp_1f
end type
type dw_14 from uo_dw_std within tp_1f
end type
type tp_1f from userobject within tab_facturacion
dw_15 dw_15
dw_14 dw_14
end type
type tp_2f from userobject within tab_facturacion
end type
type dw_16 from uo_dw_std within tp_2f
end type
type tp_2f from userobject within tab_facturacion
dw_16 dw_16
end type
type tab_facturacion from tab within tp_13
tp_1f tp_1f
tp_2f tp_2f
end type
type tp_13 from userobject within tab_1
tab_facturacion tab_facturacion
end type
type tp_20 from userobject within tab_1
end type
type dw_20 from uo_dw_std within tp_20
end type
type tp_20 from userobject within tab_1
dw_20 dw_20
end type
type tp_14 from userobject within tab_1
end type
type dw_18 from uo_dw_std within tp_14
end type
type tp_14 from userobject within tab_1
dw_18 dw_18
end type
type tp_21 from userobject within tab_1
end type
type dw_19 from uo_dw_std within tp_21
end type
type tp_21 from userobject within tab_1
dw_19 dw_19
end type
type tab_1 from tab within w_mnt_cliente_marketing
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
tp_6 tp_6
tp_7 tp_7
tp_8 tp_8
tp_9 tp_9
tp_11 tp_11
tp_12 tp_12
tp_13 tp_13
tp_20 tp_20
tp_14 tp_14
tp_21 tp_21
end type
end forward

global type w_mnt_cliente_marketing from w_mnt_std
integer width = 3730
integer height = 2288
event ue_acceso_usuario ( )
event ue_acceso_corporativo_sapcrm ( )
tab_1 tab_1
end type
global w_mnt_cliente_marketing w_mnt_cliente_marketing

type variables
st_cliente ist_cliente
boolean i_pv[14] = {false,false,false,false,false,false,false,false,false,false,false,false,false,false}
uo_cliente io_cliente
integer ii_permiso_ide, ii_permiso_dir, ii_permiso_seg, ii_permiso_med, ii_permiso_cnt,ii_permiso_est_aten
datawindowchild idwc_subcategoria

//ini sapcrm
boolean lb_corporativo_sap,ib_insertar_sapcrm
//fin sapcrm

//Estructura Atencion - Datos Marketing
//[0]= Estructura, [1]= Datos Marketing
datawindowchild idwc_subrango
boolean i_estados_eadm[2] = {false,false}
long ii_idcanalventa_nuevo,ii_idcanalventa_anterior
end variables
event ue_acceso_usuario();string ls_clase
integer li_permiso

ls_clase = tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'tipcli')

CHOOSE CASE ii_tipo
   case 2,3,4 
		// Identificaci$$HEX1$$f300$$ENDHEX$$n
		if tab_1.tp_1.dw_1.rowcount() > 0 then
				select PQ_ACCESO.F_BLOQUEA_EDICION(1,:ls_clase,user) into :ii_permiso_ide from dual;
			if ii_permiso_ide = 1 then
					tab_1.tp_1.dw_1.object.DataWindow.ReadOnly="Yes"
			end if 
		end if 
		// Direcci$$HEX1$$f300$$ENDHEX$$n      
		if tab_1.tp_1.dw_1.rowcount() > 0 then
				select PQ_ACCESO.F_BLOQUEA_EDICION(2,:ls_clase,user) into :ii_permiso_dir from dual;
		   if ii_permiso_dir = 1 then
					tab_1.tp_1.dw_1.object.p_buscar.visible = false
					tab_1.tp_4.dw_4.object.DataWindow.ReadOnly="Yes"					
			end if 
		end if
		// Rubro / Segmentaci$$HEX1$$f300$$ENDHEX$$n
		if tab_1.tp_1.dw_1.rowcount() > 0 then
				select PQ_ACCESO.F_BLOQUEA_EDICION(3,:ls_clase,user) into :ii_permiso_seg from dual;
			if ii_permiso_seg = 1 then
					tab_1.tp_2.dw_2.object.DataWindow.ReadOnly="Yes"
					tab_1.tp_2.dw_2.object.b_codect.visible=false
					tab_1.tp_2.dw_2.object.b_codsocio.visible=false
					tab_1.tp_2.dw_2.object.b_codecttel.visible=false					
					tab_1.tp_2.dw_2.object.b_codectmnt.visible=false										
					tab_1.tp_2.dw_2.object.b_pais.visible=false										
					tab_1.tp_2.dw_2.object.b_grupoecon.visible=false										
					tab_1.tp_2.dw_2.object.b_zona.visible=false											
					tab_1.tp_2.dw_2.object.b_pop.visible=false	
					tab_1.tp_2.dw_2.object.b_idae.visible=false					
					tab_1.tp_2.dw_2.object.b_idnatjur.visible=false										
			end if 
		end if 		
		// Medios de Comunicaci$$HEX1$$f300$$ENDHEX$$n
		if tab_1.tp_1.dw_1.rowcount() > 0 then
				select PQ_ACCESO.F_BLOQUEA_EDICION(4,:ls_clase,user) into :ii_permiso_med from dual;
			if ii_permiso_med = 1 then
					tab_1.tp_6.dw_6.object.DataWindow.ReadOnly="Yes"
			end if 
		end if 		
		// Contacto
		if tab_1.tp_1.dw_1.rowcount() > 0 then
				select PQ_ACCESO.F_BLOQUEA_EDICION(5,:ls_clase,user) into :ii_permiso_cnt from dual;
			if ii_permiso_cnt = 1 then
					tab_1.tp_5.dw_5.object.DataWindow.ReadOnly="Yes"
			end if 
		end if
		//Estructura de Atencion
		if tab_1.tp_1.dw_1.rowcount() > 0 then
			select PQ_ACCESO.F_BLOQUEA_EDICION(6,:ls_clase,user) into :ii_permiso_est_aten from dual;
			
			if ii_permiso_est_aten = 1 then
					tab_1.tp_21.dw_19.object.DataWindow.ReadOnly="Yes"
					tab_1.tp_21.dw_19.insertar = false					
					tab_1.tp_21.dw_19.borrar = false
					tab_1.tp_21.dw_19.guardar = false	
			end if			
		end if
End Choose
      
end event

event ue_acceso_corporativo_sapcrm();//ini sapcrm

string ls_cliente
boolean lb_permiso_sapcrm
ls_cliente = ist_par.parstring1
lb_corporativo_sap = f_valida_corporativo_sapcrm(ls_cliente)

lb_permiso_sapcrm = true
if lb_corporativo_sap then

	//identificacion
	tab_1.tp_1.dw_1.object.DataWindow.ReadOnly="No"
	//direccion
	tab_1.tp_1.dw_1.object.p_buscar.visible = true
	tab_1.tp_4.dw_4.object.DataWindow.ReadOnly="No"
	//segmentacion
	tab_1.tp_2.dw_2.object.DataWindow.ReadOnly="No"
	tab_1.tp_2.dw_2.object.b_codect.visible=true
	tab_1.tp_2.dw_2.object.b_codsocio.visible=true
	tab_1.tp_2.dw_2.object.b_codecttel.visible=true					
	tab_1.tp_2.dw_2.object.b_codectmnt.visible=true										
	tab_1.tp_2.dw_2.object.b_pais.visible=true										
	tab_1.tp_2.dw_2.object.b_grupoecon.visible=true										
	tab_1.tp_2.dw_2.object.b_zona.visible=true											
	tab_1.tp_2.dw_2.object.b_pop.visible=true	
	tab_1.tp_2.dw_2.object.b_idae.visible=true					
	tab_1.tp_2.dw_2.object.b_idnatjur.visible=true	
	//medios de comunicacion
	tab_1.tp_6.dw_6.object.DataWindow.ReadOnly="No"
	//contactos
	tab_1.tp_5.dw_5.object.DataWindow.ReadOnly="No"

	CHOOSE CASE ii_tipo
		case 2 /*ADMINISTRACION BD CLIENTES*/,3 /*SUPERVISORES DE VENTAS*/,4 /*EJECUTIVOS DE CUENTA*/
		//Datos Generales
         tab_1.tp_1.dw_1.object.CODCLI.protect = 1   
         tab_1.tp_1.dw_1.object.TIPCLI.protect = 0   
         tab_1.tp_1.dw_1.object.TIPDIDE.protect = 1   
         tab_1.tp_1.dw_1.object.NOMCLI.protect = 1   
         tab_1.tp_1.dw_1.object.NOMABR.protect = 1   
         tab_1.tp_1.dw_1.object.NTDIDE.protect = 1   
         tab_1.tp_1.dw_1.object.OBSCLI.protect = 1   
         tab_1.tp_1.dw_1.object.TIPPER.protect = 1   
         tab_1.tp_1.dw_1.object.NOMBRE.protect = 1   
         tab_1.tp_1.dw_1.object.APEPAT.protect = 1   
         tab_1.tp_1.dw_1.object.APMAT.protect = 1   
         tab_1.tp_1.dw_1.object.CODCLIPADRE.protect = 1   
         tab_1.tp_1.dw_1.object.FLGPG.protect = 1   
         tab_1.tp_1.dw_1.object.IDESTADO.protect = 1   
         tab_1.tp_1.dw_1.object.FLG_ACTUAL.protect = 1   
         tab_1.tp_1.dw_1.object.FLG_USUARIO.protect = 1   
         tab_1.tp_1.dw_1.object.FLG_PROSPECTO.protect = 1   
         //tab_1.tp_1.dw_1.object.IDESTATUS.protect = 1   
         tab_1.tp_1.dw_1.object.NTDIDE_COMP.protect = 1   
         tab_1.tp_1.dw_1.object.dia.protect = 0
         tab_1.tp_1.dw_1.object.mes.protect = 0
         tab_1.tp_1.dw_1.object.anno.protect = 0
		tab_1.tp_1.dw_1.object.TIPO_ENTIDAD.protect = 0 			
         tab_1.tp_1.dw_1.object.ID_MOTIVO_MODIF.protect = 0
		tab_1.tp_1.dw_1.object.GIRCOM.protect = 1
		tab_1.tp_1.dw_1.object.nomcli_padre.protect = 1
         tab_1.tp_1.dw_1.object.FLGPG.protect = 1
		tab_1.tp_1.dw_1.Object.b_matriz.SuppressEventProcessing="Yes"
		tab_1.tp_1.dw_1.Object.p_buscar.SuppressEventProcessing="Yes"
		tab_1.tp_1.dw_1.Object.b_matriz.Enabled='No'
		tab_1.tp_1.dw_1.Object.p_buscar.Enabled='No'
		
		 tab_1.tp_1.dw_1.object.CODCLI.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.TIPDIDE.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.NOMCLI.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.NOMABR.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.NTDIDE.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.OBSCLI.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.TIPPER.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.NOMBRE.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.APEPAT.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.APMAT.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.CODCLIPADRE.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.FLGPG.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.IDESTADO.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.FLG_ACTUAL.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.FLG_USUARIO.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.FLG_PROSPECTO.Background.Color=string(rgb(192,192,192))
		//tab_1.tp_1.dw_1.object.IDESTATUS.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.NTDIDE_COMP.Background.Color=string(rgb(192,192,192))
		tab_1.tp_1.dw_1.object.GIRCOM.Background.Color=string(rgb(192,192,192))
		tab_1.tp_1.dw_1.object.nomcli_padre.Background.Color=string(rgb(192,192,192))
         tab_1.tp_1.dw_1.object.FLGPG.Background.Color=string(rgb(192,192,192))
		tab_1.tp_1.dw_1.object.tipo_entidad.Background.Color=string(rgb(192,192,192))
		
		//Datos de Marketing		
		tab_1.tp_2.dw_2.object.sucursales.protect = 0
         tab_1.tp_2.dw_2.object.NUMSUCUR.protect = 1   
         tab_1.tp_2.dw_2.object.CODGIRMARK.protect = 1   
         tab_1.tp_2.dw_2.object.CODSECMARK.protect = 1   
         tab_1.tp_2.dw_2.object.CODSEGMARK.protect = 1   
         tab_1.tp_2.dw_2.object.TIPEMP.protect = 0   
         tab_1.tp_2.dw_2.object.IDCATEGORIA.protect = 1   
         tab_1.tp_2.dw_2.object.IDSUBCAT.protect = 1   
         tab_1.tp_2.dw_2.object.NUMSUCPRO.protect = 1   
         tab_1.tp_2.dw_2.object.NUMSUCINT.protect = 1   
         tab_1.tp_2.dw_2.object.ON_NET.protect = 0   
         tab_1.tp_2.dw_2.object.CENSO.protect = 0   
         tab_1.tp_2.dw_2.object.CODTAM.protect = 1   
		tab_1.tp_2.dw_2.object.flg_servicio.protect = 0   
		tab_1.tp_2.dw_2.object.sit_crediticia.protect = 1  	

         tab_1.tp_2.dw_2.object.NUMSUCUR.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.CODGIRMARK.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.CODSECMARK.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.CODSEGMARK.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.IDCATEGORIA.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.IDSUBCAT.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.NUMSUCPRO.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.NUMSUCINT.Background.Color=string(rgb(192,192,192))	
         tab_1.tp_2.dw_2.object.CODTAM.Background.Color=string(rgb(192,192,192))	
		tab_1.tp_2.dw_2.object.sit_crediticia.Background.Color=string(rgb(192,192,192))		
         //tab_1.tp_2.dw_2.object.idestatus.Background.Color=string(rgb(192,192,192))
         //tab_1.tp_2.dw_2.object.iddecision.Background.Color=string(rgb(192,192,192))
         //tab_1.tp_2.dw_2.object.gtsegmentationid.Background.Color=string(rgb(192,192,192))
        	//tab_1.tp_2.dw_2.object.codcuenta.Background.Color=string(rgb(192,192,192))
         tab_1.tp_2.dw_2.object.desc_idae.Background.Color=string(rgb(192,192,192))
         //tab_1.tp_2.dw_2.object.desc_idnatjur.Background.Color=string(rgb(192,192,192))
			
		//tab_1.tp_2.dw_2.Object.b_pais.SuppressEventProcessing="Yes"
		//tab_1.tp_2.dw_2.Object.b_pais.Enabled='No'
		//tab_1.tp_2.dw_2.Object.b_grupoecon.SuppressEventProcessing="Yes"
		//tab_1.tp_2.dw_2.Object.b_grupoecon.Enabled='No'
		tab_1.tp_2.dw_2.Object.b_zona.SuppressEventProcessing="Yes"
		tab_1.tp_2.dw_2.Object.b_zona.Enabled='No'
		//tab_1.tp_2.dw_2.Object.b_pop.SuppressEventProcessing="No"
		//tab_1.tp_2.dw_2.Object.b_pop.Enabled='Yes'
		//tab_1.tp_2.dw_2.Object.b_pais.SuppressEventProcessing="Yes"
		//tab_1.tp_2.dw_2.Object.b_pais.Enabled='No'		
		tab_1.tp_2.dw_2.Object.b_idae.SuppressEventProcessing="Yes"
		tab_1.tp_2.dw_2.Object.b_idae.Enabled='No'		
		//tab_1.tp_2.dw_2.Object.b_idnatjur.SuppressEventProcessing="Yes"
		//tab_1.tp_2.dw_2.Object.b_idnatjur.Enabled='No'		
		
		//Ingresos, empleados y PC
		tab_1.tp_3.dw_3.object.DataWindow.ReadOnly="No"
		tab_1.tp_3.dw_3.insertar = true

		//Sucursales y cobertura
		tab_1.tp_4.dw_4.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_4.dw_4.insertar = false		
		tab_1.tp_4.dw_4.borrar = false
		
		//Contactos empleado
		tab_1.tp_5.dw_5.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_5.dw_5.insertar = false	
		tab_1.tp_5.dw_5.borrar = false
		tab_1.tp_5.dw_12.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_5.dw_12.insertar = false	
		tab_1.tp_5.dw_12.borrar = false
		
		//Medios de comunicacion
		tab_1.tp_6.dw_6.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_6.dw_6.insertar = false					
		tab_1.tp_6.dw_6.borrar = false
		
		//Estructura de atencion
		tab_1.tp_21.dw_19.Object.DataWindow.ReadOnly="Yes"
		tab_1.tp_21.dw_19.insertar = false	
		tab_1.tp_21.dw_19.borrar = false
		//tab_1.tp_21.dw_19.Object.b_codect.SuppressEventProcessing="Yes"
		//tab_1.tp_21.dw_19.Object.b_codect.Enabled='No'				

		m_mnt_std.m_funciones.m_insertar_detalle.enabled = false
		m_mnt_std.m_funciones.m_suprimir_detalle.enabled = false
		m_mnt_std.m_funciones.enabled = false		
		m_mnt_std.m_archivo.m_borrar.enabled = false
//		m_mnt_std.m_archivo.m_grabar.enabled = false
		m_mnt_std.m_archivo.m_nuevo.enabled = false		

		case 5	// CONSULTA
			dw_maestro.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_1.dw_1.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_2.dw_2.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_3.dw_3.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_3.dw_3.insertar = false

			tab_1.tp_4.dw_4.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_4.dw_4.insertar = false
			
			tab_1.tp_6.dw_6.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_6.dw_6.insertar = false
			tab_1.tp_21.dw_19.object.DataWindow.ReadOnly="Yes"
			tab_1.tp_21.dw_19.insertar = false
	END CHOOSE

lb_permiso_sapcrm = false

end if;

ib_insertar_sapcrm = lb_permiso_sapcrm
//fin sapcrm
end event

on w_mnt_cliente_marketing.create
int iCurrent
call super::create
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
end on

on w_mnt_cliente_marketing.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_1)
end on

event open;call super::open;io_cliente = create uo_cliente
	
//Objetos Personalizados
if gsPais = 'BRA' then
	if ii_tipo = 3 then // Se personaliza dw para opcion Sup. Vta. MAH 12/08/2004
		tab_1.tp_1.dw_1.DataObject = 'dw_ff_cliente_general_supvta_cusbra'
	else
		tab_1.tp_1.dw_1.DataObject = 'dw_ff_cliente_general_cusbra'
	end if
	tab_1.tp_2.dw_2.DataObject = 'dw_ff_cliente_marketing_cusbra'			
end if
// Peru
if gsPais='PER' or gsPais = 'CHI' then // se pucho CHI por el gb_matriz
	tab_1.tp_9.visible = false
	tab_1.tp_1.dw_1.object.gb_matriz.visible = 0
	tab_1.tp_1.dw_1.object.codclipadre.visible = 0
	tab_1.tp_1.dw_1.object.t_nomclipadre.visible = 0
	tab_1.tp_20.visible = true
	tab_1.tp_1.dw_1.object.p_buscar.visible = false // para prueba
end if

tab_1.tp_1.dw_1.triggerevent("ue_ini_dw")
tab_1.tp_2.dw_2.triggerevent("ue_ini_dw")
tab_1.tp_3.dw_3.triggerevent("ue_ini_dw")
tab_1.tp_4.dw_4.triggerevent("ue_ini_dw")
tab_1.tp_5.dw_5.triggerevent("ue_ini_dw")
tab_1.tp_6.dw_6.triggerevent("ue_ini_dw")
tab_1.tp_7.dw_7.triggerevent("ue_ini_dw")
tab_1.tp_8.dw_8.triggerevent("ue_ini_dw")
tab_1.tp_9.dw_9.triggerevent("ue_ini_dw")
tab_1.tp_11.dw_11.triggerevent("ue_ini_dw")
tab_1.tp_5.dw_12.triggerevent("ue_ini_dw")
tab_1.tp_12.dw_13.triggerevent("ue_ini_dw")
tab_1.tp_13.tab_facturacion.tp_1f.dw_14.triggerevent("ue_ini_dw")
tab_1.tp_13.tab_facturacion.tp_1f.dw_15.triggerevent("ue_ini_dw")
tab_1.tp_13.tab_facturacion.tp_2f.dw_16.triggerevent("ue_ini_dw")
tab_1.tp_11.dw_17.triggerevent("ue_ini_dw")
tab_1.tp_20.dw_20.triggerevent("ue_ini_dw")
tab_1.tp_14.dw_18.triggerevent("ue_ini_dw")
//ini sapcrm
tab_1.tp_21.dw_19.triggerevent("ue_ini_dw")
//fin sapcrm

if isvalid(ist_par) then
	ist_cliente.codcli = ist_par.parstring1
	ist_cliente.codclipadre = ist_par.parstring2
	ist_cliente.tipo_entidad = ist_par.parinteger1
	if ist_cliente.codcli="" then	ist_cliente.codcli = "%%%%"
end if

CHOOSE CASE ii_tipo
	case 2  // ADMINISTRACION BD CLIENTES
		tab_1.tp_3.dw_3.guardar = true
		tab_1.tp_3.dw_3.insertar = true
		tab_1.tp_3.dw_3.borrar = true
			
	case 3  // SUPERVISORES DE VENTAS
		if gsPais = 'BRA' then // Se personaliza dw para opcion Sup. Vta. MAH 12/08/2004
			tab_1.tp_1.dw_1.enabled = true
		else
			tab_1.tp_1.dw_1.enabled = false
		end if
		tab_1.tp_3.dw_3.enabled = false
		tab_1.tp_2.dw_2.object.tipemp.protect = 1
		tab_1.tp_2.dw_2.object.codpai.protect = 1		
		tab_1.tp_2.dw_2.object.idgrupo.protect = 1
		if gsPais='BRA' then
			tab_1.tp_2.dw_2.object.codzona.protect = 1						
			tab_1.tp_2.dw_2.object.codsegmark.protect = 1								
		end if
		tab_1.tp_2.dw_2.object.codgirmark.protect = 1								
		tab_1.tp_2.dw_2.object.codsecmark.protect = 1
		tab_1.tp_2.dw_2.object.idestatus.protect = 1								
	   tab_1.tp_2.dw_2.object.pop.protect = 1
		tab_1.tp_2.dw_2.object.censo.protect = 1		
		tab_1.tp_2.dw_2.object.on_net.protect = 1		
		tab_1.tp_2.dw_2.object.flg_servicio.protect = 1				
		tab_1.tp_2.dw_2.object.iddecision.protect = 1						
		tab_1.tp_2.dw_2.object.gtsegmentationid.protect = 1								
		tab_1.tp_2.dw_2.object.codtam.protect = 1		
		tab_1.tp_2.dw_2.object.numsucur.protect = 1						
		tab_1.tp_2.dw_2.object.numsucpro.protect = 1								
		tab_1.tp_2.dw_2.object.numsucint.protect = 1				
		
	case 4 // EJECUTIVOS DE CUENTA
		tab_1.tp_1.dw_1.enabled = false
		tab_1.tp_2.dw_2.enabled = false
		tab_1.tp_3.dw_3.enabled = false

	case 5	// CONSULTA
		dw_maestro.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_1.dw_1.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_2.dw_2.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_3.dw_3.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_3.dw_3.insertar = false
		tab_1.tp_6.dw_6.object.DataWindow.ReadOnly="Yes"
		tab_1.tp_6.dw_6.insertar = false
END CHOOSE
end event

event ue_menu_buscar;integer li_resp
if tab_1.tp_1.dw_1.uf_ha_cambiado() or &
   tab_1.tp_2.dw_2.uf_ha_cambiado() or &
   tab_1.tp_3.dw_3.uf_ha_cambiado() or &
   tab_1.tp_5.dw_5.uf_ha_cambiado() or &
	tab_1.tp_7.dw_7.uf_ha_cambiado() then
	li_resp = MessageBox(gsNomApl,'$$HEX1$$bf00$$ENDHEX$$Desea grabar los cambios?',question!, YesNoCancel!, 1)
	If li_resp = 1 Then
		tab_1.tp_1.dw_1.trigger event ue_guardar(false)
		tab_1.tp_2.dw_2.trigger event ue_guardar(false)
		tab_1.tp_3.dw_3.trigger event ue_guardar(false)
		tab_1.tp_5.dw_5.trigger event ue_guardar(false)
		tab_1.tp_7.dw_7.trigger event ue_guardar(false)		
	elseif li_resp = 3 then
		return
	end if
end if
	ib_menu_buscar = true
	dw_maestro.triggerevent("ue_retrieve")
	i_pv = {false,false,false,false,false,false,false,false,false,false,false,false,false,false}
	if isvalid(ist_cliente) then
		choose case tab_1.SelectedTab
			case 2
				tab_1.tp_2.dw_2.retrieve(ist_cliente.codcli)
				i_pv[1] = true
			case 3
				tab_1.tp_3.dw_3.retrieve(ist_cliente.codcli)
				i_pv[2] = true
			case 4
				tab_1.tp_4.dw_4.retrieve(ist_cliente.codclipadre)
				i_pv[3] = true
			case 5
				tab_1.tp_5.dw_5.retrieve(ist_cliente.codclipadre)
				i_pv[4] = true
			case 6
				tab_1.tp_6.dw_6.retrieve(ist_cliente.codcli)
				i_pv[5] = true
			case 7
				tab_1.tp_7.dw_7.retrieve(ist_cliente.codcli)
				i_pv[6] = true
			case 8
				tab_1.tp_8.dw_8.retrieve(ist_cliente.codcli)
				i_pv[7] = true
			case 9
				tab_1.tp_9.dw_9.retrieve(ist_cliente.codcli)
				i_pv[8] = true
			case 10
				tab_1.tp_11.dw_11.retrieve(ist_cliente.codcli)
				i_pv[10] = true
			case 11
				tab_1.tp_12.dw_13.retrieve(ist_cliente.codcli)
				i_pv[11] = true
			case 12
				CHOOSE CASE tab_1.tp_13.tab_facturacion.selectedtab
					CASE 2
						tab_1.tp_13.tab_facturacion.tp_2f.dw_16.retrieve(ist_cliente.codcli)
						i_pv[13] = true
					CASE else //1
						tab_1.tp_13.tab_facturacion.tp_1f.dw_14.retrieve(ist_cliente.codcli)
						i_pv[12] = true
				END CHOOSE
			case 20
				tab_1.tp_20.dw_20.retrieve(ist_cliente.codcli)
				i_pv[14] = true
		end choose				
	end if

end event

event ue_menu_grabar;tab_1.tp_1.dw_1.accepttext()
tab_1.tp_2.dw_2.accepttext()
tab_1.tp_3.dw_3.accepttext()
tab_1.tp_6.dw_6.accepttext()
tab_1.tp_7.dw_7.accepttext()
tab_1.tp_1.dw_1.trigger event ue_guardar(false)
if i_pv[1] then tab_1.tp_2.dw_2.trigger event ue_guardar(false)
if i_pv[2] then tab_1.tp_3.dw_3.trigger event ue_guardar(false)
if i_pv[5] then tab_1.tp_6.dw_6.trigger event ue_guardar(false)
if i_pv[6] then tab_1.tp_7.dw_7.trigger event ue_guardar(false)

tab_1.tp_14.dw_18.trigger event ue_guardar(false)
//ini sapcrm
tab_1.tp_21.dw_19.trigger event ue_guardar(false)
//fin sapcrm


//Estructura Atencion - Datos Marketing
//Actualiza canal de venta con datos de estructura de atencion
if i_estados_eadm[1] and i_estados_eadm[2]=false and i_pv[1]=false then
update marketing.vtatabcli set idcanalventa = :ii_idcanalventa_nuevo where codcli = :ist_cliente.codcli;
end if
 i_estados_eadm = {false,false}
 

commit;

if SQLCA.sqlcode = 0 then
	dw_maestro.uf_resetupdate()
	f_msg('Se grabaron los datos.')
else
	f_msg_sqlerr(sqlca,true)
end if

tab_1.tp_1.dw_1.uf_resetupdate()
tab_1.tp_2.dw_2.uf_resetupdate()
tab_1.tp_3.dw_3.uf_resetupdate()
tab_1.tp_6.dw_6.uf_resetupdate()
tab_1.tp_7.dw_7.uf_resetupdate()
tab_1.tp_14.dw_18.uf_resetupdate()
//ini sapcrm
tab_1.tp_21.dw_19.uf_resetupdate()
//fin sapcrm

i_pv = {false,false,false,false,false,false,false,false,false,false,false,false,false,false}

this.postevent("ue_menu_refrescar")
end event

event ue_permisos_menu;		m_mnt_std.m_archivo.m_abrir.enabled = false
		m_mnt_std.m_archivo.m_borrar.enabled = false
		//Se incluye pais USA. MAH 06/07/2004
/*		if gsPais = 'BRA' then
			m_mnt_std.m_archivo.m_nuevo.enabled = false
		else
			m_mnt_std.m_archivo.m_nuevo.enabled = true
		end if*/
		m_mnt_std.m_archivo.m_nuevo.enabled = false
		
		m_mnt_std.m_archivo.m_buscar.enabled = false
		m_mnt_std.m_archivo.m_refrescar.enabled = true
		m_mnt_std.m_archivo.m_imprimir.enabled = true
	
		m_mnt_std.m_archivo.m_exportar.enabled = true
		
		m_mnt_std.m_funciones.enabled = true
			m_mnt_std.m_funciones.m_insertar_detalle.enabled = true
			m_mnt_std.m_funciones.m_suprimir_detalle.enabled = true
		m_mnt_std.m_funciones.m_filtrar.enabled = false
		m_mnt_std.m_funciones.m_ordenar.enabled = false
		
	if ii_tipo = 5 then
		m_mnt_std.m_archivo.m_grabar.enabled = false
	end if
end event

event closequery;integer li_resp
tab_1.tp_1.dw_1.accepttext()
tab_1.tp_2.dw_2.accepttext()
tab_1.tp_3.dw_3.accepttext()
tab_1.tp_6.dw_6.accepttext()
if tab_1.tp_1.dw_1.uf_ha_cambiado() or &
   tab_1.tp_2.dw_2.uf_ha_cambiado() or &
   tab_1.tp_3.dw_3.uf_ha_cambiado() or &
   tab_1.tp_6.dw_6.uf_ha_cambiado() or & 
   tab_1.tp_21.dw_19.uf_ha_cambiado() /*sapcrm*/then
	li_resp = MessageBox(gsNomApl,'$$HEX1$$bf00$$ENDHEX$$Desea grabar los cambios?',question!, YesNoCancel!, 1)
	If li_resp = 1 Then
		if tab_1.tp_1.dw_1.trigger event ue_guardar(false) and &
			tab_1.tp_2.dw_2.trigger event ue_guardar(false) and &
			tab_1.tp_3.dw_3.trigger event ue_guardar(false) and &
			tab_1.tp_6.dw_6.trigger event ue_guardar(false) and &
			tab_1.tp_21.dw_19.trigger event ue_guardar(false) /*sapcrm*/then
			
			commit;
			
			tab_1.tp_1.dw_1.uf_resetupdate()
			tab_1.tp_2.dw_2.uf_resetupdate()
			tab_1.tp_3.dw_3.uf_resetupdate()
			tab_1.tp_6.dw_6.uf_resetupdate()
			tab_1.tp_21.dw_19.uf_resetupdate() /*sapcrm*/
			return 0
		end if
	elseif li_resp = 3 then
		return 1
	end if
end if
return 0
end event

event close;call super::close;destroy io_cliente
end event

event ue_postopen;dw_maestro.trigger event ue_ini_dw()

//Creacion de Clientes. MAH 01/09/2004
if ist_par.nuevo then
	ist_cliente.codcli = ''
	tab_1.tp_1.dw_1.insertar = true
	tab_1.tp_1.dw_1.object.p_buscar.visible = true
	tab_1.tp_1.dw_1.triggerevent("ue_insertar")
else   
	this.post event ue_cargar()
end if	


this.post event ue_permisos()
this.post event ue_permisos_menu()
this.post event ue_acceso_usuario()

//ini sapcrm
//this.post event ue_acceso_corporativo_sapcrm()
//ini sapcrm



end event

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_cliente_marketing
integer width = 338
integer height = 360
integer taborder = 10
end type

event dw_maestro::ue_retrieve;if isvalid(ist_cliente) then
	tab_1.tp_1.dw_1.triggerevent("ue_retrieve")
end if
return 1
end event

event dw_maestro::ue_refrescar;long ll_fila
string ls_codcli,ls_codclipadre
ll_fila = tab_1.tp_1.dw_1.getrow()
if ll_fila>0 then
	if not isnull(tab_1.tp_1.dw_1.getitemstring(ll_fila,'codcli')) or tab_1.tp_1.dw_1.getitemstring(ll_fila,'codcli')<>"" then
		ls_codcli = tab_1.tp_1.dw_1.getitemstring(ll_fila,'codcli')
		ls_codclipadre = tab_1.tp_1.dw_1.getitemstring(ll_fila,'codclipadre')
		integer li_resp
		if tab_1.tp_1.dw_1.uf_ha_cambiado() or &
		   tab_1.tp_2.dw_2.uf_ha_cambiado() or &
		   tab_1.tp_3.dw_3.uf_ha_cambiado() or &
		   tab_1.tp_5.dw_5.uf_ha_cambiado() or &
			tab_1.tp_7.dw_7.uf_ha_cambiado() or &
			tab_1.tp_21.dw_19.uf_ha_cambiado() /*sapcrm*/ then
			
			li_resp = MessageBox(gsNomApl,'$$HEX1$$bf00$$ENDHEX$$Desea grabar los cambios?',question!, YesNoCancel!, 1)
			If li_resp = 1 Then
				tab_1.tp_1.dw_1.trigger event ue_guardar(false)
				tab_1.tp_2.dw_2.trigger event ue_guardar(false)
				tab_1.tp_3.dw_3.trigger event ue_guardar(false)
				tab_1.tp_5.dw_5.trigger event ue_guardar(false)
				tab_1.tp_7.dw_7.trigger event ue_guardar(false)				
				//ini sapcrm
				tab_1.tp_21.dw_19.trigger event ue_guardar(false)				
				//fin sapcrm
				
			elseif li_resp = 3 then
				return
			end if
		end if
		tab_1.tp_1.dw_1.trigger event ue_retrieve()
		i_pv = {false,false,false,false,false,false,false,false,false,false,false,false,false}
		choose case tab_1.SelectedTab
			case 2
				tab_1.tp_2.dw_2.retrieve(ls_codcli)
				i_pv[1] = true
			case 3
				tab_1.tp_3.dw_3.retrieve(ls_codcli)
				i_pv[2] = true
			case 4
				tab_1.tp_4.dw_4.retrieve(ls_codcli)
				i_pv[3] = true
			case 5
				tab_1.tp_5.dw_5.retrieve(ls_codcli)
				i_pv[4] = true
			case 6
				tab_1.tp_6.dw_6.retrieve(ls_codcli)
				i_pv[5] = true
			case 7
				tab_1.tp_7.dw_7.retrieve(ls_codcli)
				i_pv[6] = true
			case 8
				tab_1.tp_8.dw_8.retrieve(ls_codcli)
				i_pv[7] = true
			case 9
				tab_1.tp_9.dw_9.retrieve(ls_codcli)
				i_pv[8] = true
			case 10
				tab_1.tp_11.dw_11.retrieve(ls_codcli)
				i_pv[10] = true
			case 11
				tab_1.tp_12.dw_13.retrieve(ls_codcli)
				i_pv[11] = true
			case 12
				CHOOSE CASE tab_1.tp_13.tab_facturacion.selectedtab
					CASE 2
						tab_1.tp_13.tab_facturacion.tp_2f.dw_16.retrieve(ls_codcli)
						i_pv[13] = true
					CASE else //1
						tab_1.tp_13.tab_facturacion.tp_1f.dw_14.retrieve(ls_codcli)
						i_pv[12] = true
				END CHOOSE
			// Telefonos Presuscritos
			case 13
				tab_1.tp_20.dw_20.retrieve(ls_codcli)
				i_pv[13] = true
			//ini sapcrm
			case 15
				tab_1.tp_21.dw_19.retrieve(ls_codcli)
			//fin sapcrm
		end choose				
	end if
end if

end event

event dw_maestro::ue_insertar;ist_cliente.codcli = ''
tab_1.tp_1.dw_10.settransobject(sqlca)//actualizaciones del cliente
tab_1.tp_1.dw_10.retrieve(ist_cliente.codcli)
end event

type tab_1 from tab within w_mnt_cliente_marketing
integer width = 3648
integer height = 2088
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean multiline = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
tp_4 tp_4
tp_5 tp_5
tp_6 tp_6
tp_7 tp_7
tp_8 tp_8
tp_9 tp_9
tp_11 tp_11
tp_12 tp_12
tp_13 tp_13
tp_20 tp_20
tp_14 tp_14
tp_21 tp_21
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.tp_4=create tp_4
this.tp_5=create tp_5
this.tp_6=create tp_6
this.tp_7=create tp_7
this.tp_8=create tp_8
this.tp_9=create tp_9
this.tp_11=create tp_11
this.tp_12=create tp_12
this.tp_13=create tp_13
this.tp_20=create tp_20
this.tp_14=create tp_14
this.tp_21=create tp_21
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3,&
this.tp_4,&
this.tp_5,&
this.tp_6,&
this.tp_7,&
this.tp_8,&
this.tp_9,&
this.tp_11,&
this.tp_12,&
this.tp_13,&
this.tp_20,&
this.tp_14,&
this.tp_21}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
destroy(this.tp_4)
destroy(this.tp_5)
destroy(this.tp_6)
destroy(this.tp_7)
destroy(this.tp_8)
destroy(this.tp_9)
destroy(this.tp_11)
destroy(this.tp_12)
destroy(this.tp_13)
destroy(this.tp_20)
destroy(this.tp_14)
destroy(this.tp_21)
end on

event selectionchanged;
CHOOSE CASE newindex
//	messaggebox("Mensaje", string(newindex))	
	CASE 2
		tab_1.tp_2.dw_2.postevent("ue_retrieve")
	CASE 3
		tab_1.tp_3.dw_3.postevent("ue_retrieve")
	CASE 4
		tab_1.tp_4.dw_4.postevent("ue_retrieve")
	CASE 5
		tab_1.tp_5.dw_5.postevent("ue_retrieve")
	CASE 6
		tab_1.tp_6.dw_6.postevent("ue_retrieve")
	CASE 7
		tab_1.tp_7.dw_7.postevent("ue_retrieve")
	CASE 8
		tab_1.tp_8.dw_8.postevent("ue_retrieve")
	CASE 9
		tab_1.tp_9.dw_9.postevent("ue_retrieve")
	CASE 10
		tab_1.tp_11.dw_11.postevent("ue_retrieve")
	CASE 11
		tab_1.tp_12.dw_13.postevent("ue_retrieve")
	CASE 12
		CHOOSE CASE tab_1.tp_13.tab_facturacion.selectedtab
			CASE 2
				tab_1.tp_13.tab_facturacion.tp_2f.dw_16.triggerevent("ue_retrieve")
			CASE else //1
				tab_1.tp_13.tab_facturacion.tp_1f.dw_14.triggerevent("ue_retrieve")
		END CHOOSE
	CASE 13
		tab_1.tp_20.dw_20.postevent("ue_retrieve")		
	CASE 14
		tab_1.tp_14.dw_18.postevent("ue_retrieve")				
	//ini sapcrm
	CASE 15 
		tab_1.tp_21.dw_19.postevent("ue_retrieve")				
	//frin sapcrm
END CHOOSE

end event

type tp_1 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Datos Generales"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Database!"
long picturemaskcolor = 536870912
gb_1 gb_1
dw_1 dw_1
dw_10 dw_10
end type

on tp_1.create
this.gb_1=create gb_1
this.dw_1=create dw_1
this.dw_10=create dw_10
this.Control[]={this.gb_1,&
this.dw_1,&
this.dw_10}
end on

on tp_1.destroy
destroy(this.gb_1)
destroy(this.dw_1)
destroy(this.dw_10)
end on

type gb_1 from groupbox within tp_1
boolean visible = false
integer x = 2720
integer y = 932
integer width = 837
integer height = 184
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Ultima Actualizaci$$HEX1$$f300$$ENDHEX$$n"
end type

type dw_1 from uo_dw_std within tp_1
integer width = 3611
integer height = 1756
integer taborder = 40
string dataobject = "dw_ff_cliente_marketing_general"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean insertar = false
boolean borrar = false
boolean seleccionar = false
boolean auto_ordenar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1, ll_row
if isvalid(ist_cliente) then
	ll_filas = this.retrieve(ist_cliente.codcli)
	if gsPais='BRA' and ll_filas>0 then
		st_cliente lst_cliente
		lst_cliente = io_cliente.fget_cliente(dw_1.getitemstring(1,'codclipadre'))
		dw_1.object.t_nomclipadre.text = lst_cliente.nomcli
	end if
	tab_1.tp_1.dw_10.settransobject(sqlca)//actualizaciones del cliente
	tab_1.tp_1.dw_10.retrieve(ist_cliente.codcli)
	tab_1.tp_1.gb_1.visible = true
	tab_1.tp_1.dw_10.visible = true
   tab_1.tp_1.dw_1.object.p_buscar.visible = true
   if gsPais = 'PER' then 
	   tab_1.tp_1.dw_1.object.p_buscar.visible = false
	end if
   if gsPais = 'CHI' then
		ll_row = tab_1.tp_1.dw_1.getrow()	
		if ll_row > 0 then
			if isnull(tab_1.tp_1.dw_1.getitemstring(ll_row, 'TIPPER' ))  then
				tab_1.tp_1.dw_1.setitem(ll_row, 'TIPPER' ,'J' )			
				tab_1.tp_1.dw_1.accepttext()
				tab_1.tp_1.dw_1.trigger event ue_guardar(false)
				commit;
				tab_1.tp_1.dw_1.uf_resetupdate()
			end if
		end if
	end if	
	
end if
return ll_filas

end event

event ue_update_pre_row;call super::ue_update_pre_row;boolean lb_cambio = true
int li_ntdide, ln_verifica_ldoc = 0, ln_verifica_doc = 0, ln_verifica = 1, li_idestado
long ll_motivoestado
string ls_mensaje = '', ls_tipdide, ls_ntdide, ls_codcli

//conatena la fecha de aniversario - nacimiento MGG 04/08/05
object.fecnac[row] = date(object.anno[row]+'/'+object.mes[row]+'/'+object.dia[row]) 

// Validaci$$HEX1$$f300$$ENDHEX$$n de Duplicidad de Doc. Id. - mah 09/10/2003
ll_motivoestado = this.getitemnumber(row,'id_motivo_modif')
li_idestado = this.getitemnumber(row,'idestado')
ls_codcli = this.getitemstring(row,'codcli')
ls_tipdide = this.getitemstring(row,'tipdide')
ls_ntdide = this.getitemstring(row,'ntdide')
select f_verifica_doc_duplicado(:ls_tipdide, :ls_ntdide, :ls_codcli)
into :ln_verifica_doc
from dual;

// Validaci$$HEX1$$f300$$ENDHEX$$n de longitud de Doc. Id. - mah 30/09/2003
li_ntdide = len(trim(ls_ntdide))
select f_valida_tamanho_doc(:li_ntdide, :ls_tipdide)
into :ln_verifica_ldoc
from dual;

if gsPais='PER' then
	if ln_verifica_ldoc <> 1 then
		ls_mensaje += 'La longitud del doc. de identidad no es v$$HEX1$$e100$$ENDHEX$$lido.~n'
		lb_cambio = false
	end if
	ln_verifica = io_cliente.f_int_ntdide(ls_tipdide, ls_ntdide, this.getitemstring(row,"ntdide_comp"))
	if ln_verifica = 0 then
		ls_mensaje += 'Nro. RUC no es v$$HEX1$$e100$$ENDHEX$$lido.'
		lb_cambio = false
	end if
	// Se quita validaci$$HEX1$$f300$$ENDHEX$$n de doc. identidad. mgg 18/08/2004
	if ln_verifica_doc = 1 then
		if messagebox(title, 'Ya existe un cliente con este doc. de identidad,~ndesea modificar los datos?', Question!, OKCancel!, 2) = 2 then
			lb_cambio = false
		end if
	end if
	if isnull(ll_motivoestado) and li_idestado = 2 then
		MessageBox ("Warning","Poner el Motivo de la Inactivaci$$HEX1$$f300$$ENDHEX$$n")
		lb_cambio = false
	end if
end if                

if ls_mensaje<>'' then
            if not lb_cambio then messagebox(title, ls_mensaje)
end if

if lb_cambio then
	// esta condicion debe ser la ultima - GENERA CORRELATIVO
	if isnull(this.getitemstring(row, "codcli")) then
		string ls_fila
		ls_fila = f_correlativo_siguiente("VTATABCLI")
		this.setitem(row,'codcli',ls_fila)
		ist_cliente.codcli = ls_fila
	end if
end if
return lb_cambio
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;//Creacion de Clientes estado activo default MGG 28/01/05

tab_1.tp_1.dw_1.setitem(al_row, 'idestado', 1)
//

if gsPais = 'PER' then
	tab_1.tp_1.dw_1.setitem(al_row, 'comp_int','Interior')
elseif gsPais = 'BRA' then
	tab_1.tp_1.dw_1.setitem(al_row, 'comp_int','Complemento')
end if
tab_1.tp_1.dw_1.setitem(al_row, 'codect', '00000000')
tab_1.tp_1.dw_1.setitem(al_row, 'tipo_entidad', 1)


end event

event clicked;call super::clicked;//codigo trasladado al evento buttonclicked-sapcrm
end event

event ue_update_post;call super::ue_update_post;long ll_tipoact
boolean lb_act = false

if not insertar then
	lb_act = true
end if			  

if gspais = 'PER' then
	if lb_act then
		open(w_act_cliente)
		ll_tipoact=long(message.stringparm)
	
		  INSERT INTO "CLIENTEACTUALIZACION"  
					( "CODCLI",   
					  "IDTIPACT" )  
		  VALUES ( :ist_cliente.codcli,   
					  :ll_tipoact );
	end if
tab_1.tp_1.dw_1.object.p_buscar.visible = false
insertar = false
end if

return true
end event

event buttonclicked;call super::buttonclicked;st_par lst_par_in//sapcrm

if row >0 then
	choose case dwo.name
	case 'p_buscar'
			st_inmueble lst_inmueble
			if (gsPais='PER' or gsPais='USA' or gsPais='CHI') then
				lst_inmueble.idinmueble	= this.GetitemNUMBER(row,"idinmueble")
				lst_inmueble.tipviap		= this.GetitemSTRING(row,"tipviap")
				lst_inmueble.nomvia		= this.GetitemSTRING(row,"nomvia")
				lst_inmueble.numvia		= this.GetitemSTRING(row,"numvia")
				lst_inmueble.complemento= this.GetitemSTRING(row,"interior")
				lst_inmueble.codubi		= this.GetitemSTRING(row,"codubi")
				lst_inmueble.codpos		= this.GetitemSTRING(row,"codpos")
				lst_inmueble.nomdst		= this.GetitemSTRING(row,"nomdst")
				lst_inmueble.nompvc		= this.GetitemSTRING(row,"nompvc")
				lst_inmueble.nomest		= this.GetitemSTRING(row,"nomest")
				lst_inmueble.nomurb		= this.GetitemSTRING(row,"nomurb")
				lst_inmueble.referencia	= this.GetitemSTRING(row,"referencia")
				lst_inmueble.codcli		= this.GetitemSTRING(row,"codcli")
				if gsPais = 'CHI' then 
					openwithparm(w_hd_buscar_inmueble_chi, lst_inmueble)
				else
					openwithparm(w_hd_buscar_inmueble, lst_inmueble)
				end if
			elseif gsPais='BRA' then
				open(w_buscar_inmueble_with_add)
			end if
			lst_inmueble=message.powerobjectparm
			if isvalid(lst_inmueble) then
				this.setitem(row,"idinmueble",lst_inmueble.idinmueble)
				this.setitem(row,"tipviap",lst_inmueble.tipviap)
				this.setitem(row,"nomvia",lst_inmueble.nomvia)
				this.setitem(row,"numvia",lst_inmueble.numvia)
				this.setitem(row,"interior",lst_inmueble.complemento)
				this.setitem(row,"codubi",lst_inmueble.codubi)
				this.setitem(row,"codpos",lst_inmueble.codpos)
				this.setitem(row,"nomdst",lst_inmueble.nomdst)
				this.setitem(row,"nompvc",lst_inmueble.nompvc)
				this.setitem(row,"nomest",lst_inmueble.nomest)
				this.setitem(row,"nomurb",lst_inmueble.nomurb)
				this.setitem(row,"referencia",lst_inmueble.referencia)
			end if
	//ini sapcrm
	CASE 'b_matriz'
			openwithparm(w_lov_cliente_gral, lst_par_in)
			st_cliente lst_cliente
			lst_Cliente=message.powerobjectparm
			If lst_Cliente.valido then
				if lst_cliente.tipo_entidad=2 then
					f_msg("No se puede seleccionar un cliente tipo sucursal")
					return
				end if
				this.setitem(row,"codclipadre",lst_cliente.codcli)
				this.setitem(row,"nomcli_padre",lst_cliente.nomabr)			

			end if	
	//fin sapcrm
	end choose
end if
end event

type dw_10 from datawindow within tp_1
boolean visible = false
integer x = 2752
integer y = 980
integer width = 791
integer height = 120
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cliactualizacion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Datos de Marketing"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom088!"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tp_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tp_2.destroy
destroy(this.dw_2)
end on

type dw_2 from uo_dw_std within tp_2
event itemchangedidsegmento ( datawindow dwo,  long ll_idsegmento )
integer y = 4
integer width = 3534
integer height = 1396
integer taborder = 40
string dataobject = "dw_ff_cliente_marketing_marketing"
boolean hscrollbar = false
boolean vscrollbar = false
boolean border = false
boolean hsplitscroll = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean insertar = false
boolean borrar = false
boolean seleccionar = false
boolean auto_ordenar = false
end type

event itemchangedidsegmento(datawindow dwo, long ll_idsegmento);dwo.getchild('idsubrango',idwc_subrango)
idwc_subrango.settransobject(sqlca)
idwc_subrango.SetRedraw(true)

If isnull(ll_idsegmento) Then
    idwc_subrango.SetFilter('')
Else
   idwc_subrango.SetFilter("idsegmento =" + string(ll_idsegmento)+" OR  isNull(idsubrango)")
End If

idwc_subrango.Filter() 
idwc_subrango.Retrieve()
end event

event ue_retrieve;long ll_idcategoria, ll_idsubcat,ll_idsegmento,ll_idcanalventa
long ll_filas = -1
if isvalid(ist_cliente)  and tab_1.selectedtab=2 and not i_pv[1] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	
	if ll_filas > 0 then
		ll_idcategoria = tab_1.tp_2.dw_2.getitemnumber(1, 'idcategoria')
		ll_idsubcat = tab_1.tp_2.dw_2.getitemnumber(1, 'idsubcat')
		ll_idsegmento = tab_1.tp_2.dw_2.getitemnumber(1, 'idsegmento')
		ll_idcanalventa = tab_1.tp_2.dw_2.getitemnumber(1, 'idcanalventa')
		
		tab_1.tp_2.dw_2.getchild('idsubcat',idwc_subcategoria)
		idwc_subcategoria.settransobject(sqlca)
		idwc_subcategoria.insertrow(0)
		idwc_subcategoria.retrieve(ll_idcategoria)
		
		tab_1.tp_2.dw_2.setitem(1,'idsubcat',ll_idsubcat)
		
		//Estructura de Atencion - Datos Marketing
		ii_idcanalventa_anterior=ll_idcanalventa
		this.event itemchangedidsegmento(this,ll_idsegmento)
		
		if i_estados_eadm[1] then
			tab_1.tp_2.dw_2.setitem(1,'idcanalventa',ii_idcanalventa_nuevo)
		end if
		
	end if
	
	i_pv[1] = true
end if
return ll_filas
end event

event itemchanged;call super::itemchanged;long ll_idcategoria,ll_idcanalventa,ll_idsegmento,ll_aux

CHOOSE CASE dwo.name
	CASE "idcategoria"
		ll_idcategoria = long(data)

		this.getchild('idsubcat',idwc_subcategoria)
		idwc_subcategoria.settransobject(sqlca)
		idwc_subcategoria.insertrow(0)
		idwc_subcategoria.retrieve(ll_idcategoria)
		
	//Estructura Atencion - Datos Marketing
	CASE "idcanalventa"
		ll_idcanalventa = long(data)
		
		i_estados_eadm[1]=false
		i_estados_eadm[2]=true
		
		ii_idcanalventa_anterior=ll_idcanalventa
		
	CASE "idsegmento"
		ll_idsegmento = long(data)
		
		SetNull(ll_aux)
		
		this.event itemchangedidsegmento(this,ll_idsegmento)

		this.SetItem(row, "idsubrango",ll_aux )

	CASE "idsubrango"
		
		ll_idsegmento = idwc_subrango.GetItemNumber(idwc_subrango.GetRow(),'idsegmento')
		
		If Not isnull(ll_idsegmento) Then
		    this.SetItem(row, "idsegmento", ll_idsegmento)
		    this.event itemchangedidsegmento(this,ll_idsegmento)
		End If


END CHOOSE
end event

event buttonclicked;call super::buttonclicked;st_par lst_par_in, lst_par_out	

if dwo.name='b_pop' then
	if ii_tipo = 2 then
		lst_par_in.titulo = 'Busqueda de Pop'
		openwithparm(w_bus_pop, lst_par_in)
		lst_par_out = message.powerobjectparm
	
		if isvalid(lst_par_out) then
				this.setitem(row,"pop",lst_par_out.parlong1)								
				this.setitem(row,"direccion_pop",lst_par_out.parstring1)				
		end if
	end if
end if

if dwo.name='b_zona' then
	if ii_tipo = 2 then	
		lst_par_in.titulo = 'Busqueda de Zona'
		openwithparm(w_bus_zona, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codzona",lst_par_out.parlong1)								
				this.setitem(row,"desc_zona",lst_par_out.parstring1)				
		end if
	end if
end if

if dwo.name='b_pais' then
	if ii_tipo = 2 then	
		lst_par_in.titulo = 'Busqueda de Pais'	
		openwithparm(w_bus_pais, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codpai",lst_par_out.parstring1)								
				this.setitem(row,"desc_pais",lst_par_out.parstring2)				
		end if
	end if
end if

if dwo.name='b_grupoecon' then
	if ii_tipo = 2 then		
		lst_par_in.titulo = 'Busqueda de Grupo Econ$$HEX1$$f300$$ENDHEX$$mico'	
		openwithparm(w_bus_grupoecon, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"idgrupo",lst_par_out.parlong1)								
				this.setitem(row,"desc_grupoecon",lst_par_out.parstring1)				
		end if
	end if
end if

if dwo.name='b_codect' then
	if ii_tipo = 2 or ii_tipo = 3 then		
		lst_par_in.titulo = 'Busqueda de Ejecutivo de Cuenta'	
		openwithparm(w_bus_ejecutivo, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codect",lst_par_out.parstring1)								
				this.setitem(row,"nomect_am",lst_par_out.parstring2)				
		end if
	end if
end if

if dwo.name='b_codsocio' then
	if ii_tipo = 2 or ii_tipo = 3 then			
	lst_par_in.titulo = 'Busqueda de Agente'		
	openwithparm(w_bus_ejecutivo, lst_par_in)
	lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codsocio",lst_par_out.parstring1)								
				this.setitem(row,"nomect_ag",lst_par_out.parstring2)				
		end if
	end if
end if

if dwo.name='b_codecttel' then
	if ii_tipo = 2 then		
		lst_par_in.titulo = 'Busqueda de Ejecutivo de Telefonia'	
		openwithparm(w_bus_ejecutivo, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codecttel",lst_par_out.parstring1)								
				this.setitem(row,"nomect_at",lst_par_out.parstring2)				
		end if
	end if
end if

if dwo.name='b_codectmnt' then
	if ii_tipo = 2 then			
		lst_par_in.titulo = 'Busqueda de Ejecutivo de Mant. Cuenta'		
		openwithparm(w_bus_ejecutivo, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"codectmnt",lst_par_out.parstring1)								
				this.setitem(row,"nomect_mn",lst_par_out.parstring2)				
		end if
	end if
end if

if dwo.name='b_idae' then
	if ii_tipo = 2 then			
		lst_par_in.titulo = 'Busqueda de Actividad Econ$$HEX1$$f300$$ENDHEX$$mica'		
		openwithparm(w_bus_ae, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				this.setitem(row,"idae",lst_par_out.parlong1)		
				this.setitem(row,"desc_idae",trim(lst_par_out.parstring1)+'-'+lst_par_out.parstring2)
				this.setitem(row,"codgirmark",lst_par_out.parstring3)
				this.setitem(row,"codsecmark",lst_par_out.parlong2)
		end if
	end if
end if

if dwo.name='b_idnatjur' then
	if ii_tipo = 2 then			
		lst_par_in.titulo = 'Busqueda de Naturaleza Juridica'		
		openwithparm(w_bus_naturalezajuridica, lst_par_in)
		lst_par_out = message.powerobjectparm   
		
		if isvalid(lst_par_out) then
				this.setitem(row,"idnatjur",lst_par_out.parlong1)	
				this.setitem(row,"desc_idnatjur",lst_par_out.parstring1)				
		end if
	end if
end if
end event

event clicked;call super::clicked;//codigo trasladado al evento buttonclicked-sapcrm
end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Ingresos, Empleados y PC~'s"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom073!"
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tp_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tp_3.destroy
destroy(this.dw_3)
end on

type dw_3 from uo_dw_std within tp_3
integer width = 3529
integer height = 1396
integer taborder = 40
string dataobject = "dw_gr_cliente_ingreso_anual"
end type

event ue_valores_iniciales;call super::ue_valores_iniciales;if isvalid(ist_cliente) then
	if ist_cliente.codcli<>"" then
		this.setitem(al_row,"codcli",ist_cliente.codcli)
		if ist_cliente.tipo_entidad=2 then
			this.setitem(al_row,"codsuc",tab_1.tp_1.dw_1.getitemstring(1,'codsucpadre'))
		end if		
	end if
end if
end event

event ue_retrieve;string ls_sql
long ll_filas = -1

if isvalid(ist_cliente) and tab_1.selectedtab=3 and not i_pv[2] then
   if gspais = 'PER' then
	   tab_1.tp_3.dw_3.dataobject = "dw_gr_cliente_ingreso_anual_per"
		tab_1.tp_3.dw_3.triggerevent("ue_ini_dw")
		ll_filas = this.retrieve(ist_cliente.codcli)
   else
		if ii_tipo<>2 and ist_cliente.tipo_entidad =2 then
			tab_1.tp_3.dw_3.dataobject = "dw_gr_sucursal_ingreso_anual"
			tab_1.tp_3.dw_3.triggerevent("ue_ini_dw")
			ls_sql = tab_1.tp_3.dw_3.GetSQLSelect() + char(13) + " where codsuc = '" + tab_1.tp_1.dw_1.getitemstring(1,'codsucpadre') + "'"
			tab_1.tp_3.dw_3.SetSQLSelect(ls_sql)
			tab_1.tp_3.dw_3.object.codcli.visible = 0
			tab_1.tp_3.dw_3.object.codsuc.visible = 0
			ll_filas = this.retrieve()
		else
			tab_1.tp_3.dw_3.dataobject = "dw_gr_cliente_ingreso_anual"
			tab_1.tp_3.dw_3.triggerevent("ue_ini_dw")
			ll_filas = this.retrieve(ist_cliente.codcli)
		end if
	end if
	i_pv[2] = true
end if

return ll_filas
end event

event ue_valida_dato;call super::ue_valida_dato;dwobject dwo_data
st_par lst_par 
long ll_cantidad 

choose case as_columna
	case 'desc_rgo_ingreso'
	   lst_par.parlong1 = 1
		openwithparm(w_lov_rangos_ingresos, lst_par)
      lst_par = message.PowerObjectParm
			If lst_par.valido then
            object.rgo_ingreso[al_row] = lst_par.parinteger1
				object.desc_rgo_ingreso[al_row] = lst_par.parstring1
			end if	
	
	case 'desc_rgo_empleados'
	lst_par.parlong1 = 2
	openwithparm(w_lov_rangos_ingresos, lst_par)
	lst_par = message.PowerObjectParm
		If lst_par.valido then
			object.rgo_empleados[al_row] = lst_par.parinteger1
			object.desc_rgo_empleados[al_row] = lst_par.parstring1
		end if

	case 'desc_rgo_comput'
	   lst_par.parlong1 = 3
		openwithparm(w_lov_rangos_ingresos, lst_par)
      lst_par = message.PowerObjectParm
			If lst_par.valido then
            object.rgo_comput[al_row] = lst_par.parinteger1
				object.desc_rgo_comput[al_row] = lst_par.parstring1
			end if

	case 'desc_rgo_numlin'
	   lst_par.parlong1 = 4
		openwithparm(w_lov_rangos_ingresos, lst_par)
      lst_par = message.PowerObjectParm
			If lst_par.valido then
            object.rgo_numlin[al_row] = lst_par.parinteger1
				object.desc_rgo_numlin[al_row] = lst_par.parstring1
			end if

	case 'desc_rgo_numpri'
	   lst_par.parlong1 = 5
		openwithparm(w_lov_rangos_ingresos, lst_par)
      lst_par = message.PowerObjectParm
			If lst_par.valido then
            object.rgo_numpri[al_row] = lst_par.parinteger1
				object.desc_rgo_numpri[al_row] = lst_par.parstring1
			end if

end choose
return 0

end event

event ue_update_pre_row;call super::ue_update_pre_row;int li_anno
select to_char(sysdate,'yyyy') 
into :li_anno
from dual; 
object.anno[row] = li_anno
return true
end event

type tp_4 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Sucursales y Cobertura"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "SetDefaultClass!"
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tp_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tp_4.destroy
destroy(this.dw_4)
end on

type dw_4 from uo_dw_std within tp_4
integer width = 3529
integer height = 1404
integer taborder = 40
string dataobject = "dw_gr_sucursal_marketing"
boolean insertar = false
boolean borrar = false
end type

event doubleclicked;//w_mnt_sucursal_vtasucinganu iw_mnt_sucursal
window w_ventana
long ll_idsolicitud
st_par lst_par
if row < 1 then return
if isnull(getitemstring(row,'codsuc')) or getitemstring(row,'codsuc')="" then return

CHOOSE CASE ii_tipo
	CASE 2,3,4
		//ini sapcrm
		if lb_corporativo_sap then
			lst_par.updwprop = true
			lst_par.guardar = true
			lst_par.nuevo = true	
			lst_par.borrar = false	
			lst_par.insertar = true	
			lst_par.suprimir = false
			lst_par.titulo = "Mantenimiento de Sucursales"
			lst_par.tipo = 4		
		else
		//fin sapcrm
		
			// Control de Bloqueo
			if ii_permiso_dir = 0 then
				lst_par.updwprop = true
				lst_par.guardar = true
				lst_par.nuevo = true	
				lst_par.borrar = false	
				lst_par.insertar = true	
				lst_par.suprimir = false
				lst_par.titulo = "Mantenimiento de Sucursales"
				lst_par.tipo = 4
			else
				lst_par.updwprop = false
				lst_par.guardar = false
				lst_par.nuevo = false	
				lst_par.borrar = false	
				lst_par.insertar = false	
				lst_par.suprimir = false
				lst_par.titulo = "Consultar Sucursales"
				lst_par.tipo = 5			
			end if
		
		//ini sapcrm
		end if
		//fin sapcrm
	CASE 5
		lst_par.updwprop = false
		lst_par.guardar = false
		lst_par.nuevo = false	
		lst_par.borrar = false	
		lst_par.insertar = false	
		lst_par.suprimir = false
		lst_par.titulo = "Consultar Sucursales"
		lst_par.tipo = 5
END CHOOSE

lst_par.dw_maestro = 'dw_ff_sucursal'
lst_par.parstring1 = this.getitemstring(row,'codcli')
lst_par.parstring2 = this.getitemstring(row,'codsuc')
//openwithparm(iw_mnt_sucursal, lst_par)
OpenSheetWithParm(w_ventana, lst_par, "w_mnt_sucursal_vtasucinganu", Parentwindow(), 1, Original!)

end event

event ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=4 and not i_pv[3] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[3] = true
end if
return ll_filas
end event

event ue_insertar;long ll_idsolicitud
st_par lst_par
window w_ventana

lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = true	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.titulo = "Nueva Sucursal"
lst_par.parstring1 = trim(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'codcli'))
lst_par.parstring3 = trim(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'nomcli'))
lst_par.parstring4 = trim(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'tipdide'))
lst_par.parstring5 = trim(tab_1.tp_1.dw_1.getitemstring(tab_1.tp_1.dw_1.getrow(),'ntdide'))
lst_par.tipo = 1
lst_par.dw_maestro = 'dw_ff_sucursal'
//openwithparm(w_mnt_sucursal_vtasucinganu, lst_par)
OpenSheetWithParm(w_ventana, lst_par, "w_mnt_sucursal_vtasucinganu", Parentwindow(), 1, Original!)
end event

event rbuttondown;window lw_ventana
//if (gsPais = 'PER' or gsPais = 'USA' or gsPais = 'CHI') then
if ii_permiso_dir = 0 then	
	//ini sapcrm
	//if not ib_insertar_sapcrm then
	//	return
	//end if
	//fin sapcrm
	this.insertar = true
	m_dw_std lm_popmenu 
	
	if row > 0 then
		if ScrollToRow(row) = -1 then return
		if dwo.Type = 'column' then SetColumn(string(dwo.name))
	end if
	
	lm_popmenu = create m_dw_std
	lm_popmenu.uf_set_dw(this)
	lm_popmenu.uf_set_row(row)
	lm_popmenu.uf_set_dwo(dwo)
	lw_ventana = uf_ventana()
	lm_popmenu.m_accion.PopMenu(lw_ventana.pointerX(),lw_ventana.PointerY())
end if



 

end event

type tp_5 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Contactos Empleados"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom076!"
long picturemaskcolor = 536870912
dw_12 dw_12
dw_5 dw_5
end type

on tp_5.create
this.dw_12=create dw_12
this.dw_5=create dw_5
this.Control[]={this.dw_12,&
this.dw_5}
end on

on tp_5.destroy
destroy(this.dw_12)
destroy(this.dw_5)
end on

type dw_12 from uo_dw_std within tp_5
integer y = 724
integer width = 3534
integer height = 668
integer taborder = 40
string dataobject = "dw_gr_medio_comunicacion_contacto_market"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) then
	ll_filas = this.retrieve(ist_cliente.codcli)
end if
return ll_filas
end event

type dw_5 from uo_dw_std within tp_5
integer width = 3534
integer height = 708
integer taborder = 40
string dataobject = "dw_gr_contacto_marketing"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=5 and not i_pv[4] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	if ll_filas>0 then
		dw_12.retrieve(this.getitemstring(1,'codcnt'))
	end if
	i_pv[4] = true
end if
return ll_filas

end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow < 1 Or currentrow > this.RowCount() Then 
	return;
End If
if IsNull(this.getitemstring(currentrow,'codcnt')) Then
	dw_12.reset()
Else
	dw_12.retrieve(this.getitemstring(currentrow,'codcnt'))
End IF
end event

event doubleclicked;call super::doubleclicked;//w_mnt_contacto_cliente iw_mnt_contacto_cliente
window w_ventana
string ls_codcnt
int var_tipo
st_par lst_par
if row < 1 then return
ls_codcnt=this.getitemstring(row,'codcnt')

// Modo de Acceso
choose case ii_tipo
	case 2
		var_tipo = ii_tipo
	case else
		var_tipo = 3
end choose

//ini comentado por sapcrm
//if (gsPais = 'PER' or gsPais = 'USA') then
//	lst_par.updwprop = true
//	lst_par.guardar = true
//	lst_par.nuevo = false	
//	lst_par.borrar = false	
//	lst_par.insertar = false	
//	lst_par.suprimir = false
//	lst_par.titulo = "Mantenimiento de Contactos de Cliente"
//	lst_par.tipo = var_tipo
//	lst_par.parstring1 = ls_codcnt
//	lst_par.parstring2 = trim(tab_1.tp_1.dw_1.object.nomcli[tab_1.tp_1.dw_1.getrow()])
//	lst_par.dw_detalle = 'dw_medio_comunicacion_contacto'
//	lst_par.dw_detalle2 = 'dw_contactoxsucursal'
//	lst_par.dw_maestro = 'dw_contactocliente_per'
//end if
//fin 


if gsPais = 'CHI' then
	lst_par.titulo = "Mantenimiento de Contactos de Cliente"
	lst_par.parstring1 = ls_codcnt
	//ini sapcrm
	lst_par.parstring3 =  TRIM(ist_cliente.codcli)/*codcli*/
	lst_par.parstring4 = trim(this.object.codcntsap[this.getrow()])
	//fin sapcrm
	lst_par.tipo = var_tipo
	lst_par.dw_maestro = 'dw_contactocliente'
end if

//openwithparm(iw_mnt_contacto_cliente, lst_par)
OpenSheetWithParm(w_ventana, lst_par, "w_mnt_contacto_cliente", Parentwindow(), 1, Original!)
end event

event ue_insertar;st_par lst_par
window w_ventana

if (gsPais = 'PER' or gsPais = 'USA') then
lst_par.updwprop = true
lst_par.guardar = true
lst_par.nuevo = true	
lst_par.borrar = false	
lst_par.insertar = true	
lst_par.suprimir = false
lst_par.parstring1 = ""
lst_par.parstring2 = trim(tab_1.tp_1.dw_1.object.nomcli[tab_1.tp_1.dw_1.getrow()])
lst_par.parstring3 = trim(tab_1.tp_1.dw_1.object.codcli[tab_1.tp_1.dw_1.getrow()])
lst_par.dw_detalle = 'dw_medio_comunicacion_contacto'
lst_par.dw_detalle2 = 'dw_contactoxsucursal'
lst_par.tipo = 1
lst_par.titulo = 'Nuevo Contacto'
lst_par.dw_maestro = 'dw_contactocliente_per'
end if
if gsPais = 'CHI' then
	lst_par.updwprop = true
	lst_par.guardar = true
	lst_par.nuevo = true	
	lst_par.borrar = false	
	lst_par.insertar = true	
	lst_par.suprimir = false
	lst_par.parstring1 = ""
	lst_par.parstring2 = trim(tab_1.tp_1.dw_1.object.nomcli[tab_1.tp_1.dw_1.getrow()])
	lst_par.parstring3 = trim(tab_1.tp_1.dw_1.object.codcli[tab_1.tp_1.dw_1.getrow()])
	lst_par.dw_detalle = 'dw_medio_comunicacion_contacto'
	lst_par.dw_detalle2 = 'dw_contactoxsucursal'
	lst_par.tipo = 1
	lst_par.titulo = 'Nuevo Contacto'
	lst_par.dw_maestro = 'dw_contactocliente'
end if

//openwithparm(w_mnt_contacto_cliente, lst_par)
OpenSheetWithParm(w_ventana, lst_par, "w_mnt_contacto_cliente", Parentwindow(), 1, Original!)
end event

event rbuttondown;window lw_ventana

//if (gsPais = 'PER' or gsPais = 'USA' or gsPais = 'CHI') then
if ii_permiso_cnt = 0 then		
	//ini sapcrm
	if not ib_insertar_sapcrm then
		return
	end if
	//fin sapcrm	
	this.insertar = true
	m_dw_std lm_popmenu 
	
	if row > 0 then
		if ScrollToRow(row) = -1 then return
		if dwo.Type = 'column' then SetColumn(string(dwo.name))
	end if
	
	lm_popmenu = create m_dw_std
	lm_popmenu.uf_set_dw(this)
	lm_popmenu.uf_set_row(row)
	lm_popmenu.uf_set_dwo(dwo)
	//lm_popmenu.m_accion.PopMenu(uf_ventana().pointerX(),uf_ventana().PointerY())
	// SGA-Web. 21/09/2004
	lw_ventana = uf_ventana()
	lm_popmenu.m_accion.PopMenu(lw_ventana.pointerX(),lw_ventana.PointerY())
end if
end event

type tp_6 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Medios de Comunicaci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom020!"
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tp_6.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tp_6.destroy
destroy(this.dw_6)
end on

type dw_6 from uo_dw_std within tp_6
integer width = 3534
integer height = 1408
integer taborder = 40
string dataobject = "dw_mntmedcomcli"
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=6 and not i_pv[5] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[5] = true
end if
return ll_filas
end event

event ue_update_pre_row;this.Accepttext()
/*if isnull(this.getitemstring(row,'numcomcli')) or this.getitemstring(row,'numcomcli')="" then
	messagebox('Contactos de Empresa', 'Debe ingresar el campo N$$HEX1$$fa00$$ENDHEX$$mero')
	return false
end if*/

//messagebox('Mensaje',string(this.getitemstring(row,"numcomcli")) )

if isnull(this.getitemstring(row,"idmedcom")) or this.getitemstring(row,"idmedcom")= "" then
	messagebox('Medios de Comunicaci$$HEX1$$f300$$ENDHEX$$n','No ha seleccionado un medio de Comunicaci$$HEX1$$f300$$ENDHEX$$n.')
	return false
end if
//if not isnumber(this.getitemstring(row,"ddd")) and not isnull(this.getitemstring(row,"ddd")) and this.getitemstring(row,"ddd")<>'' then
//	messagebox('DDD','El campo DDD debe ser llenado con n$$HEX1$$fa00$$ENDHEX$$meros.')
//	return false
//end if
//if isnull(this.getitemstring(row,"numcomcli")) or this.getitemstring(row,"numcomcli")= "" then
//	messagebox('Medios de Comunicaci$$HEX1$$f300$$ENDHEX$$n','El campo Med. Comunicaci$$HEX1$$f300$$ENDHEX$$n es obligatorio.')
//	return false
//end if
//if not isnumber(this.getitemstring(row,"anexo")) and not isnull(this.getitemstring(row,"anexo")) and this.getitemstring(row,"anexo")<>'' then
//	messagebox('Anexo','El campo Anexo debe ser llenado con n$$HEX1$$fa00$$ENDHEX$$meros.')
//	return false
//end if
return true
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;if isvalid(ist_cliente) then
	if ist_cliente.codcli<>"" then
		this.setitem(al_row,"codcli",ist_cliente.codcli)
		this.setitem(al_row,"numcomcli","")
	end if
end if

end event

type tp_7 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Gastos en Telecomunicaciones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "FormatDollar!"
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tp_7.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tp_7.destroy
destroy(this.dw_7)
end on

type dw_7 from uo_dw_std within tp_7
integer width = 3534
integer height = 1408
integer taborder = 40
string dataobject = "d_gen_proveedor_servicio"
end type

event ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=7 and not i_pv[6] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[6] = true
end if
return ll_filas
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;//If ist_cliente.codcli <> '' then 
	this.setitem(al_row,'codcli',ist_cliente.codcli)
//End if






end event

type tp_8 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Record Comercial: Proyectos"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Graph!"
long picturemaskcolor = 536870912
dw_8 dw_8
end type

on tp_8.create
this.dw_8=create dw_8
this.Control[]={this.dw_8}
end on

on tp_8.destroy
destroy(this.dw_8)
end on

type dw_8 from uo_dw_std within tp_8
integer width = 3538
integer height = 1412
integer taborder = 40
string dataobject = "dw_tabpspcli_cli01"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=8 and not i_pv[7] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[7] = true
end if
return ll_filas
end event

type tp_9 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Reclamos"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom027!"
long picturemaskcolor = 536870912
dw_9 dw_9
end type

on tp_9.create
this.dw_9=create dw_9
this.Control[]={this.dw_9}
end on

on tp_9.destroy
destroy(this.dw_9)
end on

type dw_9 from uo_dw_std within tp_9
integer width = 3534
integer height = 1408
integer taborder = 40
string dataobject = "dw_gr_reclamosxcliente"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=9 and not i_pv[8] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[8] = true
end if
return ll_filas
end event

type tp_11 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Informaci$$HEX1$$f300$$ENDHEX$$n x Servicio"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "RunReport5!"
long picturemaskcolor = 536870912
dw_17 dw_17
dw_11 dw_11
end type

on tp_11.create
this.dw_17=create dw_17
this.dw_11=create dw_11
this.Control[]={this.dw_17,&
this.dw_11}
end on

on tp_11.destroy
destroy(this.dw_17)
destroy(this.dw_11)
end on

type dw_17 from uo_dw_std within tp_11
integer y = 708
integer width = 3529
integer height = 688
integer taborder = 50
string dataobject = "dw_gr_insprd_x_cliente"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

type dw_11 from uo_dw_std within tp_11
integer width = 3529
integer height = 688
integer taborder = 40
string dataobject = "dw_gr_servicio_x_cliente"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=10 and not i_pv[10] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	if ll_filas>0 then
		dw_17.retrieve(this.getitemnumber(1,'inssrv_codinssrv'))
	end if
	i_pv[10] = true
end if
return ll_filas
end event

event rowfocuschanged;call super::rowfocuschanged;If currentrow < 1 Or currentrow > this.RowCount() Then 
	return;
End If
if IsNull(this.getitemnumber(currentrow,'inssrv_codinssrv')) Then
	dw_17.reset()
Else
	dw_17.retrieve(this.getitemnumber(currentrow,'inssrv_codinssrv'))
End IF
end event

type tp_12 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Cajas Terminales"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Structure5!"
long picturemaskcolor = 536870912
dw_13 dw_13
end type

on tp_12.create
this.dw_13=create dw_13
this.Control[]={this.dw_13}
end on

on tp_12.destroy
destroy(this.dw_13)
end on

type dw_13 from uo_dw_std within tp_12
integer x = 14
integer y = 16
integer width = 3506
integer height = 1384
integer taborder = 40
string dataobject = "d_caja_terminalxcliente"
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=11 and not i_pv[11] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[11] = true
end if
return ll_filas
end event

type tp_13 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Facturaci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom048!"
long picturemaskcolor = 536870912
tab_facturacion tab_facturacion
end type

on tp_13.create
this.tab_facturacion=create tab_facturacion
this.Control[]={this.tab_facturacion}
end on

on tp_13.destroy
destroy(this.tab_facturacion)
end on

type tab_facturacion from tab within tp_13
integer x = 55
integer y = 8
integer width = 3401
integer height = 1400
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1f tp_1f
tp_2f tp_2f
end type

on tab_facturacion.create
this.tp_1f=create tp_1f
this.tp_2f=create tp_2f
this.Control[]={this.tp_1f,&
this.tp_2f}
end on

on tab_facturacion.destroy
destroy(this.tp_1f)
destroy(this.tp_2f)
end on

event selectionchanged;CHOOSE CASE newindex
	CASE 2
		tab_1.tp_13.tab_facturacion.tp_2f.dw_16.triggerevent("ue_retrieve")
	CASE else //1
		tab_1.tp_13.tab_facturacion.tp_1f.dw_14.triggerevent("ue_retrieve")
END CHOOSE

end event

type tp_1f from userobject within tab_facturacion
integer x = 18
integer y = 112
integer width = 3365
integer height = 1272
long backcolor = 79741120
string text = "Detalle de Facturaci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "TreeView!"
long picturemaskcolor = 536870912
dw_15 dw_15
dw_14 dw_14
end type

on tp_1f.create
this.dw_15=create dw_15
this.dw_14=create dw_14
this.Control[]={this.dw_15,&
this.dw_14}
end on

on tp_1f.destroy
destroy(this.dw_15)
destroy(this.dw_14)
end on

type dw_15 from uo_dw_std within tp_1f
integer x = 9
integer y = 596
integer width = 3342
integer height = 684
integer taborder = 40
string dataobject = "dw_cnscli_factura_det"
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean seleccionar = false
end type

type dw_14 from uo_dw_std within tp_1f
integer x = 9
integer y = 4
integer width = 3342
integer height = 580
integer taborder = 40
string dataobject = "dw_cnscli_factura_cab"
boolean guardar = false
boolean insertar = false
boolean borrar = false
boolean seleccionar = false
end type

event ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=12 and tab_1.tp_13.tab_facturacion.selectedtab=1 and &
	not i_pv[12] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	if ll_filas>0 then
		dw_15.retrieve(this.getitemstring(1,'idfac'))
	end if
	i_pv[12] = true
end if
return ll_filas
end event

event clicked;call super::clicked;If row < 1 Or row > this.RowCount() Then 
	return;
End If
this.scrolltorow(row)
if IsNull(this.getitemstring(row,'idfac')) Then
	dw_15.reset()
Else
	dw_15.retrieve(this.getitemstring(row,'idfac'))
End IF
end event

type tp_2f from userobject within tab_facturacion
integer x = 18
integer y = 112
integer width = 3365
integer height = 1272
long backcolor = 79741120
string text = "Resumen de Facturaci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom042!"
long picturemaskcolor = 536870912
dw_16 dw_16
end type

on tp_2f.create
this.dw_16=create dw_16
this.Control[]={this.dw_16}
end on

on tp_2f.destroy
destroy(this.dw_16)
end on

type dw_16 from uo_dw_std within tp_2f
integer x = 5
integer y = 20
integer width = 3351
integer height = 1248
integer taborder = 40
string dataobject = "dw_cnscli_resumen_fac_suc"
boolean guardar = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) and tab_1.selectedtab=12 and tab_1.tp_13.tab_facturacion.selectedtab=2 and &
	not i_pv[13] then 
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[13] = true
end if
return ll_filas
end event

type tp_20 from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Telefonos Presuscritos"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ListView!"
long picturemaskcolor = 536870912
dw_20 dw_20
end type

on tp_20.create
this.dw_20=create dw_20
this.Control[]={this.dw_20}
end on

on tp_20.destroy
destroy(this.dw_20)
end on

type dw_20 from uo_dw_std within tp_20
integer x = 18
integer y = 16
integer width = 3474
integer height = 1152
integer taborder = 60
string dataobject = "d_telnumtel_cliente"
end type

event ue_retrieve;long ll_filas = -1
//messagebox('Mensaje',string(tab_1.selectedtab) )
if isvalid(ist_cliente) and tab_1.selectedtab=13 and not i_pv[14] then
	ll_filas = this.retrieve(ist_cliente.codcli)
	i_pv[14] = true
end if
return ll_filas
end event

type tp_14 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Medios de Pago"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Sort!"
long picturemaskcolor = 536870912
dw_18 dw_18
end type

on tp_14.create
this.dw_18=create dw_18
this.Control[]={this.dw_18}
end on

on tp_14.destroy
destroy(this.dw_18)
end on

type dw_18 from uo_dw_std within tp_14
integer x = 5
integer y = 12
integer width = 3538
integer height = 1388
integer taborder = 50
string dataobject = "dw_gr_medios_pagos"
boolean livescroll = false
boolean insertar = false
boolean borrar = false
end type

event ue_retrieve;this.accepttext()
this.retrieve(ist_cliente.codcli) 
this.selectrow(0, FALSE)
this.selectrow(1, TRUE)

RETURN 1
end event

event ue_insertar;st_par lst_par
window w_ventana

lst_par.updwprop   = false
lst_par.guardar    = false
lst_par.nuevo 	  	 = false
lst_par.borrar     = false
lst_par.insertar 	 = false
lst_par.suprimir 	 = false
lst_par.titulo     = "Medios de Pago"
lst_par.parstring1 = 'I'
lst_par.parstring2 = TRIM(ist_cliente.codcli)
lst_par.tipo       = 1
lst_par.dw_maestro = 'dw_mant_vtaxforpag'
OpenWithParm(w_mant_vtaxforpag, lst_par)

IF tab_1.tp_14.dw_18.retrieve(ist_cliente.codcli)  > 0 THEN
	this.selectrow(0, FALSE)
	this.selectrow(1, TRUE)
END IF	
end event

event rbuttondown;window lw_ventana

this.insertar = true
this.borrar   = true
m_dw_std lm_popmenu 

if row > 0 then
	if ScrollToRow(row) = -1 then return
	if dwo.Type = 'column' then SetColumn(string(dwo.name))
end if

lm_popmenu = create m_dw_std
lm_popmenu.uf_set_dw(this)
lm_popmenu.uf_set_row(row)
lm_popmenu.uf_set_dwo(dwo)
lw_ventana = uf_ventana()
lm_popmenu.m_accion.PopMenu(lw_ventana.pointerX(),lw_ventana.PointerY())

this.selectrow(0, FALSE)
this.selectrow(1, TRUE)
end event

event doubleclicked;call super::doubleclicked;st_par lst_par,lst_par1
window w_ventana

IF row < 1 THEN RETURN

lst_par.updwprop   = false
lst_par.guardar    = false
lst_par.nuevo 	  	 = false
lst_par.borrar     = false
lst_par.insertar 	 = false
lst_par.suprimir 	 = false
lst_par.titulo     = "Medios de Pago"
lst_par.parstring1 = 'M'
lst_par.parstring2 = tab_1.tp_14.dw_18.object.codcli[row]
lst_par.parinteger1= INTEGER(tab_1.tp_14.dw_18.object.idforpago[row])
lst_par.tipo       = 1
lst_par.dw_maestro = 'dw_mant_vtaxforpag'
OpenWithParm(w_mant_vtaxforpag, lst_par)

IF tab_1.tp_14.dw_18.retrieve(ist_cliente.codcli)  > 0 THEN
	this.selectrow(0, FALSE)
	this.selectrow(row, TRUE)
END IF	









end event

event ue_borrar_fila;string  ls_codcli 
integer li_cuenta,li_idtipforpago

IF al_row = 0 THEN RETURN 1

this.accepttext()

ls_codcli       = TRIM(this.object.codcli[al_row])
li_idtipforpago = INTEGER(this.object.idtipforpag[al_row])
	
//BUSCAMOS SI EXISTE PROYECTO
SELECT COUNT(numslc) 
INTO :li_cuenta
FROM VTATABPSPCLI 
WHERE codcli   =:ls_codcli AND
      idforpago=:li_idtipforpago;

IF li_cuenta > 0 THEN
	f_msg("No se Puede Eliminar x tiene Proyectos Asociados...")
	RETURN 1
ELSE	
	this.deleterow(al_row)
END IF	

RETURN 1
end event

type tp_21 from userobject within tab_1
integer x = 18
integer y = 304
integer width = 3611
integer height = 1768
long backcolor = 79741120
string text = "Estructura de Atenci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "UserObject5!"
long picturemaskcolor = 536870912
dw_19 dw_19
end type

on tp_21.create
this.dw_19=create dw_19
this.Control[]={this.dw_19}
end on

on tp_21.destroy
destroy(this.dw_19)
end on

type dw_19 from uo_dw_std within tp_21
integer x = 14
integer y = 8
integer width = 3557
integer height = 1640
integer taborder = 50
string dataobject = "d_mnt_equipo_relacionamiento"
end type

event ue_retrieve;call super::ue_retrieve;long ll_filas = -1
if isvalid(ist_cliente) then
	ll_filas = this.retrieve(ist_cliente.codcli)
end if

i_estados_eadm[1]=false
if i_pv[1] and tab_1.tp_2.dw_2.RowCount()>0 then
	tab_1.tp_2.dw_2.SetItem(1, "idcanalventa", ii_idcanalventa_anterior)					
end if

return ll_filas
end event

event ue_valores_iniciales;call super::ue_valores_iniciales;string ls_codcli
ls_codcli = ist_par.parstring1
this.setitem(al_row, 'codcli', ls_codcli)
this.setitem(al_row, 'flg_estado', 1)

end event

event ue_valida_dato;call super::ue_valida_dato;st_par lst_par_in, lst_par_out	
string ab_supervisor
string ab_nomect
long ll_idcanalventa

choose case as_columna
	case 'codect'
	if ii_permiso_est_aten = 1 then	
		messagebox("Aviso", "Opci$$HEX1$$f300$$ENDHEX$$n no valida")		
	else
	if ii_tipo = 2 or ii_tipo = 3 then		
		lst_par_in.titulo = 'Busqueda de Ejecutivo de Cuenta'	
		openwithparm(w_bus_ejecutivo, lst_par_in)
		lst_par_out = message.powerobjectparm
		
		if isvalid(lst_par_out) then
				select codsupvta into :ab_supervisor from vtatabect where codect = :lst_par_out.parstring1 and rownum = 1;
				select nomect into :ab_nomect from vtatabect where codect = :ab_supervisor and rownum = 1;
				
				this.setitem(al_row,"codect",lst_par_out.parstring1)								
				this.setitem(al_row,"nomect",lst_par_out.parstring2)
				this.setitem(al_row,"supervisor",ab_nomect)
				
				//Estructura Atencion - Datos Marketing
				if this.getitemnumber(al_row,'idtipate')=1 then
					i_estados_eadm[1]=true
					i_estados_eadm[2]=false
					
					select cv.idcanalventa into :ll_idcanalventa
					from vtatabect ect
					left join subgerencia sg on ect.idsubgerencia = sg.idsubgerencia
					left join tipo_canal_venta cv on cv.prefijo_subgerencia = sg.prefijo
					where ect.codect =:lst_par_out.parstring1;
					
					if i_pv[1] and tab_1.tp_2.dw_2.RowCount()>0 then
						
						tab_1.tp_2.dw_2.SetItem(1, "idcanalventa", ll_idcanalventa)
						
					else
							ii_idcanalventa_nuevo=ll_idcanalventa
					end if
					
				end if

		end if
	end if
	end if
end choose

return 0
end event

event ue_guardar;call super::ue_guardar;//Modificaci$$HEX1$$f300$$ENDHEX$$n de usuario que se haga cambios en esta seccion de estructura de atencion
int li_cont,li_longitud
string ls_codsupvta,ls_codect, ls_nomsupvta
For li_cont = 1 to dw_19.rowcount()
	ls_nomsupvta =  dw_19.object.supervisor[li_cont]
	ls_codect      =  dw_19.object.codect[li_cont]
	
	li_longitud = Len(ls_nomsupvta)
	if li_longitud = 8 then
		
		ls_codsupvta =  dw_19.object.supervisor[li_cont]
		
		update VTATABECT set codsupvta =  :ls_codsupvta   
		where codect = :ls_codect;
		IF SQLCA.SQLCODE<0 THEN
		messagebox("Mensaje",sqlca.sqlerrtext)
		ROLLBACK;
			ELSE
		COMMIT;
			END IF
		
	else
		
		select codect into :ls_codsupvta from vtatabect where nomect = :ls_nomsupvta and estect = 1;
		
		update VTATABECT set codsupvta =  :ls_codsupvta   
		where codect = :ls_codect;
		IF SQLCA.SQLCODE<0 THEN
		messagebox("Mensaje",sqlca.sqlerrtext)
		ROLLBACK;
			ELSE
		COMMIT;
			END IF
	end if
next 
return true
end event

