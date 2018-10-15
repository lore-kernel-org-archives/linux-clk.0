Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549ABC71133
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 17:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C1F6208D9
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 17:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdL+KWKD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1F6208D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbeJPArF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 20:47:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbeJPArF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Oct 2018 20:47:05 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D7A57208AE;
        Mon, 15 Oct 2018 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539622862;
        bh=gLFcpTCnsBgQsDE0lV5l0wLZMN5ByP67oSJFmBcXqbg=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=QdL+KWKDChEfRgoI7HxXyQInTw3HJGomPcFfXRfeBEosu/V9XOrUIXwJ8Lt7HmTe0
         ZkuRFtN9tstPBgzTNvEHE5FgfqctE9KLxT12reSFv2mWNd1WPM/Tw0COt+qFd97s34
         Jpk6EAtqTn1a+6XptBcBL+wE2PFZB0L3Q170yFvc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     "A.s. Dong" <aisheng.dong@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211DE29E5644C8C9A33278780310@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20180731102009.6710-1-l.stach@pengutronix.de>
 <20180731102009.6710-2-l.stach@pengutronix.de>
 <AM0PR04MB4211DE29E5644C8C9A33278780310@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153962286120.5275.13550019093922282541@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: RE: [PATCH 2/3] clk: imx6q: optionally get CCM inputs via standard clock
 handles
Date:   Mon, 15 Oct 2018 10:01:01 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting A.s. Dong (2018-08-21 01:56:09)
> Hi Lucas,
> =

> > -----Original Message-----
> > From: Lucas Stach <l.stach@pengutronix.de>
> > Sent: Tuesday, July 31, 2018 6:20 PM
> =

> [...]
> =

> > When specifying external clock inputs to the CCM the current code requi=
res
> > the clocks to be in a "clocks" child node of the DT root.
> > This is not really conformant with DT best practices.
> > =

> > To avoid the need to deviate from those best practices, allow the clock=
 inputs
> > to be specifies via standard clock handles. This is in line with how dr=
ivers of
> > the later CCM driver revisions on newer i.MX SoCs handle this.
> > =

> > As we can't retroactively change the DT binding, allow this as an optio=
n with a
> > fallback to the old way of how this has been handled.
> > =

> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  .../devicetree/bindings/clock/imx6q-clock.txt |  5 +++++
> >  drivers/clk/imx/clk-imx6q.c                   | 22 ++++++++++++++-----
> >  2 files changed, 22 insertions(+), 5 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> > b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> > index a45ca67a9d5f..ce6aa9920c05 100644
> > --- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> > +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
> > @@ -6,6 +6,11 @@ Required properties:
> >  - interrupts: Should contain CCM interrupt
> >  - #clock-cells: Should be <1>
> > =

> > +Optional properties:
> > +- clocks: list of clock specifiers, must contain an entry for each ent=
ry
> > +          in clock-names
> > +- clock-names: valid names are "osc", "ckil", "ckil", "anaclk1" and "a=
naclk2"
> =

> A minor issue: =

> The third name should be "ckih1".
> =

> Otherwise:
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> =


Is this going to be resent? I don't see anything new and there are
review comments on this patch series so I'm dropping it from the clk
review queue. Please resend.


