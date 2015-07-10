Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCH 24/45] clk: socfpga: Remove clk.h and clkdev.h includes
Date: Fri, 10 Jul 2015 16:33:22 -0700
Message-Id: <1436571223-10959-25-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the include here because this is a
provider driver. The clkdev.h include isn't used either, remove
it and add in slab.h to make sure things keep compiling.

Cc: Dinh Nguyen <dinguyen@opensource.altera.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/socfpga/clk-gate-a10.c   | 1 +
 drivers/clk/socfpga/clk-gate.c       | 3 +--
 drivers/clk/socfpga/clk-periph-a10.c | 1 +
 drivers/clk/socfpga/clk-periph.c     | 3 +--
 drivers/clk/socfpga/clk-pll-a10.c    | 1 +
 drivers/clk/socfpga/clk-pll.c        | 3 +--
 drivers/clk/socfpga/clk.h            | 1 -
 7 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index 83c6780ff4b2..538ca504dea1 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -13,6 +13,7 @@
  * You should have received a copy of the GNU General Public License along with
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 82449cd76fd7..37e0bb60ac68 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -15,8 +15,7 @@
  * Based from clk-highbank.c
  *
  */
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/clk/socfpga/clk-periph-a10.c b/drivers/clk/socfpga/clk-periph-a10.c
index 9d0181b5a6a4..64f93acbbd25 100644
--- a/drivers/clk/socfpga/clk-periph-a10.c
+++ b/drivers/clk/socfpga/clk-periph-a10.c
@@ -13,6 +13,7 @@
  * You should have received a copy of the GNU General Public License along with
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/socfpga/clk-periph.c b/drivers/clk/socfpga/clk-periph.c
index 83aeaa219d14..ab9c8164a98f 100644
--- a/drivers/clk/socfpga/clk-periph.c
+++ b/drivers/clk/socfpga/clk-periph.c
@@ -15,8 +15,7 @@
  * Based from clk-highbank.c
  *
  */
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/socfpga/clk-pll-a10.c b/drivers/clk/socfpga/clk-pll-a10.c
index 1178b11babca..402d630bd531 100644
--- a/drivers/clk/socfpga/clk-pll-a10.c
+++ b/drivers/clk/socfpga/clk-pll-a10.c
@@ -13,6 +13,7 @@
  * You should have received a copy of the GNU General Public License along with
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index 8f26b5234947..c7f463172e4b 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -15,8 +15,7 @@
  * Based from clk-highbank.c
  *
  */
-#include <linux/clk.h>
-#include <linux/clkdev.h>
+#include <linux/slab.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/socfpga/clk.h b/drivers/clk/socfpga/clk.h
index 603973ab7e29..f4219202844a 100644
--- a/drivers/clk/socfpga/clk.h
+++ b/drivers/clk/socfpga/clk.h
@@ -18,7 +18,6 @@
 #define __SOCFPGA_CLK_H
 
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 
 /* Clock Manager offsets */
 #define CLKMGR_CTRL		0x0
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

