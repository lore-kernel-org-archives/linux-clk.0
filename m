Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Jun 2017 10:45:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: socfpga: Fix the smplsel on Arria10 and Stratix10
Message-ID: <20170607174516.GN20170@codeaurora.org>
References: <1496847690-1883-1-git-send-email-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1496847690-1883-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Dinh Nguyen wrote:
> The smplsel bits for the SDMMC clock on Arria10 and Stratix10 platforms are
> offset by 1 additional bit.
> 
> Add a new macro SYSMGR_SDMMC_CTRL_SET_AS10 for usage on the Arria10 and
> Stratix10 platforms.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

Some sort of Fixes: tag as well?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
