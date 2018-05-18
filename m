Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 18 May 2018 09:23:14 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 16/26] dt-bindings: clock: sun50i-a64-ccu: Add
 PLL_VIDEO[0-1] macros
Message-ID: <20180518142314.GA826@rob-hp-laptop>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
 <20180518094536.17201-17-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180518094536.17201-17-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 18, 2018 at 03:15:26PM +0530, Jagan Teki wrote:
> Allwinner A64 has two clock parents PLL_VIDEO0 and PLL_VIDEO1.
> 
> Include these macros on dt-bindings so-that the same can be
> used while defining CCU clock phadles.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - new patch
> 
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
