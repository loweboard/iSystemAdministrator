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
#//^:-#<![head[@hash(7354f1985608c0121efdf93ae1cb995d)]]>
#//^:-#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#//^:-#!! DO NOT MODIFY UNLESS HANDLE BY SYSTEM UPDATE !!
#//^:-#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
__file__="$(basename "${BASH_SOURCE[0]}")"
__fqdn__="${__file__%.sh}"
#//^:-#<![tail[@hash(7354f1985608c0121efdf93ae1cb995d)]]>
filename="${__fqdn__}"
filename="${filename%.Configure.About.view.*}"
filename="${filename}.Configure.About.view.bashrc.sh"
source "$(self_dirname)/${filename}"
