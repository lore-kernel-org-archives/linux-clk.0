Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 May 2016 16:29:08 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: mturquette@baylibre.com, Paul Burton <paul.burton@imgtec.com>,
	Ralf Baechle <ralf@linux-mips.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: ingenic: Allow divider value to be divided
Message-ID: <20160509232908.GD3492@codeaurora.org>
References: <1462811392-3112-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1462811392-3112-1-git-send-email-harvey.hunt@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/09, Harvey Hunt wrote:
> The JZ4780's MSC clock divider registers multiply the clock divider by 2.
> This means that MMC devices run at half their expected speed. Add the
> ability to divide the clock divider in order to solve this.
> 
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> 
> Cc: Paul Burton <paul.burton@imgtec.com>
> Cc: Ralf Baechle <ralf@linux-mips.org> 
> Cc: linux-clk@vger.kernel.org 
> Cc: linux-kernel@vger.kernel.org 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
