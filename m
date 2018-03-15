Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520542640-9185-3-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-clk@vger.kernel.org, joel@jms.id.au, mturquette@baylibre.com,
 eajames@linux.vnet.ibm.com, mine260309@gmail.com, ryan_chen@aspeedtech.com
References: <1520542640-9185-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1520542640-9185-3-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <152113767831.111154.2144307841968232404@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/2] clk: aspeed: Prevent reset if clock is enabled
Date: Thu, 15 Mar 2018 11:14:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Eddie James (2018-03-08 12:57:20)
> According to the Aspeed specification, the reset and enable sequence
> should be done when the clock is stopped. The specification doesn't
> define behavior if the reset is done while the clock is enabled.
> =

> From testing on the AST2500, the LPC Controller has problems if the
> clock is reset while enabled.
> =

> Therefore, check whether the clock is enabled or not before performing
> the reset and enable sequence in the Aspeed clock driver.
> =

> Root-caused-by: Lei Yu <mine260309@gmail.com>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---

Applied to clk-fixes
