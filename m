Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9435ECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 16:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF7DB21528
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 16:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPGYvSF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF7DB21528
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbeJRACP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 20:02:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbeJRACP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 20:02:15 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4F792150D;
        Wed, 17 Oct 2018 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539792351;
        bh=+rbJ+luRwgAW5c4pWXn4Lub5PJ2QtNDJG1NU02TjffI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=hPGYvSF6jTQS3W30DtPFQ+S56WTn65PGyFgmG2VlWpiWAOGikg0ijJD3mnJ38yO4M
         e1c4zA5faTMY2GYL63XCfYcHoDBNAgWVv5DnAjcbcRFCc0BDW5vIcEIdSWimoaQrSu
         OG4ayaiwYC9CKg0WK3+nt+uxlXagvpn/XY4xRCfc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB42114436952826801D15BA3E80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-4-git-send-email-aisheng.dong@nxp.com>
 <153972518358.5275.8551722631185725008@swboyd.mtv.corp.google.com>
 <AM0PR04MB42111D180BE6D7557F71D15380FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <153978942538.5275.15892434593141965554@swboyd.mtv.corp.google.com>
 <AM0PR04MB42114436952826801D15BA3E80FF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153979235107.5275.17099119584473464472@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Date:   Wed, 17 Oct 2018 09:05:51 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-10-17 08:45:05)
> > -----Original Message-----
> > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > Sent: Wednesday, October 17, 2018 11:17 PM
> > Quoting A.s. Dong (2018-10-17 01:56:35)
> > > > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > > > Sent: Wednesday, October 17, 2018 5:26 AM Quoting A.s. Dong
> > > > (2018-10-14 01:07:49)
> > >
> > > How about do something like below?
> > > struct req_get_clock_rate {
> > >         u16 resource;
> > >         u8 clk;
> > > } __packed;
> > >
> > > struct resp_get_clock_rate {
> > >         u32 rate;
> > > } __packed;
> > =

> > This doesn't need __packed because it's a single u32.
> > =

> =

> It's a safe writing, but yes, can be removed.
> =

> > >
> > > struct imx_sc_msg_get_clock_rate {
> > >         struct imx_sc_rpc_msg hdr;
> > >         union {
> > >                 struct req_get_clock_rate req;
> > >                 struct resp_get_clock_rate resp;
> > >         } data;
> > > } __packed;
> > >
> > =

> > Yes something like this would be best. And now I wonder if
> > imx_scu_call_rpc() is doing endianness swapping? Or does it copy data i=
nto
> > these response structures? I'm saying that the u32/16/8 may need to be
> > __le32/16/8 and then have the proper accessors.
> > =

> =

> No endianness swapping. It's fixed little endian.
> SCU protocol isn't aware of these structures. The structures are defined
> according to SCU protocol definition to make sure each field position and=
 size
> are correct. Then SCU IPC driver just send and receive them sequentially.
> Client driver uses the structures to retrieve the responding filed values.
> =

> We do this like drivers/firmware/ti_sci.h
> Do you think we still need specify __le32/16/8 for this case?

Probably, because the CPU in linux could be big endian or little endian.
It doesn't hurt to do it right to begin with and then you get the
support for free if it's ever used later on.

> =

> > >
> > > > > +       hdr->size =3D 3;
> > > > > +
> > > > > +       msg.rate =3D rate;
> > > > > +       msg.resource =3D div->rsrc_id;
> > > > > +       msg.clk =3D div->clk_type;
> > > > > +
> > > > > +       ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
> > > > > +       if (ret)
> > > > > +               pr_err("%s: failed to set clock rate %ld : ret %d=
\n",
> > > > > +                       clk_hw_get_name(hw), rate, ret);
> > > > > +
> > > > > +       return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct clk_ops clk_divider_scu_ops =3D {
> > > > > +       .recalc_rate =3D clk_divider_scu_recalc_rate,
> > > > > +       .round_rate =3D clk_divider_scu_round_rate,
> > > > > +       .set_rate =3D clk_divider_scu_set_rate, };
> > > > > +
> > > > > +struct clk_hw *imx_clk_register_divider_scu(const char *name,
> > > > > +                                           const char
> > > > *parent_name,
> > > > > +                                           u32 rsrc_id,
> > > > > +                                           u8 clk_type) {
> > > > > +       struct clk_divider_scu *div;
> > > > > +       struct clk_init_data init;
> > > > > +       struct clk_hw *hw;
> > > > > +       int ret;
> > > > > +
> > > > > +       div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> > > > > +       if (!div)
> > > > > +               return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +       div->rsrc_id =3D rsrc_id;
> > > > > +       div->clk_type =3D clk_type;
> > > > > +
> > > > > +       init.name =3D name;
> > > > > +       init.ops =3D &clk_divider_scu_ops;
> > > > > +       init.flags =3D CLK_GET_RATE_NOCACHE;
> > > >
> > > > Why nocache? Please have a good reason and add a comment indicating
> > why.
> > > >
> > >
> > > Because on MX8, the clocks are tightly couple with power domain that
> > > once the power domain is off, the clock status will be lost.
> > > Making it NOCACHE helps user to retrieve the real clock status from HW
> > > Instead of using the possible invalid cached rate.
> > >
> > > Is that reasonable enough to specify it?
> > =

> > Yes, you can add a comment like that. Or the clk rate can be restored w=
hen the
> > power domain is enabled again?
> =

> No restore when power domain is enabled again. That needs driver to do sp=
ecial
> handling. =

> =

> Can we add the comment in commit message as there're still many other pla=
ces
> using this?
> =


Sure. Please also add the comment into the code so we don't have to dig
it out of commit text.

