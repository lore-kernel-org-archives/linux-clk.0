Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/6] clk: stm32f4: SDIO & 48Mhz clock management for
 STM32F469 board
To: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, andrea.merello@gmail.com
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
 <1478523943-23142-3-git-send-email-gabriel.fernandez@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel@stlinux.com,
 ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <45a332b6-5170-9ae3-8d5e-c5f827c3edea@linaro.org>
Date: Mon, 7 Nov 2016 13:55:29 +0000
MIME-Version: 1.0
In-Reply-To: <1478523943-23142-3-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/11/16 13:05, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> In the stm32f469 soc, the 48Mhz clock could be derived from pll-q or
> from pll-sai-p.
>
> The SDIO clock could be also derived from 48Mhz or from sys clock.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  drivers/clk/clk-stm32f4.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 7641acd..dda15bc 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -199,7 +199,7 @@ struct stm32f4_gate_data {
>  	{ STM32F4_RCC_APB2ENR,  8,	"adc1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR,  9,	"adc2",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 10,	"adc3",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 11,	"sdio",		"pll48" },
> +	{ STM32F4_RCC_APB2ENR, 11,	"sdio",		"sdmux" },

I'm confused. How do the "sdmux" clock come to exist on STM32F429?


>  	{ STM32F4_RCC_APB2ENR, 12,	"spi1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 13,	"spi4",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 14,	"syscfg",	"apb2_div" },
> @@ -940,6 +940,10 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
>  	"no-clock", "lse", "lsi", "hse-rtc"
>  };
>
> +static const char *pll48_parents[2] = { "pll-q", "pllsai-p" };
> +
> +static const char *sdmux_parents[2] = { "pll48", "sys" };
> +
>  struct stm32f4_clk_data {
>  	const struct stm32f4_gate_data *gates_data;
>  	const u64 *gates_map;
> @@ -1109,6 +1113,18 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>  		goto fail;
>  	}
>
> +	if (of_device_is_compatible(np, "st,stm32f469-rcc")) {
> +		clk_hw_register_mux_table(NULL, "pll48",
> +				pll48_parents, ARRAY_SIZE(pll48_parents), 0,
> +				base + STM32F4_RCC_DCKCFGR, 27, 1, 0, NULL,
> +				&stm32f4_clk_lock);
> +
> +		clk_hw_register_mux_table(NULL, "sdmux",
> +				sdmux_parents, ARRAY_SIZE(sdmux_parents), 0,
> +				base + STM32F4_RCC_DCKCFGR, 28, 1, 0, NULL,
> +				&stm32f4_clk_lock);
> +	}
> +
>  	of_clk_add_hw_provider(np, stm32f4_rcc_lookup_clk, NULL);
>  	return;
>  fail:
>
