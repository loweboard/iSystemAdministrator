# iSystemAdministrator
## Preview 0x1
![alt text](../master/assets/image/ui_preview.gif)<br>
## Preview 0x2
![alt text](../master/assets/image/ui_preview_slayer_0x1.gif)<br>
## Vision
![alt text](../master/assets/image/game_bwgo.png)<br>

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
        - [3.1.3 Global Menu Option Command](#313-global-menu-option-command)
        - [3.1.4 Global Sitter Menu Option Command](#314-global-sitter-menu-option-command)
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
iSystemAdministrator (iSA) is an MVC-pattern selection menu tool designed for command-based systems.<br>

### 1.1 What is iSA?
iSystemAdministrator (iSA) simplifies command-line operations, making system administration quick, straightforward, and highly organized.<br>

### 1.2 Why use iSA?
If you manage too many shell scripts, struggle to locate them for execution, or constantly forget complex command syntaxes, iSA resolves these challenges by streamlining your workflow.<br>

### 1.3 How iSA better?
iSA provides a selection menu structured around the MVC pattern to organize, aggregate, and execute commands seamlessly.<br>
- It stores your custom commands or routine jobs, allowing you to trigger them simply by selecting a number from a menu.<br>
- Once configured, users can run complex tasks without needing deep command-line or system knowledge.<br>

## 2 Installation
The latest source code is available on GitHub. The recommended installation directory is ~/bus.d.<br>

### 2.1 System Requirements
- Bash version 3.2.57 or greater<br>
    - *<font color="red">Note:</font>* This is the minimum version required to link multiple external files using the source command.<br>
- Bash version 4.2.53 or greater<br>
    - *<font color="red">Note:</font>* This is the minimum version required to use hyphens and dots in function and variable names for memory allocation.<br>

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
Run the following command in your terminal. You will need to restart your terminal after the installation completes.<br>
```
curl -s https://raw.githubusercontent.com/loweboard/iSystemAdministrator/master/app.iSA/local.holder.Configure.About.view.install.sh | bash
```

### 2.4 Manual Install
```
git clone https://github.com/loweboard/iSystemAdministrator.git ~/bus.d
echo "source ~/bus.d/app.iSA/local.holder.agw.sh" >> ~/.bash_profile
source ~/.bash_profile
```

## 3 Getting Started
This section covers the core capabilities of iSA and its primary operation methods.<br>

### 3.1 Features
* **MVC Architecture:** Structured entirely around the Model-View-Controller pattern.<br>
* **Versatile UIs:** Supports Command-line (CLI), Textual (TUI), and Graphical (GUI) menus.<br>
* **Infinite Submenus:** Easily create deeply nested submenus through specific filename conventions.<br>
* **Zero Coding Porting:** Integrate any existing shell script into iSA instantly—just rename the file to match the iSA format.<br>
* **Broad Language Support:** Compatible with any shell environment or scripting language, including Zsh, Bash, Python, PHP, etc.<br>
* **Hierarchical Scoping:** Each submenu level has its own configuration model (*.model.sh) to define variables that cascade down to that level and all subsequent submenus.<br>

#### 3.1.1 Environment Command
| Name                    | Type    | Description                                  |
| ----------------------- | ------- | -------------------------------------------- |
| `isa-set--debug-on`     | boolean | turn on debug mode.                          |
| `isa-set--debug-off`    | boolean | turn off debug mode.                         |
| `isa-set--verbose-on`   | boolean | show more information of command execution.  |
| `isa-set--verbose-off`  | boolean | show less information of command execution.  |
| `isa-cd`                | dialog  | change working directory to current iSA path.|
| `isa-select`            | dialog  | select different holder of (*.agw.sh).       |
| `isa` ([tab])           | dialog  | autocomplete to show up menu and submenu.    |

#### 3.1.2 Environment Command Configure Location
| Name                                           | Description                                   |
| ---------------------------------------------- | --------------------------------------------- |
| `local.holder.agw.sh`                          | system-wide settings saved by iSA.            |
| `local.holder.Configure.About.view.bashrc.sh`  | per-user settings saved by the administrator. |
| `local.sitter.agw.sh`                          | system-wide settings saved by iSA.            |
| `local.sitter.Configure.About.view.bashrc.sh`  | per-user settings saved by the administrator. |
| `*.Configure.About.view.bashrc.sh`             | per-user settings saved by the user.          |
| ** Interactive Shell Terminal **               | per-session settings effective once .         |

#### 3.1.3 Global Menu Option Command
| Name                                           | Description                                   |
| ---------------------------------------------- | --------------------------------------------- |
| `1) (self->bel).controller`                    | call sitter tools menu (local.sitter.agw.sh). |
| `2) (self->dir).controller`                    | Reverts the working directory to the previous.|

#### 3.1.4 Global Sitter Menu Option Command
| Name                                           | Description                                   |
| ---------------------------------------------- | --------------------------------------------- |
| `*) (self->edit).view.*`                       | Opens Vim to edit the corresponding view file.|

### 3.2 Run Mode
iSA can be executed in three different ways depending on your interface preferences.<br>

#### 3.2.1 Run as Selection Menu with Command
```
$ isa
```
![alt text](../master/assets/image/ui_preview.gif)<br>

#### 3.2.2 Run as Selection Menu with Textual
```
$ isa-set--x-on
$ isa
```
![alt text](../master/assets/image/ui_graphic_menu.gif)<br>

#### 3.2.3 Run as Direct-Execute with AutoComplete
```
$ isa local.holder.AI.view.patrol
```
Alternatively, you can leverage tab-completion to find your view:<br>
```
$ isa local.([tab])
$ isa local.holder.([tab])
$ isa local.holder.AI.([tab])
$ isa local.holder.AI.view.([tab])
$ isa local.holder.AI.view.patrol
```
*<font color="red">Note:</font>* The final parameter targeted must always be a view file.<br>
![alt text](../master/assets/image/ui_direct_menu.gif)<br>

## 4 FAQs
4.1 How to add self-defined shell script?<br>
4.2 How to change submenu name?<br>
4.3 How to create level 2 submenu?<br>

### 4.1 How to add self-defined shell script?
<b>question:</b><br>
I have a standalone script called chatbot.sh. How do I organize it under the "AI" submenu using iSA?<br>
<b>answer:</b><br>
First, check the contents of the AI submenu folder at ~/bus.d/app.iSA. You will see files like this:<br>

```
local.holder.AI.controller.sh
local.holder.AI.model.sh
local.holder.AI.view.patrol.sh
```

To integrate your script, simply rename it to follow the iSA View naming convention:<br>

```
$ mv chatbot.sh local.holder.AI.view.chatbot.sh
```

- Result<br>

```
local.holder.AI.controller.sh
local.holder.AI.model.sh
local.holder.AI.view.chatbot.sh
local.holder.AI.view.patrol.sh
```

The script will appear in the iSA menu and become executable immediately. You can port scripts into any submenu tier without writing any extra code.<br>

### 4.2 How to change submenu name?
<b>question:</b><br>
How do I rename the "AI" submenu to "BI"?<br>
<b>anwser:</b><br>
Look at the files inside your ~/bus.d/app.iSA folder:<br>

```
local.holder.AI.controller.sh
local.holder.AI.model.sh
local.holder.AI.view.patrol.sh
```

Rename the prefix domain from local.holder.AI to local.holder.BI:<br>
 
```
$ mv local.holder.AI.controller.sh local.holder.BI.controller.sh
$ mv local.holder.AI.model.sh local.holder.BI.model.sh
$ mv local.holder.AI.view.patrol.sh local.holder.BI.view.patrol.sh
```

- Result<br>

```
local.holder.BI.controller.sh
local.holder.BI.model.sh
local.holder.BI.view.patrol.sh
```

The changes will reflect in your iSA menu instantly.<br>

### 4.3 How to create level 2 submenu?
<b>question:</b><br>
How do I nest chatbot.sh inside a new "Bot" submenu under the existing "AI" submenu?<br>
<b>anwser:</b><br>
Check your current "AI" folder structures:<br>

```
local.holder.AI.controller.sh
local.holder.AI.model.sh
local.holder.AI.view.patrol.sh
```

1. Copy the controller and model from the parent "AI" directory to initialize the "Bot" namespace:<br>

```
$ cp local.holder.AI.controller.sh local.holder.AI.Bot.controller.sh
$ cp local.holder.AI.model.sh local.holder.AI.Bot.model.sh
```

2. Move and rename your script to match the new deep path structure:<br>

```
$ mv chatbot.sh local.holder.AI.Bot.view.chatbot.sh
```

- Result<br>

```
local.holder.AI.controller.sh
local.holder.AI.model.sh
local.holder.AI.Bot.controller.sh
local.holder.AI.Bot.model.sh
local.holder.AI.Bot.view.chatbot.sh
local.holder.AI.view.patrol.sh
```

The updated menu hierarchy updates dynamically. This process can be repeated for level 3, 4, 5, and beyond, supporting infinite submenu nesting.<br>

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
Copyright © 2012-2015, 2026 [loweboard](https://github.com/loweboard).<br>
This project is [GNU General Public License v3.0](https://github.com/loweboard/iSystemAdministrator/blob/master/LICENSE.txt) licensed.<br>

### 5.3 Web-based Implementation
**Visit <a href="http://www.loweboard.com/">Web-based implementation which embedded in iSA</a>.**<br>
