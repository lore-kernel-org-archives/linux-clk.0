Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43196 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754466AbeCVKri (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Mar 2018 06:47:38 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-4-git-send-email-ilialin@codeaurora.org> <152148100496.242365.3846617702949655708@swboyd.mtv.corp.google.com>
In-Reply-To: <152148100496.242365.3846617702949655708@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 03/10] clk: qcom: Add CPU clock driver for msm8996
Date: Thu, 22 Mar 2018 12:47:30 +0200
Message-ID: <024f01d3c1cb$304eaa60$90ebff20$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 19:37
> To: Ilia Lin <ilialin@codeaurora.org>; =
linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; =
ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 03/10] clk: qcom: Add CPU clock driver for =
msm8996
>=20
> Quoting Ilia Lin (2018-02-14 05:59:45)
> > From: Rajendra Nayak <rnayak@codeaurora.org>
> >
> > Each of the CPU clusters (Power and Perf) on msm8996 are clocked via =
2
> > PLLs, a primary and alternate. There are also
> > 2 Mux'es, a primary and secondary all connected together as shown
> > below
> >
> >                              +-------+
> >               XO             |       |
> >           +------------------>0      |
> >                              |       |
> >                    PLL/2     | SMUX  +----+
> >                      +------->1      |    |
> >                      |       |       |    |
> >                      |       +-------+    |    +-------+
> >                      |                    +---->0      |
> >                      |                         |       |
> > +---------------+    |             +----------->1      | CPU clk
> > |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> > |               +------+-----------+    +------>2 PMUX |
> > +---------------+      |                |      |       |
> >                        |   +------+     |   +-->3      |
> >                        +--^+  ACD +-----+   |  +-------+
> > +---------------+          +------+         |
> > |Alt PLL        |                           |
> > |               +---------------------------+
> > +---------------+         PLL_EARLY
>=20
> Thanks for the diagram. Please also put it at the top of the driver =
file.
>=20
> >
> > The primary PLL is what drives the CPU clk, except for times when we
> > are reprogramming the PLL itself (for rate changes) when we
> > temporarily switch to an alternate PLL. A subsequent patch adds
> > support to switch between primary and alternate PLL during rate
> > changes.
> >
> > The primary PLL operates on a single VCO range, between 600Mhz and
> > 3Ghz. However the CPUs do support OPPs with frequencies between
> 300Mhz
> > and 600Mhz. In order to support running the CPUs at those =
frequencies
> > we end up having to lock the PLL at twice the rate and drive the CPU
> > clk via the PLL/2 output and SMUX.
> >
> > So for frequencies above 600Mhz we follow the following path  =
Primary
> > PLL --> PLL_EARLY --> PMUX(1) --> CPU clk and for frequencies =
between
> > 300Mhz and 600Mhz we follow
>=20
> Capitalize 'h' in units please.
>=20
> >  Primary PLL --> PLL/2 --> SMUX(1) --> PMUX(0) --> CPU clk Support =
for
> > this is added in a subsequent patch as well.
> >
> > ACD stands for Adaptive Clock Distribution and is used to detect
> > voltage droops. We do not add support for ACD as yet.
> > This can be added at a later point as needed.
> >
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >  drivers/clk/qcom/Kconfig        |   8 +
> >  drivers/clk/qcom/Makefile       |   1 +
> >  drivers/clk/qcom/clk-cpu-8996.c | 409
> > ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 418 insertions(+)
> >  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
> >
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig =
index
> > fbf4532..3274877 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -226,3 +226,11 @@ config SPMI_PMIC_CLKDIV
> >           Technologies, Inc. SPMI PMIC. It configures the frequency =
of
> >           clkdiv outputs of the PMIC. These clocks are typically =
wired
> >           through alternate functions on GPIO pins.
> > +
> > +config MSM_APCC_8996
> > +       tristate "MSM8996 CPU Clock Controller"
> > +       depends on COMMON_CLK_QCOM
> > +       help
> > +         Support for the CPU clock controller on msm8996 devices.
> > +         Say Y if you want to support CPU clock scaling using =
CPUfreq
> > +         drivers for dyanmic power management.
>=20
> Sort?
>=20
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 230332c..57b38ba 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -33,6 +33,7 @@ obj-$(CONFIG_MSM_LCC_8960) +=3D lcc-msm8960.o
> >  obj-$(CONFIG_MSM_MMCC_8960) +=3D mmcc-msm8960.o
> >  obj-$(CONFIG_MSM_MMCC_8974) +=3D mmcc-msm8974.o
> >  obj-$(CONFIG_MSM_MMCC_8996) +=3D mmcc-msm8996.o
> > +obj-$(CONFIG_MSM_APCC_8996) +=3D clk-cpu-8996.o
>=20
> This doesn't look sorted.
>=20
> >  obj-$(CONFIG_QCOM_A53PLL) +=3D a53-pll.o
> >  obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) +=3D apcs-msm8916.o
> >  obj-$(CONFIG_QCOM_CLK_RPM) +=3D clk-rpm.o diff --git
> > a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> > new file mode 100644 index 0000000..42489f1
> > --- /dev/null
> > +++ b/drivers/clk/qcom/clk-cpu-8996.c
> > @@ -0,0 +1,409 @@
> > +/*
> > + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License version 2 =
and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
>=20
> Can we get the SPDX tags here please?
>=20
> > +
> > +#include <linux/clk.h>
>=20
> clk-provider.h?
>=20
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "clk-alpha-pll.h"
>=20
> #include "clk-regmap.h"
>=20
> > +
> > +#define VCO(a, b, c) { \
> > +       .val =3D a,\
> > +       .min_freq =3D b,\
> > +       .max_freq =3D c,\
> > +}
>=20
> Can this define go into whatever PLL header file defines the struct?
>=20
> > +
> > +#define DIV_2_INDEX            0
> > +#define PLL_INDEX              1
> > +#define ACD_INDEX              2
> > +#define ALT_INDEX              3
> > +
> > +static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] =3D {
> > +       [PLL_OFF_L_VAL] =3D 0x04,
> > +       [PLL_OFF_ALPHA_VAL] =3D 0x08,
> > +       [PLL_OFF_USER_CTL] =3D 0x10,
> > +       [PLL_OFF_CONFIG_CTL] =3D 0x18,
> > +       [PLL_OFF_CONFIG_CTL_U] =3D 0x1C,
>=20
> Please use lowercase hex throughout. Consistency is key!
>=20
> > +       [PLL_OFF_TEST_CTL] =3D 0x20,
> > +       [PLL_OFF_TEST_CTL_U] =3D 0x24,
> > +       [PLL_OFF_STATUS] =3D 0x28,
> > +};
> > +
> > +static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] =3D {
> > +       [PLL_OFF_L_VAL] =3D 0x04,
> > +       [PLL_OFF_ALPHA_VAL] =3D 0x08,
> > +       [PLL_OFF_ALPHA_VAL_U] =3D 0x0c,
> > +       [PLL_OFF_USER_CTL] =3D 0x10,
> > +       [PLL_OFF_USER_CTL_U] =3D 0x14,
> > +       [PLL_OFF_CONFIG_CTL] =3D 0x18,
> > +       [PLL_OFF_TEST_CTL] =3D 0x20,
> > +       [PLL_OFF_TEST_CTL_U] =3D 0x24,
> > +       [PLL_OFF_STATUS] =3D 0x28,
> > +};
> > +
> > +/* PLLs */
> > +
> > +static const struct alpha_pll_config hfpll_config =3D {
> > +       .l =3D 60,
> > +       .config_ctl_val =3D 0x200d4828,
> > +       .config_ctl_hi_val =3D 0x006,
> > +       .pre_div_mask =3D BIT(12),
> > +       .post_div_mask =3D 0x3 << 8,
> > +       .main_output_mask =3D BIT(0),
> > +       .early_output_mask =3D BIT(3),
> > +};
> > +
> > +static struct clk_alpha_pll perfcl_pll =3D {
> > +       .offset =3D 0x80000,
> > +       .regs =3D prim_pll_regs,
> > +       .flags =3D SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
> > +       .clkr.hw.init =3D &(struct clk_init_data){
> > +               .name =3D "perfcl_pll",
> > +               .parent_names =3D (const char *[]){ "xo" },
> > +               .num_parents =3D 1,
> > +               .ops =3D &clk_alpha_pll_huayra_ops,
> > +       },
> > +};
> > +
> > +static struct clk_alpha_pll pwrcl_pll =3D {
> > +       .offset =3D 0x0,
> > +       .regs =3D prim_pll_regs,
> > +       .flags =3D SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
> > +       .clkr.hw.init =3D &(struct clk_init_data){
> > +               .name =3D "pwrcl_pll",
> > +               .parent_names =3D (const char *[]){ "xo" },
> > +               .num_parents =3D 1,
> > +               .ops =3D &clk_alpha_pll_huayra_ops,
> > +       },
> > +};
> > +
> > +static const struct pll_vco alt_pll_vco_modes[] =3D {
> > +       VCO(3,  250000000,  500000000),
> > +       VCO(2,  500000000,  750000000),
> > +       VCO(1,  750000000, 1000000000),
> > +       VCO(0, 1000000000, 2150400000), };
> > +
> > +static const struct alpha_pll_config altpll_config =3D {
> > +       .l =3D 16,
> > +       .vco_val =3D 0x3 << 20,
> > +       .vco_mask =3D 0x3 << 20,
> > +       .config_ctl_val =3D 0x4001051b,
> > +       .post_div_mask =3D 0x3 << 8,
> > +       .post_div_val =3D 0x1,
> > +       .main_output_mask =3D BIT(0),
> > +       .early_output_mask =3D BIT(3),
> > +};
> > +
> > +static struct clk_alpha_pll perfcl_alt_pll =3D {
> > +       .offset =3D 0x80100,
> > +       .regs =3D alt_pll_regs,
> > +       .vco_table =3D alt_pll_vco_modes,
> > +       .num_vco =3D ARRAY_SIZE(alt_pll_vco_modes),
> > +       .flags =3D SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
> > +       .clkr.hw.init =3D &(struct clk_init_data) {
> > +               .name =3D "perfcl_alt_pll",
> > +               .parent_names =3D (const char *[]){ "xo" },
> > +               .num_parents =3D 1,
> > +               .ops =3D &clk_alpha_pll_hwfsm_ops,
> > +       },
> > +};
> > +
> > +static struct clk_alpha_pll pwrcl_alt_pll =3D {
> > +       .offset =3D 0x100,
> > +       .regs =3D alt_pll_regs,
> > +       .vco_table =3D alt_pll_vco_modes,
> > +       .num_vco =3D ARRAY_SIZE(alt_pll_vco_modes),
> > +       .flags =3D SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
> > +       .clkr.hw.init =3D &(struct clk_init_data) {
> > +               .name =3D "pwrcl_alt_pll",
> > +               .parent_names =3D (const char *[]){ "xo" },
> > +               .num_parents =3D 1,
> > +               .ops =3D &clk_alpha_pll_hwfsm_ops,
> > +       },
> > +};
> > +
> > +/* Mux'es */
> > +
> > +struct clk_cpu_8996_mux {
> > +       u32     reg;
> > +       u32     shift;
>=20
> u8 shift?
>=20
> > +       u32     width;
>=20
> u8 width?
>=20
> > +       struct clk_hw   *pll;
> > +       struct clk_regmap clkr;
> > +};
> > +
> > +static inline
> > +struct clk_cpu_8996_mux *to_clk_cpu_8996_mux_hw(struct clk_hw
> *hw) {
> > +       return container_of(to_clk_regmap(hw), struct
> > +clk_cpu_8996_mux, clkr); }
> > +
> > +static u8 clk_cpu_8996_mux_get_parent(struct clk_hw *hw) {
> > +       unsigned int val;
> > +       struct clk_regmap *clkr =3D to_clk_regmap(hw);
> > +       struct clk_cpu_8996_mux *cpuclk =3D =
to_clk_cpu_8996_mux_hw(hw);
> > +       unsigned int mask =3D GENMASK(cpuclk->width - 1, 0);
> > +
> > +       regmap_read(clkr->regmap, cpuclk->reg, &val);
> > +
> > +       val >>=3D cpuclk->shift;
> > +       val &=3D mask;
> > +
> > +       return val;
>=20
> return val & mask;
>=20
> > +}
> > +
> > +static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index) =
{
> > +       unsigned int val;
>=20
> u32 val?
>=20
> > +       struct clk_regmap *clkr =3D to_clk_regmap(hw);
> > +       struct clk_cpu_8996_mux *cpuclk =3D =
to_clk_cpu_8996_mux_hw(hw);
> > +       unsigned int mask =3D GENMASK(cpuclk->width + cpuclk->shift =
- 1,
> > +                                   cpuclk->shift);
> > +
> > +       val =3D index;
> > +       val <<=3D cpuclk->shift;
> > +
> > +       return regmap_update_bits(clkr->regmap, cpuclk->reg, mask,
> > +val); }
> > +
> > +static int
> > +clk_cpu_8996_mux_determine_rate(struct clk_hw *hw, struct
> > +clk_rate_request *req) {
> > +       struct clk_cpu_8996_mux *cpuclk =3D =
to_clk_cpu_8996_mux_hw(hw);
> > +       struct clk_hw *parent =3D cpuclk->pll;
> > +
> > +       if (!cpuclk->pll)
> > +               return -EINVAL;
>=20
> Does this happen?
>=20
> > +
> > +       req->best_parent_rate =3D clk_hw_round_rate(parent, =
req->rate);
> > +       req->best_parent_hw =3D parent;
>=20
> Is the parent index always the same? Perhaps just call
> clk_hw_get_parent_by_index() then instead of adding a pointer to the
> clk_cpu_8996_mux.
>=20
> > +
> > +       return 0;
> > +}
> > +
> > +const struct clk_ops clk_cpu_8996_mux_ops =3D {
> > +       .set_parent =3D clk_cpu_8996_mux_set_parent,
> > +       .get_parent =3D clk_cpu_8996_mux_get_parent,
> > +       .determine_rate =3D clk_cpu_8996_mux_determine_rate, };
> [...]
> > +
> > +static struct clk_cpu_8996_mux pwrcl_pmux =3D {
> > +       .reg =3D 0x40,
> > +       .shift =3D 0,
> > +       .width =3D 2,
> > +       .pll =3D &pwrcl_pll.clkr.hw,
> > +       .clkr.hw.init =3D &(struct clk_init_data) {
> > +               .name =3D "pwrcl_pmux",
> > +               .parent_names =3D (const char *[]){
> > +                       "pwrcl_smux",
> > +                       "pwrcl_pll",
> > +                       "pwrcl_pll_acd",
> > +                       "pwrcl_alt_pll",
> > +               },
> > +               .num_parents =3D 4,
> > +               .ops =3D &clk_cpu_8996_mux_ops,
> > +               .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> > +       },
> > +};
> > +
> > +static struct clk_cpu_8996_mux perfcl_pmux =3D {
> > +       .reg =3D 0x80040,
> > +       .shift =3D 0,
> > +       .width =3D 2,
> > +       .pll =3D &perfcl_pll.clkr.hw,
> > +       .clkr.hw.init =3D &(struct clk_init_data) {
> > +               .name =3D "perfcl_pmux",
> > +               .parent_names =3D (const char *[]){
> > +                       "perfcl_smux",
> > +                       "perfcl_pll",
> > +                       "perfcl_pll_acd",
> > +                       "perfcl_alt_pll",
> > +               },
> > +               .num_parents =3D 4,
> > +               .ops =3D &clk_cpu_8996_mux_ops,
> > +               .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>=20
> Not sure CLK_IS_CRITICAL is the right mode. Perhaps CLK_IGNORE_UNUSED
> for now? We don't want to force XO to stay on forever here.
>=20
> > +       },
> > +};
> > +
> > +static const struct regmap_config cpu_msm8996_regmap_config =3D {
> > +       .reg_bits               =3D 32,
> > +       .reg_stride             =3D 4,
> > +       .val_bits               =3D 32,
> > +       .max_register           =3D 0x80210,
> > +       .fast_io                =3D true,
> > +       .val_format_endian      =3D REGMAP_ENDIAN_LITTLE,
> > +};
> > +
> > +static const struct of_device_id match_table[] =3D {
>=20
> Move this next to driver structure and give it a more specific name.
>=20
> > +       { .compatible =3D "qcom-msm8996-apcc" },
>=20
> Bad compatible? Should be qcom,msm8996-apcc?
>=20
> > +       {}
> > +};
> > +
> > +struct clk_regmap *clks[] =3D {
> > +       /* PLLs */
> > +       &perfcl_pll.clkr,
> > +       &pwrcl_pll.clkr,
> > +       &perfcl_alt_pll.clkr,
> > +       &pwrcl_alt_pll.clkr,
> > +       /* MUXs */
> > +       &perfcl_smux.clkr,
> > +       &pwrcl_smux.clkr,
> > +       &perfcl_pmux.clkr,
> > +       &pwrcl_pmux.clkr,
>=20
> Please drop useless comments inside this array.
>=20
> > +};
> > +
> > +struct clk_hw_clks {
> > +       unsigned int num;
> > +       struct clk_hw *hws[];
> > +};
>=20
> Please just NULL terminate the list of clk_hw pointers, or keep the =
size
> around instead.
>=20
> > +
> > +static int
> > +qcom_cpu_clk_msm8996_register_clks(struct device *dev, struct
> clk_hw_clks *hws,
> > +                                  struct regmap *regmap) {
> > +       int i, ret;
> > +
> > +       hws->hws[0] =3D clk_hw_register_fixed_factor(dev, =
"perfcl_pll_main",
> > +                                                  "perfcl_pll",
> > +                                                  =
CLK_SET_RATE_PARENT, 1, 2);
> > +       perfcl_smux.pll =3D hws->hws[0];
> > +
> > +       hws->hws[1] =3D clk_hw_register_fixed_factor(dev, =
"pwrcl_pll_main",
> > +                                                  "pwrcl_pll",
> > +                                                  =
CLK_SET_RATE_PARENT, 1, 2);
> > +       pwrcl_smux.pll =3D hws->hws[1];
> > +
> > +       hws->num =3D 2;
>=20
> Maybe just open code the fixed factor clk registration? Then the
> devm_clk_hw_register() function can be used on those static structs to =
make
> removal simpler.

I will have to change the clk_hw_unregister_fixed_rate() as well then, =
right? This will be an API change.

>=20
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(clks); i++) {
> > +               ret =3D devm_clk_register_regmap(dev, clks[i]);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
> > +       clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
> > +       clk_alpha_pll_configure(&perfcl_alt_pll, regmap, =
&altpll_config);
> > +       clk_alpha_pll_configure(&pwrcl_alt_pll, regmap,
> > + &altpll_config);
> > +
> > +       return ret;
> > +}
> > +
> > +static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device
> > +*pdev) {
> > +       int ret;
> > +       void __iomem *base;
> > +       struct resource *res;
> > +       struct regmap *regmap_cpu;
>=20
> Just call it regmap please.
>=20
> > +       struct clk_hw_clks *hws;
> > +       struct clk_hw_onecell_data *data;
> > +       struct device *dev =3D &pdev->dev;
> > +       struct device_node *node =3D dev->of_node;
> > +
> > +       data =3D devm_kzalloc(dev, sizeof(*data) + 2 * sizeof(struct =
clk_hw *),
> > +                           GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       hws =3D devm_kzalloc(dev, sizeof(*hws) + 2 * sizeof(struct =
clk_hw *),
> > +                          GFP_KERNEL);
> > +       if (!hws)
> > +               return -ENOMEM;
> > +
> > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       base =3D devm_ioremap_resource(dev, res);
> > +       if (IS_ERR(base))
> > +               return PTR_ERR(base);
> > +
> > +       regmap_cpu =3D devm_regmap_init_mmio(dev, base,
> > +                                          =
&cpu_msm8996_regmap_config);
> > +       if (IS_ERR(regmap_cpu))
> > +               return PTR_ERR(regmap_cpu);
> > +
> > +       ret =3D qcom_cpu_clk_msm8996_register_clks(dev, hws, =
regmap_cpu);
> > +       if (ret)
> > +               return ret;
> > +
> > +       data->hws[0] =3D &pwrcl_pmux.clkr.hw;
> > +       data->hws[1] =3D &perfcl_pmux.clkr.hw;
> > +
> > +       data->num =3D 2;
> > +
> > +       platform_set_drvdata(pdev, hws);
> > +
> > +       return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> > +data); }
> > +
> > +static int qcom_cpu_clk_msm8996_driver_remove(struct
> platform_device
> > +*pdev) {
> > +       int i;
> > +       struct device *dev =3D &pdev->dev;
> > +       struct clk_hw_clks *hws =3D platform_get_drvdata(pdev);
> > +
> > +       for (i =3D 0; i < hws->num; i++)
> > +               clk_hw_unregister_fixed_rate(hws->hws[i]);
> > +
> > +       of_clk_del_provider(dev->of_node);
>=20
> Use devm_of_clk_add_hw_provider() instead.
>=20
> > +
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver qcom_cpu_clk_msm8996_driver =3D {
> > +       .probe =3D qcom_cpu_clk_msm8996_driver_probe,
> > +       .remove =3D qcom_cpu_clk_msm8996_driver_remove,
> > +       .driver =3D {
> > +               .name =3D "qcom-msm8996-apcc",
> > +               .of_match_table =3D match_table,
> > +       },
> > +};
> > +
> > +module_platform_driver(qcom_cpu_clk_msm8996_driver);
> > +
> > +MODULE_ALIAS("platform:msm8996-apcc");
> > +MODULE_DESCRIPTION("QCOM MSM8996 CPU clock Driver");
>=20
> Not sure why Driver is capitalized and clock is not.

