Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEC3126C7
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761305011; cv=none; b=IuDYzyah7VSuT3ecn8YaRndbe2bwlYdigkSJ76GLEPvRN1mnTPoikhcIpeTmP0QouIRHD0qQs5XyGcE3puJjdCERsinoe72Ni0aNPOkdrE41ydkBo0axODU0lHuuSJX3RYn2zy0hke2OseeMuC1Cr/O0R9kLExS6WEJF7+B49uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761305011; c=relaxed/simple;
	bh=adPMCoiXFPth0kI3ButVian0gxrLP/P89LWU0psUFF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnEjYGuesiU0sYAkFngRIZ/6cQH8IHiYCNKH2+QmSyPNKELk3jwZSyvXn8OSvYzcLaBRAGwOMD/Xz0G4RLiTAD1HmyNNj6Un7DXzqfM70O21rxlzVxkp8lhzZd/THuFfZhITeTBiAP5DSolQXZfJHiaHGfOJndmwuOWg7BCizqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stZVtXyM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stZVtXyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A496FC4CEF1;
	Fri, 24 Oct 2025 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761305011;
	bh=adPMCoiXFPth0kI3ButVian0gxrLP/P89LWU0psUFF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stZVtXyMzfql2czpvnoDk/Cq4AwE8gRRpvqHRpdoOsHb+6J0pavZ/NlpX5o5+rtGe
	 QSELcLbFpb1sKcRHE+iO69TW4Gp0ixNgUb+0fo5QDhiulr8c108FMQOglT/8BLxVQS
	 5LJskMsRZHtaBOtBEIsOn9ewBIZkQ05AlCmr9fuzAcJNb8KGf/yFTx2Z8cuAM7kmpi
	 vga+48IIVFETdglawx0yUvmjVHkjJrehq+C+LiciYtOD0sHgZEYOQhNQOl0qBRUc5m
	 CbzOJsHiCOyDQ/mDs0uhlb5Q8UVE0FhYKzU1ZGjfeLAGaidGbH87AoLcE2JUoBYauj
	 tjhrGy+J0xGqg==
Date: Fri, 24 Oct 2025 13:23:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, Michael Walle <mwalle@kernel.org>, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Message-ID: <3hqmv26wfxruow6aojtvthgxcxten2potzezbodkevugwrifjv@ppkxevw3awf7>
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
 <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com>
 <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
 <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
 <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="j4jaylbgcvwodppg"
Content-Disposition: inline
In-Reply-To: <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>


--j4jaylbgcvwodppg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
MIME-Version: 1.0

On Thu, Oct 23, 2025 at 05:55:45PM -0500, Randolph Sapp wrote:
> On Thu Oct 23, 2025 at 3:36 AM CDT, Maxime Ripard wrote:
> > On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
> >> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
> >> > Hi,
> >> >
> >> >>> Am I correct in my assumption about running clk_get_rate on unprep=
ared clocks
> >> >>> though? (That it shouldn't be allowed or, if it is, that the resul=
t shouldn't be
> >> >>> cached.)
> >> >>>
> >> >> Any follow up to this Michael? I wanted to be sure this was somethi=
ng the
> >> >> subsystem should allow before I look into further workarounds.
> >> >
> >> > I don't know. I'm not that familar with the ccs. My first reaction
> >> > was that it's asymmetrical that a .set is allowed (and works for
> >> > tisci) and that .get is not allowed. That way you can't read the
> >> > hardware clock (or think of a fixed clock, where you want to get the
> >> > frequency) before enabling it. I could imagine some devices which
> >> > needs to be configured first, before you might turn the clock on.
> >> >
> >> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
> >> > which clearly states that it's only valid if the clock is on.
> >> >
> >> > -michael
> >>=20
> >> Yeah, I still don't like the way we handle clock in firmware but I've =
already
> >> been shut down on that front.
> >>=20
> >> Regardless, there are quite a few drivers right now that use clk_get_r=
ate prior
> >> to preparing the clock. If the kdoc reports clk_get_rate is only valid=
 if the
> >> clock is enabled, should we report a proper warning when this occurs?
> >
> > It's more complicated than that.
> >
> > The clock API documentation mentions that, and the CCF is one
> > implementation of that API. It's now the dominant implementation, but
> > the CCF itself never mentioned or required it.
> >
> > And thus drivers started to rely on the CCF behaviour.
> >
> > Plus, leaving the documentation part aside, being able to call
> > clk_get_rate when the clock is disabled has value.
> >
> > How can you setup a clock before enabling it to avoid any frequency
> > change while the device operates otherwise?
>=20
> Why would enabling a clock change it's rate unless the current rate wasn't
> actually valid?

That's not what I said, and it's also not something that enable is
allowed to do anyway.

Consider this: the clock feeding a hardware component is out of its
operating range. You enable it. The device gets stuck. How do you
recover from that?

> I can only see a change explicitly occurring if the clock parent has
> decided that the associated rate was not acceptable.
>=20
> If some device always resets the rate when enabled, isn't that already
> problematic?

Resets the rate to what?

> > Or how do you make sure the clock is in its operating range and thus the
> > device *can* operate?
>=20
> Well, if enabling a clock doesn't change it's rate there's nothing stoppi=
ng
> people from enabling the clock prior to getting the rate.

The first thing clk_set_rate is doing is a clk_get_rate. If you want to
actually enforce a rule that hasn't been applied for 15y, go ahead, but
that means also mandating that you can only make clk_set_rate calls once
the clock has been enabled.

> > There's a reason people have started using it. And it might be
> > abstracted away by the firmware in some cases, but not all platforms use
> > a firmware, so you can't rely on that either.
>
> Thanks for taking the time to talk with me about this. I assume there is =
some
> specific thing that violates my understanding of how this should work, bu=
t I
> feel like things are too loosely defined as is.

I mean, I kind of agree, but also, the clock framework is newer and has
been more liberal than the clock API. And the clock framework is by far
the dominant implementation now, so I'm not sure what the big deal is.

Maxime

--j4jaylbgcvwodppg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaPthqAAKCRAnX84Zoj2+
duclAYDXT+0QPdbizyIr1i8S5x1RJ5aEQ3HU+5H2z1OrZxFXD6BiHBaapUmbJ70a
uo9tH8cBfiFhZtwFvr4I953IvDoeiNkV8GxjwTZUJvxzxZAQyXam6ttg2znnsi9B
uxQ2YCp8UA==
=PNIZ
-----END PGP SIGNATURE-----

--j4jaylbgcvwodppg--
