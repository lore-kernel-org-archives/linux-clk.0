Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, rocky.hao@rock-chips.com, huangtao@rock-chips.com, xxx@rock-chips.com, jay.xu@rock-chips.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: validity should be checked prior to clock rate change
Date: Tue, 08 Nov 2016 14:26:54 +0100
Message-ID: <1924809.LJTn50YVYo@diego>
In-Reply-To: <1478596214-761-1-git-send-email-zhangqing@rock-chips.com>
References: <1478596214-761-1-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Elaine,

Am Dienstag, 8. November 2016, 17:10:14 schrieb Elaine Zhang:
> If validity is not checked prior to clock rate change, clk_set_rate(
> cpu_clk, unsupported_rate) will return success, but the real clock rate
> change operation is prohibited in post clock change event. Alough post
> clock change event will report error due to unsupported clock rate is
> set, but this error message is ignored by clock framework.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Rocky Hao <rocky.hao@rock-chips.com>

looks good and thanks for catching this. Just a bureaucracy-question regarding 
the Signed-off-by lines, before I can apply the patch as I don't really know 
how Rocky fits into the picture.

I.e. was he the original patch author (the we should change the from) or a 
reviewer/tester for the fixed issue?


Thanks
Heiko
