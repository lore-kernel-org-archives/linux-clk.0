Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59582 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345AbbJBA04 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 1 Oct 2015 20:26:56 -0400
Date: Thu, 1 Oct 2015 17:26:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 3/5] clk: rockchip: save width in struct
 clk_fractional_divider
Message-ID: <20151002002654.GE12338@codeaurora.org>
References: <1442937252-50281-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1442937252-50281-4-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442937252-50281-4-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/22, Andy Shevchenko wrote:
> The ->mwidth and ->nwidth fields will be used by clk-fractional-divider when it
> will be switched to rational base approximation algorithm.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
