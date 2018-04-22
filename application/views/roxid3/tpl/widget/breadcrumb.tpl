[{strip}]
<div id="breadcrumb" class="clear">
  <span class="breadcrumb-label">[{ oxmultilang ident="YOU_ARE_HERE" }]:</span>
  <ul class="breadcrumb">
    <li><a href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>
    [{foreach from=$oView->getBreadCrumb() item=sCrum}]
      [{if $sCrum.link }]<li><span class="divider"><i class="fa fa-angle-right"></i></span> <a href="[{ $sCrum.link }]" title="[{ $sCrum.title|escape:'html'}]">[{/if}][{$sCrum.title}][{if $sCrum.link }]</a></li>[{/if}]
    [{/foreach}]
  </ul>
</div>
[{/strip}]
