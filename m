Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0652EB5D4
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761728743; cv=none; b=hZoNN2aLzOCOFtJpWKr/6Zzd+cn3mKQpr/zIsofM/Z1ecCZK9o+zdy5CiPhrWMpaIsM80nP+i7yLpKQjEUaHMIEFcbIsvwHkY0iFrlkbZu+xRbGgf1bW8juJ6HhoVPbv6GQ+LSfE8ybQ0nTOucDT6XBq8YXftVAuKvoZ8rGDttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761728743; c=relaxed/simple;
	bh=MLPiXplqhNK43rhkrUCOGD7w2SDa0VYj/zPXr56KSOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHxF2ADE7mTLFgIpcJG6fyAy5cn98Q72fq58Y25Ok9H8JjsoBnCF5HrDTso8Z0TR4L0A1VoGOXp5W1Te2yx5gdZzZ0xS1yHhfjMZ25XE3meVHGodIjh4oOw/uRdma91VOhq1vLbgxmSaLqW5hU2pUJ7Cf2MpH2h2nw3iyryCUNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJLFdGJI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJLFdGJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AC1C4CEF7;
	Wed, 29 Oct 2025 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761728742;
	bh=MLPiXplqhNK43rhkrUCOGD7w2SDa0VYj/zPXr56KSOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJLFdGJIQYedq+wn5LHd5wuwVS5ZryBtundUkX/1/Q5BOj+YcGUOscuiq8CuaE2xJ
	 d3vI7kolRPY6OydrLJAhetBg7+W8Eyl9adDSNfJ3dzkxjuTcutwLtB2yD/b+mrPdcL
	 Yqf8PPSELnn6gma9UZiRpmU13hYuOFwv9juqzbUvakY/PzJuOXWyUF9t15E+bY+A7P
	 f0qsFEY1n7dlEcm+SjcwKvTnvya1oiEZa5sIOgSTxmH+MhXU0841noodc0qSRMhFin
	 4AcqkCklfLFI/4rO5v9O9URk0GpmVMXozNtnUPIy9y7+7oAKQDZ9xllixqHd1vG+fQ
	 JhG3geIaAx1rg==
Date: Wed, 29 Oct 2025 10:05:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, Michael Walle <mwalle@kernel.org>, mturquette@baylibre.com, 
	sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
Message-ID: <p35suwiji3bsf5ibe2s2f553ngveonyynlnharxqp6wn2jwmba@dgx2ahdlg2fs>
References: <20251003222917.706646-2-rs@ti.com>
 <DDJPIJGC8W1L.1BCHJEG3FO574@kernel.org>
 <DDKSRCG9J0MB.3NKE0JJWUWDTD@ti.com>
 <DDOCJEZSBJ1V.WPWWUAR7M1H9@ti.com>
 <DDOMVXFQ82CN.FJ0FMPGMTFPN@kernel.org>
 <DDP8GWMXBBTK.317J8GMC6JDH@ti.com>
 <6oalyicklokagq4lllhxpw7ipzvlzhg645pewbkueaz4zdr4uv@msu3w66ig27z>
 <DDQ2M53W798B.2SK01V6NUG2OU@ti.com>
 <3hqmv26wfxruow6aojtvthgxcxten2potzezbodkevugwrifjv@ppkxevw3awf7>
 <DDTI5QH69F47.392V8CW35LY60@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="aumrjrqzxqvzqcrt"
Content-Disposition: inline
In-Reply-To: <DDTI5QH69F47.392V8CW35LY60@ti.com>


--aumrjrqzxqvzqcrt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: do not trust cached rates for disabled clocks
MIME-Version: 1.0

