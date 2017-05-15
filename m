Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20170515102307.28743-1-tklauser@distanz.ch>
References: <20170515102307.28743-1-tklauser@distanz.ch>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 15 May 2017 18:25:06 +0800
Message-ID: <CAGb2v67C9xFYjs_cAuHHhSayjT5KNUCXM5a_3-Wj2BrzmEbmBw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: explicitly include linux/spinlock.h
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 15, 2017 at 6:23 PM, Tobias Klauser <tklauser@distanz.ch> wrote:
> ccu_reset.h and ccu_reset.c use spinlock_t and associated functions but
> rely on implict inclusion of linux/spinlock.h which means that changes
> in other headers could break the build. Thus, add an explicit include.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Acked-by: Chen-Yu Tsai <wens@csie.org>
