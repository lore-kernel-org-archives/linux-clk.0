Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 Feb 2016 14:18:06 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: dinguyen@opensource.altera.com
Cc: dinh.linux@gmail.com, mturquette@baylibre.com,
	mgerlach@opensource.altera.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: socfpga: allow for multiple parents on Arria10
 periph clocks
Message-ID: <20160222221806.GA4847@codeaurora.org>
References: <1456177966-5839-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456177966-5839-1-git-send-email-dinguyen@opensource.altera.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/22, dinguyen@opensource.altera.com wrote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> 
> There are some Arria10 clocks of type "altr,socfpga-a10-perip-clk" that can
> have multiple parents. Fix up the __socfpga_periph_init() to call
> of_clk_parent_fill() that will return the appropriate number of parents.
> 
> Also, update __socfpga_gate_init() to call of_clk_parent_fill() helper
> function.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
