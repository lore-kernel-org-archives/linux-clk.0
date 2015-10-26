Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 15:06:37 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: lpc18xx-ccu: fix potential system hang when
 disabling unused clocks
Message-ID: <20151026220637.GH19782@codeaurora.org>
References: <1445705724-20805-1-git-send-email-manabian@gmail.com>
 <1445705724-20805-3-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445705724-20805-3-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Joachim Eastwood wrote:
> CCU branch clock register must only be accessed while the base
> (parent) clock is running. Access with a disabled base clock
> will cause the system to hang. Fix this issue by adding code
> that check if the parent clock is running in the is_enabled
> clk_ops callback.
> 
> This hang would occur when disabling unused clocks after AMBA
> runtime pm had already disabled some of the clocks.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
