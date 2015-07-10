Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Carlo Caione <carlo@endlessm.com>
Subject: [PATCH 16/45] clk: meson8b: Properly include clk.h
Date: Fri, 10 Jul 2015 16:33:14 -0700
Message-Id: <1436571223-10959-17-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Only include clk.h if it's actually used.

Cc: Carlo Caione <carlo@endlessm.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/meson/clk-cpu.c | 1 +
 drivers/clk/meson/clkc.c    | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-cpu.c b/drivers/clk/meson/clk-cpu.c
index 71ad493b94df..f7c30ea54ca8 100644
--- a/drivers/clk/meson/clk-cpu.c
+++ b/drivers/clk/meson/clk-cpu.c
@@ -35,6 +35,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 
 #define MESON_CPU_CLK_CNTL1		0x00
diff --git a/drivers/clk/meson/clkc.c b/drivers/clk/meson/clkc.c
index b8c511c5e7a7..c83ae1367abc 100644
--- a/drivers/clk/meson/clkc.c
+++ b/drivers/clk/meson/clkc.c
@@ -15,7 +15,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

