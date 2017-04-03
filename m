Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 3 Apr 2017 22:59:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 6/15] dt-bindings: display: sun4i: Add HDMI display
 bindings
Message-ID: <20170403205953.vdf5ynyvktpiheax@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <f1d46b79f933df724a6750d557ebe9517b6339b5.1488876832.git-series.maxime.ripard@free-electrons.com>
 <20170315172622.lb6vy7cmbwaf7crn@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vy7wvwz2minz7rwk"
In-Reply-To: <20170315172622.lb6vy7cmbwaf7crn@rob-hp-laptop>
List-ID: <linux-clk.vger.kernel.org>


--vy7wvwz2minz7rwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Mar 15, 2017 at 12:26:22PM -0500, Rob Herring wrote:
> > +HDMI Encoder
> > +------------
> > +
> > +The HDMI Encoder supports the HDMI video and audio outputs, and does
> > +CEC. It is one end of the pipeline.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a10s-hdmi
> > +  - reg: base address and size of memory-mapped region
> > +  - clocks: phandles to the clocks feeding the HDMI encoder
> > +    * ahb: the HDMI interface clock
> > +    * mod: the HDMI module clock
> > +    * pll-0: the first video PLL
> > +    * pll-1: the second video PLL
> > +  - clock-names: the clock names mentioned above
> > +
> > +  - ports: A ports node with endpoint definitions as defined in
> > +    Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +    first port should be the input endpoint.
>=20
> You need an output port to an HDMI connector node and an audio port.

I started to look at the audio, and I can't find a use for an audio
port in the OF graph. As far as I understand, we will be using the
hdmi-codec, that still requires an ASoC card to create the link
between our i2s controller and the HDMI controller.

This work perfectly for us, but as far as I know, the simple-card
stuff only requires a phandle, and not an OF graph endpoint, right?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vy7wvwz2minz7rwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4rfFAAoJEBx+YmzsjxAggvIP/iF+5hj+pnV4OJar5PDA3Al6
N9lcuVwEtwxpuBtmkqizHuxJS5xfdUuIE3CihLUGSFoQLmamhPgSPN4+lKsqtvwv
zxuC8nr6wKywYADfMoikxSYZBr5zXJIspWga7difOczkqwFL6yp45kvvwE5Py68g
H7ZIVfV2qLutjTFrZJCqZ55kftQeprOSU9Cg7qj5Zig+9oGaCVfNCRNXD+HS0d17
pdxkq1hvrXNke5LHi47T0ury5jbggYKBIAkLVIhw1JgPbwSpIeONYo8UptOwhucn
dvO6pa4Coi0hQrVXinVppC5EYVvkqmU9XqVF/95W5mCyk4znd22Lfv5oJtjoJ3C1
5eTE+AchILfZB0bjShSpRmPcINitNpCbq6LQ5aCkYphujL7rkMx58aKsC9pfBkEg
iVXWHDDeB2t6nN1hLlDHmd0zF0MunxesVtlXXHC+fvjrWNAHZzZV7kVDOG7wGFmI
Daf2ekACY+LXEN5J0QeOL2xL/PxYgvuWxDxbmWnfrmR9/QJpW+VqOqxzXRZxEX6x
XIoDehdAx95ITdnKsizUxMv2AvyFmxg6Idiuj2IEKeagZQTqbzJoRwtosmQ+egL5
eX4ixnxGV7iAwrcA0JniFaNiHI28t7wN8YAIWQwOEfdbCpABE2fKlcxdM8rxhsoD
at7B/P/qJdmFtW/RilGv
=RgVB
-----END PGP SIGNATURE-----

--vy7wvwz2minz7rwk--
