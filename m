Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41033 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933239AbbGUXN4 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jul 2015 19:13:56 -0400
Date: Tue, 21 Jul 2015 16:13:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: pxa: fix core frequency reporting unit
Message-ID: <20150721231353.GC3738@codeaurora.org>
References: <1436734193-6915-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436734193-6915-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/12, Robert Jarzmik wrote:
> Legacy drivers which are not yet ported, such as cpufreq-pxa[23]xx, rely
> on pxaXXx_get_clk_frequency_khz() to find the CPU core frequency.
> 
> This reporting was broken because the expected unit is kHz and not
> Hz. Fix the reporting for pxa25x, pxa27x and pxa3xx.
> 
> Fixes: fe7710fae477 ("clk: add pxa25x clock drivers")
> Fixes: d40670dc6169 ("clk: add pxa27x clock drivers")
> Fixes: 9bbb8a338fb2 ("clk: pxa: add pxa3xx clock driver")
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
