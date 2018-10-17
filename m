Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72E1ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77D4B21526
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq7quADq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D4B21526
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbeJQXDT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:03:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:44174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727182AbeJQXDT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:03:19 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0251D20658;
        Wed, 17 Oct 2018 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539788832;
        bh=OWnn0vjY+SVKcL7sA7thHL1ngsLNT0O9eZayruw0BCE=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=Bq7quADqjmKVJeXIFLQadubIayOp/pKFgDPNm99atLG9otjxq/HpazDWyVFFVjs2O
         Q2sge3iJI1JnHjCUD7Nj9yqjKFk+eWzSSOiZhCGj+cV0oI16H0pJJ486sTgFiL5Rfb
         OaL3Pzu3oKYta+hJDlhgsPXrCLeC3E8ZG+ukNQao=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42110A50FDC33E66A9DDF63D80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
 <153972550584.5275.12112973418888551824@swboyd.mtv.corp.google.com>
 <AM0PR04MB42110A50FDC33E66A9DDF63D80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153978883132.5275.17975663103503100871@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Date:   Wed, 17 Oct 2018 08:07:11 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 02:11:03)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 5:32 AM
> > Quoting A.s. Dong (2018-10-14 01:07:45)
> > > Add scu clock common part which will be used by client clock drivers.
> > >
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > ChangeLog:
> > > v3->v4:
> > >  * scu headfile path change
> > > v2->v3:
> > >  * no changes
> > > v1->v2:
> > >  * update function call name
> > > ---
> > >  drivers/clk/imx/Kconfig       |  2 ++
> > >  drivers/clk/imx/Makefile      |  2 ++
> > >  drivers/clk/imx/scu/Kconfig   |  5 +++++
> > >  drivers/clk/imx/scu/Makefile  |  4 ++++
> > > drivers/clk/imx/scu/clk-scu.c | 17 +++++++++++++++++
> > > drivers/clk/imx/scu/clk-scu.h | 18 ++++++++++++++++++
> > =

> > Why is scu nested one level deeper in the imx directory? Can't we just =
keep
> > them all within imx toplevel directory?
> > =

> =

> Mostly because SCU clocks are totally different from the legacy clocks.
> (No much legacy things can be reused) So organized them together in a dee=
per folder
> for clear separation and better maintenance
> =

> Do you think we still should put them within imx toplevel directory and m=
ix them with
> Legacy clocks?
> =


Yes. Or make a new imx-foo directory for your new fangled SoC clk driver
code in drivers/clk/.
