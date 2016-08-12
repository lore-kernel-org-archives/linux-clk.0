Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <88d5c57d3047176ebf2eec0f21e86613@agner.ch>
References: <1468590782-8436-1-git-send-email-fabio.estevam@nxp.com>
 <CAOMZO5BjdhCDNU-Vr7OT81ag0LqgFQ3+oP1D_o0FUOZVafneqQ@mail.gmail.com>
 <20160811222842.GM2996@codeaurora.org> <CAOMZO5Dns1eNwzo2qz+Zh506D+JzdgJGYOzL8URTMfrxLq1XxQ@mail.gmail.com>
 <88d5c57d3047176ebf2eec0f21e86613@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 11 Aug 2016 22:35:56 -0300
Message-ID: <CAOMZO5AYVbobwxyNippO_AviZhNjCS0hhC2NmLHiPEt8MoP-5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: imx7d: do not set the parent of IMX7D_ENET_AXI_ROOT_SRC
To: Stefan Agner <stefan@agner.ch>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

On Thu, Aug 11, 2016 at 8:57 PM, Stefan Agner <stefan@agner.ch> wrote:

> I don't think so, at least not that root clock.
>
> Otherwise grep -e IMX7D_PLL_ENET_MAIN_250M_CLK arch/arm/boot/dts/imx7*
> should return something...

Yes, you are right. The enet root clock parent assignment is missing in dts.

Other enet clocks are assigned.

> I guess in practice it is not a problem because the boot loader
> configures the clock selection already. Still, I think we should also
> fix our device trees and select the root clock there...

Yes, I didn't see any error on mx7d-sdb when I tested this patch, but
to be on the safe side I will update all the mx7 fec users to assign
enet root clk in the dts.

Thanks
