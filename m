Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E131017CA1F;
	Fri, 25 Oct 2024 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874848; cv=none; b=g0thBHsw55f5eMupH/1/rqFCg5Wk8lDQEB9haRz/d5C1G6DRnnr8bUMZu260yEbqnZtCIozCWUsN9fN5SzFL/IoA444CoTX5YiubUX+THnJjODmn4a4iP+Ykq9piLfY8EeA4f4Z3Hj8L07sf3Iul8+2LwZXusI75fqhXpUEQfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874848; c=relaxed/simple;
	bh=3pcgPLz8IX2AcU4gZj7E94MsDpK+Fi6/BvYheYjLe10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH7lHsCKKMkTwKt3d+8azpwXq2Xi0gICrLXzZVe+2ZdY72NJGvRzbHsH3H3+YzdAxjDqx8lkvSdMaVtIpExGlsYhO9eN9Pih5JVgJRLGZVjiK7vSR0c+vgI+uCVmG+2MBgdYbocYYT+7jCvlrgOOuYynj4NAWBunrX6B1ROQyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSGX+oRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSGX+oRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDDCC4CEC3;
	Fri, 25 Oct 2024 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729874847;
	bh=3pcgPLz8IX2AcU4gZj7E94MsDpK+Fi6/BvYheYjLe10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSGX+oRt+n5bGK/VVmNhAjNLrrnmP3e38qbwrsm+FRa6MqhuZZtu6g0D0NyM6Zimv
	 /iSunFSOVlo1+Ewhn06TLz7L3cfhz9qNwoHUrXVThz1WWR61uDR5WiWIq1DfkyZoCe
	 CPmzmyKqaq+Q6oPfBtzGtmI8rujqRLqxDRdpF1EWjvO6gJ8wCE4EX+/Fx0GllHq/Jp
	 aGq0QRwKPlhc30qk7x6+5nXh1t2LG7y0A9jDbYflqF7WpfVX30kujeKzXVAFZxulVk
	 /RW1vMK7PBugg6UeE6wGYzf8imGwirY/PKCpWkqB/o1ZV6+nmP1mHUA+jXEXB3kkXS
	 yqrcNuTroHlfQ==
Date: Fri, 25 Oct 2024 17:47:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Message-ID: <20241025-numerate-quirk-b622c5acdacc@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
 <20241023-tucking-pacific-7360480bcb61@spud>
 <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
 <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
 <8b853ad3964cd2b7dafc225d4037ddbf11ebb2d3.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9vKNs41rCsrdUECp"
Content-Disposition: inline
In-Reply-To: <8b853ad3964cd2b7dafc225d4037ddbf11ebb2d3.camel@gmail.com>


--9vKNs41rCsrdUECp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 08:56:34AM +0200, Nuno S=E1 wrote:
> On Thu, 2024-10-24 at 17:13 +0100, Conor Dooley wrote:
> > On Thu, Oct 24, 2024 at 02:35:37PM +0200, Nuno S=E1 wrote:
> > > On Wed, 2024-10-23 at 17:30 +0100, Conor Dooley wrote:
> > > > On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> > > > > In order to access the registers of the HW, we need to make sure =
that
> > > > > the AXI bus clock is enabled. Hence let's increase the number of =
clocks
> > > > > by one.
> > > > >=20
> > > > > In order to keep backward compatibility, the new axi clock must b=
e the
> > > > > last phandle in the array. To make the intent clear, a non mandat=
ory
> > > > > clock-names property is also being added.
> > > >=20
> > > > Hmm, I'm not sure. I think clock-names actually may need to be mand=
atory
> > > > here, as otherwise you'll not what the second clock is. The driver =
would
> > > > have to interpret no clock-names meaning clock 2 was clkin2.
> > > >=20
> > > >=20
> > >=20
> > > So the way things are now is that we just get the parents count with
> > > of_clk_get_parent_count() and then get the names with of_clk_get_pare=
nt_name()
> > > and
> > > this is given into 'struct clk_init_data'. So they are effectively cl=
k_parents of
> > > the
> > > clock we're registering and as you can see clock-names does not reall=
y matter.
> > > What
> > > I'm trying to do is to keep this and still allow to get the AXI bus c=
lock which
> > > is
> > > something we should get and enable and not rely on others to do it. T=
he idea is
> > > then
> > > to add the axi bus clock as the last one in the clocks property and I=
 will get it
> > > by
> > > index with of_clk_get(). The rest pretty much remains the same and we=
 just need
> > > to
> > > decrement by one the number of parent clocks as the axi clock is not =
really a
> > > parent
> > > of our output clock.
> >=20
> > I mean, if it works, and you can always disambiguate between whether or
> > not someone has two clkins or one clkin and the axi clock, then
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> The assumption is that the axi clock is the last one in the phandle array=
=2E But your
> comment made me think a bit more about this and I do see a possible probl=
em if we run
> old DTs against a kernel with this patch. We have two possibilities:
>=20
> 1) DT only with one parent clock;
> 2) DT with two parent clocks;
>=20
> 1) is "fine" as it would now fail to probe. 2) is more problematic as we =
would assume
> the second parent to be the axi_bus clock so effectively not fixing anyth=
ing and
> silently probing with a broken setup.
>=20
> So yeah, I think I overthinked the backward compatibility thing. I mean, =
in theory,
> all old DTs are not correct and should be fixed by including the axi_clk.=
 And if we
> now enforce clock-names we at least get probe errors right away making it=
 clear
> (which is far better from silently breaking after probe).
>=20
> Given the above, it should be fine to just enforce clock-names now, right?

I think you need to enforce clock-names in the binding and take
!clock-names and 2 clocks to mean that the second one is a clkin. I
think that's a better solution than failing to probe for all extant
devicestrees.

--9vKNs41rCsrdUECp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxvLmwAKCRB4tDGHoIJi
0rkEAP9991Ir2SLb0lRIHVupuqyyaoeD51oMCMQT09RCmYFBigD+MLUrIFD7jjYG
q1Uu0B68KX+svsfV8mU2CNjnsP4qRQQ=
=/bY7
-----END PGP SIGNATURE-----

--9vKNs41rCsrdUECp--
