Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BABC43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 23:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50C3E2243E
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 23:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZO1jd8M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50C3E2243E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbeKOJ3I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 04:29:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbeKOJ3I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 04:29:08 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 657AB22419;
        Wed, 14 Nov 2018 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542237827;
        bh=ooUEXaLVnD5hzNH/LUy3hiuptwtrRjMGeIyrdrKT55c=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=BZO1jd8MwSRaWzxtlkb1COL9BzMS+xLC3n6c92a1hgoPjCF/IPrra+FVllif6dewe
         uZijYi2+nXlE1P8KtY7Q/RtOFptPlbxHU8tfU6sU27CZiBIOnRLyHTgjQrdTfY+8UO
         uTlAgoWxEZ+Byk8cpd5uG5IaL/2CabHA970LJY8k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42115A499619B6D650C9728480C70@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
 <153989556955.53599.9032716427049619310@swboyd.mtv.corp.google.com>
 <AM0PR04MB42112BEEF4DB939F13D6AF1680F90@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB42115A499619B6D650C9728480C70@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154223782682.88331.13160210691831603996@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V5 9/9] clk: imx: add imx8qxp clk driver
Date:   Wed, 14 Nov 2018 15:23:46 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-11-10 07:58:00)
> Hi Stephen,
> =

> [...]
> > > > > Where's the DT binding for this device?
> > > >
> > > > Sorry for missed to mention this.
> > > > It's been merged into scu binding doc per Rob's request which has
> > > > already been in Shawn's tree.
> > > >
> > > > Please take a look at here:
> > [...]
> > >
> > > Ok I ask because it's odd to hardcode physical addresses in a clk
> > > driver when those should come from DT in reg properties. Was Rob aware
> > > that this clk node was combining I/O memory and message passing?
> > =

> > Yes, I agree with you. That seems like a special to i.MX case.
> > The problem is not all clocks having a LPCG gate. And those LPCGs are a=
lso not
> > continuous and may be shared by many clocks which make things more
> > complicated.
> > I'm not sure parsing from device tree could be better way to do it.
> > Probably need huge changes.
> > =

> =

> I reorganized the driver a lot to address this issue.
> See:
> https://patchwork.kernel.org/cover/10677275/
> We now have a new LPCG clock type and retrieve the LPCG physical
> address from device tree.
> =

> Besides that, as LPCG is moved out from the original SCU gate clocks,
> We have a chance to merge all three type of SCU clocks (divider/gate/mux)
> together into a general SCU clock. (new API introduced imx_clk_scu()).
> Thus, the consumer driver is also simplied a lot which looks better than =
before.
> Hopefully this can make you happy.
> Please help review that new version.
> =


Ok I'll take a look at the new patch series.

