Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 1 May 2018 11:17:23 -0500
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
Subject: Re: [PATCH 04/21] bindings: display: Add compatible for A64 DE2
 pipeline
Message-ID: <20180501161723.GA376@rob-hp-laptop>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-5-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180430114058.5061-5-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 30, 2018 at 05:10:41PM +0530, Jagan Teki wrote:
> Allwinner A64 has DE2 pipeline similar to other Allwinner
> SOC's like A83T, H3/H5.

'dt-bindings: ' for the subject prefix.

> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
>  1 file changed, 1 insertion(+)

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
