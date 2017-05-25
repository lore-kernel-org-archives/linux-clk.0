Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Maxime Ripard" <maxime.ripard@free-electrons.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Stephen Boyd" <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1495643669-28221-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, "Angus Ainslie" <angus@akkea.ca>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org
References: <1495643669-28221-1-git-send-email-boris.brezillon@free-electrons.com>
Message-ID: <149573823221.52617.2350903252470015903@resonance>
Subject: Re: [PATCH] clk: sunxi-ng: sun5i: Fix ahb_bist_clk definition
Date: Thu, 25 May 2017 11:50:32 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2017-05-24 09:34:29)
> AHB BIST gate is actually controlled with bit 7.
> =

> This bug was detected while trying to use the NAND controller which is
> using the DMA engine to transfer data to the NAND.
> Since the ahb_bist_clk gate bit conflicts with the ahb_dma_clk gate bit,
> the core was disabling the DMA engine clock as part of its 'disable
> unused clks' procedure, which was causing all DMA transfers to fail after
> this point.
> =

> Fixes: 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver")
> Cc: stable@vger.kernel.org
> Reported-by: Angus Ainslie <angus@akkea.ca>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Patch looks good to me. Did this ever work? I'm trying to figure out if
it should go into -fixes or -next.

Thanks,
Mike

> ---
>  drivers/clk/sunxi-ng/ccu-sun5i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.c b/drivers/clk/sunxi-ng/ccu-=
sun5i.c
> index 5c476f966a72..5372bf8be5e6 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun5i.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun5i.c
> @@ -243,7 +243,7 @@ static SUNXI_CCU_GATE(ahb_ss_clk,   "ahb-ss",       "=
ahb",
>  static SUNXI_CCU_GATE(ahb_dma_clk,     "ahb-dma",      "ahb",
>                       0x060, BIT(6), 0);
>  static SUNXI_CCU_GATE(ahb_bist_clk,    "ahb-bist",     "ahb",
> -                     0x060, BIT(6), 0);
> +                     0x060, BIT(7), 0);
>  static SUNXI_CCU_GATE(ahb_mmc0_clk,    "ahb-mmc0",     "ahb",
>                       0x060, BIT(8), 0);
>  static SUNXI_CCU_GATE(ahb_mmc1_clk,    "ahb-mmc1",     "ahb",
> -- =

> 2.7.4
>=20
