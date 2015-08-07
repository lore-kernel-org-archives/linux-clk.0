Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 7 Aug 2015 16:45:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 17/26] clk: rockchip: Convert to clk_hw based provider
 APIs
Message-ID: <20150807234501.GD16477@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-18-git-send-email-sboyd@codeaurora.org>
 <1633764.ZhyQ4HJNBu@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1633764.ZhyQ4HJNBu@diego>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/04, Heiko Stübner wrote:
> Am Freitag, 31. Juli 2015, 10:03:57 schrieb Stephen Boyd:
> > We're removing struct clk from the clk provider API, so switch
> > this code to using the clk_hw based provider APIs.
> > 
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Looks correct to me and there are no functional changes in here anyway
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Thanks. There was one bug, but I fixed it ;-)

---8<---
diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 198261e001fa..eab430452c52 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -295,7 +295,7 @@ static void rockchip_rk3066_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, clk_hw_get_parent(hw));
+				__func__, clk_hw_get_name(hw));
 			return;
 		}
 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
