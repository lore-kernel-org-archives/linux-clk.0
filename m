Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 16:14:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 2/3] clk: mvebu: adjust clock handling for the CP110
 system controller
Message-ID: <20161222001456.GX8288@codeaurora.org>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1482316017-22154-3-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482316017-22154-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/21, Thomas Petazzoni wrote:
> This commit:
> 
>  - makes the GOP_DP (bit 9) gatable clock a child clock of the
>    SD_MMC_GOP (bit 18) clock, as it should have been. The clock for bit
>    18 was just named SD_MMC, but since it also covers the GOP block, it
>    is renamed SD_MMC_GOP.
> 
>  - makes the MG (bit 5) gatable clock a child clock of the MG_CORE
>    clock (bit 6)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
