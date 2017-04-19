Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:09:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexey Firago <alexey_firago@mentor.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, marek.vasut@gmail.com,
	geert@linux-m68k.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] clk: vc5: Add structure to describe particular
 chip features
Message-ID: <20170419160938.GV7065@codeaurora.org>
References: <1491556344-9465-1-git-send-email-alexey_firago@mentor.com>
 <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491556344-9465-2-git-send-email-alexey_firago@mentor.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/07, Alexey Firago wrote:
> Introduce vc5_chip_info structure to describe features of a particular
> VC5 chip (id, number of FODs, number of outputs, flags).
> For now flags are only used to indicate if chip has internal XTAL.
> vc5_chip_info is set on probe from the matched of_device_id->data.
> 
> Also add defines to specify maximum number of FODs and clock outputs
> supported by the driver.
> 
> With these changes it should be easier to extend driver to support
> more VC5 models.
> 
> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
