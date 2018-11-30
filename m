Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4255C04EB9
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 00:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70F4020989
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 00:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BW2drP41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F4020989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbeK3LpX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 06:45:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:49570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbeK3LpX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 06:45:23 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45C332080A;
        Fri, 30 Nov 2018 00:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543538279;
        bh=568ELVJZXgRRJoWRdh5pi0oDx8fs1gM/Uq9xmsa/89M=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=BW2drP41UNtagKJTC7SWjnMfueEj7UTLUJ8hQL7G7AqTwfQkHqsVaKzPNr592zfqu
         lAtAyzzGEfy4CEQTRLGLfXvP1XI5hftwxWBA7z+HTbSiI7laN+7sRpDbnEIYH7NcAm
         V/0ZckqeWOBN4dEnPzd0H4ATenZVU9Epfm9xsW4E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181123094444.27956-3-miquel.raynal@bootlin.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-3-miquel.raynal@bootlin.com>
Message-ID: <154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
Date:   Thu, 29 Nov 2018 16:37:58 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2018-11-23 01:44:41)
> Armada 3700 PCIe IP relies on the PCIe clock managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().
> =

> Device link support in the clock framework enforce that the clock
> driver's resume() callback will be called before the PCIe
> driver's. But, any resume_noirq() callback will be called before all
> the registered resume() callbacks.

I thought any device driver that provides something to another device
driver will implicitly be probed before the driver that consumes said
resources. And we actually reorder the dpm list on probe defer so that
the order of devices is correct. Is it more that we want to parallelize
suspend/resume of the PCIe chip so we need to have device links so that
we know the dependency of the PCIe driver on the clock driver?

> =

> The solution to support PCIe resume operation is to change the
> "priority" of this clock driver PM callbacks to "_noirq()".

This seems sad that the PM core can't "priority boost" any
suspend/resume callbacks of a device that doesn't have noirq callbacks
when a device that depends on it from the device link perspective does
have noirq callbacks. And why does the PCIe device need to use noirq
callbacks in general?

I'm just saying this seems like a more fundamental problem with ordering
of provider and consumer suspend/resume functions that isn't being
solved in this patch. In fact, it's quite the opposite, this is working
around the problem.

