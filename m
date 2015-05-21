Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 May 2015 11:14:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: cdce706: Add missing of_clk_del_provider call in
 cdce706_remove
Message-ID: <20150521181435.GA21195@codeaurora.org>
References: <1432218373.27793.0.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1432218373.27793.0.camel@ingics.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/21, Axel Lin wrote:
> Remove a previously registered clock provider when unload the module.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---

What about all the clocks that are registered? Don't those need
to be unregistered as well?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
