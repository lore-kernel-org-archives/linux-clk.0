Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACF3546CC
	for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787477899; cv=none; b=IUnMaOVdwP7QX7VsJGGDilp3va8wgUity+PWuSLk5XvBnMjnpCmy4Q3etvsKZU+zAhcMHD+ukB6BBuMzuUCZA/b4yk9Z5RBbIsfgo4x9HPQ1ghCRnJ3fWE2Y+m//m7BPXc8qWesBMmO9PRdxXFAZRww4QMwJCM4rEvyKhhcarmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787477899; c=relaxed/simple;
	bh=ObcVHcgZbvmzY9HmarPLj9EKYfWmKErrmlW+vBjPd5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rsw+iWXbcAvvtuU/cP9AN2OB+zd6IyEjoxxSePJ47KAl+DcBOtwogTB52omEaiSmFLVy2IFSjzsoeGm4eaEhD7k9FEjslznFfK6PbUTOJVB8VbS3jAeaAlFSbYbDT7ZWGkOUPVaoxUm8lsG9t4nX2sfXEPXGZ9hDJmGFm7eZ0JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sc3Og1hG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sc3Og1hG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461D41F01558
	for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787477897;
	bh=J9RvZrBIdEyhXTZKOsLAel+chPCFREQL34KQiCjJBoc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Sc3Og1hGUgph5/jhNJr52g0TZnkxUukiEKw0o3mxMlFiNWvzeS25zKRqajwUxf0Kv
	 g/KGWp/BPiQjL5GVQNQCtDOW1kQPQ/pdUIXj0+H+pIn00//8yZq5LvwEhe+5zmnnnV
	 vEcXxOt7pi5p7fAUKmLgSmSrivcZH4MNHCEHGBe6jlWx1gQf31Q9zbh+dFo3/rHL9E
	 2WRuNijrvXrTAkUK982olL96U4GHKJflhCXeP8U17ILz9yn8Hz5uwuJCbjpbC1iC4i
	 nKwAIoEAeS+Yt8FNVWzRkAuH2J3qjDQvwHeLZJc0E1AYNzGZyUysiixZA3Q47qo47A
	 10AeAw5K/g5bw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39f927721f2so16773431fa.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Aug 2026 02:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpuB00KuK2kcRsQbARoiDcVgm4a4FifA5TwuTej8VFHRnNK2YbaNJmZfM/hnKtOQ3aCxPnf9pgFMR0=@vger.kernel.org
X-Gm-Message-State: AFuF++kejjEVuXGMDjQ64g1zPNz9a+HpQim6i2G62FgYRQJGJ6ANcDVs
	Xgfb9lIMc1pW+WJF1A4bH6+pODTx/wcEqbieR8S0rxXu26ZQ4cX+HEP/GSGx0Vtt2p5kXG9QMIy
	892oa9MiiO3iRt/i3ZjhaUWPcvyUKD8w=
X-Received: by 2002:a05:651c:1442:b0:3a1:660f:1350 with SMTP id
 38308e7fff4ca-3a1aec49305mr48641171fa.14.1787477895444; Sun, 23 Aug 2026
 02:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-4-974d188cbe0c@pigmoral.tech>
In-Reply-To: <20260711-a733-clk-v2-4-974d188cbe0c@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 23 Aug 2026 17:38:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v65KKifCUYUxnZ5Vm=XNqNdiNC1i+U9mgX2djtPkwvtN2g@mail.gmail.com>
X-Gm-Features: AcwNN1UTLEsKUosntgBh7NOvOvGIMKcXp1q9YUSzig1E8HC9fcenC9Vi6iz9ITA
Message-ID: <CAGb2v65KKifCUYUxnZ5Vm=XNqNdiNC1i+U9mgX2djtPkwvtN2g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] clk: sunxi-ng: a733: Add PLL clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(trimmed recipient list a bit)

