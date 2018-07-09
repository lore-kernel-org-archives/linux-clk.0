Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajan Vaja <RAJANV@xilinx.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CY1PR02MB2091426610FC0037BB9EF61BB7670@CY1PR02MB2091.namprd02.prod.outlook.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jolly Shah <JOLLYS@xilinx.com>, Michal Simek <michals@xilinx.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>
References: <1520518500-5500-1-git-send-email-rajanv@xilinx.com>
 <152061989141.26240.15533446439693285034@swboyd.mtv.corp.google.com>
 <SN4PR0201MB3502AC253C8B1C9E57A83B7FB7DE0@SN4PR0201MB3502.namprd02.prod.outlook.com>
 <152113963269.111154.10395846178696174140@swboyd.mtv.corp.google.com>
 <SN4PR0201MB35029B265E608A24130BFEE2B7D70@SN4PR0201MB3502.namprd02.prod.outlook.com>
 <CY1PR02MB20914DBB65A193DED2BEED92B7870@CY1PR02MB2091.namprd02.prod.outlook.com>
 <152792163637.225090.8916381060805852261@swboyd.mtv.corp.google.com>
 <CY1PR02MB2091426610FC0037BB9EF61BB7670@CY1PR02MB2091.namprd02.prod.outlook.com>
Message-ID: <153112117357.143105.12822043691712705626@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH] clk: clk-fixed-factor: Use new macro CLK_OF_DECLARE_DRIVER
Date: Mon, 09 Jul 2018 00:26:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajan Vaja (2018-06-03 20:41:27)
> > > > > > On the other hand, even if registration failed, that node will =
be
> > > > > > marked as OF_POPULATED, so probe of clk-fixed-factor.c will als=
o not
> > > > > > be called and that DT fixed-factor clock would never be registe=
red.
> > > > > >
> > > > > > Same thing is discussed at  https://lkml.org/lkml/2017/6/5/681 .
> > > > >
> > > > > Ok. I believe the answer is to fix the DT to describe the parent =
chain
> > > > > properly with clock-output-names. Otherwise, we have no good way =
of
> > > > > figuring out what the name should be.
> > > > [Rajan] clock DT binding doc says that clock-output-names property
> > > > is optional and sometimes not recommended.
> > > > I think this patch fixes the issue we have which mandates to add cl=
ock-
> > output-
> > > > names
> > > > property (for this particular case). Also, IIUC platform driver pro=
be in clk-
> > fixed-
> > > > factor.c
> > > > will never be called unless we use CLK_OF_DECLARE_DRIVER.
> > > > I completely agree that proper solution would be to stop using stri=
ngs to
> > > > describe clock topology.
> > > [Rajan] Any comments on this?
> > > Unless we have proper solution ready, we need to have some mechanism =
to
> > handle this scenario.
> > > clock-output-names is optional and without this, it mandates to use c=
lock-
> > output-names.
> > >
> > =

> > I couldn't read your outlook sent email and I was too busy to go
> > translate it. Some bug in my MUA it seems.
> > =

> > Can you add the output-names property? In this case it's practically
> > mandatory, so if you can't do it I'd like to hear why not.
> [Rajan] In our case, we are firmware maintains clock database and driver =
query clocks
> from firmware and registers clock based on information received from firm=
ware. So
> output clock names are not fixed. =

> https://patchwork.kernel.org/patch/10439893/ - dt-bindings: clock: Add bi=
ndings for ZynqMP clock driver
> https://patchwork.kernel.org/patch/10439891/ - drivers: clk: Add ZynqMP c=
lock driver

output-names are fixed by the time firmware is made. Is the DT also
fixed by the time firmware is made? Why can't the DT be made to match
what the firmware is describing by having the firmware update the DT to
describe it's output names?

And what is this fixed factor clk in DT for?

I'm beginning to think that maybe we should make the fixed factor setup
a little worse by having it unmark itself as OF_POPULATED if it finds
that the DT node has a clocks property that it can't find a name for.
Hopefully we can get by with it registering later on because it isn't
critical for the system to bootstrap interrupts and timers.

I take it you understand that changing the code to be
CLK_OF_DECLARE_DRIVER will be actively bad and cause the clk to be
registered potentially twice so we really need to fix the real issue
which is that the parent name can't be figured out until later on, so
the CLK_OF_DECLARE path needs to fail when it can't find the parent it
needs and then manually mark itself as not populated in that case so
that it probes later on with the platform device driver. Unmarking the
node can actually be used to flag a failure in the init function so that
we don't keep trying to do things with the node until driver time too.
