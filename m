Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6878F4F;
	Fri, 20 Mar 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017219; cv=none; b=BC+oBvFOXgS1D6GgXL494+ZTH+Snnh8e1jRaaxdC+sqc0f7O7xFGJ0L1BR/TZg0FUJq318P8hNOBzvpZdo9H5RdfqNcUu0+EPUwCrUSBNWisT2FYV9mIVYvWdlgPvSpzNjvV/GxhNo1P3ERAqknTrGo2AwZIveVI43lVTnMeJhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017219; c=relaxed/simple;
	bh=GgD9I0qcKlAD+y/lnh9Qb0pu+I5qS9QoeBMjzasf0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIEcrWlK4pe5rms11F3ntf45uwMjbaulOStf0N+PrN1tAy3eEEQM8pE8GJ0YQQ8pghOPPNFWS4ZNYBBBA5K9ncbnizEqeud5bfHifHxy9WGSeEzemP/yor3SuLZ9lexZS1PjgSpfhm6lNCuOp2poFf4B4Kk7FiOGeHulwCB/FWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oG9YXY4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oG9YXY4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6439C4CEF7;
	Fri, 20 Mar 2026 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017219;
	bh=GgD9I0qcKlAD+y/lnh9Qb0pu+I5qS9QoeBMjzasf0AU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oG9YXY4FmI/2TLUi2aLd37x6p3qx6HEGyJ6H7LPYnBg8E+Rqn7S8jnOuaW7TFWs0S
	 VgD+j/XzEPQa1zcEPPFGLjI4JtmTo4U55Ra/tPffHT3ylR714rv0u8EaNhjVK6zznf
	 2DHSWQrX8y2rOBjR0anJj0zxzPCx+MwmK8TBPkmRIs78Zqc3yarlJymfl0cUbeXs/k
	 k2XygY/RhlUmOTvjA/N5oJRU6laf+cH2CsIqX15Z+y9aGxXrbwzQdergRpN5pc9xnS
	 0//j8ANsfmMu/Um7g2sWxBbAFyQA9FmobsySQLUfhZbG0/W68YTmf6OeTJQeloFrNZ
	 7e0hsdCtKBwFw==
Date: Fri, 20 Mar 2026 15:33:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
Message-ID: <20260320-accomplished-wrasse-of-temperance-5806e6@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>
 <20260319-quaint-coati-of-genius-9ffc0c@houat>
 <CABx5tq+JiJVYaWyBSh=-R8Ymb-8pJdTB6U5KKb2he5SyvBQHqw@mail.gmail.com>
 <20260320-amiable-amazing-armadillo-f48820@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="yarjgfto746fkwdh"
Content-Disposition: inline
In-Reply-To: <20260320-amiable-amazing-armadillo-f48820@houat>


--yarjgfto746fkwdh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
MIME-Version: 1.0

