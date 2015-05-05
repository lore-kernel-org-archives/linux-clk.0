Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 5 May 2015 17:44:23 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: linux-kernel@vger.kernel.org
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: sunxi: Fix of_io_request_and_map error check
Message-ID: <20150505154423.GO3274@lukather>
References: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430579006-32702-3-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
In-Reply-To: <1430579006-32702-3-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2015 at 05:03:22PM +0200, Maxime Ripard wrote:
> of_io_request_and map returns an error pointer, but the current code assu=
mes
> that on error the returned pointer will be NULL.
>=20
> Obviously, that makes the check completely useless. Change the test to ac=
tually
> check for the proper error code.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org

Applied on my tree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVSOVXAAoJEBx+YmzsjxAgC+0P/3zEvW0Ye2xuF0hZRwtOeA2J
ATmZZwxg3yjqjM179Ccfbwg2D3wfOCXjKCbYzZthQCbhAIAkQ4npOWYY1vGKojSS
hARf534YRecl6PMjjbKPr+SsbypdJK1jUU3di5Vq3V/plfpghUUQgikN510pkzIO
AM31XRarbGrXCBOQMGG815SYoTxFh/0xtoNoh3szxJVRM0d0l4h13JB32XKW+zmM
QptwSp/OYsFQ7Ad/61V0LrGkU8j27IqiiNXs+B7Bk0NLETOGJ6doNwDItyRbqNH6
YLUQRFr9weE9dmdc2VpUiLutUMvsIk0o0Aj0E8c+gJ/BXNedq9xDnDKFHMev+rJD
V5lEXtGIYVbENw3eSuIvZD+WbB+G5zLXgWyOr7fz2wq4VsbZblLbLL0ZdW8wi+/r
E9lOriqwU/GFBoHjOdXu/Uc8ECCTkyqaAZUrjUBGXmmDriZiwy1/FQ0BcLY7j+CN
6P+lm0KelJNAbkowCmvO4y5yPjFCmHLH6GHn+1ZNJBGBVx3iOMG4jrZOfm4Q/VRO
M0wjS1UtN9v+vRgpNQz5XKPAYWq0+XDB/KK+NIYgu9XDEzEuT+dQSZSpdpvvquYd
jUX+JPPTLTLhJTkfUZ3vED0s3FRWuWCaTSWToUPzSOZ3esjtwkt5eC6QnQup36l1
1Boar2D8YBOiw/JpZMYU
=WawV
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--
