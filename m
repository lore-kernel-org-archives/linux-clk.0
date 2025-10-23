Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508CD2FE04C
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208584; cv=none; b=HoTICRSabrMp+49uWiqKVfc2PAahcg+R4CUrIy5gTOsBcFf27dmDFOkT4PVkzIsJgKnb+q3aZlVWq+vC/ORHhDxbuu97uLEa/oFrZ8sqLx5PAVs6VUJlyHQXuygErOJ/l5OMPUgvIbn2E/8cpRmDag+AbxpIO9sh5Av1hiIIsOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208584; c=relaxed/simple;
	bh=sXi7uSAfoREHQElRX95oXIfx3iJ/QHxib4esnJLRt8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8aEZlsDND89sRpswhPBoVCvsdT5DqwgT9I6ys+F5scbh+bzQMFwpPGfBiMHqMwHPyxqHBllfkFsKwgbs5KzpB4RSFErMJp66SHBtMT2GmQ/0pL7IrDj2cO27yoYrIGmJYA/v7S5o21ZW0S8jDjt9bLpQP/VliyMNHSt0x2nWAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwyCPLEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwyCPLEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42058C4CEFF;
	Thu, 23 Oct 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761208583;
	bh=sXi7uSAfoREHQElRX95oXIfx3iJ/QHxib4esnJLRt8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwyCPLEJMiL3zSWyAft40GYagZqMzkMl6FtDvKFOMvT1bASS457PAxcemmZABpIA/
	 Gsaxc2/mFGqCuPKwgsC0UxOryfbeI10nD/oEM2/YYpaOK3mUPisTkwP+FFmr5Da+V8
	 dwFxwFTbE8NWjr1rycC6kYtEfgGk9MB6PFv+a/7p4GrC96bf6oKHnrgexPwbVqMlSR
	 wNgJ5C2/roH28tr/oEpb2h6O7ux+SnhyNWLyb0pTR+HiauH+G1pz2jq9xVDdnN7ojJ
	 DkJ+dhqUvPTKTnS4mBR2VaKBHqVlCAZ8Bf1o4O7YqXbRFS9xvmk48wDDxEKsNdjOhE
	 7VIuT1nBWQeJA==
Date: Thu, 23 Oct 2025 10:36:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Randolph Sapp <rs@ti.com>
Cc: Michael Walle <mwalle@kernel.org>, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Message-ID: <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
 <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com>
 <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7ehylfon5326rdhn"
Content-Disposition: inline
In-Reply-To: <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>


--7ehylfon5326rdhn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
> > Hi,
> >
> >>> Am I correct in my assumption about running clk_get_rate on unprepare=
d clocks
> >>> though? (That it shouldn't be allowed or, if it is, that the result s=
houldn't be
> >>> cached.)
> >>>
> >> Any follow up to this Michael? I wanted to be sure this was something =
the
> >> subsystem should allow before I look into further workarounds.
> >
> > I don't know. I'm not that familar with the ccs. My first reaction
> > was that it's asymmetrical that a .set is allowed (and works for
> > tisci) and that .get is not allowed. That way you can't read the
> > hardware clock (or think of a fixed clock, where you want to get the
> > frequency) before enabling it. I could imagine some devices which
> > needs to be configured first, before you might turn the clock on.
> >
> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
> > which clearly states that it's only valid if the clock is on.
> >
> > -michael
>=20
> Yeah, I still don't like the way we handle clock in firmware but I've alr=
eady
> been shut down on that front.
>=20
> Regardless, there are quite a few drivers right now that use clk_get_rate=
 prior
> to preparing the clock. If the kdoc reports clk_get_rate is only valid if=
 the
> clock is enabled, should we report a proper warning when this occurs?

It's more complicated than that.

The clock API documentation mentions that, and the CCF is one
implementation of that API. It's now the dominant implementation, but
the CCF itself never mentioned or required it.

And thus drivers started to rely on the CCF behaviour.

Plus, leaving the documentation part aside, being able to call
clk_get_rate when the clock is disabled has value.

How can you setup a clock before enabling it to avoid any frequency
change while the device operates otherwise?

Or how do you make sure the clock is in its operating range and thus the
device *can* operate?

There's a reason people have started using it. And it might be
abstracted away by the firmware in some cases, but not all platforms use
a firmware, so you can't rely on that either.

Maxime

--7ehylfon5326rdhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPno/wAKCRAnX84Zoj2+
dt2VAX47kbL+hgmL7gU4UGjkvlFw7v/KNrWa24dSl3IL51fTMlO0fnDGyUKFZo7H
P8VfE+QBf2Ys4ksvul6VkG/ZzJSiduwI/aWsnUwtAZkVLs2p65ktZrZj6dpJcSCQ
ciLwrIkwVA==
=JHTJ
-----END PGP SIGNATURE-----

--7ehylfon5326rdhn--
