Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add lpass clock controller driver for
 SDM845
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <1533298874-22863-1-git-send-email-tdas@codeaurora.org>
 <1533298874-22863-3-git-send-email-tdas@codeaurora.org>
 <153540431524.129321.12826367247850332291@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <15984aab-d815-56bb-af9c-7be9cfd9a103@codeaurora.org>
Date: Wed, 5 Sep 2018 23:56:10 +0530
MIME-Version: 1.0
In-Reply-To: <153540431524.129321.12826367247850332291@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Thanks for the review comments.

On 8/28/2018 2:41 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-08-03 05:21:14)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 2b69cf2..7bd940d 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -254,6 +254,15 @@ config SDM_VIDEOCC_845
>>            Say Y if you want to support video devices and functionality such as
>>            video encode and decode.
>>
>> +config SDM_LPASSCC_845
>> +       tristate "SDM845 LPASS Clock Controller"
> 
> Spell out the acronym? So "SDM845 Low Power Audio Subsystem (LPASS)
> Clock Controller"?
> 

Sure will update in the next patch.

>> +       depends on COMMON_CLK_QCOM
>> +       select SDM_GCC_845
>> +       help
>> +         Support for the LPASS clock controller on SDM845 devices.
>> +         Say Y if you want to use the LPASS branch clocks of the LPASS clock
>> +         controller to reset the LPASS subsystem.
>> +
>>   config SPMI_PMIC_CLKDIV
>>          tristate "SPMI PMIC clkdiv Support"
>>          depends on (COMMON_CLK_QCOM && SPMI) || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
>> index 0f694ed..068cf53 100644
>> --- a/drivers/clk/qcom/gcc-sdm845.c
>> +++ b/drivers/clk/qcom/gcc-sdm845.c
>> @@ -3086,6 +3086,32 @@ enum {
>>          },
>>   };
>>
>> +static struct clk_branch gcc_lpass_q6_axi_clk = {
>> +       .halt_reg = 0x47000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x47000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_lpass_q6_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_lpass_sway_clk = {
>> +       .halt_reg = 0x47008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x47008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_lpass_sway_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>>   static struct gdsc pcie_0_gdsc = {
>>          .gdscr = 0x6b004,
>>          .pd = {
>> @@ -3383,6 +3409,8 @@ enum {
>>          [GPLL4] = &gpll4.clkr,
>>          [GCC_CPUSS_DVM_BUS_CLK] = &gcc_cpuss_dvm_bus_clk.clkr,
>>          [GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
>> +       [GCC_LPASS_Q6_AXI_CLK] = NULL,
>> +       [GCC_LPASS_SWAY_CLK] = NULL,
>>   };
>>
>>   static const struct qcom_reset_map gcc_sdm845_resets[] = {
>> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
>> new file mode 100644
>> index 0000000..6f387f9
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
> [...]
>> +
>> +/* CLK_OFF would not toggle until LPASS is not out of reset */
> 
> Can we change the branch ops to check for out of reset or not? Do the
> clks even work when LPASS isn't out of reset? Why would the clk APIs
> even be called on here if it hadn't taken LPASS out of reset?
> 

The branches need to be turned ON before the LPASS is out of reset.
But we would not be able to check the CLK_ENABLE bit.

>> +static struct clk_branch lpass_qdsp6ss_sleep_clk = {
>> +       .halt_reg = 0x3c,
>> +       .halt_check = BRANCH_HALT_SKIP,
>> +       .clkr = {
>> +               .enable_reg = 0x3c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "lpass_qdsp6ss_sleep_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct regmap_config lpass_regmap_config = {
>> +       .reg_bits       = 32,
>> +       .reg_stride     = 4,
>> +       .val_bits       = 32,
>> +       .fast_io        = true,
>> +};
>> +
>> +static struct clk_regmap *lpass_cc_sdm845_clocks[] = {
>> +       [LPASS_AUDIO_WRAPPER_AON_CLK] = &lpass_audio_wrapper_aon_clk.clkr,
>> +       [LPASS_Q6SS_AHBM_AON_CLK] = &lpass_q6ss_ahbm_aon_clk.clkr,
>> +       [LPASS_Q6SS_AHBS_AON_CLK] = &lpass_q6ss_ahbs_aon_clk.clkr,
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_cc_sdm845_desc = {
>> +       .config = &lpass_regmap_config,
>> +       .clks = lpass_cc_sdm845_clocks,
>> +       .num_clks = ARRAY_SIZE(lpass_cc_sdm845_clocks),
>> +};
>> +
>> +static struct clk_regmap *lpass_qdsp6ss_sdm845_clocks[] = {
>> +       [LPASS_QDSP6SS_XO_CLK] = &lpass_qdsp6ss_xo_clk.clkr,
>> +       [LPASS_QDSP6SS_SLEEP_CLK] = &lpass_qdsp6ss_sleep_clk.clkr,
>> +       [LPASS_QDSP6SS_CORE_CLK] = &lpass_qdsp6ss_core_clk.clkr,
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc = {
>> +       .config = &lpass_regmap_config,
>> +       .clks = lpass_qdsp6ss_sdm845_clocks,
>> +       .num_clks = ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
>> +};
>> +
>> +static int lpass_clocks_sdm845_probe(struct platform_device *pdev, int index,
>> +                                    const struct qcom_cc_desc *desc)
>> +{
>> +       struct regmap *regmap;
>> +       struct resource *res;
>> +       void __iomem *base;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, index);
>> +       base = devm_ioremap_resource(&pdev->dev, res);
>> +       if (IS_ERR(base))
>> +               return -ENOMEM;
> 
> return PTR_ERR(base)?
> 

Sure will update it.

>> +
>> +       regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       return qcom_cc_really_probe(pdev, desc, regmap);
>> +}
>> +
>> +/* LPASS CC clock controller */
>> +static const struct of_device_id lpass_cc_sdm845_match_table[] = {
>> +       { .compatible = "qcom,sdm845-lpasscc" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);
>> +
>> +static int lpass_cc_sdm845_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       int ret;
>> +
>> +       lpass_regmap_config.name = "lpass_cc";
>> +       desc = &lpass_cc_sdm845_desc;
>> +
>> +       ret = lpass_clocks_sdm845_probe(pdev, 0, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       lpass_regmap_config.name = "lpass_qdsp6ss";
>> +       desc = &lpass_qdsp6ss_sdm845_desc;
>> +
>> +       return lpass_clocks_sdm845_probe(pdev, 1, desc);
>> +}
>> +
>> +static struct platform_driver lpass_cc_sdm845_driver = {
>> +       .probe          = lpass_cc_sdm845_probe,
>> +       .driver         = {
>> +               .name   = "sdm845-lpasscc",
>> +               .of_match_table = lpass_cc_sdm845_match_table,
>> +       },
>> +};
>> +
>> +static int __init lpass_cc_sdm845_init(void)
>> +{
>> +       return platform_driver_register(&lpass_cc_sdm845_driver);
>> +}
>> +subsys_initcall(lpass_cc_sdm845_init);
> 
> Also add module_exit() path.
> 

Will update in the next patch.

>> +
>> +MODULE_LICENSE("GPL v2");

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
