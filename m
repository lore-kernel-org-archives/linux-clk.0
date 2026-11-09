Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254463;
	b=XCTzjWs/A1ykLW/XKp9FYe0/qqf0n1o++vYXMZ3T1kGyuoEutS7F4EcbVZBgeA+BhuUs
	 22ucsTAsnPX5TBeKj3WpktiGrVuTTzPEy9fvFwrItXku6ZTjAIsqxb5zD7j2PsiIXDvtn
	 82K3x5+5eBZCERzjZz63xH6ukNlX2irnvPQeygc/6guRxpmnRouXXjsqeXkSwu8ZyXjXb
	 7/JI4Ry4Htmzp3/E6+TO6m9BHCjyWTFuOK1mO99iN5kDK68lol/qrnzl/PpZVk6lWzrvr
	 /j1A1nlpMVAOTZUIQ3C9cplFmwBUizaclkCj+qp9bCmuFRKD1776niufOnzHYYPyehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P7jSto59tdJrw3RQERDDjAtXnLEK6c9QKze3NHTatt0=;
	b=K7ilzXMKB9QZtkAd4YNiCYX30iS6axdBxb4gU/t9OWzLkwMC9uOwXRgD+wDel+V9hNg1
	 2elh1jucApdHWaPnGStwBnhHqiyLp9qgyByIyW7l3rKCj5WmCOpPIg7rU+YXMerB1cjk8
	 Km/h3uxmxTkJZZ0WuDxw1WuM9lmQm2aQzjboYY9ZEORwdSWZDq3/WNlon4TeTIbJczN+C
	 Mvpu4dWWteHBcZxXN/SV/4+UYl3iXJOH4ee/4IzfBHA60hjnWDVeXgnyuK8izVkpIVytQ
	 3deGykTW5WVfi+8Kd0ujfbzwbMj7GWUQastwK2eSUq3bC4wBIUbRhGnd5noXrG7UplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJho8w5d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FD606A325;
	Mon,  9 Nov 2026 20:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UJho8w5d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC951F0089F;
	Mon,  9 Nov 2026 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794254462;
	bh=P7jSto59tdJrw3RQERDDjAtXnLEK6c9QKze3NHTatt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJho8w5dKe3FK6W0g8tq5XMDORJKANvYjyIyIxlseVqPC2tIsj8drWc1XUqb0IU0O
	 omYEuAyeSAljPC36KQ274/W+uF7DhFQr8O0Ox3evgt78G+/DeJaGAxuxElFdRNSIUO
	 r6wJC6Asrva53qy0+A/aeZJo98W7KqVi4F6bUWgOFlcK3NlUGGNV3Enc2lISGaSOoW
	 UFLYBiiCg3Y3ubZRqDY6IFDHUgi4kwjbNAnE2UD1qFyjuW+CUIvkI0c/sssL0MvB2W
	 25txQ+9U/y8fihvBYijoAHsYtP5TBJdjpWBuADjlj0xYA3uQGobHA3VFMGRsuBJPEK
	 sHDDdR63gqdQg==
Date: Mon, 9 Nov 2026 20:00:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <ccaione@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <20261109-stature-splicing-a146b4cfaad4@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZOvYbo4taMHc1DNb"
Content-Disposition: inline
In-Reply-To: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>

--ZOvYbo4taMHc1DNb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2026 at 09:37:00AM +0100, Jerome Brunet wrote:
> On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> >> The S7 firmware exposes clocks through SCMI, including sources needed
> >> by the other clock controllers.
> >>=20
> >> Define their identifiers so devicetree can reference these
> >> firmware-provided clocks.
> >
> > Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> > vary here between versions of the firmware?
> > They're also not a "made up" set of indexes, like traditional clocks
> > are, they're real numbers that come from some document akin to
> > interrupts that we do not have bindings for and no driver is likely to
> > reference these definitions either right?
>=20
> There is no such document available unfortunately. I'm not sure one
> exist to be honest.

The "document" in this case is the source code of the firmware then.
The info might not be printed in the TRM, but it is determined by
something, Carlo had to get the numbers from somewhere?

>  Those IDs have been stable ... so far, but sure,
> a FW change could change them.

You'd need to be stupid I think to actually change them, but I'd never
put it past a vendor to do just that.

> The IDs are totally made up, in the very same way the other
> amlogic clock driver IDs are.

I doubt that though? If I decided to add 32 to each number here, so that
PWM_J was 48 and DDR_PHY_OSC was 32, the whole thing would fall apart
because the scmi clk driver would pass that down to the firmware, right?
Don't the scmi spec/binding require that the clock cell contains the ID
used by the scmi firmware to refer to that clock? The rpmi stuff works
like that, so I can only assume that scmi is identical in that regard.
Were these bindings, I can create any elaborate scheme for coming up
with what each number means, and that often happens because you have
PLLs, gates, muxes etc all sharing a sequential numbering scheme,
whereas here you must use the numbers from the version of the firmware
that's currently running.

> Providers and consumer just need a common
> reference to desginate clocks, this is it.
>=20
> >
> > Is something like this not more suitable for being included as a header
> > in the amlogic dts directory?
>=20
> If you think it is more appropriate to have them there, it is fine
> by me.

IMO all these SCMI/RPMI etc IDs are not suitable to be bindings
because they can change if the firmware changes.

>=20
> Carlo if you have to respin with this particular change on the DT side,
> feel free to add
>=20
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>=20
> >
> >>=20
> >> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> >> ---
> >>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 +++++++++++++++=
+++++++++
> >>  1 file changed, 27 insertions(+)
> >>=20
> >> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/includ=
e/dt-bindings/clock/amlogic,s7-scmi-clkc.h
> >> new file mode 100644
> >> index 000000000000..10d7caa5d1e2
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
> >> @@ -0,0 +1,27 @@
> >> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >> +/*
> >> + * Copyright (c) 2026 BayLibre, SAS.
> >> + */
> >> +
> >> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
> >> +#define __AMLOGIC_S7_SCMI_CLKC_H
> >> +
> >> +#define CLKID_DDR_PHY_OSC			0
> >> +#define CLKID_USB1_PLL_OSC			1
> >> +#define CLKID_TOP_PLL_OSC			2
> >> +#define CLKID_HDMI_PLL_OSC			3
> >> +#define CLKID_USB0_PHY_PLL_OSC			4
> >> +#define CLKID_USB1_PHY_PLL_OSC			5
> >> +#define CLKID_USB0_PLL_OSC			6
> >> +#define CLKID_ETH_PLL_OSC			7
> >> +#define CLKID_ADC_PLL_OSC			8
> >> +#define CLKID_CPU_CLK				9
> >> +#define CLKID_DSU_CLK				10
> >> +#define CLKID_GP1_PLL				11
> >> +#define CLKID_ACLKM				12
> >> +#define CLKID_PWM_G				13
> >> +#define CLKID_PWM_H				14
> >> +#define CLKID_PWM_I				15
> >> +#define CLKID_PWM_J				16
> >> +
> >> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
> >>=20
> >> --=20
> >> 2.56.0
> >>=20
>=20
> --=20
> Jerome

--ZOvYbo4taMHc1DNb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavImeAAKCRB4tDGHoIJi
0hQKAQDN0pzZBsb0As8aA5FqO05ZDYuMj6hY98TaP1rhNX+WCQD9H8xa6k1zh/pY
hDK7ZnhGrwphHsRAIj55iQAgNLbmQQM=
=viZp
-----END PGP SIGNATURE-----

--ZOvYbo4taMHc1DNb--
