Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk:gcc-msm8916: add missing mss_q6_bimc_axi clock
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sboyd@codeaurora.org
References: <1449934749-26223-1-git-send-email-srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <56701278.90306@linaro.org>
Date: Tue, 15 Dec 2015 15:15:36 +0200
MIME-Version: 1.0
In-Reply-To: <1449934749-26223-1-git-send-email-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Srini,
Thanks for the patch.

On 12/12/2015 05:39 PM, Srinivas Kandagatla wrote:
> This clock is required for loading the qdsp firmware.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8916.c               | 18 ++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8916.h |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index e3bf09d..1ec5a27 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -2590,6 +2590,23 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
> +	.halt_reg = 0x49004,
> +	.clkr = {
> +		.enable_reg = 0x49004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "gcc_mss_q6_bimc_axi_clk",
> +			.parent_names = (const char *[]){
> +				"pcnoc_bfdcd_clk_src",

Looks like the parent should be bimc_ddr_clk_src.
Otherwise looks fine to me.

BR,
Georgi
