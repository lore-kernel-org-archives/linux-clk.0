Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A463AC43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BA98206BA
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 15:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfC1PY0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:24:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:42227 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726046AbfC1PYZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 11:24:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Mar 2019 08:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,280,1549958400"; 
   d="scan'208";a="144651518"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Mar 2019 08:24:23 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1h9WtB-0003tX-Pg; Thu, 28 Mar 2019 17:24:21 +0200
Date:   Thu, 28 Mar 2019 17:24:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     David =?iso-8859-1?Q?M=FCller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
Message-ID: <20190328152421.GJ9224@smile.fi.intel.com>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
 <20190327191925.GP9224@smile.fi.intel.com>
 <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
 <20190328145827.GI9224@smile.fi.intel.com>
 <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 28, 2019 at 04:01:37PM +0100, Hans de Goede wrote:
> On 28-03-19 15:58, Andy Shevchenko wrote:
> > On Thu, Mar 28, 2019 at 03:35:58PM +0100, David Müller wrote:
> > > Andy Shevchenko wrote:
> > > > On Wed, Mar 27, 2019 at 06:31:19PM +0100, David Müller wrote:
> > > > > The pmc_plt_clks may also be used for external hardware purposes without
> > > > > the need for a driver involved. So I'm afraid a fix similar to the r8169
> > > > > approach will not suit all needs. Please see
> > > > > https://www.spinics.net/lists/linux-clk/msg35800.html for details.
> > > > 
> > > > Any driver for device which is using PMC clock should take it into
> > > > consideration.
> > > 
> > > I agree that each driver should properly request the clocks and other
> > > resources needed.
> > > 
> > > But what if the PMC clock is used by hardware for which no driver is
> > > being loaded or needed?
> > 
> > Perhaps I didn't get a full picture.
> > 
> > In the original message you referred to igb _driver_ and devices that are not
> > working properly after resume.
> > 
> > The igb driver patching can fix that, right?
> > 
> > If the driver is not loaded, then the clock is not in use and can be gated,
> > correct?
> > 
> > If there is a connection of this clock to the hardware which is served by
> > firmware, then its firmware's deal, no?
> > 
> > Can you elaborate a bit more the case you are talking about?
> 
> In David's case we are talking about a USB hub which needs a pmc-clk
> (yes really).

OK, this is understandable (what a weird HW design)...

> Also see me other mail I send about this about 5 minutes
> ago.
> 
> David's case is the reason why I believe we need a DMI quirk table; and
> once we have that I think the board with igb ethernet controllers might
> just as well be handled the same way (I already checked it has usable
> DMI identifying info).

But am I right that in the case of igb we will loose power at suspend? Wouldn't
be better to patch the driver?

-- 
With Best Regards,
Andy Shevchenko


