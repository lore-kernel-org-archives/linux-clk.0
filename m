Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751815AbdHAQ3j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 12:29:39 -0400
Date: Tue, 1 Aug 2017 18:29:36 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH 0/3] clk: renesas: rcar-gen3-cpg: updates to SD divider
 table
Message-ID: <20170801162936.knvmsojiu7xibdxq@ninjato>
References: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ycf3dxhssbtsy5q6"
In-Reply-To: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ycf3dxhssbtsy5q6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Tested on a M3-W Salvator-X (r8a7796) with HS and SDR50/104 cards. clk_summary
> shows the same frequency selections as before.

Darn, not tested on H3 ES1.0 where it fails because everything is half
speed there :( Need to rethink this.


--ycf3dxhssbtsy5q6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmArGwACgkQFA3kzBSg
KbZKxg//Qfgk9Wxx9DwTQvtvDild4yY/Ei05wSdWgzqI7vEN0KQTSSdWrhTmHOaQ
rUrtBHXg8iH51l55feHw/yu9Qsk/tDKjGlxevh8U4tbkm/EXuQYqdGYrgr72Ffpx
6OnFmOLJik+MlWkWfwcrqXo0FCfIYYKFgYjg/xf+HG/2oJ93QZygjfcejW6DCy8o
lHHzPAS2UJ0oOvdKAhd2rnbT4N0I5SzhWW+e/FPjNGhsjrxaLy4GWbSQAYXy8I0w
IDMKa9+QeXEzVrCorrledRPxXL6Koa5TrFnDpY4HcpTzZZI6/P9vey/UuaHb2f/N
ZyqElflXUNubw/g3/OHRufoHGeHsFqJv1BK8SvrMHtZn2Gf6IQno/RsE2h5jLA/+
1fKe/Fecxss1z+ViPTStsKg+UB+tNp88uSiEZta8tTheriU4rV5Tty5voDu/eqTI
ECqb2Ybm56sE3vGuyAdPg24ehi29DaBrBq9GN2rw9YKc+6V2cSwlvpHeOa+jLn7W
FivIjgqn8AWhxaX8DbbdgBBtk0DB0+u4vwAiMzSF4Nm2ZjQslR95ICLKM9GVmyJb
6unepnnXtQAER7Dj3Tp5H7Y3LF8exfYTdsc0uEDs5aK4QLD6ULHOknlXoawtHGzg
ixLHjSSpS2uKVtZJegZCdaY2A9mH21kOUtPi0sKPhXGDe6VABo4=
=V57C
-----END PGP SIGNATURE-----

--ycf3dxhssbtsy5q6--
