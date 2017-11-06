Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1509961440.1328.11.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: gxbb: fix wrong clock for SARADC/SANA
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman
	 <khilman@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 06 Nov 2017 10:44:00 +0100
In-Reply-To: <9b1f5cb5-9029-8865-a867-54d819b42e1a@amlogic.com>
References: <20171106075212.14275-1-yixun.lan@amlogic.com>
	 <1509959454.1328.8.camel@baylibre.com>
	 <9b1f5cb5-9029-8865-a867-54d819b42e1a@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-11-06 at 17:38 +0800, Yixun Lan wrote:
> > > 
> > > Tested-by: Xingyu Chen <xingyu.chen@amlogic.com>
> > > Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> > 
> > Subject is missing "v2" tag and a reference to the previous message:
> > 20171103181703.30434-1-yixun.lan@amlogic.com
> > 
> 
> Ok..
> I was considering this patch as a new one, so didn't add a v2 tag

It is clearly the same topic and this patch obsolete the previous one. The v2
tag is required here ... as the v3 will be for the next one.
