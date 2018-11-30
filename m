Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D7C04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 10:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B195120834
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 10:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B195120834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbeK3WH2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 17:07:28 -0500
Received: from mail.bootlin.com ([62.4.15.54]:49656 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbeK3WH2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 30 Nov 2018 17:07:28 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 7F3D1209AB; Fri, 30 Nov 2018 11:58:32 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-63-158.w90-88.abo.wanadoo.fr [90.88.18.158])
        by mail.bootlin.com (Postfix) with ESMTPSA id 205DD207B0;
        Fri, 30 Nov 2018 11:58:22 +0100 (CET)
Date:   Fri, 30 Nov 2018 11:58:21 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change
 suspend/resume time
Message-ID: <20181130115821.255394d4@xps13>
In-Reply-To: <154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
        <20181123094444.27956-3-miquel.raynal@bootlin.com>
        <154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
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

+ Bjorn to help us on PCI suspend/resume questions.

Stephen Boyd <sboyd@kernel.org> wrote on Thu, 29 Nov 2018 16:37:58
-0800:

> Quoting Miquel Raynal (2018-11-23 01:44:41)
> > Armada 3700 PCIe IP relies on the PCIe clock managed by this
> > driver. For reasons related to the PCI core's organization when
> > suspending/resuming, PCI host controller drivers must reconfigure
> > their register at suspend_noirq()/resume_noirq() which happens after
> > suspend()/suspend_late() and before resume_early()/resume().
> > 
> > Device link support in the clock framework enforce that the clock
> > driver's resume() callback will be called before the PCIe
> > driver's. But, any resume_noirq() callback will be called before all
> > the registered resume() callbacks.  
> 
> I thought any device driver that provides something to another device
> driver will implicitly be probed before the driver that consumes said
> resources. And we actually reorder the dpm list on probe defer so that
> the order of devices is correct. Is it more that we want to parallelize
> suspend/resume of the PCIe chip so we need to have device links so that
> we know the dependency of the PCIe driver on the clock driver?

I had the same idea of device links before testing. I hope I did
not make any mistake leading me to wrong observations, but indeed
this is what I think is happening:
* PM core call all suspend() callbacks
* then all suspend_late()
* then all suspend_noirq()
For me, the PM core does not care if a suspend_noirq() depends on the
suspend() of another driver.

I hope I did not miss anything.

> 
> > 
> > The solution to support PCIe resume operation is to change the
> > "priority" of this clock driver PM callbacks to "_noirq()".  
> 
> This seems sad that the PM core can't "priority boost" any
> suspend/resume callbacks of a device that doesn't have noirq callbacks
> when a device that depends on it from the device link perspective does
> have noirq callbacks.

I do agree on this but I'm not sure it would work. I suppose the
"noirq" state is a global state and thus code in regular suspend()
callbacks could probably fail to run in a "noirq" context?

> And why does the PCIe device need to use noirq callbacks in general?

I would like Bjorn to confirm this, but there is this commit that could
explain the situation:

commit ab14d45ea58eae67c739e4ba01871cae7b6c4586
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Tue Mar 17 15:55:45 2015 +0100

    PCI: mvebu: Add suspend/resume support
    
    Add suspend/resume support for the mvebu PCIe host driver.  Without this
    commit, the system will panic at resume time when PCIe devices are
    connected.
    
    Note that we have to use the ->suspend_noirq() and ->resume_noirq() hooks,
    because at resume time, the PCI fixups are done at ->resume_noirq() time,
    so the PCIe controller has to be ready at this point.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Acked-by: Jason Cooper <jason@lakedaemon.net>

> 
> I'm just saying this seems like a more fundamental problem with ordering
> of provider and consumer suspend/resume functions that isn't being
> solved in this patch. In fact, it's quite the opposite, this is working
> around the problem.
> 

I do agree with your point, but I would not be confident tweaking the PM
core's scheduling "alone" :)


Thanks,
Miquèl
