Return-Path: <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: sunxi-ng: Add hardware dependency
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org
References: <20160908173651.769b6829@endymion>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
From: Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <178b95fe-e479-0274-0f81-1284a7eb4a81@codeaurora.org>
Date: Thu, 8 Sep 2016 12:32:07 -0700
MIME-Version: 1.0
In-Reply-To: <20160908173651.769b6829@endymion>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 09/08/2016 08:36 AM, Jean Delvare wrote:
> The sunxi-ng clock driver is useless for other architectures.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-4.8-rc5.orig/drivers/clk/sunxi-ng/Kconfig	2016-09-04 23:31:46.000000000 +0200
> +++ linux-4.8-rc5/drivers/clk/sunxi-ng/Kconfig	2016-09-08 17:29:46.179508283 +0200
> @@ -1,6 +1,6 @@
>  config SUNXI_CCU
>  	bool "Clock support for Allwinner SoCs"
> -	default ARCH_SUNXI
> +	depends on ARCH_SUNXI || COMPILE_TEST

Please leave the default there and just add the depends and compile test
part.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
