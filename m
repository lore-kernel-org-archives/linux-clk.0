Return-Path: <linux@mniewoehner.de>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH] clk: rockchip: Add pclk_peri to critical clocks on RK3066/RK3188
From: Michael Niewoehner <linux@mniewoehner.de>
In-Reply-To: <1440180627-4566-1-git-send-email-romain.perier@gmail.com>
Date: Sat, 22 Aug 2015 17:05:22 +0200
Cc: Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org,
 mturquette@baylibre.com,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <4BB6E60D-332B-4C12-9AF2-ACEEF157BEA0@mniewoehner.de>
References: <1440180627-4566-1-git-send-email-romain.perier@gmail.com>
To: Romain Perier <romain.perier@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


Am 21.08.2015 um 20:10 schrieb Romain Perier <romain.perier@gmail.com>:

> Clocks for bank GPIO3 and GPIO4 are supplied by pclk_peri. These =
clocks need to
> stay on, otherwise pinctrl hangs the system when the driver is probed.
>=20
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
Tested-by: Michael Niewoehner <linux@mniewoehner.de>
> ---
> drivers/clk/rockchip/clk-rk3188.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3188.c =
b/drivers/clk/rockchip/clk-rk3188.c
> index f63a642..596be81 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> +++ b/drivers/clk/rockchip/clk-rk3188.c
> @@ -717,6 +717,7 @@ static const char *const rk3188_critical_clocks[] =
__initconst =3D {
> 	"aclk_peri",
> 	"hclk_peri",
> 	"pclk_cpu",
> +	"pclk_peri",
> };
>=20
> static void __init rk3188_common_clk_init(struct device_node *np)
> --=20
> 2.1.4
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
