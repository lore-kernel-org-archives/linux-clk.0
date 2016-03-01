Return-Path: <ukl@pengutronix.de>
Date: Tue, 1 Mar 2016 20:26:51 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 26/41] clk: efm32gg: Remove CLK_IS_ROOT
Message-ID: <20160301192651.GE2613@pengutronix.de>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-27-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1456858826-28541-27-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 01, 2016 at 11:00:11AM -0800, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.

I believe you, but still it would be nice to point out at least in the
cover letter (that I didn't receive) the commit that made CLK_IS_ROOT a
no-op.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
