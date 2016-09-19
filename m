Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Ben Dooks <ben.dooks@codethink.co.uk>, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, johnyoun@synopsys.com, will.deacon@arm.com, mturquette@baylibre.com, linux-usb@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, catalin.marinas@arm.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Mon, 19 Sep 2016 09:37:06 +0200
Message-ID: <19026966.I9xoTaRrZa@wuerfel>
In-Reply-To: <57DF70AF.4050002@ti.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com> <CAFBinCC5fhbtkNdc6MJs7veD+xVGC6Qb-jgX_pwvraP1x2JrhQ@mail.gmail.com> <57DF70AF.4050002@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, September 19, 2016 10:29:27 AM CEST Kishon Vijay Abraham I wrote:
> On Monday 19 September 2016 01:26 AM, Martin Blumenstingl wrote:
> > On Fri, Sep 16, 2016 at 10:19 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:

> >> This way the driver will be probed only once (the reset can be done during
> >> probe). The phy driver should scan the dt node and for every sub-node it
> >> invokes phy_create?
> > I'll recap what we have discussed so far (so you don't have to re-read
> > the whole thread):
> > The reference driver treats both USB PHYs as separate devices (the
> > datasheet has no information about the PHYs though). The only
> > "special" thing is the shared reset line -> together with Philipp
> > Zabel (the reset framework maintainer) we decided to make
> > reset_control_reset work for shared reset lines.
> > 
> > That means we can keep the two PHYs as separate devices inside the
> > .dts, while keeping everything else separate (just like the reference
> > driver)
> > Is this fine for you and Arnd?
> 
> yeah.. I'm fine with that.
> 

Agreed, if we don't need to have a device modeled around both
instance, that's ideal.

	Arnd
