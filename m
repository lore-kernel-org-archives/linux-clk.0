Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 18:20:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mturquette@baylibre.com,
	robh+dt@kernel.org, mark.rutland@arm.com,
	thomas.petazzoni@free-electrons.com,
	gregory.clement@free-electrons.com, mw@semihalf.com,
	alior@marvell.com
Subject: Re: [PATCH] clk: mvebu: armada-39x: add clk description for
 supported interfaces
Message-ID: <20160813012036.GS361@codeaurora.org>
References: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/21, Grzegorz Jaszczyk wrote:
> Both SATA and second USB3.0 interface are supported in Armada-39x SoC
> family. Add necessary clk description, so both xhci and sata drivers
> can be correctly initialized.
> 
> The binding documentation has also been updated accordingly.
> 
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
