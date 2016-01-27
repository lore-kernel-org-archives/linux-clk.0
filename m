Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:49:32 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 11/11] clk: sunxi: rewrite sun8i-a23-mbus-clk using
 the simpler composite clk
Message-ID: <20160127174932.GP4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-12-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0lsrIB+s628ok5gC"
In-Reply-To: <1453727747-23307-12-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--0lsrIB+s628ok5gC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:47PM +0800, Chen-Yu Tsai wrote:
> sun8i-a23-mbus-clk used sunxi's factors clk, which is nice for very
> complicated clocks, but is not really needed here.
>=20
> Convert sun8i-a23-mbus-clk to use clk_composite, as it is a gate + mux
> + divider. This makes the code easier to understand.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0lsrIB+s628ok5gC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqQMsAAoJEBx+YmzsjxAgOS0P/2zEmFe87JKBYLQjf8/t8iAS
7YFWYUK0cz4yKrSaT9t/S7nStnT+wa83ei7CcBIffBGK9+YqrzppNs9JxP515DHa
XB4FU6IivOUjoTXkk+ndGNuiJ5ejC46uW07zLTASvJiNrQ4DxRB9xtrFU4SHiaix
WS9fGayAQrLwj+3xd/CfxWoQphmREhNZNW9WkzneSekZgevld9TWYOWGvzmEdjAv
oAAKupD3fIX8Ynw0env4QsFG2rtN5NGGPz6Ep0XJu94myQ/8L1XkEaJqkpr/r7iN
9/EK4bbYn7INC+RxlRG5gwuwtc4zl/un4yEGGS1wZki+e/vQsZSo7tXyXFpx1khX
ws8RiNVAhRljgz+u1Pfxn/GE/wHSOiMr8qrwvMMLhYwzLh33bPOgfU4tigj7bZCF
TTA8J/HNex4QDwsVHVYfRWM2RQWVAFWYwHwDJ+UKg5T+1HD6Fu44aJW8RrjWlcs0
sZ1XX14Bf+HufWPSK9EJvz/pX3VxCWqtcklmNJWRSeZLk/cTh4+Vl5P352S5ROKX
hTjniUPq22g/qcmuitFaolfH0A5viQmVvZVsLVkcN6Bitfo6MJpf77HLsPq/VkaR
0yv10P5D4Rij4h5+AJCrlJ0QVMpXGG69BYbYqo42MSVtKyVkx0UeZGJ4yq/fgrNL
tDDQRQLkzY/uMHo1CeUU
=jmlI
-----END PGP SIGNATURE-----

--0lsrIB+s628ok5gC--
