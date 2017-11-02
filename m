Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Nov 2017 00:28:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Adriana Reus <adriana.reus@nxp.com>
Cc: mturquette@baylibre.com, anson.huang@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 2/2] clk: imx: imx7d: Remove ARM_M0 clock
Message-ID: <20171102072802.GS30645@codeaurora.org>
References: <1506940331-16742-1-git-send-email-adriana.reus@nxp.com>
 <1506940331-16742-3-git-send-email-adriana.reus@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1506940331-16742-3-git-send-email-adriana.reus@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/02, Adriana Reus wrote:
> IMX7d does not have an M0 Core and this particular
> clock doesn't seem connected to anything else.
> Remove this entry from the CCM driver.
> 
> Signed-off-by: Adriana Reus <adriana.reus@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
