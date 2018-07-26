Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de> <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jul 2018 12:02:42 -0300
Message-ID: <CAOMZO5Cgf6aeNKWn5CnV8X-+bo20M00efoAxv51GPDE45Pg4yg@mail.gmail.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>, linux-clk <linux-clk@vger.kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Uwe,

On Thu, Jul 26, 2018 at 11:50 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> I only want to note that we are using this ugly hack for Duckbill to avoid
> this issue:
>
> https://github.com/I2SE/linux/commit/e457d5e0309c07e30e8dd8b17c32f7b3cbdd9547

Do you see the problem on TQMa28L with Stefan's hack applied?
