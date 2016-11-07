Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 7 Nov 2016 12:35:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mirza Krak <mirza.krak@gmail.com>
Cc: swarren@wwwdotorg.org, jonathanh@nvidia.com, gnurou@gmail.com,
	linux@armlinux.org.uk, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
	mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V4 3/6] dt/bindings: Add bindings for Tegra GMI controller
Message-ID: <20161107113550.GC28616@ulmo.ba.sec>
References: <1478507405-13204-1-git-send-email-mirza.krak@gmail.com>
 <1478507405-13204-4-git-send-email-mirza.krak@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
In-Reply-To: <1478507405-13204-4-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 09:30:02AM +0100, Mirza Krak wrote:
> From: Mirza Krak <mirza.krak@gmail.com>
>=20
> Document the devicetree bindings for the Generic Memory Interface (GMI)
> bus driver found on Tegra SOCs.
>=20
> Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
> Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>=20
> Changes in v2:
> - Updated examples and some information based on comments from Jon Hunter.
>=20
> Changes in v3:
> - Updates ranges description based on comments from Rob Herring
>=20
> Changes in v4:
> - renamed snor-*-inv to snor-*-active-high
>=20
>  .../devicetree/bindings/bus/nvidia,tegra20-gmi.txt | 132 +++++++++++++++=
++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra20-=
gmi.txt

Applied, thanks.

Thierry

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIGcVAAoJEN0jrNd/PrOhBG4QAL0sJdwZ5hzHm6MWNgdZ+ag3
IDTa+cLb7jlrZVfScaIZwXPjUUN2WZjvGfG/tZtjUdD2Mx9gww3Y9FCl+Y+/yCsr
TrGBxq3PJuE+9U/s7H0523gTPfv2g73F/FpU+sS4qj3NhEApKCKchVaOOvSP8plM
4SY23s+APHxIS9z8w97dtSvxW75nltpS0U1o2dQ9E4DzMLzi7KMlbmVBua8l+vgW
RC1q7cxD2HkwXTf/1lAI2R+6jmw/S2etSj0vfdvwut0vRLiPtiXeQuZM1zneG8/X
vaXUh5PEyENoRLRrxmphm2KPMAUN1lNfH91kdct9tyWTBz/EZNWLlSyuQrUSLAIf
Uh7dcy4P1StTUrEKCPfgUptxt7az7U+m4ULqadTUvEeKSkO6qaJldNA2hoDCqfHF
QwkVDrOBYvGxXIc55hxYkHJeL6xArkVYZaSArHc4OWQm/kUExropgnO4EDBAP5JZ
ZlqtKOhiAqyuyEY4szoXbuRnG/TiX0ShUqkNmaBLp2V0HeD8WIYHr2xlKIFFBd1M
OV8UJ2Ei0/z7Z3bQm5z9O67YTu9Fm72Ce5VEoquaHs1gpHMyMCJVKmjNKjGXp++m
wNgpEMiGtwtI2/k37Idrfa4uv7CHtNpnlI+rNlj7jfOZwpYjuf1gzSlMBPYYhoeT
KoU51P1wCUiJI2EwPH+9
=A1pV
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
