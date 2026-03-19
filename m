Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D237D105;
	Thu, 19 Mar 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912953; cv=none; b=d+UpYiAHYaoEYGBn2PWS0Cf+XqfeOx8Z8eOmafSnlLxdjm5x3WeMOuVYO323Lnba9x1MKvd4XybdJ4Jq99cKQ51xNXhCEyjjpZpuJJnoQqBlm3r5uyyZ1TLsx1qHG46gCAyAS0Zh/ij8gBHz8LmegsGNCo3ki2U6mh9QXR4khvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912953; c=relaxed/simple;
	bh=gmjk8HbtVWu0mZgcZupL6S26ZtqgRWwAXVCaLnAwvTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy/qKR3YNZP60YuW5Z7PKk9d5QFKXb8h7gWfl676tY41RNRjolt7uZAUcs2hfbDRlWHpLrCqzqG92OGcyoRKUnV5ASYCg1nxz1xpJCXCBVZkuNRfJG02dxY7TdU4+bSsmLGggwhHGoC+ExvsJSlHHwbk9BGbBLEkdvZbAKSg3ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOL9qcJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOL9qcJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D94C2BC87;
	Thu, 19 Mar 2026 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912952;
	bh=gmjk8HbtVWu0mZgcZupL6S26ZtqgRWwAXVCaLnAwvTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aOL9qcJjRNZjaAquBbQaBPwGfl0JrA2fUFZRyYfg90pJlWlcnqh0KFkplG0ygxTLl
	 d5eIqj9aGHUwmGy/N/33EDJEm1z8UBQ9Z/tp6DMoHpg0MKSqtDlxHVieRX08yWnMWj
	 x5RqEmrAJFREheq6M2+Fn/qichJ+mZf+UUhexqY7h4giCDW8j/QQsyg3Noy/M4YBjk
	 OM9GYmyLSIUsrWK4EYkxvMkIUttIT2bvbjd8sRhyrNp67x1+n/8DN6AfCug0hZIQL8
	 5KhDY53anaj5JkTBnEXDLofamJu1dtgiHCAO5onxvsXn898fs098Q3i82hGooI/iPr
	 XbPGH1ZFem7WQ==
Date: Thu, 19 Mar 2026 10:35:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
Message-ID: <20260319-quaint-coati-of-genius-9ffc0c@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ajknnrtl37efz7ij"
Content-Disposition: inline
In-Reply-To: <20260313-clk-scaling-v6-5-ce89968c5247@redhat.com>


--ajknnrtl37efz7ij
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/7] clk: introduce new flag CLK_V2_RATE_NEGOTIATION
 for sensitive clocks
MIME-Version: 1.0

On Fri, Mar 13, 2026 at 12:43:12PM -0400, Brian Masney wrote:
> As demonstrated by the kunit tests, clk_calc_subtree() in the clk core
> can overwrite a sibling clk with the parent rate. Clocks that are used
> for some subsystems like DRM and sound are particularly sensitive to
> this issue.
>=20
> I consider this to be a logic bug in the clk subsystem, however this
> functionality has existed since the clk core was introduced with
> commit b2476490ef11 ("clk: introduce the common clock framework"),
> and some boards are unknowingly dependent on this behavior.
>=20
> Let's add support for a v2 rate negotiation logic that addresses the
> logic error. Clks can opt into this new behavior by adding the flag
> CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
> parameter clk_v2_rate_negotiation.
>=20
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk.c            | 70 ++++++++++++++++++++++++++++++++++++--=
------
>  include/linux/clk-provider.h |  3 ++
>  2 files changed, 60 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 051fe755e3bf1b0a06db254b92f8a02889456db9..64c6de5ff5df2117b8d1aca66=
3d40b41d974bf92 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -886,6 +886,43 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw =
*hw, struct clk_hw *requesti
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_children_lcm);
> =20
> +static bool clk_v2_rate_negotiation_enabled;
> +static int __init clk_v2_rate_negotiation_setup(char *__unused)
> +{
> +	clk_v2_rate_negotiation_enabled =3D true;
> +	return 1;
> +}
> +__setup("clk_v2_rate_negotiation", clk_v2_rate_negotiation_setup);
> +
> +/**
> + * clk_has_v2_rate_negotiation - Check if a clk should use v2 rate negot=
iation
> + * @core: The clock core to check
> + *
> + * This function recursively checks if the clk or any of its descendants=
 have
> + * the CLK_V2_RATE_NEGOTIATION flag set. The v2 behavior can also be ena=
bled
> + * globally by adding clk_v2_rate_negotiation to the kernel command line.
> + *
> + * Returns: true if the v2 logic should be used; false otherwise
> + */
> +bool clk_has_v2_rate_negotiation(const struct clk_core *core)
> +{
> +	struct clk_core *child;
> +
> +	if (clk_v2_rate_negotiation_enabled)
> +		return true;
> +
> +	if (core->flags & CLK_V2_RATE_NEGOTIATION)
> +		return true;
> +
> +	hlist_for_each_entry(child, &core->children, child_node) {
> +		if (clk_has_v2_rate_negotiation(child))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(clk_has_v2_rate_negotiation);
> +

Do we really need to export it? I'd expect it to be abstracted away for
consumers and providers?

Maxime

--ajknnrtl37efz7ij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabvDdQAKCRAnX84Zoj2+
dgYtAX96YFCsHz7dCs8DlSCVPB6VfOivtGV7JyBV+Zv4ZZGrd8fVfJjoweRydOqE
YvMwWRIBgKgL5/iRELSuD2b3fNcNmSSpLxiMuNwe/h5cieXZETp9Qocm9cmpDFob
12+w2bnDLg==
=fm03
-----END PGP SIGNATURE-----

--ajknnrtl37efz7ij--
