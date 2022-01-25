Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 898B4C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 20:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbiAYUXc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 15:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiAYUXN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 15:23:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA9C5C06173B;
        Tue, 25 Jan 2022 12:23:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B3036B8180D;
        Tue, 25 Jan 2022 20:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5CBC340E0;
        Tue, 25 Jan 2022 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643142190;
        bh=UHfsX4t1UzheiFJPcEdFZ5OJAnPLF1JercreuXnGHUA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CpStNL/Wm4y05qdc8xOxkRVJNiFkQ1GItwkbudcedM3kX8Gn8Uh+mrmL4FQ2bQDud
         Ysq/+Oi/WpW4tZtrXRkN6S3ykQw0o0h8z9RkrO2Q5c2H04xPOUG2dnXQdDdSb4/RIE
         0Lua4C1ToUpGXHhNjBomdrWMWs/T+d2PuM/jtcezc8BXwLs/XQ9ornSn8gK+5rQ5DZ
         ge+A4yGQ+/bN9IwW69XoL36v3gy8V/NOS6w244U/LmJDfIarXp3zHYlAxcQSpdzMKn
         786XVMB2dJWixiFM3OQHaEDPJuK/tbdgSzTE02Mdn8FfsMPEbhlbSM0inLo5Ue2cox
         oUJXqjZb3yMhg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125134010.2528785-1-conor.dooley@microchip.com>
References: <20220125004818.83E27C340E4@smtp.kernel.org> <20220125134010.2528785-1-conor.dooley@microchip.com>
Subject: Re: [PATCH v9 2/2] clk: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     conor.dooley@microchip.com, cyril.jean@microchip.com,
        daire.mcnamara@microchip.com, david.abdurachmanov@gmail.com,
        devicetree@vger.kernel.org, geert@linux-m68k.org,
        krzysztof.kozlowski@canonical.com, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, padmarao.begari@microchip.com,
        palmer@dabbelt.com, robh+dt@kernel.org
To:     conor.dooley@microchip.com
Date:   Tue, 25 Jan 2022 12:23:08 -0800
User-Agent: alot/0.10
Message-Id: <20220125202310.5E5CBC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting conor.dooley@microchip.com (2022-01-25 05:40:11)
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > Quoting conor.dooley@microchip.com (2021-12-16 06:00:22)
> > > diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/M=
akefile
> > > index f34b247e870f..0dce0b12eac4 100644
> > > --- a/drivers/clk/microchip/Makefile
> > > +++ b/drivers/clk/microchip/Makefile
>=20
> Snipping the rest, will/have addressed them.
>=20
> > > +static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cf=
g_hw_clock *cfg_hws,
> > > +                                 unsigned int num_clks, struct mpfs_=
clock_data *data,
> > > +                                 struct clk *clk_parent)
> > > +{
> > > +       struct clk_hw *hw;
> > > +       void __iomem *sys_base =3D data->base;
> > > +       unsigned int i, id;
> > > +
> > > +       for (i =3D 0; i < num_clks; i++) {
> > > +               struct mpfs_cfg_hw_clock *cfg_hw =3D &cfg_hws[i];
> > > +
> > > +               cfg_hw->cfg.parent =3D __clk_get_hw(clk_parent);
> > > +               cfg_hw->hw.init =3D CLK_HW_INIT_HW(cfg_hw->cfg.name, =
cfg_hw->cfg.parent,
> > > +                                                &mpfs_clk_cfg_ops, c=
fg_hw->cfg.flags);
> > > +               hw =3D mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> > > +               if (IS_ERR(hw)) {
> > > +                       dev_err(dev, "failed to register clock %s\n",=
 cfg_hw->cfg.name);
> > > +                       goto err_clk;
> > > +               }
> > > +
> > > +               id =3D cfg_hws[i].cfg.id;
> > > +               data->hw_data.hws[id] =3D hw;
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +err_clk:
> > > +       while (i--)
> > > +               devm_clk_hw_unregister(dev, data->hw_data.hws[cfg_hws=
[i].cfg.id]);
> >=20
> > > +       clk_parent =3D devm_clk_get(dev, NULL);
> >=20
> > Use clk_parent_data instead please.
> >=20
> > > +       if (IS_ERR(clk_parent))
> > > +               return PTR_ERR(clk_parent);
>=20
>=20
> Please correct me if I am misinterpreting:
> I had the devm_clk_get() in there to pickup the refclk from the device
> tree as a result of previous feedback. I have replaced this with the
> following, which I have found in several other drivers - does it achieve
> the same thing?
> If it does, all of the args to CLK_HW_INIT_PARENTS_DATA are now set at
> compile time & I will take CLK_HW_INIT_PARENTS_DATA back out of this
> function.
>=20
> static struct clk_parent_data mpfs_cfg_parent[] =3D {
>         { .index =3D 0 },
> };

Yes this should be sufficient. Make it const though.

>=20
> static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_=
clock *cfg_hws,
>                                   unsigned int num_clks, struct mpfs_cloc=
k_data *data)
> {
>         void __iomem *sys_base =3D data->base;
>         unsigned int i, id;
>         int ret;
>=20
>         for (i =3D 0; i < num_clks; i++) {
>                 struct mpfs_cfg_hw_clock *cfg_hw =3D &cfg_hws[i];
>=20
>                 cfg_hw->hw.init =3D CLK_HW_INIT_PARENTS_DATA(cfg_hw->cfg.=
name, mpfs_cfg_parent,
>                                                  &mpfs_clk_cfg_ops, cfg_h=
w->cfg.flags);
>=20
>                 ret =3D mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
>                 if (ret) {
>                         dev_err_probe(dev, ret, "failed to register clock=
 %s\n",
>                                       cfg_hw->cfg.name);
>                         return ret;
>                 }
>=20
>                 id =3D cfg_hws[i].cfg.id;
>                 data->hw_data.hws[id] =3D &cfg_hw->hw;
>         }
>=20
>         return 0;
> }

Looks good. Thanks.
