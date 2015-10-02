Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59575 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225AbbJBA0x (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 1 Oct 2015 20:26:53 -0400
Date: Thu, 1 Oct 2015 17:26:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 4/5] clk: fractional-divider: switch to rational best
 approximation
Message-ID: <20151002002651.GD12338@codeaurora.org>
References: <1442937252-50281-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1442937252-50281-5-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442937252-50281-5-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/22, Andy Shevchenko wrote:
> This patch converts the code to use rational best approximation algorithm which
> is much more precise.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
