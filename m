Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:59559 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbbJBA0u (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 1 Oct 2015 20:26:50 -0400
Date: Thu, 1 Oct 2015 17:26:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 5/5] serial: 8250_dw: allow lower reference frequencies
Message-ID: <20151002002648.GC12338@codeaurora.org>
References: <1442937252-50281-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1442937252-50281-6-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442937252-50281-6-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/22, Andy Shevchenko wrote:
> We have couple of standard but rare used baudrates which are not supported by
> 1,8432MHz reference frequency. Besides that user can potentially ask for any
> baudrate (via BOTHER flag) and we currently don't fully support that. Since
> clk-fractional-divider is moved to use rational best approximation for
> reference frequency we may amend the driver to support whatever user wants.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
