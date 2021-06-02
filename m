Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203EDC47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 09:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ADB3613B4
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 09:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhFBJ3y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 05:29:54 -0400
Received: from muru.com ([72.249.23.125]:35376 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229618AbhFBJ3y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jun 2021 05:29:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D0BED8027;
        Wed,  2 Jun 2021 09:28:16 +0000 (UTC)
Date:   Wed, 2 Jun 2021 12:28:06 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 0/3] Apple M1 clock gate driver
Message-ID: <YLdPJk+RBNmw3zJz@atomide.com>
References: <20210524182745.22923-1-sven@svenpeter.dev>
 <CAL_JsqKqpSQbdj_Crc-LSc12700kyFFkMTU29BDY2bwGNLXn9A@mail.gmail.com>
 <6052f2f1-1e3f-474e-a767-e08ca19fbd43@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6052f2f1-1e3f-474e-a767-e08ca19fbd43@www.fastmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Sven Peter <sven@svenpeter.dev> [210530 11:11]:
> The problem with that approach is that to enable e.g. UART_0 we actually need
> to enable its parents as well, e.g. the Apple Device Tree for the M1 has the
> following clock topology:
> 
>     UART0  (0x23b700270), parent: UART_P
>     UART_P (0x23b700220), parent: SIO
>     SIO    (0x23b7001c0), parent: n/a
> 
> The offsets and the parent/child relationship for all of these three clocks
> change between SoCs. If I now use the offset as the clock id I still need
> to specify that if e.g. UART uses <&clk_controller 0x270> I first need
> to enable 0x1c0 and then 0x220 and only then 0x270.

Maybe take a look what I suggested on using assigned-clocks and related
properties in the clock controller node. That might solve the issue in
a generic way for other SoCs too.

Regards,

Tony
