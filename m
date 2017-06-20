Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 20 Jun 2017 09:45:48 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock fixes for 4.12
Message-ID: <20170620074548.gqs6bpu2fo2bm67v@flea.lan>
References: <20170614192119.xktlt4o5puje2pdu@flea.home>
 <20170614235042.GF20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a6svomoeiks4q3om"
In-Reply-To: <20170614235042.GF20170@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--a6svomoeiks4q3om
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Jun 14, 2017 at 04:50:42PM -0700, Stephen Boyd wrote:
> On 06/14, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >=20
> > Please pull the following patches for 4.12
> >=20
> > Thanks!
> > Maxime
> >=20
> > The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c=
43f6:
> >=20
> >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/=
sunxi-clk-fixes-for-4.12
> >=20
> > for you to fetch changes up to d85da227c3ae43d9ca513d60f244213cb4e55485:
> >=20
> >   clk: sunxi-ng: a64: Export PLL_PERIPH0 clock for the PRCM (2017-05-31=
 21:57:30 +0200)
> >=20
> > ----------------------------------------------------------------
> > Allwinner clock fixes for 4.12
> >=20
> > Some fixes that fix some bindings that went in 4.12, fix a few reset and
> > clock offsets and a build error fix
> >=20
>=20
> The last few don't have any Fixes: tag. Is that because they
> aren't fixes for anything in the tree? I pulled it, but I'm
> second guessing it all.

They probably should have, I'm not sure about it. They are amendments
to one DT binding that got merged into 4.12, and must be merged before
the 4.12 release in order to not get bitten by the ABI stability rules.

So yeah, it probably should have had a Fixes tag in the first place.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--a6svomoeiks4q3om
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZSNKsAAoJEBx+YmzsjxAgwOEQAK1DLVx+YsAYuns9jcBAgwbF
K53a3eCak60+Z91q6EwOfpcDpVHyOv/lopbfIKXClbr3jP3NuCku1X/tdeT+ImMJ
gtLfRo08+2Q4L+iqAwilt7v1NNOuBgTLq3cDgkhlHP8gADmdbtzV5a1OxFO7IsYB
o4hLaBV0KD5gqWYtxGzJVyNQN9afaFO2JCPyV0bs/hfPjG8QA1aTYCTD2Ofg7E57
U4azcC5Vwgm3wY4E1tN4BmpN7me3bN5k14D2++bRRCzbrv9SyQcS7jWRcTX1eV4o
KCn/NNk8/4GZyLNFvW3IAZVmX1V4kGrsClssICXB6bv7j8I3UMMEHB35acptd+RJ
z2Q5mrP10rzZT59ZExWr9M8b59ShA7b7AihaEoDTAGBL0GAnmzbCKXIkaFaapVu3
+90wldHZwZ1uk2Ptx95dypZttrJIHABNqCL20MKD7WKgAAmX7+x9XTjAZ9vKhnKz
8A5AkDjddUTFlKj1Ath25cXr5FY1gmrG++Fhd4IqEOI3rf5OlUGMzFJRjh5fDLMs
dwqVUh//5U00RzW8qMZkjHjUUD6qGZ/G/FGPInHFEBlLcU+MzAZfaU733oIntnMo
+WrANcXee7s/l+QPCp/1Je1YQZNwKJ6H8OTohg7Yd/eHhNJQmalm/PM/6/SScCa2
aFFGTFr/Tu0ELjUcyYab
=warX
-----END PGP SIGNATURE-----

--a6svomoeiks4q3om--
