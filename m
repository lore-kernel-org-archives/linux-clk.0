Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:23:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V8] clk: bcm: Add driver for BCM53573 ILP clock
Message-ID: <20160916232332.GB7243@codeaurora.org>
References: <20160905142935.4550-1-zajec5@gmail.com>
 <20160913070722.5867-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160913070722.5867-1-zajec5@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/13, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This clock is present on BCM53573 devices (including BCM47189) that use
> Cortex-A7. ILP is a part of PMU (Power Management Unit) multi-function
> device so we use syscon (and regmap) for it.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
