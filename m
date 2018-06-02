Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180520163117.14125-6-paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
References: <20180520163117.14125-1-paul@crapouillou.net>
 <20180520163117.14125-6-paul@crapouillou.net>
Message-ID: <152792063369.225090.12451260873752761253@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 6/6] clk: ingenic: jz4770: Add 150us delay after enabling VPU
 clock
Date: Fri, 01 Jun 2018 23:23:53 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-05-20 09:31:17)
> This is required, as we must not use the AHB1 bus before it is stable.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
