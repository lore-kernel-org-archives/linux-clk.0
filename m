Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: Jean Delvare <jdelvare@suse.de>, linux-clk@vger.kernel.org,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Neil Armstrong" <narmstrong@baylibre.com>
References: <20160707091844.196a7930@endymion>
In-Reply-To: <20160707091844.196a7930@endymion>
Message-ID: <146836271590.73491.14582071169637437157@resonance>
Subject: Re: [PATCH] clk: oxnas: Add hardware dependencies
Date: Tue, 12 Jul 2016 15:31:55 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jean Delvare (2016-07-07 00:18:44)
> The clk-oxnas driver is specific to its architecture, so do not
> propose it on other architectures, unless build-testing.
> =

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>

Applied.

Regards,
Mike

> ---
>  drivers/clk/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> =

> --- linux-4.7-rc6.orig/drivers/clk/Kconfig      2016-07-04 08:01:00.00000=
0000 +0200
> +++ linux-4.7-rc6/drivers/clk/Kconfig   2016-07-07 09:12:17.723329794 +02=
00
> @@ -203,6 +203,7 @@ config COMMON_CLK_PIC32
>  =

>  config COMMON_CLK_OXNAS
>         bool "Clock driver for the OXNAS SoC Family"
> +       depends on ARCH_OXNAS || COMPILE_TEST
>         select MFD_SYSCON
>         ---help---
>           Support for the OXNAS SoC Family clocks.
> =

> =

> -- =

> Jean Delvare
> SUSE L3 Support
