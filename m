Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Jun 2015 16:13:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Carlo Caione <carlo@endlessm.com>, linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [patch] clk: meson: add some error handling in
 meson_clk_register_cpu()
Message-ID: <20150611231325.GH29640@codeaurora.org>
References: <20150611152046.GG12192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20150611152046.GG12192@mwanda>
List-ID: <linux-clk.vger.kernel.org>

On 06/11, Dan Carpenter wrote:
> This error handling hopefully isn't needed but it make the static
> checkers happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
