Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Finlye Xiao <finley.xiao@rock-chips.com>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, wxt@rock-chips.com, zyw@rock-chips.com, jay.xu@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, huangtao@rock-chips.com
Subject: Re: [PATCH v1] clk: Add clk_composite_set_rate_and_parent
Date: Thu, 14 Apr 2016 06:56:08 +0200
Message-ID: <4176514.rpsd1Fqbyv@diego>
In-Reply-To: <20160414004331.GK14441@codeaurora.org>
References: <1460339652-63498-1-git-send-email-finley.xiao@rock-chips.com> <3986787.PS6VzOpSAJ@phil> <20160414004331.GK14441@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 13. April 2016, 17:43:31 schrieb Stephen Boyd:
> On 04/12, Heiko Stuebner wrote:
> > I remember having clocks not overflow their target rate came up in some
> > ELC
> > talk last week (probably in Stephens Qualcomm-kernel-talk) and a general
> > solution might need some changes closer to the core.
> 
> Yep. It's on the list. Hopefully coordinated clk rate changes
> will help here. Composite clks are sort of already coordinated
> rates in a minor form though.

Which is why I hope we can land this (meaning v2 from tuesday) in the 
meantime, as it fixes an issue we're seeing on the rk3399 and shouldn't affect 
any part of the core clock-framework ;-) .


Heiko
