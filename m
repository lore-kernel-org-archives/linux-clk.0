Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F148C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 16:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71A9220645
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 16:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfC0Qr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 12:47:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:43273 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727218AbfC0Qr5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Mar 2019 12:47:57 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Mar 2019 09:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,277,1549958400"; 
   d="scan'208";a="155731775"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2019 09:47:50 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1h9BiO-0001Ar-Ow; Wed, 27 Mar 2019 18:47:48 +0200
Date:   Wed, 27 Mar 2019 18:47:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        Semyon Verchenko <semverchenko@factor-ts.ru>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>,
        David =?iso-8859-1?Q?M=FCller?= <dave.mueller@gmx.ch>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
Message-ID: <20190327164748.GO9224@smile.fi.intel.com>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 27, 2019 at 05:02:31PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/25/19 9:12 PM, Fujinaka, Todd wrote:
> > This is going to take a bit of time to see what we need to do. The attachments were stripped but I think just figuring out what they had to change in the Realtek driver will tell us what we need to know.
> 
> I'm not sure fixing this in the ethernet driver is the best way to go,
> the board in question is an embedded PC and I've also recently received
> a bug report about a similar problem with the consumer not requesting
> the pmc clocks causing a HSIC usb hub to not work.
> 
> I think that it might be better to restore the CLK_IS_CRITICAL workaround
> for this, but then only on select boards, based on DMI matching.
> 
> I've added a bunch of relevant people / lists to the Cc.
> 
> Andy, Stephen, what is your take on this ?

I'm afraid I forgot all details about that (semi-)famous issue. Though, looking
into your patch against r8169 and taking into account DT practice, it would be
not bad to fix a driver, we have by the way devm_clk_get_optional() now, so, it
would be not a big deal.

> I'm myself starting to believe the DMI based applying of the
> CLK_IS_CRITICAL workaround is the best solution here.

DMI quirk table tends to grow in mysterious ways. I would prefer in this case
logical solution — if platform has an optional clock, then use it.

> 
> Regards,
> 
> Hans
> 
> 
> > 
> > Todd Fujinaka
> > Software Application Engineer
> > Datacenter Engineering Group
> > Intel Corporation
> > todd.fujinaka@intel.com
> > 
> > 
> > -----Original Message-----
> > From: Semyon Verchenko [mailto:semverchenko@factor-ts.ru]
> > Sent: Monday, March 25, 2019 6:25 AM
> > To: hdegoede@redhat.com; Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; e1000-devel@lists.sf.net
> > Subject: [E1000-devel] igb driver with Intel Atom Bay Trail issue
> > 
> > Dear Linux/igb maintainers,
> > 
> > We've encountered problem with igb driver (both one that is distributed with Linux kernel and one which is downloadable from intel.com). After commit 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL") on machine with Intel(R) Atom(TM) CPU E3825 with 4 ethernet cards Intel
> > I211 only one of cards probed correctly, other ones fail with error -2 (error -5 with driver from intel.com). I've rebuilt kernel with commit 648e921888ad reverted and all 4 interfaces had to probe correctly.
> > Problem is reproducible at least with kernel 5.0.4 and kernels 4.14.y (actually firstly I've encountered this on 4.14.105 while it worked fine with 4.14.67 so I firstly started to build intermediate versions of kernel and found that problem started to appear on 4.14.77, but since it's reproducible in mainline kernel I think I should inform mainline kernel maintainers about this). Also it is reproducible with igb
> > 5.3.5.22 from intel.com. I'm attaching kernel logs (journalctl.bad is from stock kernel and journalctl.badfix is from stock kernel with commit 648e921888ad reversed), lspci -vnn output (same about file names) and /proc/cpuinfo. The system is Arch Linux with kernel replaced to stock one (it is not Arch Linux-related problem as it appeared in another system with 4.14 kernel). I think something like Hans de Goede's r8169 patches is required for igb (and maybe other Intel drivers), but I'm not so good with driver developing so it seems too hard for me.
> > 
> > Regards,
> > Semyon Verchenko
> > 

-- 
With Best Regards,
Andy Shevchenko


