Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 31 May 2017 13:09:44 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi-ccu: Add compatible string
 for A83T PRCM
Message-ID: <20170531180944.dbg4adt33jcgbbjc@rob-hp-laptop>
References: <20170526080025.28532-1-wens@csie.org>
 <20170526080025.28532-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170526080025.28532-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 26, 2017 at 04:00:23PM +0800, Chen-Yu Tsai wrote:
> The A83T's PRCM has the same set of clocks and resets as the A64.
> However, a few dividers are different. And due to the lack of a low
> speed 32.768 kHz oscillator, a few of the clock parents are different.
> 
> The PRCM also has controls for various power domains. These are not
> supported yet.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
