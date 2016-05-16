Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 03/20] clk: sunxi: tcon-ch1: Do not return a negative error in get_parent
Date: Mon, 16 May 2016 14:47:03 +0200
Message-Id: <1463402840-17062-4-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

get_parent is supposed to return an unsigned 8 bit integer, so returning
-EINVAL is a bad idea.

Remove it.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c b/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
index 98a4582de56a..248585238b1c 100644
--- a/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
+++ b/drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
@@ -85,9 +85,6 @@ static u8 tcon_ch1_get_parent(struct clk_hw *hw)
 	reg = readl(tclk->reg) >> TCON_CH1_SCLK2_MUX_SHIFT;
 	reg &= reg >> TCON_CH1_SCLK2_MUX_MASK;
 
-	if (reg >= num_parents)
-		return -EINVAL;
-
 	return reg;
 }
 
-- 
2.8.2
