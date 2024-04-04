Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961B273177;
	Thu,  4 Apr 2024 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712221047; cv=none; b=Hrk+arx7wpa60C4WA1qVkisi0sKfj/IjmsS2YwyW9Tk2RVlV7eWGUPC2zW6rLdAvvz5MnyudesdFo96g8Y9aWqTLWllUh6IKdg/kfFKTN71K5OX1ed8G6LiBBn3AjSHCV1+A3PgCTFT+X6GgKxxH5dtranAxahyhKf3IqvQH5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712221047; c=relaxed/simple;
	bh=p4+j6w82VtZsXD54otR28kqbdlSqj2lBQn5BULCsTuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMEki8MEAJ+oqFoahCZl66EwxdWIGkzeLuk0CGAJs/06hAlICU/EIZ6vr8LkqqFFF331O3nkFB8i4RZXtr99GgsdkHuL6jdh5yeJGmh26o5H7lnm3MeF5o3U3+un6rEHfJdpfTsD1+S9YNpdKQ7aCYBmEGzN6OfDUKItLkbDJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrSSdmPM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrSSdmPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696C3C433C7;
	Thu,  4 Apr 2024 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712221046;
	bh=p4+j6w82VtZsXD54otR28kqbdlSqj2lBQn5BULCsTuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrSSdmPMU6cWGOIr9aIskTMnP8lznE37P4IduwDpwKp3RdRq6oxH6mocD8usInBAX
	 i2A+iyNbl/SPYw5dIBuNlZq/bbGA7xIZiv9wXrh6gQ35UDdVkoiC0/3ZfJTATXOWEA
	 tTa0HoCmv8io5VFKBeR4xw2WKAh0IAlvoj8lCoFxGvfUkpMM3VSTuFVTwHAuB3ZrU4
	 hQ5fjsPiYJrsQANelWYTuAOYilDzl1O/RrwmlZ30q+i6kwUkAyIVX/a0oDnTXGEj7L
	 vouNyKqJNxdmg76aSfA6TdyWaITg8PxUcmixsyBN+ovqOU9OvWsxw8yfeH9sRqpuOD
	 wsFfMzZRz9HUw==
Date: Thu, 4 Apr 2024 10:57:23 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH 2/4] arm64: dts: airoha: Add EN7581 clock node
Message-ID: <Zg5rc2GIwpN7f9Z2@lore-desk>
References: <cover.1712160869.git.lorenzo@kernel.org>
 <8465b7562bcf53a0adfdd4ae01b3ed94d6d5bc54.1712160869.git.lorenzo@kernel.org>
 <abff4844-b444-48cc-8dad-18eefa6c386c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oY2uhKuCtxC5QYl0"
Content-Disposition: inline
In-Reply-To: <abff4844-b444-48cc-8dad-18eefa6c386c@collabora.com>


--oY2uhKuCtxC5QYl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 03/04/24 18:20, Lorenzo Bianconi ha scritto:
> > Introduce the Airoha EN7581 clock node in Airoha EN7581 dtsi
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   arch/arm64/boot/dts/airoha/en7581.dtsi | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/d=
ts/airoha/en7581.dtsi
> > index 55eb1762fb11..a1daaaef0de0 100644
> > --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> > +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> > @@ -2,6 +2,7 @@
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/en7523-clk.h>
> >   / {
> >   	interrupt-parent =3D <&gic>;
> > @@ -150,5 +151,13 @@ uart1: serial@1fbf0000 {
> >   			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> >   			clock-frequency =3D <1843200>;
> >   		};
> > +
> > +		scu: system-controller@1fa20000 {
>=20
> Uhm, why is this not a clock-controller but a system-controller?

I used the same approach used for en7523.dtsi. I guess it is done
that way because the registers come from scu (system control unit)
regmap, but I guess we can use clock-controller instead.

Regards,
Lorenzo

>=20
> Cheers,
> Angelo
>=20
> > +			compatible =3D "airoha,en7581-scu";
> > +			reg =3D <0x0 0x1fa20000 0x0 0x400>,
> > +			      <0x0 0x1fb00000 0x0 0x1000>,
> > +			      <0x0 0x1fbe3400 0x0 0xfc>;
> > +			#clock-cells =3D <1>;
> > +		};
> >   	};
> >   };
>=20
>=20
>=20

--oY2uhKuCtxC5QYl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZg5rcwAKCRA6cBh0uS2t
rFDOAQCeK5rxO++40bOf8JtWRi4HTU3UB4MBOHkl4dxTc5ZIfgD+LLWOVZKidKCV
njrOALciciq4vePFmNgL0YLRMfxxyQs=
=k1+U
-----END PGP SIGNATURE-----

--oY2uhKuCtxC5QYl0--
