Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "David S . Miller" <davem@davemloft.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Irina Tirdea <irina.tirdea@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180827143200.8597-2-hdegoede@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Johannes Stezenbach <js@sig21.net>, Carlo Caione <carlo@endlessm.com>,
 linux-clk@vger.kernel.org
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180827143200.8597-2-hdegoede@redhat.com>
Message-ID: <153539541079.129321.16889319226246451527@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/4] clk: x86: add "ether_clk" alias for Bay Trail / Cherry Trail
Date: Mon, 27 Aug 2018 11:43:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Hans de Goede (2018-08-27 07:31:57)
> Commit d31fd43c0f9a ("clk: x86: Do not gate clocks enabled by the
> firmware") causes all unclaimed PMC clocks on Cherry Trail devices to be =
on
> all the time, resulting on the device not being able to reach S0i2 or S0i3
> when suspended.
> =

> The reason for this commit is that on some Bay Trail / Cherry Trail devic=
es
> the ethernet controller uses pmc_plt_clk_4. This commit adds an "ether_cl=
k"
> alias, so that the relevant ethernet drivers can try to (optionally) use
> this, without needing X86 specific code / hacks, thus fixing ethernet on
> these devices without breaking S0i3 support.
> =

> This commit uses clkdev_hw_create() to create the alias, mirroring the co=
de
> for the already existing "mclk" alias for pmc_plt_clk_3.
> =

> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=3D193891#c102
> Cc: Johannes Stezenbach <js@sig21.net>
> Cc: Carlo Caione <carlo@endlessm.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
