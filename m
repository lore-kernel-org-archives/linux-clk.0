Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:48767 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752853AbdGXODi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jul 2017 10:03:38 -0400
Message-ID: <1500904960.29303.204.camel@linux.intel.com>
Subject: Re: [PATCH] clk: x86: Do not gate clocks enabled by the firmware
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        linux@endlessm.com, Carlo Caione <carlo@endlessm.com>
Date: Mon, 24 Jul 2017 17:02:40 +0300
In-Reply-To: <1ac00dd5-038c-7ef7-44e7-4c95fea8042d@linux.intel.com>
References: <20170710203801.17496-1-carlo@caione.org>
         <CAFqH_51Mje4tK494JRgb=wWJNU9zu=WZ1sS482kRAvRrPpLkXQ@mail.gmail.com>
         <20170710235403.GB25390@fury>
         <1ac00dd5-038c-7ef7-44e7-4c95fea8042d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-07-24 at 15:49 +0200, Pierre-Louis Bossart wrote:
> On 7/11/17 1:54 AM, Darren Hart wrote:
> > On Tue, Jul 11, 2017 at 12:31:28AM +0200, Enric Balletbo Serra
> > wrote:

> > > Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > 
> > Excellent, thank you Enric. Pierre, any objections to this going in
> > to
> > 4.13 now and stable back to 4.12?
> 
> I saw an update of this patch being merged while I was away on an 
> extended summer break, but out of curiosity what was the problem with
> no 
> audio on Baytrail? the code was added precisely to add support for
> 19.2 
> MHz on Baytrail and finally solve audio issues. I have no reports of 
> broken functionality with this 282a4e4 commit... Enric, do you have a 
> bugzilla or pointers?

TL;DR: We should respect firmware settings before blindly shut down
"unused" resources. (We used to have similar stuff in GPIO/pinctrl
driver for direct IRQ pins, where we shut up the pins which are used
directly by IOAPIC)

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
