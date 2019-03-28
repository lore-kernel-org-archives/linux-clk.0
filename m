Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814DC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 869722075E
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfC1O6c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 10:58:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:28026 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725816AbfC1O6c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 10:58:32 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Mar 2019 07:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,280,1549958400"; 
   d="scan'208";a="126659874"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2019 07:58:29 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1h9WU7-0003fc-Mn; Thu, 28 Mar 2019 16:58:27 +0200
Date:   Thu, 28 Mar 2019 16:58:27 +0200
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
Message-ID: <20190328145827.GI9224@smile.fi.intel.com>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
 <20190327191925.GP9224@smile.fi.intel.com>
 <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
> Andy Shevchenko wrote:
> > On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
> >> The pmc_plt_clks may also be used for external hardware purposes without
> >> the need for a driver involved. So I'm afraid a fix similar to the r8169
> >> approach will not suit all needs. Please see
> >> https://www.spinics.net/lists/linux-clk/msg35800.html for details.
> >
> > Any driver for device which is using PMC clock should take it into
> > consideration.
> 
> I agree that each driver should properly request the clocks and other
> resources needed.
> 
> But what if the PMC clock is used by hardware for which no driver is
> being loaded or needed?

Perhaps I didn't get a full picture.

In the original message you referred to igb _driver_ and devices that are not
working properly after resume.

The igb driver patching can fix that, right?

If the driver is not loaded, then the clock is not in use and can be gated,
correct?

If there is a connection of this clock to the hardware which is served by
firmware, then its firmware's deal, no?

Can you elaborate a bit more the case you are talking about?

-- 
With Best Regards,
Andy Shevchenko


