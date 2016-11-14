Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, rocky.hao@rock-chips.com, huangtao@rock-chips.com, xxx@rock-chips.com, jay.xu@rock-chips.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: validity should be checked prior to clock rate change
Date: Mon, 14 Nov 2016 17:41:05 +0100
Message-ID: <8521074.U32oiGVMPt@phil>
In-Reply-To: <1478596214-761-1-git-send-email-zhangqing@rock-chips.com>
References: <1478596214-761-1-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 8. November 2016, 17:10:14 CET schrieb Elaine Zhang:
> If validity is not checked prior to clock rate change, clk_set_rate(
> cpu_clk, unsupported_rate) will return success, but the real clock rate
> change operation is prohibited in post clock change event. Alough post
> clock change event will report error due to unsupported clock rate is
> set, but this error message is ignored by clock framework.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Rocky Hao <rocky.hao@rock-chips.com>

after Elaine clarified that the line mentioning Rocky was actually a tested-by, 
applied to my clock branch


Thanks
Heiko
