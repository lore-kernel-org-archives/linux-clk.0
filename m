Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 19 May 2017 20:03:30 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [RFC PATCH 07/11] drm: sun4i: add support for the TV encoder in
 H3 SoC
Message-ID: <20170519180330.7hpfkdqk3r2x3kn5@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-8-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170517164354.16399-8-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3120115475870840910=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3120115475870840910==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2w6z7xlkbrkzjzj"
Content-Disposition: inline


--p2w6z7xlkbrkzjzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 12:43:50AM +0800, Icenowy Zheng wrote:
> Allwinner H3 features a TV encoder similar to the one in earlier SoCs,
> but with some different points about clocks:
> - It has a mod clock and a bus clock.
> - The mod clock must be at a fixed rate to generate signal.

Why?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p2w6z7xlkbrkzjzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHzNyAAoJEBx+YmzsjxAgx7MP/RJSD4GDzbybI8R2uI/oRAh7
05A6hblDto7rn0WKZ1KPsrK0fNLtGc4ccVBUoABo6wvhUoTuvTSJuGRKexuV/1uV
WJ/gUutbktlmrusHS9fU5nXrA/K1rhKEeEdVlaQHPeW2qWdGYGLpu9S3b59ZqRhL
wbPxT6A/OJeVzlAtKYaf4WjpDjABtWIBb1CEfaRmiuFDgjBu7eijSBocEU4VWBfj
/rFP6RpLXOV15d2oS7ImqiEtZZCQDo1H+Jt+aKoc2VD7MbXUc/31jdkDHD0Rx0TB
YJ8B4476eMX744N5JcJY6RvZt09LNHLPgGEwtA7MezKtCj2OpTWxWEeYYCdsNrkF
MB1eu8F3ZDW7fm4x+SBymefFeDZ/mLxbauW5hFV0UY0l/jyc3aR4m9iwVg+Q0YxA
SgIgWkMIWxQ/MbSWoYKDQgW6nsqVUXspV3b6wIEu1AnAq7jaEQg0z/8vPSVMXTgR
rexP0yKtgV7FpN2DcU1D8p2Sp6lPSXSQNHwVIR54uc/huErtWSMuuvIncGMmHExL
/LfDaEMbiS076R9iTgMEAY7ndEIO50tVJ1FA+XDXSbWtrPAQcNlDhgy6Hse/bn9n
efBseAa01Yv57u32t9U8K4x5C6pN6rjnssCEhpvJyh991ch/K30c9jqvL52McWHB
ljMZd0n9+2+zXQAdZKQ/
=FZtQ
-----END PGP SIGNATURE-----

--p2w6z7xlkbrkzjzj--


--===============3120115475870840910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3120115475870840910==--
