Return-Path: <sboyd@codeaurora.org>
Date: Fri, 10 Feb 2017 15:27:45 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: mvebu: Expand mv98dx3236-core-clock support
Message-ID: <20170210232745.GS25384@codeaurora.org>
References: <20170207202815.20226-1-chris.packham@alliedtelesis.co.nz>
 <20170207202815.20226-7-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170207202815.20226-7-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-clk.vger.kernel.org>

On 02/08, Chris Packham wrote:
> The initial implementation in commit e120c17a70e5 ("clk: mvebu: support
> for 98DX3236 SoC") hardcoded a fixed value for the main PLL frequency.
> Port code from the Marvell supplied Linux kernel to support different
> PLL frequencies and provide clock gating support.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
