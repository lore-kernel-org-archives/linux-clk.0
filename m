Return-Path: <jsarha@ti.com>
Subject: Re: [PATCH] clk: provider: Remove of_gpio_{gate,mux}_clk_setup()
 prototypes
To: Stephen Boyd <sboyd@codeaurora.org>,
        Mike Turquette
	<mturquette@baylibre.com>
References: <1454830926-10434-1-git-send-email-sboyd@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
From: Jyri Sarha <jsarha@ti.com>
Message-ID: <56B712E9.3020705@ti.com>
Date: Sun, 7 Feb 2016 11:48:25 +0200
MIME-Version: 1.0
In-Reply-To: <1454830926-10434-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/07/16 09:42, Stephen Boyd wrote:
> These functions either never existed or were only used in
> OF_CLK_DECLARE() macros. Remove the dead prototypes.
>

Yes, they were used by OF_CLK_DECLARE() macros. I originally made the 
of_gpio_clk_gate_setup() non static just because the other basic clocks 
were implemented the same way. Actually I do not follow why the 
functions needed to be non static in the first place. Surely the 
declarations can go now after the conversion to a platform driver.

Acked-by: Jyri Sarha <jsarha@ti.com>

> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>   include/linux/clk-provider.h | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 9c3a18c1a984..fce7f027f8a7 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -626,8 +626,6 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
>   		const char *parent_name, unsigned gpio, bool active_low,
>   		unsigned long flags);
>
> -void of_gpio_clk_gate_setup(struct device_node *node);
> -
>   /**
>    * struct clk_gpio_mux - gpio controlled clock multiplexer
>    *
> @@ -643,8 +641,6 @@ struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
>   		const char * const *parent_names, u8 num_parents, unsigned gpio,Acked-by:
>   		bool active_low, unsigned long flags);
>
> -void of_gpio_mux_clk_setup(struct device_node *node);
> -
>   /**
>    * clk_register - allocate a new clock, register it and return an opaque cookie
>    * @dev: device that is registering this clock
>
