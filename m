Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180409141303.14537-1-jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180409141303.14537-1-jbrunet@baylibre.com>
Message-ID: <152642258273.237094.2062983082213897659@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: bulk: silently error out on EPROBE_DEFER
Date: Tue, 15 May 2018 15:16:22 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-04-09 07:13:03)
> In clk_bulk_get(), if we fail to get the clock due to probe deferal, we
> shouldn't print an error message. Just be silent in this case.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next
