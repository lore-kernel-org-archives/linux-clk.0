Return-Path: <SRS0=sCFe=N7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357D1C4161D
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 18:56:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E2E020C01
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 18:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOpF5QYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E2E020C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbeKUF0Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 00:26:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbeKUF0Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 00:26:25 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58724208E3;
        Tue, 20 Nov 2018 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542740146;
        bh=RrZdkWARXKtFjZ88OLDXItSfGGtmQRe0JeouciasiLQ=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=qOpF5QYpKvQ5+lHnQb0Q7mMgkO3sn/9bdQkmjWxJe1CTMpKZHv/islZOf03MmFf6g
         XyUSPMduDnn0op4dTjgg9no80BCs+f2yD2EoIwfjrX4RaISRutYudQHRSYWCnJwmAj
         tO2/iDVBxWHUF3MO/MudWQl/GFe6Gte5AMpKQtrs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211A7CA91D6188AB81BA6EA80DC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
Message-ID: <154274014557.88331.17188709471206009766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V6 6/6] clk: imx: add imx8qxp lpcg driver
Date:   Tue, 20 Nov 2018 10:55:45 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-11-14 17:28:05)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> =

> > =

> > > +
> > > +       ss_lpcg =3D of_device_get_match_data(dev);
> > > +       if (!ss_lpcg)
> > > +               return -ENODEV;
> > > +
> > > +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       base =3D devm_ioremap(dev, res->start, resource_size(res));
> > =

> > Why not devm_ioremap_resource()?
> =

> Because LPCGs are distributed in various subsystem memory space which
> may be overlapped with some IP modules. So we can't use devm_ioremap_reso=
urce
> which has a request_mem_region() in it.
> It's something like what we've done for drivers/mfd/syscon.c.

Ok. Any chance that the various subsystems that are combined with the
clk controller can be split up so that we can use
devm_ioremap_resource() here? It may be better to carve up the I/O space
of this SoC into device nodes that map to the hardware IP blocks, and
then have those device drivers generate sub-devices for the various
logical subsystems that the hardware IP spans. Or it could be a big
driver that registers with multiple subsytems/frameworks from one device
driver. This way, the logical structure of the linux kernel device
driver design doesn't leak into the DT description of the SoC.

> =

> > > +                               GFP_KERNEL);
> > > +       if (!clk_data)
> > > +               return -ENOMEM;
> > > +
> > > +       clk_data->num =3D ss_lpcg->num_max;
> > > +       clks =3D clk_data->hws;
> > > +
> > > +       for (i =3D 0; i < ss_lpcg->num_lpcg; i++) {
> > > +               lpcg =3D ss_lpcg->lpcg + i;
> > > +               clks[lpcg->id] =3D imx_clk_lpcg_scu(lpcg->name,
> > lpcg->parent,
> > > +                                                 lpcg->flags, base +
> > lpcg->offset,
> > > +                                                 lpcg->bit_idx,
> > lpcg->hw_gate);
> > > +       }
> > > +
> > > +       for (i =3D 0; i < clk_data->num; i++) {
> > > +               if (IS_ERR(clks[i]))
> > > +                       pr_err("i.MX clk %u: register failed with %ld=
\n",
> > > +                               i, PTR_ERR(clks[i]));
> > =

> > But we're OK to continue? Alright...
> > =

> =

> Yes, probably better to use pr_warn()?

Yes.

> =

> > > +       }
> > > +
> > > +       return of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> > > + clk_data);
> > =

> > Why not use devm_? Or can the driver never be unbound from sysfs?
> > =

> =

> We expect the driver to be never unbound from sysfs.
> Probably we'd better add .suppress_bind_attrs.

Ok. Please add it.

