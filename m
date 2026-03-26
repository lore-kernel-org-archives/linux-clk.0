Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8F394495;
	Thu, 26 Mar 2026 10:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521868; cv=none; b=gQY+hLKnYi+slCAVxb8lHLv6nMxoVL0NP7hPVkt8dC3JARs6N2WHEoymFCpF1v3G65TpNdlec5fNfQtXVjyrOywiZyDaoj2uT/uf20S5V6IeeWPXQ7MXzrQymwJ7V4aXqaA85gAtaNr5y0Yc/9chlMb7a615cUmzZuEC5h6pevE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521868; c=relaxed/simple;
	bh=wYyWKLKHzE8kFdi3vkKIQNJjQ2xVIQi9Z3+ApgMANsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwwXN2uScSdd/t8Z/NZ0aJtBjor5Pgmuc1EZ9NbuLcncVICkYNxEQKzvdOEPwG+xdyYbmAk5tNHX0U2XWB2gnIyUcDsA99ttp/rf1scvzKOYZ0TNBT/vImmmx7lgHuBzH6BuGwgALwq0oZfhnY2eWpyjgr1ClZdMPzgJrGwckgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExS4F9cj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExS4F9cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37CAC116C6;
	Thu, 26 Mar 2026 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774521867;
	bh=wYyWKLKHzE8kFdi3vkKIQNJjQ2xVIQi9Z3+ApgMANsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExS4F9cj1qPv8ZD99tED4KgYGzwKJhaPjQjk4AbLynuZJmdpxyUdMu4s4DpPRKQcy
	 EX+sxI3Pg3rr5S95A15P2YhtG0cuWqKP6Gl4RKIfASOySd5XB12Q99efWvMMndFrAY
	 4UvCfzNbpwfQwr6BOSpidNaaIHTpfc0CAGF+9fcsk7OSC57QhjSnsu5gtXq3lCU5RB
	 iEaLl5obtx59jVaOyXh9g2gPZ/lfTcoSWktWUA8VeHShmGJg9zGvDORi8LIJJg3tif
	 5d2lWXmQ41pDTRDHmj3bQfcjClhTXGl8lKqiv77eqZf6+w0AoRfcHvOpuI/FNt7J1z
	 8Cv/OVQ88wOlA==
Date: Thu, 26 Mar 2026 10:44:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260326-lustiness-borrower-530898a5ce28@spud>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72NOa8YuikAK5mKM"
Content-Disposition: inline
In-Reply-To: <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>


--72NOa8YuikAK5mKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 10:54:52AM +0100, Vyacheslav Yurkov wrote:
> On 23.03.2026 21:14, Conor Dooley wrote:
>=20
> >=20
> > The binding you've got says "GPIOs used to control or guard the clocks",
> > which is not what you're saying that is going on in this mail. A more
> > suitable description would be "GPIOs used to check the status of the
> > clocks".
>=20
> Agree, the description I provided is not very accurate.
>=20
> > I want to see an example dts user for this please.
>=20
> DTS example:
>   clock_guard: clock_controller_guard {
>     compatible =3D "clock-controller-guard";
>     #clock-cells =3D <1>;
>     clocks =3D <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;

Unfortunately, this doesn't contain the part that I wanted to see - who
the providers of these clocks here actually are.

To be frank, I am not sure how this block would know that these clocks
are enabled but their providers do not. I can think of a few ideas for
how this block would know, but I don't understand why the providers
themselves don't, and therefore why you need this gpio to tell you.

>     clock-names =3D "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
>     gpios =3D <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIVE_HIGH=
>;
>     gpio-names =3D "gpio-input0", "gpio-input1";
>     clock-output-names =3D "clkctrl-guard";
>   };
>=20
>   custom_device {
>     compatible =3D "...";
>     ...
>     #clock-cells =3D <1>;
>     clocks =3D <&clock_guard 0>;
>     clock-names =3D "clock-guard";
>   };
>=20
> The driver usage exaple:
>=20
> clk =3D devm_clk_get(dev, "clock-guard");
> if (IS_ERR(clk))
> 	return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
>=20
> ret =3D clk_prepare_enable(clk);
> if (ret) {
> 	dev_warn(dev, "Clock is not ready, %d\n", ret);
> 	return -EPROBE_DEFER;
> }
>=20
>=20
> > TBH, I don't understand your driver implementation either and why it has
> >=20
> > +static const struct clk_ops clkctrl_guard_ops =3D {
> >=20
> > +	.enable =3D	clkctrl_guard_enable,
> > +	.disable =3D	clkctrl_guard_disable,
> > +	.prepare =3D	clkctrl_guard_prepare,
> > +	.unprepare =3D	clkctrl_guard_unprepare,
> > +	.is_prepared =3D	clkctrl_guard_is_prepared,
> >=20
> > any of these 4 implemented when you have no control over the clock.
> > I didn't think it was required to call your parent clocks enables in
> > your own enable either, thought that was handled by the core recursively
> > calling clk_enable() on clk->parent. The one thing I would expect you to
> > have implemented ops wise is is_enabled, which you don't have.
> > Also no sign of any rate acquisition functions, which I thought were
> > mandatory.
> >=20
> > +	.get_parent =3D	clkctrl_guard_get_parent,
> > +};
>=20
> Good point on .is_enabled, I indeed missed that. As for the rate acquisit=
ion
> functions I referred to this table
> https://docs.kernel.org/driver-api/clk.html#id4 , and it see that .set_ra=
te
> is actually optional.

=2Eset_rate is not rate acquisition. .round_rate and .determine_rate are.
I thought they were mandatory, but for a gate clock I guess they are not
and the parent rate gets used automatically.

--72NOa8YuikAK5mKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacUOBwAKCRB4tDGHoIJi
0p35APwM6IgF3CNzxliJf3k0IJWw3lKQWkTG1iT/DuVvPfDOyQD/WoFBCbreKH3p
FQLv5UYcBgZwbxHHqjd/FcrAjhSTJgc=
=TceI
-----END PGP SIGNATURE-----

--72NOa8YuikAK5mKM--
