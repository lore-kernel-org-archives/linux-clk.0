Return-Path: <paul.gortmaker@gmail.com>
MIME-Version: 1.0
Sender: paul.gortmaker@gmail.com
In-Reply-To: <1469832362-13947-1-git-send-email-zajec5@gmail.com>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com> <1469832362-13947-1-git-send-email-zajec5@gmail.com>
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sun, 31 Jul 2016 15:38:05 -0400
Message-ID: <CAP=VYLoMQwD8N2_YthDQjaWyF5VgEkehd0acrXV5BT0UKxh_aQ@mail.gmail.com>
Subject: Re: [PATCH V2] clk: bcm: Add driver for Northstar ILP clock
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>,
	Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 29, 2016 at 6:45 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This clock is present on cheaper Northstar devices like BCM53573 or
> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
> to calculate clock rate and allows using it in a generic (clk_*) way.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> ---
>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  26 ++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-ns-ilp.c                       | 147 +++++++++++++++=
++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp.t=
xt
>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/Do=
cumentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> new file mode 100644
> index 0000000..2c862a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> @@ -0,0 +1,26 @@
> +Broadcom Northstar ILP clock
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock on Broadcom Northstar devices using
> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated on
> +runtime.
> +
> +Required properties:
> +- compatible: "brcm,ns-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now
> +- clocks: has to reference an ALP clock
> +- #clock-cells: should be <0>
> +
> +Example:
> +
> +ilp: ilp {
> +       compatible =3D "brcm,ns-ilp";
> +       reg =3D <0x18012000 0x1000>;
> +       reg-names =3D "pmu";
> +       clocks =3D <&alp>;
> +       #clock-cells =3D <0>;
> +};
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 1d79bd2..1389379 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_COMMON_CLK_IPROC)        +=3D clk-ns2.o
>  obj-$(CONFIG_ARCH_BCM_CYGNUS)  +=3D clk-cygnus.o
>  obj-$(CONFIG_ARCH_BCM_NSP)     +=3D clk-nsp.o
>  obj-$(CONFIG_ARCH_BCM_5301X)   +=3D clk-nsp.o
> +obj-$(CONFIG_ARCH_BCM_5301X)   +=3D clk-ns-ilp.o
> diff --git a/drivers/clk/bcm/clk-ns-ilp.c b/drivers/clk/bcm/clk-ns-ilp.c
> new file mode 100644
> index 0000000..0337313
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-ns-ilp.c
> @@ -0,0 +1,147 @@
> +/*
> + * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

I didn't see anything using modular content from the above header file, so
I think you can remove it.

Paul.
--

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +
> +#define PMU_XTAL_FREQ_RATIO                    0x66c
> +#define  XTAL_ALP_PER_4ILP                     0x00001fff
> +#define  XTAL_CTL_EN                           0x80000000
> +#define PMU_SLOW_CLK_PERIOD                    0x6dc
> +
