Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:40092 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752332AbeGATLV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 Jul 2018 15:11:21 -0400
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 10/24] drm/sun4i: tcon: Generalize engine search algorithm
Date: Sun, 01 Jul 2018 21:09:47 +0200
Message-ID: <7152481.kAipQ5gD38@jernej-laptop>
In-Reply-To: <3257762.ZQzN8rrT6c@jernej-laptop>
References: <20180625120304.7543-1-jernej.skrabec@siol.net> <20180628182543.yyja6hiry7rx7fu2@flea> <3257762.ZQzN8rrT6c@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dne petek, 29. junij 2018 ob 21:06:09 CEST je Jernej =C5=A0krabec napisal(a=
):
> Dne =C4=8Detrtek, 28. junij 2018 ob 20:25:43 CEST je Maxime Ripard napisa=
l(a):
> > On Thu, Jun 28, 2018 at 06:48:50AM +0200, Jernej =C5=A0krabec wrote:
> > > Dne =C4=8Detrtek, 28. junij 2018 ob 04:06:52 CEST je Chen-Yu Tsai nap=
isal(a):
> > > > On Mon, Jun 25, 2018 at 8:02 PM, Jernej Skrabec
> > > > <jernej.skrabec@siol.net>
> > >=20
> > > wrote:
> > > > > Current "old" method to find engine worked pretty well for DE2.
> > > > > However,
> > > > > it doesn't work when TCON TOP is between  mixer (engine) and TCON.
> > > > > TCON
> > > > > TOP has multiple input ports, but current engine search algorithm
> > > > > expects only one.
> > > > >=20
> > > > > This can be fixed by first looking for output port id and selecti=
ng
> > > > > matching input by subtracting 1 for the next round. This work even
> > > > > if
> > > > > there is only one input and output.
> > > > >=20
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > ---
> > > > >=20
> > > > >  drivers/gpu/drm/sun4i/sun4i_tcon.c | 22 ++++++++++++++++++----
> > > > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > b/drivers/gpu/drm/sun4i/sun4i_tcon.c index
> > > > > 08747fc3ee71..264bcc43da11
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > > > @@ -791,12 +791,14 @@ static int sun4i_tcon_init_regmap(struct
> > > > > device
> > > > > *dev,
> > > > >=20
> > > > >   */
> > > > > =20
> > > > >  static struct sunxi_engine *
> > > > >  sun4i_tcon_find_engine_traverse(struct sun4i_drv *drv,
> > > > >=20
> > > > > -                               struct device_node *node)
> > > > > +                               struct device_node *node,
> > > > > +                               u32 port_id)
> > > > >=20
> > > > >  {
> > > > > =20
> > > > >         struct device_node *port, *ep, *remote;
> > > > >         struct sunxi_engine *engine =3D ERR_PTR(-EINVAL);
> > > > >=20
> > > > > +       u32 reg =3D 0;
> > > > >=20
> > > > > -       port =3D of_graph_get_port_by_id(node, 0);
> > > > > +       port =3D of_graph_get_port_by_id(node, port_id);
> > > > >=20
> > > > >         if (!port)
> > > > >        =20
> > > > >                 return ERR_PTR(-EINVAL);
> > > > >=20
> > > > > @@ -826,8 +828,20 @@ sun4i_tcon_find_engine_traverse(struct
> > > > > sun4i_drv
> > > > > *drv,
> > > > >=20
> > > > >                 if (remote =3D=3D engine->node)
> > > > >                =20
> > > > >                         goto out_put_remote;
> > > > >=20
> > > > > +       /*
> > > > > +        * According to device tree binding input ports have even=
 id
> > > > > +        * number and output ports have odd id. Since component w=
ith
> > > > > +        * more than one input and one output (TCON TOP) exits,
> > > > > correct
> > > > > +        * remote input id has to be calculated by subtracting 1
> > > > > from
> > > > > +        * remote output id. If this for some reason can't be don=
e,
> > > > > 0
> > > > > +        * is used as input port id.
> > > > > +        */
> > > >=20
> > > > You need to call
> > > >=20
> > > >     of_node_put(port);
> > > >=20
> > > > to drop the reference to the original port.
> > >=20
> > > Thanks for noticing it. I guess I should send fix patch, since patches
> > > from
> > > drm-misc-next can't be dropped.
> >=20
> > Yeah, please send additional patches for all the issues pointed out by
> > Chen-Yu.
>=20
> Of course. I hope this can be resolved till the end of the next week. Aft=
er
> that, I will be away from PC for 2 weeks. Feel free to drop DT patches if
> you think that it will come too close to merge window.

Actually, can you drop it anyway? It needs a lot of changes and keeping HDM=
I=20
working would need some effort.

Best regards,
Jernej




