Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Sep 2016 11:24:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: arvind.yadav.cs@gmail.com
Cc: mturquette@baylibre.com, a.hajda@samsung.com, lee.jones@linaro.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: st: clk-flexgen: Unmap region obtained by of_iomap
Message-ID: <20160914182454.GR7243@codeaurora.org>
References: <y>
 <57d92940.6329c80a.3d959.9d78@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <57d92940.6329c80a.3d959.9d78@mx.google.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/14, arvind.yadav.cs@gmail.com wrote:
> @@ -337,6 +339,8 @@ static void __init st_of_flexgen_setup(struct device_node *np)
>  	return;
>  
>  err:
> +	if (reg)

This is always true? Why check?

> +		iounmap(reg);
>  	if (clk_data)
>  		kfree(clk_data->clks);
>  	kfree(clk_data);
> -- 
> 1.7.9.5
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
