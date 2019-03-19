using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace PlatformManage.Backstage.utils {
    /// <summary>
    /// Get all controls with T from current page;
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class PageSection<T> {
        /// <summary>
        /// ControlsContainer saves all controls in a section
        /// </summary>
        private List<T> controlsContainer = new List<T>();
        public List<T> ControlsContainer {
            get { return controlsContainer; }
        }

        public PageSection (ControlCollection controls) {
            foreach (Control cl in controls) {
                try {
                    T found_control = (T)((Object)cl);
                    controlsContainer.Add(found_control);
                }
                catch(Exception ex) {
                    continue;
                }
            }
        }
    }
}