Return-Path: <sboyd@codeaurora.org>
Date: Fri, 22 Apr 2016 15:58:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 12/13] clk: fixed-rate: Add hw based registration APIs
Message-ID: <20160422225839.GC13149@codeaurora.org>
References: <1461277324-27185-1-git-send-email-sboyd@codeaurora.org>
 <1461277324-27185-13-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461277324-27185-13-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/21, Stephen Boyd wrote:
> Add registration APIs in the clk fixed-rate code to return struct
> clk_hw pointers instead of struct clk pointers. This way we hide
> the struct clk pointer from providers unless they need to use
> consumer facing APIs.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
