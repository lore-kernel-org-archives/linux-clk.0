Return-Path: <sboyd@codeaurora.org>
Date: Wed, 18 Nov 2015 14:24:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: fix memory leak
Message-ID: <20151118222446.GG32672@codeaurora.org>
References: <1447681600-14120-1-git-send-email-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447681600-14120-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/16, Sudip Mukherjee wrote:
> If of_clk_parent_fill() fails then we printed an error message and
> returned. But we missed freeing sp810.
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

Applied to clk-next

We don't need that error message on allocation failure either.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
