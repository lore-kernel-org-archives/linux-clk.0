Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B34C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 11:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 999F564E37
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 11:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhBJLFV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 06:05:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:30311 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231623AbhBJLDn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Feb 2021 06:03:43 -0500
IronPort-SDR: J/2EFd0g0awFT6kXgS8vBjYDO2qdu6246sbI8LQCLl8+uC9y6eSYPnruGivcjwt3BRvdiGK9n4
 z5Dpr9+4/8aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="201155370"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="201155370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 03:01:57 -0800
IronPort-SDR: y6/Hdxu3XPrS1ERjSFXoM4N0XUC68dRxaMmtPO//bASgEj3G0axMA0MkrIJhrnQ4npG2UX/Igb
 gsjWa4mb0yvg==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; 
   d="scan'208";a="436635931"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 03:01:56 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l9nFp-003R37-Jn; Wed, 10 Feb 2021 13:01:53 +0200
Date:   Wed, 10 Feb 2021 13:01:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
Message-ID: <YCO9IZ4IHI2gruds@smile.fi.intel.com>
References: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com>
 <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 09, 2021 at 03:59:05PM -0800, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2021-02-09 09:09:52)
> > fwnode is an abstraction on the different types of firmware nodes.
> > In order to allow clocks to be linked with any type of such node,
> > start a conversion to the struct fwnode_handle instead of being
> > stuck with struct device_node.
> 
> Is ACPI going to support clk hardware? We're "stuck" with device nodes
> mostly because there isn't a clk framework for ACPI.

Here I'm not talking about ACPI vs. DT vs. anything, the pure motivation is to
make less divergence of standalone OF vs. fwnode (see IRQ domain APIs, for
example, which allows to use them in regmap IRQ APIs).

-- 
With Best Regards,
Andy Shevchenko


