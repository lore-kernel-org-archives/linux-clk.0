Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 16:05:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Purna Chandra Mandal <purna.mandal@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
	Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: microchip: Initialize SOSC clock rate for
 PIC32MZDA.
Message-ID: <20160824230528.GH19826@codeaurora.org>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
 <1463461560-9629-2-git-send-email-purna.mandal@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1463461560-9629-2-git-send-email-purna.mandal@microchip.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/17, Purna Chandra Mandal wrote:
> Optional SOSC is an external fixed clock running at 32768HZ.
> So Initialize SOSC rate as per PIC32MZDA datasheet.
> 
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
