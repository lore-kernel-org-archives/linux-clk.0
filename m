Return-Path: <boris.brezillon@bootlin.com>
Date: Tue, 3 Jul 2018 09:21:07 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo
 Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 <linux-clk@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: meson: add sub EMMC clock dt-bindings IDs
Message-ID: <20180703092107.51497a8f@bbrezillon>
In-Reply-To: <20180703145716.31860-3-yixun.lan@amlogic.com>
References: <20180703145716.31860-1-yixun.lan@amlogic.com>
	<20180703145716.31860-3-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue, 3 Jul 2018 14:57:15 +0000
Yixun Lan <yixun.lan@amlogic.com> wrote:

> Add two clock bindings IDs which provided by the EMMC clock controller,
> These two clocks will be used by EMMC or NAND driver.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/emmc-clkc.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/emmc-clkc.h
> 
> diff --git a/include/dt-bindings/clock/emmc-clkc.h b/include/dt-bindings/clock/emmc-clkc.h
> new file mode 100644
> index 000000000000..d9972c400e58
> --- /dev/null
> +++ b/include/dt-bindings/clock/emmc-clkc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson EMMC sub clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __EMMC_CLKC_H
> +#define __EMMC_CLKC_H
> +
> +#define CLKID_EMMC_C_MUX				0

Looks like the MUX clk is the parent of the DIV one, and I guess the clk
driver is able to select the best parent+div pair for a requested rate.
Do you really need to expose the MUX to users?

> +#define CLKID_EMMC_C_DIV				1
> +
> +#endif
