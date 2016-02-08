Return-Path: <sboyd@codeaurora.org>
Date: Mon, 8 Feb 2016 14:15:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: meson: Fix meson_clk_register_clks() signature type
 mismatch
Message-ID: <20160208221508.GT4848@codeaurora.org>
References: <1454879583-27036-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1454879583-27036-1-git-send-email-afaerber@suse.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/07, Andreas Färber wrote:
> As preparation for arm64 based mesongxbb, which pulls in this code once
> enabling ARCH_MESON, fix a size_t vs. unsigned int type mismatch.
> The loop uses a local unsigned int variable, so adopt that type,
> matching the header.
> 
> Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---

Applied to clk-next. It would have been nice to have the
compilation error though

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
