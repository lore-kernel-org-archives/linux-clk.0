Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Oct 2016 15:27:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: core: add __init decoration for
 CLK_OF_DECLARE_DRIVER function
Message-ID: <20161017222738.GG8871@codeaurora.org>
References: <1475917178-15488-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475917178-15488-1-git-send-email-shawn.guo@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/08, Shawn Guo wrote:
> The new introduced macro CLK_OF_DECLARE_DRIVER is usually used to
> declare clock driver init functions, which are mostly decorated with
> __init.  Add __init decoration for CLK_OF_DECLARE_DRIVER function to
> avoid causing section mismatch warnings on client clock drivers.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
