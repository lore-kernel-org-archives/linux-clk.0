Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 18 Sep 2015 14:19:05 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH 0/5] ARM: sunxi: Introduce CHIP support
Message-ID: <20150918121905.GO4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <2353279.QTDzFUHVnF@wuerfel>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lh55S0yADJsuIVGW"
In-Reply-To: <2353279.QTDzFUHVnF@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--lh55S0yADJsuIVGW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Fri, Sep 18, 2015 at 11:02:33AM +0200, Arnd Bergmann wrote:
> On Friday 18 September 2015 10:48:45 Maxime Ripard wrote:
> >=20
> > Here is a serie introducing the support for the Allwinner R8 and the
> > Nextthing's CHIP.
> >=20
> > Support is almost complete for the CHIP itself, the only missing part
> > for now is the WiFi chip that needs to be powered through two combined
> > regulators (AXP209's LDO3 and LDO4). The audio codec is also missing
> > since it's not already enabled in the DT.
> >=20
> > Both these features will be addressed eventually.
> >=20
> > Let me know what you think,
>=20
> Very nice!
>=20
> When you get to the WiFi support, please loop in Ulf and me to the Cc lis=
t.

Ack.

> IIRC there were some open questions about how we should handle SDIO wifi
> controllers with special requirements like this, both in general and
> in particular with this driver.

There's actually two issues that are pretty orthogonal:

  * the fact that the regulator to power the wifi chip needs to be
    enabled before it enumerates and the driver is probed. The MMC
    pwrseq stuff seems to fix that, even if it doesn't really fit in
    the usual DT model.

  * The fact that that regulator on this board is actually two
    regulators in parallel that needs to be controlled in parallel
    too. Here, it will probably require a new regulator driver to
    combine two regulators into one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lh55S0yADJsuIVGW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/AE5AAoJEBx+YmzsjxAgHuEQAL4g4y8A7OjxsjEs3eKwOPh7
TD9TFCuw2JSEfKx3+HNh53oNbwvPgvAJnRi+whsvyTUZgmH21o7yBI8h+UADsOD6
qQFuoNNUO/RKWD/BketWn+JvOGW7bab4fFAefnA46RjCznl7beU1sOe/uVp9JHNQ
NUbcGa5FbQQaCIAZZIPaUwIaCrMm8aowwNhyjU/IvqbL2kMRuElb5JDjU+++8nnP
FcE8wDGJbRKNvT2TB0F/TdFMRtcBsMEws1sWZUPkL3iE4MQuHUA5PjnQBj8WKZu0
erkHXg4euceExPZhCBtKDXv7rSiUp4Hg80qBBsVkksfmvag/3Jr9VFDcx5xDA9WZ
nxEz9jyBXJaccDNdDoJQf58gfLiYdnc0K5cQXtRASD1+kaLuz0d1NMo2BdU1axB8
SFSKn0vL3jQzwtJ181NklSH0zS9n3rdH0DsjMMi7qsm1uq4+bMoaDtv7MQCH3A/4
g6m/BpPYkdzBSiY5B7zYiJNXvjHHDW1HWdHZOUWzwW4OmeOpSRgACN1PcfOYcJD9
Nc7Dm9+JYoxO8IPbpTQaisCMrIo6nqS4tanr4MklK8R4S5qoxacFVghz/1OC0Viv
/R3YhFF4ltCNgFedMKOp3JoE/inuCNXFQaeIaD3aF280J4DKS22qsZZABO2eGjeI
oSi2zCqliZKKy1pwRJnO
=IaF3
-----END PGP SIGNATURE-----

--lh55S0yADJsuIVGW--
