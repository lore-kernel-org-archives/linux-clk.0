Return-Path: <robh@kernel.org>
Date: Thu, 14 Jan 2016 21:04:00 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 08/26] clk: sun5i: add DRAM gates
Message-ID: <20160115030400.GA19274@rob-hp-laptop>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-9-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1452785109-6172-9-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 14, 2016 at 04:24:51PM +0100, Maxime Ripard wrote:
> The Allwinner SoCs have a gate controller to gate the access to the DRAM
> clock to the some devices that need to access the DRAM directly (mostly
> display / image related IPs).
> 
> Use a simple gates driver to support the one found in the A13 / R8 SoCs.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi/clk-simple-gates.c              | 2 ++
>  2 files changed, 3 insertions(+)
