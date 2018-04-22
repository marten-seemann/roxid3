INSERT INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXMODULE`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXTIMESTAMP`) VALUES
('roxid3.blWallpaper', 'oxbaseshop', 'theme:roxid3', 'blWallpaper', 'str', 0x1811ec58bd678bfba732d0799d, CURRENT_TIMESTAMP()),
('roxid3.blLongNavbar', 'oxbaseshop', 'theme:roxid3', 'blLongNavbar', 'bool', '', CURRENT_TIMESTAMP())
;

INSERT INTO `oxconfigdisplay` (`OXID`, `OXCFGMODULE`, `OXCFGVARNAME`, `OXGROUPING`, `OXVARCONSTRAINT`, `OXPOS`, `OXTIMESTAMP`) VALUES
('roxid3.blWallpaper', 'theme:roxid3', 'blWallpaper', 'roxid', 'str', 101, CURRENT_TIMESTAMP()),
('roxid3.blLongNavbar', 'theme:roxid3', 'blLongNavbar', 'roxid', 'bool', 101, CURRENT_TIMESTAMP())
;

-- the Bootstrap default navigation for mobile devices is not available in ROXID3
DELETE FROM `oxconfig` WHERE OXID = 'roxid.blMobileNavbarMode';
DELETE FROM `oxconfigdisplay` WHERE OXID = 'roxid.blMobileNavbarMode';

