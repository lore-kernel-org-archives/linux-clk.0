Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com
Cc: sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, zhangqing@rock-chips.com, wxt@rock-chips.com
Subject: Re: [PATCH 0/3] clk: rockchip: introduce a clock type for factor clocks
Date: Fri, 05 Feb 2016 20:05:11 +0100
Message-ID: <2442476.dtC5zuBlBQ@diego>
In-Reply-To: <1453939306-984-1-git-send-email-heiko@sntech.de>
References: <1453939306-984-1-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 28. Januar 2016, 01:01:43 schrieb Heiko Stuebner:
> We're currently creating factor clocks manually during clock init.
> That worked well in the beginning, but since the rk3288 we also see
> combined gate-factor clocks and the overall number of factor clocks
> we create manually seems to be rising. And also sometimes created
> artificial separations that do not come from the clock hirarchy.
> 
> So I finished something I started some 6 months ago to finally be
> able to model factor clocks inside the clock-tree where they belong.

applied all 3 to my clk-branch for 4.6
