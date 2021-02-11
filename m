Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C50C4332D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 10:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA81F64E33
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 10:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhBKKmI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 05:42:08 -0500
Received: from mga06.intel.com ([134.134.136.31]:65460 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229978AbhBKKjq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 05:39:46 -0500
IronPort-SDR: sWUcG1aGL+0P84ommrQAqajq7zyXHeesN9POwcYczXF8kXyq2teSyUcHBnMf1KH9UxtNBmjkAs
 JF6pfn52LGfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="243712924"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="243712924"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 02:37:56 -0800
IronPort-SDR: qf5CNDhGBAK7STBigveV9OUkaBM674qv+/TP8jd6PJFSGliyoDNeoBe+5Mk4kqmYVQQofSzxo4
 qiIhZ56IYazQ==
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="375797681"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 02:37:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lA9M8-004CVt-RD; Thu, 11 Feb 2021 12:37:52 +0200
Date:   Thu, 11 Feb 2021 12:37:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v1] clk: Move struct clk_core to use struct fwnode_handle
Message-ID: <YCUJAGKKkP0AI5fX@smile.fi.intel.com>
References: <20210209170952.49794-1-andriy.shevchenko@linux.intel.com>
 <161291514590.418021.17536537656317500613@swboyd.mtv.corp.google.com>
 <YCO9IZ4IHI2gruds@smile.fi.intel.com>
 <161301033161.1254594.5999850767233898633@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161301033161.1254594.5999850767233898633@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 10, 2021 at 06:25:31PM -0800, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2021-02-10 03:01:53)
> > On Tue, Feb 09, 2021 at 03:59:05PM -0800, Stephen Boyd wrote:
> > > Quoting Andy Shevchenko (2021-02-09 09:09:52)
> > > > fwnode is an abstraction on the different types of firmware nodes.
> > > > In order to allow clocks to be linked with any type of such node,
> > > > start a conversion to the struct fwnode_handle instead of being
> > > > stuck with struct device_node.
> > > 
> > > Is ACPI going to support clk hardware? We're "stuck" with device nodes
> > > mostly because there isn't a clk framework for ACPI.
> > 
> > Here I'm not talking about ACPI vs. DT vs. anything, the pure motivation is to
> > make less divergence of standalone OF vs. fwnode (see IRQ domain APIs, for
> > example, which allows to use them in regmap IRQ APIs).
> > 
> 
> I thought the fwnode changes in IRQ domain APIs was to work across both
> ACPI and DT. Please tell me more!

I wish I could dig this out from the commit
f110711a6053 ("irqdomain: Convert irqdomain-%3Eof_node to fwnode")
but it kept silent what the motivation of doing that.

For me the fwnode API brings an agnostic interface which is good thing to have
and makes it easier to be used by other providers (you know that we have swnode
besides ACPI and DT, right?).

I would like to re-use clk-gpio in ACPI based environment and I found it quite
difficult without changing a lot of things in clk framework which is tighten to
OF by nails. This is not good from design perspective and makes my journey
miserable. Of course if clk is against this, I would live with copy'n'paste
approach — no hard feelings. Just let me know.

-- 
With Best Regards,
Andy Shevchenko


