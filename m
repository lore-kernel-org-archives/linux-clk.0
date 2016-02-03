Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 20:29:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] clk: sunxi: Remove clk_register_clkdev calls
Message-ID: <20160203192913.GA3327@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-6-git-send-email-maxime.ripard@free-electrons.com>
 <20160202112604.447baec98bf89a79542fd240@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
In-Reply-To: <20160202112604.447baec98bf89a79542fd240@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 11:26:04AM +0100, Jean-Francois Moine wrote:
> On Tue,  2 Feb 2016 09:47:14 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > diff --git a/drivers/clk/sunxi/clk-mod0.c b/drivers/clk/sunxi/clk-mod0.c
> > index 578bff0dd251..b38d71cec74c 100644
> > --- a/drivers/clk/sunxi/clk-mod0.c
> > +++ b/drivers/clk/sunxi/clk-mod0.c
> > @@ -15,6 +15,7 @@
> >   */
> > =20
> >  #include <linux/clk.h>
> > +#include <linux/clkdev.h>
>=20
> Why?

Because this driver uses __clk_get, that it was previously included in
clk-factors.h and is not anymore, and that otherwise it won't compile,
obviously.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWslUJAAoJEBx+YmzsjxAgsxUP/js9xUXAET+Fjg1q3sjnXY5/
PZ33rYmcUTUdNEotRTJW6OuLSGeYRstK2+S4YFb6deoVc7uFS7o3gwW+Vmk3hDHR
Rtjj4yMIlBORQI0sl2LmU6tAELUZkPFCrIIGfjgqRlvgzxNPLQ7EHLj/EC553gTg
G4l4NNJyMIt94cNo1tgMVVoSaV62cXkcj5dduPgMka6+ItK3A+ooaolrWJetiyt/
nJdL2X/9EYbhpT9G0M4rOztwqoWq2fd5VxtYbdjGC9wj8dzniMhgId0QYh5++XQe
GSU90u3seaOS0LED87KOXYzxNS8g1qUttqumdNzgfPOEJaVdeJm9A0V+JNoWpKpA
lb+CgZVb+MGx8cKyWGGg8LglV6LYftJYlkepwoZaBQ8A4rfvpNZPK2IUPDCao8Vt
6zFu9Tyz0ZsweWZhggARWC8joU7ZycZgjLDAGK3nGhHMdWchAmIKG/O+lpxa4LlM
JSKoB23VnUqhqmCFyejw1ANxmzLgPTpz9FMv+RuS0NBxPdWCO7gMsgLS9MugL+Mx
hwjR5cID5KXQXCVjIC88H5EsH4muWrMNom9eu5CIXX7z4FKJ2YvZEDgWFfgt5vBF
dmzSK5L5hjR/jRu24mu2OUkpD7inIJvGZeEVQBW6XmEmZe+Ss/bUbF0gWUbn4owj
tOAJ6Ppk3mMBGJYYgLwy
=a0x3
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
