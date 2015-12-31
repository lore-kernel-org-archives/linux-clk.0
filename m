Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1451298058-28910-1-git-send-email-yamada.masahiro@socionext.com>
Cc: "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <1451298058-28910-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20151231013511.21505.59601@quark.deferred.io>
Subject: Re: [PATCH v2,RESEND] clk: uniphier: add clock drivers for UniPhier SoCs
Date: Wed, 30 Dec 2015 17:35:11 -0800
List-ID: <linux-clk.vger.kernel.org>

Hello Yamada-san,

Quoting Masahiro Yamada (2015-12-28 02:20:58)
> diff --git a/drivers/clk/uniphier/Kconfig b/drivers/clk/uniphier/Kconfig
> new file mode 100644
> index 0000000..7606f27
> --- /dev/null
> +++ b/drivers/clk/uniphier/Kconfig
> @@ -0,0 +1,35 @@
> +menuconfig CLK_UNIPHIER
> +       bool "Clock drivers for UniPhier SoCs"
> +       depends on ARCH_UNIPHIER

Might want to make the above line:

	depends on ARCH_UNIPHIER || COMPILE_TEST

> +       depends on OF
> +       default y
> +       help
> +         Supports clock drivers for UniPhier SoCs.

Why menuconfig? Can we make this a non-visible config option selected by
the UniPhier platform?

> +
> +if CLK_UNIPHIER

Please drop the if statement here and have the below options 'depends'
on CLK_UNIPHIER.

> +
> +config CLK_UNIPHIER_PH1_SLD3
> +       bool "Clock driver for UniPhier PH1-sLD3 SoC"
> +       default y

Can you make these drivers into loadable modules? If so you might
consider tristate.

> +
> +config CLK_UNIPHIER_PH1_LD4
> +       bool "Clock driver for UniPhier PH1-LD4 SoC"
> +       default y
> +
> +config CLK_UNIPHIER_PH1_PRO4
> +       bool "Clock driver for UniPhier PH1-Pro4 SoC"
> +       default y
> +
> +config CLK_UNIPHIER_PH1_SLD8
> +       bool "Clock driver for UniPhier PH1-sLD8 SoC"
> +       default y
> +
> +config CLK_UNIPHIER_PH1_PRO5
> +       bool "Clock driver for UniPhier PH1-Pro5 SoC"
> +       default y
> +
> +config CLK_UNIPHIER_PROXSTREAM2
> +       bool "Clock driver for UniPhier ProXstream2/PH1-LD6b SoC"
> +       default y
> +
> +endif
> diff --git a/drivers/clk/uniphier/Makefile b/drivers/clk/uniphier/Makefile
> new file mode 100644
> index 0000000..3be1a17
> --- /dev/null
> +++ b/drivers/clk/uniphier/Makefile
> @@ -0,0 +1,10 @@
> +obj-y +=3D clk-uniphier-core.o
> +obj-y +=3D clk-uniphier-peri.o
> +obj-y +=3D clk-uniphier-mio.o
> +
> +obj-$(CONFIG_CLK_UNIPHIER_PH1_SLD3)    +=3D clk-ph1-sld3.o
> +obj-$(CONFIG_CLK_UNIPHIER_PH1_LD4)     +=3D clk-ph1-ld4.o
> +obj-$(CONFIG_CLK_UNIPHIER_PH1_PRO4)    +=3D clk-ph1-pro4.o
> +obj-$(CONFIG_CLK_UNIPHIER_PH1_SLD8)    +=3D clk-ph1-sld8.o
> +obj-$(CONFIG_CLK_UNIPHIER_PH1_PRO5)    +=3D clk-ph1-pro5.o
> +obj-$(CONFIG_CLK_UNIPHIER_PROXSTREAM2) +=3D clk-proxstream2.o
> diff --git a/drivers/clk/uniphier/clk-ph1-ld4.c b/drivers/clk/uniphier/cl=
k-ph1-ld4.c
> new file mode 100644
> index 0000000..48d342f
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-ph1-ld4.c
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data ph1_ld4_clk_idata[] __initdata =3D {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 65,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "upll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 288000,
> +                       .div =3D 24576,
> +               },
> +       },
> +       {
> +               .name =3D "a2pll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 24,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "a2pll",
> +                       .mult =3D 1,
> +                       .div =3D 16,
> +               },
> +       },
> +       {
> +               .name =3D "i2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 16,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 32,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D NULL,
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "ehci",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 18,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 1,
> +                       .div =3D 12,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init ph1_ld4_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, ph1_ld4_clk_idata);
> +}
> +CLK_OF_DECLARE(ph1_ld4_clk, "socionext,ph1-ld4-sysctrl", ph1_ld4_clk_ini=
t);

