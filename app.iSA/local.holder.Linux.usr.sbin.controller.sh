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
#//^:-#<![head[@hash(2dac1a9f0563ab870a6d5928ac5f60f3)]]>
#//^:-#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#//^:-#!! DO NOT MODIFY UNLESS HANDLE BY SYSTEM UPDATE !!
#//^:-#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
t="$(dirname "${0}")"; r="$(basename "${0}")";
while [[ "${r}" != "${r%%.*}" ]]; do r="${r%.*}";
p="${t}/${r}.agw.sh"; [[ -f "${p}" ]] && source "${p}";
p="${t}/${r}.model.sh"; [[ -f "${p}" ]] && source "${p}";
done
#//^:-#<![tail[@hash(2dac1a9f0563ab870a6d5928ac5f60f3)]]>
