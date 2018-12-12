Return-Path: <SRS0=3egD=OV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94BBC65BAF
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 21:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D4D320849
	for <linux-clk@archiver.kernel.org>; Wed, 12 Dec 2018 21:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvPy9KHK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4D320849
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbeLLV7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 16:59:41 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42277 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbeLLV7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Dec 2018 16:59:40 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so19206767wrx.9
        for <linux-clk@vger.kernel.org>; Wed, 12 Dec 2018 13:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Y2wQK+OiyhTg89ThGz4+nH7i2ew6kNzQGHUY14386o=;
        b=HvPy9KHK24BAfkoIoDWj4LhX56hM+/YtWOPOjb71ajIOwYovFjBSNsqZ7Xy2E3JO6H
         VD4u9NeiLI6jeSNRAmFnY5lMGGZ2XOPF7FOHr2oNCU5IiMpH2EIPvmYcMvkLKqI999YO
         8TqQbY576hmV4DbdiXcIlN4QUvzeJGZfDawhuhKGlv3qntcZmuO6efVDwp01E/ITp6KF
         SDBqkE0+wjJgMdRzO4XM4En8V6HdcwKydIprGYydhyVfp01qISzDmAKX3LgMBtD4Llho
         YE3/3X3XEdSad9T/gd/trVn40Cti9Tnem15T9Jt3YHkgFJkWqayZraAnJuVWFFSO8Kzc
         FBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Y2wQK+OiyhTg89ThGz4+nH7i2ew6kNzQGHUY14386o=;
        b=KUMsIY0wAajdEvDHL3qjuX58SrcR5U0xUe1WYOjp6mxVA8QzP+KAtHbegKKcRFctn2
         +XI+I2Ehr5Tcqpmks/5cpfpdeGt8ReqHIS94XAFTbBtNqpctuo1++uuftPzf2ce4ZAVB
         BM0oC5l9bccUnBFI43RZepboClvmHbEP1EOxpwKt/BtUNcvqSS+naWNImSMEJzcGOK61
         leRTX09FCMN+ogNowLg0Ur//2kuKmSugbV3HFKJ/N3zHYxErnqRFYq6CgDoIOiTyI7q5
         2a2U4UpcJQoauZSGyZ9LD/5msfkupG7SM0SXxMTmC0cirfUcA3paZkT2zIfVfzWVWwqT
         GylA==
X-Gm-Message-State: AA+aEWZjyk7UCiSmPX31JbEvXgvQy6o/5OxPLDW1aWpytPyugTor9kYY
        JO4uXtRD9628Opw4hxHKhw/LyNU/aEYv6LUaPdpo
X-Google-Smtp-Source: AFSGD/XM/1PqtlyXyD9JuoY2IeTwVtdBNR285jHg/Pp2v6Ip6jVi/FlMVRiKidXW3HE6k7y5y9PY4StVK3CLnfvIOCw=
X-Received: by 2002:adf:b608:: with SMTP id f8mr8530743wre.120.1544651978946;
 Wed, 12 Dec 2018 13:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-3-miquel.raynal@bootlin.com> <154353827849.88331.12767996548874447262@swboyd.mtv.corp.google.com>
 <20181130115821.255394d4@xps13>
In-Reply-To: <20181130115821.255394d4@xps13>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Wed, 12 Dec 2018 15:59:27 -0600
Message-ID: <CAErSpo47e7m13KY=LxFwcMZx=K9Viin3=i53Qam79Cax8FY8BA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
To:     miquel.raynal@bootlin.com
Cc:     sboyd@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        mturquette@baylibre.com, Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com,
        gregory.clement@bootlin.com, maxime.chevallier@bootlin.com,
        Nadav Haklai <nadavh@marvell.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[+cc Rafael, linux-pm, since they know a lot more about PCI PM than I
do.  Sorry I didn't notice they weren't cc'd earlier]

On Fri, Nov 30, 2018 at 4:58 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Stephen Boyd <sboyd@kernel.org> wrote on Thu, 29 Nov 2018 16:37:58
> -0800:
> > Quoting Miquel Raynal (2018-11-23 01:44:41)
> > > Armada 3700 PCIe IP relies on the PCIe clock managed by this
> > > driver. For reasons related to the PCI core's organization when
> > > suspending/resuming, PCI host controller drivers must reconfigure
> > > their register at suspend_noirq()/resume_noirq() which happens after
> > > suspend()/suspend_late() and before resume_early()/resume().
> > >
> > > Device link support in the clock framework enforce that the clock
> > > driver's resume() callback will be called before the PCIe
> > > driver's. But, any resume_noirq() callback will be called before all
> > > the registered resume() callbacks.
> >
> > I thought any device driver that provides something to another device
> > driver will implicitly be probed before the driver that consumes said
> > resources. And we actually reorder the dpm list on probe defer so that
> > the order of devices is correct. Is it more that we want to parallelize
> > suspend/resume of the PCIe chip so we need to have device links so that
> > we know the dependency of the PCIe driver on the clock driver?
>
> I had the same idea of device links before testing. I hope I did
> not make any mistake leading me to wrong observations, but indeed
> this is what I think is happening:
> * PM core call all suspend() callbacks
> * then all suspend_late()
> * then all suspend_noirq()
> For me, the PM core does not care if a suspend_noirq() depends on the
> suspend() of another driver.
>
> I hope I did not miss anything.
>
> > > The solution to support PCIe resume operation is to change the
> > > "priority" of this clock driver PM callbacks to "_noirq()".
> >
> > This seems sad that the PM core can't "priority boost" any
> > suspend/resume callbacks of a device that doesn't have noirq callbacks
> > when a device that depends on it from the device link perspective does
> > have noirq callbacks.
>
> I do agree on this but I'm not sure it would work. I suppose the
> "noirq" state is a global state and thus code in regular suspend()
> callbacks could probably fail to run in a "noirq" context?
>
> > And why does the PCIe device need to use noirq callbacks in general?
>
> I would like Bjorn to confirm this, but there is this commit that could
> explain the situation:
>
> commit ab14d45ea58eae67c739e4ba01871cae7b6c4586
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Tue Mar 17 15:55:45 2015 +0100
>
>     PCI: mvebu: Add suspend/resume support
>
>     Add suspend/resume support for the mvebu PCIe host driver.  Without this
>     commit, the system will panic at resume time when PCIe devices are
>     connected.
>
>     Note that we have to use the ->suspend_noirq() and ->resume_noirq() hooks,
>     because at resume time, the PCI fixups are done at ->resume_noirq() time,
>     so the PCIe controller has to be ready at this point.
>
>     Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>     Acked-by: Jason Cooper <jason@lakedaemon.net>
>
> > I'm just saying this seems like a more fundamental problem with ordering
> > of provider and consumer suspend/resume functions that isn't being
> > solved in this patch. In fact, it's quite the opposite, this is working
> > around the problem.
>
> I do agree with your point, but I would not be confident tweaking the PM
> core's scheduling "alone" :)
