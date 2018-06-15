$(function() {
    $('#file_upload').uploadifive({
        'uploadScript'     : SCOPE.image_upload,
        'buttonText':'图片上传',
        'fileType'     : 'image',
        'multi':false,
        'removeCompleted':true,
        'fileObjName'      : 'file',
        'onUploadComplete' : function(file, data) {
            if(data){
                var obj=JSON.parse(data);

                $("#upload_org_code_img").attr('src',obj.data);
                $("#file_upload_image").attr('value',obj.data);
                $("#upload_org_code_img").show();
            }
        }
    });
    $('#file_upload_other').uploadifive({
        'uploadScript'     : SCOPE.image_upload,
        'buttonText':'图片上传',
        'fileType'     : 'image',
        'multi':false,
        'removeCompleted':true,
        'fileObjName'      : 'file',
        'onUploadComplete' : function(file, data) {
            if(data){
                var obj=JSON.parse(data);

                $("#upload_org_code_img_other").attr('src',obj.data);
                $("#file_upload_image_other").attr('value',obj.data);
                $("#upload_org_code_img_other").show();
            }
        }
    });
});