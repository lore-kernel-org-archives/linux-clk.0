Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 14:25:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: mturquette@linaro.org, dinh.linux@gmail.com, geert@linux-m68k.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC/PATCHv2 2/2] clk: socfpga: make use of of_clk_parent_fill
 helper function
Message-ID: <20150604212511.GQ676@codeaurora.org>
References: <1433445153-25320-1-git-send-email-dinguyen@opensource.altera.com>
 <1433445153-25320-3-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433445153-25320-3-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/04, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> Use of_clk_parent_fill to fill in the parent clock's array.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---
> v2: none
> ---
>  drivers/clk/socfpga/clk-gate.c | 6 +-----
>  drivers/clk/socfpga/clk-pll.c  | 7 +------
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 

Nice consolidation!

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