Can you avoid using CLK_OF_DECLARE and instead make this into a
platform_driver? For examples please see drivers/clk/qcom*.c

> diff --git a/drivers/clk/uniphier/clk-ph1-pro4.c b/drivers/clk/uniphier/c=
lk-ph1-pro4.c
> new file mode 100644
> index 0000000..052813a
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-ph1-pro4.c
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data ph1_pro4_clk_idata[] __initdata =3D=
 {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 64,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "upll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 288,
> +                       .div =3D 25,
> +               },
> +       },
> +       {
> +               .name =3D "a2pll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 256,
> +                       .div =3D 125,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "a2pll",
> +                       .mult =3D 1,
> +                       .div =3D 8,
> +               },
> +       },
> +       {
> +               .name =3D "fi2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 32,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 32,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "ehci",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 18,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 1,
> +                       .div =3D 12,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init ph1_pro4_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, ph1_pro4_clk_idata);
> +}
> +CLK_OF_DECLARE(ph1_pro4_clk, "socionext,ph1-pro4-sysctrl", ph1_pro4_clk_=
init);

Ditto.

> diff --git a/drivers/clk/uniphier/clk-ph1-pro5.c b/drivers/clk/uniphier/c=
lk-ph1-pro5.c
> new file mode 100644
> index 0000000..9f782d9
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-ph1-pro5.c
> @@ -0,0 +1,107 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data ph1_pro5_clk_idata[] __initdata =3D=
 {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 120,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "dapll1",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 128,
> +                       .div =3D 125,
> +               },
> +       },
> +       {
> +               .name =3D "dapll2",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 144,
> +                       .div =3D 5,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "dapll2",
> +                       .mult =3D 1,
> +                       .div =3D 8,
> +               },
> +       },
> +       {
> +               .name =3D "fi2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 48,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 48,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D NULL,
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init ph1_pro5_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, ph1_pro5_clk_idata);
> +}
> +CLK_OF_DECLARE(ph1_pro5_clk, "socionext,ph1-pro5-sysctrl", ph1_pro5_clk_=
init);

Ditto.

> diff --git a/drivers/clk/uniphier/clk-ph1-sld3.c b/drivers/clk/uniphier/c=
lk-ph1-sld3.c
> new file mode 100644
> index 0000000..7249a81
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-ph1-sld3.c
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data ph1_sld3_clk_idata[] __initdata =3D=
 {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 65,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "upll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 288000,
> +                       .div =3D 24576,
> +               },
> +       },
> +       {
> +               .name =3D "a2pll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 24,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "a2pll",
> +                       .mult =3D 1,
> +                       .div =3D 16,
> +               },
> +       },
> +       {
> +               .name =3D "i2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 16,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 32,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "ehci",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 18,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 1,
> +                       .div =3D 12,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init ph1_sld3_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, ph1_sld3_clk_idata);
> +}
> +CLK_OF_DECLARE(ph1_sld3_clk, "socionext,ph1-sld3-sysctrl", ph1_sld3_clk_=
init);

Ditto.

