Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 24 Aug 2017 10:40:51 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>,
	Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH v7 0/5] ARM: sunxi: Convert sun4i/sun7i series SoCs to
 sunxi-ng CCU
Message-ID: <20170824084051.gbb4z2jk4nwd6gja@flea.lan>
References: <cover.2a284ee63f45063ec7c0720b1098860e0b516c6d.1503507503.git-series.plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ksoprlipopogv4a"
In-Reply-To: <cover.2a284ee63f45063ec7c0720b1098860e0b516c6d.1503507503.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--3ksoprlipopogv4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Priit,

On Wed, Aug 23, 2017 at 08:23:28PM +0300, Priit Laes wrote:
> Hi,
>=20
> This serie brings A10 (sun4i) and A20 (sun7i) SoCs into the
> sunxi-ng world. With this patchset we now support all the clocks
> in sun4i/sun7i SoCs.
>=20
> In order to make cross-tree merges bisectable, changes to device
> trees are currently using clock index as numbers instead of defines.

Thanks a lot for your persistence. I just merged all of these, and
sent a PR for the clock changes to be merged.

Thanks again,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3ksoprlipopogv4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnpETAAoJEBx+YmzsjxAghd0P/3fdUx5/X2KjyaIrNzy+1sjw
8au54qmge1J8TKk9UGurah3UffQG5XGs/SHuD3T354r0MENwlIqoNDGCkDXIRgQp
cm0TjDIpnvF1WWp57N2iMU2RAnp/WsCjdhs5sn3UKvSxvGu7Qmmu0UTK4nKP9uc0
GeAF1IRv1gMGGr/ZlEKAtCPnjetQhBiU8vL1puwJhwtrqP8bOppDxL36FNReMoml
AiFBGOymYolD67RavD6rKdEqwES8YdlXHeOqAF7bjVv/r9rZNRdLd6bYQhRHlnDQ
N2kGAStsKU5Xd8jc0yv9MQ0RnhejYm/cbUUvXtLZCKf4H933QHyLDFoKZhsp7AZh
TgXhqqxc32gs1JYfteq9OxgcfEowlUmcBsMLWUyPqsgdEfHUWRZnPj1ArkyR5gml
5GaLNII70tI3dZvs2FB0zNV+L81pAOvmSKFGpXTtFlbleBT89wY5t69B8jw0PBFJ
uMkB0jmd6fMzvywzjG1dRVUsf0izqSdKgh/cLWDiy8LeZAQpXHYeyR50AuEnDErc
fO9PY/c8II0EwQY6teJToaIQdXmejNQGFbYwVfOWwxxe4kjfdfCPBLCan3g9gNy7
cadTvhI/3PKjgnxbVMzhQaG8j5uHEGFRfaa4QnWveSrjNhALaXv8fJZ4O3/CoFd9
nTEzvk7gOsZvD2jV5m/5
=7feB
-----END PGP SIGNATURE-----

--3ksoprlipopogv4a--
