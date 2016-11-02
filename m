Return-Path: <sboyd@codeaurora.org>
Date: Tue, 1 Nov 2016 17:32:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: mturquette@baylibre.com, manabian@gmail.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: nxp: clk-lpc18xx-ccu: Unmap region obtained by
 of_iomap
Message-ID: <20161102003250.GI16026@codeaurora.org>
References: <1474367987-15808-1-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474367987-15808-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Arvind Yadav wrote:
> From: Arvind Yadav <arvind.yadav.cs@gmail.com>
> 
> Free memory mapping, if lpc18xx_ccu_init is not successful.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
