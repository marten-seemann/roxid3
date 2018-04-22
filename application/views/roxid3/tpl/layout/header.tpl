[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]

[{foreach from=$icons item=item}]
  [{$item}]
[{/foreach}]

[{capture name="main_navigation" assign="main_navigation"}]
    [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
        [{assign var="blAnon" value=0}]
        [{assign var="force_sid" value=$oViewConf->getSessionId()}]
    [{else}]
        [{assign var="blAnon" value=1}]
    [{/if}]

    [{include file="layout/nav.tpl"}]
[{/capture}]

<header id="header" class="row hidden-xs">
  <div class="z-header-toprow container hidden-xs">
    [{block name="layout_header_top"}]
      <div id="z-headermenu" class="pull-right">
        [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
      </div>
    [{/block}]
  </div>
  <div class="clear"></div>

  <div class="row">
    <div class="col-sm-12 col-md-8 z-header-firstcol">
      [{block name="layout_header_logo"}]
        <div id="logo">
          [{assign var="slogoImg" value="logo.png"}]
          <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
            <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="img-responsive">
          </a>
        </div>
      [{/block}]
    </div>

    [{block name="layout_header_bottom"}]
      <div class="col-sm-12 col-md-16 z-header-secondcol">
        <div class="row hidden-xs">
          <div class="col-sm-offset-2 col-sm-14 col-md-offset-5 col-md-13 col-lg-offset-9 col-lg-11">
            [{include file="widget/header/search.tpl"}]
          </div>
          <div class="col-sm-8 col-md-6 col-lg-4">
            [{include file="widget/header/nav_minibasket.tpl" minibasketDisplay=true}]
            <div class="clear"></div>
          </div>
        </div>
        [{if !$oViewConf->getViewThemeParam("blLongNavbar")}]
          <div class="z-header-mainrow hidden-xs">
            [{$main_navigation}]
          </div>
        [{/if}]
      </div>
      [{if $oViewConf->getViewThemeParam("blLongNavbar")}]
        <div class="z-header-mainrow z-header-mainrow-long hidden-xs">
          [{$main_navigation}]
        </div>
      [{/if}]
    [{/block}]
  </div>
</header>
