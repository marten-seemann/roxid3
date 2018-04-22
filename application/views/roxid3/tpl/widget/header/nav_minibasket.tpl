<div class="z-header-minibasket">
  <div class="z-minibasket-icon">
    <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]" rel="nofollow">
      <span class="fa-stack">
        <i class="fa fa-circle fa-stack-2x"></i>
        [{$oViewConf->getRoxidIcon('basket', 'fa-stack-1x fa-inverse')}]
      </span>
    </a>
  </div>

  [{assign var="item_count" value=$oxcmp_basket->getItemsCount()}]
  <div class="z-basket-itemcounter" [{if $item_count == 0 }]style="display:none;"[{/if}]>
    (<span class="z-basket-itemcount">[{$item_count}]</span>)
  </div>
</div>


