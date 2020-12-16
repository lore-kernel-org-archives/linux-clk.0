Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABE2C4361B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 01:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E331222EBD
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 01:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgLPBKc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:10:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:53210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgLPBKc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Dec 2020 20:10:32 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608080991;
        bh=xJALK+jNhT64ScJdHlAzbU/phSONliHPBpEunql1QGc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YGHx0ozpqyN2h/UiocUJFRhyYFXqXGl3YcQeZA3OixBy4Kuaza3lCs7vV0ZzUyRq+
         lDohCFqesfSD72MhWHxSGtYMcay2O8I8PkR9b1zmICKbEkrZLL9H8yq5NrpsyTx4eT
         aTEujuTsnOt2pCt2mDS8mAUrazKh63909rZDlU23kOrrn4faKUFPP1Nibdw+nQOW2n
         RbO4yrKff2k5e5eeIGfRG/IWWhziPnJlSCyAkZk9GU/thRuIQr9tthf6Vi3oA2WpgG
         clJZK1i0VpaCHt6E1WQ0Fr43IKVUzSgU6tFDAOKe/2RorGZH0xeOpS0i5b775oDDAs
         PBketNfpas4/Q==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201215113809.GA23407@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <20201116075532.4019252-9-m.tretter@pengutronix.de> <160783893475.1580929.17041767429276672732@swboyd.mtv.corp.google.com> <20201215113809.GA23407@pengutronix.de>
Subject: Re: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, rajanv@xilinx.com, tejasp@xilinx.com,
        dshah@xilinx.com, rvisaval@xilinx.com, michals@xilinx.com,
        kernel@pengutronix.de, robh+dt@kernel.org, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>
Date:   Tue, 15 Dec 2020 17:09:50 -0800
Message-ID: <160808099008.1580929.16611149064276335127@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-12-15 03:38:09)
> On Sat, 12 Dec 2020 21:55:34 -0800, Stephen Boyd wrote:
> > Quoting Michael Tretter (2020-11-15 23:55:28)
> > > diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_=
vcu.c
> > > index 725e646aa726..cedc8b7859f7 100644
> > > --- a/drivers/soc/xilinx/xlnx_vcu.c
> > > +++ b/drivers/soc/xilinx/xlnx_vcu.c
> > > @@ -545,6 +512,146 @@ static int xvcu_set_pll(struct xvcu_device *xvc=
u)
> > >         return xvcu_pll_enable(xvcu);
> > >  }
> > > =20
> > > +static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
> > > +                                               const char *name,
> > > +                                               const char * const *p=
arent_names,
> > > +                                               u8 num_parents,
> > > +                                               struct clk_hw *parent=
_default,
> > > +                                               void __iomem *reg,
> > > +                                               spinlock_t *lock)
> > > +{
> > > +       unsigned long flags =3D CLK_SET_RATE_NO_REPARENT | CLK_SET_RA=
TE_PARENT;
> > > +       u8 divider_flags =3D CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLO=
W_ZERO |
> >=20
> > Why u8?
>=20
> __clk_hw_register_divider expects u8 as divider_flags.

Ok.

>=20
> >=20
> > > +                          CLK_DIVIDER_ROUND_CLOSEST;
> > > +       struct clk_hw *mux =3D NULL;
> > > +       struct clk_hw *divider =3D NULL;
> > > +       struct clk_hw *gate =3D NULL;
> > > +       char *name_mux;
> > > +       char *name_div;
> > > +       int err;
> > > +
> > > +       name_mux =3D devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_=
mux");
> > > +       if (!name_mux) {
> > > +               err =3D -ENOMEM;
> > > +               goto err;
> > > +       }
> > > +       mux =3D clk_hw_register_mux(dev, name_mux, parent_names, num_=
parents,
> > > +                                 flags, reg, 0, 1, 0, lock);
> > > +       if (IS_ERR(mux)) {
> > > +               err =3D PTR_ERR(divider);
> > > +               goto err;
> > > +       }
> > > +       clk_hw_set_parent(mux, parent_default);
> >=20
> > Can this be done from assigned-clock-parents binding?
>=20
> Could be done, if the driver provides at least the PLL and the mux in add=
ition
> to the actual output clocks. Otherwise, it is not possible to reference t=
he
> PLL post divider and the mux from the device tree. I wanted to avoid to e=
xpose
> the complexity to the device tree. Would you prefer, if all clocks are
> provided instead of only the output clocks?

It is fine to do this in software too so not a big deal and no need to
expose it from the device.

>=20
> >=20
> > > +
> > > +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> > > +{
> > > +       struct device *dev =3D xvcu->dev;
> > > +       const char *parent_names[2];
> > > +       struct clk_hw *parent_default;
> > > +       struct clk_hw_onecell_data *data;
> > > +       struct clk_hw **hws;
> > > +       void __iomem *reg_base =3D xvcu->vcu_slcr_ba;
> > > +
> > > +       data =3D devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NU=
M_CLOCKS), GFP_KERNEL);
> > > +       if (!data)
> > > +               return -ENOMEM;
> > > +       data->num =3D CLK_XVCU_NUM_CLOCKS;
> > > +       hws =3D data->hws;
> > > +
> > > +       xvcu->clk_data =3D data;
> > > +
> > > +       parent_default =3D xvcu->pll;
> > > +       parent_names[0] =3D "dummy";
> >=20
> > What is "dummy"?
>=20
> According to the register reference [0], the output clocks can be driven =
by an
> external clock instead of the PLL, but the VCU Product Guide [1] does not
> mention any ports for actually driving the clock. From my understanding o=
f the
> IP core, this is a clock mux which has a not-connected first parent. Maybe
> someone at Xilinx can clarify, what is happening here.
>=20
> [0] https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrasc=
ale-registers.html
> [1] https://www.xilinx.com/support/documentation-navigation/see-all-versi=
ons.html?xlnxproducttypes=3DIP%20Cores&xlnxipcoresname=3Dv-vcu
>=20
> What would be a better way to handle this?
>=20
> >=20
> > > +       parent_names[1] =3D clk_hw_get_name(parent_default);
> >=20
> > Can we use the new way of specifying clk parents from DT or by using
> > direct pointers instead of using string names? The idea is to get rid of
> > clk_hw_get_name() eventually.
>=20
> It should be possible to use the direct pointers, but this really depends=
 on
> how the "dummy" clock is handled.
>=20

I think if clk_parent_data is used then we can have the binding list the
external clk as a 'clocks' property and then if it's not present in DT
we will know that it can't ever be a parent. So it hopefully "just
works" if clk_parent_data is used.
