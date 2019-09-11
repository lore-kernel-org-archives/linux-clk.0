Return-Path: <SRS0=WWrt=XG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9DCECDE20
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 17:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62E3720CC7
	for <linux-clk@archiver.kernel.org>; Wed, 11 Sep 2019 17:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfIKRty (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Sep 2019 13:49:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38267 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbfIKRty (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Sep 2019 13:49:54 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1i86kW-00040p-SB; Wed, 11 Sep 2019 19:49:48 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1i86kW-0007YN-Hk; Wed, 11 Sep 2019 19:49:48 +0200
Date:   Wed, 11 Sep 2019 19:49:48 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
Message-ID: <20190911174948.sblu4qn44sfh3cyy@pengutronix.de>
References: <20190823100315.2148-1-ada@thorsis.com>
 <20190911160648.6F88D2075C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190911160648.6F88D2075C@mail.kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Wed, Sep 11, 2019 at 09:06:47AM -0700, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > index b646bbcf7f92..1d4942380918 100644
> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed by any non-zero entry.
> >          compatible = "fsl,imx-uart";
> >          reg = <0xa000 0x1000>;
> >          ...
> > -        clocks = <&osc 0>, <&pll 1>;
> > -        clock-names = "baud", "register";
> > +        clocks = ...
> > +        clock-names = ...
> 
> I don't see the need for this change.

<&pll 1> is mentioned below. But it is not this instance that is
relevant. So I suggested to get rid of it to not be a source of
confusion. (But I guess you understood that.)

> >          assigned-clocks = <&clkcon 0>, <&pll 2>;
> > -        assigned-clock-parents = <&pll 2>;
> > +        assigned-clock-parents = <&pll 1>;
> >          assigned-clock-rates = <0>, <460800>;
> >      };
> >  
> > -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
> > -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> > +In this example the <&pll 1> clock is set as parent of clock <&clkcon 0> and
> > +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
> > +setting for <&pll 2> is omitted (end of list) and rate setting for <&clkcon 0>
> > +is skipped because set to <0>.
> 
> Maybe you can comment that the "clocks" and "clock-names" properties
> don't matter for assigned clk rates and parents.

Sure, a long text can explain this, but a maximal simple example is
very beneficial, too.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
