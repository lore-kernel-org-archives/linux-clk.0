Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 11 Nov 2015 21:12:58 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Wynter Woods <wynter@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 00/19] drm: Add Allwinner A10 display engine support
Message-ID: <20151112051258.GC32142@lukather>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <20151030145217.GA16848@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
In-Reply-To: <20151030145217.GA16848@phenom.ffwll.local>
List-ID: <linux-clk.vger.kernel.org>


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 03:52:17PM +0100, Daniel Vetter wrote:
> On Fri, Oct 30, 2015 at 03:20:46PM +0100, Maxime Ripard wrote:
> > Hi everyone,
> >=20
> > The Allwinner SoCs (except for the very latest ones) all share the
> > same set of controllers, loosely coupled together to form the display
> > pipeline.
> >=20
> > Depending on the SoC, the number of instances of the controller will
> > change (2 instances of each in the A10, only one in the A13, for
> > example), and the output availables will change too (HDMI, composite,
> > VGA on the A20, none of them on the A13).
> >=20
> > On most featured SoCs, it looks like that:
> >=20
> >  +--------------------------------------------+
> >  |                    RAM                     |
> >  +--------------------------------------------+
> >        |            |      |            |
> >        v            |      |            v
> >  +----------------+ |      | +----------------+
> >  |    Frontend    | |      | |    Frontend    |
> >  +----------------+ |      | +----------------+
> >          |          |      |         |
> >          v          |      |         v
> >  +----------------+ |      | +----------------+
> >  |    Backend     |<+      +>|    Backend     |
> >  +----------------+          +----------------+
> >          |                           |
> >          v                           v
> >  +----------------+          +----------------+---> LVDS
> >  |      TCON      |          |      TCON      |---> RGB
> >  +----------------+          +----------------+
> >        |       +---+       +---+          |
> >        |           |       |              |
> >        v           v       v              v
> >  +------------+  +------------+  +------------+---> VGA
> >  | TV Encoder |  |    HDMI    |  | TV Encoder |---> Composite
> >  +------------+  +------------+  +------------+
> >=20
> > The current code only assumes that there is a single instance of all
> > the controllers. It also supports only the RGB and Composite
> > interfaces.
> >=20
> > A few more things are missing though, and will be supported
> > eventually:
> >   - Overscan support
> >   - Asynchronous page flip
> >   - Multiple plane support
> >   - Composite / VGA Hotplug detection
> >   - More outputs
> >   - Support for several videos pipelines
> >=20
> > And there's one big gotcha: thhe code to parse the mode from the
> > kernel commandline doesn't seem to support named modes. Since we
> > expose the various TV standards through named modes, it means that
> > there's no way to use a particular standard to display something
> > during the kernel boot. The default will always be used, in other
> > words, PAL.
>=20
> Simply not done yet.

Ok, so I guess there's no fundamental objection to it. I'll do it then
:)

> > A few more questions that are probably going to be raised during the
> > review:
> >   - How do you associate private data to a mode, for example to deal
> >     with the non-generic, driver-specific settings required to deal
> >     with the various TV standards? drm_display_mode seems to have a
> >     private field, but it isn't always preserved.
>=20
> Analog TV in general is a giant mess, and there's not really all that much
> of a standardized solution. I also don't have much clue at all about what
> needs to be tuned with analog TV. Probably the best would be to look at
> existing drivers with TV-out support and what kind of properties they
> support.

The intel i915 driver already uses a generic property to support this
(using drm_mode_create_tv_properties), so I guess the generic part is
covered.

That might need some work, for example to support a different overscan
configuration in X and Y, but that's a detail, and we can always
extend it.

However, I'm more interested in actual register and bits that you have
to poke to enable one of the two modes, that are usually not directly
something you can expose through a generic mode field, either because
you don't really know what the bit is doing (because the datasheet
sucks), or because it's simply something completely tied to the
hardware itself, and not really the mode you expose (for example, I
have to enable the DAC0 in PAL and the DAC0 and DAC3 in NTSC).

> Then standardize them (with relevant helper code in drm core) and
> use that. Additional flags on the mode, especially using the private stuff
> is kinda the deprecated non-atomic approach.

Ok.

> If you need private data beyond the mode and any additional
> properties on the crtc (for derived state) then just subclass
> drm_crtc_state and put it there.

Except that it's not really tied to the CRTC in my case, but
encoder. I don't think the CRTC simply knows if it's using an RGB,
LVDS or Composite output, and then if the user wants NTSC or PAL on
the composite output. It just doesn't seem to really fit in the
current way the pipeline is represented.

> >   - How do you setup properties in the kernel command line? In order
> >     to have a decent display during boot on relevant interfaces, you
> >     probably want to setup the overscan beforehand. Overscan seems to
> >     be handled through properties, and afaik, there's no way to set
> >     that from the cmdline. Should we use a kernel parameter to set the
> >     default value instead?
>=20
> One idea tossed around is to expose them to DT somehow and then just load
> a DT-blob to set them all. That would e.g. also allow to specify firmware
> blob paths to e.g. load the boot splash image (if uboot or similar haven't
> done that yet). I'm personally not sure how much use there is in exposing
> a generic drm property cmdline option ...

But then, it would also mean that a downstream user plugging its linux
system on a TV would need to adjust its DT? it doesn't feel really
pratical.

> What's needed for sure is some generic way to do one initial (atomic)
> modeset to hammer all these settings into the driver. That would be really
> useful to have, since currently that's tied to the fbdev emulation, which
> means if you don't have that it will be simply lost.

I do have that, and it mostly works except for the things we already
discussed (overscan, text based video mode parsing).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWRB/aAAoJEBx+YmzsjxAg03QP/085NNMbSX6gM/NQ8OoKm/Tc
tP9UtinGRhfBwH/l/XbCBdKtIjkonGy5lh+7minccOWTRBGblGJKXH7dlDH3KZc1
Bmdke66XGQTnll6JjuexnlGTZJhSDHMAbAPk+hryge7nTOwHUbzxsmID4CZxLvEw
ovbQkUjIV15oHqmt1Cx4UJEwgPwZSXrLqKofsp/6Jzoyf8RJ+pZjv9VSRtZlOqkd
Zh5g31vgWZJRvTpTbzNQHxLNCt7WJMmmOJk3n/PstbTCcYNnaJ+6Mp+OtZRNecQQ
uuCtfXzEB5H3PgN+I5WcXKi/HrJ+yCr6AvNpXy/7PMnEl06VI7BZT0r8qa9e+tJw
rcT+YMhp3Nr7PUgVupwyJS18Ag9n2w9qIgvCn3fyCjGBojJocj7Fia0lKc2Oxyb5
NjQy9m0ykGABTg1KkPnrhozLmG22QLeC0I4J+2l072u8XJNaFyAX3TL+HMcFguUs
yhxMW6hTpnIRGOtxZ7CXrFCTBBF4q2h6oAsA3d4VRiFD6tBzkNAZP5NDD5OCZGhp
vmTa0GiuamOj/qusqQb0I1tqoD1jDqevvNrnOFHtuL/5cGaafxvmnDFR9hPi8X8T
raJeWJpHUbgmbEmJdhMiGlyj3a7CVi5g5hJiaUbYwcIs/4CvCBgtY+ljySB58N1W
ivQRufGxLh+etEat2CNg
=rjAD
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
