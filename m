Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 00:25:44 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Sascha Hauer <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Julien Boibessot <julien.boibessot@armadeus.com>,
	Nicolas Colombain <nicolas.colombain@armadeus.com>,
	Fabien Marteau <fabien.marteau@armadeus.com>
Subject: Re: [PATCH 1/1] clk: imx6: refine hdmi_isfr's parent to make HDMI
 work on i.MX6 SoCs w/o VPU
Message-ID: <20171102072544.GP30645@codeaurora.org>
References: <1501584007-12433-1-git-send-email-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1501584007-12433-1-git-send-email-sebastien.szymanski@armadeus.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/01, Sébastien Szymanski wrote:
> On i.MX6 SoCs without VPU (in my case MCIMX6D4AVT10AC), the hdmi driver
> fails to probe:
> 
> [    2.540030] dwhdmi-imx 120000.hdmi: Unsupported HDMI controller
> (0000:00:00)
> [    2.548199] imx-drm display-subsystem: failed to bind 120000.hdmi
> (ops dw_hdmi_imx_ops): -19
> [    2.557403] imx-drm display-subsystem: master bind failed: -19
> 
> That's because hdmi_isfr's parent, video_27m, is not correctly ungated.
> As explained in commit 5ccc248cc537 ("ARM: imx6q: clk: Add support for
> mipi_core_cfg clock as a shared clock gate"), video_27m is gated by
> CCM_CCGR3[CG8].
> 
> On i.MX6 SoCs with VPU, the hdmi is working thanks to the
> CCM_CMEOR[mod_en_ov_vpu] bit which makes the video_27m ungated whatever
> is in CCM_CCGR3[CG8]. The issue can be reproduced by setting
> CCMEOR[mod_en_ov_vpu] to 0.
> 
> Make the HDMI work in every case by setting hdmi_isfr's parent to
> mipi_core_cfg.
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
