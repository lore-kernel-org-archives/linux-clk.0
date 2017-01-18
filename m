Return-Path: <leo.yan@linaro.org>
Return-Path: <leo.yan@linaro.org>
From: Leo Yan <leo.yan@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Leo Yan <leo.yan@linaro.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Guodong Xu <guodong.xu@linaro.org>,
	John Stultz <john.stultz@linaro.org>
Subject: [PATCH] clk: hisilicon: fix lock assignment
Date: Wed, 18 Jan 2017 16:13:38 +0800
Message-Id: <1484727218-3499-1-git-send-email-leo.yan@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

In clock driver initialize phase the spinlock is missed to assignment
to struct clkgate_separated, finally there have no locking to protect
exclusive accessing for clock registers.

This bug introduces the console has no output after enable coresight
driver on 96borads Hikey; this is because console using UART3, which
has shared the same register with coresight clock enabling bit. After
applied this patch it can assign lock properly to protect exclusive
accessing, and console can work well after enabled coresight modules.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 drivers/clk/hisilicon/clkgate-separated.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/hisilicon/clkgate-separated.c b/drivers/clk/hisilicon/clkgate-separated.c
index a47812f..7908bc3 100644
--- a/drivers/clk/hisilicon/clkgate-separated.c
+++ b/drivers/clk/hisilicon/clkgate-separated.c
@@ -120,6 +120,7 @@ struct clk *hisi_register_clkgate_sep(struct device *dev, const char *name,
 	sclk->bit_idx = bit_idx;
 	sclk->flags = clk_gate_flags;
 	sclk->hw.init = &init;
+	sclk->lock = lock;
 
 	clk = clk_register(dev, &sclk->hw);
 	if (IS_ERR(clk))
-- 
2.7.4
