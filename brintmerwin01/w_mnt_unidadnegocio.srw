HA$PBExportHeader$w_mnt_unidadnegocio.srw
forward
global type w_mnt_unidadnegocio from w_mnt_std
end type
end forward

global type w_mnt_unidadnegocio from w_mnt_std
string title = ""
end type
global w_mnt_unidadnegocio w_mnt_unidadnegocio

on w_mnt_unidadnegocio.create
call super::create
end on

on w_mnt_unidadnegocio.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

type dw_maestro from w_mnt_std`dw_maestro within w_mnt_unidadnegocio
string dataobject = "dw_gr_estado_calificacion"
end type

