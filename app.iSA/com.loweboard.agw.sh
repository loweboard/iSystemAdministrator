#!/usr/bin/env bash
#
# iSystemAdministrator -- <iSA>! a MVC pattern selection-^MENU
# Copyright (C) 2012-2015 LOWE/SAAU-LOON <224428@gmail.com>
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
#
#.est
__version__="""0.1"""
__author__="""<iSA>! a MVC pattern selection-^MENU{=r[${__version__}]}+"""
#
COLUMNS=1
#
ui_scr_maxcols=80
ui_scr_mincols=56
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
ui_label_author='\033[96m%s\033[0m=)>-\033[04;92m%s\033[0m'
ui_label_domain='\033[94m%s\033[0m=)>-\033[93m%s\033[0m'
ui_label_loaded='\033[31m%s\033[0m=)>-\033[91m%s\033[0m'
ui_label_called='\033[35m%s\033[0m=)>-\033[95m%s\033[0m'
ui_label_scout='\033[04;33m%s\033[0m'
#
function main()
{
    if [[ "$(__name__)" == "__source__" ]];
    then { do_init; return 0; }
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
function self_longest()
{
    local category="${1:-agw}"
    local src_path="${2:-$(self_realpath)}"
    local src_name="$(basename "${src_path}")"
    local dst_name=""
    #
    while [[ "${src_name}" != "${src_name%%.*}" ]]; do
        src_name="${src_name%.*}";
        dst_name="${src_name}.${category}.sh";
        if [[ -f "$(dirname "${src_path}")/${dst_name}" ]];
        then break;
        fi
    done
    if [[ "${dst_name}" == *".${category}.sh" ]];
    then printf "${dst_name}"
    else printf "${dst_name}.${category}.sh"
    fi
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
    function isa-set--debug-on    () { export __pragma__set_debug=true    ; }
    function isa-set--debug-off   () { export __pragma__set_debug=false   ; }
    function isa-set--strict-on   () { export __pragma__set_strict=true   ; }
    function isa-set--strict-off  () { export __pragma__set_strict=false  ; }
    function isa-set--autocir-on  () { export __pragma__set_autocir=true  ; }
    function isa-set--autocir-off () { export __pragma__set_autocir=false ; }
    function isa-set--x-on        () { export __pragma__set_tui=true      ; }
    function isa-set--x-on        () { export __pragma__set_tui=false     ; }
    function isa-set--freeze-on   () { export __pragma__set_freeze=true   ; }
    function isa-set--freeze-off  () { export __pragma__set_freeze=false  ; }
    function isa-set--timer-on    () { export __pragma__set_timer=true    ; }
    function isa-set--timer-off   () { export __pragma__set_timer=false   ; }
    function isa-set--loop-on     () { export __pragma__set_loop=true     ; }
    function isa-set--loop-off    () { export __pragma__set_loop=false    ; }
    function isa-set--verbose-on  () { export __pragma__set_verbose=true  ; }
    function isa-set--verbose-off () { export __pragma__set_verbose=false ; }
    #
    function isa-cd() { cd "$(self_dirname)"; }
    function isa-select()
    {
        COLUMNS=1
        local array_catalog=( $(ls "$(self_dirname)" | grep ".agw.sh") )
        select selected_option in "${array_catalog[@]}";
        do source "$(self_dirname)/${selected_option}"; break;
        done
    }
    #
    isa-set--debug-off
    isa-set--strict-on
    isa-set--autocir-off
    isa-set--x-on
    isa-set--freeze-on
    isa-set--timer-off
    isa-set--loop-on
    isa-set--verbose-off
    #
    #//^:-#<![head[@string('simple loader')]]>
    t="$(dirname "${BASH_SOURCE[0]}")"; r="$(basename "${BASH_SOURCE[0]}")";
    while [[ "${r}" != "${r%%.*}" ]]; do r="${r%.*}";
    p="${t}/${r}.model.sh"; [[ -f "${p}" ]] && source "${p}";
    p="${t}/${r}.Configure.About.view.boot.sh"; [[ -f "${p}" ]] && source "${p}";
    done
    #//^:-#<![tail[]]>
    #
}
#
function prompt_setup()
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
    else __static__filename_called="${__static__argv[0]}.sh"
    fi
}
#
function do_load()
{
    __static__dptr=""
    local array_cptr=( $(echo "$(basename "${0}")" | tr "." "\n") )
    #
    for slice in "${array_cptr[@]}";
    do
        if [[ "${slice}" == "agw"        ]] ||
           [[ "${slice}" == "model"      ]] ||
           [[ "${slice}" == "controller" ]];
        then break
        fi
        __static__dptr+=".${slice}"
        __static__dptr="${__static__dptr##.}"
    done
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then
        printf "%s\n" "${ui_span_hr1tail1}"
        local string_display="$(printf "${ui_label_author}" "author" "${__author__}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#__author__}}"
        local string_display="$(printf "${ui_label_domain}" "domain" "${__static__dptr}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#__static__dptr}}"
    fi
    #
    for slice in "${array_cptr[@]}";
    do
        local string_domain+=".${slice}"
        string_domain="${string_domain##.}"
        local realpath_mptr="$(self_dirname)/${string_domain}.model.sh"
        [[ ! -f "${realpath_mptr}" ]] && continue
        source "${realpath_mptr}"
        if [[ "${__pragma__set_verbose}" == true ]];
        then
            local string_mptr="$(basename "${realpath_mptr%.sh*}")"
            local string_display="$(printf "${ui_label_loaded}" "loaded" "${string_mptr}")"
            printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#string_mptr}}"
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
    then $(echo "${__static__filename_called}" | grep -q "${__static__dptr}") || return 0
    fi
    if [[ ! "${#__static__argv[@]}" == 0 ]];
    then [[ ! -f "$(self_dirname)/${__static__filename_called}" ]] && return 0
    fi
    #
    if [[ "${__pragma__set_verbose}" == true ]];
    then
        local string_called="${__static__filename_called}"
        local basename_vptr="view.${string_called#*view.}"
        local string_vptr="${basename_vptr%.sh*}"
        #
        string_display="$(printf "${ui_label_called}" "called" "${string_vptr}")"
        printf "%s%s\n" "${string_display}" "${ui_span_hr2tail1:6+4+${#string_vptr}}"
        printf "%s\n" "${ui_span_hr4tail1}"
        printf "%s\n" "${ui_span_hr5tail1}"
    fi
    #
    local timestart="$(date +"%s")"
    source "$(self_dirname)/${__static__filename_called}"
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
    prompt_setup
    if [[ "${__pragma__set_loop}" == false ]];
    then exit
    fi
    if [[ "${__pragma__set_tui}" == true ]];
    then mnutui_selects "$(ls "$(self_dirname)")"
    elif [[ "${__pragma__set_tui}" == false ]];
    then mnucli_selects "$(ls "$(self_dirname)")"
    fi
}
#
function mnucli_selects()
{
    local array_argv=( ${@} )
    local array_catalog=( )
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__dptr}.[a-zA-Z]*.controller.sh" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__dptr}.[a-zA-Z]*.controller.sh" |`
             `sort --ignore-case |`
              `sed "s/^${__static__dptr}.//g;`
                  ` s/.sh$//g;`
                  ` s/\./$(printf "\033[0;31m&\033[0m")/g;`
                  ` s/controller/$(printf "\033[35m&\033[0m")/g;`
                  `"`
        `) )
    fi
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__dptr}.view.*" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__dptr}.view.*" |`
             `sort --ignore-case |`
              `sed "s/^${__static__dptr}.//g;`
                  ` s/.sh$//g;`
                  ` s/\./$(printf "\033[31m&\033[0m")/g;`
                  ` s/view/$(printf "\033[36m&\033[0m")/g;`
                  `"`
        `) )
    fi
    if [[ -f "$(self_dirname)/${__static__dptr%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "${ui_label_scout}" "---scout---") )
    fi
    #
    select selected_option in "${array_catalog[@]}";
    do
        printf "You selected ${REPLY}\n"
        selected_option=$(echo "${selected_option}" | sed "s/$(printf '\033')\\[[0-9;]*[a-zA-Z]//g")
        #
        $(echo "${selected_option}" | grep -q "scout") &&`
            `exec bash "$(self_dirname)/${__static__dptr%.*}.controller.sh"
        #
        $(echo "${selected_option}" | grep -q "controller") &&`
            `exec bash "$(self_dirname)/${__static__dptr}.${selected_option}.sh"
        #
        $(echo "${selected_option}" | grep -q "view") &&`
            `exec bash "$(self_dirname)/${__static__dptr}.controller.sh" "${__static__dptr}.${selected_option}"
    done
}
#
function mnutui_selects()
{
    local array_argv=( ${@} )
    local array_catalog=( )
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__dptr}.[a-zA-Z]*.controller.sh" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__dptr}.[a-zA-Z]*.controller.sh" |`
             `sort --ignore-case |`
              `sed "s/^${__static__dptr}.//g;`
                  ` s/.sh$//g;"`
        `) )
    fi
    local count="$(`
        `printf "%s\n" "${array_argv[@]}" |`
          `grep "^${__static__dptr}.view.*" |`
            `wc -l`
    `)"
    if [[ "${count}" -gt 0 ]];
    then
        array_catalog+=( $(`
           `printf "%s\n" "${array_argv[@]}" |`
             `grep "^${__static__dptr}.view*" |`
             `sort --ignore-case |`
              `sed "s/^${__static__dptr}.//g;`
                  ` s/.sh$//g;"`
        `) )
    fi
    if [[ -f "$(self_dirname)/${__static__dptr%.*}.controller.sh" ]];
    then array_catalog+=( $(printf "%s" "---scout---") )
    fi
    #
    local array_option=( )
    for n in $(seq 1 "${#array_catalog[@]}");
    do  array_option+=( "${n}" "${array_catalog[ ${n} - 1 ]}" )
    done
    local selected_id="$(dialog`
        ` --ascii-lines`
        ` --backtitle "${__static__dptr}"`
        ` --title "iSystemAdministrator"`
        ` --no-cancel --ok-label "OKAY"`
        ` --menu "iSA-menu:" 19 65 12`
        ` --output-fd 1 "${array_option[@]}"`
        `)"
    local selected_option="${array_catalog[ ${selected_id} - 1 ]}"
    #
    $(echo "${selected_option}" | grep -q "scout") &&`
        `exec bash "$(self_dirname)/${__static__dptr%.*}.controller.sh"
    #
    $(echo "${selected_option}" | grep -q "controller") &&`
        `exec bash "$(self_dirname)/${__static__dptr}.${selected_option}.sh"
    #
    $(echo "${selected_option}" | grep -q "view") &&`
        `exec bash "$(self_dirname)/${__static__dptr}.controller.sh" "${__static__dptr}.${selected_option}"
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
#
#
#
#
#
