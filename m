Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 5 May 2017 22:04:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Yong Deng <iemdey@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2] clk: sunxi-ng: v3s: Fix usb otg device reset bit
Message-ID: <20170505200440.zje5s7x2seglxzi6@lukather>
References: <1493980317-39775-1-git-send-email-iemdey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sjuwigzvkwue2d5a"
In-Reply-To: <1493980317-39775-1-git-send-email-iemdey@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--sjuwigzvkwue2d5a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 05, 2017 at 06:31:57PM +0800, Yong Deng wrote:
> V3S's usb otg device reset bit should be 24, not 23.
>=20
> Signed-off-by: Yong Deng <iemdey@gmail.com>
> Reviewed-By: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sjuwigzvkwue2d5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZDNrTAAoJEBx+YmzsjxAgt1gP/jz2mZKFfW0M9+r9AyS8iyJF
obN/nycxGtPUweNdPWWPxEcN+hllB7w9BllCwgtM/10eNo3Xt2OPnU6XjMD21RRr
PBtpVd0gFzNDFtNDJ4UEi8Wrx0LzPEkTZJhA9jgUhghd3nNus9g5FF3qTHwN2Zy5
MfNW9pwriCbGlATmIWNNejsDG897vM3XiNRtHxsHPLWGmSmSJk+akwvY1hV4bbJN
/xbcL6+/OoOq2Sd3Yts/bQu2ZEa2NwO6Uj5djPFZ8++JEzoj3pEFKbLJcHUGMKcP
hiCXdUwitiOnEKVwcmrzYgJHhtmay8YNbUnRPlUGGhZy5xq/PJxfYkLSrxspKO/h
L8i6gvD069JOyo3EMVp+D7kSarJke38lf3rJLtV/S+b3FOS2G5SpjnBOMlCBwxBR
Ihk8Uzxx7voZrmq/tZU8B0Pw8VETffVxhL8TiB603JHKQYWFm2myqETFLZMOZOLl
J+rkKzGmpKlV1gYwnLDUxUPXJ5ECQAsXKWK32geNuvFItYddDCyzvQNB06tccPDl
dt4ojCCewG8a2q8ZlEyhkw0a1rrynS8ScEWvHJdR99PfCgTx4/06SgpRRE9KkPMO
UAE//JNl81fYfqkxBY4le+IgSs0812+YMpeWG3zOkoqeCPEBcGKidiVTRuXftyq5
B3+Da97v9Zu2xd6927WA
=m2CX
-----END PGP SIGNATURE-----

--sjuwigzvkwue2d5a--
