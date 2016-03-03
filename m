Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Mar 2016 17:50:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Andi Shyti <andi.shyti@samsung.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 36/41] clk: s2mps11: Remove CLK_IS_ROOT
Message-ID: <20160303015044.GU24999@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-37-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858826-28541-37-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/01, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Andi Shyti <andi.shyti@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
