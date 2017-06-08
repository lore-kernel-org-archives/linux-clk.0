Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1496927828.3552.43.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson-gxbb: Add const to some parent name arrays
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Neil Armstrong
	 <narmstrong@baylibre.com>
Date: Thu, 08 Jun 2017 15:17:08 +0200
In-Reply-To: <20170602224048.GY20170@codeaurora.org>
References: <20170602175831.29100-1-sboyd@codeaurora.org>
	 <20170602224048.GY20170@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2017-06-02 at 15:40 -0700, Stephen Boyd wrote:
> On 06/02, Stephen Boyd wrote:
> > These can be marked as const * const.
> > 
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > ---
> 
> Applied to clk-next
> 

Thx Stephen. Neil And I were discussing this particular warning but you've been
quicker than us to send the fix ;)

Cheers
Jerome
