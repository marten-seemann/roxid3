-- navbar is always default in ROXID3
DELETE FROM `oxconfig` WHERE OXMODULE = "theme:roxid3" AND OXVARNAME = 'sNavbarColorMode';
DELETE FROM `oxconfigdisplay` WHERE OXCFGMODULE = "theme:roxid3" AND OXCFGVARNAME = 'sNavbarColorMode';
-- no minibasket in navbar in ROXID3
DELETE FROM `oxconfig` WHERE OXMODULE = "theme:roxid3" AND OXVARNAME = 'sMinibasketDisplay';
DELETE FROM `oxconfigdisplay` WHERE OXCFGMODULE = "theme:roxid3" AND OXCFGVARNAME = 'sMinibasketDisplay';

# set wallpaper by default
UPDATE `oxconfig` SET `OXVARVALUE` = X'1811EC58BD678BFBA732D0799D' WHERE OXMODULE = "theme:roxid3" AND OXVARNAME = "sWallpaper";
