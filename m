Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171213115748.14106-1-p.zabel@pengutronix.de>
References: <20171213115748.14106-1-p.zabel@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Dec 2017 10:10:28 -0200
Message-ID: <CAOMZO5DNJ_9HjMPpvpDqkO2r7O8KQrMC2+GcHp9=m8WxtndJ+g@mail.gmail.com>
Subject: Re: [PATCH] clk: imx51: uart4, uart5 gates only exist on imx50, imx53
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chris Healy <Chris.Healy@zii.aero>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Philipp,

On Wed, Dec 13, 2017 at 9:57 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> i.MX51 only has 3 UARTs and no CCGR7 register. In place of the CCGR7
> register on i.MX50/i.MX53 that contains the ipg and per clock gates
> for UARTs 4 and 5, on i.MX51 there is the CMEOR register.
>
> Without this patch, the code disabling the UART clocks would also clear
> the mod_en_ov_vpu bit in the CMEOR register, among others, which causes
> register accesses to the VPU to lock up the system.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
