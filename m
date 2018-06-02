Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180520163117.14125-5-paul@crapouillou.net>
Cc: James Hogan <jhogan@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
References: <20180520163117.14125-1-paul@crapouillou.net>
 <20180520163117.14125-5-paul@crapouillou.net>
Message-ID: <152792062764.225090.1565617809138811070@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 5/6] clk: ingenic: jz4770: Enable power of AHB1 bus after
 ungating VPU clock
Date: Fri, 01 Jun 2018 23:23:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-05-20 09:31:16)
> This was broken before, because the AHB1 bus was enabled before the VPU
> clock was ungated, while it must be done afterwards.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
