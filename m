Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84BD39FCA0;
	Thu, 26 Mar 2026 18:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549967; cv=none; b=UeBlP8MeAwANu5vmfoW2d0ifyfSVQIBDQYtNPb2ST7lEbWJ7nNFWKH5CcmMiExzM3AVxruySentpHpTitBL4EG6clchrUuSu/ix43f9bBQV1drNlliSPqdhmwSSb1vtDryP0jkKUX/6Nu3ORPX0RyLOlts/C9zeyWN9ZtO93rSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549967; c=relaxed/simple;
	bh=e3IQSyuBkI2uxnImkTHRmeOQRMXLH8i/LlfJruNVzDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYM0/Hf4QY0uUDlpBorKmDy12EDZ/RP9TUTfrkd1xRemo8ypPOW2Kc4CCP7MqnbgoY+LN+/nCFKt5MavVXlwdOi0imKAaBsnEiNqP74szqD1e5uefT0BvFuUVv/z6yMcYYAA4H+qfXBl4yLD/wLPHhq7MkeIipO6jRZhMWFHZYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXBOTXGp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXBOTXGp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46051C19423;
	Thu, 26 Mar 2026 18:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549967;
	bh=e3IQSyuBkI2uxnImkTHRmeOQRMXLH8i/LlfJruNVzDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXBOTXGp4xmTGCKJSE7gm9Xu637AwSplxv8pVowIRY2BfpbbWAUK26SxzC0EDJEBQ
	 l9UK68GExK+Ub8zKEZ8UIP+yAPJGkOjhosdhzrlnlPzcj0AO4CzcnSj7pEZg9IFS6E
	 gGQj9rwKa6GNBTkyFyI3sPxE/EP5vWg+ddJAdVVXGUgSI1+FRZPMIz9edXrq5w27kB
	 90ytl2eN3oUNElRJzjzGCjvkjrSTro4qXZDMCG87HUYx+sZ6aeMXNFV7FPBCpJyZwO
	 upr/Yd3k16qXCEUH7rBcpqwsh5cB8ksql9JnWpUb3qGb0Fd5O8iRx1piEtO0NDACD8
	 0QwNqfuUjSNzQ==
Date: Thu, 26 Mar 2026 18:32:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260326-nursery-outer-55799f675e14@spud>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
 <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
 <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
 <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UQ9U3XuY+nYj6U50"
Content-Disposition: inline
In-Reply-To: <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>


--UQ9U3XuY+nYj6U50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 02:39:22PM +0100, Vyacheslav Yurkov wrote:
> On 26.03.2026 11:08, Krzysztof Kozlowski wrote:
>=20
> > >=20
> > > DTS example:
> > >     clock_guard: clock_controller_guard {
> > >       compatible =3D "clock-controller-guard";
> > >       #clock-cells =3D <1>;
> > >       clocks =3D <&h2f_clk 0>, <&clk_fgpa_rx 0>, <clk_fpga_tx 0>;
> > >       clock-names =3D "h2f_clk0", "clk_fpga_rx", "clk_fpga_tx";
> > >       gpios =3D <&fpga_ip 0 GPIO_ACTIVE_HIGH>, <&fpga_ip 1 GPIO_ACTIV=
E_HIGH>;
> > >       gpio-names =3D "gpio-input0", "gpio-input1";
> > >       clock-output-names =3D "clkctrl-guard";
> > >     };
> > >=20
> > >     custom_device {
> > >       compatible =3D "...";
> > >       ...
> > >       #clock-cells =3D <1>;
> > >       clocks =3D <&clock_guard 0>;
> > >       clock-names =3D "clock-guard";
> > >     };
> >=20
> > So a pure SW construct? Device has specific clock inputs but you do not
> > model them and instead replace with one fake-guard-input.
> >=20
> > I don't see how this represents the hardware at all.
> >=20
> > Maybe some diagrams would help, assuming we still talk about hardware.
> >=20
> > Best regards,
> > Krzysztof
>=20
> Techincally that's correct, it's a software construct. If this is not a

Is it a software construct?
I assume that the PLL status is going to be some lock bit in a register,
and you're got some "hardware" in your FPGA fabric that reads that bit
and sets a GPIO when it gets locked? Or maybe it's even simpler, and
your GPIO just gets set once your custom HDL comes out of reset, which
happens when the PLL locks?
If that's an approximation of what you have, that's not a software
construct.

> right place to submit such a helper driver, I'd appreciate a hint what
> subsystem is the right one.
>=20
> I was not sure how to provide a diagram in the mailing list, so I posted =
in
> on Github https://github.com/OSS-Keepers/clock-controller-guard/issues/1
>=20
> It is a driver which models dependencies for other drivers. These are soft
> or "indirect" dependencies, because we cannot access the FPGA unless the
> FPGA_PLL_locked, and GPIO is telling us we are good to go.
>=20
> Conor, I think this should answer your question as well.

Not really, but it gets part of the way there. I want to know what this
provider actually is. I now know it is a PLL, not an off-chip
oscillator, but I know nothing about the interface that you have to it
(or if you have one at all). What compatible string/kernel driver does
it use?

Because SoC-FPGAs can route GPIOs from the SoC part to the FPGA fabric
and use them as if interacting with something off-chip, I'm not sure if
we are dealing with an separate FPGA or a SoC-FPGA. Which is it?
Effectively I want to understand why you cannot just read the lock bit
=66rom the PLL directly. In my experience with *SoC*-FPGAs, things like
PLLs that must lock for the fabric to be usable have a register
interface from which the lock bit can be read, that is of course not
clocked by the PLL output clock and therefore accessible before the
PLL has locked.

I think more info is needed here to guide you on where such a "helper
driver" should be located and what the dt represetation should be.


--UQ9U3XuY+nYj6U50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacV7ygAKCRB4tDGHoIJi
0kvOAQC3Yl85Pkdjs5ANcVdE5+cS5UTtUgANY2BkzORrhG9MrwEA3Cp5Fdjq73Im
02tAQyjZKEeIz8XYECMdVI5AiW2PsQQ=
=TKDd
-----END PGP SIGNATURE-----

--UQ9U3XuY+nYj6U50--
