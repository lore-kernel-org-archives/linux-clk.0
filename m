Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajan Vaja <RAJANV@xilinx.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CY1PR02MB2091CE50B9163419EB7D67EFB72B0@CY1PR02MB2091.namprd02.prod.outlook.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>
References: <1531833420-27175-1-git-send-email-rajan.vaja@xilinx.com>
 <153253683456.48062.11538822357721957211@swboyd.mtv.corp.google.com>
 <CY1PR02MB2091CE50B9163419EB7D67EFB72B0@CY1PR02MB2091.namprd02.prod.outlook.com>
Message-ID: <153261883266.48062.5136812490732432669@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH] clk: clk-fixed-factor: Clear OF_POPULATED flag in case of failure
Date: Thu, 26 Jul 2018 08:27:12 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajan Vaja (2018-07-26 06:03:16)
> Hi Stephen,
> =

> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: 25 July 2018 10:11 PM
> > To: Rajan Vaja <RAJANV@xilinx.com>; mturquette@baylibre.com
> > Cc: linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org; Rajan Vaja
> > <RAJANV@xilinx.com>
> > Subject: Re: [PATCH] clk: clk-fixed-factor: Clear OF_POPULATED flag in =
case of
> > failure
> > =

> > Quoting Rajan Vaja (2018-07-17 06:17:00)
> > > Fixed factor clock has two initializations at of_clk_init() time
> > > and during platform driver probe. Before of_clk_init() call,
> > > node is marked as populated and so its probe never gets called.
> > >
> > > During of_clk_init() fixed factor clock registration may fail if
> > > any of its parent clock is not registered. In this case, it doesn't
> > > get chance to retry registration from probe. Clear OF_POPULATED
> > > flag if fixed factor clock registration fails so that clock
> > > registration is attempted again from probe.
> > >
> > > Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> > > ---
> > >  drivers/clk/clk-fixed-factor.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-f=
actor.c
> > > index d72ef2d..f3ae4ff 100644
> > > --- a/drivers/clk/clk-fixed-factor.c
> > > +++ b/drivers/clk/clk-fixed-factor.c
> > > @@ -177,8 +177,15 @@ static struct clk *_of_fixed_factor_clk_setup(st=
ruct
> > device_node *node)
> > >
> > >         clk =3D clk_register_fixed_factor(NULL, clk_name, parent_name=
, flags,
> > >                                         mult, div);
> > > -       if (IS_ERR(clk))
> > > +       if (IS_ERR(clk)) {
> > > +               /*
> > > +                * If parent clock is not registered, registration wo=
uld fail.
> > > +                * Clear OF_POPULATED flag so that clock registration=
 can be
> > > +                * attempted again from probe function.
> > > +                */
> > > +               of_node_clear_flag(node, OF_POPULATED);
> > >                 return clk;
> > > +       }
> > =

> > BTW, this patch was seriously mangled for me so I had to apply it by
> > hand. Please be more careful next time and consider using something like
> > git-send-email and git-format-patch to send patches.
> [Rajan] I used git-send-email only and sent same way as I used to send ot=
her patches. Not sure where was issue.
> Sorry for the inconvenience.  =

> =


It must be your Outlook server messing things up. I see
Content-Transfer-Encoding: quoted-printable in the headers, which
probably caused my MUA to choke and line break things in the wrong
place.
