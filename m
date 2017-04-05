Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Apr 2017 14:48:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ray Jui <ray.jui@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	David Binderman <dcb314@hotmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] clk: iproc: Remove redundant check
Message-ID: <20170405214805.GD7065@codeaurora.org>
References: <1491422017-24421-1-git-send-email-ray.jui@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491422017-24421-1-git-send-email-ray.jui@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/05, Ray Jui wrote:
> Remove the redundant check of 'rate' in the if statement of the
> 'pll_set_rate' function
> 
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
