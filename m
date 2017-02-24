Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 23 Feb 2017 16:46:28 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2 mixers and
 display engines
Message-ID: <20170224004628.xkjrpmbomomgbd24@lukather>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
 <20170222151854.3280-5-icenowy@aosc.xyz>
 <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACvgo5117BB+o429cH=X0t3xz_5=XZ65YCEdE=ro+895a9e=RA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Francois Moine <moinejf@free.fr>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2540278490976861582=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2540278490976861582==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gbdh35hmqoiikprm"
Content-Disposition: inline


--gbdh35hmqoiikprm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emil,

On Thu, Feb 23, 2017 at 05:44:54PM +0000, Emil Velikov wrote:
> On 22 February 2017 at 15:18, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> > Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> > in a new "Display Engine" (mixers instead of old backends and
> > frontends).
> >
> > Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> > ---
> >  drivers/gpu/drm/sun4i/Kconfig       |   8 +
> >  drivers/gpu/drm/sun4i/Makefile      |   1 +
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
> >  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
> >  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
> >  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
> >  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++
> >  9 files changed, 674 insertions(+), 23 deletions(-)
> Silly question:
>=20
> Does this series cover the same functionality/hardware as the separate
> sun8i driver proposed a few months back ?
> The diff stat looks quite different (~1.6k vs ~0.6k), although that
> could be due to reusing the existing sun4i code.

Since those aren't feature equivalent, this is a bit complicated to
answer, but most of the changes introduced by the old driver was
duplication of code that was already existing (Allwinner TCON, TV
Encoder, Designware HDMI, etc).

This patchset superseeds it by using what is already supported without
the duplication. It also has a bit less features (for example the HDMI
support is missing for now), but it's a much better code base to base
our future work on.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gbdh35hmqoiikprm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYr4JhAAoJEBx+YmzsjxAgMD8QALDQuqHN7VTMIWfX84C9pI/e
PiWh92+5X3QybIrrY0xycFJTyOimMxzfWbpwDxZYryYaiU8H0g0rc31LNEfxSiyw
RbGbgwIzrZPkiG5Fpwpjkmjae/jFTReBifdgaRLLcU/dQs0iPAmJFDdu19CIES+z
IP3LITo61xzW3i56t7ByNtkbkwAgnqw7yGgLPhaG9AxI0FwarmufUSDcPLA6vRh3
XjhCKqAxTpcKXh+erAi1I8GKyTwGl55VCzf9pIpc8XNYRgGcjTQUqKCm6FidiYHm
LoCfJo6RKvqEa+6USpRVfsl4HP0rn6FHGLLrTjH8webLgaGxc/Z6VT/8FcxokUfI
Ygniiz9rYUOkQVZqXBB2r0i1VPQVfnQ6vz4A6ezB4lrgZrPvrwVHS05uSQaGWBXu
22GkRLFHLqqBjixFWufCnXlhaejmzqqXkoisMqu0ajq5RKaVPwVbrIq75603yDWS
FnNxcrf8pJpg7Sri6GHHSe4NlomiupQvYa/8YqQCg0eu3HhKLrOmO59PBZenpIlG
7p5hPoz4EtdlzXx5H95a+6HVoFSfYg1pLBuW1D7LNPlfEEpj2YYcwR5LUf1BCjV2
USz8VEoSsdtfhV8kFe4sPYvS6EfsAqkMXKamTjT5+iizWdav97GDRAHSICcfPzhJ
Aie5wZ9ckFpqTu0+C73q
=di3S
-----END PGP SIGNATURE-----

--gbdh35hmqoiikprm--


--===============2540278490976861582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2540278490976861582==--
