[{assign var="showMobileNavOnTablet" value=$oViewConf->getViewThemeParam('blShowMobileNavbarOnTablet')}]

<div id="navigation">
  <div class="visible-md visible-lg">
    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1 mode="bootstrap"}]
  </div>
  <div class="z-tablet-navbar-trigger visible-sm">
    <a href="#panelmenu" class="btn panelmenu-toggle">
      <i class="fa fa-bars"></i>
      <span>[{ oxmultilang ident="MOBILE_NAVIGATION_BUTTON" }]</span>
    </a>
  </div>
</div>

<div id="navigation-top" class="navbar navbar-fixed-top [{if $showMobileNavOnTablet}]z-mobile-nav-on-tablet[{/if}]" style="display:none">
  <div class="navbar-inner">
    <div class="container">
      <a class="navbar-brand" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
        [{assign var="slogoImg" value="logo.png"}]
        <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
      </a>
    </div>
  </div>
</div>


[{include file="widget/header/nav_panelmenu.tpl"}]


<div class="nav-collapse collapse" style="display: none;">
  [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1 mode="bootstrap"}]
</div>

