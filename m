Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 14:10:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>,
	Romain Perier <romain.perier@free-electrons.com>,
	Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>,
	Terry Zhou <bjzhou@marvell.com>
Subject: Re: [PATCH v3 4/6] clk: mvebu Add the time base generator clocks for
 Armada 3700
Message-ID: <20160815211014.GC361@codeaurora.org>
References: <1468935742-11218-1-git-send-email-gregory.clement@free-electrons.com>
 <1468935742-11218-5-git-send-email-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1468935742-11218-5-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/19, Gregory CLEMENT wrote:
> These clocks are children of the xtal clock and each one can be selected
> as a source for the peripheral clocks.
> 
> According to the datasheet it should be possible to modify their rate,
> but currently it is not supported.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---

Applied to clk-next + the following squashed in

diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index 2063ba7d5cb1..aa80db11f543 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -46,14 +46,14 @@ struct tbg_def {
 	u32 vcodiv_offset;
 };
 
-const struct tbg_def tbg[NUM_TBG] = {
+static const struct tbg_def tbg[NUM_TBG] = {
 	{"TBG-A-P", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL8, TBG_A_VCODIV_DIFF},
 	{"TBG-B-P", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL8, TBG_B_VCODIV_DIFF},
 	{"TBG-A-S", TBG_A_REFDIV, TBG_A_FBDIV, TBG_CTRL1, TBG_A_VCODIV_SE},
 	{"TBG-B-S", TBG_B_REFDIV, TBG_B_FBDIV, TBG_CTRL1, TBG_B_VCODIV_SE},
 };
 
-unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
+static unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
 {
 	u32 val;
 
@@ -62,7 +62,7 @@ unsigned int tbg_get_mult(void __iomem *reg, const struct tbg_def *ptbg)
 	return ((val >> ptbg->fbdiv_offset) & TBG_DIV_MASK) << 2;
 }
 
-unsigned int tbg_get_div(void __iomem *reg, const struct tbg_def *ptbg)
+static unsigned int tbg_get_div(void __iomem *reg, const struct tbg_def *ptbg)
 {
 	u32 val;
 	unsigned int div;
@@ -99,7 +99,7 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	hw_tbg_data->num = NUM_TBG;
 	platform_set_drvdata(pdev, hw_tbg_data);
 
-	parent = devm_clk_get(dev, 0);
+	parent = devm_clk_get(dev, NULL);
 	if (IS_ERR(parent)) {
 		dev_err(dev, "Could get the clock parent\n");
 		return -EINVAL;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
