Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 11 Jul 2015 19:24:53 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/45] clk: efm32gg: Remove clk.h include
Message-ID: <20150711172453.GS1426@pengutronix.de>
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-5-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1436571223-10959-5-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 10, 2015 at 04:33:02PM -0700, Stephen Boyd wrote:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Remove the include here because this is a
> provider driver.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
Still compiles with your change, so fine.

Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
