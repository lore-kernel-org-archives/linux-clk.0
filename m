Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE343A7F58;
	Fri, 20 Mar 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011802; cv=none; b=D+PClmsRE8NqCw6QN8P+zlMoKe6lqxHn22+VpV3Di46ohUP5nBgHN47mqGRTPzCk7Ub0hkcaFFcsjRaT8FVfkmjmeaqQxAkBWx/BgBakZalndApn3PvANEpXsLlhx32sz+8ukZKuOgKZNhz8bsn001ky2fUZuk8ZeE5QkWaymao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011802; c=relaxed/simple;
	bh=gQm5vxPMl5xWdMWuNPad9B1rdxf6Hpx1/KSMUL+FRhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDQzaJPsmBTLeKV1vBx1uzEL2R4Hwlu8zvWdgQVuFbZcEmYXTpgWEFa8bS5SS57RnEg7hvtKW0l2cxL0VLltKL8H/MEQyNSoO2oNbI/Ao6ZP6nuv7tbAaJOorwcNwguAeRa3xaJJ3TAgiXD8QTPQObw2ITZ1YYoYlXw0E6aefTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXDp8C/T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXDp8C/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B4AC4CEF7;
	Fri, 20 Mar 2026 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774011802;
	bh=gQm5vxPMl5xWdMWuNPad9B1rdxf6Hpx1/KSMUL+FRhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXDp8C/T1WihMZRWh43Q7sONsVvbz+B8lE+RlvSt3gVV1Nx6zCchYZ0qzUiCCxetz
	 iBumUu8Ko+1Ufpn57RirH7i1iw/Sqbi5/IZ5XYRr0PJX41YENmn9O2g1vtrMXjZgsq
	 AeM75n6B1qSITHAQe1BNNKEweTxl2mfNcvXG15drJD9zs3g9j3/qF3jgySl527OPmy
	 oLmUxkOfIhLRy7/jSOsogb2NRUpAPrEDjWDo5qBb4J6yJsctqYznu93lsssFyBO8h3
	 H+gfCw7aa93o0f2jfntT68pO+piAf4OKy6n4WaUWdiUzUc99leuy2pdikFvFiDiY9S
	 moiNhnACBMXwQ==
Date: Fri, 20 Mar 2026 14:03:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
Message-ID: <20260320-daring-smiling-sturgeon-fbac05@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com>
 <20260319-spry-incredible-dinosaur-e2d9da@houat>
 <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rckstb634smoqihj"
Content-Disposition: inline
In-Reply-To: <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com>


--rckstb634smoqihj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
MIME-Version: 1.0

