Return-Path: <wens213@gmail.com>
Return-Path: <wens213@gmail.com>
MIME-Version: 1.0
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-18-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-18-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Sep 2018 21:30:52 +0800
Message-ID: <CAGb2v66oMoXxYCrnZpWMk_wtZMfqGonWM+fdc1BG-3NghcE7bQ@mail.gmail.com>
Subject: Re: [PATCH 17/27] drm/sun4i: dw-hdmi: Add quirk for setting TMDS clock
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
	Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
	Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> It turns out that H6 HDMI BSP kernel driver doesn't change TMDS rate at
> all. At this point it is not clear whether it is just not necessary or
> it would cause some kind of issues.
>
> Add a quirk for it.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
