Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 12:59:19 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [PATCH] clk: mvebu: Add clk support for the orion5x SoC mv88f5181
Message-ID: <20160920195919.GD8319@codeaurora.org>
References: <20160920162450.4046-1-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160920162450.4046-1-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/20, Gregory CLEMENT wrote:
> From: Jamie Lentin <jm@lentin.co.uk>
> 
> Referring to the u-boot sources for the Netgear WNR854T, add support
> for the mv88f5181.
> 
> [gregory.clement@free-electrons.com: fix commit title]
> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
> 
> Hi Stephen and Mike,
> 
> do you agree to give your acked-by on this patch. It is part of a
> convertion of old orion5x Socv to the device tree. If you acked-by
> this one, then I will be able to take it in my tree and avoiding
> breaking the git bisect.

Is the problem that we're changing some dts files somewhere and
those platforms would stop booting if this change wasn't present?
Given that we're adding a new compatible it seems like we're
adding new SoC support, so having the clk patch and the dts patch
come together in -next via a merge instead of basing the dts
patch on top of the clk patch would be how things are normally
done.

If we're really changing some dts to be backwards incompatible,
then I understand the bisect problem and you can have my ack.

Acked-by: Stephen Boyd <sboyd@codeaurora.org.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
