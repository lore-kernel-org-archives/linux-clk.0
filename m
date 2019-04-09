Return-Path: <SRS0=4wXd=SL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B27AC10F0E
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 15:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 321B1206B7
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 15:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfDIPba (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Apr 2019 11:31:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:60507 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbfDIPb3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Apr 2019 11:31:29 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2019 08:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,329,1549958400"; 
   d="scan'208";a="162759031"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2019 08:31:25 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hDsib-0004lm-9w; Tue, 09 Apr 2019 18:31:25 +0300
Date:   Tue, 9 Apr 2019 18:31:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?utf-8?B?0KHQtdC80LXQvSDQktC10YDRh9C10L3QutC+?= 
        <semverchenko@factor-ts.ru>,
        David =?iso-8859-1?Q?M=FCller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
Message-ID: <20190409153125.GU9224@smile.fi.intel.com>
References: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
 <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
 <20190408172111.GX9224@smile.fi.intel.com>
 <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 08, 2019 at 08:43:10PM +0200, Hans de Goede wrote:
> On 08-04-19 19:21, Andy Shevchenko wrote:
> > On Thu, Apr 04, 2019 at 04:43:03PM +0200, Hans de Goede wrote:
> > > On 29-03-19 16:53, Hans de Goede wrote:
> > > > On 3/29/19 2:59 PM, Семен Верченко wrote:
> > 
> > > > Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.
> > > > 
> > > > Supporting this through get_clk is going to require a DMI table in the igb driver
> > > > combined with checking which PCI "slot" the card is to get the correct clock
> > > > for each ethernet controller.
> > > > 
> > > > I believe tht just restoring the old behavior to mark all clocks enabled
> > > > on boot as critical, but then limited to this system based on a dmi match,
> > > > is the best solution here.
> > > > 
> > > > Andy?
> > > 
> > > Andy? Now that we've the patch ready for the other system which needs to
> > > have the CLK_IS_CRITICAL workaround and enables this based on DMI info,
> > > I believe the best fix for this system is to simply add it to that DMI
> > > table?
> > 
> > I reviewed v4, supposed to go via CLK tree.
> 
> Right, but that patch adds the quirk for the system with the USB hub,
> do you agree, that given that each ethernet controller seems to be
> using its own clock, it is best to use a DMI quirk for this case too?
> 
> If you agree then someone needs to prepare a follow-up patch on top of
> v4 which adds the DMI info for this board to the table.

I hope we may find a better solution in the future, but for now as a quick fix
the proposed can be done.

-- 
With Best Regards,
Andy Shevchenko


