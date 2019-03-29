using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlatformManage.Backstage.MySql_utils {
    public class Database {
        private Dictionary<string, string> columns = new Dictionary<string, string>() {
            { "sequences", "序号" },
            { "contract_numbers", "合同编号" },
            { "items", "项目" },
            { "owners", "业主" },
            { "home_decoration_designers", "家装设计师" },
            { "wooden_decoration_designers", "木作设计师" },
            { "preliminary_survey", "初测" },
            { "water_electric_time", "水电" },
            { "contract_affirm", "合同确认" },
            { "contract_affirm_time", "合同确定时间" },
            { "reserve_time", "预定安装日期" },
            { "board_reserve_time", "橱柜预定安装日期" },
            { "clothes_board_reserve_time", "衣柜预定安装日期" },
            { "board_order_time", "橱柜下单时间" },
            { "clothes_board_order_time", "衣柜下单时间" },
            { "table_board", "台面" },
            { "board_door_table", "橱柜门板" },
            { "other_cabinet", "其他柜体" },
            { "waterchannel_wiring", "水槽、电器" },
            { "hardware_fitting", "五金配件" },
            { "real_install_time", "实际安装时间" },
            { "install_left_issue", "安装遗留问题" },
            { "comment", "备注" },
            { "account", "账号" },
            { "name", "姓名" },
        };

        /// <summary>
        /// 转化传入的键值为数据库中的列名
        /// </summary>
        /// <param name="name">要转化的列名称</param>
        /// <returns>value</returns>
        public static string convert_columns_name(string name) {
            Database db = new Database();
            if (db.columns.ContainsKey(name)) {
                return db.columns[name];
            }
            else {
                return null;
            }
        }

        /// <summary>
        /// 转化传入的键值为数据库中的中文
        /// </summary>
        /// <param name="name">要转化的列名称</param>
        /// <returns>key</returns>
        public static string convert_name_columns(string name) {
            Database db = new Database();
            var check_diction = from data in db.columns.AsQueryable()
                                where data.Value == name
                                select data.Key;

            string columns = "";
            check_diction.ToList().ForEach(key => columns = key);

            if (columns != "") return columns;
            else return null;
        }

        public static string convert_dataTime(DateTime dt) {
            return string.Format("{0:yyyy-MM-dd}", dt);
        }
    }
}