Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180111080802.u7znisgy76sk3g4u@pengutronix.de>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111080802.u7znisgy76sk3g4u@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jan 2018 10:24:43 -0200
Message-ID: <CAOMZO5DEjHD66x8fz2sKOMDjiKTdfEr+MbtidZuay7E5FaLXoQ@mail.gmail.com>
Subject: Re: Warnings from drivers/clk/clk.c
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Dong Aisheng <aisheng.dong@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Uwe,

On Thu, Jan 11, 2018 at 6:08 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Without earlycon or earlyprintk imx_clk_disable_uart is a noop. Does
> this also happen when these are not given? Does this also happen when
> clk_ignore_unused is on the command line?

Yes, it happens without earlycon or earlyprintk.

The warnings also happens if I pass 'clk_ignore_unused'.
