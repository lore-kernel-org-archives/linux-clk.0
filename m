Return-Path: <wsa@the-dreams.de>
Date: Thu, 15 Sep 2016 21:41:03 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	SF Markus Elfring <elfring@users.sourceforge.net>,
	linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 2/4] clk/Renesas-MSTP: Delete an error message for a
 failed memory allocation
Message-ID: <20160915194103.GA7863@katana>
References: <566ABCD9.1060404@users.sourceforge.net>
 <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net>
 <CAMuHMdVtvg99JY=_+Wj7jpd82=5rKDKOVxg0TYW3wUQsUQzAOA@mail.gmail.com>
 <2927869.3rNkSDiBcX@avalon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
In-Reply-To: <2927869.3rNkSDiBcX@avalon>
List-ID: <linux-clk.vger.kernel.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 10:13:17PM +0300, Laurent Pinchart wrote:
> On Thursday 15 Sep 2016 21:07:17 Geert Uytterhoeven wrote:
> > On Wed, Sep 14, 2016 at 10:01 PM, SF Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Wed, 14 Sep 2016 21:17:18 +0200
> > >=20
> > > Omit an extra message for a memory allocation failure in this functio=
n.
> > >=20
> > > Link:
> > > http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Ref=
acto
> > > r_Strings-WSang_0.pdf
> > >=20
> > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >=20
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> There are two other memory allocation failures printed by drivers in the =
same=20
> directory that, you'll get my ack if you extend this patch to remove the =
three=20
> messages in one go.

I agree.


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX2vlPAAoJEBQN5MwUoCm2fSAP/jXm99UeSF2DXDRuSiuTtP4s
JuRY4fqFF+/cXgt+5R6Ml5sZHmUvxt+5c6HLVPH7AUNvZ1bHEPBjJgsJz7FIaO9K
GH1HbcIS+e9X+eOBWByW+daSUltPcZddcBbx680im0PP5kHdKQJvAmpRpp7MDYab
0hOydixB78m5Z3kJB8uqqLcINcNYbicINC/FhXa9gRthuJO72KAuLRc0WEbVM2e4
tXL2lpA4JyTZp6prJ4ciheaXwDo3TFY5zlFt4WTAmykdjYSfwgSCysuVxD1u8N/q
osR9F3E2oNajsM9/cL62+lZoy4tdpUvCLVx9ckRuVKfrDcXJ+4u4fdjTtbeKN6SF
/hZCqLJNMdiVLda425Px3Rm5lJxe6KngX96M9/ToBYrAB8ooRyfDn7G4oe1NAI9o
h3xgzmRz91+wiXrQe29ovbOqSU3FEBFTsgdAGaE89v+2lSLrKpLN82KZjb4VfkHb
6utt09HtlCSqSdQhfkNpDbOmOWxXDQ8wv7zFwa1dv+d1h7mYwz97XSATFBysr4pC
r2gmFHCZCLgNxmmwUDSKNYp4PglmUo/L4n6/XykgVXSHqtyVrFfZppOrW0mUdaIB
ZX++VfXxUPyP+S9ggTICUd0ROi1R5bglPc2uFErBEMHRkvQ++0qeQNXp9gcmm/gB
6Um/cljQ/tSDoNL+d2jv
=Bkse
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
