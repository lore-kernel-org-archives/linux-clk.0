Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1533298874-22863-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org,
 Taniya Das <tdas@codeaurora.org>
References: <1533298874-22863-1-git-send-email-tdas@codeaurora.org>
 <1533298874-22863-3-git-send-email-tdas@codeaurora.org>
Message-ID: <153540431524.129321.12826367247850332291@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Mon, 27 Aug 2018 14:11:55 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-08-03 05:21:14)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 2b69cf2..7bd940d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -254,6 +254,15 @@ config SDM_VIDEOCC_845
>           Say Y if you want to support video devices and functionality su=
ch as
>           video encode and decode.
> =

> +config SDM_LPASSCC_845
> +       tristate "SDM845 LPASS Clock Controller"

Spell out the acronym? So "SDM845 Low Power Audio Subsystem (LPASS)
Clock Controller"?

> +       depends on COMMON_CLK_QCOM
> +       select SDM_GCC_845
> +       help
> +         Support for the LPASS clock controller on SDM845 devices.
> +         Say Y if you want to use the LPASS branch clocks of the LPASS c=
lock
> +         controller to reset the LPASS subsystem.
> +
>  config SPMI_PMIC_CLKDIV
>         tristate "SPMI PMIC clkdiv Support"
>         depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 0f694ed..068cf53 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3086,6 +3086,32 @@ enum {
>         },
>  };
> =

> +static struct clk_branch gcc_lpass_q6_axi_clk =3D {
> +       .halt_reg =3D 0x47000,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x47000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_q6_axi_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_lpass_sway_clk =3D {
> +       .halt_reg =3D 0x47008,
> +       .halt_check =3D BRANCH_HALT,
> +       .clkr =3D {
> +               .enable_reg =3D 0x47008,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_lpass_sway_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
>  static struct gdsc pcie_0_gdsc =3D {
>         .gdscr =3D 0x6b004,
>         .pd =3D {
> @@ -3383,6 +3409,8 @@ enum {
>         [GPLL4] =3D &gpll4.clkr,
>         [GCC_CPUSS_DVM_BUS_CLK] =3D &gcc_cpuss_dvm_bus_clk.clkr,
>         [GCC_CPUSS_GNOC_CLK] =3D &gcc_cpuss_gnoc_clk.clkr,
> +       [GCC_LPASS_Q6_AXI_CLK] =3D NULL,
> +       [GCC_LPASS_SWAY_CLK] =3D NULL,
>  };
> =

>  static const struct qcom_reset_map gcc_sdm845_resets[] =3D {
> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc=
-sdm845.c
> new file mode 100644
> index 0000000..6f387f9
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
[...]
> +
> +/* CLK_OFF would not toggle until LPASS is not out of reset */

Can we change the branch ops to check for out of reset or not? Do the
clks even work when LPASS isn't out of reset? Why would the clk APIs
even be called on here if it hadn't taken LPASS out of reset?

> +static struct clk_branch lpass_qdsp6ss_sleep_clk =3D {
> +       .halt_reg =3D 0x3c,
> +       .halt_check =3D BRANCH_HALT_SKIP,
> +       .clkr =3D {
> +               .enable_reg =3D 0x3c,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_qdsp6ss_sleep_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct regmap_config lpass_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .fast_io        =3D true,
> +};
> +
> +static struct clk_regmap *lpass_cc_sdm845_clocks[] =3D {
> +       [LPASS_AUDIO_WRAPPER_AON_CLK] =3D &lpass_audio_wrapper_aon_clk.cl=
kr,
> +       [LPASS_Q6SS_AHBM_AON_CLK] =3D &lpass_q6ss_ahbm_aon_clk.clkr,
> +       [LPASS_Q6SS_AHBS_AON_CLK] =3D &lpass_q6ss_ahbs_aon_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc lpass_cc_sdm845_desc =3D {
> +       .config =3D &lpass_regmap_config,
> +       .clks =3D lpass_cc_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_cc_sdm845_clocks),
> +};
> +
> +static struct clk_regmap *lpass_qdsp6ss_sdm845_clocks[] =3D {
> +       [LPASS_QDSP6SS_XO_CLK] =3D &lpass_qdsp6ss_xo_clk.clkr,
> +       [LPASS_QDSP6SS_SLEEP_CLK] =3D &lpass_qdsp6ss_sleep_clk.clkr,
> +       [LPASS_QDSP6SS_CORE_CLK] =3D &lpass_qdsp6ss_core_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc =3D {
> +       .config =3D &lpass_regmap_config,
> +       .clks =3D lpass_qdsp6ss_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
> +};
> +
> +static int lpass_clocks_sdm845_probe(struct platform_device *pdev, int i=
ndex,
> +                                    const struct qcom_cc_desc *desc)
> +{
> +       struct regmap *regmap;
> +       struct resource *res;
> +       void __iomem *base;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, index);
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base))
> +               return -ENOMEM;

return PTR_ERR(base)?

> +
> +       regmap =3D devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return qcom_cc_really_probe(pdev, desc, regmap);
> +}
> +
> +/* LPASS CC clock controller */
> +static const struct of_device_id lpass_cc_sdm845_match_table[] =3D {
> +       { .compatible =3D "qcom,sdm845-lpasscc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);
> +
> +static int lpass_cc_sdm845_probe(struct platform_device *pdev)
> +{
> +       const struct qcom_cc_desc *desc;
> +       int ret;
> +
> +       lpass_regmap_config.name =3D "lpass_cc";
> +       desc =3D &lpass_cc_sdm845_desc;
> +
> +       ret =3D lpass_clocks_sdm845_probe(pdev, 0, desc);
> +       if (ret)
> +               return ret;
> +
> +       lpass_regmap_config.name =3D "lpass_qdsp6ss";
> +       desc =3D &lpass_qdsp6ss_sdm845_desc;
> +
> +       return lpass_clocks_sdm845_probe(pdev, 1, desc);
> +}
> +
> +static struct platform_driver lpass_cc_sdm845_driver =3D {
> +       .probe          =3D lpass_cc_sdm845_probe,
> +       .driver         =3D {
> +               .name   =3D "sdm845-lpasscc",
> +               .of_match_table =3D lpass_cc_sdm845_match_table,
> +       },
> +};
> +
> +static int __init lpass_cc_sdm845_init(void)
> +{
> +       return platform_driver_register(&lpass_cc_sdm845_driver);
> +}
> +subsys_initcall(lpass_cc_sdm845_init);

Also add module_exit() path.

> +
> +MODULE_LICENSE("GPL v2");
