Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180409135921.5617-1-jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20180409135921.5617-1-jbrunet@baylibre.com>
Message-ID: <152389589448.51482.15489333464741262913@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 0/2] clk: honor CLK_MUX_ROUND_CLOSEST in mux
Date: Mon, 16 Apr 2018 09:24:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-04-09 06:59:19)
> CLK_MUX_ROUND_CLOSEST is part of clk_mux and meson's clk_regmap
> documentation, so it should be honored by the determine_rate() callback.
> =

> It is note the case ATM. The series fixes this problem.

I'll apply these for clk-fixes.
