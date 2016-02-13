Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Feb 2016 17:14:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, lee.jones@linaro.org,
	maxime.ripard@free-electrons.com, maxime.coquelin@st.com,
	geert@linux-m68k.org, heiko@sntech.de, andre.przywara@arm.com,
	rklein@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v42 1/6] clk: Allow clocks to be marked as CRITICAL
Message-ID: <20160213011403.GI4847@codeaurora.org>
References: <1455225554-13267-1-git-send-email-mturquette@baylibre.com>
 <1455225554-13267-2-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455225554-13267-2-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/11, Michael Turquette wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b4db67a..993f775 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2484,6 +2484,11 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
>  	if (core->ops->init)
>  		core->ops->init(core->hw);
>  
> +	if (core->flags & CLK_IS_CRITICAL) {
> +		clk_core_prepare(core);
> +		clk_core_enable(core);
> +	}

What do we do if this is an orphan clk? From what I can tell
we're not going to increment the ref count on the parents that
may or may not appear at some later time when this flag is set.
Furthermore, do we want to propagate the CLK_IS_CRITICAL flag up
to all the parent clocks so that the warning mechanism spits out
errors for parent clocks? I suppose that may not be very useful
assuming refcounts are correct, but it may be useful to know
which clocks are critical and which ones aren't during debug.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
