Return-Path: <sboyd@codeaurora.org>
Date: Wed, 13 May 2015 12:43:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: bindings: Fix assigned-clock-rates description
Message-ID: <20150513194303.GA32166@codeaurora.org>
References: <5549CC5C.8090107@samsung.com>
 <1431067874-7877-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431067874-7877-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/07, Stephen Boyd wrote:
> The binding uses assigned-clock-parents when it should use
> assigned-clock-rates. Furthermore, the part that describes how
> they relate to the assigned-clocks property is not clear about
> what is related. Correct and clarify this part of the binding.
> 
> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> On 05/06, Krzysztof Kozlowski wrote:
> > Looks much better. So actually this should be yours patch now, you
> > can add my Reported-by :).
> 
> Ok. I'll queue up this patch unless there are any other objections.
> 

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
