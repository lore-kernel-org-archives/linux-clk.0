Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:47996 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750968AbdENVnX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 May 2017 17:43:23 -0400
Date: Sun, 14 May 2017 22:43:14 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-clk@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] clk: Fix comment to clk_get_parent
Message-ID: <20170514214314.GR22219@n2100.armlinux.org.uk>
References: <20170514202825.20389-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170514202825.20389-1-alexander.sverdlin@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, May 14, 2017 at 10:28:25PM +0200, Alexander Sverdlin wrote:
> There is no single implementation of clk_get_parent, which returns ERR_PTR().
> Therefore, fix the comment in common header linux/clk.h, which claims otherwise.

clk.h is the API definition, not the documentation of the implementation(s).
Please leave it as-is.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
