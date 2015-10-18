Return-Path: <geliangtang@163.com>
From: Geliang Tang <geliangtang@163.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jiri Kosina <trivial@kernel.org>
Cc: Geliang Tang <geliangtang@163.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/9] clk: keystone: fix a trivial typo
Date: Sun, 18 Oct 2015 23:31:12 +0800
Message-Id: <88b679770e91ce8e3aa2cd25912c6d589563388c.1445181079.git.geliangtang@163.com>
In-Reply-To: <949f6f3c99f87b57666986dc9f2d1c916935e215.1445181079.git.geliangtang@163.com>
References: <949f6f3c99f87b57666986dc9f2d1c916935e215.1445181079.git.geliangtang@163.com>
In-Reply-To: <eb89ced1dda5b521dba1ed6095deef09d577e37a.1445181079.git.geliangtang@163.com>
References: <949f6f3c99f87b57666986dc9f2d1c916935e215.1445181079.git.geliangtang@163.com> <557286dd38beb4d8d1be28e787ad89611e7cc077.1445181079.git.geliangtang@163.com> <5fea4cd474d5fe49688f88d91cdf5e8019844806.1445181079.git.geliangtang@163.com> <918fdb002ec3b2a9fc5a5d364c0fbaff2f77c5cc.1445181079.git.geliangtang@163.com> <eb89ced1dda5b521dba1ed6095deef09d577e37a.1445181079.git.geliangtang@163.com>
List-ID: <linux-clk.vger.kernel.org>

s/regsiter/register/

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 drivers/clk/keystone/pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index 3f553d0..a26ba21 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -157,7 +157,7 @@ out:
  * _of_clk_init - PLL initialisation via DT
  * @node: device tree node for this clock
  * @pllctrl: If true, lower 6 bits of multiplier is in pllm register of
- *		pll controller, else it is in the control regsiter0(bit 11-6)
+ *		pll controller, else it is in the control register0(bit 11-6)
  */
 static void __init _of_pll_clk_init(struct device_node *node, bool pllctrl)
 {
-- 
2.5.0
