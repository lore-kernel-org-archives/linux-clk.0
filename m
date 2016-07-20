Return-Path: <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 14:06:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix SD clocks
Message-ID: <20160720120623.GA1601@katana>
References: <1468380049-5712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWkD96cVe14ps8B0BbRUzA7pQuMogat25PehnDaoqhS=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
In-Reply-To: <CAMuHMdWkD96cVe14ps8B0BbRUzA7pQuMogat25PehnDaoqhS=w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, Dirk: any comments?

Looks proper.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I couldn't really test it, though, since I still have problems with the
Gen3 DMA series.


--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj2k/AAoJEBQN5MwUoCm21YYP/ioazhJAkJyw77MbJXLTlfkr
szRAuwknUp8L8pYtr+eDjONLY8OdsjEE8yRICIG9vcYF/IYtvot53gFCLdwN7ACD
ZyhLOcmDwjZ0FG6Bo2Qpi5VM3P1UuDDV9DBV2XgVQWv1TbU9uwpV6R6VSTnbRLvg
DGXN83BliesWzv04M+1kBRVlolhwdk1EJawi9bM1ZrsJkV1C2KMAE4LrV9GuF7Fs
n8RwIln12zggS/nSH38FN2kZ2PKPvPGPBugDTQpvRfS0/e9ik2dHK4aqxuwbSVbV
4Wa+iiHjs3hOzzKyxf2yd+yUE0pVSBjjIS8Bygr9zuwZmBOfAGqOgh5eoPJhAXCx
JWS2DnSChRktDzfNNeRNSVaxVuo/zboqrlf8K9GQoR+JvdfslW7isQ/cA3+1aLSW
hvOpIcikKnCwu4g9IILzF3J/BIxuk4GakHtRVxPwUu1WwM61vJ/1HVj5ZA+4tNUc
+rC6lBF5nT7AangPhgaULfuKVLUP2ZiJhMJSu/SvyXBbUsSHxEV5JiAsUpNi7G2a
F+sc0EqTzh3U/rJ28/N6KnifpVhk6qZiLWDpdiyX+YyeEatSAXyNE09KjyPzajPh
hgk4PNwMRMIUSkKXlF97I8J9YdwI+j2OqzKEqZiE280nsRne7EDC3KFWwXnsyDSo
xbTigF3UJAwo53UX9p3j
=lcLq
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
