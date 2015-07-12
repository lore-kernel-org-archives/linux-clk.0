Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] clk: pxa: fix core frequency reporting unit
Date: Sun, 12 Jul 2015 22:49:53 +0200
Message-Id: <1436734193-6915-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

Legacy drivers which are not yet ported, such as cpufreq-pxa[23]xx, rely
on pxaXXx_get_clk_frequency_khz() to find the CPU core frequency.

This reporting was broken because the expected unit is kHz and not
Hz. Fix the reporting for pxa25x, pxa27x and pxa3xx.

Fixes: fe7710fae477 ("clk: add pxa25x clock drivers")
Fixes: d40670dc6169 ("clk: add pxa27x clock drivers")
Fixes: 9bbb8a338fb2 ("clk: pxa: add pxa3xx clock driver")
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/clk/pxa/clk-pxa25x.c | 2 +-
 drivers/clk/pxa/clk-pxa27x.c | 2 +-
 drivers/clk/pxa/clk-pxa3xx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index 6cd88d963a7f..542e45ef5087 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -79,7 +79,7 @@ unsigned int pxa25x_get_clk_frequency_khz(int info)
 			clks[3] / 1000000, (clks[3] % 1000000) / 10000);
 	}
 
-	return (unsigned int)clks[0];
+	return (unsigned int)clks[0] / KHz;
 }
 
 static unsigned long clk_pxa25x_memory_get_rate(struct clk_hw *hw,
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 9a31b77eed23..5b82d30baf9f 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -80,7 +80,7 @@ unsigned int pxa27x_get_clk_frequency_khz(int info)
 		pr_info("System bus clock: %ld.%02ldMHz\n",
 			clks[4] / 1000000, (clks[4] % 1000000) / 10000);
 	}
-	return (unsigned int)clks[0];
+	return (unsigned int)clks[0] / KHz;
 }
 
 bool pxa27x_is_ppll_disabled(void)
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 4b93a1efb36d..c677b9ab5367 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -78,7 +78,7 @@ unsigned int pxa3xx_get_clk_frequency_khz(int info)
 		pr_info("System bus clock: %ld.%02ldMHz\n",
 			clks[4] / 1000000, (clks[4] % 1000000) / 10000);
 	}
-	return (unsigned int)clks[0];
+	return (unsigned int)clks[0] / KHz;
 }
 
 static unsigned long clk_pxa3xx_ac97_get_rate(struct clk_hw *hw,
-- 
2.1.4
