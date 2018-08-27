Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "David S . Miller" <davem@davemloft.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Irina Tirdea <irina.tirdea@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <0f52c05a-4f70-3022-3720-07c6bcf29ed8@redhat.com>
Cc: netdev@vger.kernel.org, Johannes Stezenbach <js@sig21.net>,
 Carlo Caione <carlo@endlessm.com>, linux-clk@vger.kernel.org
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180827143200.8597-3-hdegoede@redhat.com>
 <153539565488.129321.2586881199420174235@swboyd.mtv.corp.google.com>
 <0f52c05a-4f70-3022-3720-07c6bcf29ed8@redhat.com>
Message-ID: <153539729389.129321.804899531283282568@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] r8169: Get and enable optional ether_clk clock
Date: Mon, 27 Aug 2018 12:14:53 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Hans de Goede (2018-08-27 11:53:19)
> On 27-08-18 20:47, Stephen Boyd wrote:
> > How would you know that a clk device driver hasn't probed yet and isn't
> > the driver that's actually providing the clk to this device on x86
> > systems? With DT systems we can figure that out by looking at the DT and
> > seeing if the device driver requesting the clk has the clocks property.
> > On x86 systems it's all clkdev which doesn't really lend itself to
> > solving this problem.
> =

> Right on x86 the assumption is that the clk driver will be builtin and
> will probe before the consumer. In this case that is true as the
> pmc-atom-clk driver can only be builtin and its platform device is
> instantiated from the acpi_lpss code and acpi init happens before
> the PCI bus is scanned.

If we can go with this assumption then we can make the optional clk API
work even on clkdev based systems. Maybe if x86 had some way of
indicating that all builtin clks are registered? That might work but
it's not very clean. Or if we could check to see if we're running on an
ACPI based system in clkdev we could use that to assume that clk_get()
will only be called after all providers have registered their lookups.

> =

> We have the same problem with ACPI OpRegions and drivers who have
> _PS0 / _PS3 methods using those OpRegions and the "solution" so far
> is the same, make sure all drivers providing OpRegion handlers are
> builtin.
> =

> Basically we (x86) miss the nice dependency info and complete hw
> description devicetree gives, so we rely on initialization order
> for some of this. I added the -EPROBE_DEFER handling for completeness
> sake / for other platforms, as you point out it will never trigger
> on x86.
> =


Thanks for the info!
