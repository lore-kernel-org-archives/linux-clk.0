Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F88DC10F00
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 19:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E154F206C0
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 19:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387936AbfC0TTa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 15:19:30 -0400
Received: from mga01.intel.com ([192.55.52.88]:33525 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387462AbfC0TT3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Mar 2019 15:19:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Mar 2019 12:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,277,1549958400"; 
   d="scan'208";a="137929382"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2019 12:19:26 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1h9E57-0002e1-5W; Wed, 27 Mar 2019 21:19:25 +0200
Date:   Wed, 27 Mar 2019 21:19:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     David =?iso-8859-1?Q?M=FCller?= <dave.mueller@gmx.ch>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
Message-ID: <20190327191925.GP9224@smile.fi.intel.com>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
> Andy Shevchenko wrote:
> > On Wed, Mar 27, 2019 at 05:02:31PM +0100, Hans de Goede wrote:
> > > I think that it might be better to restore the CLK_IS_CRITICAL workaround
> > > for this, but then only on select boards, based on DMI matching.
> > > 
> > > I've added a bunch of relevant people / lists to the Cc.
> > > 
> > > Andy, Stephen, what is your take on this ?
> > 
> > I'm afraid I forgot all details about that (semi-)famous issue. Though, looking
> > into your patch against r8169 and taking into account DT practice, it would be
> > not bad to fix a driver, we have by the way devm_clk_get_optional() now, so, it
> > would be not a big deal.
> > 
> > > I'm myself starting to believe the DMI based applying of the
> > > CLK_IS_CRITICAL workaround is the best solution here.
> > 
> > DMI quirk table tends to grow in mysterious ways. I would prefer in this case
> > logical solution — if platform has an optional clock, then use it.
> 
> The pmc_plt_clks may also be used for external hardware purposes without
> the need for a driver involved. So I'm afraid a fix similar to the r8169
> approach will not suit all needs. Please see
> https://www.spinics.net/lists/linux-clk/msg35800.html for details.

Any driver for device which is using PMC clock should take it into
consideration.

I don't see any issues with patching devices drivers based on case-by-case
approach.

Is there any other impediment that prevents us to update the driver in
question?

-- 
With Best Regards,
Andy Shevchenko


