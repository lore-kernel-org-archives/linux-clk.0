Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520542640-9185-2-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-clk@vger.kernel.org, joel@jms.id.au, mturquette@baylibre.com,
 eajames@linux.vnet.ibm.com, mine260309@gmail.com, ryan_chen@aspeedtech.com
References: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1520542640-9185-2-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <152113766641.111154.15925874974920514772@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/2] clk: aspeed: Fix is_enabled for certain clocks
Date: Thu, 15 Mar 2018 11:14:26 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Eddie James (2018-03-08 12:57:19)
> Some of the Aspeed clocks are disabled by setting the relevant bit in
> the "clock stop control" register to one, while others are disabled by
> setting their bit to zero. The driver already uses a flag per gate  to
> identify this behavior, but doesn't apply it in the clock is_enabled
> function.
> =

> Use the existing gate flag to correctly return whether or not a clock
> is enabled in the aspeed_clk_is_enabled function.
> =

> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---

Applied to clk-fixes
