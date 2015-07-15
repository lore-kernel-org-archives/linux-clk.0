Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 14 Jul 2015 19:36:02 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 2/7] staging: clocking-wizard: Include clk.h
Message-ID: <20150715023602.GA29217@kroah.com>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
 <1436569409-27964-3-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1436569409-27964-3-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 10, 2015 at 04:03:24PM -0700, Stephen Boyd wrote:
> This clock provider uses the consumer API, so include clk.h
> explicitly.
> 
> Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> Please ack so this can go through the clk-tree.
> 
>  drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

