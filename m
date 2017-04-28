Return-Path: <arvind.yadav.cs@gmail.com>
Return-Path: <arvind.yadav.cs@gmail.com>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: palmas: undo preparation of a clock source.
Date: Fri, 28 Apr 2017 18:33:07 +0530
Message-Id: <1493384587-32659-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Undo preparation of a clock source, if palmas_clks_init_configure is not
successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/clk-palmas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 31f590c..7f51c01 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -229,6 +229,7 @@ static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
 		if (ret < 0) {
 			dev_err(cinfo->dev, "Ext config for %s failed, %d\n",
 				cinfo->clk_desc->clk_name, ret);
+			clk_unprepare(cinfo->hw.clk);
 			return ret;
 		}
 	}
-- 
1.9.1
