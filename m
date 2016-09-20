Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 16:58:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 2/2] clk: imx6: initialize GPU clocks
Message-ID: <20160920235842.GG8319@codeaurora.org>
References: <1474017371-28966-1-git-send-email-l.stach@pengutronix.de>
 <1474017371-28966-2-git-send-email-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474017371-28966-2-git-send-email-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Lucas Stach wrote:
> Initialize the GPU clock muxes to sane inputs. Until now they have
> not been changed from their default values, which means that both
> GPU3D shader and GPU2D core were fed by clock inputs whose rates
> exceed the maximium allowed frequency of the cores by as much as
> 200MHz.
> 
> This fixes a severe GPU stability issue on i.MX6DL.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