On Thu, Mar 19, 2026 at 07:08:07AM -0400, Brian Masney wrote:
> On Thu, Mar 19, 2026 at 5:10=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> > > Introduce a kunit test suite that demonstrates the current behavior
> > > of how a clock can unknowingly change the rate of it's siblings. Some
> > > boards are unknowingly dependent on this behavior, and per discussions
> > > at the 2025 Linux Plumbers Conference in Tokyo, we can't break the
> > > existing behavior. So let's add kunit tests with the current behavior
> > > so that we can be made aware if that functionality changes in the
> > > future.
> > >
> > > The tests in this commit use the following simplified clk tree with
> > > the initial state:
> > >
> > >                      parent
> > >                      24 MHz
> > >                     /      \
> > >               child1        child2
> > >               24 MHz        24 MHz
> > >
> > > child1 and child2 both divider-only clocks that have CLK_SET_RATE_PAR=
ENT
> > > set, and the parent is capable of achieving any rate.
> > >
> > > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > > Link: https://lpc.events/event/19/contributions/2152/
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > >  drivers/clk/clk_test.c | 146 +++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  1 file changed, 146 insertions(+)
> > >
> > > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > > index 88e35f4419c958983578750356a97c0a45effb55..325da7c84ab2ecdcf6b7a=
023ce4c2c4ef2d49862 100644
> > > --- a/drivers/clk/clk_test.c
> > > +++ b/drivers/clk/clk_test.c
> > > @@ -7,6 +7,7 @@
> > >  #include <linux/clk/clk-conf.h>
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/units.h>
> > >
> > >  /* Needed for clk_hw_get_clk() */
> > >  #include "clk.h"
> > > @@ -652,6 +653,150 @@ clk_multiple_parents_mux_test_suite =3D {
> > >       .test_cases =3D clk_multiple_parents_mux_test_cases,
> > >  };
> > >
> > > +struct clk_rate_change_sibling_div_div_context {
> > > +     struct clk_dummy_context parent;
> > > +     struct clk_dummy_div child1, child2;
> > > +     struct clk *parent_clk, *child1_clk, *child2_clk;
> > > +};
> > > +
> > > +struct clk_rate_change_sibling_div_div_test_param {
> > > +     const char *desc;
> > > +     const struct clk_ops *ops;
> > > +     unsigned int extra_child_flags;
> > > +};
> > > +
> > > +static const struct clk_rate_change_sibling_div_div_test_param
> > > +clk_rate_change_sibling_div_div_test_regular_ops_params[] =3D {
> > > +     {
> > > +             .desc =3D "regular_ops",
> > > +             .ops =3D &clk_dummy_div_ops,
> > > +             .extra_child_flags =3D 0,
> > > +     },
> > > +};
> > > +
> > > +KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_=
ops,
> > > +                    clk_rate_change_sibling_div_div_test_regular_ops=
_params, desc)
> > > +
> > > +static int clk_rate_change_sibling_div_div_test_init(struct kunit *t=
est)
> > > +{
> > > +     const struct clk_rate_change_sibling_div_div_test_param *param =
=3D test->param_value;
> > > +     struct clk_rate_change_sibling_div_div_context *ctx;
> > > +     int ret;
> > > +
> > > +     ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > > +     if (!ctx)
> > > +             return -ENOMEM;
> > > +     test->priv =3D ctx;
> > > +
> > > +     ctx->parent.hw.init =3D CLK_HW_INIT_NO_PARENT("parent", &clk_du=
mmy_rate_ops, 0);
> > > +     ctx->parent.rate =3D 24 * HZ_PER_MHZ;
> > > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ctx->child1.hw.init =3D CLK_HW_INIT_HW("child1", &ctx->parent.h=
w,
> > > +                                          param->ops,
> > > +                                          CLK_SET_RATE_PARENT | para=
m->extra_child_flags);
> > > +     ctx->child1.div =3D 1;
> > > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ctx->child2.hw.init =3D CLK_HW_INIT_HW("child2", &ctx->parent.h=
w,
> > > +                                          param->ops,
> > > +                                          CLK_SET_RATE_PARENT | para=
m->extra_child_flags);
> > > +     ctx->child2.div =3D 1;
> > > +     ret =3D clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ctx->parent_clk =3D clk_hw_get_clk(&ctx->parent.hw, NULL);
> > > +     ctx->child1_clk =3D clk_hw_get_clk(&ctx->child1.hw, NULL);
> > > +     ctx->child2_clk =3D clk_hw_get_clk(&ctx->child2.hw, NULL);
> > > +
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PE=
R_MHZ);
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PE=
R_MHZ);
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PE=
R_MHZ);
> >
> > I think we should move those expectations (assertions, really) to the
> > drivers. It will make it much clearer what the individual test relies on
> > and why it makes sense.
>=20
> Agreed. I will do that in the next version.
>=20
> >
> > > +     return 0;
> > > +}
> > > +
> > > +static void clk_rate_change_sibling_div_div_test_exit(struct kunit *=
test)
> > > +{
> > > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->p=
riv;
> > > +
> > > +     clk_put(ctx->parent_clk);
> > > +     clk_put(ctx->child1_clk);
> > > +     clk_put(ctx->child2_clk);
> > > +}
> > > +
> > > +/*
> > > + * Test that, for a parent with two divider-only children with CLK_S=
ET_RATE_PARENT set
> > > + * and one requests a rate compatible with the existing parent rate,=
 the parent and
> > > + * sibling rates are not affected.
> > > + */
> > > +static void clk_test_rate_change_sibling_div_div_1(struct kunit *tes=
t)
> > > +{
> > > +     struct clk_rate_change_sibling_div_div_context *ctx =3D test->p=
riv;
> > > +     int ret;
> > > +
> > > +     ret =3D clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
> > > +     KUNIT_ASSERT_EQ(test, ret, 0);
> > > +
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PE=
R_MHZ);
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER=
_MHZ);
> > > +     KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
> > > +     KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PE=
R_MHZ);
> > > +     KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
> > > +}
> >
> > That's not something the clock framework guarantees at all.
> > divider_determine_rate does, but I'm not even sure it's something it
> > guarantees. It's not documented anywhere at least.
> >
> > Plenty of drivers do not work that way though and will just forward
> > their rate request to the parent if CLK_SET_RATE_PARENT is set. Maybe
> > that's a problem of its own, idk.
> >
> > Anyway, what I'm trying to say at least is that, at least, we shouldn't
> > frame it as a guarantee the framework provides, because it's really not
> > the case.
>=20
> I see what you are saying, however these are divider tests, and this
> is the way that clk-divider works.

Yes, this is an undocumented behaviour of *clk-divider*. clk-divider is
not the only divider implementation. If anything, it's the reference
implementation, but that's pretty much it.

So when you say:

> +/*
> + * Test that, for a parent with two divider-only children with CLK_SET_R=
ATE_PARENT set
> + * and one requests a rate compatible with the existing parent rate, the=
 parent and
> + * sibling rates are not affected.
> + */

And

> I want to demonstrate that the clk core is being called, and that
> ultimately the correct dividers are computed.

This is only true for one implementation, and so far has been considered
an implementation detail. It's not something you can generalize.

And to make my point clearer, I wasn't saying this test shouldn't be
there, I was saying we shouldn't do and document that generalization.

> For example, on patch 7 of this series:
>=20
> - Parent, child1 and child2 all start out at 24 MHz.
> - child1 requests 32 MHz.
> - Parent is changed to 96 MHz, child1 at 32 MHz, child2 stays at 24 MHz.
>=20
> Child2 keeps the same rate, however the tests show that the clk is
> actually updated since the divider is changed from 1 to 4 after this
> operation. This is to simulate what would be programmed into a
> register for real hardware.
>=20
> I can drop the expects for the dividers if you really want in the next
> version. Personally, I see value since these are divider-specific
> tests.

Not really, these tests are clk-divider tests, nothing more.

Maxime

--rckstb634smoqihj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab1FkwAKCRAnX84Zoj2+
dlXCAX9YpNNXCjYvfa6Q63my4tkp9n5/GJ8ij6uX0eXin2IMRRcPZjQl2ecYGt1j
fUgYUZYBgLbbf+l45dU2kT6ciCnNNlPK7KVfZPmVWRMR0DUWmOiv8xkT/q0oXZsa
PNQEKNXrCQ==
=H/sc
-----END PGP SIGNATURE-----

--rckstb634smoqihj--
