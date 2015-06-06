Return-Path: <sboyd@codeaurora.org>
Date: Fri, 5 Jun 2015 18:11:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: mturquette@linaro.org, dinh.linux@gmail.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3 1/2] clk: of: helper for filling parent clock array and
 return num of parents
Message-ID: <20150606011145.GD29237@codeaurora.org>
References: <1433521574-31052-1-git-send-email-dinguyen@opensource.altera.com>
 <1433521574-31052-2-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433521574-31052-2-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/05, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Sprinkled all through the platform clock drivers are code like this to
> fill the clock parent array:
> 
> for (i = 0; i < num_parents; ++i)
> 	parent_names[i] = of_clk_get_parent_name(np, i);
> 
> The of_clk_parent_fill() will do the same as the code above, and while
> at it, return the number of parents as well since the logic of the
> function is to the walk the clock node to look for the parent.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---

Applied to clk-next with some small kernel-doc fixes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
