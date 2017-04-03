Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 3 Apr 2017 09:49:34 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 1/5] dt-bindings: update device tree binding for
 Allwinner PRCM CCUs
Message-ID: <20170403144934.rnvftfuojq22aotu@rob-hp-laptop>
References: <20170329104246.34204-1-icenowy@aosc.io>
 <20170329104246.34204-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170329104246.34204-2-icenowy@aosc.io>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 29, 2017 at 06:42:42PM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
> 
> Many Allwinner SoCs after A31 have a CCU in PRCM block.
> 
> Give the ones on H3 and A64 compatible strings.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v3:
> - Removed frequency info of iosc in this device tree binding document.
> Changes in v2:
> - Add iosc for R_CCU's on H3/A64.
> 
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
