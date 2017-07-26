Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Jul 2017 17:32:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH] clk: Don't write error code into divider register
Message-ID: <20170726003208.GF2146@codeaurora.org>
References: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1500977920-5533-1-git-send-email-pdeschrijver@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/25, Peter De Schrijver wrote:
> From: Alex Frid <afrid@nvidia.com>
> 
> Add a check for error returned by divider value calculation to avoid
> writing error code into hw register.
> 
> Signed-off-by: Alex Frid <afrid@nvidia.com>
> Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Reviewed-by: Jon Mayo <jmayo@nvidia.com>
> ---

Fixes: bca9690b9426 ("clk: divider: Make generic for usage elsewhere")

perhaps?

Also, curious how this got triggered? Presumably round_rate would
have failed before a set_rate call with something invalid came
through so that's why nobody has reported anything so far.

>  drivers/clk/clk-divider.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 9bb472c..4ed516c 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -385,12 +385,14 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>  				unsigned long parent_rate)
>  {
>  	struct clk_divider *divider = to_clk_divider(hw);
> -	unsigned int value;
> +	int value;
>  	unsigned long flags = 0;
>  	u32 val;
>  
>  	value = divider_get_val(rate, parent_rate, divider->table,
>  				divider->width, divider->flags);
> +	if (value < 0)

Perhaps value should be an s32 if we're doing a writel with it
shifted so much. And then, we could declare it as a u32 and test
it with

	if ((s32)value < 0)

to see if there was an error. Sort of annoying that we've limited
the available space of divider_get_val() by combining the value
with the error code number space. We may want to not do that in
case people have huge dividers.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
