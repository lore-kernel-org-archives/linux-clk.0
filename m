Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 22 Sep 2015 17:31:14 -0700
From: Shawn Guo <shawnguo@kernel.org>
To: Sanchayan Maity <maitysanchayan@gmail.com>
Cc: srinivas.kandagatla@linaro.org, gregkh@linuxfoundation.org,
	maxime.ripard@free-electrons.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stefan@agner.ch,
	kernel@pengutronix.de
Subject: Re: [PATCH v10 1/4] clk: clk-vf610: Add clock for Vybrid OCOTP
 controller
Message-ID: <20150923003114.GB3529@tiger>
References: <cover.1441609625.git.maitysanchayan@gmail.com>
 <ca85ab571ba312ea75a4d33543e5dbb8745e7190.1441609625.git.maitysanchayan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <ca85ab571ba312ea75a4d33543e5dbb8745e7190.1441609625.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 07, 2015 at 01:51:35PM +0530, Sanchayan Maity wrote:
> Add clock support for Vybrid On-Chip One Time Programmable
> (OCOTP) controller.
> 
> While the OCOTP block does not require explicit clock gating,
> for programming the OCOTP timing register the clock rate of
> ipg clock is required for timing calculations related to fuse
> and shadow register read sequence. We explicitly specify the
> ipg clock for OCOTP as a result.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>

Applied this one, thanks.
