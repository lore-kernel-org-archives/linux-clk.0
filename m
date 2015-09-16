Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1442411581.2216.0.camel@redhat.com>
Subject: Re: [PATCH] c6x: Use generic clkdev.h header
From: Mark Salter <msalter@redhat.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Aurelien Jacquiot <a-jacquiot@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-c6x-dev@linux-c6x.org
Date: Wed, 16 Sep 2015 09:53:01 -0400
In-Reply-To: <1442358562-3348-1-git-send-email-sboyd@codeaurora.org>
References: <1442358562-3348-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2015-09-15 at 16:09 -0700, Stephen Boyd wrote:
> The c6x clkdev.h header is the same as the asm-generic header, so
> just use the asm-generic one.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Pulled into c6x tree for next merge window. Thanks!


