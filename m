Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com
Subject: Re: [PATCH v1 0/3] clk: rockchip: rk3128: fix up some clks
Date: Sat, 09 Sep 2017 14:22:48 +0200
Message-ID: <1851166.xyq0T9qeKP@phil>
In-Reply-To: <1504231306-4450-1-git-send-email-zhangqing@rock-chips.com>
References: <1504231306-4450-1-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 1. September 2017, 10:01:43 CEST schrieb Elaine Zhang:
> Elaine Zhang (3):
>   clk: rockchip: rk3128: add pclk_pmu as critical clock
>   clk: rockchip: rk3128: fix up pvtm and mipi_24m gate regs description
>     error
>   clk: rockchip: rk3126: add sclk_timer5 as critical clock

applied all 3 as fixes for 4.14
(with some adjustments on subjects and commit messages)


Thanks
Heiko
