Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 14:40:10 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qoriq: fix memory leak
Message-ID: <20151130224010.GA21446@codeaurora.org>
References: <1448273210-8200-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448273210-8200-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/23, Sudip Mukherjee wrote:
> If get_pll_div() fails we exited by returning NULL but we missed
> releasing hwc.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
