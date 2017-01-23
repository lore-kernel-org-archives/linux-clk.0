Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, zhangqing@rock-chips.com, zhengxing@rock-chips.com
Subject: Re: [PATCH v2 1/3] clk: rockchip: add rk3288 vip_out clock ids
Date: Mon, 23 Jan 2017 01:26:04 +0100
Message-ID: <1826150.hujBsPdyRR@phil>
In-Reply-To: <1484718161-27702-1-git-send-email-jacob-chen@iotwrt.com>
References: <1484718161-27702-1-git-send-email-jacob-chen@iotwrt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 18. Januar 2017, 13:42:38 CET schrieb Jacob Chen:
> Add clock-ids for the vip block of the rk3288
> 
> Signed-off-by: Jacob Chen <jacob-chen@iotwrt.com>

applied all 3 for 4.11 .

I've fixed the indentation below (missing one additional tab)
and adapted patch3 to also remove the CLK_IGNORE_UNUSED flags for the clocks we 
now moved to the critical clocks.


Heiko
