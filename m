Return-Path: <daniel.thompson@linaro.org>
Return-Path: <daniel.thompson@linaro.org>
Subject: Re: [PATCH] Reorganize STM32 clocks in order to prepare them for
 PLLI2S and PLLSAI
To: radek <radoslaw.pietrzyk@gmail.com>, mturquette@baylibre.com,
 sboyd@codeaurora.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
References: <1475791294-5804-1-git-send-email-user@localhost>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <2d6d5c10-346e-0541-1bc0-b75ef5b40d3f@linaro.org>
Date: Mon, 10 Oct 2016 10:37:45 +0100
MIME-Version: 1.0
In-Reply-To: <1475791294-5804-1-git-send-email-user@localhost>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/10/16 23:01, radek wrote:
> From: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
>
> Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
> ---
>  drivers/clk/clk-stm32f4.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 02d6810..1fd3eac 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char *hse_clk, const char *hsi_clk)
>  	const char   *pllsrc = pllcfgr & BIT(22) ? hse_clk : hsi_clk;
>  	unsigned long pllq   = (pllcfgr >> 24) & 0xf;
>
> -	clk_register_fixed_factor(NULL, "vco", pllsrc, 0, plln, pllm);
> -	clk_register_fixed_factor(NULL, "pll", "vco", 0, 1, pllp);
> -	clk_register_fixed_factor(NULL, "pll48", "vco", 0, 1, pllq);
> +	clk_register_fixed_factor(NULL, "vco-div", pllsrc, 0, 1, pllm);
> +	clk_register_fixed_factor(NULL, "vco-mul", "vco-div", 0, plln, 1);
> +	clk_register_fixed_factor(NULL, "pll", "vco-mul", 0, 1, pllp);
> +	clk_register_fixed_factor(NULL, "pll48", "vco-mul", 0, 1, pllq);

I'm struggling to marry this up to the clock tree diagram for the 
F4-series (and there's no patch description to help me).

I can see the value of naming the "/M" pre-division separately (and 
agree that its hard to find it a good name for this clock in the 
datasheet). However I am struggling to work out why we'd want to rename 
the vco output.

For me the names for the multiplies clock within each pll emerges fairly 
cleanly from the datasheet (PLL -> vco, PLLI2S -> vcoi2s, PLLSAI -> 
vcosai). What does the '-mul' add?


Daniel.
