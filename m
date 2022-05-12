Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4DCC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 17:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356927AbiELRMM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 13:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356908AbiELRMJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 13:12:09 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AFFF689B
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 10:12:00 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id m12so5530155plb.4
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZR7HUMI8Yd1xwk7BD+o92Bt4lqO1DXfyuDoVWDh5tgY=;
        b=wcJz61uNHHkhwJPa75ZWU9CyanOq6y9sDmyhbNJbeepZmcSXGtQ0HBXm3cdjwJ5+wU
         k1IL03y0zal44soErhaLiTSGWh+ennuCz5wa+vj2k+J0Q0Pvq03feKdUIQ2zS5SCBkLz
         EBQ1tuy9UJxjEr7cBYL8caFvA17jwyoQly6p2tdMkVHIhd6OPrV2DBdUcDDfKrimJuW/
         kvF5R1euuKgxpi4fJUSaqoQCdh4REvs27/XIWNlJ0FqkoJ8c7389xt5Ksi1okjGYvZbb
         Z8jnzU42GKyaeBE01bAgxKulial29NvRI2Kmc0/RL51zY/rD+oBBO6M9aeUM6Bhvz7xT
         VD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZR7HUMI8Yd1xwk7BD+o92Bt4lqO1DXfyuDoVWDh5tgY=;
        b=0J6Ie+jIV2KHvAJLaclwTlp7E4gIKYUCttcTiwzqImrrkYMz3u7sbr4UxNXGgAcfVb
         wM9jZVyhXmdD4tZZYerC0Q4XGQFmmlgHCpefHFnQt0yN46lX/LMU/lg+rnA+Chp45joe
         +k6d/7GeaSk2excV7mDFo3ng1yk9cSskDQ3dvRVxePwiW4B2Ii8J4UxqFBwu94Tzr/mm
         1p5ca3awWM7jEBHFBvg9C4T2qKbBh3mDY7SfqvOPmi8KPVw2imWtOgwqyPimyrrAAUHE
         mWrFX5mdwscbliNxyGe3ns6iiT3ntQ89UyRzyCCekfVsQsRB9ECoF+trqJ73SBFRnzAS
         cGIg==
X-Gm-Message-State: AOAM532hKRB7FLw4XNR2eCJhjiV4gWTuMPGvm9dbbp6N6CXU+gvXKC3a
        1F6vQ5zhCR7TKEXpt0MAjDGt
X-Google-Smtp-Source: ABdhPJz3rh/7E0RO/eeNNLHEWG+NTBDlLjo8AT2aePopZIvf/cnez6Q0MHrnczudOsJLDnnohyO67Q==
X-Received: by 2002:a17:90b:1689:b0:1d8:28f9:3ba9 with SMTP id kv9-20020a17090b168900b001d828f93ba9mr11795087pjb.56.1652375520325;
        Thu, 12 May 2022 10:12:00 -0700 (PDT)
Received: from thinkpad ([117.202.184.202])
        by smtp.gmail.com with ESMTPSA id f18-20020a170902ce9200b0015e8ddeac5dsm125155plg.252.2022.05.12.10.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 10:11:59 -0700 (PDT)
Date:   Thu, 12 May 2022 22:41:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: Baikal-T1 DDR/PCIe resets and some xGMAC
 fixes
Message-ID: <20220512171150.GA164627@thinkpad>
References: <20220503205722.24755-1-Sergey.Semin@baikalelectronics.ru>
 <20220512001156.x6kqyhi3vjjpqch6@mobilestation>
 <20220512152705.GA2506@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512152705.GA2506@lpieralisi>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 12, 2022 at 04:27:05PM +0100, Lorenzo Pieralisi wrote:
