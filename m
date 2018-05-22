Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 13:10:25 -0500
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
Subject: Re: [PATCH v2 14/26] dt-bindings: display: Add compatible for A64
 HDMI
Message-ID: <20180522181025.GA20871@rob-hp-laptop>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
 <20180518094536.17201-15-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180518094536.17201-15-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 18, 2018 at 03:15:24PM +0530, Jagan Teki wrote:
> HDMI on Allwinner A64 has similar like H3/H5/A83T.
> 
> Add compatible a64 and update A83T compatible as fallback.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - Add fallback compatible
> 
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
