Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: rockchip: release io resource when rk3036_clk_init failed
Date: Sat, 12 Mar 2016 17:48:26 +0100
Message-ID: <8447746.miDbEHA5rR@diego>
In-Reply-To: <1457799925-3142-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com> <1457799925-3142-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hi Shawn,

Am Sonntag, 13. M=E4rz 2016, 00:25:25 schrieb Shawn Lin:
> We should call iounmap to relase reg_base since it's not going
> to be used any more.
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

I see that change for rk3036, rk3188(+rk3066) and rk3368.
But it looks like rk3228 and rk3288 should also get that, or am I just=20=

overlooking something?

Also, I think we can fold these changes into one patch, as it's the com=
pletely=20
same addition for all clock-drivers.


Heiko

> ---
>=20
>  drivers/clk/rockchip/clk-rk3036.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3036.c
> b/drivers/clk/rockchip/clk-rk3036.c index 8c683cc..284c36f 100644
> --- a/drivers/clk/rockchip/clk-rk3036.c
> +++ b/drivers/clk/rockchip/clk-rk3036.c
> @@ -453,6 +453,7 @@ static void __init rk3036_clk_init(struct device_=
node
> *np) ctx =3D rockchip_clk_init(np, reg_base, CLK_NR_CLKS);
>  =09if (IS_ERR(ctx)) {
>  =09=09pr_err("%s: rockchip clk init failed\n", __func__);
> +=09=09iounmap(reg_base);
>  =09=09return;
>  =09}
