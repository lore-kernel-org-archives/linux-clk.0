Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC561C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 16:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381267AbiBUQtI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 11:49:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381237AbiBUQs6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 11:48:58 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E4A237D3;
        Mon, 21 Feb 2022 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645462114; x=1676998114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JMvx6HdjljRIyEJnTyPEGxbsrX44dVlOO6YTuBmXXRM=;
  b=VrLNDo3tcp2IlRv6CXY3cC1WhaDDsxgQ/ETbaeiCsm06jPXSOPxr+4IP
   cWyHuNw7I1nN1AlJbvv9Y1iAsr5UK2GcjqwIXW3GbolThkyPnYry2CCwF
   rj89follcMQVGO18ezEkd4ID5lSqWCuOklsGJCCeGR2AJJiVMV5ku3brf
   tppQLsdGb69ylHoOH/4mW9RGmmDyQkDInvJLHkgtZeLYjignqCni4V723
   BElb93z0IaS+tQKG6WjEu1yvY4KdT0JF1GqnPco1aMAYnKEqENfiCJ35Q
   +403se73nQWCI3Wtqy5xOou5ZIGeGOPTrCe8exuyhY45RgGbPEJCoRKJy
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251492664"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="251492664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 08:48:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="591017878"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 08:48:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMBqb-006rBq-PG;
        Mon, 21 Feb 2022 18:47:37 +0200
Date:   Mon, 21 Feb 2022 18:47:37 +0200
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
        Laetitia MARIOTTINI <laetitia.mariottini@se.com>
Subject: Re: [PATCH 4/8] dma: dmamux: Introduce RZN1 DMA router support
Message-ID: <YhPCKbMtB3jnhBo4@smile.fi.intel.com>
References: <20220218181226.431098-1-miquel.raynal@bootlin.com>
 <20220218181226.431098-5-miquel.raynal@bootlin.com>
 <YhIeQlwmt/yCc8Uu@smile.fi.intel.com>
 <20220221161320.449b2d4d@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221161320.449b2d4d@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 21, 2022 at 04:13:20PM +0100, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Sun, 20 Feb 2022 12:56:02
> +0200:
> > On Fri, Feb 18, 2022 at 07:12:22PM +0100, Miquel Raynal wrote:

...

> > > +		dev_err(&pdev->dev, "Missing DMAC requests information\n");
> > > +		of_node_put(dmac_node);
> > > +		return -EINVAL;  
> > 
> > First put node, then simply use dev_err_probe().
> 
> I don't get the point here. dev_err_probe() is useful when -EPROBE_DEFER
> can be returned, right? I don't understand what it would bring here nor
> how I should use it to simplify error handling.

Less LOCs, and it's fine to call it here. This usecase is described in the
dev_err_probe() documentation.

-- 
With Best Regards,
Andy Shevchenko


