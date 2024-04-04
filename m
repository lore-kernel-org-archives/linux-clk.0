Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5FC5E07E;
	Thu,  4 Apr 2024 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222419; cv=none; b=dMSLiaynzl2lmHPFgCoRyJHAih2i6PfRxvU7OWLw1EBQSkkVK2CcaOiH0EFKHKqTVTvirVO/7PiklkNdWj6wdSKVMlpKF+zFDPbDbObCLrLO9aX8nRYCNvZLeXUZmE9y1viqBZDvUMac3RLxvJlIGyVwF5DHTMFd0HeTWedgTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222419; c=relaxed/simple;
	bh=3VvVsO6yu8Js+kCS8QYj+IP7TOgCxwTVR9hj8VaYEq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsjMdiXRR/gUo+xCsZsVu7oCY/CjHkzrza7tbQ3Wc7aT9T6ag8jGP8+mPd5QyRTXG6Mcz4lqN5/cDtop/DRwiXTHHynT6pi5/DGySuH2oJQpu986HfW95Nh6GyGfUqo+zgT/ySz+if0qh6SbEJyF3SoLgBFbk2J3yd0GOUWTOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0iJQkvt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0iJQkvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314BCC433F1;
	Thu,  4 Apr 2024 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712222418;
	bh=3VvVsO6yu8Js+kCS8QYj+IP7TOgCxwTVR9hj8VaYEq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0iJQkvtzyE0SogA9VZF/4Q9iuqOsvx/xUGh3I81X8MULzk65wJ2WvdbF2BO9f9rq
	 z8Tjanw2OSNeluz5ov/z8qguxhK50TI8IEx9eLoOyEbZr9VJrvsniPEfWSV0IqkibW
	 Fe/KBlTY+lYYmvi3PnMPVj6PYgq1MVWlqmAtzSBvUMyLxz6/H4PN2lYPzfLib9O2uJ
	 7pQXg5hRDETKMAdHyylL+tKJfHh/IC4M2eNymaoJzteV2G6J4cBKNCBuVgBUx2Autw
	 40p64c3LTYmi3XGoWz7tQ/ZVbnxejNa+E03J49XNySgGsrgr82i62lOPcR2oPnBpHM
	 nurKxx5OaAYUg==
Date: Thu, 4 Apr 2024 11:20:15 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH 2/4] arm64: dts: airoha: Add EN7581 clock node
Message-ID: <Zg5wz58EI7K-gEEZ@lore-desk>
References: <cover.1712160869.git.lorenzo@kernel.org>
 <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
 <abff4844-b444-48cc-8dad-18eefa6c386c@collabora.com>
 <Zg5rc2GIwpN7f9Z2@lore-desk>
 <d8794345-6014-4949-8e6b-e09bc0a1458f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lFgH9XwmgXcTAyW"
Content-Disposition: inline
In-Reply-To: <d8794345-6014-4949-8e6b-e09bc0a1458f@collabora.com>


--6lFgH9XwmgXcTAyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 04/04/24 10:57, Lorenzo Bianconi ha scritto:
> > > Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
> > > > Introduce the Airoha EN7581 clock node in Airoha EN7581 dtsi
> > > >=20
> > > > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >    arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
> > > >    1 file changed, 9 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/bo=
ot/dts/airoha/en7581.dtsi
> > > > index 55eb1762fb11..a1daaaef0de0 100644
> > > > --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> > > > +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> > > > @@ -2,6 +2,7 @@
> > > >    #include <dt-bindings/interrupt-controller/irq.h>
> > > >    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +#include <dt-bindings/clock/en7523-clk.h>
> > > >    / {
> > > >    	interrupt-parent =3D <&gic>;
> > > > @@ -150,5 +151,13 @@ uart1: serial@1fbf0000 {
> > > >    			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > > >    			clock-frequency =3D <1843200>;
> > > >    		};
> > > > +
> > > > +		scu: system-controller@1fa20000 {
> > >=20
> > > Uhm, why is this not a clock-controller but a system-controller?
> >=20
> > I used the same approach used for en7523.dtsi. I guess it is done
> > that way because the registers come from scu (system control unit)
> > regmap, but I guess we can use clock-controller instead.
> >=20
>=20
> Yeah, comes from there but you're actually defining a node for a clock-co=
ntroller,
> not a system-controller... makes sense to define this as
>=20
> 	scuclk: clock-controller@1fa20000
>=20
> ...or something along that line (for the phandle) so that, if another scu=
 related
> node appears for whatever reason, we distinguish between scuxyz and scucl=
k.

ack, I agree. I will fix it.

Regards,
Lorenzo

>=20
> Cheers
>=20
> > Regards,
> > Lorenzo
> >=20
> > >=20
> > > Cheers,
> > > Angelo
> > >=20
> > > > +			compatible =3D "airoha,en7581-scu";
> > > > +			reg =3D <0x0 0x1fa20000 0x0 0x400>,
> > > > +			      <0x0 0x1fb00000 0x0 0x1000>,
> > > > +			      <0x0 0x1fbe3400 0x0 0xfc>;
> > > > +			#clock-cells =3D <1>;
> > > > +		};
> > > >    	};
> > > >    };
> > >=20
> > >=20
> > >=20
>=20
>=20

--6lFgH9XwmgXcTAyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZg5wzgAKCRA6cBh0uS2t
rJbmAP9hlELfWN67HPAJMnk3DGj4VHkM5nUHI/IQ89F7a96Z5QD+MZF1pHE1chB7
+537vf6yF66KAhxtRjb+6GHIswwqQA0=
=UC1f
-----END PGP SIGNATURE-----

--6lFgH9XwmgXcTAyW--
