Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180520163117.14125-2-paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
References: <20180520163117.14125-1-paul@crapouillou.net>
 <20180520163117.14125-2-paul@crapouillou.net>
Message-ID: <152792062103.225090.8616356640432786461@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/6] clk: ingenic: Support specifying "wait for clock stable"
 delay
Date: Fri, 01 Jun 2018 23:23:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-05-20 09:31:13)
> Some clocks need a small delay after being ungated to run stable, as
> using them too soon might result in hardware lockups.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
