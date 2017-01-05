Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Thu, 5 Jan 2017 08:20:02 -0600
From: Andy Gross <andy.gross@linaro.org>
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, david.brown@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: Fix a possible NULL pointer dereferencing
Message-ID: <20170105142002.GB5710@hector.attlocal.net>
References: <1483606525-27709-1-git-send-email-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1483606525-27709-1-git-send-email-vivek.gautam@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 05, 2017 at 02:25:25PM +0530, Vivek Gautam wrote:
> Assign num_parents as 0 while registering fixed rate clocks
> in _qcom_cc_register_board_clk(), to make sure the clk framework
> doesn't dereference parent.
> 
> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
> 
> Cc: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
> 
> Based on 'clk-next'. Build tested.
> 
>  drivers/clk/qcom/common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index cfab7b400381..df004ead1bef 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -157,6 +157,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
>  
>  		init_data.name = path;
>  		init_data.ops = &clk_fixed_rate_ops;
> +		init_data.num_parents = 0;

It seems like there was a initializer in the declaration but it was { } instead
of { 0 }.

Was the original intent to make this structure initialized to 0?  If so, perhaps
it should be fixed above in the initializer.

>  
>  		ret = devm_clk_hw_register(dev, &fixed->hw);
>  		if (ret)


Regards,

Andy
