Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: Mark rockchip_fractional_approximation static
Date: Thu, 24 Aug 2017 10:32:57 +0200
Message-ID: <5969098.AH50Gsce9G@phil>
In-Reply-To: <20170823230819.GM21656@codeaurora.org>
References: <20170823223932.27881-1-sboyd@codeaurora.org> <20170823230819.GM21656@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 23. August 2017, 16:08:19 CEST schrieb Stephen Boyd:
> On 08/23, Stephen Boyd wrote:
> > Silence the sparse warning
> > 
> > clk/rockchip/clk.c:172:6: warning: symbol 'rockchip_fractional_approximation' was not declared. Should it be static?
> > 
> > Cc: Elaine Zhang <zhangqing@rock-chips.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> 
> Applied to clk-next

thanks for catching that.

Heiko
