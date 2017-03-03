Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170303132620.32156-1-robin@protonic.nl>
References: <20170303132620.32156-1-robin@protonic.nl>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 3 Mar 2017 10:44:39 -0300
Message-ID: <CAOMZO5Bg4cTZyZhFW5Nj5nURX3_Soc8vBE0JaUdHz6r8ho5aFA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: clk-imxul: The i.mx6ul has no aips_tx3 clock
To: Robin van der Gracht <robin@protonic.nl>
Cc: Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Mar 3, 2017 at 10:26 AM, Robin van der Gracht <robin@protonic.nl> wrote:
> The clock was mapped on CG15 (gpio2_clocks) in the CCRG0 register.
>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>

Subject should say "aips_tz3". With that fixed you can:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
