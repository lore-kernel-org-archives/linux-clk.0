Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45439 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753657AbbGWV7i (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jul 2015 17:59:38 -0400
Date: Thu, 23 Jul 2015 14:59:37 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com, Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] serial: 8250_dw: allow lower reference frequencies
Message-ID: <20150723215937.GA6162@kroah.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1436886723-111895-7-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436886723-111895-7-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 14, 2015 at 06:12:03PM +0300, Andy Shevchenko wrote:
> We have couple of standard but rare used baudrates which are not supported by
> 1,8432MHz reference frequency. Besides that user can potentially ask for any
> baudrate (via BOTHER flag) and we currently don't fully support that. Since
> clk-fractional-divider is moved to use rational best approximation for
> reference frequency we may amend the driver to support whatever user wants.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 4 ----
>  1 file changed, 4 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
