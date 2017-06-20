Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 17:26:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/4] clk: boston: Add a driver for MIPS Boston board
 clocks
Message-ID: <20170620002651.GY20170@codeaurora.org>
References: <20170617205249.1391-1-paul.burton@imgtec.com>
 <20170617205249.1391-3-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170617205249.1391-3-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/17, Paul Burton wrote:
> Add a driver for the clocks provided by the MIPS Boston board from
> Imagination Technologies. 2 clocks are provided - the system clock & the
> CPU clock - and each is a simple fixed rate clock whose frequency can be
> determined by reading a register provided by the board.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> 
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Unless you wanted this to go through the clk tree?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
