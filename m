Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2547EC07E9A
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jul 2021 09:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0272661374
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jul 2021 09:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238223AbhGNJP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jul 2021 05:15:29 -0400
Received: from mga14.intel.com ([192.55.52.115]:12515 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238123AbhGNJP3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Jul 2021 05:15:29 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210130738"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; 
   d="scan'208";a="210130738"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 02:12:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; 
   d="scan'208";a="413227226"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2021 02:12:35 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m3awP-00DFh0-4X; Wed, 14 Jul 2021 12:12:29 +0300
Date:   Wed, 14 Jul 2021 12:12:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [RFC PATCH] clk: fractional-divider: Correct max_{m,n} handed
 over to rational_best_approximation()
Message-ID: <YO6qfQMcvr9szZTJ@smile.fi.intel.com>
References: <20210714064129.1321277-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714064129.1321277-1-victor.liu@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 14, 2021 at 02:41:29PM +0800, Liu Ying wrote:
> If a fractional divider clock has the flag
> CLK_FRAC_DIVIDER_ZERO_BASED set, the maximum
> numerator and denominator handed over to
> rational_best_approximation(), in this case
> max_m and max_n, should be increased by one
> comparing to those have the flag unset.  Without
> this patch, a zero based fractional divider
> with 1-bit mwidth and 3-bit nwidth would wrongly
> generate 96MHz clock rate if the parent clock
> rate is 288MHz, while the expected clock rate
> is 115.2MHz with m = 2 and n = 5.

Make sure that your editor is configured to allow you to have lines ~70-72
characters long.

...

> The patch is RFC, because the rationale behind the below snippet in
> clk_fd_general_approximation() is unclear to Jacky and me and we are
> not sure if there is any room to improve this patch due to the snippet.
> Maybe, Andy may help shed some light here.  Thanks.
> 
> -----------------------------------8<---------------------------------
> /*
>  * Get rate closer to *parent_rate to guarantee there is no overflow
>  * for m and n. In the result it will be the nearest rate left shifted
>  * by (scale - fd->nwidth) bits.
>  */

I don't know how to rephrase above comment better.

> scale = fls_long(*parent_rate / rate - 1);
> if (scale > fd->nwidth)
> 	rate <<= scale - fd->nwidth;

This takes an advantage of the numbers be in a form of

	n = k * 2^m, (1)

where m will be scale in the snippet above. Thus, if n can be represented by
(1), we opportunistically reduce amount of bits needed for it by shifting right
by m bits.

Does it make sense?

The code looks good to me, btw, although I dunno if you need to call the newly
introduced function before or after the above mentioned snippet.

-- 
With Best Regards,
Andy Shevchenko


