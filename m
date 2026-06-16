Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E79449EAB;
	Tue, 16 Jun 2026 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624351; cv=none; b=JHHkTOvPAaNbtMU57uK3kOe9dPteytkDpnFBiqLTrKz7rXeWEsfj+PbEbjDP3DputTBNo1nnimKDuzUL4qZ1lleK7xn4KxiW9UUD8i4WfjEbLjJo1dvcRlWu6PSqX5DEqj/xqZMj+gOUE8/xC0xPS3/+1LB7og36NLsPj30aFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624351; c=relaxed/simple;
	bh=ypCjEsBZpP9qQLZC5TjYXZK2UpGcqTldgzVpk32PPLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+Kt3fSDp8EXqkg9TZBZgxNQEjafzFir0432wJyADyBSU+xf7Mp4tbNJvWjuMxwFwK4M3gbhphxTDwYWjPMSuojh+HLhNWAd/0YRXQ3duRBC9G6hwm+zcrxQJsCth7TYEod9p8knRo0+hp/8E45tUW4i5I5ZXWuTOGS9C7PZTds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPKcWP5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPKcWP5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEEE1F000E9;
	Tue, 16 Jun 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781624350;
	bh=OOaA0fkqjU+yv1f6XKGEV2TPNtFCbCxzDbn3i1AlY2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kPKcWP5JkjPdjvL9tepBhWn4irHNuoieHAPxPBYHiDegD37Okwdhh9GMmyG0rjg49
	 weCYfpa5DaT6yHqyaRnaojT6SWEXHU4xxDrhYGkS36BnfFOV5uiZDX4XSQh8fdhKPi
	 kRboZ3n6nZ5XnkSwCdyOUW5aEN15E3iOKXs0K8u+7TWkzIPcPGMwuR73tGJl4o88T7
	 gcwt1u8Y4EhFjUWf29c/77Wi5mc57sSH5dhIIN0wHHQjiqEMEQuVHEWnO8/JiHKi6b
	 UgSVbIZvNtSSeDqAtudzQL5ou2INh65rqZbeFNyTXH7pDBnfwffejysttXJPs4JtJY
	 61FCRWgELXo5g==
Date: Tue, 16 Jun 2026 16:39:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: V.Yurkov.EXT@bruker.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260616-grader-sequester-f22d274d2931@spud>
References: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
 <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
 <ajB2PhmxvdtsXNnm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjdPqrOLa6aLXHjz"
Content-Disposition: inline
In-Reply-To: <ajB2PhmxvdtsXNnm@redhat.com>


--jjdPqrOLa6aLXHjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 06:01:34PM -0400, Brian Masney wrote:
> Hi Vyacheslav,
>=20
> On Wed, Jun 03, 2026 at 11:16:42AM +0000, Vyacheslav Yurkov via B4 Relay =
wrote:
> > From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> >=20
> > Some hardware designs provide fixed-frequency clocks generated outside
> > software control, such as by FPGA-resident PLLs. While the clock rate is
> > fixed, a separate GPIO signal indicates whether the clock source is
> > locked and producing a valid output.
> >=20
> > Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
> > clock whose availability depends on one or more GPIO lock-status
> > signals.
> >=20
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > ---
> >  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 70 ++++++++++++++=
++++++++
> >  1 file changed, 70 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-=
clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-cloc=
k.yaml
> > new file mode 100644
> > index 000000000000..9106b800b673
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.y=
aml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO Locked Fixed Clock
> > +
> > +maintainers:
> > +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > +
> > +description: |
> > +  Provides a clock output whose availability depends on a set of
> > +  prerequisite conditions. These conditions include the presence of
> > +  one or more parent clocks and the asserted state of one or more
> > +  GPIO lock indicators. An example of such clocks is FPGA clock that
> > +  are outside CPU control, with the lock status exposed through GPIO
> > +  signal.
> > +
> > +  The output clock is considered available only when all configured
> > +  prerequisites are satisfied.
>=20
> I'm stepping outside my usual review of just the clk drivers. Krzysztof
> in v1 and v2 asked for more detailed hardware explanation. This feels to
> me like this is a policy that says to not use these clocks until the
> GPIO says they are ready. My gut feeling is that details like this
> should live in a clk driver instead of a dt-binding.
>=20
> Alternatively, if this is generic enough, then could
> Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml be
> extended?

FWIW this came up in an earlier revision:
https://lore.kernel.org/all/20260407-fling-scouring-dbe2141cc79b@spud/

IMO it's an inverted gpio-gate-clock, where the gpio is an input rather
than an output. I suppose you could extend gpio-gate-clock with it and
have mutually exclusive enable-gpios and status-gpios?

>=20
> Brian
>=20
>=20
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-locked-fixed-clock
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    description: Input clocks whose validity is monitored by this prov=
ider.
> > +
> > +  clock-output-names:
> > +    description: Names of the clock provided by this controller.
> > +    maxItems: 1
> > +
> > +  locked-gpios:
> > +    description: |
> > +      GPIOs to check the lock state.
> > +    minItems: 1
> > +    maxItems: 32
> > +
> > +required:
> > +  - compatible
> > +  - "#clock-cells"
> > +
> > +anyOf:
> > +  - required:
> > +      - clocks
> > +  - required:
> > +      - locked-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    clk_gpio_locked: gpio-locked-fixed-clock {
> > +        compatible =3D "gpio-locked-fixed-clock";
> > +        #clock-cells =3D <0>;
> > +
> > +        clocks =3D <&clk0 0>, <&pll 0>;
> > +
> > +        locked-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>,
> > +                <&gpio0 5 GPIO_ACTIVE_HIGH>,
> > +                <&gpio1 2 GPIO_ACTIVE_LOW>;
> > +
> > +        clock-output-names =3D "clkout0";
> > +    };
> >=20
> > --=20
> > 2.34.1
> >=20
> >=20
>=20

--jjdPqrOLa6aLXHjz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFuGgAKCRB4tDGHoIJi
0v3EAP9CmhxCPwfUSJCxqBKk+gfdbxJmoNTbQmelV//LDeQj7wEAiZLVlxEpDrqr
UrlvyLgQJQMjTdy/z6bl/yhjDx9kTAk=
=yUEA
-----END PGP SIGNATURE-----

--jjdPqrOLa6aLXHjz--
