Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180520163117.14125-1-paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
References: <20180520163117.14125-1-paul@crapouillou.net>
Message-ID: <152792061833.225090.599214934282467838@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/6] clk: ingenic: Add support for clocks whose gate bit is
 inverted
Date: Fri, 01 Jun 2018 23:23:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-05-20 09:31:12)
> Support the clocks which are gated when their gate bit is cleared
> instead of set.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
