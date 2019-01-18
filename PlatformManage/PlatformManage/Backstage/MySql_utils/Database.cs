using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlatformManage.Backstage.MySql_utils {
    public class Database {
        private Dictionary<string, string> columns = new Dictionary<string, string>() {
            { "item", "项目" },
            { "owner", "业主" },
            { "home_style_designer", "家装设计师" },
            { "wooden_style_designer", "木作设计师" },
            { "first_test_time", "初测" },
            { "water_electric_time", "水电" },
            { "contract_comment", "备注" },
            { "other_cabinet", "其他柜体" },
        };

        /// <summary>
        /// 转化传入的键值为数据库中的列名
        /// </summary>
        /// <param name="name">要转化的列名称</param>
        /// <returns></returns>
        public static string convert_columns_name(string name) {
            Database db = new Database();
            if (db.columns.ContainsKey(name)) {
                return db.columns[name];
            }
            else {
                return null;
            }
        }
    }
}