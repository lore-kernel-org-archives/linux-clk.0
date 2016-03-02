Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 18/41] clk: ti: Remove CLK_IS_ROOT
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-19-git-send-email-sboyd@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <56D70797.9040000@ti.com>
Date: Wed, 2 Mar 2016 17:32:39 +0200
MIME-Version: 1.0
In-Reply-To: <1456858826-28541-19-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 03/01/2016 09:00 PM, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/clk/ti/clk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
> index b5bcd77e8d0f..5fcf247759ac 100644
> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -305,8 +305,8 @@ struct clk __init *ti_clk_register_clk(struct ti_clk *setup)
>   	case TI_CLK_FIXED:
>   		fixed = setup->data;
>
> -		clk = clk_register_fixed_rate(NULL, setup->name, NULL,
> -					      CLK_IS_ROOT, fixed->frequency);
> +		clk = clk_register_fixed_rate(NULL, setup->name, NULL, 0,
> +					      fixed->frequency);
>   		break;
>   	case TI_CLK_MUX:
>   		clk = ti_clk_register_mux(setup);
>
