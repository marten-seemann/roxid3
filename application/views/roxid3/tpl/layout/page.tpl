[{capture append="oxidBlock_pageBody"}]
    [{assign var="template_title" value=$oView->getTitle() }]
    [{if $oView->showRDFa()}]
        [{ include file="rdfa/rdfa.tpl" }]
    [{/if}]

    [{block name="page_start"}]
    [{/block}]

    [{include file="widget/header/headerbar_mobile.tpl"}]

    <div id="main" class="container">
        [{block name="layout_header"}]
            [{include file="layout/header.tpl"}]
        [{/block}]

        [{include file="widget/forgotpwd_email_modal.tpl"}]


        [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
            <div id="breadcrumb-wrapper" class="row hidden-xs">
                [{block name="layout_breadcrumb"}]
                    [{ include file="widget/breadcrumb.tpl"}]
                [{/block}]
            </div>
        [{/if}]

        [{if $oView->getClassName()=='start' }]
            [{ assign var="oCont" value=$oView->getContentByIdent("oxindexslider") }]
            [{if $oCont->oxcontents__oxactive->value == 1}]
                [{oxcontent ident="oxindexslider"}]
            [{elseif $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
                [{assign var="isRoxid" value=true}]
                [{block name="indexslider"}][{/block}]
            [{/if}]
        [{/if}]

        <div id="main-content" class="row">
            [{assign var="blProductpageWithoutSidebar" value=false}]
            [{if $oView->getClassName()=='details' && !$oViewConf->getViewThemeParam("blShowSidebarOnProductPageOnTablet")}]
                [{assign var="blProductpageWithoutSidebar" value=true}]
            [{/if}]

            [{capture name="sidebarClass" assign="sidebarClass"}]
                [{if $blProductpageWithoutSidebar}]col-md-5[{else}]col-sm-5[{/if}] hidden-xs [{if $blProductpageWithoutSidebar}]hidden-sm[{/if}]
            [{/capture}]

            [{capture name=sidebarText assign=sidebarCode}]
                [{include file="layout/sidebar.tpl"}]
            [{/capture}]

            [{capture name=sidebar assign=sidebarText}]
                [{include file="widget/conditional_content.tpl" code=$sidebarCode html_id="sidebar"}]
            [{/capture}]

            [{if $sidebar}]
                [{assign var="content_spansize" value="19"}]
            [{else}]
                [{assign var="content_spansize" value=24}]
            [{/if}]

            [{if $sidebar == "Left"}]
                <div id="sidebar" class="[{$sidebarClass}]">
                    [{$sidebarText}]
                </div>
            [{/if}]

            <div id="content" class="[{if $blProductpageWithoutSidebar}]col-md-[{$content_spansize}][{else}]col-sm-[{$content_spansize}][{/if}]">
                [{block name="content_main"}]
                    [{include file="message/errors.tpl"}]
                    [{foreach from=$oxidBlock_content item="_block"}]
                        [{$_block}]
                    [{/foreach}]
                [{/block}]
            </div>

            [{if $sidebar == "Right"}]
                <div id="sidebar" class="[{$sidebarClass}]">
                    [{$sidebarText}]
                </div>
            [{/if}]
        </div>
        <div class="row">
            [{include file="layout/footer.tpl"}]
        </div>
    </div>


    [{include file="widget/facebook/init.tpl"}]
    [{if $oView->isPriceCalculated() }]
        [{block name="layout_page_vatinclude"}]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <div id="incVatMessage">
                [{if $oView->isVatIncluded()}]
                    * <span class="deliveryInfo">[{ oxmultilang ident="PLUS_SHIPPING" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                [{else}]
                    * <span class="deliveryInfo">[{ oxmultilang ident="PLUS" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                [{/if}]
            </div>
        [{/oxifcontent }]
        [{/block}]
    [{/if}]

    [{block name="page_end"}]
    [{/block}]

    [{if $oView->getClassName() != "details"}]
        [{insert name="oxid_tracker" title=$template_title }]
    [{/if}]
[{/capture}]

[{include file="widget/lazyloading.tpl"}]
[{include file="widget/tobasketajax.tpl"}]
[{include file="layout/base.tpl"}]
