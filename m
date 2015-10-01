Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/8] clk: rockchip: add new clock type and controller for rk3036
Date: Thu, 01 Oct 2015 10:12:34 +0200
Message-ID: <17410513.afcQr96dHz@diego>
In-Reply-To: <1443492833-15630-6-git-send-email-zhengxing@rock-chips.com>
References: <1443492833-15630-1-git-send-email-zhengxing@rock-chips.com> <1443492833-15630-6-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 29. September 2015, 10:13:50 schrieb Xing Zheng:
> The rk3036's pll and clock are different with base on the rk3066(rk3188,
> rk3288, rk3368 use it), there are different adjust foctors and control
> registers, so these should be independent and separate from the series
> of rk3066s.

subject should probably be like
clk: rockchip: add new pll-type for rk3036 and similar socs


And the general handling should probably be implemented similar to the example 
I posted in the v2 thread yesterday. [of course folded in and not as a 
separate patch ;-) ]


Heiko
