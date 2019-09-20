Return-Path: <SRS0=v4u2=XP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBCCC49ED7
	for <linux-clk@archiver.kernel.org>; Fri, 20 Sep 2019 08:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C30021D6C
	for <linux-clk@archiver.kernel.org>; Fri, 20 Sep 2019 08:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390978AbfITIBU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Sep 2019 04:01:20 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55657 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390941AbfITIBU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Sep 2019 04:01:20 -0400
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7036AE0008;
        Fri, 20 Sep 2019 08:01:17 +0000 (UTC)
Date:   Fri, 20 Sep 2019 10:01:16 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>
Subject: Re: [PATCH 0/8] AP807 clocks support
Message-ID: <20190920100116.08bb38ac@xps13>
In-Reply-To: <20190918050720.B390B214AF@mail.kernel.org>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
        <20190918050720.B390B214AF@mail.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Stephen Boyd <sboyd@kernel.org> wrote on Tue, 17 Sep 2019 22:07:19
-0700:

> Quoting Miquel Raynal (2019-08-05 03:03:02)
> > Hello,
> > 
> > This is the first batch of changes (out of three) to support the brand
> > new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
> > 
> > This clock series applies on top of Gregory's "AP806 CPU clocks" [1].
> > 
> > [1] https://patchwork.kernel.org/cover/11038577/  
> 
> Ugh I found this series stashed away and never merged to clk-next.
> 

No problem, thanks for merging it!


Cheers,
Miquèl
