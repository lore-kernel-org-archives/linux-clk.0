Return-Path: <ukl@pengutronix.de>
Date: Wed, 9 Nov 2016 14:58:39 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Jiri Kosina <trivial@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] clk: gate: fix coding style
Message-ID: <20161109135839.xx4xghlj6svg3zaz@pengutronix.de>
References: <20161109110046.9594-1-u.kleine-koenig@pengutronix.de>
 <CAK7LNARSfBBFffOyRa03hGqfJ+7gSHe-A+Efm9oM1sOdgLL-Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CAK7LNARSfBBFffOyRa03hGqfJ+7gSHe-A+Efm9oM1sOdgLL-Ag@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Wed, Nov 09, 2016 at 08:25:22PM +0900, Masahiro Yamada wrote:
> 2016-11-09 20:00 GMT+09:00 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:
> >         init.flags = flags | CLK_IS_BASIC;
> > -       init.parent_names = (parent_name ? &parent_name: NULL);
> > +       init.parent_names = (parent_name ? &parent_name : NULL);
> >         init.num_parents = (parent_name ? 1 : 0);
> 
> Do we need the parentheses?

	init.num_parents = parent_name ? 1 : 0;

has the same semantics. I didn't remove the parentheses because they
might make it easier to understand what happens if you don't have the
operator precedence table at hand. But actually I don't care. If they
should be dropped and nobody else volunteers, I can resend with the
parentheses removed.

Best regards,
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
