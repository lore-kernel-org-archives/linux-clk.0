Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 17 Jan 2017 17:47:22 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
	thomas.petazzoni@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: Re: [PATCH v2 04/10] ASoC: sun4i-i2s: Add quirks to handle new
 compatible for reset
Message-ID: <20170117164722.yohrxvlempkjldu3@lukather>
References: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
 <20170117140230.23142-5-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bsjsst4jgd4saubz"
In-Reply-To: <20170117140230.23142-5-mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--bsjsst4jgd4saubz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 03:02:24PM +0100, Myl=E8ne Josserand wrote:
> Some SoCs have a reset line that must be asserted/deasserted.
> This patch adds a quirk to handle the new compatible
> "allwinner,sun6i-a31-i2s" which will deassert the reset
> line on probe function and assert it on remove's one.
>=20
> This new compatible is useful in case of A33 codec driver, for example.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bsjsst4jgd4saubz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfkqZAAoJEBx+YmzsjxAgXG8P/2tSaQNI7pYK5hKBqBy+DXKF
wgiyEJJfvFSNXL6+kHgY/iUzraZuzitMqiJsGat+VX0vvB5Kh6QsPGq9u/YuOoeA
WQZG3kszPlaMnkLSsKoAyFClESAZrV0P/kwSc6p/aJYzXWiLlVH/tfmmlelmJf9i
YxqOp05yG/ADeSubiIVDdMspn0huuz2aUiT5PPfWqy0kNABD0rKPOefqvPstHIHQ
RBXQhVu+JpjqlmxcascAee4KJuQWTp3NbDDCtDUi7HBXTF2zPEcg8T45BHV07mat
WIQrbsOp0SY5nHWHgxailcb74D7iLnp/U630qgVbz6EsGqn4pb0568xhDCN8Zc2I
ErrMpEMHo/f02V47TeBeAqTMuRE9cjVxWa7wnnfu3LK8BcSn482xo7cRm6awzNtM
p09JwPbzF3X1TePDQn/F+/28Hmek9DuiguvlHver7dc38JVV+aNzofu3h7HEGv5/
hdd9WM9s5Jh/zAHfqD7ueKov9BeS1b37s4zkkVJk39R/VMtnQPkHCzMPqIizUwl8
u44c+MGEUIMvXcq1XxEBDkWNbLit/x4XZgPSPNHcxjyEdyvdU3nWscCuXYcYo6Pv
QXLFG2EtwAIX2z096JRbHGey5K/Hhm+dh8KXi9yHOgSjOhvKoqNaeCv9BMSRZ2Gf
finOAdgqDqtqQDFQ0Bn3
=/Zyc
-----END PGP SIGNATURE-----

--bsjsst4jgd4saubz--
