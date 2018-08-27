Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "David S . Miller" <davem@davemloft.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Irina Tirdea <irina.tirdea@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180827143200.8597-3-hdegoede@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>, netdev@vger.kernel.org,
 Johannes Stezenbach <js@sig21.net>, Carlo Caione <carlo@endlessm.com>,
 linux-clk@vger.kernel.org
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180827143200.8597-3-hdegoede@redhat.com>
Message-ID: <153539565488.129321.2586881199420174235@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] r8169: Get and enable optional ether_clk clock
Date: Mon, 27 Aug 2018 11:47:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Hans de Goede (2018-08-27 07:31:58)
> On some boards a platform clock is used as clock for the r8169 chip,
> this commit adds support for getting and enabling this clock (assuming
> it has an "ether_clk" alias set on it).
> =

> This is related to commit d31fd43c0f9a ("clk: x86: Do not gate clocks
> enabled by the firmware") which is a previous attempt to fix this for some
> x86 boards, but this causes all Cherry Trail SoC using boards to not reach
> there lowest power states when suspending.
> =

> This commit (together with an atom-pmc-clk driver commit adding the alias)
> fixes things properly by making the r8169 get the clock and enable it when
> it needs it.
> =

> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=3D193891#c102
> Cc: Johannes Stezenbach <js@sig21.net>
> Cc: Carlo Caione <carlo@endlessm.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Stephen Boyd <sboyd@kernel.org>

> @@ -7614,6 +7616,11 @@ static void rtl_hw_initialize(struct rtl8169_priva=
te *tp)
>         }
>  }
>  =

> +static void rtl_disable_clk(void *data)
> +{
> +       clk_disable_unprepare(data);
> +}
> +
>  static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id=
 *ent)
>  {
>         const struct rtl_cfg_info *cfg =3D rtl_cfg_infos + ent->driver_da=
ta;
> @@ -7647,6 +7654,32 @@ static int rtl_init_one(struct pci_dev *pdev, cons=
t struct pci_device_id *ent)
>         mii->reg_num_mask =3D 0x1f;
>         mii->supports_gmii =3D cfg->has_gmii;
>  =

> +       /* Get the *optional* external "ether_clk" used on some boards */
> +       tp->clk =3D devm_clk_get(&pdev->dev, "ether_clk");

An "optional" clk API is in flight, but it's easier to wait for that to
merge and then this to be updated, so just take that as an FYI. It would
be interesting to see how to support optional clks with clkdev lookups
though, which would be needed in this case.

How would you know that a clk device driver hasn't probed yet and isn't
the driver that's actually providing the clk to this device on x86
systems? With DT systems we can figure that out by looking at the DT and
seeing if the device driver requesting the clk has the clocks property.
On x86 systems it's all clkdev which doesn't really lend itself to
solving this problem.

> +       if (IS_ERR(tp->clk)) {
> +               rc =3D PTR_ERR(tp->clk);
