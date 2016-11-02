Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:22:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lars@metafoo.de, dan.carpenter@oracle.com, ssantosh@kernel.org,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: keystone: Fix an error checking
Message-ID: <20161102002228.GC16026@codeaurora.org>
References: <cover.1477339880.git.christophe.jaillet@wanadoo.fr>
 <ff1de6a7af60b4e3804162e553d7174e2ad1ea16.1477339880.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <ff1de6a7af60b4e3804162e553d7174e2ad1ea16.1477339880.git.christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Christophe JAILLET wrote:
> clk_register_pll() can return ERR_PTR(-ENOMEM) so checking the return value
> against NULL only is not correct.

The code just doesn't propagate the error up to the caller.
Instead the caller treats NULL as an error and non-NULL as valid.
If the callee detects an error it hides it and returns NULL.

> In order to fix it, update clk_register_pll() to always return an error
> pointer in case of error and check the return value with IS_ERR.
> 
> While at it, also fix a tab vs space in the surrounding code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-compiled and un-tested.

Please at least compile test patches.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
