Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:38983 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753653AbbGBQzz (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jul 2015 12:55:55 -0400
Date: Thu, 2 Jul 2015 09:55:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH] clk: stm32: Fix out-by-one error path in the index lookup
Message-ID: <20150702165553.GC7201@codeaurora.org>
References: <1435485332-14951-1-git-send-email-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1435485332-14951-1-git-send-email-daniel.thompson@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/28, Daniel Thompson wrote:
> If stm32f4_rcc_lookup() is called with primary == 0 and secondary == 192
> then it will read beyond the end of the table array due to an out-by-one
> error in the range check.
> 
> In addition to the fixing the inequality we also modify the r.h.s. to
> make it even more explicit that we are comparing against the size of
> table in bits.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
