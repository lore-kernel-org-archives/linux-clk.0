Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>, ulf.hansson@linaro.org,
 sboyd@codeaurora.org, tgih.jun@samsung.com, jh80.chung@samsung.com
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1443622064-14362-3-git-send-email-heiko@sntech.de>
Cc: linux-mmc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dianders@chromium.org, amstan@chromium.org,
 "Heiko Stuebner" <heiko@sntech.de>
References: <1443622064-14362-1-git-send-email-heiko@sntech.de>
 <1443622064-14362-3-git-send-email-heiko@sntech.de>
Message-ID: <20151022120400.20687.61566@quantum>
Subject: Re: [PATCH v2 2/8] clk: rockchip: Make calculations use rounding
Date: Thu, 22 Oct 2015 05:04:00 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Heiko Stuebner (2015-09-30 07:07:38)
> From: Douglas Anderson <dianders@chromium.org>
> =

> Let's use DIV_ROUND_CLOSEST for rounding, not just truncating
> division.  This lets us get closer to the right rate.
> =

> Before this:
>   set_phase(86) delay_nums=3D26 reg[0xf000420c]=3D0x468 actual_degrees=3D=
83
>   set_phase(89) delay_nums=3D27 reg[0xf000420c]=3D0x46c actual_degrees=3D=
86
> =

> After this:
>   set_phase(86) delay_nums=3D27 reg[0xf000420c]=3D0x46c actual_degrees=3D=
86
>   set_phase(89) delay_nums=3D28 reg[0xf000420c]=3D0x470 actual_degrees=3D=
90
> =

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Looks good to me. What tree do you want this to go through?

Regards,
Mike

> ---
>  drivers/clk/rockchip/clk-mmc-phase.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/=
clk-mmc-phase.c
> index a797d86..bc24e5a 100644
> --- a/drivers/clk/rockchip/clk-mmc-phase.c
> +++ b/drivers/clk/rockchip/clk-mmc-phase.c
> @@ -69,7 +69,7 @@ static int rockchip_mmc_get_phase(struct clk_hw *hw)
>  =

>                 delay_num =3D (raw_value & ROCKCHIP_MMC_DELAYNUM_MASK);
>                 delay_num >>=3D ROCKCHIP_MMC_DELAYNUM_OFFSET;
> -               degrees +=3D delay_num * factor / 10000;
> +               degrees +=3D DIV_ROUND_CLOSEST(delay_num * factor, 10000);
>         }
>  =

>         return degrees % 360;
> @@ -82,7 +82,7 @@ static int rockchip_mmc_set_phase(struct clk_hw *hw, in=
t degrees)
>         u8 nineties, remainder;
>         u8 delay_num;
>         u32 raw_value;
> -       u64 delay;
> +       u32 delay;
>  =

>         nineties =3D degrees / 90;
>         remainder =3D (degrees % 90);
> @@ -110,12 +110,13 @@ static int rockchip_mmc_set_phase(struct clk_hw *hw=
, int degrees)
>          * Convert to delay; do a little extra work to make sure we
>          * don't overflow 32-bit / 64-bit numbers.
>          */
> -       delay =3D PSECS_PER_SEC;
> +       delay =3D 10000000; /* PSECS_PER_SEC / 10000 / 10 */
>         delay *=3D remainder;
> -       do_div(delay, 10000);
> -       do_div(delay, (rate / 1000) * 36 * ROCKCHIP_MMC_DELAY_ELEMENT_PSE=
C);
> +       delay =3D DIV_ROUND_CLOSEST(delay,
> +                       (rate / 1000) * 36 *
> +                               (ROCKCHIP_MMC_DELAY_ELEMENT_PSEC / 10));
>  =

> -       delay_num =3D (u8) min(delay, 255ULL);
> +       delay_num =3D (u8) min_t(u32, delay, 255);
>  =

>         raw_value =3D delay_num ? ROCKCHIP_MMC_DELAY_SEL : 0;
>         raw_value |=3D delay_num << ROCKCHIP_MMC_DELAYNUM_OFFSET;
> -- =

> 2.5.1
>=20
