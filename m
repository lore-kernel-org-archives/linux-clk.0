Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3BB206AB2B1BD448954845CE6FF69A8E01F81FD1B9@nt-mail04>
References: <3BB206AB2B1BD448954845CE6FF69A8E01F81FD1B9@nt-mail04>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 Mar 2018 09:51:44 -0300
Message-ID: <CAOMZO5BxpRX9g=BktT15tCiSFt4CofkRKDHsutVT-8poZ5bHmA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx51: uart4, uart5 gates only exist on imx50, imx53
To: =?UTF-8?Q?Patrick_Br=C3=BCnn?= <P.Bruenn@beckhoff.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-kernel-dev <linux-kernel-dev@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Patrick,

On Thu, Mar 15, 2018 at 9:43 AM, Patrick Br=C3=BCnn <P.Bruenn@beckhoff.com>=
 wrote:
> Hi list,
>
> since v4.16-rc1 my board imx53-cx9020 shows multiple WARNINGs like this:

I fixed this problem with this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/clk/imx/clk-imx51-imx53.c?h=3Dnext-20180315&id=3Da275b315334dea3c21=
51094765387ede421aac92
