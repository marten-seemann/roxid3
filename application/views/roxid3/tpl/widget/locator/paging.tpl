[{block name="widget_locator_paging"}]
    [{if $pages->changePage}]
        <ul class="pagination">
            <li [{if !$pages->previousPage }]class="disabled"[{/if}]>
                <a class="prev hidden-xs" href="[{$pages->previousPage}]" title="[{oxmultilang ident="PREVIOUS"}]"><i class="fa fa-arrow-left"></i></a>
                <a class="prev visible-xs" href="[{$pages->previousPage}]">&larr;</a>
            </li>
            [{assign var="i" value=1}]

            [{foreach key=iPage from=$pages->changePage item=page}]
                [{ if $iPage == $i }]
                    <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
                    [{assign var="i" value=$i+1}]
                [{ elseif $iPage > $i }]
                    <li class="disabled"><a href="javascript:void(0)">...</a></li>
                    <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
                    [{assign var="i" value=$iPage+1}]
                [{ elseif $iPage < $i }]
                    <li [{if $iPage == $pages->actPage }]class="active"[{/if}]><a href="[{$page->url}]">[{$iPage}]</a></li>
                    <li class="disabled"><a href="javascript:void(0)">...</a></li>
                    [{assign var="i" value=$iPage+1}]
                [{/if}]
            [{/foreach}]

            <li [{if !$pages->nextPage }]class="disabled"[{/if}]>
                <a class="next hidden-xs" href="[{$pages->nextPage}]" title="[{oxmultilang ident="NEXT"}]"><i class="fa fa-arrow-right"></i></a>
                <a class="next visible-xs" href="[{$pages->nextPage}]">&rarr;</a>
            </li>
        </ul>
    [{/if}]
[{/block}]
