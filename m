Return-Path: <ralf@linux-mips.org>
Date: Tue, 14 Jul 2015 14:21:54 +0200
From: Ralf Baechle <ralf@linux-mips.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Linux-MIPS <linux-mips@linux-mips.org>
Subject: Re: [PATCH] MIPS: Alchemy: Include clk.h
Message-ID: <20150714122154.GA30195@linux-mips.org>
References: <1436819450-16440-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436819450-16440-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 13, 2015 at 01:30:50PM -0700, Stephen Boyd wrote:

> This clock provider uses the consumer API, so include clk.h
> explicitly.
> 
> Cc: Manuel Lauss <manuel.lauss@gmail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Linux-MIPS <linux-mips@linux-mips.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> Please ack so this can go through the clk tree. We're removing
> the include of clk.h in clk-provider.h so that the consumer
> and provider APIs are clearly split.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
