Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39370 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751705AbbGPSHn (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jul 2015 14:07:43 -0400
Date: Thu, 16 Jul 2015 11:07:41 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Axel Lin <axel.lin@ingics.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND] clk: s2mps11: Simplify s2mps11_clk_probe unwind
 paths
Message-ID: <20150716180741.GB2918@codeaurora.org>
References: <1437055183.7087.1.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437055183.7087.1.camel@ingics.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/16, Axel Lin wrote:
> The devm_clk_unregister() in .probe error case is not necessary as it will
> be automatically called when probe fails.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
