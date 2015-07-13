Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 13 Jul 2015 11:11:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Will Deacon <will.deacon@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] arm64: Remove clk-provider.h include
Message-ID: <20150713101158.GA18748@e104818-lin.cambridge.arm.com>
References: <1436568657-26243-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436568657-26243-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 10, 2015 at 03:50:57PM -0700, Stephen Boyd wrote:
> This file doesn't use the clk provider APIs. Remove the include.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> Please ack if you want this to go through the clk-tree (along
> with quite a few other patches that do the same thing). Otherwise,
> it's fine if it's applied to the arm64 tree.

Fine by me to go through the clock tree.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
