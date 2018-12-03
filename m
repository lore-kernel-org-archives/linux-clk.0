Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40830C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 062F3214C1
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr2JLzEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 062F3214C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbeLCSzi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 13:55:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:33496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbeLCSzi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 13:55:38 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 795B4208A3;
        Mon,  3 Dec 2018 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543863335;
        bh=e1HS1dfwn1OAMmZAaiTUcAcuQiSS0bRtNxOfrQ40UsI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=sr2JLzEY3d+bOJPIsrZ/nBZpxB/NuclcRIWotToXOUzm1iyWehhLMV5qSifie62SC
         nELJnIF7OD8wE8kRKcsrHQJiRl5117wjMK6AWBYr2qg/C/tavxGq6twkpC8laGzpcr
         FqhPtnPhw6nqZ4r2es5Tf3wu4PfsE7AvaTdiO7c0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211E36F9553E16A196C101C80DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-7-git-send-email-aisheng.dong@nxp.com>
 <154223811948.88331.8860718270277533070@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211A7CA91D6188AB81BA6EA80DC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154274014557.88331.17188709471206009766@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211E36F9553E16A196C101C80DA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154386333481.88331.9590400147413133304@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Date:   Mon, 03 Dec 2018 10:55:34 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-11-20 17:50:47)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> [...]
> > > > > +
> > > > > +       ss_lpcg =3D of_device_get_match_data(dev);
> > > > > +       if (!ss_lpcg)
> > > > > +               return -ENODEV;
> > > > > +
> > > > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > > +       base =3D devm_ioremap(dev, res->start, resource_size(res)=
);
> > > >
> > > > Why not devm_ioremap_resource()?
> > >
> > > Because LPCGs are distributed in various subsystem memory space which
> > > may be overlapped with some IP modules. So we can't use
> > > devm_ioremap_resource which has a request_mem_region() in it.
> > > It's something like what we've done for drivers/mfd/syscon.c.
> > =

> > Ok. Any chance that the various subsystems that are combined with the c=
lk
> > controller can be split up so that we can use
> > devm_ioremap_resource() here? =

> =

> We can achieve that by describing each LPCGS node in devicetree, but that=
 would
> bloat the Devicetree seriously as we have hundreds of LPCGS.
> =

> This is similar as what we did for legacy SoCs, e.g MX7D.
> The difference is that on MX7D LPCGS are continuous.
> e.g.
> Table 5-19. CCGR Mapping Table
> Gating Register LPCG Enable Offset
> CCM_CCGR4 sim_main 0x4040
> CCM_CCGR5 sim_display 0x4050
> ...
> CCM_CCGR168 iomux 0x4A80
> CCM_CCGR169 iomux_lpsr 0x4A90
> CCM_CCGR170 kpp 0x4AA0
> =

> But on MX8QXP/QM, they're not continuous anymore and distributed in each =
SS.
> And we probably want to push our IC designer to re-orgnize them into a co=
ntinuous
> memory map again for new chips in the future.
> =

> So do you think we can start with this way for MX8 as well?
> Then we won't block MX8QXP booting up too long or probably could improve =
it
> Later.

Ok, I don't really understand the memory map of this SoC. I wouldn't
push the IC designer to reorganize everything. I'd push the designer to
make clock controller hw blocks, maybe even one per subsystem is OK, and
then have that build on basic clk types that the clock controller
drivers could use to implement the clk support.

Either way, this hardware must already exist so I think we're done here.
I'm OK with whatever works at this point.

> =

> > It may be better to carve up the I/O space of
> > this SoC into device nodes that map to the hardware IP blocks, and then=
 have
> > those device drivers generate sub-devices for the various logical subsy=
stems
> > that the hardware IP spans. Or it could be a big driver that registers =
with
> > multiple subsytems/frameworks from one device driver. This way, the log=
ical
> > structure of the linux kernel device driver design doesn't leak into th=
e DT
> > description of the SoC.
> > =

> =

> Yes, we currently already describe them with each subsystems in Devicetre=
e.
> https://patchwork.kernel.org/patch/10677311/
> =


Ok.

