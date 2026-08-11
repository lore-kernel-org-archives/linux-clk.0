Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596234D90C;
	Tue, 11 Aug 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467616; cv=none; b=IK/q87A/CKgd9lcCHACjKQ9AXYIC1xVK/rkmsQlGWx2hf9ZNy+eWy8/+p/0BFuOe5ITsEBD9oqEBcomFheAAAcOvG9CxX4eVQ/N4NwUTVN4/oV3JCroxe23590o6wK9Nj0jca2fxfiiRgnE07737aTkqWSMM0S8VdpiU806zmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467616; c=relaxed/simple;
	bh=KeZAkrBvvBWBwSug4H9OwlngXqt7DyRbWn+Ol3WFt/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6dwHalm5v0kDhCcyeBtSp/gjICIl+9OGyXmE3R77LFjuLG4XUxmc+PDAezlGZTXRIByh2D5I/71RQNVnCHozc2N7gN9jdvisXZFv+5ww+48QTD7PUKDZyqUNUwDxHpj29E2VYiLcZfT0Rx4+Ab3ZGG/DSbtaFAlcll18Tl+63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FESLREwK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FESLREwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1D11F000E9;
	Tue, 11 Aug 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786467612;
	bh=uW8hLwKwvgMfYIPD0vwwNI5aDIVNxy/Ai/c+z6t5lHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FESLREwKFLBlegXCXYT/pv+Nb0HnRmaCuEj+Iw9y85ATS6bMesQ6zx44iH1sWzaFn
	 ncYjvjiPDc+AxYqM39dtCSjfL8JMfWR59F2TkPiSz5F4ydRp2CPSV/DYQOxlAL1nvk
	 18H9IsmnLhIiRU7nc4l8r68q2XSPct3og4r6Jo4P8CKtI94p315/Mobm/yb5XrTkUH
	 IQSbOmYsgWMStAba4L/mCnnUGHlMx6nW9hh9GCSDJLPTwxTdFwYPFUHj7SrOlU+Od/
	 cT27FtbUiJ6G3l7AHdr1hF0fzrQu/axY6A0JA7wOeSc2f38VcjtyJvTujRktQBX4p9
	 V31UL7S6dKSzA==
Date: Tue, 11 Aug 2026 18:00:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260811-populace-afflicted-40a40e0f484c@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CtK5EKNoAsQivl3f"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

--CtK5EKNoAsQivl3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:

> > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:

> > > +static int __init starfive_socinfo_init(void) {
> > > +	struct soc_device_attribute *attrs;
> > > +	struct soc_device *soc_dev;
> > > +	const char *machine =3D NULL;
> > > +	struct device_node *np;
> > > +	struct regmap *regmap;
> > > +	char rev_char;
> > > +	u32 rev_id;
> > > +	int ret;
> > > +
> > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > +"starfive,jhb100-sys0-syscon");
> >=20
> > Remind me again why this is not just probed as an mfd cell from the sys=
con
> > driver?
> >=20
> > (Hint: please put this info in the commit message).
>=20
> The discussion result with Krzysztof at that time is recorded here:=20
> https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quoll/
>=20
> One register should not be treated as a separate device node.

That's a different question. In the case of an mfd cell probed from the
syscon driver there would be no devicetree modifications required
compared to what you have now. e.g. sg2044-topsys.c

--CtK5EKNoAsQivl3f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCantVFgAKCRB4tDGHoIJi
0lFUAQDQvErhGWh1GPKjl5npBVRgz0mxYgiMDD3N+RV5dXnjfQEA2tMdSc2XqHx8
20d6W/Qs1vDPymVXp1wbnroZbe4nog8=
=lAVE
-----END PGP SIGNATURE-----

--CtK5EKNoAsQivl3f--
