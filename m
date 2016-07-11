Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Wan Zongshun <vw@iommu.org>, linux-arm-kernel@lists.infradead.org,
 "Russell King" <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1468135649-19980-5-git-send-email-vw@iommu.org>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 robh@kernel.org, jason@lakedaemon.net, p.zabel@pengutronix.de,
 "Wan Zongshun" <vw@iommu.org>, "Wan Zongshun" <mcuos.com@gmail.com>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-5-git-send-email-vw@iommu.org>
Message-ID: <146827527560.73491.7859004638616123566@resonance>
Subject: Re: [PATCH v2 04/10] clk: add Clock driver for nuc970
Date: Mon, 11 Jul 2016 15:14:35 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Wan Zongshun (2016-07-10 00:27:24)
> diff --git a/drivers/clk/nuc900/clk-apll.c b/drivers/clk/nuc900/clk-apll.c
> new file mode 100644
> index 0000000..a05aec7
> --- /dev/null
> +++ b/drivers/clk/nuc900/clk-apll.c
> @@ -0,0 +1,168 @@
> +/*
> + * Copyright 2016 Wan Zongshun <mcuos.com@gmail.com>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +
> +#include "clk-ccf.h"

Maybe call it clk-nuc.h?

> +static struct clk_ops clk_apll_ops =3D {
> +       .recalc_rate =3D clk_apll_recalc_rate,
> +       .enable =3D clk_apll_enable,
> +       .disable =3D clk_apll_disable,

Can you provide a .is_enabled?

> +static void __init nuc970_clocks_init(struct device_node *np)
> +{
> +       int i, ret;
> +
> +       clkctrl =3D of_iomap(np, 0);
> +       if (!clkctrl)
> +               pr_err("%s: unable to map registers\n", np->full_name);
> +
> +
> +       /* source */
> +       clk[XIN]        =3D nuc970_clk_fixed("xin", 12000000);
> +       clk[XIN32K]     =3D nuc970_clk_fixed("xin32k", 32768);
> +       clk[APLL]       =3D nuc970_clk_apll("apll", "xin", REG_CLK_APLLCO=
N);
> +       clk[UPLL]       =3D nuc970_clk_upll("upll", "xin", REG_CLK_UPLLCO=
N);
> +       clk[XIN128_DIV] =3D nuc970_clk_fixed_factor("xin128_div", "xin", =
1, 128);
> +       clk[SYS_MUX]    =3D nuc970_clk_mux("sys_mux", REG_CLK_DIV0, 3, 2,
> +                                        sys_sel_clks,
> +                                        ARRAY_SIZE(sys_sel_clks));

Instead of executing all of these registration functions, how about
initializing your clock data statically, and then simply calling
clk_hw_register?

For an example see the recently merged drivers/clk/meson/gxbb.c

> +       for (i =3D 0; i < ARRAY_SIZE(clk); i++)
> +               if (IS_ERR(clk[i]))
> +                       pr_err("nuc970 clk %d: register failed with %ld\n=
",
> +                               i, PTR_ERR(clk[i]));

Better to fail quickly, bail out and unwind your clk registration
instead of trying to register everything and then walk the list looking
for failures.

> +
> +       clk_data.clks =3D clk;
> +       clk_data.clk_num =3D ARRAY_SIZE(clk);
> +
> +       ret =3D of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data=
);
> +       if (ret)
> +               pr_err("Failed to register OF clock provider\n");
> +
> +       /* Register clock device */
> +       clk_register_clkdev(clk[TIMER0_GATE], "timer0", NULL);
> +       clk_register_clkdev(clk[TIMER1_GATE], "timer1", NULL);

Again, look at how the gxbb.c driver does this. Why do you need to call
clk_register_clkdev? You're using of_clk_add_provider above, so that
should be enough to perform lookups.

> +       /* enable some important clocks */
> +       clk_prepare_enable(clk_get(NULL, "cpu"));
> +       clk_prepare_enable(clk_get(NULL, "hclk"));
> +       clk_prepare_enable(clk_get(NULL, "sram"));
> +       clk_prepare_enable(clk_get(NULL, "dram"));
> +       clk_prepare_enable(clk_get(NULL, "ddr_hclk"));

You can use the CLK_IS_CRITICAL flag for these clocks if you want. It
would be better to have drivers that claim them and enable them of
course.

> +}
> +
> +CLK_OF_DECLARE(nuc970_clk, "nuvoton,nuc970-clk", nuc970_clocks_init);

Why do you need to use CLK_OF_DECLARE? Please convert this to a
platform_driver and load it at module_init.

Regards,
Mike
