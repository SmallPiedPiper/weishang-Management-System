var checkArr = null;
var dataTable = {
	
	init : function (id,url,pagNo,pagCount){
		$('#'+id).append("<ul id='"+id+"Option'></ul> ");
		$('#'+id+'Option').bootstrapPaginator({    
		    currentPage: pagNo,  //当前第几页  
		    totalPages: pagCount, //总条数   
		    numberOfPages:'5',
		    onPageClicked: function(event,originalEvent,type,page){//点击事件
		    	var firstResult = 6*(page-1);
		    	$("#"+id).load(url+'?firstResult='+firstResult+'&pagSize='+6);
		    },    
		    itemTexts: function (type, page, current) {        
		        switch (type) {  
			        case "first": return "首页";            
			        case "prev": return "上一页";            
			        case "next": return "下一页";            
			        case "last": return "末页";            
			        case "page": return page;
		        }
		    }
		});
	}
};
function retrieveData( sSource111,aoData111, fnCallback111) {
	checkArr = new Array();
    $.ajax({
        url : sSource111,//这个就是请求地址对应sAjaxSource
        data : {'firstResult':aoData111[0].value,'pagSize':aoData111[1].value},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
        type : 'post',
        dataType : 'json',
        async : false,
        success : function(result) {
            fnCallback111(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
        },
        error : function(msg) {
        }
    });
}
var dia = null;
/**弹窗 **/
var dialog = {
		
		generic : function(title, url, confirmMether, cleanMether) {
			dia = BootstrapDialog.confirm({
				title : title,
				message : $('<div></div>').load(url),
				btnCancelLabel : '关闭', // <-- Default value is 'Cancel',
				btnOKLabel : '提交', // <-- Default value is 'OK',
				callback : function(result) {
					if (result) {
						if (confirmMether != null) return confirmMether();
						return result;
					} else {
						if (cleanMether != null) return cleanMether();
						return true;
					}
				}
			});
		},
		alert : function(title, url) {
			BootstrapDialog.alert({
				title : title,
				message : $('<div></div>').load(url),
				buttonLabel : '关闭'
			});
		},
		genClose : function(){
			if(dia != null)
				dia.close();
		},
};
var ajaxMeth = {
		//通用的ajax请求
		genJsonAjax : function(url,data,method,success,error){
			$.ajax({
				url:url,
				data:data,
				type:method,
				dataType: 'json',
				success : function(str){
					if(success != null){
						success(str);
						
					}
						
				},
				error : function(str){
					if(error != null){
						error(str);
					}
				}
			});
		},
		//ajax返回字符串
		genStringAjax : function(url,data,method,success,error){
			$.ajax({
				url:url,
				data:data,
				type:method,
				dataType: 'text',
				beforeSend:function(){
					comm.showMash();
				},
				success : function(str){
					if(success != null){
						success(str);
						comm.hideMask();
					}
					comm.hideMask();
				},
				error : function(str){
					if(error != null){
						error(str);
					}
					comm.hideMask();
				}
			});
		}
};
var comm = {
		getCheboxs : function(name){
			var $ches = $('input[name='+name+']:checked');
			var cheValueArr = new Array();
			if($ches.size() == 0){
				return null;
			}else{
				$ches.each(function(i){
					cheValueArr.push($(this).val());
				});
				return cheValueArr+"";
			}
		},
		validator : function (formName){
			 var form =  $('#'+formName);
		   	 form.bootstrapValidator();
		   	 var bv = form.data('bootstrapValidator');
		   	 bv.validate();
		   	 return bv;
		},
		showMash : function () {
			$("#mask").css("height", $(document).height());
			$("#mask").css("width", $(document).width());
			$("#mask").show();
		},
		hideMask: function () {
			$("#mask").hide();
		}
		
};