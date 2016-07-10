Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: oxnas: Add hardware dependencies
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20160707091844.196a7930@endymion>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <578216EB.90409@baylibre.com>
Date: Sun, 10 Jul 2016 11:35:39 +0200
MIME-Version: 1.0
In-Reply-To: <20160707091844.196a7930@endymion>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 07/07/2016 09:18 AM, Jean Delvare wrote:
> The clk-oxnas driver is specific to its architecture, so do not
> propose it on other architectures, unless build-testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-4.7-rc6.orig/drivers/clk/Kconfig	2016-07-04 08:01:00.000000000 +0200
> +++ linux-4.7-rc6/drivers/clk/Kconfig	2016-07-07 09:12:17.723329794 +0200
> @@ -203,6 +203,7 @@ config COMMON_CLK_PIC32
>  
>  config COMMON_CLK_OXNAS
>  	bool "Clock driver for the OXNAS SoC Family"
> +	depends on ARCH_OXNAS || COMPILE_TEST
>  	select MFD_SYSCON
>  	---help---
>  	  Support for the OXNAS SoC Family clocks.
> 
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