On Mon, Oct 27, 2025 at 06:44:37PM -0500, Randolph Sapp wrote:
> On Fri Oct 24, 2025 at 6:23 AM CDT, Maxime Ripard wrote:
> > On Thu, Oct 23, 2025 at 05:55:45PM -0500, Randolph Sapp wrote:
> >> On Thu Oct 23, 2025 at 3:36 AM CDT, Maxime Ripard wrote:
> >> > On Wed, Oct 22, 2025 at 06:18:22PM -0500, Randolph Sapp wrote:
> >> >> On Wed Oct 22, 2025 at 1:23 AM CDT, Michael Walle wrote:
> >> >> > Hi,
> >> >> >
> >> >> >>> Am I correct in my assumption about running clk_get_rate on unp=
repared clocks
> >> >> >>> though? (That it shouldn't be allowed or, if it is, that the re=
sult shouldn't be
> >> >> >>> cached.)
> >> >> >>>
> >> >> >> Any follow up to this Michael? I wanted to be sure this was some=
thing the
> >> >> >> subsystem should allow before I look into further workarounds.
> >> >> >
> >> >> > I don't know. I'm not that familar with the ccs. My first reaction
> >> >> > was that it's asymmetrical that a .set is allowed (and works for
> >> >> > tisci) and that .get is not allowed. That way you can't read the
> >> >> > hardware clock (or think of a fixed clock, where you want to get =
the
> >> >> > frequency) before enabling it. I could imagine some devices which
> >> >> > needs to be configured first, before you might turn the clock on.
> >> >> >
> >> >> > OTOH Maxime pointed out the comment in the kdoc of clk_get_rate()
> >> >> > which clearly states that it's only valid if the clock is on.
> >> >> >
> >> >> > -michael
> >> >>=20
> >> >> Yeah, I still don't like the way we handle clock in firmware but I'=
ve already
> >> >> been shut down on that front.
> >> >>=20
> >> >> Regardless, there are quite a few drivers right now that use clk_ge=
t_rate prior
> >> >> to preparing the clock. If the kdoc reports clk_get_rate is only va=
lid if the
> >> >> clock is enabled, should we report a proper warning when this occur=
s?
> >> >
> >> > It's more complicated than that.
> >> >
> >> > The clock API documentation mentions that, and the CCF is one
> >> > implementation of that API. It's now the dominant implementation, but
> >> > the CCF itself never mentioned or required it.
> >> >
> >> > And thus drivers started to rely on the CCF behaviour.
> >> >
> >> > Plus, leaving the documentation part aside, being able to call
> >> > clk_get_rate when the clock is disabled has value.
> >> >
> >> > How can you setup a clock before enabling it to avoid any frequency
> >> > change while the device operates otherwise?
> >>=20
> >> Why would enabling a clock change it's rate unless the current rate wa=
sn't
> >> actually valid?
> >
> > That's not what I said, and it's also not something that enable is
> > allowed to do anyway.
> >
> > Consider this: the clock feeding a hardware component is out of its
> > operating range. You enable it. The device gets stuck. How do you
> > recover from that?
> >
> >> I can only see a change explicitly occurring if the clock parent has
> >> decided that the associated rate was not acceptable.
> >>=20
> >> If some device always resets the rate when enabled, isn't that already
> >> problematic?
> >
> > Resets the rate to what?
>=20
> Doesn't matter. The initial comment was about the rate changing when the =
clock
> was enabled. I said reset here because any change on power on would assum=
e some
> default state it was returning to.
>=20
> >> > Or how do you make sure the clock is in its operating range and thus=
 the
> >> > device *can* operate?
> >>=20
> >> Well, if enabling a clock doesn't change it's rate there's nothing sto=
pping
> >> people from enabling the clock prior to getting the rate.
> >
> > The first thing clk_set_rate is doing is a clk_get_rate. If you want to
> > actually enforce a rule that hasn't been applied for 15y, go ahead, but
> > that means also mandating that you can only make clk_set_rate calls once
> > the clock has been enabled.
>=20
> The clk_set_rate only runs clk_get_rate to see if any change needs to occ=
ur. If
> the clock isn't enabled then this is likely part of startup or resume. The
> likelihood of needing to change the rate in this scenario would be high a=
nyway.
>=20
> >> > There's a reason people have started using it. And it might be
> >> > abstracted away by the firmware in some cases, but not all platforms=
 use
> >> > a firmware, so you can't rely on that either.
> >>
> >> Thanks for taking the time to talk with me about this. I assume there =
is some
> >> specific thing that violates my understanding of how this should work,=
 but I
> >> feel like things are too loosely defined as is.
> >
> > I mean, I kind of agree, but also, the clock framework is newer and has
> > been more liberal than the clock API. And the clock framework is by far
> > the dominant implementation now, so I'm not sure what the big deal is.
>
> There's no big deal, I was curious if there was a consensus around clock
> initialization that could push this fix in a different direction.
>=20
> Considering there doesn't seem to be any consensus I'm fine with moving f=
orward
> with the initial cached rate workaround. I just need to rework it a bit t=
o cover
> the initial corner case outlined.

Don't get me wrong, I would like some clarification as well, but I guess
what I was trying to say is that clk_get_rate is such a mess when it
comes to what it's allowed to return or not already than trying to clean
up when it's allowed to be called is going to be a nightmare and you'll
break tons of platforms in the process.

Last time I tried, I ended up in a philosophical discussion with another
platform maintainer that went nowhere, and we ended up reverting the
patches.

So unless you get a maintainer that steps in and say what needs to be
done, and enforces it, my advice is you should workaround the issue.

Maxime

--aumrjrqzxqvzqcrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaQHY4wAKCRAnX84Zoj2+
duylAX9FmR/8u7apC+ag3I8sk0ayGUpoc0GD1qYbXr0/JmjJuXpcUPBdLcd4vQa9
CEpp0Z4BgJlG2NkY/8ihHOjJ79AVujZV1lZ0AOQuhm6pM2Kfn7GJ17j+5bWKZTKl
Az8LTLOVaQ==
=YMk2
-----END PGP SIGNATURE-----

--aumrjrqzxqvzqcrt--
