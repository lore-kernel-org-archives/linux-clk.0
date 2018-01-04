Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
References: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Jan 2018 11:00:58 -0200
Message-ID: <CAOMZO5DLXhScM71qHaeMoB5dW_0MeexjHaERxYoam0LBhiTD5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the snvs clock
To: Anson Huang <Anson.Huang@nxp.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-imx@nxp.com,
	Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 4, 2018 at 1:06 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> According to the i.MX7D Reference Manual,
> SNVS block has a clock gate, accessing SNVS block
> would need this clock gate to be enabled, add it
> into clock tree so that SNVS module driver can
> operate this clock gate.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
