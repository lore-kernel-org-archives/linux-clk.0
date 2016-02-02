Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 19:02:27 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 08/11] clk: sunxi: improve error reporting for the mux
 clock
Message-ID: <20160202180227.GC4652@lukather>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-9-git-send-email-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D8DPajcJO06Q0DF+"
In-Reply-To: <1454348370-3816-9-git-send-email-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--D8DPajcJO06Q0DF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 05:39:27PM +0000, Andre Przywara wrote:
> clk_register_mux returns a pointer wrapped error value in case of
> failure, so a simple NULL check is not sufficient to catch errors.
> Fix that and elaborate on the failure reason on the way. The whole
> function does not return any error value, so silently failing may
> leave users scratching their heads because the kernel does not
> provide any clues on what's wrong.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks.

Any chance you do that for the other functions? :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--D8DPajcJO06Q0DF+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsO8zAAoJEBx+YmzsjxAglZQP/iGCTXrwhF95RGuwYbPX/wdc
cRP0ODvVgCS6JO0JgoxaeoW1t4gXxT0AW2c5NR6J33W5SMToPx6scTPj2JaWfwbR
QxBK2FVcZF2rDzM3XwMhKK81NXagPJ2fxcJao+s1AXyUDORPf4DaoJdXkOh9Gn0p
kwtcb0AHhDKGOnDxQXQfv/2ssVFDa4kfQEImydIuIerxDO89xACQAZ5/him9m8Rv
k/t7vA43RAm/OelWtSncIaDo4ov73HLZIT6Yf5T5R3MKLn+BleYTfhYCqcTNvLZr
W2uFdHFngJ4R9cSMK+4w539S9NpBiYM1C1+9HUwLvTqhHMVkAFqbFi2Qwbg5UUoj
WiIAxbL7qJuQ1Na2wTBdHjVWgx/vAhOVPjyudyTSmOseb5pe5bnvmhOvSbOdcg8L
F+Z9o/faqtSgvjsohCSsfwDCx++G6sINeIqCNZge5q3fedcfMdV9n6HOSBilxR49
s7h3iaDrnGVuHQJigNKnIu4z5xKR9t+YzQkLSx+c9UvqHBekhIOqQJRWgxMepKDe
0/8HA8j4X33QsjVmACnGvp0h7ZdWIDTF9jaiIP4aK/oMU37d4EX4bNd7Qy6NEXnz
SG5fR7IxlrEC1RD94xkxlYXDM4PZ3tkhxE+ejfVEuwblR56/lfvUNpFybZc1cx3D
2TB77UhlJnQYS8Ei1efH
=ncGQ
-----END PGP SIGNATURE-----

--D8DPajcJO06Q0DF+--
