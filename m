Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Jan 2016 16:31:00 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xing Zheng <zhengxing@rock-chips.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix wrong mmc phase shift for rk3228
Message-ID: <20160130003100.GB12841@codeaurora.org>
References: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1453779018-30666-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/26, Shawn Lin wrote:
> mmc sample shift is 0 for rk3228 refer to user manaul.
> So it's broken if we enable mmc tuning for rk3228.
> 
> Fixes: 307a2e9ac ("clk: rockchip: add clock controller for rk3228")
> Cc: Xing Zheng <zhengxing@rock-chips.com>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
