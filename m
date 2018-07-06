Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180627121459.13987-2-paul@crapouillou.net>
Cc: Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
References: <20180627121459.13987-1-paul@crapouillou.net>
 <20180627121459.13987-2-paul@crapouillou.net>
Message-ID: <153090935492.143105.6442521447151039533@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: ingenic: Add missing flag for UDC clock
Date: Fri, 06 Jul 2018 13:35:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Paul Cercueil (2018-06-27 05:14:59)
> The UDC clock of the JZ4740 SoC can be gated, but the data structure
> representing it was missing the CGU_CLK_GATE flag to make it work.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
