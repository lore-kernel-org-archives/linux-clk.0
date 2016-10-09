Return-Path: <shawnguo@kernel.org>
Date: Sun, 9 Oct 2016 08:26:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	John Stultz <john.stultz@linaro.org>, linux-clk@vger.kernel.org,
	Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH] clk: hi6220: use CLK_OF_DECLARE_DRIVER for sysctrl and
 mediactrl clock init
Message-ID: <20161009002608.GA8772@tiger>
References: <1475933892-16021-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475933892-16021-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Sat, Oct 08, 2016 at 09:38:12PM +0800, Shawn Guo wrote:
> The hi6220-sysctrl and hi6220-mediactrl are not only clock provider but
> also reset controller.  It worked fine that single sysctrl/mediactrl
> device node in DT can be used to initialize clock driver and populate
> platform device for reset controller.  But it stops working after
> commit 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> gets merged.  The commit sets flag OF_POPULATED during clock
> initialization to skip the platform device populating for the same
> device node.  On hi6220, it effectively makes hi6220-sysctrl reset
> driver not probe any more.
> 
> The patch changes hi6220 sysctrl and mediactrl clock init macro from
> CLK_OF_DECLARE to CLK_OF_DECLARE_DRIVER, so that the reset driver using
> the same hardware block can continue working.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> It fixes an issue that is seen on linux-next, i.e. the new added
> hi6220-sysctrl reset driver doesn't probe at all, and consequently the
> mmc driver fails to register.

Correction: the hi6220-sysctrl has been there for a while, and the issue
is discovered by mmc driver which adds reset support recently.  So
technically, this is a regression fix.

Shawn
