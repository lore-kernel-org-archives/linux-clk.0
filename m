Return-Path: <architt@codeaurora.org>
Subject: Re: [PATCH] clk: qcom: clk-smd-rpm: Fix the initial rate of branches
To: Georgi Djakov <georgi.djakov@linaro.org>, sboyd@codeaurora.org
Cc: mturquette@baylibre.com, andy.gross@linaro.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20170704123447.25552-1-georgi.djakov@linaro.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <1f0f3d8d-f71b-2483-40a1-ad64c437bf6a@codeaurora.org>
Date: Thu, 6 Jul 2017 15:23:11 +0530
MIME-Version: 1.0
In-Reply-To: <20170704123447.25552-1-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 07/04/2017 06:04 PM, Georgi Djakov wrote:
> As there is no way to actually query the hardware for the current clock
> rate, now racalc_rate() just returns the last rate that was previously
> set. But if the rate was not set yet, we return the bogus rate of 1KHz.
> 
> Knowing what the rate of XO is and that some clocks are just branches of
> it, we can do better and return that rate instead of a bogus one.

+Hans.

Thanks for the fix.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
> 
> Reported-by: Archit Taneja <architt@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index d990fe44aef3..7350a43b0573 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -116,12 +116,12 @@
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id)	      \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 19200000,		      \
>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>   
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active, r_id) \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 1000,			      \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, 19200000,		      \
>   		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>   
>   #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
