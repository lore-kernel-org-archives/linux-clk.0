Return-Path: <jcrouse@codeaurora.org>
Date: Wed, 8 Aug 2018 08:51:23 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Amit Nischal <anischal@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Message-ID: <20180808145123.GA18086@jcrouse-lnx.qualcomm.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
 <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
 <1e6d9fc284c3c118203728867f504ec6@codeaurora.org>
 <153250192252.48062.9210075387954345932@swboyd.mtv.corp.google.com>
 <07e0321116993d27d6585bd1a186328d@codeaurora.org>
 <153324986956.10763.5124619734269160725@swboyd.mtv.corp.google.com>
 <ee2113c9dd6a44e9669e60f760c76409@codeaurora.org>
 <20180806150437.GE21283@jcrouse-lnx.qualcomm.com>
 <153370789988.220756.1656616273823792690@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <153370789988.220756.1656616273823792690@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 07, 2018 at 10:58:19PM -0700, Stephen Boyd wrote:
> Quoting Jordan Crouse (2018-08-06 08:04:37)
> > On Mon, Aug 06, 2018 at 02:37:18PM +0530, Amit Nischal wrote:
> > > On 2018-08-03 04:14, Stephen Boyd wrote:
> > > >Quoting Amit Nischal (2018-07-30 04:28:56)
> > > >>On 2018-07-25 12:28, Stephen Boyd wrote:
> > > >>>
> > > >>> Ok. Sounds good! Is the rate range call really needed? It can't be
> > > >>> determined in the PLL code with some table or avoided by making sure
> > > >>> GPU
> > > >>> uses OPP table with only approved frequencies?
> > > >>>
> > > >>
> > > >>Currently fabia PLL code does not have any table to check this and
> > > >>intention
> > > >>was to avoid relying on the client to call set_rate with only approved
> > > >>frequencies so we have added the set_rate_range() call in the GPUCC
> > > >>driver
> > > >>in order to set the rate range.
> > > >>
> > > >
> > > >But GPU will use OPP so it doesn't seem like it really buys us anything
> > > >here. And it really doesn't matter when the clk driver implementation
> > > >doesn't use the min/max to clamp the values of the round_rate()
> > > >call. Is
> > > >that being done here? I need to double check. I would be more convinced
> > > >if the implementation was looking at min/max to constrain the rate
> > > >requested.
> > > >
> > > 
> > > So our understanding is that GPU(client) driver will always call the
> > > set_rate with approved frequencies only and we can completely rely
> > > on the
> > > client. Is our understanding is correct?
> > 
> > 
> > First: on sdm845 the software doesn't set the GPU clocks - we rely on the GMU
> > firmware to do that on our behalf but for the GPU at least this is an academic
> > exercise.
> 
> So what is this GPU clk driver for then?

That is a good question. There is a hodgepodge of clocks for the GMU, GPU and
SMMU and I'm not sure which ones are provided by the various clk drivers. This
isn't my area of expertise.

The GMU uses:

GPU_CC_CX_GMU_CLK
GPU_CC_CXO_CLK
GCC_DDRSS_GPU_AXI_CLK
GCC_GPU_MEMNOC_GFX_CLK

These are controlled by the GMU device.

The SMMU uses:

GCC_GPU_CFG_AHB_CLK
GCC_DDRSS_GPU_AXI_CLK
GCC_GPU_MEMNOC_GFX_CLK

These should be controlled by the SMMU device.

Downstream defines these drivers for the GPU but we don't get/prepare/use
them for the GPU device - I think they are there in case the GMU isn't
working or is disabled for some other reason.

GPU_CC_GX_GFX3D_CLK
GPU_CC_CXO_CLK
GCC_DDRSS_GPU_AXI_CLK
GCC_GPU_MEMNOC_GFX_CLK
GPU_CC_CX_GMU_CLK

> > 
> > But that said: traditionally we've expected that the clock driver correctly
> > clamp the requested rate to the correct values. In the past we have taken
> > advantage of this and we may in the future. I don't think it is reasonable
> > to require the leaf driver to only pass "approved" frequencies especially
> > since we depend on our own OPP table that may or may not be similar to the
> > one used by the clock driver.
> > 
> 
> Ok. Sounds like things can't be kept in sync between the clk driver and
> the OPP tables. Why is that hard to do?

Again, not my area of expertise. Traditionally the leaf driver is responsible
for setting its own OPP table. I'm not sure if the clock driver can or should
be in the role of switching up the table. We've always assumed that the clk
driver will sanity check whatever we ask it for.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
