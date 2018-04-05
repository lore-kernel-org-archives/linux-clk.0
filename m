Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Xing Zheng <xing.zheng@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>, Ziyuan Xu <xzy.xu@rock-chips.com>
Subject: Re: [PATCH 1/2] clk: divider: Add CLK_DIVIDER_EVEN flag support
Date: Thu, 05 Apr 2018 15:30:07 +0200
Message-ID: <3456608.qSAPWuSAs9@phil>
In-Reply-To: <1522906699-127765-1-git-send-email-shawn.lin@rock-chips.com>
References: <1522906699-127765-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,

Am Donnerstag, 5. April 2018, 07:38:18 CEST schrieb Shawn Lin:
> CLK_DIVIDER_EVEN is used for clock divders that should only
> use even number in the div field.
> 
> Two clock divder should consider to use this flag
> (1) The divder is physically only support even div number to
> generate 50% duty cycle clock rate.
> (2) The divder's clock consumer request it to use even div number
> to generate the most closest requested rate for whatever reason.
> 
> In some platforms, for instance Rockchip, the eMMC/SDIO/SDMMC should
> request divder to use even number when working at a high throughput
> speed mode reliably. However, that wasn't guaranteed by clock framework.
> So the previous tricky is to carefully assign magic clock rate to their
> parents as well as consumer's clock rate when requesting. That works
> bad in practice if folks change the parents clock rate or the clock
> hierarchy randomly. That also work bad if the consumer's clock rate
> came from the DT, which is changed so fraquent for different boards.
> 
> To make it's less prone to make mistake and to make it really respect
> the fact that the divder should use even number to the div field, we
> need the clock framework's help. Now we have CLK_DIVIDER_POWER_OF_TWO,
> which could guarantee the div field is even number, however, obviously
> it skips the even numbers which is the power of 2, but maybe which is
> the best div to generate closest clock rate for consumer.

I think there is a slight misunderstanding here, CLK_DIVIDER_POWER_OF_TWO
means "2 raised to the value read from the hardware register", so describes
a hardware property, while your CLK_DIVIDER_EVEN describes needed special
handling due to some hardware necessity.

That is not meant to nack your change, but just to point out that you can
also have CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_EVEN, which is
relevant for the uneven 2^0 = 1 case and should be taken in to account.


Heiko
