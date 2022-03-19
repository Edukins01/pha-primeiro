*** Settings ***
Documentation        Este aqui é o nosso gerenciador e dependência

################################################
#                  Libraries                   #
################################################
Library        SeleniumLibrary


################################################
#                   Keywords                   #
################################################
Resource    ../Auto/keywords/kws_search.robot
Resource    ../Auto/keywords/kws_register.robot

################################################
#                     Pages                    #
################################################
Resource    ../Auto/pages/page_home.robot
Resource    ../Auto/pages/page_search.robot
Resource    ../Auto/pages/page_register.robot

################################################
#                     Hooks                    #
################################################
Resource        hooks.robot