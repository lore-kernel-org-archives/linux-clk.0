Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1520931243-29091-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 Mike Looijmans <mike.looijmans@topic.nl>
References: <1520931243-29091-1-git-send-email-mike.looijmans@topic.nl>
Message-ID: <152149281366.242365.13850922141460907992@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: clk-gpio: Allow GPIO to sleep in set/get_parent
Date: Mon, 19 Mar 2018 13:53:33 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Mike Looijmans (2018-03-13 01:54:03)
> When changing or retrieving clock parents, the caller is in a sleepable
> state (like prepare) so the GPIO operation need not be atomic. Replace
> gpiod_{g|s}et_value with gpiod_{g|s}et_value_cansleep in the {g|s}et_pare=
nt
> calls for the GPIO based clock mux.
> =

> This fixes a "slowpath" warning when the GPIO controller is an I2C expand=
er
> or something similar.
> =

> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---

Applied to clk-next
