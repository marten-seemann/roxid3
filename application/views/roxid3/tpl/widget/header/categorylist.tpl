[{assign var="mode" value=$oView->getViewParameter('mode')}]

[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories }]
[{assign var="blShowMore" value=false }]
[{assign var="iCatCnt" value=0}]
<ul [{if $mode=='bootstrap'}]class="nav nav-pills"[{/if}] role="menu">
    [{if $oViewConf->getViewThemeParam('blShowHomeInNavigation')}]
        <li class="[{if $homeSelected == 'true' }]active[{/if}]"><a [{if $homeSelected == 'true'}]class="active"[{/if}] href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="TOP_CATEGORIES_HOME"}]</a></li>
    [{/if}]

    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
      [{if $ocat->getIsVisible() }]
        [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
            [{assign var="iCatCnt" value=$iCatCnt+1 }]

            [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                <li [{if $mode=='bootstrap'}]class="dropdown"[{/if}]><a href="[{$oTopCont->getLink()}]" class="[{if $mode=='bootstrap'}]dropdown-toggle[{/if}] [{if $oTopCont->expanded}]active[{/if}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
            [{else}]
                [{capture append="moreLinks"}]
                    <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                [{/capture}]
            [{/if}]
        [{/foreach}]

        [{assign var="iCatCnt" value=$iCatCnt+1 }]
        [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
            <li class="[{if $mode=='bootstrap'}]dropdown[{/if}] [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                <a class="[{if $mode=='bootstrap'}]dropdown-toggle[{/if}] [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]"  role="button" href="[{$ocat->getLink()}]" data-target="#">
                    [{$ocat->oxcategories__oxtitle->value}]
                    [{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0) }]
                        ([{$ocat->getNrOfArticles()}])
                    [{/if}]
                    [{if $ocat->getHasVisibleSubCats()}]
                        [{if $mode=='bootstrap'}]<i class="fa fa-caret-down"></i>[{/if}]
                    [{/if}]
                </a>
                [{if $ocat->getSubCats() && $ocat->getHasVisibleSubCats() }]
                    <ul class="[{if $mode=='bootstrap'}]dropdown-menu[{/if}]" role="menu">
                        [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                           [{if $osubcat->getIsVisible() }]
                               [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                   <li tabindex="-1" [{if $mode=='bootstrap'}]role="menuitem"[{/if}]>
                                       <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                   </li>
                               [{/foreach}]
                               [{if $osubcat->getIsVisible() }]
                                   [{if $oViewConf->getViewThemeParam('blShowNavbarSubMenus')}]
                                       [{assign var="showSubCats" value=$osubcat->getHasVisibleSubCats()}]
                                   [{else}]
                                       [{assign var="showSubCats" value=false}]
                                   [{/if}]
                                   <li tabindex="-1" [{if $mode=='bootstrap'}]role="menuitem"[{/if}] class="[{if $homeSelected == 'false' && $osubcat->expanded}]current[{/if}] [{if $showSubCats}]dropdown-submenu[{/if}]">
                                       <a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}] [{ if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}]</a>
                                       [{if $showSubCats}]
                                           <ul class="dropdown-menu">
                                               [{foreach from=$osubcat->getSubCats() item=osubsubcat key=subsubcatkey name=SubSubCat}]
                                                   <li tabindex="-1">
                                                       <a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubsubcat->getLink()}]">[{$osubsubcat->oxcategories__oxtitle->value}] [{ if $oView->showCategoryArticlesCount() && ($osubsubcat->getNrOfArticles() > 0)}] ([{$osubsubcat->getNrOfArticles()}])[{/if}]</a>
                                                   </li>
                                               [{/foreach}]
                                           </ul>
                                       [{/if}]
                                   </li>
                               [{/if}]
                           [{/if}]
                       [{/foreach}]
                   </ul>
                [{/if}]
            </li>
        [{else}]
            [{assign var="blShowMore" value=true }]
            [{capture append="moreLinks"}]
              [{assign var="blShowMore" value=true }]
              <li tabindex="-1" [{if $mode=='bootstrap'}]role="menuitem"[{/if}]>
                <a class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
              </li>
            [{/capture}]
        [{/if}]
      [{/if}]
    [{/foreach}]
    [{if $blShowMore}]
        <li [{if $mode=='bootstrap'}]class="dropdown"[{/if}]>
            [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
            <a [{if $mode=='bootstrap'}]class="dropdown-toggle"[{/if}] href="[{ oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">[{ oxmultilang ident="MORE" }] [{if $mode=='bootstrap'}]<i class="fa fa-caret-down"></i>[{/if}]</a>
            <ul [{if $mode=='bootstrap'}]class="dropdown-menu dropdown-menu-right" role="menu"[{/if}]>
                [{foreach from=$moreLinks item=link}]
                   [{$link}]
                [{/foreach}]
            </ul>
        </li>
    [{/if}]
</ul>
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]
