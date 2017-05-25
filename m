Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Adriana Reus" <adi.reus@gmail.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1495532928.2344.14.camel@baylibre.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, "Kevin Hilman" <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
 <20170521215958.19743-3-jbrunet@baylibre.com>
 <CABjU8Gu_0xgto6UfaOofW1RjZkEQtbreqqBS2Ukd+Q0DLSZG8w@mail.gmail.com>
 <1495532928.2344.14.camel@baylibre.com>
Message-ID: <149573872145.52617.10663444060792708996@resonance>
Subject: Re: [PATCH v2 02/11] clk: add clk_core_set_phase_nolock function
Date: Thu, 25 May 2017 11:58:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-05-23 02:48:48)
> On Tue, 2017-05-23 at 12:35 +0300, Adriana Reus wrote:
> > On Mon, May 22, 2017 at 12:59 AM, Jerome Brunet <jbrunet@baylibre.com> =
wrote:
> > > Create a core function for set_phase, as it is done for set_rate and
> > > set_parent.
> > > =

> > > This rework is done to ease the integration of "protected" clock
> > > functionality.
> > > =

> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > > =C2=A0drivers/clk/clk.c | 31 +++++++++++++++++++------------
> > > =C2=A01 file changed, 19 insertions(+), 12 deletions(-)
> > > =

> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index f5c371532509..6031fada37f9 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1873,6 +1873,23 @@ int clk_set_parent(struct clk *clk, struct clk
> > > *parent)
> > > =C2=A0}
> > > =C2=A0EXPORT_SYMBOL_GPL(clk_set_parent);
> > > =

> > > +static int clk_core_set_phase_nolock(struct clk_core *core, int degr=
ees)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret =3D -EINVAL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!core)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase(clk->c=
ore, degrees);
> > =

> > =C2=A0^ trace_clk_set_phase(core, degrees)
> =

> Shame ... Once again this is a poor use of 'git add --patch'.
> This particular diff ended up in patch 5.
> =

> Thanks a lot for catching it!

Patch looks good to me overall. Can you reply here with V3? I'll apply
it to clk-next-protect for testing.

Regards,
Mike

> =

> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (core->ops->set_phase)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D core->ops->set_phase(core->hw, degrees);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase_comple=
te(core, degrees);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * clk_set_phase - adjust the phase shift of a clock signal
> > > =C2=A0 * @clk: clock signal source
> > > @@ -1895,7 +1912,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
> > > =C2=A0 */
> > > =C2=A0int clk_set_phase(struct clk *clk, int degrees)
> > > =C2=A0{
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret =3D -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!clk)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > @@ -1906,17 +1923,7 @@ int clk_set_phase(struct clk *clk, int degrees)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0degrees +=3D 360;
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_lock();
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase(clk->c=
ore, degrees);
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (clk->core->ops->set_ph=
ase)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk->core->ops->set_phase(clk->core->hw, de=
grees);
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_clk_set_phase_comple=
te(clk->core, degrees);
> > > -
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ret)
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0clk->core->phase =3D degrees;
> > > -
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D clk_core_set_phase=
_nolock(clk->core, degrees);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_prepare_unlock();
> > > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
> > > --
> > > 2.9.4
> > > =

> > > --
> > > To unsubscribe from this list: send the line "unsubscribe linux-clk" =
in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at=C2=A0=C2=A0http://vger.kernel.org/majordomo-in=
fo.html
>=20
