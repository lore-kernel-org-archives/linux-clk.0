Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 8 May 2017 11:12:25 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: sunxi-ccu: Add compatible
 string for A83T CCU
Message-ID: <20170508161225.3zwck42o6ahqtyni@rob-hp-laptop>
References: <20170503031658.29299-1-wens@csie.org>
 <20170503031658.29299-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170503031658.29299-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 03, 2017 at 11:16:51AM +0800, Chen-Yu Tsai wrote:
> The A83T clock control unit is a hybrid of some new style clock designs
> from the A80, and old style layout from the other Allwinner SoCs.
> 
> Like the A80, the SoC does not have a low speed 32.768 kHz oscillator.
> Unlike the A80, there is no clock input either. The only low speed clock
> available is the internal oscillator which runs at around 16 MHz,
> divided by 512, yielding a low speed clock around 31.250 kHz.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
