Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 7 Aug 2015 16:59:49 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	zmxu@marvell.com, jszhang@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: berlin: add cpuclk
Message-ID: <20150807235949.GB9678@codeaurora.org>
References: <1438259752-16320-1-git-send-email-antoine.tenart@free-electrons.com>
 <1438259752-16320-2-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438259752-16320-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/30, Antoine Tenart wrote:
> Add cpuclk in the Berlin BG2Q clock driver. This clk has a divider
> fixed to 1.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---

I didn't get anything besides 1/3, but this looks ok. If you
don't want us to take this through clk-tree, feel to take my ack

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

>  drivers/clk/berlin/bg2q.c            | 14 +++++++-------
>  include/dt-bindings/clock/berlin2q.h |  3 ++-
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
> index 221f40c2b850..72d2f3500db8 100644
> --- a/drivers/clk/berlin/bg2q.c
> +++ b/drivers/clk/berlin/bg2q.c
> @@ -45,7 +45,7 @@
>  #define REG_SDIO0XIN_CLKCTL	0x0158
>  #define REG_SDIO1XIN_CLKCTL	0x015c
>  
> -#define	MAX_CLKS 27
> +#define	MAX_CLKS 28

Maybe you should move this into the dt-bindings.h file.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
