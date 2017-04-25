Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56836 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164872AbdDYQbs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2017 12:31:48 -0400
Date: Tue, 25 Apr 2017 17:31:37 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org
Subject: Re: [PATCH] Fix returns of some CLK API calls, if !CONFIG_HAVE_CLOCK
Message-ID: <20170425163137.GR17774@n2100.armlinux.org.uk>
References: <20170425125547.865FB508DA7@solo.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170425125547.865FB508DA7@solo.franken.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 02:30:07PM +0200, Thomas Bogendoerfer wrote:
> If CONFIG_HAVE_CLOCK is not set, return values of clk_get(),
> devm_clk_get(), devm_get_clk_from_child(), clk_get_parent()
> and clk_get_sys() are wrong. According to spec these functions
> should either return a pointer to a struct clk or a valid IS_ERR
> condition. NULL is neither, so returning ERR_PTR(-ENODEV) makes
> more sense.

That's wrong.  When the clk API is disabled, the expected behaviour is
that drivers will not fail.  Returning ERR_PTR(-ENODEV) will cause them
to fail, so will break platforms.

NAK.

> Without this change serial console on SNI RM400 machines (MIPS arch)
> is broken, because sccnxp driver doesn't get a valid clock rate.

So the driver needs to depend on HAVE_CLOCK.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