> On Thu, May 12, 2022 at 03:11:56AM +0300, Serge Semin wrote:
> > On Tue, May 03, 2022 at 11:57:18PM +0300, Serge Semin wrote:
> > > This patchset is an initial one in the series created in the framework
> > > of my Baikal-T1 PCIe/eDMA-related work:
> > > 
> > > [1: In-progress v3] clk: Baikal-T1 DDR/PCIe resets and some xGMAC fixes
> > > Link: https://lore.kernel.org/linux-pci/20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru/
> > > [2: In-progress v1] PCI: dwc: Various fixes and cleanups
> > > Link: https://lore.kernel.org/linux-pci/20220324012524.16784-1-Sergey.Semin@baikalelectronics.ru/
> > > [3: In-progress v1] PCI: dwc: Add dma-ranges/YAML-schema/Baikal-T1 support
> > > Link: https://lore.kernel.org/linux-pci/20220324013734.18234-1-Sergey.Semin@baikalelectronics.ru/
> > > [4: In-progress v1] dmaengine: dw-edma: Add RP/EP local DMA controllers support
> > > Link: https://lore.kernel.org/linux-pci/20220324014836.19149-1-Sergey.Semin@baikalelectronics.ru/
> > > 
> > > Since some of the patches in the later patchsets depend on the
> > > modifications introduced here, @Lorenzo could you please merge this series
> > > through your PCIe subsystem repo? After getting all the required ack'es of
> > > course.
> > > 
> > > Short summary regarding this patchset. A few more modifications are
> > > introduced here to finally finish the Baikal-T1 CCU unit support up and
> > > prepare the code before adding the Baikal-T1 PCIe/xGMAC support. First of
> > > all it turned out I specified wrong DW xGMAC PTP reference clock divider
> > > in my initial patches. It must be 8, not 10. Secondly I was wrong to add a
> > > joint xGMAC Ref and PTP clock instead of having them separately defined.
> > > The SoC manual describes these clocks as separate fixed clock wrappers.
> > > Finally in order to close the SoC clock/reset support up we need to add
> > > the DDR and PCIe interfaces reset controls support. It's done in two
> > > steps. First I've moved the reset-controls-related code into a dedicated
> > > module. Then the DDR/PCIe reset-control functionality is added.
> > > 
> > > Link: https://lore.kernel.org/linux-pci/20220324010905.15589-1-Sergey.Semin@baikalelectronics.ru/
> > > Changelog v2:
> > > - Resubmit the series with adding @Philipp to the list of the recipients.
> > > 
> > > Link: https://lore.kernel.org/linux-pci/20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru/
> > > Changelog v3:
> > > - Rebased from v5.17 onto v5.18-rc3.
> > > - No comments. Just resend the series.
> > 
> > No comments for more than a week. There were no comments in v1 and v2
> > either. Please at least ack or merge in the series. It would be very
> > appreciated to merge it in through one repo with the rest of the
> > patchsets before the next merge window. @Bjorn, @Lorenzo, @Michael?
> 
> Hi Sergey,
> 
> these changes affect the clock tree and have to be reviewed and merged
> by the respective maintainers if they think the changes can be accepted.
> 
> I don't see any reason why we should, if ACK'ed, take them in the PCI
> tree, this series does not apply changes to the PCI tree at all and you
> don't need it as a base for future to-be-merged PCI patches either.
> 
> So in short, this series has to go through the usual clock tree review
> process.
> 

Yes, Stephen should be the one taking these patches through the clk tree. Also,
there is no need to club both pci and clk patches in a single tree. That's
usually done for patches with build dependencies, but here there are none.

Thanks,
Mani

> Thanks,
> Lorenzo
> 
> > -Sergey
> > 
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: "Krzysztof Wilczyński" <kw@linux.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: linux-clk@vger.kernel.org
> > > Cc: linux-pci@vger.kernel.org
> > > Cc: linux-mips@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > 
> > > Serge Semin (4):
> > >   clk: baikal-t1: Fix invalid xGMAC PTP clock divider
> > >   clk: baikal-t1: Define shared xGMAC ref/ptp clocks parent
> > >   clk: baikal-t1: Move reset-controls code into a dedicated module
> > >   clk: baikal-t1: Add DDR/PCIe directly controlled resets support
> > > 
> > >  drivers/clk/baikal-t1/Kconfig       |  12 +-
> > >  drivers/clk/baikal-t1/Makefile      |   1 +
> > >  drivers/clk/baikal-t1/ccu-div.c     |   1 +
> > >  drivers/clk/baikal-t1/ccu-div.h     |   6 +
> > >  drivers/clk/baikal-t1/ccu-rst.c     | 373 ++++++++++++++++++++++++++++
> > >  drivers/clk/baikal-t1/ccu-rst.h     |  64 +++++
> > >  drivers/clk/baikal-t1/clk-ccu-div.c | 102 ++------
> > >  include/dt-bindings/reset/bt1-ccu.h |   9 +
> > >  8 files changed, 482 insertions(+), 86 deletions(-)
> > >  create mode 100644 drivers/clk/baikal-t1/ccu-rst.c
> > >  create mode 100644 drivers/clk/baikal-t1/ccu-rst.h
> > > 
> > > -- 
> > > 2.35.1
> > > 

-- 
மணிவண்ணன் சதாசிவம்
