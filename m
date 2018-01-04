Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Jan 2018 19:52:10 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: Rob Herring <robh@kernel.org>, airlied@linux.ie, mark.rutland@arm.com,
	wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, Jose.Abreu@synopsys.com,
	narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 06/11] dt-bindings: display: sun4i-drm: Add A83T HDMI
 pipeline
Message-ID: <20180104185210.afsvsofq7q35psa6@flea.lan>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
 <20171230210203.24115-7-jernej.skrabec@siol.net>
 <20180103202154.eeajt3234w3adqjq@rob-hp-laptop>
 <1645801.yZU0HLsLbk@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1645801.yZU0HLsLbk@jernej-laptop>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 03, 2018 at 10:32:26PM +0100, Jernej =C5=A0krabec wrote:
> Hi Rob,
>=20
> Dne sreda, 03. januar 2018 ob 21:21:54 CET je Rob Herring napisal(a):
> > On Sat, Dec 30, 2017 at 10:01:58PM +0100, Jernej Skrabec wrote:
> > > This commit adds all necessary compatibles and descriptions needed to
> > > implement A83T HDMI pipeline.
> > >=20
> > > Mixer is already properly described, so only compatible is added.
> > >=20
> > > However, A83T TCON1, which is connected to HDMI, doesn't have channel=
 0,
> > > contrary to all TCONs currently described. Because of that, TCON
> > > documentation is extended.
> > >=20
> > > A83T features Synopsys DW HDMI controller with a custom PHY which loo=
ks
> > > like Synopsys Gen2 PHY with few additions. Since there is no
> > > documentation, needed properties were found out through experimentati=
on
> > > and reading BSP code.
> > >=20
> > > At the end, example is added for newer SoCs, which features DE2 and DW
> > > HDMI.
> > >=20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > ---
> > >=20
> > >  .../bindings/display/sunxi/sun4i-drm.txt           | 188
> > >  ++++++++++++++++++++- 1 file changed, 181 insertions(+), 7 deletions=
(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-dr=
m.txt
> > > b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt index
> > > 9f073af4c711..3eca258096a5 100644
> > > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> > >=20
> > > @@ -64,6 +64,40 @@ Required properties:
> > >      first port should be the input endpoint. The second should be the
> > >      output, usually to an HDMI connector.
> > >=20
> > > +DWC HDMI TX Encoder
> > > +-----------------------------
> > > +
> > > +The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller=
 IP
> > > +with Allwinner's own PHY IP. It supports audio and video outputs and=
 CEC.
> > > +
> > > +These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> > > +Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
> > > +following device-specific properties.
> > > +
> > > +Required properties:
> > > +
> > > +  - compatible: value must be one of:
> > > +    * "allwinner,sun8i-a83t-dw-hdmi"
> > > +  - reg: two pairs of base address and size of memory-mapped region,
> > > first
> > > +    for controller and second for PHY
> > > +    registers.
> >=20
> > Seems like the phy should be a separate node and use the phy binding.
> > You can use the phy binding even if you don't use the kernel phy
> > framework...
>=20
> Unfortunately, it's not so straighforward. Phy is actually accessed throu=
gh=20
> I2C implemented in HDMI controller. Second memory region in this case has=
=20
> small influence on phy. However, it has big influence on controller. For=
=20
> example, magic number has to be written in one register in second memory=
=20
> region in order to unlock read access to any register from first memory r=
egion=20
> (controller). However, they shouldn't be merged to one region, because fi=
rst=20
> memory region requires byte access while second memory region can be acce=
ssed=20
> per byte or word.
>=20
> To complicate things more, later I want to add support for another SoC wh=
ich=20
> has same glue layer (unlocking read access, etc.) and uses memory mapped =
phy=20
> registers in second memory region.
>=20
> I think current binding is the least complicated way to represent this.

I agree with Rob here. I did a similar thing for the DSI patches I've
sent a few monthes ago and it turned out to not be that difficult, so
I'm sure you can come up with something :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
