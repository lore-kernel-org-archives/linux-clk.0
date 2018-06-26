Return-Path: <miquel.raynal@bootlin.com>
Date: Tue, 26 Jun 2018 11:09:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume
 support
Message-ID: <20180626110918.35c13653@xps13>
In-Reply-To: <87in868202.fsf@bootlin.com>
References: <20180421142344.25944-1-miquel.raynal@bootlin.com>
	<20180421142344.25944-2-miquel.raynal@bootlin.com>
	<87in868202.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Gregory,

On Wed, 02 May 2018 18:18:37 +0200, Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> Hi Miquel,
> =20
>  On sam., avril 21 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Add suspend/resume hooks in Armada 37xx peripheral clocks driver to
> > handle S2RAM operations.
> >
> > One can think that these hooks are useless by comparing the register
> > values before and after a suspend/resume cycle: they will look the same
> > anyway. This is because of some scripts executed by the Cortex-M3 core
> > during ATF operations to init both the clocks and the DDR. These values
> > could be modified by the BL33 stage or by Linux itself and should be
> > preserved.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/clk/mvebu/armada-37xx-periph.c | 48 ++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu=
/armada-37xx-periph.c
> > index 723bb7f6cea1..cd560bdcb8a9 100644
> > --- a/drivers/clk/mvebu/armada-37xx-periph.c
> > +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> > @@ -59,6 +59,15 @@ struct clk_periph_driver_data {
> >  	struct clk_hw_onecell_data *hw_data;
> >  	spinlock_t lock;
> >  	void __iomem *reg;
> > +#if defined(CONFIG_PM)
> > +	/* Storage registers for suspend/resume operations */
> > +	u32 tbg_sel;
> > +	u32 div_sel0;
> > +	u32 div_sel1;
> > +	u32 div_sel2;
> > +	u32 clk_sel;
> > +	u32 clk_dis;
> > +#endif /* CONFIG_PM */
> >  };
> > =20
> >  struct clk_double_div {
> > @@ -642,6 +651,42 @@ static int armada_3700_add_composite_clk(const str=
uct clk_periph_data *data,
> >  	return PTR_ERR_OR_ZERO(*hw);
> >  }
> > =20
> > +#if defined(CONFIG_PM) =20
>=20
> I think you could get rid of this conditional code. Have a look on what
> is done in others drivers around DEV_PM_OPS and __maybe_unused.

Thanks for pointing it.

Actually most implementations do not use __maybe_unused but do
something like:

#if defined(CONFIG_PM)

static int xxx_pm_suspend() { ... }

static void xxx_pm_resume() { ... }

static struct pm_ops ops;
#define XXX_DEV_PM_OPS &ops
#else
#define XXX_DEV_PM_OPS NULL
#endif /* CONFIG_PM */=20

And then in the platform_driver structure:

        .pm =3D XXX_DEV_PM_OPS,

This way, the only #if/#endif is "out" of the current code and the
".pm =3D" line is free of preprocessor macros.

Thanks,
Miqu=C3=A8l
