#!/usr/bin/env bash
#
# iSystemAdministrator -- <iSA>! a MVC pattern selection-^MENU
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
# via https://github.com/loweboard/iSystemAdministrator
#
__version__="""0.1"""
__author__="""<iSA>! a MVC pattern selection-^MENU{=r[${__version__}]}+"""
#
ui_span_hr1tail1="""^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"""
ui_span_hr1tail2="""^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"""
ui_span_hr2tail1="""||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""
ui_span_hr2tail2="""||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""
ui_span_hr3tail1="""!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"""
ui_span_hr3tail2="""!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"""
ui_span_hr4tail1='''""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
ui_span_hr4tail2='''""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'''
ui_span_hr5tail1="""''''''''''''''''''''''''''''''''''''''''''''''''''''''''"""
ui_span_hr5tail2="""''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"""
ui_span_hr6tail1="""________________________________________________________"""
ui_span_hr6tail2="""________________________________________________________________________________"""
#
ui_scr_maxcols=80
ui_scr_mincols=56
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
    function isa-debug-on    () { export __pragma__set_debug=true    ; }
    function isa-debug-off   () { export __pragma__set_debug=false   ; }
    function isa-strict-on   () { export __pragma__set_strict=true   ; }
    function isa-strict-off  () { export __pragma__set_strict=false  ; }
    function isa-autocir-on  () { export __pragma__set_autocir=true  ; }
    function isa-autocir-off () { export __pragma__set_autocir=false ; }
    function isa-x-on        () { export __pragma__set_tui=true      ; }
    function isa-x-off       () { export __pragma__set_tui=false     ; }
    function isa-freeze-on   () { export __pragma__set_freeze=true   ; }
    function isa-freeze-off  () { export __pragma__set_freeze=false  ; }
    function isa-timer-on    () { export __pragma__set_timer=true    ; }
    function isa-timer-off   () { export __pragma__set_timer=false   ; }
    function isa-loop-on     () { export __pragma__set_loop=true     ; }
    function isa-loop-off    () { export __pragma__set_loop=false    ; }
    function isa-verbose-on  () { export __pragma__set_verbose=true  ; }
    function isa-verbose-off () { export __pragma__set_verbose=false ; }
    #
    function isa-cd () { cd "$(self_dirname)"; }
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
    if [[ "${__pragma__set_verbose}" == true ]];
    then export PS3="$(printf "${ui_span_hr6tail1}\n\033[0;35m$(whoami)\033[0m\033[92m>>>\033[0m " | awk 'NF')"
    fi
}
#
function do_args()
{
    __static__argv=( "${BASH_ARGV[@]:1}" )
    #
    if [[ "${#__static__argv[@]}" == 0 ]];
    then echo -n
    else __static__basename_called="${__static__argv[0]}.sh"
    fi
}
#
function do_load()
{
    __static__cwd_dn=""
    local array_kind_cif=( $(echo "$(basename "${0}")" | tr "." "\n") )
    #
    for slice in "${array_kind_cif[@]}";
    do
        if [[ "${slice}" == "agw"        ]] ||
           [[ "${slice}" == "model"      ]] ||
           [[ "${slice}" == "controller" ]];
        then break
        fi
        __static__cwd_dn+=".${slice}"
        __static__cwd_dn="${__static__cwd_dn##.}"
    done
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then
        printf "%s\n" "${ui_span_hr1tail1}"
        local string_display="$(printf "${ui_label_author}" "author" "${__author__}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#__author__}}"
        local string_display="$(printf "${ui_label_domain}" "domain" "${__static__cwd_dn}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#__static__cwd_dn}}"
    fi
    #
    for slice in "${array_kind_cif[@]}";
    do
        local string_domain+=".${slice}"
        string_domain="${string_domain##.}"
        local realpath_kind_mif="$(self_dirname)/${string_domain}.model.sh"
        [[ ! -f "${realpath_kind_mif}" ]] && continue
        source "${realpath_kind_mif}"
        if [[ "${__pragma__set_verbose}" == true ]];
        then
            local string_kind_mif="$(basename "${realpath_kind_mif%.sh*}")"
            local string_display="$(printf "${ui_label_loaded}" "loaded" "${string_kind_mif}")"
            printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#string_kind_mif}}"
        fi
    done
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then
        if [[ "${#__static__argv[@]}" == 0 ]] || [[ "${__static__argv[*]}" == "none" ]];
        then printf "%s\n" "${ui_span_hr3tail1}"
        fi
    fi
}
#
function do_call()
{
    if [[ "${#__static__argv[@]}" == 0 ]];
    then return 0
    fi
    if [[ ! "${#__static__argv[@]}" == 0 ]];
    then $(echo "${__static__basename_called}" | grep -q "${__static__cwd_dn}") || return 0
    fi
    if [[ ! "${#__static__argv[@]}" == 0 ]];
    then [[ ! -f "$(self_dirname)/${__static__basename_called}" ]] && return 0
    fi
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then
        local string_called="${__static__basename_called}"
        local basename_kind_vif="view.${string_called#*view.}"
        local string_kind_vif="${basename_kind_vif%.sh*}"
        #
        string_display="$(printf "${ui_label_called}" "called" "${string_kind_vif}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#string_kind_vif}}"
        printf "%s\n" "${ui_span_hr4tail1}"
        printf "%s\n" "${ui_span_hr5tail1}"
    fi
    #
    local timestart="$(date +"%s")"
    source "$(self_dirname)/${__static__basename_called}"
    local timeended="$(date +"%s")"
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then printf "%s\n" "${ui_span_hr5tail1}"
    fi
    #
    return 0
}
#
function do_menu()
{
    set_prompt
    if [[ "${__pragma__set_loop}" == false ]];
    then exit
    fi
    if [[ "${__pragma__set_tui}" == true ]];
    then mnutui_select "$(ls "$(self_dirname)")"
    elif [[ "${__pragma__set_tui}" == false ]];
    then mnucli_select "$(ls "$(self_dirname)")"
    fi
}
#
function mnucli_select()
{
    COLUMNS=1
    local array_argv=( ${@} )
    local array_catalog=( )
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__cwd_dn}.[a-zA-Z]*.controller.sh" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__cwd_dn}.[a-zA-Z]*.controller.sh" |`
             `sort --ignore-case |`
              `sed "s/^${__static__cwd_dn}.//g;`
                  ` s/.sh$//g;`
                  ` s/\./$(printf "\033[0;31m&\033[0m")/g;`
                  ` s/controller/$(printf "\033[35m&\033[0m")/g;`
                  `"`
        `) )
    fi
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__cwd_dn}.view.*" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__cwd_dn}.view.*" |`
             `sort --ignore-case |`
              `sed "s/^${__static__cwd_dn}.//g;`
                  ` s/.sh$//g;`
                  ` s/\./$(printf "\033[31m&\033[0m")/g;`
                  ` s/view/$(printf "\033[36m&\033[0m")/g;`
                  `"`
        `) )
    fi
    if [[ -f "$(self_dirname)/${__static__cwd_dn%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "${ui_label_scout}" "---scout---") )
    fi
    #
    select selected_option in "${array_catalog[@]}";
    do
        printf "You selected ${REPLY}\n"
        selected_option=$(echo "${selected_option}" | sed "s/$(printf '\033')\\[[0-9;]*[a-zA-Z]//g")
        #
        $(echo "${selected_option}" | grep -q "scout") &&`
            `exec bash "$(self_dirname)/${__static__cwd_dn%.*}.controller.sh"
        #
        $(echo "${selected_option}" | grep -q "controller") &&`
            `exec bash "$(self_dirname)/${__static__cwd_dn}.${selected_option}.sh"
        #
        $(echo "${selected_option}" | grep -q "view") &&`
            `exec bash "$(self_dirname)/${__static__cwd_dn}.controller.sh" "${__static__cwd_dn}.${selected_option}"
    done
}
#
function mnutui_select()
{
    local array_argv=( ${@} )
    local array_catalog=( )
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__cwd_dn}.[a-zA-Z]*.controller.sh" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__cwd_dn}.[a-zA-Z]*.controller.sh" |`
             `sort --ignore-case |`
              `sed "s/^${__static__cwd_dn}.//g;`
                  ` s/.sh$//g;"`
        `) )
    fi
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__cwd_dn}.view.*" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__cwd_dn}.view*" |`
             `sort --ignore-case |`
              `sed "s/^${__static__cwd_dn}.//g;`
                  ` s/.sh$//g;"`
        `) )
    fi
    if [[ -f "$(self_dirname)/${__static__cwd_dn%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "%s" "---scout---") )
    fi
    #
    local array_option=( )
    for n in $(seq 1 "${#array_catalog[@]}");
    do  array_option+=( "${n}" "${array_catalog[ ${n} - 1 ]}" )
    done
    local selected_id="$(dialog`
        ` --ascii-lines`
        ` --backtitle "${__static__cwd_dn}"`
        ` --title "iSystemAdministrator"`
        ` --no-cancel --ok-label "OKAY"`
        ` --menu "iSA-menu:" 19 65 12`
        ` --output-fd 1 "${array_option[@]}"`
        `)"
    local selected_option="${array_catalog[ ${selected_id} - 1 ]}"
    #
    $(echo "${selected_option}" | grep -q "scout") &&`
        `exec bash "$(self_dirname)/${__static__cwd_dn%.*}.controller.sh"
    #
    $(echo "${selected_option}" | grep -q "controller") &&`
        `exec bash "$(self_dirname)/${__static__cwd_dn}.${selected_option}.sh"
    #
    $(echo "${selected_option}" | grep -q "view") &&`
        `exec bash "$(self_dirname)/${__static__cwd_dn}.controller.sh" "${__static__cwd_dn}.${selected_option}"
}
#
function remark()
{
    echo "${1}"
    bash --rcfile <(echo 'source ~/.bash_profile;')
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
