Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 Jul 2016 10:06:36 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sunxi-ng: Fix inverted test condition in
 ccu_helper_wait_for_lock
Message-ID: <20160715080636.GP4761@lukather>
References: <1468464155-11888-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
In-Reply-To: <1468464155-11888-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2016 at 10:42:35AM +0800, Chen-Yu Tsai wrote:
> The condition passed to read*_poll_timeout() is the break condition,
> i.e. wait for this condition to happen and return success.
>=20
> The original code assumed the opposite, resulting in a warning when
> the PLL clock rate was changed but never lost it's lock as far as
> the readout indicated. This was verified by checking the read out
> register value.
>=20
> Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Mike, Stephen, could you add that patch on top of the current branch?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiJmMAAoJEBx+YmzsjxAgiyoQAIp7V2fQYr9hr6PlX6+r20xe
y/oFmGvACu281i8h0xuZFAdnzHhmj3mS74pWjJrG+CVTC7C2BX+spSwrCrGGrdA5
FjsmROOAOR2siDVRIOX2ioE7wacIcth1zRQdPMf7n5HozE1SMStW8I+lzJsA5y4a
iIbQ8cwzAEGS7bfzS+IAxwIggL3314LqFxZlUnGFK6xEs9S/1599wF7nZpKGAZPE
hv2wuijdKUjcGVSmieDOyXu17Dz28oE06NtTEq2bCRhbQfuFd8yq4XHJFxhfYYLD
ZG9a0nZ+7FPDSBJUBYmLb36hpAn8mVKOOL6tpyy77rB3Q9IxPUhuBbwzAKpBVt7S
zic/DEx8dGAPc4b98HB4cT8DeRw/hcGwDmBWb8vOro4qqqlwdLehb6Gj+OEQzz5T
J+Vu6xGUej4uqPWcRj0HeVG651CqdNqsIQbQ8wYmoD2rPSOopy3AnnmZkYUz+ZgE
seeJxJSNf8J/UT1mbVbfterRnBVj8L/VIxFpKpmUSprmF80fSBEILVqILpI7d2eh
jIv1lvTypz4uRjclBOxmff70/AvbbEtT1odkXQaQZMSYFIMjwYoW5ykP5hAORSS3
SHivjybejM832G+DQ3Uy85ne2rmJDJub9Jx2dJZ7GwimbP4IoWFLNEs3MH6kGC72
5+glo7aQhMJh4XsgqF48
=TBt+
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
