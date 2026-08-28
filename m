Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD543911DF;
	Fri, 28 Aug 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787937139; cv=none; b=gPv/i2JuHlZhwSfqQ//NmesVtE+xtaT7NHG8mdY3m5LCIx8hHSryC9KBlJJCpCuCgncNAwttkSOf+vWLMJg7KsT4QDGgpBF/meXibzw91l5+/YQK6dsmaxzV+YTXm8K3jUFdKkgd61gTpKLX8Y9qPwR+TJQ3fn7sUgNXJ4jpcwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787937139; c=relaxed/simple;
	bh=s0uLJf1+NSiQc6U3i2QxyaFhnpIWiHyQM6SK6CWAfGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZokuFhA1zsJuo4wUJegVp8vMHgIgzgsTQIBhv21uOsJp0dyDe31ois4Cp9CGyUlUdnuLWJL7TgAigc0DImuZJcDA9iAMze2Bj2PaFxL4rV6rBEoywSWD7yeSBb47CCRF1Yxn33o4A1IoqiIKWkSVQcxtljrXJeSfh/8EMcha/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqGPt2eG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqGPt2eG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD871F000E9;
	Fri, 28 Aug 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787937138;
	bh=TN19/YW/CbR9ET6hQR3Tpq0p1O6MqryWidtlpesjpRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqGPt2eGdDa3ogZpMQCUBeAhah+SCrkKHmsjXFx9aT0vWmpcTWi42mlyM27kXiBDB
	 QuDY6ZhqRlzrB1CYwMfFiy9+W91px+FERi+bYYp5mrUhuiQNz2OTZpWbZxJuQI/cGH
	 YOrXIoOXXeZfkG9Vey46ttfwR/NHuYpCIt46oFOK/A3Z4ndGj+ThsHYhqYDqSwx7QO
	 UDbLHuv2dv+c4LUQ1Yu9ZI+0hQOaZgxcUd5ngQ2ySlq3hjCfa1SSubHKNqdbk6qi95
	 CxaPIj5zarySdZPTiMIQy+JB4KJr0u55s4nL0W40Vzi17ddHImGsBurDGOE7phhL4i
	 3I0HBU4QnJeyw==
Date: Fri, 28 Aug 2026 18:12:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260828-sneeze-audacity-02b95504a3b1@spud>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
 <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
 <20260827-parcel-isotope-22b344bace78@spud>
 <cfac0540-4f08-45b6-8d01-71080e0fcb47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzqbQdldRDzgbIp7"
Content-Disposition: inline
In-Reply-To: <cfac0540-4f08-45b6-8d01-71080e0fcb47@gmail.com>

--jzqbQdldRDzgbIp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 07:31:10AM +0200, Vyacheslav Yurkov wrote:
> On 27.08.2026 18:55, Conor Dooley wrote:
>=20
> > > It is n input clocks and 1 output clock. It is kind of a mux, but the=
 CPU
> > > doesn't control the clocks or GPIO signals. The whole idea is that
> > > peripherals check the output clock, when it's locked that means _all_=
 the
> > > clocks are locked and GPIOs are in expected state. That's why the sel=
ection
> > > operation is not really implemented.
> > >=20
> > > Actually the number of input clocks don't have to correspond to the n=
umber
> > > of the GPIOs, because the GPIO signals indicate the locked state of t=
he
> > > clocks that are not accessible to the CPU.
> >=20
> > I'm not entirely sure what you mean by this, but it is starting to sound
> > like you're only having one output because that's the minimum you need =
to do
> > to ensure that this driver has probed before the peripheral(s) using the
> > N input clocks.
>=20
> That's exactly the idea. How else I would ensure in peripheral's probe
> driver that clocks are locked?

Every peripheral should already contain a reference to all of the clocks
that are connected to it, and the peripheral drivers should request
those clocks. If you do that for all clocks a peripheral uses, you don't
need to have an artificial check for the gpios representing clocks
b,c,d,e,f,g... in the enable function for clock a, because their own
{devm,}clk_get_enabled() will interrogate the relevant bit.

At present, I'm expecting that you have a dt like

clk_gpio_locked: gpio-locked-fixed-clock {
    compatible =3D "gpio-locked-fixed-clock";
    #clock-cells =3D <0>;

    clocks =3D <&clk0 0>, <&pll 0>;

    locked-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>,
            <&gpio0 5 GPIO_ACTIVE_HIGH>,
            <&gpio1 2 GPIO_ACTIVE_LOW>;

    clock-output-names =3D "clkout0";
};

peripheral {
	clocks =3D <&clk_gpio_locked>, <&clk0 0>, <&pll 0>;
	//or this, depending on whether clkout0 actually produces a
	//rate, which I guess it does given it's a passthrough for the
	//first clocks entry?
	clocks =3D <&clk_gpio_locked>, <&pll 0>;
};

when really you should have something like

clk_gpio_locked: gpio-locked-fixed-clock {
    compatible =3D "gpio-locked-fixed-clock";
    #clock-cells =3D <1>;

    clocks =3D <&clk0 0>, <&pll 0>, <more clocks here>;

    locked-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>,
            <&gpio0 5 GPIO_ACTIVE_HIGH>,
            <&gpio1 2 GPIO_ACTIVE_LOW>;

    clock-output-names =3D "clkout0", "clkout1", "more clocks here";
};

peripheral {
	clocks =3D <&clk_gpio_locked 0>, <&clk_gpio_locked 1>;
};

> > Requiring other input clocks to be stable before
> > declaring the input that's actually connected to the output stable
> > appears to be a shortcut/hack rather than an accurate description of the
> > hardware. If that's the case, I'd be much happier with this if this was
> > implemented as either a) N inputs with N gpios and N outputs, or b) 1 i=
nput,
> > M gpios (if multiple represent the stability of that input) and 1 outpu=
t,
> > with N instances, one for each clock.
>=20
> How having N outputs would help? It looks like it would just move the job=
 I
> do here into each peripheral driver instead.

Two reasons. Firstly because what you've got here suits you just fine,
but since you're adding it to a generic binding it should be written in
the most generic manner possible. Some other similar use case might not
want to wait for clocks used by other peripherals to lock before
allowing the driver for what they do care about to probe.
Secondly because it's a bit of a hack currently, you've got one clock
representing the status for a bunch of other clocks. Each clock should
represent it's own status. If this was done in the hardware it'd be one
thing, but you've got a pure software construct blocking one clock from
being locked because other clocks that may be unrelated to it entirely
are not yet locked.
The argument for including this depends on it not being a pure software
construct, and having what appears to be a hack so that you can rely on
the status of one clock rather than correctly determining the locked
state of individual clocks undermines your own argument for inclusion.

Cheers,
Conor.

> > On the other hand, if this is genuinely a mux, then the binding should
> > reflect that, rather than only describe a subset of what you can do and
> > the driver should only check the actual parent out the output, rather
> > than the N-1 other inputs.


--jzqbQdldRDzgbIp7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapHBbQAKCRB4tDGHoIJi
0rGYAP4yzgbhidrSMfERCbdHl7qJtJkSsLNmMhVnoa7jQnNGvwEA+vtixGLZpZiJ
iVY9HccJA9R1fBVuHJVNVa0/D/WqJwU=
=mGbe
-----END PGP SIGNATURE-----

--jzqbQdldRDzgbIp7--
