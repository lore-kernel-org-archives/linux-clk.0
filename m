Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 11:17:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mturquette@baylibre.com, arnd@arndb.de, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, xie.baoyou@zte.com.cn
Subject: Re: [PATCH] clk: mmp: add missing header dependencies
Message-ID: <20160914181706.GP7243@codeaurora.org>
References: <1473834208-25896-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1473834208-25896-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/14, Baoyou Xie wrote:
> We get 1 warning when building kernel with W=1:
> drivers/clk/mmp/clk-mmp2.c:75:13: warning: no previous prototype for 'mmp2_clk_init' [-Wmissing-prototypes]
> 
> In fact, this function is declared in linux/clk/mmp.h,
> so this patch add missing header dependencies.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
