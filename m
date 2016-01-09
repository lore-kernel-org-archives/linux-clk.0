Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: keescook@google.com, leozwang@google.com, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] fix some clock configuration for the RK3036 platform
Date: Sat, 09 Jan 2016 21:10:21 +0100
Message-ID: <2423996.DXmZSXDRX7@phil>
In-Reply-To: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
References: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing

Am Donnerstag, 7. Januar 2016, 20:17:32 schrieb Xing Zheng:
>   In the development work, we found that some of the previous
> incorrect clock configuration on the RK3036 platform, we should
> fix them.

I've applied patches 1-4 as fixes for 4.5 [0] and will apply patch 5
regularly once 4.5-rc1 is released and I have stable base again.


> Xing Zheng (5):
>   clk: rockchip: rk3036: fix the FLAGs for clock mux
>   clk: rockchip: rk3036: fix uarts clock error
>   clk: rockchip: rk3036: fix the div offset for emac clock
>   clk: rockchip: rk3036: rename emac ext source clock

please make sure to also update the binding document in such cases.
I've done it myself for this one.

[for people reading along: the rk3036 clock-driver + binding is new in
4.5 so we should be ok to fix the naming before it is actually released]


Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/log/?h=v4.5-clk/fixes
