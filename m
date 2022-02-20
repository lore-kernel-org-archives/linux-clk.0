Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0075C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 20 Feb 2022 10:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiBTKvI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Feb 2022 05:51:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiBTKvI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 05:51:08 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DAC2ACB;
        Sun, 20 Feb 2022 02:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645354244; x=1676890244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrfqCSj6wxGMuWTz7BPscifaGhiC5e7JhWuvazwKhxg=;
  b=bRhQjG/PVzR9FP4dq+QcPvZuJHO3KqcMDZEiEyKLoQmitpfhi5RHtSMU
   4rSt2/oN+ILfkBsVF/O9YJ1QM+s8ZJx0c1N3CZDN2F5LCLbrOyt3Mm26r
   tDJMESRLIQF8cHY31lBqgRju9vyPdw6NH3HKx+EUQb2a0zZV/wtofPNhg
   WcrY93ixsZ3AUMB9lL6wsfU++YDHggs6XbL4TdxH7RiVAnRAHWB6dffYv
   RMtECvTF40ia0CupFruBWjaqVitourQXY/oTcr4fDeYuCKxHzmE4BxA7A
   hREUE3dUvDACBHdgiUR3dscSJamJSAveFi1yNgxaP5o0JgZ9p0Q8+H++0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="248944311"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="248944311"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 02:50:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="775716675"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 02:50:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nLjml-006UU3-OX;
        Sun, 20 Feb 2022 12:49:47 +0200
Date:   Sun, 20 Feb 2022 12:49:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Viresh Kumar <vireshk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Laetitia MARIOTTINI <laetitia.mariottini@se.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH 5/8] dma: dw: Avoid partial transfers
Message-ID: <YhIcyyBp53LnMbjU@smile.fi.intel.com>
References: <20220218181226.431098-1-miquel.raynal@bootlin.com>
 <20220218181226.431098-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218181226.431098-6-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 18, 2022 at 07:12:23PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Pausing a partial transfer only causes data to be written to mem that is
> a multiple of the memory width setting.
> 
> However, when a DMA client driver finishes DMA early, e.g. due to UART
> char timeout interrupt, all data read from the DEV must be written to MEM.
> 
> Therefore, allow the slave to limit the memory width to ensure all data
> read from the DEV is written to MEM when DMA is paused.

Is this a fix?
What happens to the data if you don't do this?
As far as I understood the Synopsys DesignWare specification the DMA controller
is capable of flushing FIFO in that case on byte-by-byte basis. Do you have an
HW integration bug?

TL;DR: tell us more about this.

...

> +		if (sconfig->dst_addr_width && sconfig->dst_addr_width < data_width)
> +			data_width = sconfig->dst_addr_width;

But here no check that you do it for explicitly peripheral to memory, so this
will affect memory to peripheral transfers as well.


-- 
With Best Regards,
Andy Shevchenko


