Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 1 May 2018 11:27:18 -0500
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
Subject: Re: [PATCH net-next v2 05/15] dt-bindings: net: dwmac-sun8i:
 simplify description of syscon property
Message-ID: <20180501162718.GA13139@rob-hp-laptop>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-6-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180501161227.2110-6-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 02, 2018 at 12:12:17AM +0800, Chen-Yu Tsai wrote:
> The syscon property is used to point to the device that holds the glue
> layer control register known as the "EMAC (or GMAC) clock register".
> 
> We do not need to explicitly list what compatible strings are needed, as
> this information is readily available in the user manuals. Also the
> "syscon" device type is more of an implementation detail. There are many
> ways to access a register not in a device's address range, the syscon
> interface being the most generic and unrestricted one.
> 
> Simplify the description so that it says what it is supposed to
> describe.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
