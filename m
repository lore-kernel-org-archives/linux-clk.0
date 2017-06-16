Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Jun 2017 14:50:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock changes for 4.13
Message-ID: <20170616215036.GN20170@codeaurora.org>
References: <20170614192617.bsp5pjxrphlk36sk@flea.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170614192617.bsp5pjxrphlk36sk@flea.home>
List-ID: <linux-clk.vger.kernel.org>

On 06/14, Maxime Ripard wrote:
> Hi Mike, Stephen,
> 
> Here is the patches for 4.13 for the Allwinner SoCs.
> 
> In order to reduce the conflicts, this is based on the fixes tag I
> sent a PR for a few minutes ago.
> 

Thanks. Pulled into clk-next. I did notice on new sparse warning
though for which I've applied this diff on top:

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index cfe4538304fb..312664155a54 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,7 +68,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
 
-unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
