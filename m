Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH 07/19] clk: hix5hd2: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:44 -0700
Message-Id: <1430897996-11597-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/hisilicon/clk-hix5hd2.c:255:13: warning: symbol 'hix5hd2_clk_register_complex' was not declared. Should it be static?

Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/hisilicon/clk-hix5hd2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hix5hd2.c b/drivers/clk/hisilicon/clk-hix5hd2.c
index f1d239435826..78bd95b6fc7b 100644
--- a/drivers/clk/hisilicon/clk-hix5hd2.c
+++ b/drivers/clk/hisilicon/clk-hix5hd2.c
@@ -252,8 +252,9 @@ static struct clk_ops clk_complex_ops = {
 	.disable = clk_complex_disable,
 };
 
-void __init hix5hd2_clk_register_complex(struct hix5hd2_complex_clock *clks,
-					 int nums, struct hisi_clock_data *data)
+static void __init
+hix5hd2_clk_register_complex(struct hix5hd2_complex_clock *clks, int nums,
+			     struct hisi_clock_data *data)
 {
 	void __iomem *base = data->base;
 	int i;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