On Fri, Mar 20, 2026 at 03:31:41PM +0100, Maxime Ripard wrote:
> On Thu, Mar 19, 2026 at 06:35:56AM -0400, Brian Masney wrote:
> > On Thu, Mar 19, 2026 at 5:35=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Fri, Mar 13, 2026 at 12:43:12PM -0400, Brian Masney wrote:
> > > > As demonstrated by the kunit tests, clk_calc_subtree() in the clk c=
ore
> > > > can overwrite a sibling clk with the parent rate. Clocks that are u=
sed
> > > > for some subsystems like DRM and sound are particularly sensitive to
> > > > this issue.
> > > >
> > > > I consider this to be a logic bug in the clk subsystem, however this
> > > > functionality has existed since the clk core was introduced with
> > > > commit b2476490ef11 ("clk: introduce the common clock framework"),
> > > > and some boards are unknowingly dependent on this behavior.
> > > >
> > > > Let's add support for a v2 rate negotiation logic that addresses the
> > > > logic error. Clks can opt into this new behavior by adding the flag
> > > > CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
> > > > parameter clk_v2_rate_negotiation.
> > > >
> > > > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > > > Link: https://lpc.events/event/19/contributions/2152/
> > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > ---
> > > >  drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++=
++++--------
> > > >  include/linux/clk-provider.h |  3 ++
> > > >  2 files changed, 60 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d=
1aca663d40b41d974bf92 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct c=
lk_hw *hw, struct clk_hw *requesti
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
> > > >
> > > > +static bool clk_v2_rate_negotiation_enabled;
> > > > +static int __init clk_v2_rate_negotiation_setup(char *__unused)
> > > > +{
> > > > +     clk_v2_rate_negotiation_enabled =3D true;
> > > > +     return 1;
> > > > +}
> > > > +__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
> > > > +
> > > > +/**
> > > > + * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate=
 negotiation
> > > > + * @core: The clock core to check
> > > > + *
> > > > + * This function recursively checks if the clk or any of its desce=
ndants have
> > > > + * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also =
be enabled
> > > > + * globally by adding clk_v2_rate_negotiation to the kernel comman=
d line.
> > > > + *
> > > > + * Returns: true if the v2 logic should be used; false otherwise
> > > > + */
> > > > +bool clk_has_v2_rate_negotiation(const struct clk_core *core)
> > > > +{
> > > > +     struct clk_core *child;
> > > > +
> > > > +     if (clk_v2_rate_negotiation_enabled)
> > > > +             return true;
> > > > +
> > > > +     if (core->flags & CLK_V2_RATE_NEGOTIATION)
> > > > +             return true;
> > > > +
> > > > +     hlist_for_each_entry(child, &core->children, child_node) {
> > > > +             if (clk_has_v2_rate_negotiation(child))
> > > > +                     return true;
> > > > +     }
> > > > +
> > > > +     return false;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
> > > > +
> > >
> > > Do we really need to export it? I'd expect it to be abstracted away f=
or
> > > consumers and providers?
> >=20
> > This is abstracted away for the consumers, however the provider needs
> > to be aware if it wants to support the v2 logic. Patch 6 of this
> > series that adds support to clk-divider.c uses this export. Well
> > technically clk-divider.c is built with CONFIG_COMMON_CLK, however
> > other clk providers that want to use v2 logic will need this export.
> >=20
> > The way I see it is that there are provider-specific things that need
> > to change if the v2 logic is used. For instance, the current behavior
> > of clk-divider.c is that when CLK_V2_RATE_NEGOTIATION is set, the
> > parent rate is just set to the new desired child rate, without taking
> > into account any of the sibling rates. We need to keep this behavior
> > for the v1 logic for existing boards. Moving this to the clk core
> > won't work since it doesn't know what kind of clock this is. Maybe
> > some need to compute the LCM, others may need the GCD, some may need
> > something else possibly. Some of the existing providers will need to
> > change to support this.
> >=20
> > Now if we decided to not support the v1 logic, and just go all on on
> > v2 logic everywhere, then we won't need this export, and can just
> > update the providers.
>=20
> Yeah... If we take a step back, in your previous version, we were
> reworking the entire rate propagation logic, which was potentially
> pretty hard to test and not easy to do a partial test and opt-in for.
>=20
> With your current work, you have a clock flag that does the opt-in on a
> clock by clock basis which makes it much easier to enable, and also
> wouldn't create any unforeseen side-effects.
>=20
> So I'm not sure we need the module parameter now.

I'd even think it makes it *harder* to test since now you have to test
two combinations for each clock you convert instead of one (with one
being unlikely to happen). It's something that would be easily
overlooked, and	would receive less real-world testing as well.

Maxime

--yarjgfto746fkwdh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab1awAAKCRAnX84Zoj2+
dvqoAYCcVNsc2ehEFQac1anU9KloesX2hBxPmVZUqdEQeV0N0y5bjLdUJzwuwEtR
I4oDFH4BgJn4jhjmC6Q4ScJilJDMMBDrE5tNhYimKI9N7VwtTsHiNvhUyIU/tLit
nr4PpSdMiA==
=6hqK
-----END PGP SIGNATURE-----

--yarjgfto746fkwdh--
