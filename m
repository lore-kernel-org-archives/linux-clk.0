Return-Path: <grahamr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Wed, 18 Jul 2018 17:19:13 -0700
From: grahamr@codeaurora.org
To: Douglas Anderson <dianders@chromium.org>
Cc: sboyd@kernel.org, andy.gross@linaro.org, tdas@codeaurora.org,
 girishm@codeaurora.org, anischal@codeaurora.org, bjorn.andersson@linaro.org,
 Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-clk-owner@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] clk: qcom: Add qspi (Quad SPI) clocks for sdm845
In-Reply-To: <20180718180431.48580-3-dianders@chromium.org>
References: <20180718180431.48580-1-dianders@chromium.org>
 <20180718180431.48580-3-dianders@chromium.org>
Message-ID: <e661adac8af569454ebd4a710bfc58bf@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-18 11:04, Douglas Anderson wrote:
> Add both the interface and core clock.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/clk/qcom/gcc-sdm845.c | 73 +++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c 
> b/drivers/clk/qcom/gcc-sdm845.c
> index 0f694ed4238a..2ee96f9bc217 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -162,6 +162,20 @@ static const char * const gcc_parent_names_10[] = 
> {
>  	"core_bi_pll_test_se",
>  };
> 
> +static const struct parent_map gcc_parent_map_9[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_GPLL0_OUT_MAIN, 1 },
> +	{ P_GPLL0_OUT_EVEN, 6 },
> +	{ P_SLEEP_CLK, 7 },
> +};
> +
> +static const char * const gcc_parent_names_9[] = {
> +	"bi_tcxo",
> +	"gpll0",
> +	"gpll0_out_even",
> +	"core_pi_sleep_clk",
> +};
> +
>  static struct clk_alpha_pll gpll0 = {
>  	.offset = 0x0,
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> @@ -358,6 +372,31 @@ static struct clk_rcg2 gcc_pcie_phy_refgen_clk_src 
> = {
>  	},
>  };
> 
> +static const struct freq_tbl ftbl_gcc_qspi_core_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
> +	F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
> +	F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
> +	F(150000000, P_GPLL0_OUT_EVEN, 2, 0, 0),
> +	F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
> +	F(400000000, P_GPLL0_OUT_MAIN, 1.5, 0, 0),
> +	{ }
> +};

Doug,

400 MHz is beyond the maximum frequency for the QSPI core, which is 300 
MHz.  The complete frequency table with required voltage corner is:
MinSVS@19.2
LowSVS@75
SVS@150
Nominal@300
You can run at intermediate frequencies less than 300 if required by the 
QSPI driver - i.e. the other entries you have are fine.
FYI, Qualcomm does not support QSPI internally on SDM845 which is why 
this code does not exist.

Regards,

Graham Roff


> +
> +static struct clk_rcg2 gcc_qspi_core_clk_src = {
> +	.cmd_rcgr = 0x4b008,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = gcc_parent_map_9,
> +	.freq_tbl = ftbl_gcc_qspi_core_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gcc_qspi_core_clk_src",
> +		.parent_names = gcc_parent_names_9,
> +		.num_parents = 4,
> +		.ops = &clk_rcg2_floor_ops,
> +	},
> +};
> +
>  static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
>  	F(9600000, P_BI_TCXO, 2, 0, 0),
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
> @@ -1935,6 +1974,37 @@ static struct clk_branch gcc_qmip_video_ahb_clk 
> = {
>  	},
>  };
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
>  static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
>  	.halt_reg = 0x17030,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -3383,6 +3453,9 @@ static struct clk_regmap *gcc_sdm845_clocks[] = {
>  	[GPLL4] = &gpll4.clkr,
>  	[GCC_CPUSS_DVM_BUS_CLK] = &gcc_cpuss_dvm_bus_clk.clkr,
>  	[GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
> +	[GCC_QSPI_CORE_CLK_SRC] = &gcc_qspi_core_clk_src.clkr,
> +	[GCC_QSPI_CORE_CLK] = &gcc_qspi_core_clk.clkr,
> +	[GCC_QSPI_CNOC_PERIPH_AHB_CLK] = &gcc_qspi_cnoc_periph_ahb_clk.clkr,
>  };
> 
>  static const struct qcom_reset_map gcc_sdm845_resets[] = {
