Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Mar 2017 11:03:50 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>, linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: fix SET_PARM macro
Message-ID: <20170301190350.GP25384@codeaurora.org>
References: <20170228093016.5624-1-jbrunet@baylibre.com>
 <20170228212654.GM25384@codeaurora.org>
 <1488318090.21996.2.camel@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1488318090.21996.2.camel@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/28, Jerome Brunet wrote:
> On Tue, 2017-02-28 at 13:26 -0800, Stephen Boyd wrote:
> > On 02/28, Jerome Brunet wrote:
> > > parameter val is not enclosed in parenthesis which is buggy when
> > > given an
> > > expression instead of a simple value
> > > 
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > 
> > Fixes tag? Is there a place in the code that is using a complex
> > expression for val right now?
> > 
> 
> Not if with what's already in, afaik. However "clk: meson: mpll: add rw
> operation" I sent earlier today uses a ternary operator for val.
> That's  how I found this issue. Instead of running the test, it would
> always use the "else" clause.
> 
> I realize I should sent these patches in the same series.
> Would you prefer me to do so ?

Sure, but wait a little while for any review comments on the
series first please. For now I'll drop this from my queue because
it isn't an urgent fix and wait for it to come back as part of
the larger series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
