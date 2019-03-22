<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="zh-CN">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>问卷</title>
<style type="text/css">
.top{
	width: 100%;
	height: 600px;
}
.top .left{
	width: 55%;
	height: 60%;
	margin: 0 auto;
	float: left;
}
.top .right{
	width: 50%;
	height: 600px;
	margin: 0 auto;
	float: left;
}
</style>

</head>
<body>
	<div class="top">
		<div id="main" class="left"></div>
		<div class="right"></div>
	</div>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
       option = {
    		    title: {//标题组件
                   textStyle: {    
                   color: "#333333",    
                   fontSize: 12,   
                   }
                },
    		    tooltip: {
    		        trigger: 'item',
    		        formatter: "{a} <br/>{b}: {c} ({d}%)",
    		        textStyle:{    //图例文字的样式
                        color:'#fff',  //文字颜色
                        fontSize:10    //文字大小
                    }
    		    },
    		    graphic:[		       	       
    		         {
    		      		type: 'text',              
    		      		top: '40%',           
    		      		left: 'center',          
    		      		style: {
    		      		   text: "共" + (${data.vmath} + ${data.venglish} + ${data.vchinese}) + "人",      
    		      		   fill: '#333333',       
    		      		   fontSize: 20,          
    		      		   fontWeight: 'normal'
    		      		}  		      		        
    		      	},{
    		      		type: 'text',              
    		      		top: '53%',           
    		      		left: 'center',          
    		      		style: {
    		      		   text: '人数比例',      
    		      		   fill: '#A6A8B6',       
    		      		   fontSize: 12,          
    		      		   fontWeight: 'normal'
    		      		}  		      		        
    		      	},      
    		    ],
    		    //圆环的颜色
    		    color:['#48cda6','#fd87fb','#11abff','#ffdf6f','#968ade'],
    		    // 图例
    		    legend: {
    		    	// 图例选择的模式，控制是否可以通过点击图例改变系列的显示状态。默认开启图例选择，可以设成 false 关闭。
    		    	selectedMode: true, 
    		        /* orient: 'vertical', */
    		       /*  x : 'right',   //图例显示在右边
                    y: 'center',  */  //图例在垂直方向上面显示居中
                    bottom:0,
                    itemWidth:10,  //图例标记的图形宽度
                    itemHeight:10, //图例标记的图形高度
    		        data:["${data.math}" , "${data.chinese}" , "${data.english}"],
    		        textStyle:{    //图例文字的样式
                        color:'#A6A8B6',  //文字颜色
                        fontSize:10    //文字大小
                    }
    		    },   		  
    		    series: [
    		        {
    		            name:'科目偏好图',//代表a的值，系列名称 
    		            type:'pie',
    		            center:['50%','45%'], //饼图的中心（圆心）坐标，数组的第一项是横坐标，第二项是纵坐标。
    		            radius: ['45%', '60%'],//饼图的半径，数组的第一项是内半径，第二项是外半径。[ default: [0, '75%'] ]
    		            avoidLabelOverlap: false,
    		           /*  animation: false, */  //是否禁用动画效果
    		            label: {
    		                normal: {
    		                    show: true,//是否显示标签
    		                    //// 标签的位置。'outside'饼图扇区外侧，通过视觉引导线连到相应的扇区。'inside','inner' 同 'inside',饼图扇区内部。'center'在饼图中心位置。
    		                    position: 'left',
    		                    //显示的标签的内容
    		                    //a（系列名称），b（数据项名称），c（数值）, d（百分比）
    		                    formatter: "{a},{b}:{c}（{d}%）",   //[在这里插入图片描述](https://img-blog.csdn.net/2018101313580390?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzM5MzI3NDE4/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
   		                    
    		                },
    		                emphasis: {
    		                	//鼠标放在圆环上显示的标签样式
    		                    show: true,
    		                    textStyle: {
    		                        fontSize: '12',
    		                        fontWeight: 'bold'
    		                    }
    		                }
    		            },
    		            labelLine: {
    		                normal: {
    		                    show: true,//是否显示引导线
  	               		        length:10,  //百分比引导线
  	               		        length2:20    //视觉引导项第二段的长度。
    		                }
    		            },
    		            itemStyle: {
                            normal: {
                                borderColor: "#FFFFFF", 
                                borderWidth: 1, 
                                label:{  
                                    show:true,  
                                    formatter:'{d}%'  
                                },  
                            }
                        },
                        // 系列中的数据内容数组。
    		            data:[
    		                {value:${data.vmath}, name:"${data.math}"},
    		                {value:${data.vchinese}, name:"${data.chinese}"},
    		                {value:${data.venglish}, name:"${data.english}"}
    		            ]
    		        }
    		    ]
    		};
       myChart.setOption(option);
</script>
</body>
</html>