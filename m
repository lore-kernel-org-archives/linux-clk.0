Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 16:58:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 1/2] clk: imx6: fix i.MX6DL clock tree to reflect reality
Message-ID: <20160920235840.GF8319@codeaurora.org>
References: <1474017371-28966-1-git-send-email-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474017371-28966-1-git-send-email-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Lucas Stach wrote:
> The current clock tree only implements the minimal set of differences
> between the i.MX6Q and the i.MX6DL, but that doesn't really reflect
> reality.
> 
> Apply the following fixes to match the RM:
> - DL has no GPU3D_SHADER_SEL/PODF, the shader domain is clocked by
>   GPU3D_CORE
> - GPU3D_SHADER_SEL/PODF has been repurposed as GPU2D_CORE_SEL/PODF
> - GPU2D_CORE_SEL/PODF has been repurposed as MLB_SEL/PODF
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
