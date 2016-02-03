Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 Feb 2016 20:59:19 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 17/26] drm: sun4i: Add DT bindings documentation
Message-ID: <20160203195919.GB3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-18-git-send-email-maxime.ripard@free-electrons.com>
 <20160115031515.GA19797@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
In-Reply-To: <20160115031515.GA19797@rob-hp-laptop>
List-ID: <linux-clk.vger.kernel.org>


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Jan 14, 2016 at 09:15:15PM -0600, Rob Herring wrote:
> On Thu, Jan 14, 2016 at 04:25:00PM +0100, Maxime Ripard wrote:
> > The display pipeline of the Allwinner A10 is involving several loosely
> > coupled components.
> >=20
> > Add a documentation for the bindings.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../bindings/display/sunxi/sun4i-drm.txt           | 228 +++++++++++++=
++++++++
>=20
> drm is a linuxism. It shouldn't be used for binding doc.

Ack

> >  1 file changed, 228 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sunxi/sun=
4i-drm.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.=
txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > new file mode 100644
> > index 000000000000..061bc87147a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > @@ -0,0 +1,228 @@
> > +Allwinner A10 Display Pipeline
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Allwinner A10 Display pipeline is composed of several components
> > +that are going to be documented below:
> > +
> > +TV Encoder
> > +----------
> > +
> > +The TV Encoder supports the composite and VGA output. It is one end of
> > +the pipeline.
> > +
> > +Required properties:
> > + - compatible: value should be "allwinner,sun4i-a10-tv-encoder".
> > + - reg: base address and size of memory-mapped region
> > + - clocks: the clocks driving the TV encoder
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoint.
> > +
> > +TCON
> > +----
> > +
> > +The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
> > +
> > +Required properties:
> > + - compatible: value should be "allwinner,sun4i-a10-tcon".
> > + - reg: base address and size of memory-mapped region
> > + - interrupts: interrupt associated to this IP
> > + - clocks: phandles to the clocks feeding the TCON. Three are needed:
> > +   - 'ahb': the interface clocks
> > +   - 'tcon-ch0': The clock driving the TCON channel 0
> > +   - 'tcon-ch1': The clock driving the TCON channel 1
> > +
> > + - clock-names: the clock names mentioned above
> > + - clock-output-names: Name of the pixel clock created
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoint, the second one the output
> > +
> > +Optional properties:
> > +  - allwinner,panel: phandle to the panel used in our RGB interface
> > +
> > +
> > +Display Engine Backend
> > +----------------------
> > +
> > +The display engine backend exposes layers and sprites to the
> > +system.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-backend
> > +  - reg: base address and size of the memory-mapped region.
> > +  - clocks: phandles to the clocks feeding the frontend and backend
> > +    * ahb: the backend interface clock
> > +    * mod: the backend module clock
> > +    * ram: the backend DRAM clock
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset controllers driving the backend
> > +
> > +- ports: A ports node with endpoint definitions as defined in
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > +  first port should be the input endpoints, the second one the output
> > +
> > +Display Engine Frontend
> > +-----------------------
> > +
> > +The display engine frontend does formats conversion, scaling,
> > +deinterlacing and color space conversion.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-frontend
> > +  - reg: base address and size of the memory-mapped region.
> > +  - interrupts: interrupt associated to this IP
> > +  - clocks: phandles to the clocks feeding the frontend and backend
>=20
> > +    * ahb: the backend interface clock
> > +    * mod: the backend module clock
> > +    * ram: the backend DRAM clock
>=20
> should be frontend?

Yeah, stupid copy/paste mistake :/

>=20
> > +  - clock-names: the clock names mentioned above
> > +  - resets: phandles to the reset controllers driving the backend
>=20
> ditto
>=20
> > +
> > +Display Engine Pipeline
> > +-----------------------
> > +
> > +The display engine pipeline (and its entry point, since it can be
> > +either directly the backend or the frontend) is represented as an
> > +extra node.
> > +
> > +Required properties:
> > +  - compatible: value must be one of:
> > +    * allwinner,sun5i-a13-display-engine
> > +  - allwinner,pipelines: list of phandle to the entry points of the
> > +    pipelines (either to the frontend or backend)
> > +
> > +Example:
> > +
> > +panel: panel {
> > +	compatible =3D "olimex,lcd-olinuxino-43-ts";
>=20
> This should either be a child of what it is attached to or use of-graph.

You had a similar discussion with Thierry last time I sent it, and it
seemed to settle on keeping that property:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/382115.h=
tml

Has that changed?

> > +};
> > +
> > +tve0: tv-encoder@01c0a000 {
> > +	compatible =3D "allwinner,sun4i-a10-tv-encoder";
> > +	reg =3D <0x01c0a000 0x1000>;
> > +	clocks =3D <&ahb_gates 34>;
> > +
> > +	port {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		tve0_in_tcon0: endpoint@0 {
> > +			reg =3D <0>;
>=20
> I would drop the reg where you only have 1 node for ports or endpoints.

Ok

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWslwWAAoJEBx+YmzsjxAgbtoP/A5eHfuhnBzvoZi0T4rhWEUB
ebqbHUUO16XgNEcXZZNliMGDa2ORmeBHAgIwFCz0MOteI/Fr3ZsbnNvG8qsuT2MN
eZV+gwB60iJFmUXKLT7wqkjvnp/jHfoW9SmL+OZ9AM/a567rOXjFcokm4AW75hg2
Ehgp/7YONUFUDo1apgG8ueovfCP7isysN608/BExammbiivcPXrxrYQF7E8vI4ET
T7goS6XrLYyjWqdgEZjtdqdoEMySa3tX+/4yVoGf3hsRsTFroiX7ibjVi+Wenjnd
m8Dwjm59M23bNckPvIpltHKNv0p0ACDKLKixyngakoxIRRBXNPDfKXG4up0pvXhf
dsXN+QnsS+B9CK+DMInmzmpt2R3effdI0XQqQ/yTlk9U0Vi2wU7ek1ENnTAW/TbQ
Gpssyp6j9TeFzpuhBLad6c3fGze9kyKhlVXgeQsdpTvGJNv96t+x18E3yoY/UGi2
DitWVJXCFfo4WiF7vU45kZE+1suDIOXqGpNuKCZVBItm8lVkN6M5DoY1ZtR/UTIV
snS52wT5Ntwav+sCx41AxBh2q3Qr5sAUVIy1ZgotdKEeKadT6D2NX/U4nmI/OEuA
RdoGIegTtC3V9SfOe0TeiekLt9PwvK4UakTD2JMmGUhlazzcfJIZ9X+9nRfvHL+M
0v6t+gW/KQVT70gg31Z4
=bWsD
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
