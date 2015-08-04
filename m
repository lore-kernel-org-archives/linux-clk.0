Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:43907 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932655AbbHDKmH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 4 Aug 2015 06:42:07 -0400
Date: Tue, 4 Aug 2015 13:42:02 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/5] clk: fractional-divider: keep mwidth and nwidth
 internally
Message-ID: <20150804104202.GC7675@kuha.fi.intel.com>
References: <1437997733-135331-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1437997733-135331-3-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437997733-135331-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 27, 2015 at 02:48:50PM +0300, Andy Shevchenko wrote:
> The patch adds mwidth and nwidth fields to the struct clk_fractional_divider
> for further usage. While here, use GENMASK() instead of open coding this
> functionality.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
