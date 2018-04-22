<div class="z-headerbar visible-xs">
    <div class="z-headerbar-entry z-headerbar-logo col-xs-9">
        [{assign var="slogoImg" value="logo.png"}]
        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
    </div>

    <div class="z-headerbar-entry z-headerbar-search dropdown visible-xs col-xs-3">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="Anmelden">
            [{$oViewConf->getRoxidIcon('search')}]
            <i class="fa fa-caret-down"></i>
        </a>
        <div class="dropdown-menu">
            [{include file="widget/header/search.tpl" input_id="searchParam2" force=true}]
        </div>
    </div>

    <div class="z-headerbar-entry col-xs-3">
        <a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow" title="[{oxmultilang ident="LAYOUT_HEADER_ACCOUNT_LINK"}]">
            <span>[{$oViewConf->getRoxidIcon('user')}]</span>
        </a>
    </div>

    <div class="z-headerbar-entry dropdown col-xs-3">
        <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]" rel="nofollow" title="[{oxmultilang ident="BASKET"}]">
            <span class="z-minibasket-icon">[{$oViewConf->getRoxidIcon('basket')}]</span>
        </a>
    </div>

    <div class="z-headerbar-entry z-headerbar-menu col-xs-6">
        <a href="#panelmenu" class="panelmenu-toggle">
            <i class="fa fa-bars"></i>
            <span class="z-navbar-menu">[{ oxmultilang ident="MOBILE_NAVIGATION_BUTTON" }]</span>
        </a>
    </div>
</div>
