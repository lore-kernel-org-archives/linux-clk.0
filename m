Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 17:03:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: socfpga: Fix the smplsel on Arria10 and Stratix10
Message-ID: <20170620000312.GS20170@codeaurora.org>
References: <1496931519-9685-1-git-send-email-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1496931519-9685-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Dinh Nguyen wrote:
> The smplsel bits for the SDMMC clock on Arria10 and Stratix10 platforms are
> offset by 1 additional bit.
> 
> Add a new macro SYSMGR_SDMMC_CTRL_SET_AS10 for usage on the Arria10 and
> Stratix10 platforms.
> 
> Fixes: 5611a5ba8e54 ("clk: socfpga: update clk.h so for Arria10 platform to use")
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
