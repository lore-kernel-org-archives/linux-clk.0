Return-Path: <sboyd@codeaurora.org>
Date: Tue, 21 Jul 2015 11:43:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org, shawn.guo@linaro.org,
	jason.liu@linaro.org, wan.zhijun@zte.com.cn
Subject: Re: [PATCH 2/2] clk: zx: Add audio and GPIO clock for zx296702
Message-ID: <20150721184340.GB3738@codeaurora.org>
References: <1436349493-5453-1-git-send-email-jun.nie@linaro.org>
 <1436349493-5453-2-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436349493-5453-2-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/08, Jun Nie wrote:
> Add SPDIF/I2S and GPIO clock for zx296702
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

This patch looks ok.

> @@ -170,6 +181,21 @@ static const char * uart_wclk_sel[] = {
>  	"lsp1_26M_wclk",
>  };
>  
> +static const char * spdif0_wclk_sel[] = {

Would be nice if this could be const char * const to avoid
checkpatch noise.

> +	"lsp0_104M_wclk",
> +	"lsp0_26M_wclk",
> +};
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