> diff --git a/drivers/clk/uniphier/clk-ph1-sld8.c b/drivers/clk/uniphier/c=
lk-ph1-sld8.c
> new file mode 100644
> index 0000000..bfebd38
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-ph1-sld8.c
> @@ -0,0 +1,107 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data ph1_sld8_clk_idata[] __initdata =3D=
 {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 64,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "upll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 288,
> +                       .div =3D 25,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 20,
> +               },
> +       },
> +       {
> +               .name =3D "i2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 16,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 32,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D NULL,
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "ehci",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 18,
> +               .data.factor =3D {
> +                       .parent_name =3D "upll",
> +                       .mult =3D 1,
> +                       .div =3D 12,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init ph1_sld8_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, ph1_sld8_clk_idata);
> +}
> +CLK_OF_DECLARE(ph1_sld8_clk, "socionext,ph1-sld8-sysctrl", ph1_sld8_clk_=
init);

Ditto.

> diff --git a/drivers/clk/uniphier/clk-proxstream2.c b/drivers/clk/uniphie=
r/clk-proxstream2.c
> new file mode 100644
> index 0000000..b3ffedc
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-proxstream2.c
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +
> +#include "clk-uniphier.h"
> +
> +static struct uniphier_clk_init_data proxstream2_clk_idata[] __initdata =
=3D {
> +       {
> +               .name =3D "spll",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D -1,
> +               .data.factor =3D {
> +                       .parent_name =3D UNIPHIER_CLK_EXT "ref",
> +                       .mult =3D 96,
> +                       .div =3D 1,
> +               },
> +       },
> +       {
> +               .name =3D "uart",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 3,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 27,
> +               },
> +       },
> +       {
> +               .name =3D "fi2c",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 4,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 48,
> +               },
> +       },
> +       {
> +               .name =3D "arm-scu",
> +               .type =3D UNIPHIER_CLK_TYPE_FIXED_FACTOR,
> +               .output_index =3D 7,
> +               .data.factor =3D {
> +                       .parent_name =3D "spll",
> +                       .mult =3D 1,
> +                       .div =3D 48,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac-clken",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D -1,
> +               .data.gate =3D {
> +                       .parent_name =3D NULL,
> +                       .reg =3D 0x2104,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       {
> +               .name =3D "stdmac",
> +               .type =3D UNIPHIER_CLK_TYPE_GATE,
> +               .output_index =3D 10,
> +               .data.gate =3D {
> +                       .parent_name =3D "stdmac-clken",
> +                       .reg =3D 0x2000,
> +                       .bit_idx =3D 10,
> +               },
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static void __init proxstream2_clk_init(struct device_node *np)
> +{
> +       uniphier_clk_init(np, proxstream2_clk_idata);
> +}
> +CLK_OF_DECLARE(proxstream2_clk, "socionext,proxstream2-sysctrl",
> +              proxstream2_clk_init);

Ditto.

> diff --git a/drivers/clk/uniphier/clk-uniphier-core.c b/drivers/clk/uniph=
ier/clk-uniphier-core.c
> new file mode 100644
> index 0000000..8680101
> --- /dev/null
> +++ b/drivers/clk/uniphier/clk-uniphier-core.c
> @@ -0,0 +1,151 @@
> +/*
> + * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#define pr_fmt(fmt)            "uniphier-clk: " fmt
> +
> +#include <linux/clk-provider.h>
> +#include <linux/log2.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +
> +#include "clk-uniphier.h"
> +
> +static void __init uniphier_clk_update_parent_name(struct device_node *n=
p,
> +                                                  const char **parent_na=
me)
> +{
> +       const char *new_name;
> +       int index;
> +
> +       if (!parent_name || !*parent_name)
> +               return;
> +
> +       if (strncmp(*parent_name, UNIPHIER_CLK_EXT, strlen(UNIPHIER_CLK_E=
XT)))
> +               return;
> +
> +       index =3D of_property_match_string(np, "clock-names",
> +                               *parent_name + strlen(UNIPHIER_CLK_EXT));
> +       new_name =3D of_clk_get_parent_name(np, index);
> +       if (new_name)
> +               *parent_name =3D new_name;

Where can I find the DT binding description and DTS for this clock
controller? I'm confused why the parent name function is necessary and
I'd like to see the data.

Regards,
Mike
