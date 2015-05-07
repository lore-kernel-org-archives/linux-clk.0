Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
Date: Thu, 7 May 2015 21:00:58 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	mturquette@linaro.org, Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH v2] clk: imx: clk-cpu: Include "clk.h" header file
Message-ID: <20150507130056.GI3162@dragon>
References: <1430343282-13739-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430343282-13739-1-git-send-email-festevam@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 29, 2015 at 06:34:42PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Include the "clk.h" header file to fix the following sparse warning:
> 
> drivers/clk/imx/clk-cpu.c:77:12: warning: symbol 'imx_clk_cpu' was not declared. Should it be static?
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Applied, thanks.
