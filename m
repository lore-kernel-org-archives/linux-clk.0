Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50370 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750993AbdLGWyl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Dec 2017 17:54:41 -0500
Date: Thu, 7 Dec 2017 14:54:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: srinivas.kandagatla@linaro.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-msm8996: always enable aggre0_noc gdsc
Message-ID: <20171207225439.GB4283@codeaurora.org>
References: <20171207141618.4694-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171207141618.4694-1-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/07, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> bus clks which depend on this gdsc are marked as critical,
> so this patch flags this gdsc ALWAYS_ON so that bus clks status
> does not get stuck at on or off.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/gcc-msm8996.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
> index 0146d8853488..b2be77469693 100644
> --- a/drivers/clk/qcom/gcc-msm8996.c
> +++ b/drivers/clk/qcom/gcc-msm8996.c
> @@ -3101,7 +3101,7 @@ static struct gdsc aggre0_noc_gdsc = {
>  		.name = "aggre0_noc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,

I dont think this flag has been added yet. Probably this needs to
be folded into the other series?


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
