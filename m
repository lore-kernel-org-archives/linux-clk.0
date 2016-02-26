Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 16:07:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: kernel@martin.sperl.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm2835: added missing clock register definitions
Message-ID: <20160226000748.GP28849@codeaurora.org>
References: <1450815189-3342-1-git-send-email-kernel@martin.sperl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450815189-3342-1-git-send-email-kernel@martin.sperl.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, kernel@martin.sperl.org wrote:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> Added missing CTRL and DIV clock register definitions for:
> PCM, SLIM, TCNT, TEC, TD0, TD1
> 
> Register information taken from:
> https://rawgit.com/msperl/rpi-registers/master/rpi-registers.html#CM
> which extracted the information from the header files shared by
> Broadcom/rpi foundation in this file:
> http://www.broadcom.com/docs/support/videocore/Brcm_Android_ICS_Graphics_Stack.tar.gz
> 
> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
