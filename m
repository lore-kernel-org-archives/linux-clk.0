Return-Path: <l.stach@pengutronix.de>
Message-ID: <1443108993.8476.10.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/8] i.MX early debug UART clock fixes
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Date: Thu, 24 Sep 2015 17:36:33 +0200
In-Reply-To: <20150924152016.GV3529@tiger>
References: <1442854444-4460-1-git-send-email-l.stach@pengutronix.de>
	 <20150924152016.GV3529@tiger>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, den 24.09.2015, 08:20 -0700 schrieb Shawn Guo:
> On Mon, Sep 21, 2015 at 06:53:56PM +0200, Lucas Stach wrote:
> > This series fixes a long standing interaction issue between the
> > kernels early debug facilities and the i.MX clock drivers.
> 
> This is fixing some issue but not regression.  As the change basically
> has influence on all i.MX platforms, my take is that we should get them
> into linux-next for extensive testing and queue for 4.4.  Agree?
> 
Absolutely, this fixes a bug which should mostly hit developers running
with earlyprintk or earlycon, so it's definitely not fixes material.

Please queue it up for 4.4.

Thanks,
Lucas

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
