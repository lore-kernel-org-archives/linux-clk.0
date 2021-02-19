Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D06C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 01:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D185864E44
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 01:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhBSB0l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 20:26:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:43160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhBSB0k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Feb 2021 20:26:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E94664E44;
        Fri, 19 Feb 2021 01:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613697959;
        bh=42x/LKbzJxEUPanyTDGHE4i4CEWQkTuN5dQZZslOgFk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HJmJGYzyp5/V+0D+eI0Zd+pf8+2dpsReIQYSD+fl41S2QvyCm6YULtaO/RvuSzCt8
         V8p3UG7VlY7yvFSmAsaNrfjjl1IoUq6pBf4YnBU1aghCx1C8XcxMgpsJfNWVHQ9+2W
         wrrFzUFm8HooUwmNErq1uK6n4RNIvHgcAA/Oh52nrMlCPi8QTQy+WES4pM2/AKZt+y
         aVQHlg4wJReedq69nfRJeVLZS+rT7iTemzfduFrWEk4KsxcCDmNsXzn/EjHctIIFe7
         /ZXh1gw3OvN/zeeG3IyplHUpywyj55RLWNBMKPQXmxFbPqbvj4OJ0cv0ry6vYgVzhE
         kDsulqiKpKk5Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210218093715.7fdc27ee@xps13>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218093715.7fdc27ee@xps13>
Subject: Re: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the clock outputs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, gregkh@linuxfoundation.org,
        shubhrajyoti.datta@gmail.com
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Date:   Thu, 18 Feb 2021 17:25:57 -0800
Message-ID: <161369795774.1254594.6203789110347055936@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2021-02-18 00:37:15)
> Hi Shubhrajyoti,
>=20
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> 2021 10:19:50 +0530:
>=20
> > The number of output clocks are configurable in the hardware.
> > Currently the driver registers the maximum number of outputs.
> > Fix the same by registering only the outputs that are there.
> >=20
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> > v4:
> > Assign output in this patch
> >=20
> >  drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx=
-clock-wizard.c
> > index ed3b0ef..d403a74 100644
> > --- a/drivers/clk/clk-xlnx-clock-wizard.c
> > +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> > @@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
> >       unsigned long rate;
> >       const char *clk_name;
> >       struct clk_wzrd *clk_wzrd;
> > +     int outputs;
> >       struct device_node *np =3D pdev->dev.of_node;
> > =20
> >       clk_wzrd =3D devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERN=
EL);
> > @@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_device *p=
dev)
> >               goto err_disable_clk;
> >       }
> > =20
> > +     outputs =3D of_property_count_strings(np, "clock-output-names");
>=20
> A check on outputs validity is probably welcome.
>=20
> Also I usually prefer noutputs or nb_outputs for such variable name,
> which implies a number rather than an array, but this is personal taste.

Ideally we get rid of clock-output-names and generate them at runtime
instead based on some combination of device name and something else.
