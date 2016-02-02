Return-Path: <moinejf@free.fr>
Date: Tue, 2 Feb 2016 11:26:04 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>,
 heiko@sntech.de, Chen-Yu Tsai <wens@csie.org>, Andre Przywara
 <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] clk: sunxi: Remove clk_register_clkdev calls
Message-Id: <20160202112604.447baec98bf89a79542fd240@free.fr>
In-Reply-To: <1454402834-6385-6-git-send-email-maxime.ripard@free-electrons.com>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
	<1454402834-6385-6-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue,  2 Feb 2016 09:47:14 +0100
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> index 578bff0dd251..b38d71cec74c 100644
> --- a/drivers/clk/sunxi/clk-mod0.c
> +++ b/drivers/clk/sunxi/clk-mod0.c
> @@ -15,6 +15,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/clkdev.h>

Why?

>  #include <linux/clk-provider.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>


--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
