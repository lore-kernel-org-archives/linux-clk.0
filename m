Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59602 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751419AbbJBA1A (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 1 Oct 2015 20:27:00 -0400
Date: Thu, 1 Oct 2015 17:26:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 2/5] clk: fractional-divider: keep mwidth and nwidth
 internally
Message-ID: <20151002002658.GF12338@codeaurora.org>
References: <1442937252-50281-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1442937252-50281-3-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442937252-50281-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/22, Andy Shevchenko wrote:
> The patch adds mwidth and nwidth fields to the struct clk_fractional_divider
> for further usage. While here, use GENMASK() instead of open coding this
> functionality.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
