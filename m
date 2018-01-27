Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:42424 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751363AbeA0Adm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jan 2018 19:33:42 -0500
Date: Fri, 26 Jan 2018 16:33:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel.stanley@au1.ibm.com>
Subject: Re: [PATCH] clk: aspeed: Handle inverse polarity of USB port 1 clock
 gate
Message-ID: <20180127003339.GG28313@codeaurora.org>
References: <1515736081.31850.88.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515736081.31850.88.camel@kernel.crashing.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/12, Benjamin Herrenschmidt wrote:
> The USB port 1 clock gate control has an inversed polarity
> from all the other clock gates in the chip. This makes the
> aspeed_clk_{enable,disable} functions honor the flag
> CLK_GATE_SET_TO_DISABLE and set that flag appropriately
> so it's set for all clocks except USB port 1.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> --
> 
> I chose not to add a column to the table for that one special
> case. If future chips start growing more of these, we should
> consider adding this to the table instead.
> 
> Without this, USB port 1 doesn't work properly with the new
> clk driver.
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
