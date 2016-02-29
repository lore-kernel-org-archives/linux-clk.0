Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:47605 "EHLO muru.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750821AbcB2Wzj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Mon, 29 Feb 2016 17:55:39 -0500
Date: Mon, 29 Feb 2016 14:55:36 -0800
From: Tony Lindgren <tony@atomide.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: paul@pwsan.com, t-kristo@ti.com, vigneshr@ti.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/5] pwms: pwm-ti*: Remove support for local clock
 gating
Message-ID: <20160229225536.GR13417@atomide.com>
References: <1456439796-28546-1-git-send-email-fcooper@ti.com>
 <1456439796-28546-2-git-send-email-fcooper@ti.com>
 <20160229220444.GQ13417@atomide.com>
 <56D4C69D.1090100@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56D4C69D.1090100@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

* Franklin S Cooper Jr. <fcooper@ti.com> [160229 14:31]:
> On 02/29/2016 04:04 PM, Tony Lindgren wrote:
> > Hmm but why are you also removing the pm_runtime calls? Those
> > actually do take care of gating the clocks via the interconnect
> > level code that is hwmod in this case.
> I removed all PM runtime calls that revolved around
> pwmss_submodule_state_change. Originally the driver would do
> a pm_runtime_get_sync then call pwmss_submodule_state_change
> and then immediately call pm_runtime_put_sync. Without
> pwmss_submodule_state_change those calls would be
> meaningless.  I also removed pm_runtime calls in error paths
> that no longer existed.

Typically the interconnect level code can gate the clkctrl bit
for the module with PM runtime even with no other driver specific
registers. If you remove the pm_runtime calls, that does not
happen.

Also, how do you know this change does not affect the other
SoC variants using the same driver?

Regards,

Tony
