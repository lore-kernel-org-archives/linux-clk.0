Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 16:39:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Martin Kepplinger <martink@posteo.de>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: use sign_extend32() and abs()
Message-ID: <20151001233959.GZ19319@codeaurora.org>
References: <1443526347-15501-1-git-send-email-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1443526347-15501-1-git-send-email-martink@posteo.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Martin Kepplinger wrote:
> This simplifies the given function by getting rid of the manual
> sign extension as well as saving an absolute value in an extra
> variable.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
