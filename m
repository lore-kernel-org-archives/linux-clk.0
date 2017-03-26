Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 26 Mar 2017 23:11:22 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 7/15] dt-bindings: display: sun4i: Add
 allwinner,tcon-channel property
Message-ID: <20170326211122.ofbl4z25imyyyn3f@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <46fdec2d680d539652f87d79c627973b3a568438.1488876832.git-series.maxime.ripard@free-electrons.com>
 <20170315173753.6zywfxapdczu2i34@rob-hp-laptop>
 <CAGb2v67A2T4KeLBttAGLKoo7igBTnQH+5yxN-jJo1k7Ewfd9mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zyqbyw7y52pdpduq"
In-Reply-To: <CAGb2v67A2T4KeLBttAGLKoo7igBTnQH+5yxN-jJo1k7Ewfd9mQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--zyqbyw7y52pdpduq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2017 at 11:34:45AM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 16, 2017 at 1:37 AM, Rob Herring <robh@kernel.org> wrote:
> > On Tue, Mar 07, 2017 at 09:56:26AM +0100, Maxime Ripard wrote:
> >> The Allwinner Timings Controller has two, mutually exclusive, channels.
> >> When the binding has been introduced, it was assumed that there would =
be
> >> only a single user per channel in the system.
> >>
> >> While this is likely for the channel 0 which only connects to LCD disp=
lays,
> >> it turns out that the channel 1 can be connected to multiple controlle=
rs in
> >> the SoC (HDMI and TV encoders for example). And while the simultaneous=
 use
> >> of HDMI and TV outputs cannot be achieved, switching from one to the o=
ther
> >> at runtime definitely sounds plausible.
> >>
> >> Add an extra property, allwinner,tcon-channel, to specify for a given
> >> endpoint which TCON channel it is connected to, while falling back to =
the
> >> previous mechanism if that property is missing.
> >
> > I think perhaps TCON channels should have been ports rather than
> > endpoints. The fact that the channels are mutually exclusive can be
> > handled in the driver and doesn't really matter in the binding. How
> > painful would it be to rework things to move TCON channel 1 from port 0,
> > endpoint 1 to port 1?
>=20
> Having a separate output port for channel 1 was one option we discussed.
> However it wouldn't work well with the kernel's of_graph based crtc
> detection (drm_of_find_possible_crtcs / drm_of_find_possible_crtcs),
> which has the crtcs bound via the output port. As the logic is used
> by multiple drivers, I'm not sure it's easy to rework or test.

Can't we use a different logic than drm_of_find_possible_crtcs to fill
the same role?

> Also, we still have to support old device trees using channel 1 from
> output port 0 endpoint 1. This is the TV encoder on sun5i (A10s/A13/R8).

We could probably work something out if we go that way to deal with
old DTs though.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zyqbyw7y52pdpduq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2C51AAoJEBx+YmzsjxAgQw8P/1LVA6+heTx96fApnkSX0QLV
o/Eu77bZ8tyy4Q5wGN3tHYgv6tyQ5O7PflwTkrQzS82otgaHypgeZVwGyPgG2tF5
fuhsjDQosO/yicBx3NuyuQDJ8K6Ki+su6tlKwzcYgG9z204i67eUVjdAJVy/gdzL
yUHHa1EYHtE8AgnM2lGysHTqwAh5FY0+m4P5PqBPo2bDHl5KzdL3dgApbt18iUEp
rDpNSJ4kst6RmBTxPOpQ0Yz6i6JZEp3sEIyA67rOuRpQFcd3nLIZuhft6PFrb5Co
dGWXsOmww1vkucJ8ru6pTTYUPcNlqQPV5FZMd7sXaqzlXOedDF7rAMQGiq8r7J8/
PRlkDYLZ6mqxo43/JQdWMb00jDyMIOdSAZDzz1szosUgJipP1n94mcBwH6wHydma
gwbxUpk8HEFDpXmIPDXgUXWa+oQs0nUCzjTgUcyKd6bA/7kMNCHGoWswwz9bd79E
mvawMF2ugx102Se2vgJ1q4WrKlB5q1GW+kIhu284Ef+w7z2d1xJiqUkFrQRyVqm8
Ijajt9VG8oVv8C/v+5wBVeEabjZqDkJOvujarkVXDn9lkDS2oDgz/N/0Da6/Q+Pb
I94lHck4KHdvNNamsmSbAfxYre1saiiN0cUfrpYNGPLiAKFN3v3XWJDjyJtiUcjo
T/huXq9iY/d+3nuMUKDi
=QgYl
-----END PGP SIGNATURE-----

--zyqbyw7y52pdpduq--
