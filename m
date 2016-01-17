Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for hclk_vio_bus
Date: Sun, 17 Jan 2016 20:14:07 +0100
Message-ID: <1816378.OnNVlMiORS@phil>
In-Reply-To: <1452858854-841-1-git-send-email-ykk@rock-chips.com>
References: <1452858854-841-1-git-send-email-ykk@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 15. Januar 2016, 19:54:14 schrieb Yakir Yang:
> HCLK_VIO_BUS is the noc bus controller clock for display module,
> due to it shouldn't belong to any driver, but we need it enabled,
> so just mark it as the CLK_IGNORE_UNUSED flag.
> 
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

applied to my clk-branch for 4.6

Thanks
Heiko
