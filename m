Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55106 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753851AbdK2REz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Nov 2017 12:04:55 -0500
Date: Wed, 29 Nov 2017 09:04:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
        kbuild test robot <fengguang.wu@intel.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: fix compile testing of scpi clk driver
Message-ID: <20171129170453.GA7698@codeaurora.org>
References: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <24058ecb-9f12-f7e1-503d-bd98eb894c6c@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/28, Heiner Kallweit wrote:
> We now have a hard dependency on ARM_SCPI_PROTOCOL and may end up with
> the following error:
> ERROR: "get_scpi_ops" [drivers/clk/clk-scpi.ko] undefined!
> Fix this by removing COMPILE_TEST from COMMON_CLK_SCPI dependencies.
> 
> Fixes: f7fee8be06a6 "firmware: arm_scpi: remove default for get_scpi_ops if not reachable"

I don't see this commit anywhere. Is this a future issue?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
