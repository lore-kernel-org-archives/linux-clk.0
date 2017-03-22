Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] clk: rockchip: add pll_wait_lock for pll_enable
Date: Wed, 22 Mar 2017 19:07:39 +0100
Message-ID: <1524529.CszJHdUNkn@phil>
In-Reply-To: <1487732395-30353-1-git-send-email-zhangqing@rock-chips.com>
References: <1487732395-30353-1-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 22. Februar 2017, 10:59:55 CET schrieb Elaine Zhang:
> If pll is power down,when power up pll need wait pll lock.
> The reference documents section:
> 	PLL frequency change and lock check
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied to my clk-branch for 4.12


Thanks
Heiko
