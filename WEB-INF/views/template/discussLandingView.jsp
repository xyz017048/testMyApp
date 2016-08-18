<div class="box">
	<div class="img_box" ng-mouseenter="hoverGray({box:item})" ng-mouseleave="hoverGray({box:item})" ng-init="hoverGray({box:item})">
		<div ng-class="{'favorited_img': item.isFavorited, 'favorite_img': !item.isFavorited}" ng-click="switchFavorite({box:item})"></div>
		<img class="images" ng-src="/webapp/{{item.imageUrl}}" ng-class="{'images_gray':item.hoverGray}"/>
		<div class="icons" ng-class="{'noDisplay':!item.hoverGray}">
			<div ng-class="{'has_concept_img': item.concepts}">
				<div id="concept_content">Concept</div>
			</div>
			<div ng-class="{'has_crowfund_img': item.hasCrowdfund}"></div>
			<div ng-class="{'has_shop_img': item.hasShop}"></div>		
		</div>
	</div>
	<div class="bottom_box">
		<h3 class="bottom_title">{{item.title}}</h3>
		<div class="bottom_sections">
			<ul class="bottom_sections_list">
				<li><p>{{item.concepts}}</p><p>Concepts</p></li>
				<li><p>{{item.participants}}</p><p>Participants</p></li>
				<li><p>{{item.features}}</p><p>Features</p></li>
			</ul>
		</div>
		<div class="bottom_status">
			<div class="btm_text">
				<p class="btm_status_label">Status:<strong>Discussion</strong></p>
			</div>
			<button class="btn_discuss" ng-click="discussDetail({selectedItem:item.uniqueId})">Discuss</button>
		</div>		
	</div>
</div>