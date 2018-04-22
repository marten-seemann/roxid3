-- open the mmenu on the right side by default
UPDATE `oxconfig` SET OXVARVALUE=X'B5DA50CA5C' WHERE OXMODULE='theme:roxid3' AND OXVARNAME='sMobileNavbarPosition';
