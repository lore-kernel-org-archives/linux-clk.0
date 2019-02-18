Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB94CC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 22:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7A0121901
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 22:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbfBRWqt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 17:46:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:54601 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731925AbfBRWqs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Feb 2019 17:46:48 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2019 14:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; 
   d="scan'208";a="127448132"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2019 14:46:44 -0800
Received: from andy by smile with local (Exim 4.92-RC6)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1gvrgR-0007yt-9Y; Tue, 19 Feb 2019 00:46:43 +0200
Date:   Tue, 19 Feb 2019 00:46:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-acpi@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] clk: x86: Move clk-lpss.h to platform_data/x86
Message-ID: <20190218224643.GK9224@smile.fi.intel.com>
References: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
 <3313613.aXZoxbyzyv@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3313613.aXZoxbyzyv@aspire.rjw.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 18, 2019 at 11:00:59PM +0100, Rafael J. Wysocki wrote:
> On Monday, February 18, 2019 8:34:15 PM CET Andy Shevchenko wrote:
> > clk-lpss.h is solely x86 related header. Move it to correct folder.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> in case you want to take this through the platform-x86 tree.

I guess clock tree is the best for this.

> 
> > ---
> >  drivers/acpi/acpi_lpss.c                         | 2 +-
> >  drivers/clk/x86/clk-lpt.c                        | 2 +-
> >  include/linux/platform_data/{ => x86}/clk-lpss.h | 0
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename include/linux/platform_data/{ => x86}/clk-lpss.h (100%)
> > 
> > diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> > index 5f94c35d165f..1e2a10a06b9d 100644
> > --- a/drivers/acpi/acpi_lpss.c
> > +++ b/drivers/acpi/acpi_lpss.c
> > @@ -18,7 +18,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/pci.h>
> >  #include <linux/platform_device.h>
> > -#include <linux/platform_data/clk-lpss.h>
> > +#include <linux/platform_data/x86/clk-lpss.h>
> >  #include <linux/platform_data/x86/pmc_atom.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> > diff --git a/drivers/clk/x86/clk-lpt.c b/drivers/clk/x86/clk-lpt.c
> > index 6b40eb89ae19..68bd3abaef2c 100644
> > --- a/drivers/clk/x86/clk-lpt.c
> > +++ b/drivers/clk/x86/clk-lpt.c
> > @@ -13,7 +13,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/err.h>
> >  #include <linux/module.h>
> > -#include <linux/platform_data/clk-lpss.h>
> > +#include <linux/platform_data/x86/clk-lpss.h>
> >  #include <linux/platform_device.h>
> >  
> >  static int lpt_clk_probe(struct platform_device *pdev)
> > diff --git a/include/linux/platform_data/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
> > similarity index 100%
> > rename from include/linux/platform_data/clk-lpss.h
> > rename to include/linux/platform_data/x86/clk-lpss.h
> > 
> 
> 

-- 
With Best Regards,
Andy Shevchenko


