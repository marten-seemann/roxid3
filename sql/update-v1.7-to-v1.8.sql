-- navbar is always default in ROXID3
DELETE FROM `oxconfig` WHERE OXMODULE = "theme:roxid3" AND OXVARNAME = 'blNavbarColorMode';
DELETE FROM `oxconfigdisplay` WHERE OXCFGMODULE = "theme:roxid3" AND OXCFGVARNAME = 'blNavbarColorMode';
-- no minibasket in navbar in ROXID3
DELETE FROM `oxconfig` WHERE OXMODULE = "theme:roxid3" AND OXVARNAME = 'blMinibasketDisplay';
DELETE FROM `oxconfigdisplay` WHERE OXCFGMODULE = "theme:roxid3" AND OXCFGVARNAME = 'blMinibasketDisplay';
