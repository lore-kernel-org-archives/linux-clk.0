Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672B47A0B5;
	Wed, 12 Aug 2026 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550396; cv=none; b=WhYglj9W1Gfi4/sFcdxKDoAL+96496f8LKM+/v7CD2B8WHKB3c5Anj8wfUirt4H9pMkv2oINM3jE5yhoUPXNnB3GBqn/kA+V5CCE+MZn6HWXfhNvJZr/XdIAPi+RuTDvICbqXwZ+K4xIKelxm8+1H4nhpgmREDoq20A7KAYE1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550396; c=relaxed/simple;
	bh=aZQt16LGIzHzurcmUs+2QEre0j//O7HWI34VN031cyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDlGD2Oum62zd3+R+72iiyJ1g+v+AAroVvrcJSoA9YVL91ymqeNoPs/IsKv3JEjVjrzTWKXfQdNb9ii4j/BepGWlKmdMYQAFKPh/ct96Nsa25rwBdeDHqTOQ2M0rLzA/e4Tod9bZmxDOffTiq/At8dgKjsSUNlc8TbO2S/DAbEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4x2CJIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4x2CJIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2C61F000E9;
	Wed, 12 Aug 2026 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550395;
	bh=NJMRKZ9D8pGUWxUVQCuDMkaEokEMslK+PwySCE/fC+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I4x2CJISHc2FxH+B7UiF7P/CqeEUKKowIsan/P2PhclryvOb5Wh4AHVLrIADFuUCT
	 3CgcHzSzzqKY6kvrm3Qk2u4z7P/1g2NMASzyhdGi77YRofUgjIWLqfDi2Z5DYuyPGx
	 j/K24JunkZXfk8zc4FQzotmgKXRozW97FqCSUIkb/D4tYB02W/TWZw8qUefsRTgZ3u
	 XjYIN8B2KvDorq4w8AVcVu6umKTwi0ifne2raoqr6jfUC9OCcVGYe9lp3YJSN1kcXd
	 3taGXmyCh5OPHJKwxJ4h/4I5PXGiqB2MdxpYeJG1B/RoqaoGpJlzIBCzJWL73hcVd0
	 M+kvV8FeUe68Q==
Date: Wed, 12 Aug 2026 16:59:49 +0100
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
Message-ID: <20260812-snowplow-punctured-28d19616f707@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0/8ZYX86hXcV68ER"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

--0/8ZYX86hXcV68ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> >=20
> > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> >=20
> > > > > +static int __init starfive_socinfo_init(void) {
> > > > > +	struct soc_device_attribute *attrs;
> > > > > +	struct soc_device *soc_dev;
> > > > > +	const char *machine =3D NULL;
> > > > > +	struct device_node *np;
> > > > > +	struct regmap *regmap;
> > > > > +	char rev_char;
> > > > > +	u32 rev_id;
> > > > > +	int ret;
> > > > > +
> > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > +"starfive,jhb100-sys0-syscon");
> > > >
> > > > Remind me again why this is not just probed as an mfd cell from the
> > > > syscon driver?
> > > >
> > > > (Hint: please put this info in the commit message).
> > >
> > > The discussion result with Krzysztof at that time is recorded here:
> > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quo
> > > ll/
> > >
> > > One register should not be treated as a separate device node.
> >=20
> > That's a different question. In the case of an mfd cell probed from the=
 syscon
> > driver there would be no devicetree modifications required compared to =
what
> > you have now. e.g. sg2044-topsys.c
>=20
> This seems feasible, and I can introduce this modification in the next ve=
rsion.


In fact, you don't even need the mfd cell, because your driver is going
to be in drivers/soc/starfive anyway? You can just bind directly to the
sys0 syscon I think.

--0/8ZYX86hXcV68ER
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanyYdQAKCRB4tDGHoIJi
0mobAQDzgMmD/jVoYQZei6nTfuveJwdi4b685lws443NIXWP0QD8DBQJ1Xj3fQIg
zQ75R8EGuONF53vKAnR/U0HiwfckDgE=
=Qh9P
-----END PGP SIGNATURE-----

--0/8ZYX86hXcV68ER--
