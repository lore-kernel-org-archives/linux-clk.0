Return-Path: <sboyd@codeaurora.org>
Date: Fri, 27 Jan 2017 10:48:09 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 1/5] clk: mvebu: support for 98DX3236 SoC
Message-ID: <20170127184809.GE8801@codeaurora.org>
References: <20170127032546.14657-1-chris.packham@alliedtelesis.co.nz>
 <20170127032546.14657-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170127032546.14657-2-chris.packham@alliedtelesis.co.nz>
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Chris Packham wrote:
> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from
> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.
> 
> The clock gating options are a subset of those on the Armada XP.
> 
> The core clock divider is different to the Armada XP also.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
