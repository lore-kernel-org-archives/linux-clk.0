Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C309C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 16:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C68A218A4
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548866760;
	bh=Qhz+Cmj3XDWVYkJBbEvc6p6QJjAfUK9C+dxUODNU86A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=riDqbTyWq+6/1knEeGUDV+y+kzn6nKcW22v1jYYzafY6bZcs8KaShGbVFKuSoYylB
	 ElGKbzYdNUDkUHv6BwIUB9swxjLjU3IN35oKBnt6SeifnKtWedG2vm+xgiztfa0KAc
	 uRRCzioMWDnfKjEhZH88liv8c7HjsMjqU57oILCE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbfA3Qp7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 11:45:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:41052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728479AbfA3Qp7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 30 Jan 2019 11:45:59 -0500
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B83A218AC;
        Wed, 30 Jan 2019 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548866758;
        bh=Qhz+Cmj3XDWVYkJBbEvc6p6QJjAfUK9C+dxUODNU86A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T23VvXbAKybvHdF5MkEVDXLqqZ/s1s86/RB8XHMAK39bV0uJ/9ASVZyOI3cpvoaVt
         qRtYtmLzqDn2RBYmiqmEP+8Xgs7f07NUwnhSQcsdQslGVCG4i/TcnM50AEmkaoR3kq
         K6xr1A7HFIt3G6R0yibpSCO1ynnF4gk6L1eSm82c=
Received: by mail-qk1-f182.google.com with SMTP id d15so142926qkj.0;
        Wed, 30 Jan 2019 08:45:57 -0800 (PST)
X-Gm-Message-State: AJcUukfERrM2uS0U1cHy9lmuu+j4mVf3lmDmrZY5HP2mxULeuiIXOJJQ
        8XV0w1kC2PTMJ5DyBRUwfj6ra656tUDJypL+dA==
X-Google-Smtp-Source: ALg8bN5aQKy+V94ZoHB/unZJZGaCCM7zhepzAF91LXVuuxQiPNrkPzFgIKzb1OsbsqyFf/SSIQOvnL0SQ1VG4XcaTcM=
X-Received: by 2002:a37:5686:: with SMTP id k128mr26623744qkb.29.1548866757172;
 Wed, 30 Jan 2019 08:45:57 -0800 (PST)
MIME-Version: 1.0
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com> <20190122001011.GA15952@bogus>
 <AM0PR04MB4211003C959DCC89B169D39B80980@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211003C959DCC89B169D39B80980@AM0PR04MB4211.eurprd04.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Jan 2019 10:45:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKwJEJmb2iAom1nckj6-eFrpfMXoGC4id5rqWiQZZn2yw@mail.gmail.com>
Message-ID: <CAL_JsqKwJEJmb2iAom1nckj6-eFrpfMXoGC4id5rqWiQZZn2yw@mail.gmail.com>
Subject: Re: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 22, 2019 at 6:59 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Tuesday, January 22, 2019 8:10 AM
> >
> > On Fri, Jan 11, 2019 at 11:56:09AM +0000, Aisheng Dong wrote:
> > > Add a53 and a72 clock id, as there's still no users, we update
> > > IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock id to
> > > be continued with a35 clk.
> > >
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/dt-bindings/clock/imx8-clock.h
> > > b/include/dt-bindings/clock/imx8-clock.h
> > > index 4236818..2f1aa2f 100644
> > > --- a/include/dt-bindings/clock/imx8-clock.h
> > > +++ b/include/dt-bindings/clock/imx8-clock.h
> > > @@ -13,10 +13,12 @@
> > >
> > >  /* CPU */
> > >  #define IMX_A35_CLK                                        1
> > > +#define IMX_A53_CLK                                        2
> > > +#define IMX_A72_CLK                                        3
> >
> > All 3 cores in one chip? If not maybe these should be split or define them as
> > cpu cluster x clocks.
> >
>
> Not in one chip.
> Here are common clock IDs used for both MX8QXP and MX8QM.
> You mean change to something like below?
>
> #define IMX_CPU_CLUSTER_A53_CLK                 2
> #define IMX_CPU_CLUSTER_A72_CLK                 3

What happened to A35? What I'm saying is if the same clock controller
registers are used across chips even if the cores are different, use
the same clock ID. Ideally, clock IDs have some relationship to the
h/w such as their control register address and offset.

To put it another way, don't create a common number space of clock IDs
across SoCs unless they are strictly subsets and supersets of each
other.

Rob
