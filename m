Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <e6592bd2f2505e30bb27e1cd4cbb031344cc3459.camel@baylibre.com>
Subject: Re: [PATCH v2 0/4] clk: meson: clk-pll driver update
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Date: Mon, 27 Aug 2018 14:59:52 +0200
In-Reply-To: <CAFBinCCNY3=yo42hQUqJJzeSetLni+whtWaBZCL-MV63DDYQow@mail.gmail.com>
References: <20180801140053.25899-1-jbrunet@baylibre.com>
         <CAFBinCCNY3=yo42hQUqJJzeSetLni+whtWaBZCL-MV63DDYQow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, 2018-08-12 at 20:26 +0200, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Aug 1, 2018 at 4:00 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > 
> > This patchset is yet another round of update to the amlogic pll driver.
> > 
> >  1) Enable bit is added so we don't rely on the bootloader or the init
> >     value to enable to pll device.
> >  2) Remove unnecessary CLK_GET_RATE_NOCACHE flags.
> >  3) OD post dividers are removed from the pll driver. This simplify the
> >     driver and let us provide the clocks which exist between those
> >     dividers. Some device are actually using these clocks.
> >  4) The rates hard coded in parameter tables are remove. Instead, we
> >     only rely on the parent rate and the parameters to calculate the
> >     output rate, which is a lot better.
> > 
> > This series has been tested on the gxl libretech cc and axg s400.
> > I did not test it on meson8b yet.
> > 
> > Changes since v1: [0]
> >  - improve commit description of patch 1
> >  - remove unnecessary CLK_GET_RATE_NOCACHE flags.
> >  - add missing CLK_SET_RATE_PARENT.
> > 
> > [0]: https://lkml.kernel.org/r/20180717095617.12240-1-jbrunet@baylibre.com
> > 
> > Jerome Brunet (4):
> >   clk: meson: clk-pll: add enable bit
> >   clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
> >   clk: meson: clk-pll: remove od parameters
> >   clk: meson: clk-pll: drop hard-coded rates from pll tables
> 
> for the whole series:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> as well as:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> (tested on Meson8b / Odroid-C1, even CPU frequency scaling still works
> with my out-of-tree patches)

Collected tags, rebased and queued for 4.20

> 
> 
> Regards
> Martin
