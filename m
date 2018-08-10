Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add qspi (Quad SPI) clocks for sdm845
To: Douglas Anderson <dianders@chromium.org>, sboyd@kernel.org,
 andy.gross@linaro.org
Cc: girishm@codeaurora.org, linux-arm-msm@vger.kernel.org,
 anischal@codeaurora.org, bjorn.andersson@linaro.org, grahamr@codeaurora.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 David Brown <david.brown@linaro.org>
References: <20180724174513.174018-1-dianders@chromium.org>
 <20180724174513.174018-3-dianders@chromium.org>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <7f2ac80d-d4b8-ce46-0f1f-8e62f8868a61@codeaurora.org>
Date: Fri, 10 Aug 2018 13:39:21 +0530
MIME-Version: 1.0
In-Reply-To: <20180724174513.174018-3-dianders@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 7/24/2018 11:15 PM, Douglas Anderson wrote:
> Add both the interface and core clock.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> (am from https://lore.kernel.org/patchwork/patch/966680/mbox)
> 
> ---
> 
> Changes in v3:
> - Removed gcc_parent_names_9 which I had left in (doh!).
> 
> Changes in v2:
> - Only 19.2, 100, 150, and 300 MHz now.
> - All clocks come from MAIN rather than EVEN.
> - Use parent map 0 instead of new parent map 9.
> 
>   drivers/clk/qcom/gcc-sdm845.c | 56 +++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 0f694ed4238a..fc1c6658ad82 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -358,6 +358,28 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src = {
>   	},
>   };
>   
> +static const struct freq_tbl ftbl_gcc_qspi_core_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> +	F(150000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_qspi_core_clk_src = {
> +	.cmd_rcgr = 0x4b008,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_0,
> +	.freq_tbl = ftbl_gcc_qspi_core_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gcc_qspi_core_clk_src",
> +		.parent_names = gcc_parent_names_0,
> +		.num_parents = 4,
> +		.ops = &clk_rcg2_floor_ops,
> +	},
> +};
> +
>   static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
>   	F(9600000, P_BI_TCXO, 2, 0, 0),
>   	F(19200000, P_BI_TCXO, 1, 0, 0),
> @@ -1935,6 +1957,37 @@ static struct clk_branch gcc_qmip_video_ahb_clk = {
>   	},
>   };
>   
> +static struct clk_branch gcc_qspi_cnoc_periph_ahb_clk = {
> +	.halt_reg = 0x4b000,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4b000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_qspi_cnoc_periph_ahb_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch gcc_qspi_core_clk = {
> +	.halt_reg = 0x4b004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x4b004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_qspi_core_clk",
> +			.parent_names = (const char *[]){
> +				"gcc_qspi_core_clk_src",
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>   static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
>   	.halt_reg = 0x17030,
>   	.halt_check = BRANCH_HALT_VOTED,
> @@ -3383,6 +3436,9 @@ static struct clk_regmap *gcc_sdm845_clocks[] = {
>   	[GPLL4] = &gpll4.clkr,
>   	[GCC_CPUSS_DVM_BUS_CLK] = &gcc_cpuss_dvm_bus_clk.clkr,
>   	[GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
> +	[GCC_QSPI_CORE_CLK_SRC] = &gcc_qspi_core_clk_src.clkr,
> +	[GCC_QSPI_CORE_CLK] = &gcc_qspi_core_clk.clkr,
> +	[GCC_QSPI_CNOC_PERIPH_AHB_CLK] = &gcc_qspi_cnoc_periph_ahb_clk.clkr,
>   };
>   
>   static const struct qcom_reset_map gcc_sdm845_resets[] = {
> 

Reviewed-by: Taniya Das <tdas@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
