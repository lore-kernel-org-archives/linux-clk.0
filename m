Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E355C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 20:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbiBYUe2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 15:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiBYUe1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 15:34:27 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3731E6E9B;
        Fri, 25 Feb 2022 12:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645821234; x=1677357234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+lvmAhCYQuyMRE2GihAairv8wMrdoP5LesBMAJZ/n5Y=;
  b=FDkf/6iaT/P+gdf7lv0EOshl+mvF9z72aiMj3bbp5tjZPSEQq+Vhn6Aw
   ntzX2MpfUGkF0fgDbdCQmsrFdRhZAwvQPTFFgvAoFd2tAtXvqh0xmyl2T
   zAaUwYs3yzvmfqL8vgscYlhrCaGiSUJ8owy3ThvDR2j76F6C3O7J7m1F0
   N0fCjJfcv2jYAHbbPU1Ae+Vk/2v22EFzothj6qUfKgvCmb7jl44BCXsZV
   yk94WsJ8CAzLXD5KMXPK3Mw/nIIs2Ys1+TkJHaK0mPtSswH18jERkA24n
   5ekRP2zu7tr1zg61kOZMNMRwZ+BN0G7awXTGqC0hFqIswB9TWMLBfzlhr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="239978678"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="239978678"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 12:33:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; 
   d="scan'208";a="607870179"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 12:33:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nNhEj-008OLi-Fl;
        Fri, 25 Feb 2022 22:30:45 +0200
Date:   Fri, 25 Feb 2022 22:30:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>
Subject: Re: [PATCH v2 5/8] dma: dw: Avoid partial transfers
Message-ID: <Yhk8dAUuQ1OuNkqX@smile.fi.intel.com>
References: <20220222103437.194779-1-miquel.raynal@bootlin.com>
 <20220222103437.194779-6-miquel.raynal@bootlin.com>
 <YhY4PqqOgYTLgpKr@smile.fi.intel.com>
 <20220224173009.0d37c12e@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224173009.0d37c12e@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 24, 2022 at 05:30:09PM +0100, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Wed, 23 Feb 2022 15:35:58
> +0200:
> > On Tue, Feb 22, 2022 at 11:34:34AM +0100, Miquel Raynal wrote:

...

> > It seems the logic in the ->terminate_all() is broken and we actually need
> > to resume channel first (possibly conditionally, if it was suspended), then
> > pause it and disable and resume again.
> > 
> > The problem with ->terminate_all() is that it has no knowledge if it has
> > been called on paused channel (that's why it has to pause channel itself).
> > The pause on termination is required due to some issues in early steppings
> > of iDMA 32-bit hardware implementations.
> > 
> > If my theory is correct, the above change should fix the issues you see.
> 
> I don't have access to these datasheets so I will believe your words
> and try to apply Andy's solution. I ended up with the following fix,
> hopefully I got it right:
> 
> diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
> index 48cdefe997f1..59822664d8ec 100644
> --- a/drivers/dma/dw/core.c
> +++ b/drivers/dma/dw/core.c
> @@ -865,6 +865,10 @@ static int dwc_terminate_all(struct dma_chan *chan)
>  
>         clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
>  
> +       /* Ensure the last byte(s) are drained before disabling the channel */
> +       if (test_bit(DW_DMA_IS_PAUSED, &dwc->flags))
> +               dwc_chan_resume(dwc, true);
> +
>         dwc_chan_pause(dwc, true);
>  
>         dwc_chan_disable(dw, dwc);

Yes, this is good enough PoC. Needs to be tested, thanks!

> Phil, I know it's been 3 years since you investigated this issue, but
> do you still have access to the script reproducing the issue? Even
> better, do you still have the hardware to test?

-- 
With Best Regards,
Andy Shevchenko


