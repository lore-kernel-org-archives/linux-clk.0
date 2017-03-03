Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 3 Mar 2017 00:20:49 -0600
From: Rob Herring <robh@kernel.org>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>,
	Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 4/4] dt-bindings: List devicetree binding for the CCU of
 Allwinner A20
Message-ID: <20170303062049.svbwwalcxkoaexo5@rob-hp-laptop>
References: <20170227210914.18954-1-plaes@plaes.org>
 <20170227210914.18954-5-plaes@plaes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170227210914.18954-5-plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 27, 2017 at 11:09:14PM +0200, Priit Laes wrote:
> Allwinner A20 is now driven by sunxi-ng CCU driver.
> 
> Add devicetree binding for it.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
