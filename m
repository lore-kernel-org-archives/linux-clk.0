Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B5EC65BAE
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24A8F2075B
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544751040;
	bh=skZAWQDKTEsZekYxuQNHcn7w3KgrrCkKygExjrqQb1I=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=Lc4+D6m92EZGnBJOuFo74HvRmdy9MHGQ5jqtWZPJhSYKivss1H9MvBwiqBHMxGYDp
	 PcbF8vU23KJmMF5rYNvmVVchMj1rYxLV33Lgzitxm3NG0HukuJStC258jF+aO1K/iS
	 /BjiMd8OXMTSOwr4ECWqIV03QqkZ48/QPntt8iNk=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A8F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbeLNBaj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 20:30:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:57902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbeLNBaj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 20:30:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB75120645;
        Fri, 14 Dec 2018 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544751038;
        bh=skZAWQDKTEsZekYxuQNHcn7w3KgrrCkKygExjrqQb1I=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=iHxquHBmMAxVyWHdMd4QeucWbhzc4TOMHAhyRDSwbsCLqwUdFIxHCxIvwrWQy73Ym
         KZUCPNrOseKm+VWRfJse4bI0wKlP4FsHXEf4NwPIjITVRISqdpFVr6GYY/ISV9wenC
         K/qQtYK8kiw6r4j6TSSDZeCg82Jn8beS9CjTVBXM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
Subject: RE: [PATCH V11 2/7] clk: imx: add scu clock common part
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com> <1544662938-5020-3-git-send-email-aisheng.dong@nxp.com> <154468728640.19322.12955855783518519739@swboyd.mtv.corp.google.com> <AM0PR04MB42118C3E7F49A0437453BA5880A00@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154475103791.19322.8783777114832958727@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Date:   Thu, 13 Dec 2018 17:30:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 03:19:26)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Quoting Aisheng Dong (2018-12-12 17:07:55)
> > > diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig index
> > > 37478ba..5c26f4e 100644
> > > --- a/drivers/clk/imx/Kconfig
> > > +++ b/drivers/clk/imx/Kconfig
> > > @@ -3,3 +3,9 @@
> > >  config MXC_CLK
> > >         bool
> > >         def_bool (ARCH_MXC && !ARM64) || (ARCH_MXC && ARM64 &&
> > > SOC_IMX8MQ)
> > > +
> > > +config MXC_CLK_SCU
> > > +       bool "IMX SCU Clock"
> > > +       depends on ARCH_MXC && ARM64
> >=20
> > This should depend on the IMX_SCU config too, right? Otherwise compilat=
ion
> > will fail.
> >=20
>=20
> Yes, you're right. I will add it.
>=20
> > Plus, I can't seem to compile this driver regardless, because the defin=
es for the
> > CLK messages are in some header file that is just included in another h=
eader
> > file, and that is all going through another tree. Why?
> >=20
> > Is there any reason why those defines can't just be written in the clk-=
scu.h file
> > introduced in this patch?
>=20
> Sorry about that.
> Yes, it depends on PM service headfile [1] which defines all the power re=
lated service together
> by SCU protocol, including power domain/clk/reset and etc.=20
> (we probably should divide them to get a better separation from the start=
).
> But Patch 4 depends on the resource ID headfile shared by most SCU client=
 users.
>=20
> [1] https://patchwork.kernel.org/patch/10664137/
> [2] https://patchwork.kernel.org/patch/10664125/
>=20
> How would you suggest for this situation?
>=20

I suggest the defines just go into the clk driver. Is that a workable
solution or does something not work?

