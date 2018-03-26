Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:23:01 -0500
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
Subject: Re: [PATCH net-next 04/12] dt-bindings: net: dwmac-sun8i: Sort
 syscon compatibles by alphabetical order
Message-ID: <20180326222301.h4bnjovhulclgnok@rob-hp-laptop>
References: <20180317092857.4396-1-wens@csie.org>
 <20180317092857.4396-5-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180317092857.4396-5-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On Sat, Mar 17, 2018 at 05:28:49PM +0800, Chen-Yu Tsai wrote:
> The A83T syscon compatible was appended to the syscon compatibles list,
> instead of inserted in to preserve the ordering.
> 
> Move it to the proper place to keep the list sorted.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
