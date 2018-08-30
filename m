Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:62303 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727238AbeH3MpD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 08:45:03 -0400
Date: Thu, 30 Aug 2018 11:43:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "David S . Miller" <davem@davemloft.net>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Irina Tirdea <irina.tirdea@intel.com>, netdev@vger.kernel.org,
        Johannes Stezenbach <js@sig21.net>,
        Carlo Caione <carlo@endlessm.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] clk-pmc-atom + r8169: Add ether_clk handling to fix
 suspend issues
Message-ID: <20180830084356.GH11447@smile.fi.intel.com>
References: <20180827143200.8597-1-hdegoede@redhat.com>
 <20180829163141.GB8462@smile.fi.intel.com>
 <e3be83dc-67c7-fdaa-1dd9-0a4aa3d10584@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e3be83dc-67c7-fdaa-1dd9-0a4aa3d10584@redhat.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 29, 2018 at 07:06:09PM +0200, Hans de Goede wrote:

> > What a nice stuff, thanks!
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thank you (and also thank you for the other reviews)
> 
> > Btw, you probably better to refer to
> > https://bugzilla.kernel.org/show_bug.cgi?id=196861 which is dedicated for S0ix
> > issue.
> 
> Ok, I've added a link to that. I've also added:
> 
> Reported-by: Johannes Stezenbach <js@sig21.net>
> 
> To honor Johannes for figuring out that leaving the clocks enabled
> was a problem in the first place.
> 
> This will all be included in v2 of the series when I send it out.

Forgot to mention, instead of Irina, which is not longer working for Intel for
more than a year, put Pierre's address there.


-- 
With Best Regards,
Andy Shevchenko
