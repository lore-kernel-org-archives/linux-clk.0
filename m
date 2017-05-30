Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170530065457.e2m4nyo2dztumyi6@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5BZ8pqBW2VfuaUGyzgn8kv3AdvhwQ5nFEWuUSpmvrW9rA@mail.gmail.com> <20170530065457.e2m4nyo2dztumyi6@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 May 2017 08:13:32 -0300
Message-ID: <CAOMZO5CiLVknZ_2NN-UO+6KbRQ7pEna3PFRp+9Z3w_oCPtxxQQ@mail.gmail.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>, Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 30, 2017 at 3:54 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> I still think it is related to these reports, don't you?

Your commit log gives the impression that your patch fixes Stefan's
reported problem, which can be confusing.
