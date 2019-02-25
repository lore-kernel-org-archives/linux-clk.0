Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56659C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 15:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 251F9213A2
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 15:05:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfBYPFk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 10:05:40 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37529 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfBYPFk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Feb 2019 10:05:40 -0500
X-Originating-IP: 90.88.23.190
Received: from xps13 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B84A720009;
        Mon, 25 Feb 2019 15:05:36 +0000 (UTC)
Date:   Mon, 25 Feb 2019 16:05:35 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>
Subject: Re: [PATCH 0/4] Prepare Armada 3700 PCIe suspend to RAM support
Message-ID: <20190225160535.3395c680@xps13>
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 23 Nov 2018
10:44:39 +0100:

> Hello,
> 
> As part of an effort to bring suspend to RAM support to the Armada
> 3700 SoC (main target: ESPRESSObin board), there are small things to
> do in the Armada 3700 peripherals clock driver:
> 
> * On this SoC, the PCIe controller gets fed by a gated clock in the
>   south bridge. This clock is missing in the current driver, patch 1
>   adds it.
> 
> * Because of a constraint in the PCI core, the resume function of a
>   PCIe controller driver must be run at an early stage
>   (->suspend/resume_noirq()), before the core tries to ->read/write()
>   in the PCIe registers to do more configuration. Hence, the PCIe
>   clock must be resumed before. This is enforced thanks to two
>   changes:
>   1/ Add device links to the clock framework. This enforce order in
>      the PM core: the clocks are resumed before the consumers. Series
>      has been posted, see [1].
>   2/ Even with the above feature, the clock's resume() callback is
>      called after the PCI controller's resume_noirq() callback. The
>      only way to fix this is to change the "priority" of the clock
>      suspend/resume callbacks. This is done in patch 2.
> 
> * The bindings are updated with the PCI clock in patch 4 while patch 3
>   is just a typo correction in the same file.
> 
> If there is anything unclear please feel free to ask.
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/614527.html

This series does not depend on the clock device links work so I
wonder if you are still considering it?


Thanks,
Miquèl
