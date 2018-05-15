Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexandre.torgue@st.com,
 mcoquelin.stm32@gmail.com, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180513111704.31842-1-christophe.jaillet@wanadoo.fr>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20180513111704.31842-1-christophe.jaillet@wanadoo.fr>
Message-ID: <152641667642.237094.1285725983406005947@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: stm32mp1: Fix a memory leak in
 'clk_stm32_register_gate_ops()'
Date: Tue, 15 May 2018 13:37:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Christophe JAILLET (2018-05-13 04:17:04)
> We allocate some memory which is neither used, nor referenced by anything.
> So axe it.
> =

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next
