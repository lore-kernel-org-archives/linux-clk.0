Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 1 Oct 2015 08:58:59 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/5] ARM: sunxi: Add R8 support
Message-ID: <20151001065859.GA7104@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <1442566130-3497-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150930223829.GG18556@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lBPdJKrYqo3eKYSb"
In-Reply-To: <20150930223829.GG18556@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--lBPdJKrYqo3eKYSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 03:38:29PM -0700, Stephen Boyd wrote:
> On 09/18, Maxime Ripard wrote:
> > The R8 is a new Allwinner SoC based on the A13. While both are very
> > similar, there's still a few differences. Introduce a new compatible to
> > deal with them.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
>=20
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>=20
> BTW, why is the entire series sent To: Mike and I? Are these
> patches intended to go through clk tree?

I wanted to have the Ack from one of you on this patch. I usually
prefer to have the whole serie instead of a single out of context
patch, just let me know if you feel otherwise :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lBPdJKrYqo3eKYSb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDNmzAAoJEBx+YmzsjxAgPTMP/iNZtjaCfxHXz3Xs7zUeHBMn
dH6x6GqMrc7q8Nwzm/nQjp9W3W7GabtF10hEMvZN0awtoyYR9Fzm4y932Wc6y5yn
Vqt3nGOg0OVFNNZDT11F0Fwdj3xevgFqMj+tI5xrnjTng5Efyr5zRzIbr82TM2GP
Fcogg/jOFR2QA0S1RdwciZt9k+u+HLeONl2vhHFm1rDcQSe81u7TmRS8bkfsx2i4
TOyY/VCLCchwCHI5E3F/fO1UfusX9oW9VvfkgvzuEqAeGvEIvvRu/m7ecAmPabeg
sX+UKBOufO9nzlq822QFajARR0b1mg7ZjtopRp06Yrcd7G6w0CeYn2lhtaViaexi
Rxg5GDQM00Km7yeO9bwdhQIV3Xlw16QiVVPeE9EYJqw1Wjfdv8TsPEIcXWrinNWT
EfwcOGWC9PlLLb/Z5gMK5sn+CjWvk5Jbibgc5xwQRSg2fV+R2b+4dYWkftXT6tm/
cCmF/PlMMfFwb3G8F7n0dVlwCS5bvK8xp5yrr0yf7sRv+/PqEVPN4P2OZSFAR1XC
fN4G+OrT/9pLBsyyAekMfPaaFxIDziF0Xk78OIHimHD0swuZVm0wL4eNsZtiXQLg
FEzUMLvHFxGhjMzEbq53e8y1LX3l2c0I+T3NBdRmcJLSDentdL9bOpHt+6gqz11F
WeOwns+k2MPm97aCMGjz
=JfAI
-----END PGP SIGNATURE-----

--lBPdJKrYqo3eKYSb--
