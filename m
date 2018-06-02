Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180520163117.14125-4-paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
References: <20180520163117.14125-1-paul@crapouillou.net>
 <20180520163117.14125-4-paul@crapouillou.net>
Message-ID: <152792063068.225090.10800582299950564415@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 4/6] clk: ingenic: jz4770: Modify C1CLK clock to disable CPU
 clock stop on idle
Date: Fri, 01 Jun 2018 23:23:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-05-20 09:31:15)
> When the main processor goes idle, by default its clock is stopped.
> However, this also stops the clock of the co-processor.
> =

> Here, if the C1CLK clock is enabled, we disable this functionality.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
