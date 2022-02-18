Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787B1C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 18 Feb 2022 22:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240086AbiBRWPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 17:15:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbiBRWPY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 17:15:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E93D2838D5;
        Fri, 18 Feb 2022 14:15:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD28FB826DB;
        Fri, 18 Feb 2022 22:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F8DC340E9;
        Fri, 18 Feb 2022 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645222504;
        bh=M5dSoVY3d/Xj3lqvCKf5wDOwHEunbF0u54EGJ2hGCU0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gM0+T0vjR9Jk6/5fjNxlyNAAaHWpd+jwzlmkX6cDOCXd6TDZ+Un6BOw4S8crPEVrf
         WZ5ztiWtO6FC33VyQPNXRrR7vTWVP1TRJSw/6Bbg2Uf/FS0MKrDAbgtfplEhuZqbrU
         GF4PY/sWX0AGhQZGOTIs0zF5TWWPOfbRLoPaxJwTr1uQfiquTDVcFSIjS0BQbssnyL
         Aaj0pOW5CbZEMtv2ilsDnVncXnBzIqlUvXe+QvEvsfAwwWwqCSfTesV+b78SZOF7XV
         Z2Tsd1M26hBDIS1a2nSnyydL7J2g0uvh5FYV9DnRHRlzK9BzzuTd2IVVxOrwrY9zoX
         w1T+3LJrredLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <006919c7-74c9-390a-964e-6b76611988e5@denx.de>
References: <20220213173310.152230-1-marex@denx.de> <20220213173310.152230-2-marex@denx.de> <20220217234539.819AEC340E8@smtp.kernel.org> <006919c7-74c9-390a-964e-6b76611988e5@denx.de>
Subject: Re: [PATCH 2/2] clk: rs9: Add Renesas 9-series PCIe clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 18 Feb 2022 14:15:02 -0800
User-Agent: alot/0.10
Message-Id: <20220218221504.54F8DC340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-02-17 17:26:22)
> On 2/18/22 00:45, Stephen Boyd wrote:
> > Quoting Marek Vasut (2022-02-13 09:33:10)
> >> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> >> index 6a98291350b64..3ec27842ec779 100644
> >> --- a/drivers/clk/Makefile
> >> +++ b/drivers/clk/Makefile
> >> @@ -68,6 +68,7 @@ obj-$(CONFIG_COMMON_CLK_STM32MP157)   +=3D clk-stm32=
mp1.o
> >>   obj-$(CONFIG_COMMON_CLK_TPS68470)      +=3D clk-tps68470.o
> >>   obj-$(CONFIG_CLK_TWL6040)              +=3D clk-twl6040.o
> >>   obj-$(CONFIG_ARCH_VT8500)              +=3D clk-vt8500.o
> >> +obj-$(CONFIG_COMMON_CLK_RS9_PCIE)      +=3D clk-renesas-pcie.o
> >=20
> > Is there a reason it doesn't go into drivers/clk/renesas?
>=20
> The drivers/clk/renesas/ is for renesas SoC (R-Car/RZ/...),
> this chip is different group (it's probably even IDT PLL IP).

Ah ok so it's not a renesas SoC but a renesas IP?

>=20
> [...]
>=20
> >> +#include <linux/mod_devicetable.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_platform.h>
> >=20
> > Is this used? If not please remove.
>=20
> This one is for of_device_get_match_data()
>=20

So it's going away?

>=20
> >> +static int rs9_probe(struct i2c_client *client, const struct i2c_devi=
ce_id *id)
> >> +{
> >> +       struct device_node *np =3D client->dev.of_node;
> >> +       unsigned char *name =3D "DIF0";
> >> +       struct rs9_driver_data *rs9;
> >> +       const char *parent_clk;
> >> +       struct clk_hw *hw;
> >> +       int i, ret;
> >> +
> >> +       rs9 =3D devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
> >> +       if (!rs9)
> >> +               return -ENOMEM;
> >> +
> >> +       i2c_set_clientdata(client, rs9);
> >> +       rs9->client =3D client;
> >> +       rs9->chip_info =3D of_device_get_match_data(&client->dev);
> >=20
> > Check for NULL? Use device_get_match_data()? Or does that not work for
> > i2c devices?

??

> >=20
> >> +
> >> +       /* Fetch common configuration from DT (if specified) */
> >> +       ret =3D rs9_get_common_config(rs9);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       /* Fetch DIFx output configuration from DT (if specified) */
> >> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> >> +               ret =3D rs9_get_output_config(rs9, i);
> >> +               if (ret)
> >> +                       return ret;
> >> +       }
> >> +
> >> +       /* Mandatory XTal */
> >=20
> > Oh it's mandatory here but not in the binding?
> >=20
> >> +       parent_clk =3D of_clk_get_parent_name(np, 0);
> >=20
> > Use clk_parent_data please.
>=20
> This one line I don't understand -- can you expand on what you expect me =

> to do here ?

Use 'struct clk_parent_data' and set .index to 0 so that when
registering the clk you don't need to get the parent clk name.

>=20
> >> +       if (!parent_clk)
> >> +               return dev_err_probe(&client->dev, -EINVAL,
> >> +                                    "Missing XTal input clock\n");
> >> +
> >> +       rs9->regmap =3D devm_regmap_init_i2c(client, &rs9_regmap_confi=
g);
> >> +       if (IS_ERR(rs9->regmap))
> >> +               return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap=
),
> >> +                                    "Failed to allocate register map\=
n");
> >> +
> >> +       /* Register clock */
> >> +       for (i =3D 0; i < rs9->chip_info->num_clks; i++) {
> >> +               name[3]++;
> >> +               hw =3D clk_hw_register_fixed_factor(&client->dev, name,
> >> +                                                 parent_clk, 0, 4, 1);

To do that it looks like maybe we'll need to export
__clk_hw_register_fixed_factor() and introduces some sort of
clk_hw_register_fixed_factor_parent_data() API.

> >> +               if (IS_ERR(hw))
> >> +                       return PTR_ERR(hw);
> >> +
> >> +               rs9->clk_dif[i] =3D hw;
