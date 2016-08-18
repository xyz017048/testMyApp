app.controller('FileCtrl', ['$scope', 'Upload', '$timeout', function ($scope, Upload, $timeout) {
	
	 $scope.checkboxModel = {
		       public: true,
		     };
	 
    $scope.uploadFiles = function(file, errFiles) {
        $scope.f = file;
        $scope.errFile = errFiles && errFiles[0];
        if (file) {
        	console.log($scope.checkboxModel['public']);
            file.upload = Upload.upload({
                url: '/webapp/fileOperation/upload',
                data: {file: file, public: $scope.checkboxModel['public']}
            });

            file.upload.then(function (response) {
                $timeout(function () {
                    file.result = response.data;
                });
            }, function (response) {
                if (response.status > 0)
                    $scope.errorMsg = response.status + ': ' + response.data;
            }, function (evt) {
                file.progress = Math.min(100, parseInt(100.0 * 
                                         evt.loaded / evt.total));
            });
        }   
    }
}]);