Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170113173943.23677-1-l.stach@pengutronix.de>
References: <20170113173943.23677-1-l.stach@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Jan 2017 21:16:32 -0200
Message-ID: <CAOMZO5C3917JYzknLqmTBTR7Vs1EM3Dv=wQb2Xe6QnjWpvDn+Q@mail.gmail.com>
Subject: Re: [PATCH] clk: imx6: don't restrict LDB mux changes on QuadPlus
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	patchwork-lst@pengutronix.de, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 13, 2017 at 3:39 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> The LDB mux/gate layout has been fixed on QuadPlus, so there is no need
> to restrict the LDB mux changes on this hardware, as the erratum
> preventing this from working properly is gone.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

That's correct: mx6qp does not suffer from the LDB clock glitch issue:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
