Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FA16EB76;
	Mon,  2 Sep 2024 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266381; cv=none; b=Q48wupFVT+eGtpOx9GvROs0fBG7sx3a5XhEVp0vnGthK8HitmT66qJrL0UtlmHp1MH5F8Dcw1sWh1P2x3j3tzEoF101IGeZ/vpdeJbjWBHvbR7Snboc+aFNtxdOKMrC6zNjURp1/ySj0e+yqkLVrfyIaAfeLTpiARw5aT10A39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266381; c=relaxed/simple;
	bh=K+N0AwVPDVYqKgXVy/s8jrXl7HXvOgLS6WajR7PRvTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7gJiYpFBi9XG5pIKphK7Bjiu9+nZwyh361yNWqPUPBAg33IKHOi9QsXiXQMRCgVJ4cSTXcjO65pU59bpTrff21pUOB7nMZ8NrPrxk93nW0NOi/kL8M0f11Ugw4Hb6pIUkdoE6cmEezr63kAcbzaGEhyRvOstPbAvg9GfmuAQOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic84Q8kd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic84Q8kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4D0C4CEC2;
	Mon,  2 Sep 2024 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725266380;
	bh=K+N0AwVPDVYqKgXVy/s8jrXl7HXvOgLS6WajR7PRvTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic84Q8kdvBwXWqnyYHwc+wlkBVY+K1vG3+AbXbd6O0j0TyuxgJekV33R7vasQQybx
	 2k38yBomJSQuIWIA8Mv8o0J01jdlbvidpNLiEC2T1g931EYx7Xlt6nnOWbLP4KxTq5
	 3mRHMpsFV3tDqZkY1z0wjmEA3tQ2m59dxV6y8x7ZlDhZh46FV9qlneF18addutvxYJ
	 NLskJrQt1zvoqnNn7e5TOfah3+arl9n9vgzWiT74zN34dJSg5829rtMWu/yB3+G6nn
	 oCLXARFWy+zSTZA3e0imfa2wTw+euUv/ZBsyxSGhRQYC0/z1cIFwX4InDR48KY7y2J
	 ErvjGnHdRBCKA==
Date: Mon, 2 Sep 2024 10:39:36 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/7] dt-bindings: clock: airoha: update reg mapping for
 EN7581 SoC.
Message-ID: <ZtV5yNbdEE0s38US@lore-desk>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
 <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>
 <20240902-sandbank-aging-79e6a5cf383b@squawk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="noRtV0VyWOrDm8cy"
Content-Disposition: inline
In-Reply-To: <20240902-sandbank-aging-79e6a5cf383b@squawk>


--noRtV0VyWOrDm8cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Aug 31, 2024 at 09:18:43AM +0200, Lorenzo Bianconi wrote:
> > clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> > while it is configuring the chip-scu one via a syscon. Update the reg
> > mapping definition for this device. This patch does not introduce any
> > backward incompatibility since the dts for EN7581 SoC is not public yet.
>=20
> What does "not public yet" mean? The bindings are public, so someone
> could have built a dtb without whatever non-public dts you currently
> have. Do you mean, has not yet made it into a released kernel?

I was not so clear on this point, sorry for that. What I mean is these devi=
ces
(clock, pinctrl, ethernet, pwm, ...) are not supported in the dts upstream =
(in
the kernel or other corss-compiling systems link OpenWrt). For EN7581 SoC we
have just basic support upstream at the moment [0].
Since we have this weird hw architecture, we agreed with Angelo to post the=
 full
dts just when all drivers are merged in order to avoid possible backward
compatibility issues adding more devices support into the kernel.

Regards,
Lorenzo

[0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/airoh=
a/en7581.dtsi

>=20
> Cheers,
> Conor.
>=20
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/clock/airoha,en7523-scu.yaml         | 12 +++-=
--------
> >  1 file changed, 3 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.=
yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index 84353fd09428..ca426c328535 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -34,8 +34,8 @@ properties:
> >            - airoha,en7581-scu
> > =20
> >    reg:
> > -    minItems: 2
> > -    maxItems: 4
> > +    minItems: 1
> > +    maxItems: 2
> > =20
> >    "#clock-cells":
> >      description:
> > @@ -75,9 +75,6 @@ allOf:
> >          reg:
> >            items:
> >              - description: scu base address
> > -            - description: misc scu base address
> > -            - description: reset base address
> > -            - description: pb scu base address
> > =20
> >  additionalProperties: false
> > =20
> > @@ -98,10 +95,7 @@ examples:
> > =20
> >        scuclk: clock-controller@1fa20000 {
> >          compatible =3D "airoha,en7581-scu";
> > -        reg =3D <0x0 0x1fa20000 0x0 0x400>,
> > -              <0x0 0x1fb00000 0x0 0x90>,
> > -              <0x0 0x1fb00830 0x0 0x8>,
> > -              <0x0 0x1fbe3400 0x0 0xfc>;
> > +        reg =3D <0x0 0x1fb00000 0x0 0x970>;
> >                #clock-cells =3D <1>;
> >                #reset-cells =3D <1>;
> >        };
> >=20
> > --=20
> > 2.46.0
> >=20



--noRtV0VyWOrDm8cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZtV5yAAKCRA6cBh0uS2t
rFD7AQD3XAK61xeAV/HoOQXNQ15ZHSy+FS6yiGZLk9JFnX9YzQD/fJSwqoJ56vHl
PheC3VvB3/Z0+gH53Np35I3dsS1COAw=
=WyW2
-----END PGP SIGNATURE-----

--noRtV0VyWOrDm8cy--
