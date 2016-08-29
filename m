Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <chris.brandt@renesas.com>, mturquette@baylibre.com,
 Stephen Boyd <sboyd@codeaurora.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms+renesas@verge.net.au>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2f74597a-de90-884e-6878-cbe60c48af24@cogentembedded.com>
Date: Mon, 29 Aug 2016 21:39:42 +0300
MIME-Version: 1.0
In-Reply-To: <20160825190518.20764-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello.

On 08/25/2016 10:05 PM, Chris Brandt wrote:

> Instead of hard coding EXTAL only, check if EXTAL was specified. If not,
> then assume the USB clock is used as the main system clock.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/clk/renesas/clk-rz.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
> index f6312c6..466b9fc 100644
> --- a/drivers/clk/renesas/clk-rz.c
> +++ b/drivers/clk/renesas/clk-rz.c
> @@ -37,13 +37,29 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
>  	static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
>
>  	if (strcmp(name, "pll") == 0) {
> -		/* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
> -		unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
> -		const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
> -
> -		mult = cpg_mode ? (32 / 4) : 30;
> -
> -		return clk_register_fixed_factor(NULL, name, parent_name, 0, mult, 1);
> +		u32 freq = 0;
> +		struct device_node *np;
> +
> +		/* If a clock-frequency for extal was specified, assume EXTAL boot */
> +		np = of_find_node_by_name(NULL, "extal");
> +		if( np ) {

		if (np) {

    Please run your patches thru scripts/checkpatrch.pl.

> +			of_property_read_u32(np, "clock-frequency", &freq);
> +			if( freq )

			if (freq)

> +				return clk_register_fixed_factor(NULL, "pll", "extal",
> +					0, 30, 1);
> +		}
> +
> +		/* Must be USB clock boot */
> +		np = of_find_node_by_name(NULL, "usb_x1");

    "usb_x1" looks like a board specific name too much. Previously on R-Car we 
had the USB_EXTAL pin, maybe that one would be better?

> +		if( np ) {

		if (np) {

> +			of_property_read_u32(np, "clock-frequency", &freq);
> +			if( freq )

			if (freq)

> +				return clk_register_fixed_factor(NULL, "pll", "usb_x1",
> +					0, (32 / 4), 1);

    The inner parens not needed.

[...]

MBR, Sergei
