vim-eclim
=========
This repository simplifies the install procedure to use eclim. Notably, it allows you to
use a plugin manager and then a simple Vim command to install it. Everything nice and tidy.

Step 1: Vim Plugin
------------------
Add the following snippet to your `.vimrc`.

```
Plugin/NeoBundle/Plug 'starcraftman/vim-eclim'
```

Then install using the appropriate plugin  command, for Vundle: `:PluginInstall`


Step 2: Eclimd
--------------
If you need to install eclimd, this repo provides the command `DeployEclimd` that takes one
required argument, the directory of your eclipse instance. 

No Warranty.