On Sat, Jul 11, 2026 at 4:12=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add PLL clock support for the main CCU of the Allwinner A733 SoC. The
> structure is mostly similar to the sun55i, with the addition of a
> PLL_REF clock that normalizes the hardware-detected DCXO/hosc frequency
> (19.2MHz, 24MHz, or 26MHz) into a consistent 24MHz reference for all
> subsequent PLLs.
>
> The behaviors of PLL_AUDIO0 and PLL_AUDIO1 are ported from the vendor
> driver. Specifically, PLL_AUDIO0 is configured with SDM parameters to
> provide a 22.5792MHz * 4 output, while PLL_AUDIO1 is integrated into
> the main CCU without using SDM.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/Kconfig           |   5 +
>  drivers/clk/sunxi-ng/Makefile          |   2 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 539 +++++++++++++++++++++++++++=
++++++
>  3 files changed, 546 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 202e793dc754..cffa83056934 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
>         default ARCH_SUNXI
>         depends on ARM64 || COMPILE_TEST
>
> +config SUN60I_A733_CCU
> +       tristate "Support for the Allwinner A733 CCU"
> +       default ARCH_SUNXI
> +       depends on ARM64 || COMPILE_TEST
> +
>  config SUN60I_A733_R_CCU
>         tristate "Support for the Allwinner A733 PRCM CCU"
>         default ARCH_SUNXI
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e
> index d3702bdb7a23..3a39eb9287da 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SUN50I_H616_CCU) +=3D sun50i-h616-ccu.o
>  obj-$(CONFIG_SUN55I_A523_CCU)  +=3D sun55i-a523-ccu.o
>  obj-$(CONFIG_SUN55I_A523_MCU_CCU)      +=3D sun55i-a523-mcu-ccu.o
>  obj-$(CONFIG_SUN55I_A523_R_CCU)        +=3D sun55i-a523-r-ccu.o
> +obj-$(CONFIG_SUN60I_A733_CCU)  +=3D sun60i-a733-ccu.o
>  obj-$(CONFIG_SUN60I_A733_R_CCU)        +=3D sun60i-a733-r-ccu.o
>  obj-$(CONFIG_SUN4I_A10_CCU)    +=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)                +=3D sun5i-ccu.o
> @@ -65,6 +66,7 @@ sun50i-h616-ccu-y             +=3D ccu-sun50i-h616.o
>  sun55i-a523-ccu-y              +=3D ccu-sun55i-a523.o
>  sun55i-a523-mcu-ccu-y          +=3D ccu-sun55i-a523-mcu.o
>  sun55i-a523-r-ccu-y            +=3D ccu-sun55i-a523-r.o
> +sun60i-a733-ccu-y              +=3D ccu-sun60i-a733.o
>  sun60i-a733-r-ccu-y            +=3D ccu-sun60i-a733-r.o
>  sun4i-a10-ccu-y                        +=3D ccu-sun4i-a10.o
>  sun5i-ccu-y                    +=3D ccu-sun5i.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> new file mode 100644
> index 000000000000..f80db6ab1a98
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> @@ -0,0 +1,539 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 rengaomin@allwinnertech.com
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + * Based on the A523 CCU driver:
> + *   Copyright (C) 2023-2024 Arm Ltd.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/sun60i-a733-ccu.h>
> +#include <dt-bindings/reset/sun60i-a733-ccu.h>
> +
> +#include "../clk.h"

What do you need this for?

