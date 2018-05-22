Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1526959560-6014-2-git-send-email-Anson.Huang@nxp.com>
References: <1526959560-6014-1-git-send-email-Anson.Huang@nxp.com> <1526959560-6014-2-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 May 2018 08:26:14 -0300
Message-ID: <CAOMZO5AenOJ7vvxwsEp7FkTKEgjjZqvnHZRsU2MC=oZhk4J01Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6ul: add GPIO clocks
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>, NXP Linux Team <Linux-imx@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 22, 2018 at 12:26 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> i.MX6UL has GPIO clock gates in CCM CCGR, add
> clock property for GPIO driver to make sure all
> GPIO banks work as expected.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
