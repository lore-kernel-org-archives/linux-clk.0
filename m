Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD32ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22B6821527
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 15:17:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6aS3HUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B6821527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbeJQXNy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 19:13:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbeJQXNy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 19:13:54 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B61302150D;
        Wed, 17 Oct 2018 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539789464;
        bh=JmvtNrm7t2U8I0IP1g+bpoKqdtzPmkPoq1xSnB0okO4=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=J6aS3HUaVFkGiaqDLIk0ywqCrytOocNp9kqU8vlKO498T3ZEEJN9/sdWwkHDHBLw5
         xhwltbxkV+KRi22/jNLaHJjykCILkXsz5UpZ/xh5Pi5mMfMuOwvFHVnupeiK9fyYHm
         gwfb0wcoNch2KCElv+1NwH4afHkuvioqejZD/buE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42119987039050D9488EB30F80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-5-git-send-email-aisheng.dong@nxp.com>
 <153972527843.5275.15123840961402192766@swboyd.mtv.corp.google.com>
 <AM0PR04MB42119987039050D9488EB30F80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153978946415.5275.1276338045125571065@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Date:   Wed, 17 Oct 2018 08:17:44 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 02:03:28)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 5:28 AM
> [...]
> > Quoting A.s. Dong (2018-10-14 01:07:52)
> > > +/*
> > > + * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
> > > + * @hw: clock to get rate for
> > > + * @parent_rate: parent rate provided by common clock framework
> > > + *
> > > + * Gets the current clock rate of a SCU clock. Returns the current
> > > + * clock rate, or zero in failure.
> > > + */
> > > +static unsigned long clk_divider_gpr_scu_recalc_rate(struct clk_hw *=
hw,
> > > +                                                    unsigned long
> > > +parent_rate) {
> > > +       struct clk_divider_gpr_scu *clk =3D to_clk_divider_gpr_scu(hw=
);
> > > +       u32 val;
> > > +       int ret;
> > > +
> > > +       ret =3D imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
> > > +                                     clk->gpr_id, &val);
> > > +       if (ret) {
> > > +               pr_err("%s: failed to get clock rate %d\n",
> > > +                       clk_hw_get_name(hw), ret);
> > > +               return 0;
> > > +       }
> > > +
> > > +       return val ? parent_rate / 2 : parent_rate;
> > =

> > I hope parent_rate can't be zero here.
> > =

> =

> It can be zero, I guess.
> But zero seems safe to me, am I wrong?

No nothing goes wrong so it's fine.
