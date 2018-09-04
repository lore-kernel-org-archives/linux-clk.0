Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 05/27] clk: sunxi-ng: Use u64 for calculation of NM rate
Date: Tue, 04 Sep 2018 20:06:52 +0200
Message-ID: <4377030.YGBN1y1aZP@jernej-laptop>
In-Reply-To: <CAGb2v64Y0ui6ZvAJqc2dXMKtSSQJ-T4ubrV9188JTV7aFSrFCA@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-6-jernej.skrabec@siol.net> <CAGb2v64Y0ui6ZvAJqc2dXMKtSSQJ-T4ubrV9188JTV7aFSrFCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Dne torek, 04. september 2018 ob 11:18:47 CEST je Chen-Yu Tsai napisal(a):
> On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net> 
wrote:
> > Allwinner H6 SoC has multiplier N range between 1 and 254. Since parent
> > rate is 24MHz, intermediate result when calculating final rate easily
> > overflows 32 bit variable.
> > 
> > Because of that, introduce function for calculating clock rate which
> > uses 64 bit variable for intermediate result.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> The code looks good. The A80's Video PLLs are also affected by this.
> The range for N on the A80 is 12 ~ 255.
> 
> Can you add fixes and stable tags?

Sure.

> 
> ChenYu
