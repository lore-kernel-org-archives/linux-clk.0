Return-Path: <robh@kernel.org>
Date: Thu, 14 Jan 2016 21:17:35 -0600
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
Subject: Re: [PATCH v2 25/26] drm/panel: simple: Add timings for the Olimex
 LCD-OLinuXino-4.3TS
Message-ID: <20160115031735.GA26011@rob-hp-laptop>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-26-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1452785109-6172-26-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 14, 2016 at 04:25:08PM +0100, Maxime Ripard wrote:
> Add support for the Olimex LCD-OLinuXino-4.3TS panel to the DRM simple
> panel driver.
> 
> It is a 480x272 panel connected through a 24-bits RGB interface.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  .../display/panel/olimex,lcd-olinuxino-43-ts.txt   |  7 ++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino-43-ts.txt
