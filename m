Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: davinci: fix a typo (which leads to build failures)
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org
References: <20180625172550.17379-1-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <28163c26-152b-9188-9c13-7a906809e0f1@lechnology.com>
Date: Mon, 25 Jun 2018 18:18:28 -0500
MIME-Version: 1.0
In-Reply-To: <20180625172550.17379-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/25/2018 12:25 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This should have been DM365, not DM356.
> 
> Fixes: 4eff0bebf4ed5 ("clk: davinci: Fix link errors when not all SoCs are enabled")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/clk/davinci/psc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/davinci/psc.h b/drivers/clk/davinci/psc.h
> index 6a42529d31a9..cc5614567a70 100644
> --- a/drivers/clk/davinci/psc.h
> +++ b/drivers/clk/davinci/psc.h
> @@ -107,7 +107,7 @@ extern const struct davinci_psc_init_data of_da850_psc1_init_data;
>   #ifdef CONFIG_ARCH_DAVINCI_DM355
>   extern const struct davinci_psc_init_data dm355_psc_init_data;
>   #endif
> -#ifdef CONFIG_ARCH_DAVINCI_DM356
> +#ifdef CONFIG_ARCH_DAVINCI_DM365
>   extern const struct davinci_psc_init_data dm365_psc_init_data;
>   #endif
>   #ifdef CONFIG_ARCH_DAVINCI_DM644x
> 


Applied to https://github.com/dlech/linux/tree/clk-davinci-fixes

Thanks.
