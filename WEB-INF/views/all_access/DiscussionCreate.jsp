<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section ng-app="dformapp">
     <div class="container" ng-controller="creatediscussionform">
		
			
		<form class="form-horizontal" style="padding-bottom:200px; padding-top:200px" role="form" name="createFormD" novalidate>
			<div class="form-group">
				<label class="control-label col-sm-3">Discussion Title:*</label>
				<div class="col-sm-9" >
					<input type="text" class="form-control" name="dTitle" ng-model="createDiscussionTitle" ng-blur="checkDuplicate($event)" ng-keydown="showPossibleDup($event)" required ng-class="{ 'has-error-border' : createFormD.dTitle.$invalid && submitTip }" />
					<span class="pull-right">{{createDiscussionTitle|characterCounter}}/200</span>
					<image  src="/webapp/static/img/icon/question-mark.png" uib-tooltip='explaination (need text here)'>
					<span ng-show="createFormD.dTitle.$invalid && submitTip" style="color: #E74C3C">Title is required</span>
					<div>
						<span ng-show="titleDuplicates[0] && titleTipShow">Possible Duplicates:</span>
						<div class="pull-right" ng-show="createDiscussionTitle|characterCounter:200" style="color: #E74C3C">The title has to be less than 200 character long.</div>
						<div class="pull-right"><span style="color: #E74C3C">{{titleTip}}</span></div>
						<div ng-repeat="existtitle in titleDuplicates" ng-show="titleDuplicates[0] && titleTipShow">{{existtitle}}</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label col-sm-3" >Discussion Brief Summary:*</label>
				<div class="col-sm-9"> 
					<input type="text" class="form-control" name="dSummary" ng-model="discussionSummary" required ng-class="{ 'has-error-border' : createFormD.dSummary.$invalid && submitTip }"/>
					<span class="pull-right">{{discussionSummary|characterCounter}}/1000</span>
					<span ng-show="createFormD.dSummary.$invalid && submitTip"  style="color: #E74C3C">Summary is required</span>
					<div class="pull-right" ng-show="discussionSummary|characterCounter:1000" style="color: #E74C3C">The title has to be less than 1000 character long.</div>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label col-sm-3">Category:*</label>
				<div class="col-sm-9"> 
					<select class="form-control" name="dCategory" ng-model="tempcategory" ng-options="x for x in categories" ng-blur="convertCategory(tempcategory)" required ng-class="{ 'has-error-border' : createFormD.dCategory.$invalid && submitTip }">
						<option></option>
					</select>
					<span ng-show="createFormD.dCategory.$invalid && submitTip" style="color: #E74C3C">Category is required</span>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label col-sm-3">Features:*</label>
				<div class="col-sm-7"> 
					<textarea class="form-control" placeholder="Feature Title" ng-model="createFeature.title"> </textarea>
					<div class="pull-right" ng-if="createFeature.title|characterCounter:80" style="color: #E74C3C">The feature title has to be less than 80 character long.</div> 
					<div class="pull-right"><span>{{createFeature.title|characterCounter}}/80</span></div>
				</div>
				<br/>
				<lable class="control-label col-sm-3"></lable>
				<div class="col-sm-7"> 
					<textarea class="form-control" placeholder="Feature Description" ng-model="createFeature.details"> </textarea>
					<div class="pull-right" ng-if="createFeature.details|characterCounter:300" style="color: #E74C3C">The feature detail has to be less than 300 character long.</div>
					<div class="pull-right"><span>{{createFeature.details|characterCounter}}/300</span></div>
				</div>
				<button style="background-color: #E74C3C; border: none; color: white;" type="button" ng-click="addFeature()" class="btn btn-default">Add</button>
			</div>
			<div class="form-group"> 
				<div class="col-sm-offset-8 col-sm-4">
					<span ng-class="{ 'has-error-text' : (createFeatures[2] == '' || createFeatures[2] == null) && submitTip }">{{tip1}}</span>
					<br>
					<span ng-show="tip2" style="color: #E74C3C">{{tip2}}</span>
					<span ng-show="tip3" style="color: #E74C3C">{{tip3}} (title: {{createFeatures[duplicateFeatureNumD].title}} ). Please change the feature detail.</span>
				</div>
			<br>
				<script type="text/ng-template" id="myModalContent.html">
        						<div class="modal-header">
            						<h3 class="modal-title">Features:</h3>
       							</div>
        						<div class="modal-body">
           	 						<div>
										<textarea class="form-control" ng-model="reviseFeature.title" placeholder="Feature Title"></textarea> 
										<div style="height:10px">
											<span ng-show="reviseFeature.title|characterCounter:80" style="color: #E74C3C">Feature title has to be less than 80 character</span>
											<span class="pull-right">{{reviseFeature.title|characterCounter}}/80</span>
										</div>
									</div>
									<div>
										<textarea class="form-control" ng-model="reviseFeature.details" placeholder="Feature Description"></textarea>
										<div  style="height:10px">
											<span class="pull-right">{{reviseFeature.details|characterCounter}}/300</span>
											<span ng-show="reviseFeature.details|characterCounter:300" style="color: #E74C3C">Feature title has to be less than 300 character</span>
										</div>
									</div>
            						
        						</div>
        						<div class="modal-footer">
									<span style="color:#E74C3C">{{modalTip}}<span>
									<span ng-show="modalTip2" style="color:#E74C3C"> {{modalTip2}}  (title: {{createFeatures[duplicateFeatureNumD].title}} ). Please change the feature detail.</span>
            						<button class="btn btn-primary" type="button" ng-click="ok()">OK</button>
           							<button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>
        						</div>
    					</script>
				<div class="col-sm-offset-4 col-sm-8" ng-repeat="feature in createFeatures track by $index">
					<a><image src="/webapp/static/img/icon/cancel.png" ng-click="cancelFeature($index)"></a>
					<a ng-click="editFeature($index)">{{feature.title}}</a>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label col-sm-3">Tags:*</label>
				<div class="col-sm-9">
					<tags-input ng-model="discussionTags" 
								placeholder="Add a tag"
								ng-class="{ 'has-error' : (discussionTags[0] == '' || discussionTags[0] == null) && submitTip }" 
								uib-tooltip="Press Enter to generate a tag" tooltip-trigger="'focus'"  tooltip-placement="top-right" 
								max-length="45"
								on-invalid-tag="invalidTagInput($tag)"
								on-tag-adding="emptyInputLenTip($tag)"
								on-tag-removing="emptyInputLenTip($tag)">
					  <auto-complete source="loadTags($query)"
					       			 debounce-delay="200" 
									 load-on-empty="false"
									 max-results-to-show="5"
									 min-length="2"
									 select-first-match="false"
									></auto-complete>
					</tags-input>
					<span style="color: #E74C3C" class="pull-right">{{tagInputLenTip}}</span>
					<span ng-show="(discussionTags[0] == '' || discussionTags[0] == null) && submitTip"  style="color: #E74C3C">Tags are required</span>
				</div>
			</div>
			<br/>
			<div class="form-group">
				<label class="control-label col-sm-3">Discussion Photo</label>
				<div class="col-sm-3" style="display: inline">
					<input type="file" ngf-select ng-model="picFile" name="file"  accept="image/*" ngf-max-size="2MB" ngf-model-invalid="errorFile">
					  </br>
					  <div>
					  	  <i ng-show="createFormD.file.$error.maxSize" style="color: #E74C3C">File too large 
						  {{errorFile.size / 1000000|number:1}}MB: max 2M</i>
					  </div>
					  <img ng-show="createFormD.file.$valid" ngf-thumbnail="picFile" class="thumb" style="width:200px; height:200px;">						   
					  <div>
						  <button type="button" ng-click="picFile = null" ng-show="picFile" class="btn btn-default">Remove</button>
						  <!--  <button type="button" ng-click="uploadPic(picFile)" class="btn btn-default">Upload</button>  -->
					  </div>
					  <span class="progress" ng-show="picFile.progress >= 0">
						 <div style="width:{{picFile.progress}}%"  ng-bind="picFile.progress + '%'"></div>
					  </span>
					  <span ng-show="picFile.result">Upload Successful</span>
					  <span class="err" ng-show="errorMsg">{{errorMsg}}</span>
				</div>
				<div class="col-sm-6" style="display: inline" ng-show="picFile">
					<input type="text" class="form-control" placeholder="Photo Title" ng-model="photoTitle">
					<tags-input ng-model="photoTags" 
								placeholder="Photo Tags"
								uib-tooltip="Press Enter to generate a tag" tooltip-trigger="'focus'" tooltip-placement="top-right"  
								max-length="45"
								on-invalid-tag="invalidTagInputPho($tag)"
								on-tag-adding="emptyInputLenTipPho($tag)"
								on-tag-removing="emptyInputLenTipPho($tag)">
					  <auto-complete source="loadTags($query)"
									 debounce-delay="200"
									 max-results-to-show="5"
									 min-length="2"
									 select-first-match="false" 
									 ></auto-complete>
					</tags-input>
					<span style="color: #E74C3C" class="pull-right">{{tagInputLenTipPho}}</span>
					<image  src="/webapp/static/img/icon/question-mark.png" uib-tooltip='explaination (need text here)'>
				</div>
			</div>
			<br/>
			<div>
				<button type="button" ng-click="submitForm(createFormD.$valid)" style="float: none; display: block; margin-left: auto;  margin-right: auto; background-color: #E74C3C; border: none; color: white;" class="btn btn-default">Create</button>
			</div>
		</form>
		
	</div>
</section>  
			 
	
	