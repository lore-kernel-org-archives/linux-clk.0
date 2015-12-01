Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 1 Dec 2015 14:08:04 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 5/5] ARM: dts: sun9i: Add TODO comments for the main
 and low power clocks
Message-ID: <20151201130803.GJ29263@lukather>
References: <1448766190-11345-1-git-send-email-wens@csie.org>
 <1448766190-11345-6-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBdJBemW82xJqIAr"
In-Reply-To: <1448766190-11345-6-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--gBdJBemW82xJqIAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 29, 2015 at 11:03:10AM +0800, Chen-Yu Tsai wrote:
> The main (24MHz) clock on the A80 is configurable via the PRCM address
> space. The low power/speed (32kHz) clock is from an external chip, the
> AC100.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied 4 and 5, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--gBdJBemW82xJqIAr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXZuzAAoJEBx+YmzsjxAgcLQP/0hWWWFraGLng7kgoXEIFHvF
UvOob71mLZqk7eGG8IyBP4hyjBjuHT8Fcff44ZZ6fF9wf5QBI85bFXpBt6G+Ii/o
qdybdFj/uaysXjyl9+YD0EAdulXKp+YdiauCJun/KrIwFlrw8oCHvofqnlzEdwyG
s1CuJSAEGLK6oqk7FF/NMd5t8XevXBmz6hF4MtTnzlVr2TsIAJyPwUomxk5qKO+j
65DzDeZEtWQwZAkJKDWtm4gXKljhbrpzFjjmxhBuWuhfYffLzJZrdbktAHn0B1eG
Ju1NaddXJWCuBZI+rOTJB7DtbL5dt/YTF78XjxSeX3c4ThD/F9FQf0P76gTFl73x
ZTT6lgGVUuZifnwGhxleuvdY9vQrDtN8Dw7vSDRHsQ+S9Z4/3KeAsH642ry6YuFp
p55DwIHcjFdRm/EuYkOOP6KZLKenU7qQS/Afh2rEFiuruV7SNgyJh/sbdcbGDVbO
KqugyJ7DG4jCyWBk6bjbRczlIsSXKK9Mi5Skh4tkl6ARPJC/SrMWP41m0fit/j1K
u3oM3gVftrNMYu/4TPrZHnveiOWEAc2mHGJUR5WRXbnvQtkLZdXpxKoQzDqffhHL
KwZ0PjjhBiJJFzGSPnaD0UNbZcF7LVOFg0w6q1ZnPaHvF5sTDSpDjgr4VQkP8z7v
oihGWXBuV7w2e8fHy5e2
=R2fo
-----END PGP SIGNATURE-----

--gBdJBemW82xJqIAr--
