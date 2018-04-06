Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gaku Inami <gaku.inami.xw@bp.renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180320083323.23289-1-nikita.yoush@cogentembedded.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
References: <20180320083323.23289-1-nikita.yoush@cogentembedded.com>
Message-ID: <152303898290.143116.8216108906293639953@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: cs2000: set pm_ops in hibernate-compatible way
Date: Fri, 06 Apr 2018 11:23:02 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nikita Yushchenko (2018-03-20 01:33:23)
> Use SET_LATE_SYSTEM_SLEEP_PM_OPS() macro instead of direct assignment to
> .resume_early field.
> =

> This fixes initialization of CS2000 in restore from hibernation in case
> of kernel used to load image did not initialize CS2000 while kernel
> being restored had CS2000 initialized.
> =

> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---

Applied to clk-next
