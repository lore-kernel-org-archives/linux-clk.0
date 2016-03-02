Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] clk: qcom: msm8960: Fix ce3_src register offset
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1456882203-31932-1-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <56D6B3FC.4040709@linaro.org>
Date: Wed, 2 Mar 2016 09:35:56 +0000
MIME-Version: 1.0
In-Reply-To: <1456882203-31932-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 02/03/16 01:30, Stephen Boyd wrote:
> The offset seems to have been copied from the sata clk. Fix it so
> that enabling the crypto engine source clk works.
>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: 5f775498bdc4 ("clk: qcom: Fully support apq8064 global clock control")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Good find :-)

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/clk/qcom/gcc-msm8960.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
> index 63ecd97f3793..0a0c1f533249 100644
> --- a/drivers/clk/qcom/gcc-msm8960.c
> +++ b/drivers/clk/qcom/gcc-msm8960.c
> @@ -2753,7 +2753,7 @@ static struct clk_rcg ce3_src = {
>   	},
>   	.freq_tbl = clk_tbl_ce3,
>   	.clkr = {
> -		.enable_reg = 0x2c08,
> +		.enable_reg = 0x36c0,
>   		.enable_mask = BIT(7),
>   		.hw.init = &(struct clk_init_data){
>   			.name = "ce3_src",
>
