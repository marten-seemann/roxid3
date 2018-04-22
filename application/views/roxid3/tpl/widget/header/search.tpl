[{block name="widget_header_search_form"}]
[{if $force || $oView->showSearch() }]
    [{if !$input_id}]
        [{assign var="input_id" value="searchParam"}]
    [{/if}]
    <form class="navbar-search" action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search">
        <div>
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="search">
            [{assign var="currency" value=$oView->getActCurrency()}]
            [{if $currency->id}]
                <input type="hidden" name="cur" value="[{$currency->id}]">
            [{/if}]
            [{block name="header_search_field"}]
                <div class="input-group pull-right">
                    <input type="text" id="[{$input_id}]" name="searchparam" value="[{$oView->getSearchParamForHtml()}]" class="form-control">
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">[{$oViewConf->getRoxidIcon('search')}] [{*oxmultilang ident="SEARCH_TITLE"*}]</button>
                    </span>
                </div>
            [{/block}]
        </div>
    </form>
[{/if}]
[{/block}]
