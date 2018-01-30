Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1517339526.3153.10.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg: fix the od shift of the sys_pll
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman
	 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 30 Jan 2018 20:12:06 +0100
In-Reply-To: <20180119020926.246887-1-yixun.lan@amlogic.com>
References: <20180119020926.246887-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-01-19 at 10:09 +0800, Yixun Lan wrote:
> According to datasheet, the od shift of sys_pll is 16,
> fix the typo which introduced at previous commit.
> 
> Fixes: 78b4af312f91 ('clk: meson-axg: add clock controller drivers')
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to clk-meson next/drivers after fixing the commit message a bit
Thx

Jerome
