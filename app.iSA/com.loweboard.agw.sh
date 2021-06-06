#!/usr/bin/env bash
#
# iSystemAdministrator -- <iSA>! a MVC pattern selection-^MENU
# https://github.com/loweboard/iSystemAdministrator
# Copyright (C) 2015 LOWE/SAAU-LOON <224428@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
__version__="""0.1"""
__author__="""<iSA>! a MVC pattern selection-^MENU{=r[${__version__}]}+"""
#
ui_screen_cols_max=80
ui_screen_cols_min=56
#
ui_hr_t1_tail1="""^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"""
ui_hr_t1_tail2="""^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"""
ui_hr_t2_tail1="""||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""
ui_hr_t2_tail2="""||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""
ui_hr_t3_tail1="""!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"""
ui_hr_t3_tail2="""!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"""
ui_hr_t4_tail1='''""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
ui_hr_t4_tail2='''""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
ui_hr_t5_tail1="""''''''''''''''''''''''''''''''''''''''''''''''''''''''''"""
ui_hr_t5_tail2="""''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"""
ui_hr_t6_tail1="""________________________________________________________"""
ui_hr_t6_tail2="""________________________________________________________________________________"""
#
ui_label_author='\033[96m%s\033[0m=)>-\033[04;92m%s\033[0m'
ui_label_domain='\033[94m%s\033[0m=)>-\033[93m%s\033[0m'
ui_label_loaded='\033[31m%s\033[0m=)>-\033[91m%s\033[0m'
ui_label_called='\033[35m%s\033[0m=)>-\033[95m%s\033[0m'
ui_label_scout='\033[04;33m%s\033[0m'
#
function main()
{
    if [[ "$(__name__)" == "__source__" ]];
    then
        do_init
        return 0
    fi
    #
    do_args
    do_load
    do_call
    do_menu
}
#
function __name__()
{
    if [[    "${0}" =~ (^"-bash"$|^"bash"$) ]] &&
       [[ ! x"${0}" == x"${BASH_SOURCE[0]}" ]];
    then echo "__source__"
    fi
}
#
function self_realpath()
{
    local source="${BASH_SOURCE[0]}"
    while [[ -h "${source}" ]];
    do
        local target="$(readlink "${source}")"
        if [[ "${target}" == /* ]];
        then source="${target}"
        else
            local dir="$(dirname "${source}")"
            source="${dir}/${target}"
        fi
    done
    printf "${source}"
}
#
function self_dirname()
{
    printf "$(dirname "$(self_realpath)")"
}
#
function do_init()
{
    export TERM="${TERM:-xterm-256color}"
    export TERMINFO="/usr/gnu/share/terminfo"
    export PS1=""
    export PS1+="\[\033[0;32m\]>>>\[\033[0m\]"
    export PS1+="\[\033[0;36m\]Prompt\[\033[0m\]"
    export PS1+="\[\033[0;31m\]-\[\033[0m\]"
    export PS1+="\[\033[07;34;41m\]\h\[\033[0m\]\[\033[0;31m\]-\[\033[0m\]\[\033[1;34m\]\t\[\033[0m\]"
    export PS1+="\[\033[0;31m\]@\[\033[0m\]"
    export PS1+="\[\033[1;33m\]\w\[\033[0m\]"
    export PS1+="\n"
    export PS1+="\[\033[0;35m\]\u\[\033[0m\]\[\033[1;33m\]\$\[\033[0m\] "
    #
    function isa-debug-on    () { export lw_set_debug=true    ; }
    function isa-debug-off   () { export lw_set_debug=false   ; }
    function isa-strict-on   () { export lw_set_strict=true   ; }
    function isa-strict-off  () { export lw_set_strict=false  ; }
    function isa-autocir-on  () { export lw_set_autocir=true  ; }
    function isa-autocir-off () { export lw_set_autocir=false ; }
    function isa-x-on        () { export lw_set_gui=true      ; }
    function isa-x-off       () { export lw_set_gui=false     ; }
    function isa-freeze-on   () { export lw_set_freeze=true   ; }
    function isa-freeze-off  () { export lw_set_freeze=false  ; }
    function isa-timer-on    () { export lw_set_timer=true    ; }
    function isa-timer-off   () { export lw_set_timer=false   ; }
    function isa-loop-on     () { export lw_set_loop=true     ; }
    function isa-loop-off    () { export lw_set_loop=false    ; }
    function isa-verbose-on  () { export lw_set_verbose=true  ; }
    function isa-verbose-off () { export lw_set_verbose=false ; }
    #
    function isa-cd () { cd "$(self_dirname)" ; }
    #
    isa-debug-off
    isa-strict-on
    isa-autocir-off
    isa-x-off
    isa-freeze-on
    isa-timer-off
    isa-loop-on
    isa-verbose-off
    #
    for filename in $(ls "$(self_dirname)/" | grep ".Configure.About.view.boot.sh");
    do  source "$(self_dirname)/${filename}"
    done
}
#
function set_prompt()
{
    if [[ "${lw_set_verbose}" == true ]];
    then export PS3="$(printf "${ui_hr_t6_tail1}\n\033[0;35m$(whoami)\033[0m\033[92m>>>\033[0m " | awk 'NF')"
    fi
}
#
function do_args()
{
    static_stdin_argv=( "${BASH_ARGV[@]:1}" )
    #
    if [[ "${#static_stdin_argv[@]}" == 0 ]];
    then echo -n
    else static_basename_called="${static_stdin_argv[0]}.sh"
    fi
}
#
function do_load()
{
    static_nav_domain=""
    local array_basename_intf_c=( $(echo "$(basename "${0}")" | tr "." "\n") )
    #
    for slice_domain in "${array_basename_intf_c[@]}";
    do
        [[ "${slice_domain}" == "agw"        ]] || \
        [[ "${slice_domain}" == "model"      ]] || \
        [[ "${slice_domain}" == "controller" ]] && break
        static_nav_domain+=".${slice_domain}"
        static_nav_domain="${static_nav_domain##.}"
    done
    #
    if [[ "${lw_set_verbose}" == true ]];
    then
        printf "%s\n" "${ui_hr_t1_tail1}"
        local string_display="$(printf "${ui_label_author}" "author" "${__author__}")"
        printf "%s%s\n" "${string_display}" "${ui_hr_t2_tail1:6+4+${#__author__}}"
        local string_display="$(printf "${ui_label_domain}" "domain" "${static_nav_domain}")"
        printf "%s%s\n" "${string_display}" "${ui_hr_t2_tail1:6+4+${#static_nav_domain}}"
    fi
    #
    for slice_domain in "${array_basename_intf_c[@]}";
    do
        local string_domain+=".${slice_domain}"
        string_domain="${string_domain##.}"
        local realpath_intf_m="$(self_dirname)/${string_domain}.model.sh"
        [[ ! -f "${realpath_intf_m}" ]] && continue
        source "${realpath_intf_m}"
        if [[ "${lw_set_verbose}" == true ]];
        then
            local fqdn_intf_m="$(basename "${realpath_intf_m%.sh*}")"
            local string_display="$(printf "${ui_label_loaded}" "loaded" "${fqdn_intf_m}")"
            printf "%s%s\n" "${string_display}" "${ui_hr_t2_tail1:6+4+${#fqdn_intf_m}}"
        fi
    done
    #
    if [[ "${lw_set_verbose}" == true ]] &&
       [[ "${#static_stdin_argv[@]}" == 0 ]];
    then printf "%s\n" "${ui_hr_t3_tail1}"
    fi
}
#
function do_call()
{
    if [[ "${#static_stdin_argv[@]}" == 0 ]];
    then return 0
    fi
    if [[ ! "${#static_stdin_argv[@]}" == 0 ]];
    then $(echo "${static_basename_called}" | grep -q "${static_nav_domain}") || return 0
    fi
    #
    if [[ ! "${#static_stdin_argv[@]}" == 0 ]];
    then [[ ! -f "$(self_dirname)/${static_basename_called}" ]] && return 0
    fi
    #
    if [[ "${lw_set_verbose}" == true ]];
    then
        local string_called="${static_basename_called}"
        local basename_intf_v="view.${string_called#*view.}"
        local fqdn_intf_v="${basename_intf_v%.sh*}"
        #
        string_display="$(printf "${ui_label_called}" "called" "${fqdn_intf_v}")"
        printf "%s%s\n" "${string_display}" "${ui_hr_t2_tail1:6+4+${#fqdn_intf_v}}"
        printf "%s\n" "${ui_hr_t4_tail1}"
        printf "%s\n" "${ui_hr_t5_tail1}"
    fi
    #
    local timestart="$(date +"%s")"
    source "$(self_dirname)/${static_basename_called}"
    local timeend="$(date +"%s")"
    #
    if [[ "${lw_set_verbose}" == true ]];
    then printf "%s\n" "${ui_hr_t5_tail1}"
    fi
    #
    return 0
}
#
function do_menu()
{
    set_prompt
    [[ "${lw_set_loop}" == false ]] && exit
    [[ "${lw_set_gui}"  == true  ]] &&
        graphic_select_call "$(ls "$(self_dirname)")" ||
        textual_select_call "$(ls "$(self_dirname)")"
}
#
function textual_select_call()
{
    COLUMNS=12
    local array_fqdn=( ${@} )
    local array_catalog=( )
    if [[ $(printf "%s\n" "${array_fqdn[@]}" | \
            grep "^${static_nav_domain}.[a-zA-Z]*.controller.sh" | \
            wc -l) -gt 0 ]];
    then
        array_catalog+=( $(
            printf "%s\n" "${array_fqdn[@]}"                       | \
              grep "^${static_nav_domain}.[a-zA-Z]*.controller.sh" | \
              sort --ignore-case                                   | \
               sed "s/^${static_nav_domain}.//g;                     \
                    s/.sh$//g;                                       \
                    s/\./$(printf "\033[0;31m&\033[0m")/g;           \
                    s/controller/$(printf "\033[35m&\033[0m")/g;     \
                   "
        ) )
    fi
    if [[ $(printf "%s\n" "${array_fqdn[@]}"    | \
            grep "^${static_nav_domain}.view.*" | \
            wc -l) -gt 0 ]];
    then
        array_catalog+=( $(
            printf "%s\n" "${array_fqdn[@]}"               | \
              grep "^${static_nav_domain}.view.*"          | \
              sort --ignore-case                           | \
               sed "s/^${static_nav_domain}.//g;             \
                    s/.sh$//g;                               \
                    s/\./$(printf "\033[31m&\033[0m")/g;     \
                    s/view/$(printf "\033[36m&\033[0m")/g;   \
                   "
        ) )
    fi
    if [[ -f "$(self_dirname)/${static_nav_domain%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "${ui_label_scout}" "---scout---") )
    fi
    #
    select selected_option in "${array_catalog[@]}";
    do
        printf "You selected ${REPLY}\n"
        selected_option=$(echo "${selected_option}" | sed "s/$(printf '\033')\\[[0-9;]*[a-zA-Z]//g")
        #
        $(echo "${selected_option}" | grep -q "scout")      && \
        exec bash "$(self_dirname)/${static_nav_domain%.*}.controller.sh"
        #
        $(echo "${selected_option}" | grep -q "controller") && \
        exec bash "$(self_dirname)/${static_nav_domain}.${selected_option}.sh"
        #
        $(echo "${selected_option}" | grep -q "view")       && \
        exec bash "$(self_dirname)/${static_nav_domain}.controller.sh" "${static_nav_domain}.${selected_option}"
    done
}
#
function graphic_select_call()
{
    local array_fqdn=( ${@} )
    local array_catalog=( )
    if [[ $(printf "%s\n" "${array_fqdn[@]}" | \
            grep "^${static_nav_domain}.[a-zA-Z]*.controller.sh" | \
            wc -l) -gt 0 ]];
    then
        array_catalog+=( $(
            printf "%s\n" "${array_fqdn[@]}"                       | \
              grep "^${static_nav_domain}.[a-zA-Z]*.controller.sh" | \
              sort --ignore-case                                   | \
               sed "s/^${static_nav_domain}.//g;                     \
                    s/.sh$//g;"
        ) )
    fi
    if [[ $(printf "%s\n" "${array_fqdn[@]}"   | \
            grep "^${static_nav_domain}.view*" | \
            wc -l) -gt 0 ]];
    then
        array_catalog+=( $(
            printf "%s\n" "${array_fqdn[@]}"     | \
              grep "^${static_nav_domain}.view*" | \
              sort --ignore-case                 | \
               sed "s/^${static_nav_domain}.//g;   \
                    s/.sh$//g;"
        ) )
    fi
    if [[ -f "$(self_dirname)/${static_nav_domain%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "%s" "---scout---") )
    fi
    #
    local array_option=( )
    for n in $(seq 1 "${#array_catalog[@]}");
    do  array_option+=( "${n}" "${array_catalog[ ${n} - 1 ]}" )
    done
    local selected_id="$(dialog --ascii-lines                      \
                                --backtitle "${static_nav_domain}" \
                                --title "iSystemAdministrator"     \
                                --no-cancel --ok-label "OKAY"      \
                                --menu "iSA-menu:" 19 65 12        \
                                --output-fd 1 "${array_option[@]}")"
    local selected_option="${array_catalog[ ${selected_id} - 1 ]}"
    #
    $(echo "${selected_option}" | grep -q "scout")      && \
    exec bash "$(self_dirname)/${static_nav_domain%.*}.controller.sh"
    #
    $(echo "${selected_option}" | grep -q "controller") && \
    exec bash "$(self_dirname)/${static_nav_domain}.${selected_option}.sh"
    #
    $(echo "${selected_option}" | grep -q "view")       && \
    exec bash "$(self_dirname)/${static_nav_domain}.controller.sh" "${static_nav_domain}.${selected_option}"
}
#
function remark()
{
    echo "${1}"
    bash --rcfile <(echo 'source ~/.bash_profile; ')
}
#
#
#
#
#
main
#exit 0;
#
#
#
#
#
