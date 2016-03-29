Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:37075 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752146AbcC2Pqj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 29 Mar 2016 11:46:39 -0400
Date: Tue, 29 Mar 2016 17:46:33 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/5] clk: shmobile: r8a7795: add OSC and RINT clocks
Message-ID: <20160329154633.GF1398@katana>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
 <1458824442-20279-3-git-send-email-wsa@the-dreams.de>
 <CAMuHMdWWUL6+4_vMX6QAddUyy+kbPWxq2fyRQG_Nz-LG_bmzLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
In-Reply-To: <CAMuHMdWWUL6+4_vMX6QAddUyy+kbPWxq2fyRQG_Nz-LG_bmzLg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Furthermore, why do you export R8A7795_CLK_RINT?
> it's nowhere referenced from DT.
>=20
> I think it belongs under "Internal Core Clocks" in r8a7795-cpg-mssr.c.

Ok, did this. I thought it was the same "class" as OSC, but I agree to
your view.


--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW+qNZAAoJEBQN5MwUoCm2plQP/01ESK8bPNHMJr3Xh7Xzxh+w
9vwDX7SctEbOkbbfJDe2FlLWp/9uIw6hoQWY9G8z8dIml+oD6qBNOEJAZS8Xb+0o
OfjSyDgU8Fo+HVveLhp/gpYffb1ZUBU4guzSY3YGKdbi3JgQGkT5kV8uAEXL3q0f
AlipN6qrKpEaGIvuXSdgZsHhHfAVSyZUFe7cdYsCYSV+NS56dESTIM/9cdUfk1Ox
fIhsdcwWw4yqHg++eNgFHMV6nYQeVPUb1MZeOs/vB02zkDtVEI6ZfvTQDw9rhT4L
flY5CUW5RkQU2hFQEzmfR1gz5OFbzffOY2IlOPOY+ZufcHmbbra+rAgdHtaCGnCf
3HNNGv2lNofmZqStjtNFMFoTxA9hZy8/ArLHEoedhbqQL2uIKLcj9CySF2pLOMMY
4PUQMbxIQPyZWG0EkcEsu6M/R7pYFTYC92nIneLaRdwmFXG0zMBQ620onWHtfCuQ
YjI6xRD1qCnk6XoiAdBglqYvVyxNzUV6VzAxC97iTrKGbThfghvtWk2NYLUg3yE/
dzVDHv8HTWJVW/c34+D+w6w+K+ImUo9uy/+HDUszNuxENCtGL/Q85ey2iRXhxk1m
edfoUxBSQMk3DAz0OwJDOtBYrgZCyWJRO2QgMbBl2A6Sz01aQ3JyXCs99Lyc4mOu
0RMHHt/xDRBeAmoUm83G
=XEpd
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--
