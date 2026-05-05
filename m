Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01A3644A1;
	Tue,  5 May 2026 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998782; cv=none; b=HJi6fSCNfW6e5+3NlHMELARZvfvEJbbmemHaCcliVhvipR8o9EvfIlIjDD8duVOsvp64SDsnC1QSXQL+ZcK68KcMs6sNm5D8XKt+HitWTsqmSeHIhShCvSfaivZfJ0PvmxM0B31BR0i2mQahB4bLSjb1fYI2V4N8JOz+5aZ3QwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998782; c=relaxed/simple;
	bh=h+WTtL0bj9Z8btw/vRdQkzaH0xaKnAYTnbozdOgXX9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4rOIQcEjfzE2rrdFKrwtIOjLOv3iGIpD4S5Sg75N6ZcBzzJU+Srjs5MqAEnyfGiAp3T8GZgIZOcKVCJ6Lhf0ioTNi4+1vox3SB1CfUxqZljMlE/ZxWQJYb7Ld4jOchjGiUBG9bd2j2sS+HiFP7x20m92x+M4QuI6CpF3FDWi4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3DA961F80041;
	Tue,  5 May 2026 16:32:51 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9C7BDB40578; Tue,  5 May 2026 16:32:49 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 84B44B40578;
	Tue,  5 May 2026 16:32:47 +0000 (UTC)
Date: Tue, 5 May 2026 18:32:45 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
Message-ID: <afobrW9UFtNW0B1k@collins>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com>
 <afoRe6DI4GJIVtg4@shepard>
 <20260505182017.10d71c11@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rq9iZSTGYiEAWlha"
Content-Disposition: inline
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>


--rq9iZSTGYiEAWlha
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Tue 05 May 26, 18:20, Andre Przywara a =C3=A9crit :
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> Hi Paul,
>=20
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c =20
> >=20
> > [...]
> >=20
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +	{ .fw_name =3D "hosc" },
> > > +	{ .fw_name =3D "iosc" },
> > > +	{ .fw_name =3D "losc" },
> > > +	{ .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +				       hstimer_parents, 0x730,
> > > +				       0, 0,	/* M */ =20
> >=20
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >=20
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >=20
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>=20
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

Oh right I think I got confused! These clocks have no M but they have P.

Sorry for the noise there.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--rq9iZSTGYiEAWlha
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn6G60ACgkQhP3B6o/u
lQxmzhAAgwGpo6Kmj27yWIQtH71oCqnC0lDHBP6All8FXvNIA4nxm+oerCxRpcwa
5pJkouva0w07D1W3+2f5ctrnPeRxEM/SmppEkEZqeoiaZCVdRgH9+XhULT6GuuP7
JsqKSow7rW2Fd620cNHNoH/STGwybziFzrgwauDmrHYFOfp/52RjvXssreLkS2Y1
FC2ehf1UVRVPsaV2Ae5Q8UB4gkLOfQBiL7R2OukqrwU5YaOZ9SUOYD2x79YsAHxp
oGgQD0ZEQIJIaVl+d3WmXyRomRK+Ah2AOVQxaUvKjHgQFfEmqs9Ut9k1CWZznZ2l
isu05RSc8Dgwo15vDTRJGp1zeCBo7RX6AZbhNJz7W4kbn8CKl1bamkBfG3/Jd77C
zhDbzJcRWusfI1YmSLDbOdypmDoZd/FFjyG8ZrH3qzt7HZoJihLMiqZ5FrZX0egs
je3DCmsHdn3AG5OT91kLqchwg9WGtM/GQTclS/I4AY9tHrdHOPRPjUp+o6uUKi7l
OMGjqbkbRgBXkC/jaq45of5eed7ND45QJUnea+hLq14RH7/yAIATLR70muHhUfRa
LoyrtJogmYE8QyGmsCxF2XotvJ1Fh2ZhGc28oaKTp8WG+Q3wYZVSRdCUs+4a1FQ8
AoLEvT97Y+2B0qG3LUsjNxJOOPD8LDm6+tJcGS62DRag4APqV+I=
=h3+g
-----END PGP SIGNATURE-----

--rq9iZSTGYiEAWlha--
