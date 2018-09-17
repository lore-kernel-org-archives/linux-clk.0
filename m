Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Message-ID: <5b9f3f79.1c69fb81.21dc2.1e01@mx.google.com>
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: robh+dt@kernel.org, maxime.ripard@bootlin.com, wens@csie.org,
	mark.rutland@arm.com, airlied@linux.ie, architt@codeaurora.org,
	devicetree@vger.kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, jernej.skrabec@siol.net,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	a.hajda@samsung.com, linux-sunxi@googlegroups.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 01/27] dt-bindings: sunxi-sram: add binding for Allwinner
 H6  SRAM C
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180902072643.4917-2-jernej.skrabec@siol.net>
Date: Sun, 16 Sep 2018 22:05:28 -0500
List-ID: <linux-clk.vger.kernel.org>

On Sun,  2 Sep 2018 09:26:17 +0200, Jernej Skrabec wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> The Allwinner H6 SoC's DE3 needs the SRAM C section being claimed in the
> system controller to work, like A64 DE2.
> 
> As H6 and A64 system controller are quite similar, code is reused now,
> and the A64 fallback compatible string is added after the H6 compatible
> string.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> [fixed typo in compatible string]
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/devicetree/bindings/sram/sunxi-sram.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
