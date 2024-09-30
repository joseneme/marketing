HA$PBExportHeader$w_main_intmer.srw
$PBExportComments$Ventana Principal del Modulo de MI
forward
global type w_main_intmer from w_main_comun
end type
end forward

global type w_main_intmer from w_main_comun
string title = "M$$HEX1$$f300$$ENDHEX$$dulo de Inteligencia de Mercados"
string menuname = "m_menu_intmer"
windowstate windowstate = maximized!
end type
global w_main_intmer w_main_intmer

on w_main_intmer.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_menu_intmer" then this.MenuID = create m_menu_intmer
end on

on w_main_intmer.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;GetApplication ( ).displayname = gsNomApl
if gsPais='BRA' then m_menu_intmer.m_transacciones.m_co.enabled = false
end event