> +
> +#include "ccu_common.h"
> +
> +#include "ccu_div.h"
> +#include "ccu_mult.h"
> +#include "ccu_nkmp.h"
> +#include "ccu_nm.h"
> +
> +/*
> + * The DCXO oscillator, the root of most of the clock tree, which may be
> + * 19.2MHz, 24MHz, or 26MHz.
> + */
> +static const struct clk_parent_data hosc[] =3D {
> +       { .fw_name =3D "hosc" }
> +};
> +
> +/***********************************************************************=
***
> + *                              PLLs                                    =
  *
> + ***********************************************************************=
***/
> +
> +/*
> + * Undocumented, taken from the vendor kernel.
> + * PLL_REF normalizes the DCXO frequency to a 24MHz reference for downst=
ream
> + * PLLs.
> + */
> +#define SUN60I_A733_PLL_REF_REG                0x000
> +static struct ccu_nkmp pll_ref_clk =3D {
> +       .enable         =3D BIT(27),
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT(8, 8),
> +       .m              =3D _SUNXI_CCU_DIV(16, 7), /* output divider */
> +       .p              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_REF_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("pll-ref", h=
osc,
> +                                                          &ccu_nkmp_ops,
> +                                                          CLK_SET_RATE_G=
ATE),
> +       },
> +};
> +
> +/*
> + * Most clock-defining macros expect an *array* of parent clocks, even i=
f
> + * they do not contain a muxer to select between different parents.
> + * The macros ending in just _HW take a simple clock pointer, but then c=
reate
> + * a single-entry array out of that. The macros using _HWS take such an
> + * array (even when it is a single entry one), this avoids having those
> + * helper arrays created inside *every* clock definition.
> + * This means for every clock that is referenced more than once it is
> + * useful to create such a dummy array and use _HWS.
> + */
> +static const struct clk_hw *pll_ref_hws[] =3D {
> +       &pll_ref_clk.common.hw
> +};
> +
> +#define SUN60I_A733_PLL_DDR_REG                0x020
> +static struct ccu_nkmp pll_ddr_clk =3D {
> +       .enable         =3D BIT(27),
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(20, 3), /* output divider */
> +       .p              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_DDR_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-ddr", pll=
_ref_hws,
> +                                                        &ccu_nkmp_ops,
> +                                                        CLK_SET_RATE_GAT=
E |
> +                                                        CLK_IS_CRITICAL)=
,
> +       },
> +};
> +
> +/*
> + * There is no actual clock output with that frequency (2.4 GHz), instea=
d it
> + * has multiple outputs with adjustable dividers from that base frequenc=
y.
> + * Model them separately as divider clocks based on that parent here.
> + */
> +#define SUN60I_A733_PLL_PERIPH0_REG    0x0a0
> +static struct ccu_nm pll_periph0_4x_clk =3D {
> +       .enable         =3D BIT(25) | BIT(26) | BIT(27),

The gate helper sort of expects this to be just one bit. And the three
bits here are for the three individual outputs (2x, 800M, 480M). I think
you should move the bits to the individual outputs, and use BIT(31) here
instead (or just leave out the enable bit for this one).

> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_PERIPH0_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-periph0-4=
x",
> +                                                        pll_ref_hws, &cc=
u_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_periph0_4x_hws[] =3D {
> +       &pll_periph0_4x_clk.common.hw
> +};
> +
> +static SUNXI_CCU_M_HWS(pll_periph0_2x_clk, "pll-periph0-2x", pll_periph0=
_4x_hws,
> +                      SUN60I_A733_PLL_PERIPH0_REG, 20, 3, 0);
> +static const struct clk_hw *pll_periph0_2x_hws[] =3D {
> +       &pll_periph0_2x_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS(pll_periph0_800M_clk, "pll-periph0-800M", pll_per=
iph0_4x_hws,
> +                      SUN60I_A733_PLL_PERIPH0_REG, 16, 3, 0);
> +static SUNXI_CCU_M_HWS(pll_periph0_480M_clk, "pll-periph0-480M", pll_per=
iph0_4x_hws,
> +                      SUN60I_A733_PLL_PERIPH0_REG, 2, 3, 0);
> +static const struct clk_hw *pll_periph0_480M_hws[] =3D {
> +       &pll_periph0_480M_clk.common.hw
> +};
> +static CLK_FIXED_FACTOR_HWS(pll_periph0_600M_clk, "pll-periph0-600M",
> +                           pll_periph0_2x_hws, 2, 1, 0);
> +static CLK_FIXED_FACTOR_HWS(pll_periph0_400M_clk, "pll-periph0-400M",
> +                           pll_periph0_2x_hws, 3, 1, 0);
> +static CLK_FIXED_FACTOR_HWS(pll_periph0_300M_clk, "pll-periph0-300M",
> +                           pll_periph0_2x_hws, 4, 1, 0);

Technically this is divided from the 600M one.

> +static CLK_FIXED_FACTOR_HWS(pll_periph0_200M_clk, "pll-periph0-200M",
> +                           pll_periph0_2x_hws, 6, 1, 0);

This one from the 400M one.

> +static CLK_FIXED_FACTOR_HWS(pll_periph0_150M_clk, "pll-periph0-150M",
> +                           pll_periph0_2x_hws, 8, 1, 0);

This one from the 300M one.

The same comments apply to PLL periph1 as well.


[...]

> +#define SUN60I_A733_PLL_VIDEO0_REG     0x120
> +static struct ccu_nm pll_video0_12x_clk =3D {
> +       .enable         =3D BIT(26) | BIT(27),

Same thing as peri0. The gates are for the individual outputs. They should
be modeled as such. Also applies to the other video PLLs.

[...]

> +/*
> + * PLL_AUDIO0 has a m1 divider in addition to the usual N, M factors.
> + * Since we only need some fixed frequency from this PLL (22.5792MHz x 4=
),
> + * ignore the divider and force it to 1 (encoded as 0), in the probe fun=
ction
> + * below.
> + * The M factor must be an even number to produce a 50% duty cycle outpu=
t.
> + */
> +#define SUN60I_A733_PLL_AUDIO0_REG     0x260
> +static struct ccu_sdm_setting pll_audio0_sdm_table[] =3D {
> +       { .rate =3D 90316800, .pattern =3D 0xa002872b, .m =3D 20, .n =3D =
75 }, /* 22.5792 * 4 */
> +};
> +
> +static struct ccu_nm pll_audio0_4x_clk =3D {
> +       .enable         =3D BIT(27),
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(16, 7),
> +       .sdm            =3D _SUNXI_CCU_SDM_DUAL_PAT(pll_audio0_sdm_table,=
 0,
> +                                                 0x268, BIT(31),
> +                                                 0x26c, BIT(27) | BIT(31=
)),

Ideally we should call this the "new fractional" mode. But that's probably
a different subject.

> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_AUDIO0_REG,
> +               .features       =3D CCU_FEATURE_SIGMA_DELTA_MOD,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-audio0-4x=
", pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +#define SUN60I_A733_PLL_AUDIO1_REG     0x280
> +static struct ccu_nm pll_audio1_clk =3D {
> +       .enable         =3D BIT(27),
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_AUDIO1_REG,

You should still fill in the CCU_FEATURE_SIGMA_DELTA_MOD flag and .sdm fiel=
d.
Even though you aren't using it here, it could have been left on somehow,
and if the kernel doesn't know about it, it can't turn it off, and then
the clock coming out of it won't be correct.

> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-audio1", =
pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_audio1_hws[] =3D {
> +       &pll_audio1_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS(pll_audio1_div2_clk, "pll-audio1-div2", pll_audio=
1_hws,
> +                      SUN60I_A733_PLL_AUDIO1_REG, 20, 3, 0);
> +static SUNXI_CCU_M_HWS(pll_audio1_div5_clk, "pll-audio1-div5", pll_audio=
1_hws,
> +                      SUN60I_A733_PLL_AUDIO1_REG, 16, 3, 0);

Perhaps these should be made fixed? Otherwise the names don't apply correct=
ly.

> +
> +#define SUN60I_A733_PLL_NPU_REG                0x2a0
> +static struct ccu_nkmp pll_npu_clk =3D {
> +       .enable         =3D BIT(27),
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(20, 3), /* output divider */
> +       .p              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_NPU_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-npu", pll=
_ref_hws,
> +                                                        &ccu_nkmp_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +#define SUN60I_A733_PLL_DE_REG         0x2e0
> +static struct ccu_nm pll_de_12x_clk =3D {
> +       .enable         =3D BIT(26) | BIT(27),

Same as before. These are gates for the individual outputs. Please move the=
m
there.

> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_DE_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-de-12x", =
pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_de_hws[] =3D {
> +       &pll_de_12x_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS(pll_de_4x_clk, "pll-de-4x", pll_de_hws,
> +                      SUN60I_A733_PLL_DE_REG, 20, 3, 0);
> +static SUNXI_CCU_M_HWS(pll_de_3x_clk, "pll-de-3x", pll_de_hws,
> +                      SUN60I_A733_PLL_DE_REG, 16, 3, 0);

Should we make the values fixed or the divider read-only?

> +
> +/*
> + * Contains all clocks that are controlled by a hardware register. They
> + * have a (sunxi) .common member, which needs to be initialised by the c=
ommon
> + * sunxi CCU code, to be filled with the MMIO base address and the share=
d lock.
> + */
> +static struct ccu_common *sun60i_a733_ccu_clks[] =3D {
> +       &pll_ref_clk.common,
> +       &pll_ddr_clk.common,
> +       &pll_periph0_4x_clk.common,
> +       &pll_periph0_2x_clk.common,
> +       &pll_periph0_800M_clk.common,
> +       &pll_periph0_480M_clk.common,
> +       &pll_periph1_4x_clk.common,
> +       &pll_periph1_2x_clk.common,
> +       &pll_periph1_800M_clk.common,
> +       &pll_periph1_480M_clk.common,
> +       &pll_gpu0_clk.common,
> +       &pll_video0_12x_clk.common,
> +       &pll_video0_4x_clk.common,
> +       &pll_video0_3x_clk.common,
> +       &pll_video1_12x_clk.common,
> +       &pll_video1_4x_clk.common,
> +       &pll_video1_3x_clk.common,
> +       &pll_video2_12x_clk.common,
> +       &pll_video2_4x_clk.common,
> +       &pll_video2_3x_clk.common,
> +       &pll_ve0_clk.common,
> +       &pll_ve1_clk.common,
> +       &pll_audio0_4x_clk.common,
> +       &pll_audio1_clk.common,
> +       &pll_audio1_div2_clk.common,
> +       &pll_audio1_div5_clk.common,
> +       &pll_npu_clk.common,
> +       &pll_de_12x_clk.common,
> +       &pll_de_4x_clk.common,
> +       &pll_de_3x_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sun60i_a733_hw_clks =3D {
> +       .hws    =3D {
> +               [CLK_PLL_REF]           =3D &pll_ref_clk.common.hw,
> +               [CLK_PLL_DDR]           =3D &pll_ddr_clk.common.hw,
> +               [CLK_PLL_PERIPH0_4X]    =3D &pll_periph0_4x_clk.common.hw=
,
> +               [CLK_PLL_PERIPH0_2X]    =3D &pll_periph0_2x_clk.common.hw=
,
> +               [CLK_PLL_PERIPH0_800M]  =3D &pll_periph0_800M_clk.common.=
hw,
> +               [CLK_PLL_PERIPH0_480M]  =3D &pll_periph0_480M_clk.common.=
hw,
> +               [CLK_PLL_PERIPH0_600M]  =3D &pll_periph0_600M_clk.hw,
> +               [CLK_PLL_PERIPH0_400M]  =3D &pll_periph0_400M_clk.hw,
> +               [CLK_PLL_PERIPH0_300M]  =3D &pll_periph0_300M_clk.hw,
> +               [CLK_PLL_PERIPH0_200M]  =3D &pll_periph0_200M_clk.hw,
> +               [CLK_PLL_PERIPH0_160M]  =3D &pll_periph0_160M_clk.hw,
> +               [CLK_PLL_PERIPH0_150M]  =3D &pll_periph0_150M_clk.hw,
> +               [CLK_PLL_PERIPH1_4X]    =3D &pll_periph1_4x_clk.common.hw=
,
> +               [CLK_PLL_PERIPH1_2X]    =3D &pll_periph1_2x_clk.common.hw=
,
> +               [CLK_PLL_PERIPH1_800M]  =3D &pll_periph1_800M_clk.common.=
hw,
> +               [CLK_PLL_PERIPH1_480M]  =3D &pll_periph1_480M_clk.common.=
hw,
> +               [CLK_PLL_PERIPH1_600M]  =3D &pll_periph1_600M_clk.hw,
> +               [CLK_PLL_PERIPH1_400M]  =3D &pll_periph1_400M_clk.hw,
> +               [CLK_PLL_PERIPH1_300M]  =3D &pll_periph1_300M_clk.hw,
> +               [CLK_PLL_PERIPH1_200M]  =3D &pll_periph1_200M_clk.hw,
> +               [CLK_PLL_PERIPH1_160M]  =3D &pll_periph1_160M_clk.hw,
> +               [CLK_PLL_PERIPH1_150M]  =3D &pll_periph1_150M_clk.hw,
> +               [CLK_PLL_GPU0]          =3D &pll_gpu0_clk.common.hw,
> +               [CLK_PLL_VIDEO0_12X]    =3D &pll_video0_12x_clk.common.hw=
,
> +               [CLK_PLL_VIDEO0_4X]     =3D &pll_video0_4x_clk.common.hw,
> +               [CLK_PLL_VIDEO0_3X]     =3D &pll_video0_3x_clk.common.hw,
> +               [CLK_PLL_VIDEO1_12X]    =3D &pll_video1_12x_clk.common.hw=
,
> +               [CLK_PLL_VIDEO1_4X]     =3D &pll_video1_4x_clk.common.hw,
> +               [CLK_PLL_VIDEO1_3X]     =3D &pll_video1_3x_clk.common.hw,
> +               [CLK_PLL_VIDEO2_12X]    =3D &pll_video2_12x_clk.common.hw=
,
> +               [CLK_PLL_VIDEO2_4X]     =3D &pll_video2_4x_clk.common.hw,
> +               [CLK_PLL_VIDEO2_3X]     =3D &pll_video2_3x_clk.common.hw,
> +               [CLK_PLL_VE0]           =3D &pll_ve0_clk.common.hw,
> +               [CLK_PLL_VE1]           =3D &pll_ve1_clk.common.hw,
> +               [CLK_PLL_AUDIO0_4X]     =3D &pll_audio0_4x_clk.common.hw,
> +               [CLK_PLL_AUDIO1]        =3D &pll_audio1_clk.common.hw,
> +               [CLK_PLL_AUDIO1_DIV2]   =3D &pll_audio1_div2_clk.common.h=
w,
> +               [CLK_PLL_AUDIO1_DIV5]   =3D &pll_audio1_div5_clk.common.h=
w,
> +               [CLK_PLL_NPU]           =3D &pll_npu_clk.common.hw,
> +               [CLK_PLL_DE_12X]        =3D &pll_de_12x_clk.common.hw,
> +               [CLK_PLL_DE_4X]         =3D &pll_de_4x_clk.common.hw,
> +               [CLK_PLL_DE_3X]         =3D &pll_de_3x_clk.common.hw,
> +       },
> +       .num    =3D CLK_FANOUT3 + 1,
> +};
> +
> +static const struct sunxi_ccu_desc sun60i_a733_ccu_desc =3D {
> +       .ccu_clks       =3D sun60i_a733_ccu_clks,
> +       .num_ccu_clks   =3D ARRAY_SIZE(sun60i_a733_ccu_clks),
> +
> +       .hw_clks        =3D &sun60i_a733_hw_clks,
> +};
> +
> +static const u32 pll_regs[] =3D {
> +       SUN60I_A733_PLL_REF_REG,
> +       SUN60I_A733_PLL_DDR_REG,
> +       SUN60I_A733_PLL_PERIPH0_REG,
> +       SUN60I_A733_PLL_PERIPH1_REG,
> +       SUN60I_A733_PLL_GPU_REG,
> +       SUN60I_A733_PLL_VIDEO0_REG,
> +       SUN60I_A733_PLL_VIDEO1_REG,
> +       SUN60I_A733_PLL_VIDEO2_REG,
> +       SUN60I_A733_PLL_VE0_REG,
> +       SUN60I_A733_PLL_VE1_REG,
> +       SUN60I_A733_PLL_AUDIO0_REG,
> +       SUN60I_A733_PLL_AUDIO1_REG,
> +       SUN60I_A733_PLL_NPU_REG,
> +       SUN60I_A733_PLL_DE_REG,
> +};
> +
> +static int sun60i_a733_ccu_probe(struct platform_device *pdev)
> +{
> +       void __iomem *reg;
> +       u32 val;
> +       int i, ret;
> +
> +       reg =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(reg))
> +               return PTR_ERR(reg);
> +
> +       /*
> +        * The PLL clock code does not model all bits, for instance it do=
es
> +        * not support a separate enable and gate bit. We present the
> +        * gate bit(27) as the enable bit, but then have to set the
> +        * PLL Enable, LDO Enable, and Lock Enable bits on all PLLs here.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> +               val =3D readl(reg + pll_regs[i]);
> +               val |=3D BIT(31) | BIT(30) | BIT(29);
> +               writel(val, reg + pll_regs[i]);
> +       }
> +
> +       /* Enforce m1 =3D 0 for PLL_AUDIO0 */
> +       val =3D readl(reg + SUN60I_A733_PLL_AUDIO0_REG);
> +       val &=3D ~BIT(1);
> +       writel(val, reg + SUN60I_A733_PLL_AUDIO0_REG);

We should also force the divider for all the divN or Nx outputs.


Thanks
ChenYu

> +
> +       ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun60i_a733_ccu_de=
sc);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id sun60i_a733_ccu_ids[] =3D {
> +       { .compatible =3D "allwinner,sun60i-a733-ccu" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver sun60i_a733_ccu_driver =3D {
> +       .probe  =3D sun60i_a733_ccu_probe,
> +       .driver =3D {
> +               .name                   =3D "sun60i-a733-ccu",
> +               .suppress_bind_attrs    =3D true,
> +               .of_match_table         =3D sun60i_a733_ccu_ids,
> +       },
> +};
> +module_platform_driver(sun60i_a733_ccu_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_DESCRIPTION("Support for the Allwinner A733 CCU");
> +MODULE_LICENSE("GPL");
>
> --
> 2.54.0
>
>
