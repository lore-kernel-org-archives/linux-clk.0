Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "David S . Miller" <davem@davemloft.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Irina Tirdea <irina.tirdea@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180827143200.8597-4-hdegoede@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Johannes Stezenbach <js@sig21.net>, Carlo Caione <carlo@endlessm.com>,
 linux-clk@vger.kernel.org
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180827143200.8597-4-hdegoede@redhat.com>
Message-ID: <153560076419.129321.1550199570456759259@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 3/4] clk: x86: Stop marking clocks as CLK_IS_CRITICAL
Date: Wed, 29 Aug 2018 20:46:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Hans de Goede (2018-08-27 07:31:59)
> Commit d31fd43c0f9a ("clk: x86: Do not gate clocks enabled by the
> firmware"), which added the code to mark clocks as CLK_IS_CRITICAL, causes
> all unclaimed PMC clocks on Cherry Trail devices to be on all the time,
> resulting on the device not being able to reach S0i3 when suspended.
> =

> The reason for this commit is that on some Bay Trail / Cherry Trail devic=
es
> the r8169 ethernet controller uses pmc_plt_clk_4. Now that the clk-pmc-at=
om
> driver exports an "ether_clk" alias for pmc_plt_clk_4 and the r8169 driver
> has been modified to get and enable this clock (if present) the marking of
> the clocks as CLK_IS_CRITICAL is no longer necessary.
> =

> This commit removes the CLK_IS_CRITICAL marking, fixing Cherry Trail
> devices not being able to reach S0i3 greatly decreasing their battery
> drain when suspended.
> =

> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=3D193891#c102
> Cc: Johannes Stezenbach <js@sig21.net>
> Cc: Carlo Caione <carlo@endlessm.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
