Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58142 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752917AbdLDCZ2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 3 Dec 2017 21:25:28 -0500
Date: Mon, 4 Dec 2017 02:25:18 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-clk@vger.kernel.org,
        kbuild test robot <fengguang.wu@intel.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: fix compile testing of scpi clk driver
Message-ID: <20171204022518.GD6870@e107533-lin>
References: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Nov 28, 2017 at 07:58:23AM +0100, Heiner Kallweit wrote:
> We now have a hard dependency on ARM_SCPI_PROTOCOL and may end up with
> the following error:
> ERROR: "get_scpi_ops" [drivers/clk/clk-scpi.ko] undefined!
> Fix this by removing COMPILE_TEST from COMMON_CLK_SCPI dependencies.
> 
> Fixes: f7fee8be06a6 "firmware: arm_scpi: remove default for get_scpi_ops if not reachable"

This doesn't exist for all practical purposes. I pushed a branch to test
the commit as I was sure that it will cause build regression but I could
not figure to get that config. The Kbuild bot did find the issue.

You are introducing the bug in f7fee8be06a6 and trying to fix here, both of
them are wrong.

--
Regards,
Sudeep
