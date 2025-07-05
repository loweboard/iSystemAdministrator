# iSystemAdministrator
## Provision
![alt text](../master/assets/image/game_bwgo.png)<br>
## Preview Slayer 0x3
![alt text](../master/assets/image/ui_preview_slayer_0x3.png)<br>
## Preview Slayer 0x2
![alt text](../master/assets/image/ui_preview_slayer_0x2.png)<br>
## Preview Slayer 0x1
![alt text](../master/assets/image/ui_preview_slayer_0x1.gif)<br>
## Preview
![alt text](../master/assets/image/ui_preview.gif)<br>

## Table of Contents
- [1 Introduction](#1-introduction)
    - [1.1 What is iSA?](#11-what-is-isa)
    - [1.2 Why use iSA?](#12-why-use-isa)
    - [1.3 How iSA better?](#13-how-isa-better)
- [2 Installation](#2-installation)
    - [2.1 System Requirements](#21-system-requirements)
    - [2.2 Optional Dependencies](#22-optional-dependencies)
    - [2.3 Auto Install](#23-auto-install)
    - [2.4 Manual Install](#24-manual-install)
- [3 Getting Started](#3-getting-started)
    - [3.1 Features](#31-features)
        - [3.1.1 Environment Command](#311-environment-command)
        - [3.1.2 Environment Command Configure Location](#312-environment-command-configure-location)
    - [3.2 Run Mode](#32-run-mode)
        - [3.2.1 Run as selection menu](#321-run-as-selection-menu)
        - [3.2.2 Run as selection menu with graphic](#322-run-as-selection-menu-with-graphic)
        - [3.2.3 Run as direct-execute command](#323-run-as-direct-execute-command)
- [4 FAQs](#4-faqs)
    - [4.1 How to add self-defined shell script?](#41-how-to-add-self-defined-shell-script)
    - [4.2 How to change submenu name?](#42-how-to-change-submenu-name)
    - [4.3 How to create level 2 submenu](#43-how-to-create-level-2-submenu)
- [5 References](#5-references)
    - [5.1 Author](#51-author)
    - [5.2 License](#52-license)
    - [5.3 Web-based implementation](#53-web-based-implementation)

## 1 Introduction
What is iSA?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\<iSA>! a MVC pattern selection-^MENU<br>

### 1.1 What is iSA?
iSystemAdministrastor (iSA) made command-based system operation to be simple, quick and good organize.<br>

### 1.2 Why use iSA?
What to do if you keep too many shell scripts and hard to find it out to execute or always forgot a complex command?<br>

### 1.3 How iSA better?
iSA selection-menu available to organize/collect/execute in MVC pattern.<br>
It stored your self-defined command or job and can be call it by selecting a numeric menu.<br>
Then you will never need any command-based system knowledge to run any complex command.<br>

## 2 Installation
Get latest source code and suggested install directory "~/bus.d"<br>

### 2.1 System Requirements
Any Bash available system and version 3.2.57 or greater<br>
#:-first to see external file can be linked up by using source command<br>
<<<EOF<br>
Any Bash available system and version 4.2.53 or greater<br>
#:-first to see hyphen and dot can be named to allocated memory<br>
<<<EOF<br>

### 2.2 Optional Dependencies
* awk<br>
* dialog<br>
* grep<br>
* head<br>
* sed<br>
* sort<br>
* sleep<br>
* tail<br>
* xargs<br>

### 2.3 Auto Install
```
curl -s https://raw.githubusercontent.com/loweboard/iSystemAdministrator/master/app.iSA/com.loweboard.Configure.About.view.install.sh | bash
```
; then restart terminal<br>

### 2.4 Manual Install
```
git clone https://github.com/loweboard/iSystemAdministrator.git ~/bus.d
echo "source ~/bus.d/app.iSA/com.loweboard.agw.sh" >> ~/.bash_profile
source ~/.bash_profile
```

## 3 Getting Started
3.1 Features<br>
3.2 Run Mode<br>

### 3.1 Features
* Organized by MVC pattern<br>
* Text ui and Graphic ui menu<br>
* Infinite level submenu<br>
* Any shell script port to iSA without coding needed (require change filename to iSA format only)<br>
* Any shell like Zsh, BASH, Python, PHP...etc<br>
* Each submenu has own model for self-definded variable to inherited by sub-level of menu<br>

#### 3.1.1 Environment Command
| Name                    | Type    | Description                                  |
| ----------------------- | ------- | -------------------------------------------- |
| `isa-set--debug-on`     | boolean | turn on debug mode.                          |
| `isa-set--debug-off`    | boolean | turn off debug mode.                         |
| `isa-set--verbose-on`   | boolean | show more information of command execution.  |
| `isa-set--verbose-off`  | boolean | show less information of command execution.  |

#### 3.1.2 Environment Command Configure Location
| Name                                           | Description                                   |
| ---------------------------------------------- | --------------------------------------------- |
| `com.loweboard.agw.sh`                         | system-wide settings saved by iSA.            |
| `com.loweboard.Configure.About.view.bashrc.sh` | per-user settings saved by the administrator. |
| `*.Configure.About.view.bashrc.sh`             | per-user settings saved by the user.          |
| ** Interactive Shell Terminal **               | per-session settings effective once .         |

### 3.2 Run Mode
3.2.1 Run as selection menu<br>
3.2.2 Run as selection menu with graphic<br>
3.2.3 Run as direct-execute command<br>

#### 3.2.1 Run as Selection Menu
```
$ isa
```
![alt text](../master/assets/image/ui_preview.gif)<br>

#### 3.2.2 Run as Selection Menu with Graphic
```
$ isa.set-x-on
$ isa
```
![alt text](../master/assets/image/ui_graphic_menu.gif)<br>

#### 3.2.3 Run as Direct-Execute Command
```
$ isa com.loweboard.AI.view.patrol
```
**parameter must be a view<br>
![alt text](../master/assets/image/ui_direct_menu.gif)<br>

## 4 FAQs
4.1 How to add self-defined shell script?<br>
4.2 How to change submenu name?<br>
4.3 How to create level 2 submenu?<br>

### 4.1 How to add self-defined shell script?
<b>question:</b><br>
What to do if i got a new standalone script named "chatbot.sh" and i would like to organized by iSA<br>
Would like to put in "AI submenu"<br>
<b>answer:</b><br>
We look in "AI submenu" at ~/bus.d/app.iSA folder as below<br>

```
com.loweboard.AI.controller.sh
com.loweboard.AI.model.sh
com.loweboard.AI.view.patrol.sh
```

It very simple just as below<br>

- rename "chatbot.sh"<br>

```
$ mv chatbot.sh com.loweboard.AI.view.chatbot.sh
```

- Result<br>

```
com.loweboard.AI.controller.sh
com.loweboard.AI.model.sh
com.loweboard.AI.view.chatbot.sh
com.loweboard.AI.view.patrol.sh
```

Then will show in iSA menu and effective immediately<br>
**also you can rename your script to under any level of submenu without any coding.<br>

### 4.2 How to change submenu name?
<b>question:</b><br>
What to do if i want to change "AI submenu" name to "BI"?<br>
<b>anwser:</b><br>
We look in "AI submenu" at ~/bus.d/app.iSA folder as below<br>

```
com.loweboard.AI.controller.sh
com.loweboard.AI.model.sh
com.loweboard.AI.view.patrol.sh
```

It very simple just as below<br>

- Rename domain "com.loweboard.AI"<br>
 
```
$ mv com.loweboard.AI.controller.sh com.loweboard.BI.controller.sh
$ mv com.loweboard.AI.model.sh com.loweboard.BI.model.sh
$ mv com.loweboard.AI.view.patrol.sh com.loweboard.BI.view.patrol.sh
```

- Result<br>

```
com.loweboard.BI.controller.sh
com.loweboard.BI.model.sh
com.loweboard.BI.view.patrol.sh
```

Then will show in iSA menu and effective immediately<br>

### 4.3 How to create level 2 submenu?
<b>question:</b><br>
What to do if i want to add "chatbot.sh" to "Bot submenu" under "AI submenu"?<br>
<b>anwser:</b><br>
We look in "AI submenu" at ~/bus.d/app.iSA folder as below<br>

```
com.loweboard.AI.controller.sh
com.loweboard.AI.model.sh
com.loweboard.AI.view.patrol.sh
```

It very simple just as below<br>

- Copy a set of controller and model from "AI submenu"<br>

```
$ cp com.loweboard.AI.controller.sh com.loweboard.AI.Bot.controller.sh
$ cp com.loweboard.AI.model.sh com.loweboard.AI.Bot.model.sh
```

- Rename "chatbot.sh"<br>

```
$ mv chatbot.sh com.loweboard.AI.Bot.view.chatbot.sh
```

- Result<br>

```
com.loweboard.AI.controller.sh
com.loweboard.AI.model.sh
com.loweboard.AI.Bot.controller.sh
com.loweboard.AI.Bot.model.sh
com.loweboard.AI.Bot.view.chatbot.sh
com.loweboard.AI.view.patrol.sh
```

Then will show in iSA menu and effective immediately<br>
**also same to level 3,4,5 etc.., it support infinite level submenu<br>

## 5 References
5.1 Author<br>
5.2 License<br>
5.3 Web-based implementation<br>

### 5.1 Author
Gnu.org<br>

- /us/en: [@us/en](mailto:sysadmin@fsf.org)
- /book: [@book](mailto:info@fsf.org)

LOWE/SAAU-LOON MR<br>

- Twitter: [@loweboard](https://twitter.com/loweboard)
- Github: [@loweboard](https://github.com/loweboard)

### 5.2 License
Copyright © 2012-2015, 2024 [loweboard](https://github.com/loweboard).<br>
This project is [GNU General Public License v3.0](https://github.com/loweboard/iSystemAdministrator/blob/master/LICENSE.txt) licensed.<br>

### 5.3 Web-based Implementation
**Visit <a href="http://www.loweboard.com/">Web-based implementation which embedded in iSA</a>.**<br>
