Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC9BC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 22:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 758182146E
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 22:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730984AbfBRWC1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 17:02:27 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:46201 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729530AbfBRWC1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Feb 2019 17:02:27 -0500
Received: from 79.184.254.15.ipv4.supernova.orange.pl (79.184.254.15) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.183)
 id 352fb2c46b2eeb3c; Mon, 18 Feb 2019 23:02:23 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] clk: x86: Move clk-lpss.h to platform_data/x86
Date:   Mon, 18 Feb 2019 23:00:59 +0100
Message-ID: <3313613.aXZoxbyzyv@aspire.rjw.lan>
In-Reply-To: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
References: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Monday, February 18, 2019 8:34:15 PM CET Andy Shevchenko wrote:
> clk-lpss.h is solely x86 related header. Move it to correct folder.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

in case you want to take this through the platform-x86 tree.

> ---
>  drivers/acpi/acpi_lpss.c                         | 2 +-
>  drivers/clk/x86/clk-lpt.c                        | 2 +-
>  include/linux/platform_data/{ => x86}/clk-lpss.h | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename include/linux/platform_data/{ => x86}/clk-lpss.h (100%)
> 
> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
> index 5f94c35d165f..1e2a10a06b9d 100644
> --- a/drivers/acpi/acpi_lpss.c
> +++ b/drivers/acpi/acpi_lpss.c
> @@ -18,7 +18,7 @@
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> -#include <linux/platform_data/clk-lpss.h>
> +#include <linux/platform_data/x86/clk-lpss.h>
>  #include <linux/platform_data/x86/pmc_atom.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/clk/x86/clk-lpt.c b/drivers/clk/x86/clk-lpt.c
> index 6b40eb89ae19..68bd3abaef2c 100644
> --- a/drivers/clk/x86/clk-lpt.c
> +++ b/drivers/clk/x86/clk-lpt.c
> @@ -13,7 +13,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
> -#include <linux/platform_data/clk-lpss.h>
> +#include <linux/platform_data/x86/clk-lpss.h>
>  #include <linux/platform_device.h>
>  
>  static int lpt_clk_probe(struct platform_device *pdev)
> diff --git a/include/linux/platform_data/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
> similarity index 100%
> rename from include/linux/platform_data/clk-lpss.h
> rename to include/linux/platform_data/x86/clk-lpss.h
> 


