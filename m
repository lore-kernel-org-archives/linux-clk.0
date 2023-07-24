Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6247DC001E0
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jul 2023 10:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjGXKMA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 06:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjGXKLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 06:11:45 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9EC59E7;
        Mon, 24 Jul 2023 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690193062; x=1721729062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7lDUvLV9DwkybbWR5a1MfysHXrim31bgG1G2gwZpqA=;
  b=MrLOW4vKaA6Hn+g/dxGoZl1ggeG/L1CDaGAVs9LWNctTG1Ge64+d+2W4
   X2gYgcRIm5cA89o7NVnN+iQKy7BnddDT52iZJybdeJdNEYX1T8aKrRV+9
   P2MfvkMjXNVBD2uBf+l7HvexGbleFgsCacVN1mHE4OKP+XFwiOwcgGJbD
   T6n6e+v/gBsixpQhth0sygFyNviLBCtKZxMy3gZV7c3girSfUUzix6+t7
   nxTVTZNw8U283i163ycTPqg4ZEr/ayVF0wq0cKrV091BK8e7/poDIQvwA
   aryiS59veyb523PNmuaDrP74gBpe6ZQlrGsANfsd/WdxpdV4ChbcftgK4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367426153"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="367426153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 03:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972203238"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972203238"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 03:01:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qNsO1-007gPp-36;
        Mon, 24 Jul 2023 13:01:53 +0300
Date:   Mon, 24 Jul 2023 13:01:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <sboyd@kernel.org>, Doug Brown <doug@schmorgal.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v1 1/1] clk: mmp: Switch to use struct u32_fract instead
 of custom one
Message-ID: <ZL5MEVO45QwxLN1y@smile.fi.intel.com>
References: <20230724094838.32596-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724094838.32596-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 24, 2023 at 12:48:38PM +0300, Andy Shevchenko wrote:
> The struct mmp_clk_factor_tbl repeats the generic struct u32_fract.
> Kill the custom one and use the generic one instead.

Note, I have not tested this. And after testing you may incorporate this
into your series if there is no objection.

-- 
With Best Regards,
Andy Shevchenko


