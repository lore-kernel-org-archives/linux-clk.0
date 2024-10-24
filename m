Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4E139578;
	Thu, 24 Oct 2024 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729786416; cv=none; b=YKmWCQeNaeCoDmjh15nD17tScpUhBBpWlTZwHByqtO+dbCxjZbcQ4mtSMdaVM7EXFWx5QyLatofmw0ePYlJVpBOrmlLk62piJwprmlhuHlnheRCiFXDxFyEWfJgztkmCYWXMOcflX103GB/FOSwiuQWkgxp+EPc0Ew/iuEwCQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729786416; c=relaxed/simple;
	bh=A1QQF2KKSKuGF3OFLqE2euaN7kkuNR0b1HOIO/uLn0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzpbHOznWECrArbqqPF7Nu9M1+KaarBkRN9QsUZZvjfwgVslx7qOr29n3oDN+XTDqOTWWx/Z765yZZ4ZCWS7z3jXqiGx1lozAWzv50UeMbCXd/kAouMURqT9bMn//S6WCSaWpLm0VeQ2dIs0pDv+yUaqFXK9Urow+uLyoxCJQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HW7Xe38c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HW7Xe38c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DA0C4CEC7;
	Thu, 24 Oct 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729786416;
	bh=A1QQF2KKSKuGF3OFLqE2euaN7kkuNR0b1HOIO/uLn0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HW7Xe38cxD+8AmaZH51in6btZDwfYtKC6/QuS2EE17V0Ke91NZxcrLMdvuZ/joy5A
	 8DdtK5VnITWDCjOEvxP5y9jLRvbD1e5526uCTvtx951uq1liesWNXDEvZQip5FUUbf
	 iL8iG27YLs722t5uwsT43QtxcHn7GcEamsk8nWvtWq5DI6rf/+WuPMDwByMdO1Qjri
	 a5j4vfQfFKt5wgxiWlAy06ocKOhNPdpO/6bh/S8nYNN3e/wx4QM+q9WjVirGq6QfUX
	 sDBaXZUbamZ7AfTvpXFLtbMG4R7rucE+to62ShP4JPhTLL2O/YuUSNg76jnm3xMUNS
	 uoSyNGdVCXl2w==
Date: Thu, 24 Oct 2024 17:13:31 +0100
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
Message-ID: <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
 <20241023-tucking-pacific-7360480bcb61@spud>
 <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pJZ6Eu/AhPrcPOYK"
Content-Disposition: inline
In-Reply-To: <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>


--pJZ6Eu/AhPrcPOYK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 02:35:37PM +0200, Nuno S=E1 wrote:
> On Wed, 2024-10-23 at 17:30 +0100, Conor Dooley wrote:
> > On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> > > In order to access the registers of the HW, we need to make sure that
> > > the AXI bus clock is enabled. Hence let's increase the number of cloc=
ks
> > > by one.
> > >=20
> > > In order to keep backward compatibility, the new axi clock must be the
> > > last phandle in the array. To make the intent clear, a non mandatory
> > > clock-names property is also being added.
> >=20
> > Hmm, I'm not sure. I think clock-names actually may need to be mandatory
> > here, as otherwise you'll not what the second clock is. The driver would
> > have to interpret no clock-names meaning clock 2 was clkin2.
> >=20
> >=20
>=20
> So the way things are now is that we just get the parents count with
> of_clk_get_parent_count() and then get the names with of_clk_get_parent_n=
ame() and
> this is given into 'struct clk_init_data'. So they are effectively clk_pa=
rents of the
> clock we're registering and as you can see clock-names does not really ma=
tter. What
> I'm trying to do is to keep this and still allow to get the AXI bus clock=
 which is
> something we should get and enable and not rely on others to do it. The i=
dea is then
> to add the axi bus clock as the last one in the clocks property and I wil=
l get it by
> index with of_clk_get(). The rest pretty much remains the same and we jus=
t need to
> decrement by one the number of parent clocks as the axi clock is not real=
ly a parent
> of our output clock.

I mean, if it works, and you can always disambiguate between whether or
not someone has two clkins or one clkin and the axi clock, then
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pJZ6Eu/AhPrcPOYK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxpyKwAKCRB4tDGHoIJi
0gAYAQDpBACiB2z0Z00EB300D/5eHN04qFai/dmCyJx+diqzWAEAhm5ADaRzdZWm
S7tI2Mbdjv0UrExvOCfe9sD9iCW4GQc=
=6sSx
-----END PGP SIGNATURE-----

--pJZ6Eu/AhPrcPOYK--
