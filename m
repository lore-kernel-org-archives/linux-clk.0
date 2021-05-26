Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449F5C2B9F7
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 07:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C15861408
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 07:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233066AbhEZHTt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 03:19:49 -0400
Received: from muru.com ([72.249.23.125]:60568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233030AbhEZHTq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 26 May 2021 03:19:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 581CE80AE;
        Wed, 26 May 2021 07:18:19 +0000 (UTC)
Date:   Wed, 26 May 2021 10:18:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0/3] Apple M1 clock gate driver
Message-ID: <YK32Mmiq9QXGkELF@atomide.com>
References: <20210524182745.22923-1-sven@svenpeter.dev>
 <CAL_JsqKqpSQbdj_Crc-LSc12700kyFFkMTU29BDY2bwGNLXn9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKqpSQbdj_Crc-LSc12700kyFFkMTU29BDY2bwGNLXn9A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

* Rob Herring <robh+dt@kernel.org> [210525 18:09]:
> I would do a single node per mmio region with the register offset (or
> offset / 4) being the clock id. This can still support new SoCs easily
> if you have a fallback compatible. If you want/need to get all the
> clocks, just walk the DT 'clocks' properties and extract all the IDs.

I mostly agree.. Except I'd also leave out the artificial clock ID and
just use real register offsets from the clock controller base instead.

So a single clock controller node for each MMIO range, then set
#clock=cells = <1>. Then the binding follows what we have for the
interrupts-extended binding for example.

If the clock controller optionally needs some data in the dts,
that can be added to the clock controller node. Or it can be driver
internal built-in data. If the data for dts can be described in a
generic way, even better :)

This would make the consumer interface look like below with a
clock controller node and register offset from it:

clocks = <&clock_controller1 0x1234>;

Regards,

Tony



