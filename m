Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Heiko Stuebner <heiko@sntech.de>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Subject: [PATCH 2/7] clk: rockchip: fix issues in the mmc-phase clock
Date: Sun,  5 Jul 2015 11:00:15 +0200
Message-Id: <1436086820-3757-3-git-send-email-heiko@sntech.de>
In-Reply-To: <1436086820-3757-1-git-send-email-heiko@sntech.de>
References: <1436086820-3757-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The review for the new inverter clock type uncovered some issues (missing
headers and name handling) that are also present in the mmc-phase clock
type, I got (to much) inspiration from. Fix these there too.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-mmc-phase.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
index e9f8df32..f2c6889 100644
--- a/drivers/clk/rockchip/clk-mmc-phase.c
+++ b/drivers/clk/rockchip/clk-mmc-phase.c
@@ -15,6 +15,8 @@
 
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include "clk.h"
 
 struct rockchip_mmc_clock {
@@ -131,6 +133,7 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	if (!mmc_clock)
 		return NULL;
 
+	init.name = name;
 	init.num_parents = num_parents;
 	init.parent_names = parent_names;
 	init.ops = &rockchip_mmc_clk_ops;
@@ -139,9 +142,6 @@ struct clk *rockchip_clk_register_mmc(const char *name,
 	mmc_clock->reg = reg;
 	mmc_clock->shift = shift;
 
-	if (name)
-		init.name = name;
-
 	clk = clk_register(NULL, &mmc_clock->hw);
 	if (IS_ERR(clk))
 		goto err_free;
-- 
2.1.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
