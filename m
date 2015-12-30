Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: James Liao <jamesjj.liao@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1451456865-44139-2-git-send-email-jamesjj.liao@mediatek.com>
Cc: "Sascha Hauer" <kernel@pengutronix.de>, "Daniel Kurtz" <djkurtz@chromium.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 "James Liao" <jamesjj.liao@mediatek.com>,
 "Shunli Wang" <shunli.wang@mediatek.com>
References: <1451456865-44139-1-git-send-email-jamesjj.liao@mediatek.com>
 <1451456865-44139-2-git-send-email-jamesjj.liao@mediatek.com>
Message-ID: <20151230231959.19557.55186@quark.deferred.io>
Subject: Re: [PATCH 1/5] clk: mediatek: Refine the makefile to support multiple clock
 drivers
Date: Wed, 30 Dec 2015 15:19:59 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting James Liao (2015-12-29 22:27:41)
> Add a Kconfig to define clock configuration for each SoC, and
> modify the Makefile to build drivers that only selected in config.
> =

> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>

Looks good to me.

Regards,
Mike

> ---
>  drivers/clk/Kconfig           |  1 +
>  drivers/clk/mediatek/Kconfig  | 23 +++++++++++++++++++++++
>  drivers/clk/mediatek/Makefile |  6 +++---
>  3 files changed, 27 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/clk/mediatek/Kconfig
> =

> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c3e3a02..b7a37dc 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -198,3 +198,4 @@ source "drivers/clk/mvebu/Kconfig"
>  =

>  source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/tegra/Kconfig"
> +source "drivers/clk/mediatek/Kconfig"
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> new file mode 100644
> index 0000000..dc224e6
> --- /dev/null
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -0,0 +1,23 @@
> +#
> +# MediaTek SoC drivers
> +#
> +config COMMON_CLK_MEDIATEK
> +       bool
> +       ---help---
> +         Mediatek SoCs' clock support.
> +
> +config COMMON_CLK_MT8135
> +       bool "Clock driver for Mediatek MT8135"
> +       depends on COMMON_CLK
> +       select COMMON_CLK_MEDIATEK
> +       default ARCH_MEDIATEK
> +       ---help---
> +         This driver supports Mediatek MT8135 clocks.
> +
> +config COMMON_CLK_MT8173
> +       bool "Clock driver for Mediatek MT8173"
> +       depends on COMMON_CLK
> +       select COMMON_CLK_MEDIATEK
> +       default ARCH_MEDIATEK
> +       ---help---
> +         This driver supports Mediatek MT8173 clocks.
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 95fdfac..32e7222 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -1,4 +1,4 @@
> -obj-y +=3D clk-mtk.o clk-pll.o clk-gate.o clk-apmixed.o
> +obj-$(CONFIG_COMMON_CLK_MEDIATEK) +=3D clk-mtk.o clk-pll.o clk-gate.o cl=
k-apmixed.o
>  obj-$(CONFIG_RESET_CONTROLLER) +=3D reset.o
> -obj-y +=3D clk-mt8135.o
> -obj-y +=3D clk-mt8173.o
> +obj-$(CONFIG_COMMON_CLK_MT8135) +=3D clk-mt8135.o
> +obj-$(CONFIG_COMMON_CLK_MT8173) +=3D clk-mt8173.o
> -- =

> 1.9.1
>=20
