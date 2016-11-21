Return-Path: <sboyd@codeaurora.org>
Date: Mon, 21 Nov 2016 15:13:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.scott@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: clk-smd-rpm: Fix clk_hw_onecell_data
 references
Message-ID: <20161121231312.GZ25626@codeaurora.org>
References: <20161121140450.12353-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161121140450.12353-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/21, Georgi Djakov wrote:
> The clk_hw_onecell_data struct is missing references to the
> actual clocks. Fix this.
> 
> Reported-by: Michael Scott <michael.scott@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index a27013dbc0aa..58821f7213b0 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -148,8 +148,7 @@ struct clk_smd_rpm_req {
>  
>  struct rpm_cc {
>  	struct qcom_rpm *rpm;
> -	struct clk_hw_onecell_data data;
> -	struct clk_hw *hws[];
> +	struct clk_hw_onecell_data *data;

How about rolling our own xlate function to return hw pointers?
We already have a list of hws here, so it doesn't seem like much
more to do.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
