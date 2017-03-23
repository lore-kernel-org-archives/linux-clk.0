Return-Path: <jun.nie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1490085503-15713-3-git-send-email-shawnguo@kernel.org>
References: <1490085503-15713-1-git-send-email-shawnguo@kernel.org> <1490085503-15713-3-git-send-email-shawnguo@kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 23 Mar 2017 09:34:13 +0800
Message-ID: <CABymUCPtn+XcLyDcYhpTsOqW3kCY_LgT0y+RE31ydAYrzMM=gw@mail.gmail.com>
Subject: Re: [PATCH 2/3] zte: clk: pd_bit is not 0 on zx296718
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Baoyou Xie <xie.baoyou@zte.com.cn>, Xin Zhou <zhou.xin8@zte.com.cn>,
	Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2017-03-21 16:38 GMT+08:00 Shawn Guo <shawnguo@kernel.org>:
> From: Shawn Guo <shawn.guo@linaro.org>
>
> The bit 0 of PLL_CFG0 register is not powerdown on zx296718, but part of
> of postdiv2 field.  The consequence is that functions like hw_to_idx()
> and zx_pll_enable() will end up tampering the postdiv2 of the PLL.
>
> Let's fix it by defining pd_bit 0xff which is obviously invalid for a
> bit position and having PLL driver check the validity before operating
> on the bit.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: Jun Nie <jun.nie@linaro.org>
