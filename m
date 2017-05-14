Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Randy Li <ayaka@soulik.info>
Cc: linux-rockchip@lists.infradead.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: rk3288: prefer vdpu for vcodec clock source
Date: Sun, 14 May 2017 17:06:19 +0200
Message-ID: <2067155.b6jtcnMS5V@phil>
In-Reply-To: <20170514065009.3047-1-ayaka@soulik.info>
References: <20170514065009.3047-1-ayaka@soulik.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Randy,

Am Sonntag, 14. Mai 2017, 14:50:09 CEST schrieb Randy Li:
> The RK3288 CRU system clock solution would suggest use
> the vdpu clock source for the VPU(aclk_vpu and hclk_vpu).
> 
> Reading the registers of VPU(both VEPU and VDPU) would become all high
> when the vepu is used as the clock source. It may be a bug in the SoC,
> not sure whether it is fixed at RK3288W.

I don't think that is a case of "preference". GRF_SOC_CON0[7] indicates
that value 0 means vepu gets selected as vcodec clock and value 1 means
vdpu gets selected as vcodec.

The array values below are supposed to match these values, so array
index 0 represents the clock for value 0 and so on. So this is really only
a description of the hardware clock layout.

If you want to actually switch the mux value, please assign the vcodec
clock an id and use the assigned-clocks mechanism in the devicetree.


Heiko
