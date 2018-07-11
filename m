Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1531270739-3075-1-git-send-email-Anson.Huang@nxp.com>
References: <1531270739-3075-1-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Jul 2018 23:17:52 -0300
Message-ID: <CAOMZO5BZsmY=_+H7vMomoY+pUx0fY2kh80rgx6UVMUYWct9ojQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] clk: imx: add ocram_s clock for i.mx6sx
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"S.j. Wang" <shengjiu.wang@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 10, 2018 at 9:58 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> i.MX6SX has a 16KB always-on ocram bank called
> ocram_s, and its clock gate in CCM CCGR1 CG14
> needs to be enabled before access, add it to
> clock tree.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
