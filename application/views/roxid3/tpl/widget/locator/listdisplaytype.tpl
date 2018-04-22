[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
[{if $oView->canSelectDisplayType()}]
    <div class="">
        <strong>[{oxmultilang ident="view"}]:</strong>
        <div class="z-options">
            <span><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident="line"}]" [{if $listType eq 'line' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_line')}]</a></span>
            <span><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=infogrid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident="infogrid"}]" [{if $listType eq 'infogrid' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_infogrid')}]</a></span>
            <span><a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident="grid"}]" [{if $listType eq 'grid' }]class="selected" [{/if}]>[{$oViewConf->getRoxidIcon('listtype_grid')}]</a></span>
        </div>
    </div>
[{/if}]
