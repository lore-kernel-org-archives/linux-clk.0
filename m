Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 "Akinobu Mita" <akinobu.mita@gmail.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160216004221.GA3310@piout.net>
Cc: rtc-linux@googlegroups.com, linux-clk@vger.kernel.org,
 "Heiko Stuebner" <heiko@sntech.de>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Stephen Boyd" <sboyd@codeaurora.org>
References: <1454249410-21449-1-git-send-email-akinobu.mita@gmail.com>
 <20160216004221.GA3310@piout.net>
Message-ID: <20160216223526.2278.66771@quark.deferred.io>
Subject: Re: [PATCH] rtc: rtc-ds1307: add clock provider support for DS3231
Date: Tue, 16 Feb 2016 14:35:26 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Alexandre Belloni (2016-02-15 16:42:21)
> On 31/01/2016 at 23:10:10 +0900, Akinobu Mita wrote :
> > DS3231 has programmable square-wave output signal.
> > This enables to use this feature as a clock provider of
> > common clock framework.
> > =

> > Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Alessandro Zummo <a.zummo@towertech.it>
> > Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> >  .../devicetree/bindings/rtc/maxim,ds3231.txt       |  37 +++
> >  drivers/rtc/rtc-ds1307.c                           | 296 +++++++++++++=
+++++++-
> >  2 files changed, 332 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds3231.=
txt
> > =

> =

> Applied, thanks.

If it's not too late:

Reviewed-by: Michael Turquette <mturquette@baylibre.com>

> =

> -- =

> Alexandre Belloni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
