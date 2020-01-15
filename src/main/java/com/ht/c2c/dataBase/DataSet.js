/* DataSet 2015
 * javazgw@gmail.com
 * @license MIT
 */
'use strict';
function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
    }
    return s4() + s4()  + s4() +  s4() +
        s4() +  s4() + s4() + s4();
}
var cell = {
    createNew: function(name,value,row){
        var c = {};
        if(row!=null && row.rowid!=null)
            c.rowid = row.rowid;
        else
            c.rowid = "";
        var binder = new DataBinder(c.rowid+"-"+name);
        c.row = row;
        c[name] = value;
        c.set=function(val){
            c[name] = val;
            binder.trigger(c.rowid+"-"+name + ":change", [name, val, this]);
            // binder.trigger(c.rowid + ":change", [name, val, this]);
        };
        c.get = function(){
            return c[name];
        };
        c.getname = function()
        {
            return name;
        }
        binder.on(c.rowid+"-"+name +":change",function(vet,attr_name,new_val,initiator){
            //	binder.on(c.rowid +":change",function(vet,attr_name,new_val,initiator){
            if(initiator !== c){
                c.set(new_val);
            }
        })

        return c;

    }
};
var Row = {
    createNew: function(){
        var Row = {};
        //Row.rowid=Math.round(Math.random()*100);

        Row.List = [];

        Row.dataSet = false;
        Row.addCell = function(c){
            c.rowid = Row.rowid;
            // Row.rowid = c.rowid;
            c.row = Row;
            Row.List.push(c);

        };

        Row.removeCell = function(c){
            //	var index = Row.List.indexOf(c)
            Row.List.splice(c,1);
        };
        Row.getValue = function(name){
            for(var i in Row.List)
            {
                if(Row.List[i].hasOwnProperty(name))
                    return Row.List[i].get();
            }
        };
        Row.getCell = function(name)
        {
            for(var i in Row.List)
            {
                if(Row.List[i].hasOwnProperty(name))
                    return Row.List[i];
            }

        }
        Row.setValue = function(name,value){
            for(var i in Row.List)
            {
                if(Row.List[i].hasOwnProperty(name))
                {
                    Row.List[i].set(value)
                    return;
                }
            }
            var c = cell.createNew(name,value,Row)
            //Row.List.push(c);
            Row.addCell(c);

            /*
             if(index<Row.List.length)
             {

             Row.List[index][name] = value	;
             }*/
        };
        Row.addCelln_v = function(name,value){
            var c = cell.createNew(name,value,Row);
            //	c.name = name;
            //c.value = value;
            c.row = Row;
            //Row.List.push(c);
            Row.addCell(c);
        };
        Row.getList = function()
        {
            return Row.List;
        };
        Row.getColCount = function()
        {
            return Row.List.length;
        }
        return Row;
    }
};


