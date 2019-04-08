Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6708C282CE
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BB5A20883
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="XVyXEcnQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfDHJZu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:25:50 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10099 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfDHJZt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 05:25:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cab13980003>; Mon, 08 Apr 2019 02:25:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 08 Apr 2019 02:25:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 08 Apr 2019 02:25:47 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Apr
 2019 09:25:32 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id A0039428D1; Mon,  8 Apr 2019 12:25:30 +0300 (EEST)
Date:   Mon, 8 Apr 2019 12:25:30 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Joseph Lo <josephl@nvidia.com>, <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/8] memory: tegra: Add Tegra210 EMC clock driver
Message-ID: <20190408092530.GD12975@pdeschrijver-desktop.Nvidia.com>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-4-josephl@nvidia.com>
 <20190403113426.GH5238@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190403113426.GH5238@ulmo>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554715544; bh=FCTpcazHyQsxMeyQgomhCtBsJvF+n5Yjk4SdA1WRhZc=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=XVyXEcnQRtu47eFw+8JxZTIMiYtjOuZWIbMHB53e+rx+oryaPKp5CYHKEhb6wK8Yq
         pWknDyjqx0oYq0QiZKA0aXcSUux8xozTQJluHcnRUv3LE3Xtg9YYcUXnnkrGfj7aNC
         JRI10PhOa2L0rwwrq7lDOatVbMieyTxkHQbfrnIISII/hNl6K2m1uXJIKwMHSqGn3E
         tGGF7ORRXOG1vozJxeE752fnLHWPqTcD7b5R8vZzNxSn4s838VmcX/0dOLFbphwcOt
         qddc6g0LC14dpwGnypp0XikRKa3L2Q1F+ZbAnk0Y2JTY2WuuJsHKth0Eva3PbYcbj9
         QOiZQWhN4vorg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 03, 2019 at 01:34:26PM +0200, Thierry Reding wrote:
> On Mon, Mar 25, 2019 at 03:45:18PM +0800, Joseph Lo wrote:
> > This is the initial patch for Tegra210 EMC clock driver, which doesn't
> > include the support code and detail sequence for clock scaling yet.
> > 
> > The driver is designed to support LPDDR4 SDRAMs. Because of the LPDDR4
> > devices need to do initial time training before it can be used, the
> > firmware will help to do that at early boot stage. The trained table for
> > the rates that we will support in the kernel will be merged to the
> > kernel DTB. So the driver can get the trained table for clock scaling
> > support.
> > 
> > For the higher rate support (above 800MHz), the periodic training is
> > needed for the timing compensation. So basically, two methodologies for
> > clock scaling support, one is following the clock changing sequence to
> > update the EMC table to EMC registers and another is if the rate needs
> > periodic training, then we will start a timer to do that periodically
> > until it leaves the rate that doesn't need that.
> > 
> > Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> > 
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > ---
> >  drivers/memory/tegra/Kconfig             |   10 +
> >  drivers/memory/tegra/Makefile            |    1 +
> >  drivers/memory/tegra/tegra210-dt-parse.c |  340 +++++++
> >  drivers/memory/tegra/tegra210-emc-reg.h  | 1083 ++++++++++++++++++++++
> >  drivers/memory/tegra/tegra210-emc.c      |  886 ++++++++++++++++++
> >  5 files changed, 2320 insertions(+)
> >  create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
> >  create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
> >  create mode 100644 drivers/memory/tegra/tegra210-emc.c
> > 
> > diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> > index 34e0b70f5c5f..614e9b370183 100644
> > --- a/drivers/memory/tegra/Kconfig
> > +++ b/drivers/memory/tegra/Kconfig
> > @@ -25,3 +25,13 @@ config TEGRA124_EMC
> >  	  Tegra124 chips. The EMC controls the external DRAM on the board.
> >  	  This driver is required to change memory timings / clock rate for
> >  	  external memory.
> > +
> > +config TEGRA210_EMC
> > +	bool "NVIDIA Tegra210 External Memory Controller driver"
> > +	default y
> > +	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
> > +	help
> > +	  This driver is for the External Memory Controller (EMC) found on
> > +	  Tegra210 chips. The EMC controls the external DRAM on the board.
> > +	  This driver is required to change memory timings / clock rate for
> > +	  external memory.
> > diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> > index 3971a6b7c487..36a835620bbd 100644
> > --- a/drivers/memory/tegra/Makefile
> > +++ b/drivers/memory/tegra/Makefile
> > @@ -12,4 +12,5 @@ obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
> >  
> >  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
> >  obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
> > +obj-$(CONFIG_TEGRA210_EMC) += tegra210-emc.o tegra210-dt-parse.o
> >  obj-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> > diff --git a/drivers/memory/tegra/tegra210-dt-parse.c b/drivers/memory/tegra/tegra210-dt-parse.c
> > new file mode 100644
> > index 000000000000..6a3a3a28ac64
> > --- /dev/null
> > +++ b/drivers/memory/tegra/tegra210-dt-parse.c
> > @@ -0,0 +1,340 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/err.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <soc/tegra/fuse.h>
> > +
> > +#include "tegra210-emc-reg.h"
> > +
> > +static struct device_node *tegra_emc_ramcode_devnode(
> > +	struct device_node *np)
> 
> This is weirdly wrapped. Typically if it doesn't all fit on one line
> you'd break after the return type, like so:
> 
>     static struct device_node *tegra_emc_ramcode_devnode(struct device_node *np)
> 
> That said, the above does seem to fit on a single line, so there'n no
> reason to wrap at all. You could still try to make it a little shorter
> by using the _node suffix instead of _devnode.
> 

..

> 
> Should this be an array? Seems like that could make it easier to write
> the tables to these registers later on.
> 
> > +
> > +	struct emc_table *current_timing;
> > +	struct emc_table *next_timing;
> > +	struct emc_table start_timing;
> 
> Why is start_timing not a pointer? It looks to me like that's basically
> a copy of emc_table[0], so why not just point it at that?
> 

No. Apparently it is possible the EMC registers are configured by the
bootloader differently than anything mentioned in the table. Given that
the switching sequence need some of the current register values, we need
to read those from the hardware and we cannot just point to an existing
table entry.

Peter.

