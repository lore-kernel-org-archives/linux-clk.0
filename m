Return-Path: <wens213@gmail.com>
Return-Path: <wens213@gmail.com>
MIME-Version: 1.0
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-6-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-6-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 4 Sep 2018 17:18:47 +0800
Message-ID: <CAGb2v64Y0ui6ZvAJqc2dXMKtSSQJ-T4ubrV9188JTV7aFSrFCA@mail.gmail.com>
Subject: Re: [PATCH 05/27] clk: sunxi-ng: Use u64 for calculation of NM rate
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
> Allwinner H6 SoC has multiplier N range between 1 and 254. Since parent
> rate is 24MHz, intermediate result when calculating final rate easily
> overflows 32 bit variable.
>
> Because of that, introduce function for calculating clock rate which
> uses 64 bit variable for intermediate result.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

The code looks good. The A80's Video PLLs are also affected by this.
The range for N on the A80 is 12 ~ 255.

Can you add fixes and stable tags?

ChenYu
