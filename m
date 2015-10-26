Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 15:06:41 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: lpc18xx-cgu: fix potential system hang when
 disabling unused clocks
Message-ID: <20151026220641.GI19782@codeaurora.org>
References: <1445705724-20805-1-git-send-email-manabian@gmail.com>
 <1445705724-20805-4-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445705724-20805-4-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Joachim Eastwood wrote:
> The clock consumer (CCU) of the CGU must be able to check if a CGU
> base clock is really running since access to the CCU registers
> requires a running base clock. Access with a disabled base clock will
> cause the system to hang. Fix this issue by adding code that check if
> the parent clock is running in the is_enabled clk_ops callback. Since
> certain clocks can be cascaded this must be added to all clock gates.
> 
> The hang would occur if the boot ROM or boot loader didn't setup and
> enable the USB0 clock. Then when the clk framework tried to access
> the CCU register it would hang the system.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
