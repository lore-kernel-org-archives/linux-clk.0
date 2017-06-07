Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 7 Jun 2017 16:24:03 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: sunxi-ccu: Add pll-periph to
 PRCM's needed clocks
Message-ID: <20170607212403.y4paji7zs4wozbvn@rob-hp-laptop>
References: <20170531075824.657-1-wens@csie.org>
 <20170531075824.657-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170531075824.657-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 31, 2017 at 03:58:19PM +0800, Chen-Yu Tsai wrote:
> The AR100 clock in the PRCM has parents, one of which is pll-periph from
> the main CCU.
> 
> Add it to the list of required clocks for the PRCM CCU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
