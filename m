Return-Path: <SRS0=HA4W=OO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A5EC04EB9
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0ACB8208E7
	for <linux-clk@archiver.kernel.org>; Wed,  5 Dec 2018 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544038980;
	bh=RXXNtRRNwYb/woiVusohMNz6wg6Q9tnaWcMlh8GM6TA=;
	h=To:From:In-Reply-To:Cc:References:Subject:Date:List-ID:From;
	b=rTkHFobANGLZg0477Gfz1jmDPwcQfT76TSQ5nsNMbG2Bufmb26qjP0r/AI05oung6
	 zMv2rvodMB3ZsEVMqS9y72PLT/wwLUaVsy6kiQhXw2VCn7jDklwt1Z+f6mDqRiF45I
	 r5eNU3Iz0iyUQog6sHIdOSGuNTljYoGdq1PPvtdk=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ACB8208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbeLETm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Dec 2018 14:42:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:54214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbeLETm7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Dec 2018 14:42:59 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CB3B20892;
        Wed,  5 Dec 2018 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544038979;
        bh=RXXNtRRNwYb/woiVusohMNz6wg6Q9tnaWcMlh8GM6TA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=BrB5L84k89yZ8gbGeQP9MdMvKt5DoIGNoluCmORG0tA/EHXkIE0EIYNN1TfcbxFNN
         cnW5nL6nTNY0rdmXPWkrvvn3A4HNZJKTXPDWC9yvWU8GCBUY3K69YT5eVPNpBf6sMl
         kByVSoPipwJeeGZWbvJeokK51k+RkwT7NqxQjmvg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng DONG <aisheng.dong@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211FE93C147DB95181E8CBE80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
 <1542809234-539-3-git-send-email-aisheng.dong@nxp.com>
 <154386202048.88331.5253991483966563852@swboyd.mtv.corp.google.com>
 <AM0PR04MB4211FE93C147DB95181E8CBE80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <154403897845.88331.2924678136478578037@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH V8 2/7] clk: imx: add scu clock common part
Date:   Wed, 05 Dec 2018 11:42:58 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng DONG (2018-12-03 17:26:01)
> > > +};
> > > +
> > > +/*
> > > + * struct imx_sc_msg_get_clock_rate - clock get rate protocol
> > > + * @hdr: SCU protocol header
> > > + * @req: get rate request protocol
> > > + * @resp: get rate response protocol
> > > + *
> > > + * This structure describes the SCU protocol of clock rate get  */
> > > +struct imx_sc_msg_get_clock_rate {
> > > +       struct imx_sc_rpc_msg hdr;
> > > +       union {
> > > +               struct req_get_clock_rate req;
> > > +               struct resp_get_clock_rate resp;
> > > +       } data;
> > > +} __packed;
> > =

> > Does this need __packed? struct imx_sc_rpc_msg is naturally aligned so =
I think
> > we don't need this.
> > =

> =

> I think this is more safe way. But struct imx_sc_rpc_msg is unlikely to c=
hange.
> So I guess it's safe to remove it.

If the struct is naturally aligned then I would say remove __packed and
only add the marking if it is really needed. It makes more work now, but
is cleaner to do it this way so we don't have to think about it later
and we may be able to generate slightly better code if the compiler
doesn't have to worry about packed either.

