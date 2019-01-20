using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace PlatformManage.Backstage.MySql_utils {
    public enum MySqlRequest {
        INSERT = 0x0001,
        DELETE = 0x0010,
        UPDATE = 0x0100,
        SEARCH = 0x1000,
    }

    public class MySqlCmd {
        public delegate void AdapterCallBack(ref MySqlAdapter adapter);
        public delegate void ExecutedCallBack(MySqlContext udata);
        public delegate void CreateCommand(ref MySqlContext udata);

        /// <summary>
        /// 不用于进行数据集绑定
        /// </summary>
        public struct MySqlContext {
            public MySqlConnection conn;               // 用户请求的数据库连接对象
            public MySqlCommand comm;                  // 用户请求的command命令对象
            public MySqlRequest status;                // 数据库请求的命令号
            public string context;                     // 用户请求的command命令描述
            public int res;                            // 数据库执行操作返回值
            public CreateCommand create_cmd;           // 用户自定义数据库命令创建方法
        }

        public struct MySqlAdapter {
            public MySqlDataAdapter adapter;           // 用户数据库适配器
            public GridView grid_view;                 // 用户使用GridView控件
            public string[] columns;                   // 用户数据库列名
            public DataTable data_table;                      // 返回一个新的DataTable
        }

        /// <summary>
        /// 打开数据库返回请求连接的数据库对象
        /// </summary>
        /// <param name="conn">数据库连接字符串</param>
        /// <returns>数据库连接对象</returns>
        public static MySqlConnection Connection(string conn_str) {
            MySqlConnection conn_object = new MySqlConnection(conn_str);
            return conn_object;
        }

        /// <summary>
        /// 创建数据库适配器对象,执行用户自定义方法
        /// </summary>
        /// <param name="cmd_str">数据库命令字符串</param>
        /// <param name="conn">连接的数据库对象</param>
        /// <param name="callback">用户自定义方法</param>
        public static void SetMySqlDataAdapter(string cmd_str, MySqlConnection conn, ref MySqlAdapter uadapter, AdapterCallBack callback) {
            lock (conn) {
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd_str, conn);
                uadapter.adapter = adapter;
                callback(ref uadapter);
            }
        }

        /// <summary>
        /// 执行数据库命令，执行用户自定义方法
        /// </summary>
        /// <param name="udata">自定义数据类型</param>
        public static void SetMySqlCommand(ref MySqlContext udata) {
            lock (udata.conn) {
                udata.conn.Open();
                udata.create_cmd(ref udata);
                if (udata.comm == null) {
                    if (udata.context == null) {
                        udata.conn.Close();
                        return;
                    }
                    udata.comm = new MySqlCommand(udata.context, udata.conn);
                }

                try {
                    udata.res = udata.comm.ExecuteNonQuery();
                }
                catch (Exception ex) {
                    udata.context = "Error: " + ex.Message;
                }
                udata.conn.Close();
            }
        }

        /// <summary>
        /// 登录后台调用
        /// </summary>
        /// <param name="udata">自定义数据类型</param>
        public static void LoginCommand(ref MySqlContext udata) {
            lock (udata.conn) {
                udata.conn.Open();
                udata.create_cmd(ref udata);
                if (udata.comm == null) {
                    if (udata.context == null) {
                        udata.conn.Close();
                        return;
                    }
                    udata.comm = new MySqlCommand(udata.context, udata.conn);
                }

                MySqlDataReader reader = udata.comm.ExecuteReader();
                reader.Read();
                if (reader.HasRows) {
                    if (reader.FieldCount > 2) {
                        udata.context = "`" + reader.GetName(2) + "`=\"" + reader.GetString(2) + "\";"; ;
                    }
                    else {
                        udata.context = "";
                    }
                    udata.res = 1;
                }
                else {
                    udata.res = 0;
                }
                reader.Close();
                udata.conn.Close();
            }
        }

        /// <summary>
        /// 转换日期
        /// </summary>
        /// <param name="date_str"></param>
        /// <returns></returns>
        public static string MySqlDateConvert(string date_str) {
            Regex reg = new Regex(@" [\u4e00-\u9fa5]* ");
            string result = "";
            if (reg.IsMatch(date_str)) {
                result = reg.Replace(date_str, new MatchEvaluator(convert));
            }

            return result;
        }

        public static string convert(Match match) {
            string res = match.Value;
            switch (res.Trim()) {
            case "一月": {
                res = "01";
            }break;
            case "二月": {
                res = "02";
            }break;
            case "三月": {
                res = "03";
            }break;
            case "四月": {
                res = "04";
            }break;
            case "五月": {
                res = "05";
            }break;
            case "六月": {
                res = "06";
            }break;
            case "七月": {
                res = "07";
            }break;
            case "八月": {
                res = "08";
            }break;
            case "九月": {
                res = "09";
            }break;
            case "十月": {
                res = "10";
            }break;
            case "十一月": {
                res = "11";
            }break;
            case "十二月": {
                res = "12";
            }
            break;
            default:
                break;
            }
            return "-" + res + "-";
        }
    }
}