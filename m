Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 27 Mar 2017 13:37:14 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Tobias Regnery <tobias.regnery@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: fix build error without
 CONFIG_RESET_CONTROLLER
Message-ID: <20170327113714.4ozfacmdpu4qx7av@lukather>
References: <20170327095753.29091-1-tobias.regnery@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170327095753.29091-1-tobias.regnery@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0912323839470616489=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0912323839470616489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fssd34nhn5rfrvzz"
Content-Disposition: inline


--fssd34nhn5rfrvzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 11:57:53AM +0200, Tobias Regnery wrote:
> With CONFIG_RESET_CONTROLLER=3Dn we get the following link error in the
> sunxi-ng clk driver:
>=20
> drivers/built-in.o: In function `sunxi_ccu_probe':
> mux-core.c:(.text+0x12fe68): undefined reference to 'reset_controller_reg=
ister'
> mux-core.c:(.text+0x12fe68): relocation truncated to fit: R_AARCH64_CALL2=
6 against undefined symbol 'reset_controller_register'
>=20
> Fix this by adding the appropriate select statement.
>=20
> Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fssd34nhn5rfrvzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2PlqAAoJEBx+YmzsjxAgHM4P/0XV0oewCiXd1fSR9U8gzeC+
z0maFyeJ+RnlrMzd90ECZCCq0jSzIgaocmjkx5QTzzhQKU4UTIyJYjByxHcRW91K
FPw/VmMIyNA2TaE70lL9bw2XgaJZ/Ic/Bl1ObTccPq/P1Mg5U18yFvS+xyf+0h34
ZE5eiSuKD0+e0jQ1CoDInu2K05Jz22/flTcnpvWD9QkDhMsSqAG7dQ0PzaN/psNk
mTsZHIKXfH1I/Whg+zlkXkDfqPvyS5bDWQ2XahBAbO8e9YycERennIL90OsdFcTT
thyXMkDoO85IkJCizvriB5VNnGkaXYhY6ySd43UloxDG7TmirwlwxEplttedWAjX
kkQmXexE6jZn1AttLXJVomwv0s8c+oVuMxKIvA4wgZpDgK/diY1Mj/lXVWzGHr06
iyiOTj+Ox9AZtffJKWKWwi5D0AM3brYS439mGFZ4OR9No7c3jLzPBFYmJlIhsE0b
2OU1LvlKnefedVrYcfvaQuTMf6MfRgW+N9qAGG0+ubXBxv+iKX6FAhjTsnvce+QR
nG5gEgXyiNSfmGeiE0xwARq4L1nmsEplGfTGIA1P13zbwk9O0dJSpEzya93JOKK3
jDZXH8GhdyTBpZONVRF8E6CB0ZN6UiEPFsazOwoISpl7FNgV8JvzP3LlgEkwYMAL
6AGvxtD8f8PwooGpfBZl
=6pKz
-----END PGP SIGNATURE-----

--fssd34nhn5rfrvzz--


--===============0912323839470616489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0912323839470616489==--
