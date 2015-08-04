Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 4 Aug 2015 13:41:27 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/5] clk: fractional-divider: rename prate ->
 parent_rate
Message-ID: <20150804104127.GB7675@kuha.fi.intel.com>
References: <1437997733-135331-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1437997733-135331-2-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1437997733-135331-2-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 27, 2015 at 02:48:49PM +0300, Andy Shevchenko wrote:
> Rename function parameter to be more explicit what it is for. This also makes
> it in align with struct clk_ops.
> 
> There is no functional change.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
