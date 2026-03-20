Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D073AD522;
	Fri, 20 Mar 2026 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017101; cv=none; b=sxe/yC6gZjY7nbpqL/6xYi/tfJYYRtvIKzbLWrZyUl4PJsQJF9/lO9N4tKlsccguZym9HbcNN5LrhEQOswpLYC5V1t/lrLZBSkDQwK2NBf+cjxIlJRsh/P7qcoRspldM+JKCfL9K2N3nfaTEe6IOvtnZnNZDX9HuwpkSt21xYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017101; c=relaxed/simple;
	bh=FtyMqiDXPnPbybjxtOOJMEdCKlVYq392eaCmPagcc+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0/qO+VJkfMWELDNefnZyC7gu2jULox5i+MJ42t3JmmxM/cHE9PAnirxup8c1f5+gPydYdVis2k0k9FewQ4aww1cDhpW/vQJFgC7jS/NphBsLTP0jFjfg9pP+jBiGbDfd6dVp5syZkkXHSqcsZtyBNNbGhZJoKuRoYOj3mfnr6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdmVme4o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdmVme4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC27CC2BCAF;
	Fri, 20 Mar 2026 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017101;
	bh=FtyMqiDXPnPbybjxtOOJMEdCKlVYq392eaCmPagcc+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdmVme4ovvXBpolsZTXkhoI4R00T25Na/uILmRP8LFx3/7BAkR674zBpe97TDJ3rU
	 Ml5dDtID9JYpgRz9XPJ+EFblY5iS/UMNGykOwrpTeTIfdyh2i1N+Aw7vQOgX8HG/iX
	 gTZ4hhpQxKK8C9n8fQdoarr1YeaKnRzouFXxVjw2KrSypeMtH9ILALChSpebunpYoq
	 iI5Y7zCayzSktyHS/Gwg7ZsF23n/X5fBYI8pGxx32gcLEuMWheMDNjdkij3m2ZDpyM
	 Da02Nnrudb4qEyGgWNehfyKUi06zoiavFcTag/YMH5OktxpiatwGgLHOdhHuMVJCiM
	 XQfNcNBWUWf1Q==
Date: Fri, 20 Mar 2026 15:31:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
Message-ID: <20260320-amiable-amazing-armadillo-f48820@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>
 <20260319-quaint-coati-of-genius-9ffc0c@houat>
 <CABx5tq+JiJVYaWyBSh=-R8Ymb-8pJdTB6U5KKb2he5SyvBQHqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rrv4mkzdpj5pqrir"
Content-Disposition: inline
In-Reply-To: <CABx5tq+JiJVYaWyBSh=-R8Ymb-8pJdTB6U5KKb2he5SyvBQHqw@mail.gmail.com>


--rrv4mkzdpj5pqrir
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
MIME-Version: 1.0

On Thu, Mar 19, 2026 at 06:35:56AM -0400, Brian Masney wrote:
> On Thu, Mar 19, 2026 at 5:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Fri, Mar 13, 2026 at 12:43:12PM -0400, Brian Masney wrote:
> > > As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
> > > can overwrite a sibling clk with the parent rate. Clocks that are used
> > > for some subsystems like DRM and sound are particularly sensitive to
> > > this issue.
> > >
> > > I consider this to be a logic bug in the clk subsystem, however this
> > > functionality has existed since the clk core was introduced with
> > > commit b2476490ef11 ("clk: introduce the common clock framework"),
> > > and some boards are unknowingly dependent on this behavior.
> > >
> > > Let's add support for a v2 rate negotiation logic that addresses the
> > > logic error. Clks can opt into this new behavior by adding the flag
> > > CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
> > > parameter clk_v2_rate_negotiation.
> > >
> > > Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> > > Link: https://lpc.events/event/19/contributions/2152/
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > >  drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++++=
++--------
> > >  include/linux/clk-provider.h |  3 ++
> > >  2 files changed, 60 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d1a=
ca663d40b41d974bf92 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct clk=
_hw *hw, struct clk_hw *requesti
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
> > >
> > > +static bool clk_v2_rate_negotiation_enabled;
> > > +static int __init clk_v2_rate_negotiation_setup(char *__unused)
> > > +{
> > > +     clk_v2_rate_negotiation_enabled =3D true;
> > > +     return 1;
> > > +}
> > > +__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
> > > +
> > > +/**
> > > + * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate n=
egotiation
> > > + * @core: The clock core to check
> > > + *
> > > + * This function recursively checks if the clk or any of its descend=
ants have
> > > + * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also be=
 enabled
> > > + * globally by adding clk_v2_rate_negotiation to the kernel command =
line.
> > > + *
> > > + * Returns: true if the v2 logic should be used; false otherwise
> > > + */
> > > +bool clk_has_v2_rate_negotiation(const struct clk_core *core)
> > > +{
> > > +     struct clk_core *child;
> > > +
> > > +     if (clk_v2_rate_negotiation_enabled)
> > > +             return true;
> > > +
> > > +     if (core->flags & CLK_V2_RATE_NEGOTIATION)
> > > +             return true;
> > > +
> > > +     hlist_for_each_entry(child, &core->children, child_node) {
> > > +             if (clk_has_v2_rate_negotiation(child))
> > > +                     return true;
> > > +     }
> > > +
> > > +     return false;
> > > +}
> > > +EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
> > > +
> >
> > Do we really need to export it? I'd expect it to be abstracted away for
> > consumers and providers?
>=20
> This is abstracted away for the consumers, however the provider needs
> to be aware if it wants to support the v2 logic. Patch 6 of this
> series that adds support to clk-divider.c uses this export. Well
> technically clk-divider.c is built with CONFIG_COMMON_CLK, however
> other clk providers that want to use v2 logic will need this export.
>=20
> The way I see it is that there are provider-specific things that need
> to change if the v2 logic is used. For instance, the current behavior
> of clk-divider.c is that when CLK_V2_RATE_NEGOTIATION is set, the
> parent rate is just set to the new desired child rate, without taking
> into account any of the sibling rates. We need to keep this behavior
> for the v1 logic for existing boards. Moving this to the clk core
> won't work since it doesn't know what kind of clock this is. Maybe
> some need to compute the LCM, others may need the GCD, some may need
> something else possibly. Some of the existing providers will need to
> change to support this.
>=20
> Now if we decided to not support the v1 logic, and just go all on on
> v2 logic everywhere, then we won't need this export, and can just
> update the providers.

Yeah... If we take a step back, in your previous version, we were
reworking the entire rate propagation logic, which was potentially
pretty hard to test and not easy to do a partial test and opt-in for.

With your current work, you have a clock flag that does the opt-in on a
clock by clock basis which makes it much easier to enable, and also
wouldn't create any unforeseen side-effects.

So I'm not sure we need the module parameter now.

Maxime

--rrv4mkzdpj5pqrir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab1aSQAKCRAnX84Zoj2+
dr58AX0TTkBTO77vyBOBZpj499KdgHMytJIOYwQaD8LAlwSqHXL80A2YcBNAqkfR
A/k6FccBgI0JTUjEiEVcq9C2lzBIHRFhKGnVlYYf7KknGFYTFLrGZKLMMDRuiKZC
uzycN/QjVw==
=CmLx
-----END PGP SIGNATURE-----

--rrv4mkzdpj5pqrir--
