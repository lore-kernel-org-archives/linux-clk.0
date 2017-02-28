Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1488318090.21996.2.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: fix SET_PARM macro
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Kevin Hilman
	 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
	linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Date: Tue, 28 Feb 2017 22:41:30 +0100
In-Reply-To: <20170228212654.GM25384@codeaurora.org>
References: <20170228093016.5624-1-jbrunet@baylibre.com>
	 <20170228212654.GM25384@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-02-28 at 13:26 -0800, Stephen Boyd wrote:
> On 02/28, Jerome Brunet wrote:
> > parameter val is not enclosed in parenthesis which is buggy when
> > given an
> > expression instead of a simple value
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Fixes tag? Is there a place in the code that is using a complex
> expression for val right now?
> 

Not if with what's already in, afaik. However "clk: meson: mpll: add rw
operation" I sent earlier today uses a ternary operator for val.
That's  how I found this issue. Instead of running the test, it would
always use the "else" clause.

I realize I should sent these patches in the same series.
Would you prefer me to do so ?

Jerome
