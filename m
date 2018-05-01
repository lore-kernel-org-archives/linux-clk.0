Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 1 May 2018 11:28:01 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH net-next v2 06/15] dt-bindings: net: dwmac-sun8i: Add
 binding for GMAC on Allwinner R40 SoC
Message-ID: <20180501162801.GA14124@rob-hp-laptop>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-7-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180501161227.2110-7-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 02, 2018 at 12:12:18AM +0800, Chen-Yu Tsai wrote:
> The Allwinner R40 SoC has the EMAC controller supported by dwmac-sun8i.
> It is named "GMAC", while EMAC refers to the 10/100 Mbps Ethernet
> controller supported by sun4i-emac. The controller is the same, but
> the R40 has the glue layer controls in the clock control unit (CCU),
> with a reduced RX delay chain, and no TX delay chain.
> 
> This patch adds the R40 specific bits to the dwmac-sun8i binding.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