var dataSet = {
    createNew: function(){
        var dataSet = {};
        dataSet.name = "";
        dataSet.List = [];
        dataSet.Colname = [];
        dataSet.addRow = function(r,func){
            r.dataSet = dataSet;
            if(r.rowid == null)
            {
                var rid = r.getValue("rowid");
                if(rid == null)
                {
                    r.rowid = guid();
                }
                else
                {
                    r.rowid = rid;
                }
            }
            dataSet.List.push(r);
            if(func!=null)
                func();
        };
        //参数是二维数组 [[],[]]
        dataSet.addRowData= function(data,func)
        {
            for(var i in data){

                var r = Row.createNew();
                var index = dataSet.Colname.indexOf("rowid");
                if(index>=0)
                {
                    r.rowid  = data[i][index];

                }
                else
                {

                    r.rowid= guid();
                }

                for(var j in dataSet.Colname )
                {
                    var c = cell.createNew(dataSet.Colname[j],data[i][j],r);

                    r.addCell(c);
                }
                //bug zgw 不是添加cell fixed
                //	r.List = data[i];
                r.dataSet = dataSet;
                dataSet.addRow(r);
                if(func!=null)
                    func(r);
            }

        }

        dataSet.removerow = function(row){

            //	var index = dataSet.List.indexOf(row)
            dataSet.List.splice(row,1);

        };
        dataSet.loadData = function(){};
        dataSet.getValue = function(index,name){
            return	dataSet.List[index].getValue(name);

        };
        dataSet.getRowCount = function(){

            return dataSet.List.length;
        };
        dataSet.setValue = function(index,name,value){
            //dataSet.List[index][name]=value;
            dataSet.List[index].setValue(name,value);

        };

        dataSet.getData = function ()
        {
            /*  var dsdata = [];

              for (var i = 0; i < dataset.getRowCount(); i++)
              {

                  var rowdata = [];
                  var r = dataset.getRow(i);
                  for (j in r.getList())
                  {
                      rowdata.push(r.getList() [j].getname() + '=' + r.getList() [j].get());
                  }
                  dsdata.push(rowdata);
              }
              return dsdata;*/
            var dsdata = {};
            for (var i = 0; i < dataset.getRowCount(); i++)
            {
                dsdata[dataset.getRow(i).rowid]= {};
                for(var j= 0;j < dataset.getRow(i).getList().length;j++)
                {

                    var cell ={}
                    var cellname = dataset.getRow(i).List[j].getname();
                    var celldetail ={"cellname":cellname,"value":dataset.getRow(i).List[j].get()};
                    cell[dataset.getRow(i).List[j].getname()] = celldetail;
                    dsdata[dataset.getRow(i).rowid][cellname] = celldetail;
                }



            }
            return dsdata;
        };

        dataSet.getRow = function(index)
        {
            return dataSet.List[index];

        };
        //['name','id','value']
        dataSet.setColname = function(colnamearray)
        {
            dataSet.Colname = colnamearray;
        }
        dataSet.getColname = function()
        {
            return dataSet.Colname;
        }


        return dataSet;

    }
};
function DataBinder(object_id){
    //使用一个jQuery对象作为简单的订阅者发布者
    var pubSub = jQuery({});

    //我们希望一个data元素可以在表单中指明绑定：data-bind-<object_id>="<property_name>"

    var data_attr = "bind-" + object_id,
        message = object_id + ":change";

    //使用data-binding属性和代理来监听那个元素上的变化事件
    // 以便变化能够“广播”到所有的关联对象

    jQuery(document).on("change","[data-" + data_attr + "]",function(evt){
        var input = jQuery(this);
        pubSub.trigger(message, [ $(input).data(data_attr),$(input).val()]);
        //pubSub.trigger(message, [ $input.data(data_attr),$input.val()] );
    });

    //PubSub将变化传播到所有的绑定元素，设置input标签的值或者其他标签的HTML内容
    //TODO zgw 补齐所有的可以录入的内容

    pubSub.on(message,function(evt,prop_name,new_val){
        jQuery("[data-" + data_attr + "=" + prop_name + "]").each(function(){
            var $bound = jQuery(this);

            if($bound.is("input,textarea,select")){
                if($bound.is("input[type=checkbox]"))
                {
                    $bound.prop('checked',new_val)
                }
                else
                    $bound.val(new_val);
            }else{
                $bound.html(new_val);
            }
        });
    });

    return pubSub;
}


function User(uid){
    var binder = new DataBinder(uid),

        user = {
            atttibutes: {},

            //属性设置器使用数据绑定器PubSub来发布变化

            set: function(attr_name,val){
                this.atttibutes[attr_name] = val;
                binder.trigger(uid + ":change", [attr_name, val, this]);
            },

            get: function(attr_name){
                return this.attributes[attr_name];
            },

            _binder: binder
        };

    binder.on(uid +":change",function(vet,attr_name,new_val,initiator){
        if(initiator !== user){
            user.set(attr_name,new_val);
        }
    })

    return user;
}

var user = new User(123);
user.set("zgw","Wolfgang");

//html



var ds = dataSet.createNew();
var c = cell.createNew();
var r = Row.createNew();
r.addCelln_v('zgw',123123);
r.addCelln_v('n2',123);

//dataset.addRow(r);
ds.addRow(r,function(){

    }
);
var data = [[{'n1':1231},{'name':'zgw'},{'rowid':123}] ];
ds.addRowData(data);
//dataset.addRow(r,function(){alert(r)});
