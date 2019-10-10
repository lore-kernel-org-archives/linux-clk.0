Return-Path: <SRS0=IP4j=YD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF811C10F14
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 14:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A988B206B6
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 14:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJJOQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:16:12 -0400
Received: from mail.thorsis.com ([92.198.35.195]:38911 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfJJOQM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Oct 2019 10:16:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id CFA284130;
        Thu, 10 Oct 2019 16:16:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Yu8zR-bVeZvw; Thu, 10 Oct 2019 16:16:40 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id A141D4725; Thu, 10 Oct 2019 16:16:40 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, u.kleine-koenig@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
Date:   Thu, 10 Oct 2019 16:16:00 +0200
Message-ID: <2819678.zAmqMVPImI@ada>
In-Reply-To: <20190916201316.ED7EB20665@mail.kernel.org>
References: <20190823100315.2148-1-ada@thorsis.com> <20190911174948.sblu4qn44sfh3cyy@pengutronix.de> <20190916201316.ED7EB20665@mail.kernel.org>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,

I took some minutes to look at this again, because I was the one who had 
difficulties understanding the documentation here in the first place.

Note: this patch/discussion is not about changing the dt-binding, but about 
improving the documentation on the properties 'assigned-clocks', 'assigned-
clock-parents', and 'assigned-clock-rates'. See below:

Am Montag, 16. September 2019, 13:13:16 CEST schrieb Stephen Boyd:
> (Sorry my MUA fails at utf8 encoding emails)
> 
> > On Wed, Sep 11, 2019 at 09:06:47AM -0700, Stephen Boyd wrote:
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > > b/Documentation/devicetree/bindings/clock/clock-bindings.txt index
> > > > b646bbcf7f92..1d4942380918 100644
> > > > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > > @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not
> > > > followed by any non-zero entry.> > > 
> > > >          compatible = "fsl,imx-uart";
> > > >          reg = <0xa000 0x1000>;
> > > >          ...
> > > > 
> > > > -        clocks = <&osc 0>, <&pll 1>;
> > > > -        clock-names = "baud", "register";
> > > > +        clocks = ...
> > > > +        clock-names = ...
> > > 
> > > I don't see the need for this change.
> > 
> > <&pll 1> is mentioned below. But it is not this instance that is
> > relevant. So I suggested to get rid of it to not be a source of
> > confusion. (But I guess you understood that.)
> 
> Yes.

This was indeed one source of confusion for me. This obfuscation of Uwe would 
have helped me, because it hides distracting information, which is irrelevant 
for explaining assigned clock parents and might lead to false conclusions on 
how those things work.

> > > >          assigned-clocks = <&clkcon 0>, <&pll 2>;
> > > > 
> > > > -        assigned-clock-parents = <&pll 2>;
> > > > +        assigned-clock-parents = <&pll 1>;
> > > > 
> > > >          assigned-clock-rates = <0>, <460800>;
> > > >      
> > > >      };
> > > > 
> > > > -In this example the <&pll 2> clock is set as parent of clock <&clkcon
> > > > 0> and -the <&pll 2> clock is assigned a frequency value of 460800
> > > > Hz.
> > > > +In this example the <&pll 1> clock is set as parent of clock <&clkcon
> > > > 0> and +the <&pll 2> clock is assigned a frequency value of 460800
> > > > Hz.  A parent +setting for <&pll 2> is omitted (end of list) and rate
> > > > setting for <&clkcon 0> +is skipped because set to <0>.
> > > 
> > > Maybe you can comment that the "clocks" and "clock-names" properties
> > > don't matter for assigned clk rates and parents.
> > 
> > Sure, a long text can explain this, but a maximal simple example is
> > very beneficial, too.
> 
> The paragraph at the start of "Assigned clock parents and rates" already
> explains how these properties work. This patch isn't going to help if
> the reader hasn't read that paragraph, so reordering things isn't
> providing more clarity. 

Reordering might not help. What helps on understanding things is describing 
the same topic in a different way again. This is somewhat redundant, but 
someone who does not fully understand explanation A might understand 
explanation B better.

> If anything, I would clarify the description of
> the example by indicating what parts of the example we're talking about
> when explaining, i.e.
> 
> 	In this example the <&pll 2> clock is set as parent of the
> 	<&clkcon 0> clock because the first clock specifier in the
> 	assigned-clocks property is <&clkcon 0> and that matches the
> 	first clock specifier in the assigned-clock-parents property.
> 	Similarly the <&pll 2> clock is assigned a frequency value of
> 	460800 Hz because the second frequency in the
> 	assigned-clock-rates property is 460800 Hz and that matches the
> 	second clock specifier in the assigned-clocks property <&pll 2>.

I could go with that and send a v3 with the obfuscation from above (I'd like 
to keep that) and this paragraph of yours?

Greets
Alex

