Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47600 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753792AbdL1SuJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Dec 2017 13:50:09 -0500
Date: Thu, 28 Dec 2017 10:50:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Sergej Sawazki <sergej@taudac.com>, kbuild-all@01.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH clk] clk: si5351: _si5351_clkout_reset_pll() can be
 static
Message-ID: <20171228185007.GR7997@codeaurora.org>
References: <201712271259.pq3B6Kw4%fengguang.wu@intel.com>
 <20171227042513.GA56372@ivb42>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171227042513.GA56372@ivb42>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/27, kbuild test robot wrote:
> 
> Fixes: b26ff127c52c ("clk: si5351: Apply PLL soft reset before enabling the outputs")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
