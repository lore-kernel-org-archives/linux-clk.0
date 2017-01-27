Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 16:51:59 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 1/9] drivers: pinctrl: add driver for Allwinner H5 SoC
Message-ID: <20170127155159.3e3j6xwf7nis6vtp@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-2-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7035725931284134529=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7035725931284134529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bleo7dtcochkw3y2"
Content-Disposition: inline


--bleo7dtcochkw3y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:51PM +0800, Icenowy Zheng wrote:
> Based on the Allwinner H5 datasheet and the pinctrl driver of the
> backward-compatible H3 this introduces the pin multiplex assignments for
> the H5 SoC.
>=20
> H5 introduced some more pin functions (e.g. three more groups of TS
> pins, and one more groups of SIM pins) than H3.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bleo7dtcochkw3y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi2yaAAoJEBx+YmzsjxAgJvkP/RS1gJP1ewRU8H8XUwbxD7/3
FrrnR7tmOOCW9srfPzgqE8sEn/COPIu1dl2t3LhsOxBFn/V0QfYLaa28vvRPn6js
LF8552Q/BPhvEb3Tsdmkx0HAxlT+B/crv1WRpfEnLTcxkdnw/IuOkSt8f9TriRfd
B+Sqi7tGE8UgCZY+seccIjp4tMiULN7pgcZ638dTm7SscKk2rNb7IpKW0u1rBvkB
2JJf/lPk3iyzCSM+ViSkqNrSzX0kTK6v4Ea6ck3CmE9MF74wulHA/yQg6D01evh4
h9QBEg85npewEUPQs/pnMabVyhhgUa0+Rvgn3bLqHMnXnw5p0DuVM+gPlLCmtm/z
kW2fhJmtsQr6l/mhlUl0PSlxRNwIlYJzJ22ynkdRxykCNxXppdEh6S+Lvy5vrS2a
Scfrhad6khkZYbOCiI+54GbQJTWvKDZ9PIaFYgX5wKO6ZyxEifiOLRJIPDo5HyQi
6Q5ER7DR8nugF5O2pgMIyUsaOYIvK6pUX+wvr6LIP++lwMGLQEZpwycnPE0A6mf5
2D7xNWzJgIckFLpMHAL8eKqGb+VV+g8nS7+HOhtd4rOAtRe+eTYoj9Y5aVmr55Q6
4gUbBWeHsFlhC0I5HyW3ZzHaAvNgLdsfQU7yrtb6TN2Dhpayu0monjCZwX31UbPC
odJb+4m4WgcO/ZdJDp+k
=UH7m
-----END PGP SIGNATURE-----

--bleo7dtcochkw3y2--


--===============7035725931284134529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7035725931284134529==--
