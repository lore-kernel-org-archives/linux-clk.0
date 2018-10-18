Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6367C67863
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 20:46:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A99642145D
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 20:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FH9kWQbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A99642145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbeJSEs5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 00:48:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:44198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbeJSEs5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Oct 2018 00:48:57 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3721520658;
        Thu, 18 Oct 2018 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539895570;
        bh=/8oKP7QuDTZaW8r82AKU9XHDkFC6A2lMXr2Y5UPk3Yo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=FH9kWQbhVo3nDxetY0RFWKaP5qWTgxcEyFlBq0zpAfAWgNzlUvvrejgm5SOMO+iuO
         ma+K1P2h31IghqjgoWTKKnhD6sE3VDgPYfWSMMnJImb/mVMSNHSw/nn5CRPHmQwFiD
         +DZzcJ3XvTKEJclrN93qfK9gMxkcnszx9RshlnFc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
 <1539881347-20871-10-git-send-email-aisheng.dong@nxp.com>
 <153988429912.5275.13469659599335212731@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112CB1324B0994A26AB15D80F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Date:   Thu, 18 Oct 2018 13:46:09 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-18 11:13:39)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Friday, October 19, 2018 1:38 AM
> > To: A.s. Dong <aisheng.dong@nxp.com>; linux-clk@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org; mturquette@baylibre.com;
> > shawnguo@kernel.org; Fabio Estevam <fabio.estevam@nxp.com>; dl-linux-imx
> > <linux-imx@nxp.com>; kernel@pengutronix.de; A.s. Dong
> > <aisheng.dong@nxp.com>
> > Subject: Re: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
> > =

> > Quoting A.s. Dong (2018-10-18 09:54:15)
> > > +
> > > +#include <dt-bindings/clock/imx8qxp-clock.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/err.h>
> > > +#include <linux/io.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +
> > > +#include <soc/imx/imx8qxp/lpcg.h>
> > > +
> > > +#include "clk-scu.h"
> > > +
> > > +static struct clk_hw_onecell_data *imx8qxp_clk_data;
> > > +
> > > +static const char * const enet_sels[] =3D { "enet_25MHz",
> > > +"enet_125MHz", }; static const char * const enet0_rmii_tx_sels[] =3D=
 {
> > > +"enet0_ref_div", "dummy", }; static const char * const
> > > +enet1_rmii_tx_sels[] =3D { "enet1_ref_div", "dummy", };
> > > +
> > > +static int imx8qxp_clk_probe(struct platform_device *pdev) {
> > > +       struct device_node *ccm_node =3D pdev->dev.of_node;
> > =

> > Where's the DT binding for this device?
> =

> Sorry for missed to mention this.
> It's been merged into scu binding doc per Rob's request which has already
> been in Shawn's tree.
> =

> Please take a look at here:
> https://patchwork.kernel.org/patch/10629623/
> =


Ok I ask because it's odd to hardcode physical addresses in a clk driver
when those should come from DT in reg properties. Was Rob aware that
this clk node was combining I/O memory and message passing?

