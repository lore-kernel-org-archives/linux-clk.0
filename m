Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA1AC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 07:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A82761057
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 07:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhDHH1D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 03:27:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhDHH1C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Apr 2021 03:27:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8FA461164;
        Thu,  8 Apr 2021 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617866811;
        bh=iNg668k9dQIAbkMaHoCXNGv4EXpNqOrHeRxZMA7Ms5s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HZVer5iXEjX5kCyL2xmaeFB6s74WlMwVsa4tPxSeRI9NbxoDpxtr2tOVTEJv3Uj6h
         5ioUcB8BS2sR+uDwuo1tcKdLppPNwvBkG5k8WeMNNfkCmDLW7yhjFQY8BFWoBKN58w
         DVVYysMyRgV5CKA1ktYdb2Jzk6SGAlVvjGy8srm/wHcIZiytsvXcnepSmzpSOYuDKj
         vOX4S+Nu3YLcw/hkySYe0oUKU9d6vDYmTShJZ3ch3shyxsTqcx77SbjEVlDZtPH5ay
         C6L2dlNI4tWLZIiXExpHpyoMAWMGO74JeCI7KqkGR77jOI4m9Hzkkp5+8zHqrCym96
         kSYeKqVrc09hA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adc19516-3cfa-7c2c-32fe-900ded46a994@lechnology.com>
References: <1616484126-131947-1-git-send-email-dj0227@163.com> <adc19516-3cfa-7c2c-32fe-900ded46a994@lechnology.com>
Subject: Re: [PATCH] clk: davinci: fix regmap use PTR_ERR after initial
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, huyue2@yulong.com,
        Jian Dong <dongjian@yulong.com>
To:     David Lechner <david@lechnology.com>, Jian Dong <dj0227@163.com>,
        mturquette@baylibre.com, nsekhar@ti.com
Date:   Thu, 08 Apr 2021 00:26:50 -0700
Message-ID: <161786681031.3790633.6695662279847364126@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting David Lechner (2021-03-23 09:03:38)
> On 3/23/21 2:22 AM, Jian Dong wrote:
> > From: Jian Dong <dongjian@yulong.com>
> >=20
> > fixes coccicheck ERROR:
> >=20
> > drivers/clk/davinci/da8xx-cfgchip.c:768:18-25: ERROR:
> > PTR_ERR applied after initialization to constant on line 746
> >=20
> > Signed-off-by: Jian Dong <dongjian@yulong.com>
> > ---
> >   drivers/clk/davinci/da8xx-cfgchip.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/=
da8xx-cfgchip.c
> > index 77d1827..f57ba1b 100644
> > --- a/drivers/clk/davinci/da8xx-cfgchip.c
> > +++ b/drivers/clk/davinci/da8xx-cfgchip.c
> > @@ -743,7 +743,7 @@ static int da8xx_cfgchip_probe(struct platform_devi=
ce *pdev)
> >       struct da8xx_cfgchip_clk_platform_data *pdata =3D dev->platform_d=
ata;
> >       const struct of_device_id *of_id;
> >       da8xx_cfgchip_init clk_init =3D NULL;
> > -     struct regmap *regmap =3D NULL;
> > +     struct regmap *regmap;
> >  =20
> >       of_id =3D of_match_device(da8xx_cfgchip_of_match, dev);
> >       if (of_id) {
> >=20
>=20
> I think it is better to leave this as-is. Otherwise some compilers
> may create an error/warning about using an uninitialized value
> even if it technically is not possible.
>=20
> In fact, the coccicheck error seems wrong. regmap will have always
> been assigned a value by the time IS_ERR_OR_NULL(regmap) is called.
>=20
> Here is the full function for context:
>=20
> static int da8xx_cfgchip_probe(struct platform_device *pdev)
> {
>         struct device *dev =3D &pdev->dev;
>         struct da8xx_cfgchip_clk_platform_data *pdata =3D dev->platform_d=
ata;
>         const struct of_device_id *of_id;
>         da8xx_cfgchip_init clk_init =3D NULL;
>         struct regmap *regmap =3D NULL;
>=20
>         of_id =3D of_match_device(da8xx_cfgchip_of_match, dev);
>         if (of_id) {
>                 struct device_node *parent;
>=20
>                 clk_init =3D of_id->data;
>                 parent =3D of_get_parent(dev->of_node);
>                 regmap =3D syscon_node_to_regmap(parent);
>                 of_node_put(parent);
>         } else if (pdev->id_entry && pdata) {
>                 clk_init =3D (void *)pdev->id_entry->driver_data;
>                 regmap =3D pdata->cfgchip;
>         }
>=20
>         if (!clk_init) {
>                 dev_err(dev, "unable to find driver data\n");
>                 return -EINVAL;
>         }

Would the static checkers get tripped up if this if condition was turned
into an else on the other two arms? Otherwise, why not initialize regmap
to PTR_ERR(-ENOENT) and silence the checkers? Then the usage of
IS_ERR_OR_NULL could be replaced with IS_ERR() and everyone wins?

>=20
>         if (IS_ERR_OR_NULL(regmap)) {
>                 dev_err(dev, "no regmap for CFGCHIP syscon\n");
>                 return regmap ? PTR_ERR(regmap) : -ENOENT;
>         }
>=20
>         return clk_init(dev, regmap);
> }
